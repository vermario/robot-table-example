*** Settings ***
Documentation   An example robot, using a custom keyword to extract the data out of an HTML table
...             and using the RPA.Tables library to log the rows and export it into a CSV
Library    RPA.Browser
Library    RPA.Tables
Library    readTable.py

*** Tasks ***
Minimal task
    Open Available Browser    https://www.w3schools.com/html/html_tables.asp
    # Close the cookie notice:
    Click Element When Visible    id:accept-choices
    # Get the raw html for the table using RPA.Browser
    ${html_table}=    Get Element Attribute    id:customers    outerHTML
    # No need for the browser anymore:
    Close All Browsers
    # Parse the html to get the data within it, using a custom keyword
    ${table_as_data_structure}=     Extract Table Data As Dictionary     ${html_table}
    # Turn the data into a RPA.Tables table
    ${table}=    Create Table    ${table_as_data_structure}
    # Now we can work it it, for example for loop to log the rows:
    FOR    ${row}    IN    @{table}
        Log    ${row}
    END
    # and write it out as a CSV:
    Write Table To CSV    ${table}    ${OUTPUT_DIR}${/}table.csv

    
