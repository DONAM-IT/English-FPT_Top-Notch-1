-->  lấy thông tin tất cả các xe của thằng owner có id = 30 (nguyên)
Select A.accoutnId, A.fullName, A.phone, B.bikeId ,B.BikeName 
From tblAccount A, tblBike B 
Where A.roleId = 'biker' And A.accoutnId = B.owner And B.owner = 30

-->  tìm tất cả những thằng sử dụng service vá xe (long)
select A.accoutnId, A.userName, A.fullName,A.address,A.roleId,V.ServiceName ,A.roleId
from tblAccount A, tblBooking B, tblShopService S, tblService V
where A.accoutnId = B.worker AND V.serviceId = S.serviceId AND S.shopServiceId = B.shopServiceId  AND S.serviceId = 1 

--> lấy tất cả thông tin những thằng biker nào vote 4 sao trở nên (nam) 


--> top 10 những xe sữa chữa nhiều và tốn nhiều tiền nhất, DESC giảm dần (long)
select top(10) A.fullName,B.BikeName, SUM(BK.TotalPrice) AS Total
from tblAccount A, tblBike B , tblBooking BK
where A.accoutnId = B.owner AND B.bikeId = BK.bikeId
Group by  A.fullName,B.BikeName
Order by SUM(BK.TotalPrice) DESC

-- những shop có dịch vụ sửa oto
Select A.accoutnId, A.fullName, V.ServiceName From tblAccount A, tblShop S, tblShopService SE, tblService V
Where A.accoutnId = S.manager And S.shopId = SE.shopId And SE.serviceId = V.serviceId And V.serviceId = 3


--- shop dc booking nhieu nhất
select S.shopId ,S.shopName,COUNT((Select Top(1) COUNT(worker) as Total From tblBooking Group by worker order by COUNT(worker) Desc)) AS Total
from tblShop S, tblBooking B, tblShopService SE
where S.shopId = SE.shopId AND SE.shopServiceId = B.shopServiceId
Group by S.shopId, S.shopName

-- đếm số lần các worker dc book  
select A.accoutnId, A.shopId ,COUNT(B.worker) AS TOTAL
from tblBooking B, tblAccount A
where B.worker = A.accoutnId
group by A.accoutnId, A.shopId


-- MỖI shop dc book nhieu lan
select , .fullName,Sum(B.shopServiceId) AS TOTAL
from tblBooking B, tblBike BI, tblAccount
where B.worker = A.accoutnId
group by A.shopId, A.fullName