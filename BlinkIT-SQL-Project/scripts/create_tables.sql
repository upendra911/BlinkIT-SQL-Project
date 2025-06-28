
-- Create Items table
CREATE TABLE Items (
    ItemID VARCHAR(50) PRIMARY KEY,
    ItemType VARCHAR(100),
    ItemFatContent VARCHAR(50),
    ItemWeight FLOAT,
    ItemVisibility FLOAT
);

-- Create Outlets table
CREATE TABLE Outlets (
    OutletID VARCHAR(50) PRIMARY KEY,
    OutletType VARCHAR(100),
    OutletSize VARCHAR(50),
    OutletLocationType VARCHAR(100),
    OutletEstablishmentYear INT
);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ItemID VARCHAR(50),
    OutletID VARCHAR(50),
    TotalSales FLOAT,
    Rating FLOAT,

    CONSTRAINT FK_Sales_Items FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    CONSTRAINT FK_Sales_Outlets FOREIGN KEY (OutletID) REFERENCES Outlets(OutletID)
);
