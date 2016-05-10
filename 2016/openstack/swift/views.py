import requests

from django.shortcuts import render

from django.views.generic.base import (
    TemplateView,
    TemplateResponseMixin,
    ContextMixin)

from django.views.generic import View

# Create your views here.
class SwiftView(ContextMixin, TemplateResponseMixin, View):
    '''This is same as DashBoardTemplateView but built from scratch
    '''
    def get(self, request, *args, **kwargs):
        context = self.get_context_data(**kwargs)
        context['title'] = 'Swift'
        publicURL = 'http://192.168.8.80:8080/v1/AUTH_test'
        token = 'AUTH_tkd749c417e2c049af898f0960f5230958'

        current_container = 'p-current'
        archive_container = 'p-archive'

        resp_current = requests.get(publicURL + "/" + current_container,
                            headers={'X-Auth-Token': token})
        # print(resp_current.status_code)
        context['current_image'] = publicURL + "/" + current_container + "/" + resp_current.text

        resp_archive = requests.get(publicURL + "/" + archive_container,
                            headers={'X-Auth-Token': token})
        # print(resp_archive.text.split())
        context['archived_images'] = list()
        archived_images = resp_archive.text.split()
        for i in archived_images:
            context['archived_images'].append(publicURL + "/" + archive_container + "/" + i)
        return self.render_to_response(context)

