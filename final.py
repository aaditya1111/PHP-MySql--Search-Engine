#!/usr/bin/env python
'''from lxml import html
import requests

page = requests.get('https://en.wikipedia.org/wiki/google');
tree = html.fromstring(page.content)


#this will create a list of urls
urllinks = tree.xpath('//p[@class="infobox vcard"]/text()')


print(urllinks)'''

#print "everything is fine";

from bs4 import BeautifulSoup
import urllib.request

#print "Are you ok";

inputsite = input('Enter site');
site = "http://en.wikipedia.org/wiki/" + inputsite;

#req = urllib.request(site,headers=hdr)
page = urllib.request.urlopen( site )
soup = BeautifulSoup( page.read() )



#data = soup.find("div",{"class":"mw-content-ltr"})
data = soup.find('table', class_='infobox')
para = data.findNextSibling('p')

result = ""
for p in para:
	print(p)
	#result = result + p.content.text

#print(result)


'''
#third thing is done
for con in soup.find_all( attrs={'class':'mw-content-ltr'} ):
	result = result + con.text;
	#if p.find('p'):
	#	result[p.find('p').text] = p.find('p').text
	
	#elif p.find('b'):
	#	result[p.find('b').text] = p.find('b').text
    #if( tr.find('th').text == 'Website')
    
#print(result)
print( len(result) )
print( result );
'''

'''
#second thing is done
for p in content.find_all('p'):
	if p.find('p'):
		result[p.find('p').text] = p.find('p').text
	elif p.find('b'):
		result[p.find('b').text] = p.find('b').text
    #if( tr.find('th').text == 'Website')
    
#print(result)
print( len(result) )
print( result );
'''

'''
#first thing is done
result = {};
table = soup.find('table', class_='infobox vcard')
for tr in table.find_all('tr'):
    if tr.find('th'):
        result[tr.find('th').text] = tr.find('td').text
        #if( tr.find('th').text == 'Website')
    
#print(result)
print( len(result) )
print( result['Website'].replace(" ","") );
'''