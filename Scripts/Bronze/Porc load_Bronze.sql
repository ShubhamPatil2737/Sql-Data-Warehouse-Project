/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE Bronze.load_Bronze AS 
BEGIN
    PRINT '======================'
    PRINT 'Loading Bronze Layer'
    PRINT '======================'

    PRINT '-----------------------'
    PRINT 'Loading Crm Source Data'
    PRINT '-----------------------'
    TRUNCATE TABLE Bronze.crm_cust_info ;
    BULK INSERT Bronze.crm_cust_info 
    FROM 'C:\Users\ACER\Desktop\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
    )

    TRUNCATE TABLE Bronze.crm_prd_info ;
    BULK INSERT Bronze.crm_prd_info 
    FROM 'C:\Users\ACER\Desktop\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
    )

    TRUNCATE TABLE Bronze.crm_sales_details ;
    BULK INSERT Bronze.crm_sales_details
    FROM 'C:\Users\ACER\Desktop\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
    );

    PRINT '-----------------------'
    PRINT 'Loading Erp Source Data'
    PRINT '-----------------------'
    TRUNCATE TABLE Bronze.erp_cust_az12 ;
    BULK INSERT Bronze.erp_cust_az12 
    FROM 'C:\Users\ACER\Desktop\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
    WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
    )

    TRUNCATE TABLE Bronze.erp_loc_a101 ;
    BULK INSERT Bronze.erp_loc_a101 
    FROM 'C:\Users\ACER\Desktop\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
    )

    TRUNCATE TABLE Bronze.erp_px_cat_g1v2 ;
    BULK INSERT Bronze.erp_px_cat_g1v2
    FROM 'C:\Users\ACER\Desktop\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
    );

END

