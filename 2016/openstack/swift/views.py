import requests

from django.shortcuts import render

from django.views.generic.base import (
    TemplateView,
    TemplateResponseMixin,
    ContextMixin)

from django.views.generic import View

# Create your views here.
class RootView(ContextMixin, TemplateResponseMixin, View):
    '''View that will be display root template
    '''
    template_name = "root.html"

    def get(self, request, *args, **kwargs):
        context = self.get_context_data(**kwargs)
        context['year'] = '2016'
        context['title'] = ''

        return self.render_to_response(context)


class SwiftView(ContextMixin, TemplateResponseMixin, View):
    '''View to display container's objects
    '''
    template_name = "swift.html"

    def get(self, request, *args, **kwargs):
        context = self.get_context_data(**kwargs)
        context['year'] = '2016'
        context['title'] = 'Swift'

        publicURL = 'http://192.168.8.80:8080/v1/AUTH_test'
        token = 'AUTH_tkd749c417e2c049af898f0960f5230958'

        current_container = 'current'
        archive_container = 'archive'

        resp_current = requests.get(publicURL + "/" + current_container,
                                    headers={'X-Auth-Token': token})
        # print(resp_current.status_code)
        if resp_current.status_code == 404:
            context['current_image'] = None
        elif resp_current.text:
            context['current_image'] = publicURL + "/" + current_container + "/" \
                                   + resp_current.text


        resp_archive = requests.get(publicURL + "/" + archive_container,
                                    headers={'X-Auth-Token': token})
        # print(resp_archive.status_code)
        if resp_archive.status_code == 404:
            context['archived_images'] = None
        else:
            context['archived_images'] = list()
            archived_images = resp_archive.text.split()
            for i in archived_images:
                context['archived_images'].append(
                    publicURL + "/" + archive_container + "/" + i)
            context['archived_images'].sort(reverse=True)

        return self.render_to_response(context)

