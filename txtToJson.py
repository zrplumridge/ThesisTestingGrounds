#Python program to convert text
#file to JSON
#modified from WikiHow https://www.wikihow.com/Convert-Txt-to-Json accessed on 12/1/2025

import json
#the file to be converted
filename = '/Users/zoeplumridge/Desktop/Research/ThesisABCtool/mediumDisease.txt'
#resultant dictionary
dict1 = {}
#fields in the sample file 
fields =['ID', 'category', 'keyword set', 'keyword', 'source']

with open(filename) as fh:
    
    l = 1
    
    for line in fh:
#reading line by line from the text file
        description = list(line.strip().split("\t", 4))
#for output see below
        print(description)
# for automatic creation of id for each dictionary
        sno ='emp'+str(l)
# loop variable
        i = 0
# intermediate dictionary
        dict2 = {}
        while i<len(fields):
# creating dictionary for each employee
                dict2[fields[i]]= description[i]
                i = i + 1
# appending the record of each employee to
# the main dictionary
        dict1[sno]= dict2
        l = l + 1
# creating json file        
out_file = open("mediumDisease.json", "w")
json.dump(dict1, out_file, indent = 4)
out_file.close()