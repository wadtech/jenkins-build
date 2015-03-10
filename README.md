# Jenkins Latest RSS Status Feed Reader Thing

Little sinatra app to read the Jenkins latest rss feed and stick it in a table.

Example upstart file included.

## Environement

jenkins-build requires the following environement variables

    JENKINS_HOST = url with port to your jenkins install
    JENKINS_USER = jenkins user for authentication
    JENKINS_KEY  = jenkins API key generated from the user page

To get started:

    bundle
    ruby server.rb

visit http://localhost:4567 in your browser and behold the wonder.

# License

Copyright (c) 2015 Peter Mellett

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
