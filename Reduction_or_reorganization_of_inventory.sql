-- List all products in inventory with their quantities
SELECT productName, quantityInStock
FROM products;

/*
1992 Ferrari 360 Spider red	  8347	1808
1937 Lincoln Berline	  8693	1111
American Airlines: MD-11S	8820	1085
1941 Chevrolet Special Deluxe Cabriolet	2378	1076
1930 Buick Marquette Phaeton	7062	1074
1940s Ford truck	3128	1061
1969 Harley Davidson Ultimate Chopper     7933	1057
1957 Chevy Pickup      6125	1056
1964 Mercedes Tour Bus       8258	1053
1956 Porsche 356A Coupe	6600	1052
Corsair F4U ( Bird Cage)	6812	1051
F/A 18 Hornet 1/72	551	1047
1980s Black Hawk Helicopter	5330	1040
1913 Ford Model T Speedster	4189	1038
1997 BMW R 1100 S	7003	1033
1972 Alfa Romeo GTA	3252	1030
1962 Volkswagen Microbus	2327	1029
2002 Suzuki XREO	9997	1028
The USS Constitution Ship	7083	1020
2001 Ferrari Enzo	3619	1019
1960 BSA Gold Star DBD34	15	1015
1997 BMW F650 ST	178	1014
1957 Corvette Convertible	1249	1013
18th century schooner	1898	1011
1900s Vintage Tri-Plane	2756	1009
1996 Moto Guzzi 1100i	6625	999
1940 Ford Pickup Truck	2613	999
1926 Ford Fire Engine	2018	998
1982 Camaro Z28	6934	997
1939 Cadillac Limousine	6645	995
1969 Dodge Charger	7323	992
1917 Maxwell Touring Car	7913	992
2002 Yamaha YZR M1	600	992
1912 Ford Model T Delivery Wagon	9173	991
1904 Buick Runabout	8290	990
1996 Peterbilt 379 Stake Bed with Outrigger	814	988
1998 Chrysler Plymouth Prowler	4724	986
2003 Harley-Davidson Eagle Drag Bike	5582	985
1934 Ford V8 Coupe	5649	985
America West Airlines B757-200	9653	984
1958 Chevy Corvette Limited Edition	2542	983
1936 Chrysler Airflow	4710	983
Diamond T620 Semi-Skirted Tanker	1016	979
1970 Dodge Coronet	4074	976
1969 Dodge Super Bee	1917	974
ATA: B757-300	7106	973
1958 Setra Bus	1579	972
1948 Porsche 356-A Roadster	8826	972
1928 British Royal Navy Airplane	3627	972
1928 Ford Phaeton Deluxe	136	972
1971 Alpine Renault 1600s	7995	969
1999 Yamaha Speed Boat	4259	966
1962 City of Detroit Streetcar	1645	966
1969 Ford Falcon	1049	965
1969 Corvair Monza	6906	963
1952 Alpine Renault 1300	7305	961
1936 Mercedes-Benz 500K Special Roadster	8635	960
Boeing X-32A JSF	4857	960
1957 Vespa GS150	7689	959
Pont Yacht	414	958
1932 Model A Ford J-Coupe	9354	957
1938 Cadillac V-16 Presidential Limousine	2847	955
1954 Greyhound Scenicruiser	2874	955
The Titanic	1956	952
1949 Jaguar XK 120	2350	949
1948 Porsche Type 356 Roadster	8990	948
1993 Mazda RX-7	3975	947
1982 Ducati 900 Monster	6840	947
1936 Harley Davidson El Knucklehead	4357	945
1970 Triumph Spitfire	5545	945
1961 Chevrolet Impala	7869	941
1900s Vintage Bi-Plane	5942	940
1939 Chevrolet Deluxe Coupe	7332	937
1950's Chicago Surface Lines Streetcar	8601	934
The Schooner Bluenose	1897	934
1968 Ford Mustang	68	933
1962 LanciaA Delta 16V	6791	932
1968 Dodge Charger	9123	925
1940 Ford Delivery Sedan	6621	923
1917 Grand Touring Sedan	2724	918
Collectable Wooden Train	6450	918
1995 Honda Civic	9772	917
P-51-D Mustang	992	917
1976 Ford Gran Torino	9127	915
1966 Shelby Cobra 427 S/C	8197	915
1965 Aston Martin DB5	9042	914
1982 Lamborghini Diablo	7723	912
1980’s GM Manhattan Express	5099	911
18th Century Vintage Horse Carriage	5992	907
1982 Ducati 996 R	9241	906
1970 Plymouth Hemi Cuda	5663	900
1974 Ducati 350 Mk3 Desmo	3341	898
The Mayflower	737	898
HMS Bounty	3501	897
The Queen Mary	5088	896
2002 Chevy Corvette	9446	894
American Airlines: B767-300	5841	894
1937 Horch 930V Limousine	2902	884
1903 Ford Model A	3913	883
1928 Mercedes-Benz SSK	548	880
1952 Citroen-15CV	1452	873
1969 Chevrolet Camaro Z28	4695	870
1992 Porsche Cayenne Turbo Silver	6582	867
1932 Alfa Romeo 8C2300 Spider Sport	6553	866
1999 Indy 500 Monte Carlo SS	8164	855
1911 Ford Town Car	540	832
1936 Mercedes Benz 500k Roadster	2081	824
1970 Chevy Chevelle SS 454	1005	803
1957 Ford Thunderbird	3209	767
1985 Toyota Supra	7733	
*/

