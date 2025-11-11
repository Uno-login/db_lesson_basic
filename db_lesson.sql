
-- q1
CREATE TABLE departments (
  department_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (department_id)
);

-- q2
ALTER TABLE people ADD department_id INT(10) UNSIGNED NULL AFTER email;

--q3
 INSERT INTO departments (name) VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');

   INSERT INTO people (name, email, department_id, age, gender)
    -> VALUES
    -> ('田中 営業一', 'tanaka-eigyo1@example.com', 1, 28, 1),
    -> ('鈴木 営業二', 'suzuki-eigyo2@example.com', 1, 32, 1),
    -> ('佐藤 営業三', 'sato-eigyo3@example.com', 1, 35, 2),
    -> ('中村 開発一', 'nakamura-kaihatsu1@example.com', 2, 27, 1),
    -> ('平野 開発二', 'hirano-kaihatsu2@example.com', 2, 29, 2),
    -> ('小林 開発三', 'kobayashi-kaihatsu3@example.com', 2, 31, 1),
    -> ('大野 開発四', 'oono-kaihatsu4@example.com', 2, 25, 2),
    -> ('松本 経理', 'matsumoto-keiri@example.com', 3, 26, 2),
    -> ('山田 人事', 'yamada-jinji@example.com', 4, 30, 2),
    -> ('伊藤 情報', 'ito-jouhou@example.com', 5, 33, 1);

INSERT INTO reports (person_id, content)
    -> VALUES
    -> (1, '営業会議に参加し今後の戦略を共有しました。'),
    -> (2, '新規顧客開拓を実施し3件のアポイントを取得。'),
    -> (3, '契約書の確認及び見積書を提出しました。'),
    -> (4, '新機能の開発設計を完了しました。'),
    -> (5, 'バグ修正後のテストを行い正常動作を確認。'),
    -> (6, 'コードレビューで指摘点の修正を完了。'),
    -> (7, 'APIサーバーのパフォーマンスチューニングを実施。'),
    -> (8, '経理システムの月次集計業務を行いました。'),
    -> (9, '採用面接を2件対応し候補者の評価を実施。'),
    -> (10, '情報共有会でセキュリティ研修を担当しました。');

--q4
SELECT * FROM people;
UPDATE people SET department_id = 1 WHERE department_id IS NULL;

--q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- q6 このSQLは「people」テーブルの中から、「department_id」が1の人に限定して、名前、メールアドレス、年齢の3つのカラム情報を抽出しています。さらに、作成日時（created_at）の順に並べ替えて表示しています。

--q7
SELECT name FROM people WHERE (gender = 2 AND age BETWEEN 20 AND 29) AND (gender = 1 AND age BETWEEN 40 AND 49);

--q8
SELECT name, age FROM people WHERE department_id = 1 ORDER BY age ASC;

--q9
SELECT AVG(age) AS 平均年齢 FROM people WHERE department_id = 2 AND gender = 2;

--q10
 SELECT p.name, d.name AS department_name, r.content FROM people p
 JOIN departments d ON p.department_id = d.department_id 
 JOIN reports r ON p.person_id = r.person_id;

--q11
 SELECT name FROM people WHERE person_id NOT IN (SELECT person_id FROM reports);