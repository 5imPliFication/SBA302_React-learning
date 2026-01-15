CREATE DATABASE SBA302_Assignment01;
USE SBA302_Assignment01;

-- =========================
-- CATEGORY
-- =========================
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    CategoryDescription TEXT,
    ParentCategoryID INT,
    IsActive TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (ParentCategoryID) REFERENCES Category(CategoryID)
);

-- =========================
-- TAG
-- =========================
CREATE TABLE Tag (
    TagID INT AUTO_INCREMENT PRIMARY KEY,
    TagName NVARCHAR(100) NOT NULL,
    Note TEXT
);

-- =========================
-- SYSTEM ACCOUNT
-- =========================
CREATE TABLE SystemAccount (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    AccountName NVARCHAR(100) NOT NULL,
    AccountEmail VARCHAR(100) NOT NULL UNIQUE,
    AccountRole TINYINT NOT NULL, -- 1 = Admin, 2 = Staff
    AccountPassword VARCHAR(255) NOT NULL,
    CHECK (AccountRole IN (1,2))
);

-- =========================
-- NEWS ARTICLE
-- =========================
CREATE TABLE NewsArticle (
    NewsArticleID INT AUTO_INCREMENT PRIMARY KEY,
    NewsTitle NVARCHAR(100) NOT NULL,
    Headline NVARCHAR(200),
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    NewsContent TEXT NOT NULL,
    NewsSource TEXT,
    CategoryID INT NOT NULL,
    NewsStatus TINYINT(1) NOT NULL DEFAULT 1, -- 1=active, 0=inactive
    CreatedByID INT NOT NULL,
    UpdatedByID INT,
    ModifiedDate DATETIME,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (CreatedByID) REFERENCES SystemAccount(AccountID),
    FOREIGN KEY (UpdatedByID) REFERENCES SystemAccount(AccountID)
);

-- =========================
-- NEWS - TAG (MANY TO MANY)
-- =========================
CREATE TABLE NewsTag (
    NewsArticleID INT,
    TagID INT,
    PRIMARY KEY (NewsArticleID, TagID),
    FOREIGN KEY (NewsArticleID) REFERENCES NewsArticle(NewsArticleID),
    FOREIGN KEY (TagID) REFERENCES Tag(TagID)
);
