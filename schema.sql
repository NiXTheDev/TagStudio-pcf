CREATE TABLE entities (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  filename VARCHAR(32),
  path VARCHAR(260),
);
-- as a collumn above, as a table below
CREATE TABLE Fields (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  entity_id INTEGER,
  tag_id INTEGER,
  collation_id INTEGER,
  FOREIGN KEY (entity_id) REFERENCES entities(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  FOREIGN KEY (collation_id) REFERENCES collations(id)
);

CREATE TABLE tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(32),
  shorthand VARCHAR(32),
  aliases VARCHAR(32),
  color VARCHAR(32)
);

CREATE TABLE subtags (
  tag_id INTEGER,
  subtag_id INTEGER,
  PRIMARY KEY (tag_id, subtag_id),
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  FOREIGN KEY (subtag_id) REFERENCES tags(id)
);

CREATE TABLE collations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(32),
  sort_order SMALLINT,
  cover_id INTEGER
);