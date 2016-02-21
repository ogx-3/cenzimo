from django.conf.urls import include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin

urlpatterns = [
    # Examples:
    url(r'^$', 'webs.views.home', name='home'),
    url(r'^about$', 'webs.views.about', name='about'),
    url(r'^service$', 'webs.views.service', name='service'),
    url(r'^contact$', 'webs.views.contact', name='contact'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

