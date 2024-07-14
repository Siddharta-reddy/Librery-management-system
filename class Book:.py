class Book:
    def __init__(self, title, author, isbn):
        self.title = title
        self.author = author
        self.isbn = isbn

    def __str__(self):
        return f"{self.title} by {self.author}"
    
    def increase_stock(self, quantity):
        self.quantity_in_stock += quantity
        print(f"Stock increased for '{self.title}'. New quantity in stock: {self.quantity_in_stock}")

    def decrease_stock(self, quantity):
        if self.quantity_in_stock >= quantity:
            self.quantity_in_stock -= quantity
            print(f"Stock decreased for '{self.title}'. New quantity in stock: {self.quantity_in_stock}")
        else:
            print(f"Not enough stock available for '{self.title}'. Current stock: {self.quantity_in_stock}")
class Library:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)
        print(f"Book '{book.title}' added successfully to the library.")

    def remove_book(self, isbn):
        for book in self.books:
            if book.isbn == isbn:
                self.books.remove(book)
                print(f"Book '{book.title}' removed successfully from the library.")
                return
        print(f"Book with ISBN {isbn} not found in the library.")

    def search_book(self, isbn):
        for book in self.books:
            if book.isbn == isbn:
                return book
        return None

    def display_books(self):
        print("Books currently available in the library:")
        if not self.books:
            print("No books available.")
        else:
            for book in self.books:
                print(f"- {book}")
    
    def generate_low_stock_report(self):
        low_stock_books = [book for book in self.books if book.quantity_in_stock < 5]
        if not low_stock_books:
            print("No books are low in stock.")
        else:
            print("Books that are low in stock (quantity < 5):")
            for book in low_stock_books:
                print(f"- {book.title} by {book.author}, Quantity in stock: {book.quantity_in_stock}")

    def borrow_book(self, isbn, quantity=1):
        book = self.search_book_by_isbn(isbn)
        if book:
            book.decrease_stock(quantity)
        else:
            print(f"Book with ISBN {isbn} not found in the library.")

    def return_book(self, isbn, quantity=1):
        book = self.search_book_by_isbn(isbn)
        if book:
            book.increase_stock(quantity)
        else:
            print(f"Book with ISBN {isbn} not found in the library.")
def main():
    library = Library()

    while True:
        print("\nLibrary Management System Menu:")
        print("1. Add a new book")
        print("2. Remove a book")
        print("3. Search for a book")
        print("4. Display all books")
        print("5. Generate low stock report")
        print("6. Borrow a book")
        print("7. Return a book")
        print("8. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            title = input("Enter the title of the book: ")
            author = input("Enter the author of the book: ")
            isbn = input("Enter the ISBN of the book: ")
            new_book = Book(title, author, isbn)
            library.add_book(new_book)

        elif choice == '2':
            isbn = input("Enter the ISBN of the book to remove: ")
            library.remove_book(isbn)


        elif choice == '3':
            isbn = input("Enter the ISBN of the book to search: ")
            found_book = library.search_book(isbn)
            if found_book:
                print(f"Book found: {found_book}")
            else:
                print(f"Book with ISBN {isbn} not found in the library.")

        elif choice == '4':
            library.display_books()

        elif choice == '5':
            library.generate_low_stock_report()

        elif choice == '6':
            isbn = input("Enter the ISBN of the book to borrow: ")
            quantity = int(input("Enter the quantity to borrow: "))
            library.borrow_book(isbn, quantity)

        elif choice == '7':
            isbn = input("Enter the ISBN of the book to return: ")
            quantity = int(input("Enter the quantity to return: "))
            library.return_book(isbn, quantity)

        elif choice == '8':
            print("Exiting Library Management System. Goodbye!")
            break

        else:
            print("Invalid choice. Please enter a number from 1 to 5.")

if __name__ == "__main__":
    main()
