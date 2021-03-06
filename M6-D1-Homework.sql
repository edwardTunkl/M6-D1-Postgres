CREATE TABLE 
	IF NOT EXISTS 
		public.authors(
		author_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
			name VARCHAR(50) NOT NULL,
			last_name VARCHAR (50) NOT NULL,
			birth_year INTEGER NOT NULL,
			country VARCHAR(50) NOT NULL
		)

CREATE TABLE 
	IF NOT EXISTS 
		public.books(
		book_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		name VARCHAR(150) NOT NULL,
		category VARCHAR (50) NOT NULL,
		cover TEXT NOT NULL,
		author_id INTEGER REFERENCES authors(author_id),
		created_at TIMESTAMP DEFAULT NOW(),
		updated_at TIMESTAMPTZ DEFAULT NOW(),
		published_at TIMESTAMPTZ DEFAULT NOW()
		)


INSERT INTO public.authors(
name,
last_name,
birth_year,
country)
VALUES(
'Dame Agatha Mary Clarissa',
'Christie',
1890,
'England');

INSERT INTO public.books(
	name,
	category,
	cover,
	author_id
)
Values(
'Along Came a Spider',
'Crime',
'https://img.thriftbooks.com/api/images/i/m/9257483BA08B3CE3891E56A488F7356C330378B6.jpg',
	8
)


UPDATE public.authors SET birth_year=1895 WHERE author_id=2 RETURNING *;

UPDATE public.books SET cover="newimagesource.abc" WHERE book_id=2 RETURNING *;

SELECT * FROM public.books WHERE category='Crime'

SELECT * FROM public.books WHERE name LIKE 'T%'

SELECT * FROM public.books WHERE name LIKE '%the%'

//---gevin everyone of those authors is still alive....

SELECT 2021-birth_year<=60 from public.authors 

SELECT 2021-birth_year>=40 from public.authors 

SELECT COUNT (*) FROM public.books