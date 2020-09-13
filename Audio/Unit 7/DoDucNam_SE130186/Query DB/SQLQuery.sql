-- Tổng số worker của các shop
Select S.shopId, S.shopName, Count(A.shopId) as total 
From tblAccount A, tblShop S 
Where A.shopId = S.shopId And A.roleId = 'worker'
Group by S.shopId, S.shopName
