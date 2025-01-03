import sqlite3
import unittest
import os
import json

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, "cyberchase.db")
SQL_DIR = BASE_DIR
EXPECTED = os.path.join(BASE_DIR, "expected.json")

class TestCyberchaseTasks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.conn = sqlite3.connect(DB_PATH)
        cls.cursor = cls.conn.cursor()

    @classmethod
    def tearDownClass(cls):
        cls.conn.close()

    @staticmethod
    def load_expected(sql_file):
        with open(EXPECTED, "r") as f:
            expected = json.load(f)
        return [tuple(row) for row in expected.get(sql_file, [])]

    def execute_sql(self, sql_file):
        file_path = os.path.join(SQL_DIR, sql_file)

        with open(file_path, "r") as f:
            query = f.read().strip()
            if query:
                self.cursor.execute(query)
                return self.cursor.fetchall()

        return []

    @classmethod
    def generate_tests(cls):
        sql_tasks = [path for path in os.listdir(SQL_DIR) if path.endswith(".sql")]
        
        for sql_task in sql_tasks:
            expected = cls.load_expected(sql_task)
            
            def test_func(self, sql_task=sql_task, expected=expected):
                result = self.execute_sql(sql_task)
                self.assertSequenceEqual(result, expected)

            test_name = f"test_sql_{os.path.splitext(sql_task)[0]}"
            setattr(cls, test_name, test_func)

TestCyberchaseTasks.generate_tests()

if __name__ == '__main__':
    suite = unittest.defaultTestLoader.loadTestsFromTestCase(TestCyberchaseTasks)
    total_tests = suite.countTestCases()
    passed_tests = 0

    with open('test_output.txt', 'w') as f:
        runner = unittest.TextTestRunner(stream=f)
        result = runner.run(suite)

    passed_tests = total_tests - len(result.failures) - len(result.errors)
    print(f"{passed_tests * 100 / total_tests:.2f};{passed_tests}/{total_tests}")
