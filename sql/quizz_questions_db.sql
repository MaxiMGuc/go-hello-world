-- Создание базы данных для викторины
CREATE DATABASE IF NOT EXISTS quizz_questions_db;
USE quizz_questions_db;

-- Таблица с вопросами
CREATE TABLE IF NOT EXISTS questions(
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        question_text TEXT NOT NULL
);

-- Таблица с ответами
CREATE TABLE IF NOT EXISTS answers(
                                      id INT AUTO_INCREMENT PRIMARY KEY,
                                      question_id INT NOT NULL,
                                      answer_text TEXT NOT NULL,
                                      is_correct BOOLEAN NOT NULL DEFAULT FALSE,
                                      CONSTRAINT fk_question FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

-- Добавление вопросов
INSERT INTO questions (question_text) VALUES
                                          ('1. Какое животное Африки является самым высоким в мире?'),
                                          ('2. Какое из этих животных живет преимущественно в воде и опасно для человека?'),
                                          ('3. Какой африканский хищник охотится преимущественно ночью и известен своим "смеющимся" звуком?'),
                                          ('4. Какое из этих животных является самым быстрым на суше в Африке?'),
                                          ('5. Какое животное называют "царем зверей", хотя оно обитает в саванне?');

-- Добавление ответов
INSERT INTO answers (question_id, answer_text, is_correct) VALUES
                                                               -- Вопрос 1
                                                               (1, 'Слон', FALSE),
                                                               (1, 'Жираф', TRUE),
                                                               (1, 'Бегемот', FALSE),
                                                               (1, 'Лев', FALSE),

                                                               -- Вопрос 2
                                                               (2, 'Леопард', FALSE),
                                                               (2, 'Бегемот', TRUE),
                                                               (2, 'Гиена', FALSE),
                                                               (2, 'Зебра', FALSE),

                                                               -- Вопрос 3
                                                               (3, 'Шакал', FALSE),
                                                               (3, 'Лев', FALSE),
                                                               (3, 'Гиена', TRUE),
                                                               (3, 'Гепард', FALSE),

                                                               -- Вопрос 4
                                                               (4, 'Леопард', FALSE),
                                                               (4, 'Гну', FALSE),
                                                               (4, 'Гепард', TRUE),
                                                               (4, 'Страус', FALSE),

                                                               -- Вопрос 5
                                                               (5, 'Лев', TRUE),  -- Исправлено: правильный ответ "Лев"
                                                               (5, 'Слон', FALSE),
                                                               (5, 'Буйвол', FALSE),
                                                               (5, 'Леопард', FALSE);

-- Таблица пользователей
CREATE TABLE IF NOT EXISTS users (
                                     id INT AUTO_INCREMENT PRIMARY KEY,
                                     name VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица для связи пользователей и вопросов
CREATE TABLE IF NOT EXISTS user_questions (
                                              user_id INT NOT NULL,
                                              question_id INT NOT NULL,
                                              PRIMARY KEY (user_id, question_id),
                                              FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
                                              FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);