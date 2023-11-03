Create Database KontaktHome

Use KontaktHome

Create Table Brands
(
Id int identity primary key,
Name nvarchar(100)
)

INSERT INTO Brands
VALUES
('Dell'),
('HP'),
('Samsung'),
('Asus'),
('Iphone'),
('Redmi'),
('OnePlus')


Create Table Notebooks
(
Id int identity primary key,
Name nvarchar(100),
Price smallmoney,
BrandId int Foreign Key References Brands(Id)

)

INSERT INTO Notebooks
VALUES
('TUF 15', 5100, 4),
('XPS 13', 1500, 1),
('Spectre x360', 3200, 2),
('Galaxy Book ION', 1700, 3),
('ZenBook 14', 5100, 4)

Create Table Phones
(
Id int identity primary key,
Name nvarchar(100),
Price smallmoney ,
BrandId int Foreign Key References Brands(Id)
)

INSERT INTO Phones
VALUES
('13 pro max', 3000, 5),
('Galaxy S23 ultra', 2300, 3),
('15 pro max', 4000, 5),
('Note 12 pro',1200, 6),
('9 Pro', 950, 7)


SELECT Concat(b.Name,' ', n.Name) AS "BrandName", n.Price
FROM Notebooks n
JOIN Brands b ON n.BrandId = b.Id

SELECT Concat(b.Name,' ', p.Name) AS "BrandName", p.Price
FROM Phones p
JOIN Brands b ON p.BrandId = b.Id

SELECT n.Name AS "Notebook Name", b.Name AS "BrandName"
FROM Notebooks n
JOIN Brands b ON n.BrandId = b.Id
WHERE b.Name LIKE '%s%'

SELECT n.Name AS "Notebook Name", b.Name AS "BrandName", n.Price
FROM Notebooks n
JOIN Brands b ON n.BrandId = b.Id
WHERE (n.Price >= 2000 AND n.Price <= 5000) OR n.Price>5000

SELECT p.Name AS "Phone Name", b.Name AS "BrandName", p.Price
FROM Phones p
JOIN Brands b ON p.BrandId = b.Id
WHERE (p.Price >= 1000 AND p.Price <= 1500) OR p.Price>1500

SELECT b.Name AS "BrandName", Count(*) 'Notebook Count'
FROM Notebooks n
JOIN Brands b ON n.BrandId = b.Id
Group By b.Name

SELECT b.Name AS "BrandName", Count(*) 'Phone Count'
FROM Phones p
JOIN Brands b ON p.BrandId = b.Id
Group By b.Name

Select n.Name notebookName,p.Name phoneName
FROM Notebooks n 
Inner Join Phones p on n.BrandId=p.BrandId
--n.Id,n.Name,n.Price,n.BrandId,p.Id,p.Name,p.Price,p.BrandId

SELECT p.Id AS PhoneId, p.Name AS PhoneName, p.Price AS PhonePrice, p.BrandId AS PhoneBrandId,
       n.Id AS NotebookId, n.Name AS NotebookName, n.Price AS NotebookPrice, n.BrandId AS NotebookBrandId
FROM Phones p
 Full JOIN Notebooks n ON p.BrandId = n.BrandId;


SELECT b.Name 'BrandName',*
FROM Notebooks n
Full JOIN Phones p On p.BrandId=n.BrandId
Inner Join Brands b On b.Id=p.BrandId OR b.Id=n.BrandId


SELECT b.Name 'BrandName',*
FROM Notebooks n
Full JOIN Phones p On p.BrandId=n.BrandId
Inner Join Brands b On b.Id=p.BrandId OR b.Id=n.BrandId
where n.Price>1000 Or p.Price>1000

SELECT b.Name AS "BrandName", SUM(p.Price) AS 'Total Price', Count(*) 'Product Count'
FROM Phones p
JOIN Brands b ON p.BrandId = b.Id
Group By b.Name

SELECT b.Name AS "BrandName", SUM(n.Price) AS 'Total Price', Count(*) 'Product Count'
FROM Notebooks n
JOIN Brands b ON n.BrandId = b.Id
Group By b.Name	
HAVING COUNT(*) >= 2













