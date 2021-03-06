-- 
-- Return number of tokens in delimited text
-- txt: input string
-- delimiter: char or text by which to split txt
--
-- example:
--
-- SELECT get_num_tokens('the quick brown fox', ' ') AS num_token;
-- Returns: 4
-- 

DELIMITER $$

DROP FUNCTION IF EXISTS get_num_tokens $$
CREATE FUNCTION get_num_tokens(txt TEXT CHARSET utf8, delimiter_text VARCHAR(255) CHARSET utf8) RETURNS INT UNSIGNED 
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT 'Return number of tokens in delimited text'

begin
  if CHAR_LENGTH(txt) = 0 then
    return 0;
  end if;
  if CHAR_LENGTH(delimiter_text) = 0 then
    return CHAR_LENGTH(txt);
  else
    return (CHAR_LENGTH(txt) - CHAR_LENGTH(REPLACE(txt, delimiter_text, '')))/CHAR_LENGTH(delimiter_text) + 1;
  end if;
end $$

DELIMITER ;
