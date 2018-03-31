fileObject = open('/opt/lampp/htdocs/Search-Engine/first_para.php','w')


from bs4 import BeautifulSoup
import urllib.request

#print "Are you ok";

inputsite = input('Enter site : ');
site = "http://en.wikipedia.org/wiki/Special:Search/" + inputsite; #Special:Search

#req = urllib.request(site,headers=hdr)
page = urllib.request.urlopen( site )
soup = BeautifulSoup( page.read() )

#extrating firstHeading
heading_data = soup.find('h1', class_='firstHeading')
for heading in heading_data:
	#print(heading)
	fileObject.write('Heading : ' + heading + '\n');

#data = soup.find("div",{"class":"mw-content-ltr"})
data = soup.find('table', class_='infobox')
para = data.findNextSibling('p')

result = ""
for p in para:
	#print(p)
	#print(p.string)
	#fileObject.write(str(p));
	#temp = p.string
	fileObject.write(p.string)

#fileObject.write('first line in file\n')
fileObject.close()

print("Done!!!");