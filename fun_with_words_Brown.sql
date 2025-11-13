-- Question One
select * from word_rel;
-- Question Two 
update word_rel set syn_col = 'blithe' where word = 'insouciant';
select * from word_rel; 
-- Question Three
CREATE OR REPLACE VIEW FAKE_WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id with read only; 
update fake_word_rel set syn_col = 'blithe' where word = 'insouciant';
-- cannot perform a DML operation on a read-only view
-- Question Four
select * from word_analysis;
-- Question Five 
select word, syn_col from (select word, syn_col from word_rel order by length(word) desc) where rownum <= 2; 
-- Question Six
drop view word_rel; 
CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id; 
-- Question Seven 
select * from word_summary; 
-- Question Eight 
create or replace view word_homonyms (word, word_term, meaning) as select s.word_term, h.word_term, h.meaning from word_synonyms s, homonyms h where a.word_id = h.hom_id; 