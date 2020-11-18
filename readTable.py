from bs4 import BeautifulSoup


def extract_table_data_as_dictionary(tableHTML):
    """Gets the HTML of the table, returns a list of dictionaries"""
    # create a list:
    table_rows = []
    # Parse the HTML with BeautifulSoup, using the default html parser
    soup = BeautifulSoup(tableHTML, "html.parser")
    # TODO: this is specific to the table in the example, could be made more
    # generic :)
    for table_row in soup.select('tr'):
        cells = table_row.findAll('td')
        if len(cells) > 0:
            company = cells[0].text.strip()
            contact = cells[1].text.strip()
            country = cells[2].text.strip()
            new_row = {'company': company,
                       'contact': contact,
                       'country': country}
            table_rows.append(new_row)

    return(table_rows)
