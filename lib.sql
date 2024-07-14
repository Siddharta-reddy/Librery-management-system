
CREATE TABLE Books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    genre VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
quantity_in_stock INT NOT NULL
);





CREATE TABLE Borrowers (
borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(50) NOT NULL
);








CREATE TABLE Borrowing (
borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
borrower_id INT,
quantity_borrowed INT NOT NULL,
borrowing_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);





INSERT INTO Books (title, author, genre, price, quantity_in_stock) VALUES
('Book Title 1', 'Author 1', 'Genre 1', 19.99, 15),
('Book Title 2', 'Author 2', 'Genre 2', 25.99, 8),
('Book Title 3', 'Author 3', 'Genre 3', 12.99, 10),
('Book Title 4', 'Author 4', 'Genre 4', 29.99, 5),
('Book Title 5', 'Author 5', 'Genre 5', 9.99, 20),
('Book Title 6', 'Author 6', 'Genre 1', 17.99, 7),
('Book Title 7', 'Author 7', 'Genre 2', 22.99, 14),
('Book Title 8', 'Author 8', 'Genre 3', 14.99, 12),
('Book Title 9', 'Author 9', 'Genre 4', 27.99, 9),
('Book Title 10', 'Author 10', 'Genre 5', 15.99, 13);






INSERT INTO Borrowers (name, contact) VALUES
('Borrower 1', 'contact1@example.com'),
('Borrower 2', 'contact2@example.com'),
('Borrower 3', 'contact3@example.com'),
('Borrower 4', 'contact4@example.com'),
('Borrower 5', 'contact5@example.com');





INSERT INTO Borrowing (book_id, borrower_id, quantity_borrowed, borrowing_date) VALUES
(1, 1, 2, '2023-01-10'),
(2, 2, 3, '2023-01-15'),
(3, 3, 1, '2023-01-20'),
(4, 4, 4, '2023-01-25'),
(5, 5, 5, '2023-01-30'),
(6, 1, 2, '2023-02-05'),
(7, 2, 3, '2023-02-10'),
(8, 3, 1, '2023-02-15'),
(9, 4, 3, '2023-02-20'),
(10, 5, 2, '2023-02-25');






SELECT 
b.book_id, 
bo.title, 
    SUM(b.quantity_borrowed) AS total_quantity_borrowed
FROM 
    Borrowing b
JOIN 
    Books bo ON b.book_id = bo.book_id
GROUP BY 
b.book_id, 
bo.title;







SELECT 
bo.title, 
    SUM(b.quantity_borrowed) AS total_quantity_borrowed
FROM 
    Borrowing b
JOIN 
    Books bo ON b.book_id = bo.book_id
GROUP BY 
bo.title;






SELECT 
bo.title
FROM 
    Books bo
LEFT JOIN 
    Borrowing b ON bo.book_id = b.book_id
WHERE
b.book_id IS NULL;






SELECT 
bo.title, 
    SUM(b.quantity_borrowed) AS total_quantity_borrowed
FROM 
    Borrowing b
JOIN 
    Books bo ON b.book_id = bo.book_id
GROUP BY 
bo.title
HAVING 
    SUM(b.quantity_borrowed) > 10;








SELECT 
bo.title, 
bo.quantity_in_stock
FROM 
    Borrowing b
JOIN 
    Books bo ON b.book_id = bo.book_id
GROUP BY 
bo.book_id, 
bo.title, 
bo.quantity_in_stock
HAVING 
    SUM(b.quantity_borrowed) > 20;
