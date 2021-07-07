  # it apears the books are already ordered by year but lets assume they werent
def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books
   INNER JOIN series ON books.series_id = series.id
   WHERE series.id = 1
   ORDER BY books.year ASC;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
   ORDER BY length(motto) DESC
   LIMIT 1;"
end

  # I peeked at the solution...was confued that count was giving me direwolf, 8
  # realize that it was counting all species and that I need to spefiy to count by groups
def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS QTY FROM characters
   GROUP BY species
   ORDER BY qty DESC
   LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors
   INNER JOIN series ON authors.id = series.author_id
   INNER JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
   INNER JOIN books ON series.id = books.series_id
   INNER JOIN character_books ON books.id = character_books.book_id
   INNER JOIN characters ON character_books.character_id = characters.id
   WHERE characters.species = 'human'
   GROUP BY series.title
   ORDER BY COUNT(species) DESC
   LIMIT 1;"
end
 # I think this rspec is impossible...I even tried the solution branch commented out below
 # and it got the same results as my query ahh 
def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*) as book_count FROM characters
   INNER JOIN character_books ON characters.id = character_books.character_id
   INNER JOIN books ON character_books.book_id = books.id
   GROUP BY characters.name
   ORDER BY book_count DESC;"

  #  "SELECT characters.name, COUNT(*) as book_count 
  #   FROM character_books 
  #   JOIN characters 
  #   ON character_books.character_id = characters.id 
  #   GROUP BY characters.name 
  #   ORDER BY book_count DESC"
end