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

        srv_ip_addr = '192.168.8.80'
        srv_port = 8080
        publicAuthURL = 'http://' + srv_ip_addr + ':' + str(srv_port) + '/auth/v1.0/'
        publicURL = 'http://' + srv_ip_addr + ':' + str(srv_port) + '/v1/AUTH_test'

        resp = requests.get(publicAuthURL,
                                headers={'X-Auth-User': 'test:tester',
                                         'X-Auth-Key': 'testing'})
        token = resp.headers['X-Auth-Token']

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
