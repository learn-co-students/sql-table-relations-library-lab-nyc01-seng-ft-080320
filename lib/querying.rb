def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT b.title, b.year " +
  "FROM books b, series s " +
  "WHERE b.series_id = s.id " +
  "AND s.id = 1;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT c.name, c.motto " +
  "FROM characters c " +
  "WHERE length(c.motto) = (SELECT MAX(length(motto)) FROM characters);"
end


def select_value_and_count_of_most_prolific_species
  "SELECT c.species, COUNT(c.species) as count " +
  "FROM characters c " +
  "GROUP BY c.species " +
  "ORDER BY count DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT a.name, sb.name " +
  "FROM authors a, subgenres sb, series s " +
  "WHERE s.author_id = a.id " +
  "AND s.subgenre_id = sb.id;"
end

def select_series_title_with_most_human_characters
  "SELECT s.title " +
  "FROM series s, (SELECT b.id, b.series_id, COUNT(c.id) as count " +
                  "FROM books b, character_books cb, characters c " +
                  "WHERE c.id = cb.character_id " +
                  "AND cb.book_id = b.id " + 
                  "GROUP BY c.species " +
                  "HAVING c.species = \"human\" " +
                  "ORDER BY count DESC LIMIT 1) as book_with_most_humans "+
  "WHERE s.id = book_with_most_humans.series_id;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT c.name, COUNT(cb.book_id) as count " +
  "FROM characters c, character_books cb " +
  "WHERE c.id = cb.character_id " +
  "GROUP BY c.id " +
  "ORDER BY count DESC;"
end
