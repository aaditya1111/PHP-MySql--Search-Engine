#to get title of a page
#working piece of code


import lxml.html
t = lxml.html.parse('http://www.iiita.ac.in');

print(t.find(".//title").text)