-- Identify the most and least stocked product lines
SELECT productLine, SUM(quantityInStock) AS totalQuantity
FROM products
GROUP BY productLine
ORDER BY totalQuantity DESC;

/*
Classic Cars	219183
Vintage Cars	124880
Motorcycles	69401
Planes	62287
Trucks and Buses	35851
Ships	26833
Trains	16696
*/

-- Find the top-selling products and their current inventory levels
SELECT p.productName, p.quantityInStock, SUM(od.quantityOrdered) AS totalOrdered
FROM products AS p
LEFT JOIN orderdetails AS od ON p.productCode = od.productCode
GROUP BY p.productName, p.quantityInStock
ORDER BY totalOrdered DESC;

/*
1992 Ferrari 360 Spider red	8347	1808
1937 Lincoln Berline	8693	1111
American Airlines: MD-11S	8820	1085
1941 Chevrolet Special Deluxe Cabriolet	2378	1076
1930 Buick Marquette Phaeton	7062	1074
1940s Ford truck	3128	1061
1969 Harley Davidson Ultimate Chopper	7933	1057
1957 Chevy Pickup	6125	1056
1964 Mercedes Tour Bus	8258	1053
1956 Porsche 356A Coupe	6600	1052
Corsair F4U ( Bird Cage)	6812	1051
F/A 18 Hornet 1/72	551	1047
1980s Black Hawk Helicopter	5330	1040
1913 Ford Model T Speedster	4189	1038
1997 BMW R 1100 S	7003	1033
1972 Alfa Romeo GTA	3252	1030
1962 Volkswagen Microbus	2327	1029
2002 Suzuki XREO	9997	1028
The USS Constitution Ship	7083	1020
2001 Ferrari Enzo	3619	1019
1960 BSA Gold Star DBD34	15	1015
1997 BMW F650 ST	178	1014
1957 Corvette Convertible	1249	1013
18th century schooner	1898	1011
1900s Vintage Tri-Plane	2756	1009
1996 Moto Guzzi 1100i	6625	999
1940 Ford Pickup Truck	2613	999
1926 Ford Fire Engine	2018	998
1982 Camaro Z28	6934	997
1939 Cadillac Limousine	6645	995
1969 Dodge Charger	7323	992
1917 Maxwell Touring Car	7913	992
2002 Yamaha YZR M1	600	992
1912 Ford Model T Delivery Wagon	9173	991
1904 Buick Runabout	8290	990
1996 Peterbilt 379 Stake Bed with Outrigger	814	988
1998 Chrysler Plymouth Prowler	4724	986
2003 Harley-Davidson Eagle Drag Bike	5582	985
1934 Ford V8 Coupe	5649	985
America West Airlines B757-200	9653	984
1958 Chevy Corvette Limited Edition	2542	983
1936 Chrysler Airflow	4710	983
Diamond T620 Semi-Skirted Tanker	1016	979
1970 Dodge Coronet	4074	976
1969 Dodge Super Bee	1917	974
ATA: B757-300	7106	973
1958 Setra Bus	1579	972
1948 Porsche 356-A Roadster	8826	972
1928 British Royal Navy Airplane	3627	972
1928 Ford Phaeton Deluxe	136	972
1971 Alpine Renault 1600s	7995	969
1999 Yamaha Speed Boat	4259	966
1962 City of Detroit Streetcar	1645	966
1969 Ford Falcon	1049	965
1969 Corvair Monza	6906	963
1952 Alpine Renault 1300	7305	961
1936 Mercedes-Benz 500K Special Roadster	8635	960
Boeing X-32A JSF	4857	960
1957 Vespa GS150	7689	959
Pont Yacht	414	958
1932 Model A Ford J-Coupe	9354	957
1938 Cadillac V-16 Presidential Limousine	2847	955
1954 Greyhound Scenicruiser	2874	955
The Titanic	1956	952
1949 Jaguar XK 120	2350	949
1948 Porsche Type 356 Roadster	8990	948
1993 Mazda RX-7	3975	947
1982 Ducati 900 Monster	6840	947
1936 Harley Davidson El Knucklehead	4357	945
1970 Triumph Spitfire	5545	945
1961 Chevrolet Impala	7869	941
1900s Vintage Bi-Plane	5942	940
1939 Chevrolet Deluxe Coupe	7332	937
1950's Chicago Surface Lines Streetcar	8601	934
The Schooner Bluenose	1897	934
1968 Ford Mustang	68	933
1962 LanciaA Delta 16V	6791	932
1968 Dodge Charger	9123	925
1940 Ford Delivery Sedan	6621	923
1917 Grand Touring Sedan	2724	918
Collectable Wooden Train	6450	918
1995 Honda Civic	9772	917
P-51-D Mustang	992	917
1976 Ford Gran Torino	9127	915
1966 Shelby Cobra 427 S/C	8197	915
1965 Aston Martin DB5	9042	914
1982 Lamborghini Diablo	7723	912
1980’s GM Manhattan Express	5099	911
18th Century Vintage Horse Carriage	5992	907
1982 Ducati 996 R	9241	906
1970 Plymouth Hemi Cuda	5663	900
1974 Ducati 350 Mk3 Desmo	3341	898
The Mayflower	737	898
HMS Bounty	3501	897
The Queen Mary	5088	896
2002 Chevy Corvette	9446	894
American Airlines: B767-300	5841	894
1937 Horch 930V Limousine	2902	884
1903 Ford Model A	3913	883
1928 Mercedes-Benz SSK	548	880
1952 Citroen-15CV	1452	873
1969 Chevrolet Camaro Z28	4695	870
1992 Porsche Cayenne Turbo Silver	6582	867
1932 Alfa Romeo 8C2300 Spider Sport	6553	866
1999 Indy 500 Monte Carlo SS	8164	855
1911 Ford Town Car	540	832
1936 Mercedes Benz 500k Roadster	2081	824
1970 Chevy Chevelle SS 454	1005	803
1957 Ford Thunderbird	3209	767
1985 Toyota Supra	7733	
*/

