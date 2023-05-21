CREATE DATABASE Instagram
USE Instagram

CREATE TABLE Users(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Username VARCHAR(150) UNIQUE NOT NULL,
	Name VARCHAR(150),
	Email VARCHAR(100) NOT NULL,
	Password VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE Posts(
	Id INT PRIMARY KEY IDENTITY(1,1),
	UserId INT FOREIGN KEY REFERENCES Users(Id),
	ImageUrl VARCHAR(255) NOT NULL,
	Createed DATE DEFAULT GETDATE()
)
CREATE TABLE Comments(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Text NTEXT NOT NULL,
	PostId INT FOREIGN KEY REFERENCES Posts(Id),
	UserId INT FOREIGN KEY REFERENCES Users(Id),
	Createed DATE DEFAULT GETDATE()
)

CREATE TABLE Likes(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Text NTEXT NOT NULL,
	PostId INT FOREIGN KEY REFERENCES Posts(Id),
	UserId INT FOREIGN KEY REFERENCES Users(Id),
	Createed DATE DEFAULT GETDATE(),
	LikeCount INT NOT NULL
)

CREATE TABLE Follows (
  Id INT PRIMARY KEY IDENTITY(1,1),
  FollowersId INT NOT NULL REFERENCES Users(Id),
  FollowingId INT NOT NULL REFERENCES Users(Id),
  FollowersCount INT NOT NULL DEFAULT(0),
  FollowingCount INT NOT NULL DEFAULT(0)
);

INSERT INTO Users (Username, Name, Email, Password) VALUES 
	('fidannovruzlu', 'Fidan', 'fidan.novruzlu0309@gmail.com', 'mypassword'),
	('gunay123', 'Gunay', 'gunay@gmail.com', '12345678'),
	('ferid_f', 'Ferid', 'ferid@gmail.com', 'ffff59'),
	('lara__30', 'Lara', 'lara@gmail.com', 'vdshacv'),
	('men.nurlan', 'Nuraln', 'nurlan@gmail.com', 'nunu@8')

INSERT INTO Posts (UserId, ImageUrl) VALUES 
	(1, 'https://example.com/image.ppg'),
	(2,'https://example.com/image2.ppg'),
	(3,'https://example.com/image3.ppg'),
	(5,'https://example.com/image5.ppg');

INSERT INTO Comments (Text, PostId, UserId) VALUES 
	('interesting!', 1, 1),
	('Niceeeeeee',1,2),
	('Nice photo' ,2,5);

INSERT INTO Likes (PostId, UserId,LikeCount) VALUES (1, 1,200),(1,5,50),(1,3,504);

INSERT INTO Follows (FollowersId, FollowingId) VALUES (1, 1);

ALTER TABLE Likes DROP COLUMN Text

UPDATE Posts SET Createed='2002-01-20' WHERE Id=4
UPDATE Posts SET Createed='2011-11-21' WHERE Id=1
UPDATE Comments SET Text='Great photo.',Createed='2019-12-10' WHERE Id=6

SELECT *FROM Users
SELECT *FROM Posts
SELECT *FROM Comments
SELECT *FROM Likes

SELECT Users.Username ,Posts.Createed FROM Posts INNER JOIN Users ON Posts.UserId=Users.Id

Select Users.Username ,Posts.Createed FROM Posts RIGHT JOIN Users ON Posts.UserId=Users.Id

SELECT Users.Name, Comments.Text FROM Users INNER JOIN Comments ON Users.Id=Comments.PostId

SELECT Users.Name, Comments.Text FROM Users LEFT JOIN Comments ON Users.Id=Comments.PostId

SELECT Users.Name, Comments.Text FROM Users RIGHT JOIN Comments ON Users.Id=Comments.PostId

SELECT Posts.ImageUrl, Likes.LikeCount FROM Posts LEFT JOIN Likes ON Posts.Id=Likes.PostId

SELECT U1.Username AS Follower FROM Follows F RIGHT JOIN Users U1 ON F.FollowersId = U1.Id

SELECT U1.Username AS Following FROM Follows F LEFT JOIN Users U1 ON F.FollowingId = U1.Id
