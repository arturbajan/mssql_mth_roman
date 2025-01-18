declare @start date='2021-10-01';
declare @stop date='2022-01-31';
declare @number int;
declare @string nvarchar(max);

set @number=(select DATEDIFF(month,@start,@stop));

select w.dt_rep 
,concat('''',case month(w.dt_rep)
 when 1 then 'I'  
 when 2 then'II'
 when 3 then'III'
 when 4 then'IV'
 when 5 then'V'
 when 6 then'VI'
 when 7 then'VII'
 when 8 then'VIII'
 when 9 then'IX'
 when 10 then'X'
 when 11 then'XI'
 when 12 then'XII'
 else null end,' ',year(w.dt_rep),'''') mth_roman
 from 
(SELECT  number,
 EOMONTH(dateadd(month,number,@start)) dt_rep
FROM master..spt_values
WHERE 
    type = 'P'
    AND 
    number <= @number
    )w;


  
