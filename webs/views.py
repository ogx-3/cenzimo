from django.shortcuts import render
from django.http import HttpResponse
from django.http import HttpResponseRedirect,HttpResponseNotAllowed
from django.shortcuts import render_to_response 
from django.template import RequestContext, loader
# Create your views here.

class Views():
  tempalte_name = 'webs/index.html'

  def home(self):
    pass

def home(request):
  return render_to_response('webs/index.html')

def about(request):
  return render_to_response('webs/about.html')

def service(request):
  return render_to_response('webs/services.html')

def contact(request):
  return render_to_response('webs/contact.html')
