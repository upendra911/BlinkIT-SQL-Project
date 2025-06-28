
-- Remove duplicate ItemIDs in Items table (keep only first occurrence)
WITH ItemCTE AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY ItemID ORDER BY (SELECT NULL)) AS rn
    FROM Items
)
DELETE FROM ItemCTE WHERE rn > 1;

-- Remove duplicate OutletIDs in Outlets table
WITH OutletCTE AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY OutletID ORDER BY (SELECT NULL)) AS rn
    FROM Outlets
)
DELETE FROM OutletCTE WHERE rn > 1;

-- DELETE records from Sales where ItemID not present in Items
DELETE FROM Sales
WHERE ItemID NOT IN (SELECT ItemID FROM Items);

-- DELETE records from Sales where OutletID not present in Outlets
DELETE FROM Sales
WHERE OutletID NOT IN (SELECT OutletID FROM Outlets);
