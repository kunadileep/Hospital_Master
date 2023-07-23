
from django.shortcuts import render, redirect
from django import forms
from django.forms import inlineformset_factory
from django.contrib.auth.forms import UserCreationForm
from django.db import connection
from django.contrib import messages
import bcrypt
import hashlib
import sys
import base64
from datetime import datetime
from datetime import date
from django.http import HttpResponse
from django.template.loader import get_template
import smtplib
from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives
from django.utils.crypto import get_random_string

# Create your views here.

def home(request):
    return HttpResponse('<h1>Library</h1>')

def library(request):
    return render(request, 'web_app/index.html')

def titcategory(request):
    return render(request, 'web_app/titcategory.html')

def titlesearch(request):
    if request.method=='GET':
        val = request.GET["title"]
        cursor = connection.cursor()
        cursor.execute("""SELECT * FROM Books where title =%s """,[val])
        print(cursor.rowcount)
        row = cursor.fetchall()
        books=[]
        data={
            'books':None
        }
        a = cursor.rowcount
        if a!=0:
             for n in range(a):
                 books.append({
                     'isbnnumber':row[n][0],
                     'name':row[n][2],
                     'copyno':row[n][1],
                     'status':row[n][5],
                 })

             data = {
                'books':books,
            
             }
        return render(request,'web_app/titlesearch.html',data)

def authcategory(request):
    return render(request, 'web_app/authcategory.html')
    
def authsearch(request):
    if request.method=='GET':
        val = request.GET["auth"]
        cursor = connection.cursor()
        cursor.execute("""SELECT * FROM books where  auth_name= %s""", [val])
        print(cursor.rowcount)
        row = cursor.fetchall()
        books=[]
        data={
            'books':None
        }
        a = cursor.rowcount
        if a!=0:
             for n in range(a):
                 books.append({
                     'isbnnumber':row[n][0],
                     'name':row[n][2],
                     'copyNo':row[n][1],
                     'status':row[n][5],
                 })

             data = {
                'books':books,
            
             }
        return render(request,'authsearch.html',data)  