SELECT warehouseCode, warehouseName, warehousePctCap
FROM warehouses;
/*
b	East	2327710.29
a	North	1240847.65
d	South	1149461.12
c	West	1060291.30
*/
SELECT w.warehouseCode, w.warehouseName, SUM(p.quantityInStock) AS totalInventory
FROM warehouses AS w
LEFT JOIN products AS p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName;

/*
a	North	131688
b	East	219183
c	West	124880
d	South	79380
*/
SELECT w.warehouseCode, w.warehouseName, SUM(p.quantityInStock) AS totalInventory,
       w.warehousePctCap, (SUM(p.quantityInStock) / w.warehousePctCap) AS utilization
FROM warehouses AS w
LEFT JOIN products AS p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, w.warehousePctCap;

/*
a	North	131688	72	1829
b	East	219183	67	3271.3880597014927
c	West	124880	50	2497.6
d	South	79380	75	1058.4
*/

SELECT w.warehouseCode, w.warehouseName, SUM(od.quantityOrdered * p.buyPrice) AS totalSales
FROM warehouses AS w
LEFT JOIN products AS p ON w.warehouseCode = p.warehouseCode
LEFT JOIN orderdetails AS od ON p.productCode = od.productCode
GROUP BY w.warehouseCode, w.warehouseName;

/*
a	North	1240847.65
b	East	2327710.29
c	West	1060291.30
d	South	1149461.12
*/


