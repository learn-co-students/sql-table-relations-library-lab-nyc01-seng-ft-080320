def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
  SELECT
    books.title, books.year
  FROM 
    books
  JOIN 
    series ON series.id = books.series_id AND series.id = 1
  ORDER BY
    books.year
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
  SELECT 
    name, motto
  FROM
    (SELECT characters.name as name, characters.motto as motto, MAX(LENGTH(characters.motto)) as motto_length 
      FROM characters)
  SQL
end


def select_value_and_count_of_most_prolific_species
  <<-SQL
  SELECT
    characters.species, count(name) as num
  FROM
    characters
  GROUP BY
    species
  ORDER BY num DESC
  LIMIT 1
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL
  SELECT
    authors.name, subgenres.name
  FROM
    series
  JOIN
    authors ON series.author_id = authors.id
  JOIN 
    subgenres ON series.subgenre_id = subgenres.id
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
  SELECT
    sertle
  FROM 
    (SELECT series.title as sertle, COUNT(characters.name) as county
    FROM series
    JOIN authors on series.author_id = authors.id
    JOIN characters on characters.author_id = authors.id
    GROUP BY
      characters.species)
    ORDER BY  county DESC LIMIT 1
  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
  SELECT
    characters.name, COUNT(*) as book_count
  FROM 
    character_books
  JOIN characters
  ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY book_count DESC, characters.name
  

  SQL
end
