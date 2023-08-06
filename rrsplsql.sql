-- 1.To display details of passenger 
declare
P_FName Passenger.F_Name%type;
P_SName Passenger.L_Name%type;
Mob Passenger.Mobile%type;
Address Passenger.Address%type;
Cursor c IS select F_Name,L_Name,Mobile,Address from Passenger; 
begin
open c; 
loop 
fetch c into P_FName,P_SName,Mob,Address; 
exit when c%NOTFOUND; 
dbms_output.put_line(P_FName||' '||P_SName||' '||Mob||' '||Address); 
end loop; 
close c; 
end;

-- 2.To display the details of passenger whose train is in evening 
declare
P_FName Passenger.F_Name%type;
P_SName Passenger.L_Name%type;
Mob Passenger.Mobile%type;
Address Passenger.Address%type;
TrainNo Passenger.T_No%type;
Cursor c IS select P.F_Name,P.L_Name,P.Mobile,P.Address,T.T_No from Passenger P,Train T where to_char(T.ArrivalTime,'pm')='pm' and T.T_No=P.T_No; 
begin 
open c; 
loop 
fetch c into
P_FName,P_SName,Mob,Address,TrainNo; 
exit when c%NOTFOUND;
dbms_output.put_line(P_FName||' '||P_SName||' '||Mob||' '||Address||' '||TrainNo||' ');
end loop; 
close c; 
end;

-- 3. To display the details of passenger whose has taken highest fair ticket 
declare
P_FName Passenger.F_Name%type;
P_SName Passenger.L_Name%type;
Mob Passenger.Mobile%type;
Address Passenger.Address%type;
CustomerId Passenger.C_Id%type;
Cursor c IS select P.F_Name,P.L_Name,P.Mobile,P.Address,T.C_Id from Passenger P,Ticket T where Price=(select max(Price) from Ticket) and T.C_Id=P.C_Id; 
begin 
open c; 
loop 
fetch c into
P_FName,P_SName,Mob,Address,CustomerId; 
exit when c%NOTFOUND;
dbms_output.put_line(P_FName||' '||P_SName||' '||Mob||' '||Address||' '||CustomerId||' ');
end loop; 
close c; 
end;