import sqlite3
import unittest
import os
import json

DB_PATH = "./cyberchase.db"  
SQL_DIR = "./"  
EXPECTED = "./expected.json"  

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
            
            def test(self):
                result = self.execute_sql(sql_task)
                self.assertSequenceEqual(result, expected)

            test_name = f"test_sql_{os.path.splitext(sql_task)[0]}"
            setattr(cls, test_name, test)

TestCyberchaseTasks.generate_tests()

if __name__ == '__main__':
    unittest.main()
