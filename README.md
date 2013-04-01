## Information

<table>
<tr> 
<td>Package</td><td>critic</td>
</tr>
<tr>
<td>Description</td>
<td>Provides media critiques powered by ThePirateBay</td>
</tr>
<tr>
<td>Node Version</td>
<td>>= 0.4</td>
</tr>
</table>

## Usage

```coffee-script
critic = require 'critic'

# create a critic with a general category
# no category will pull from top torrents

critic.create "walking dead", (err, snob) ->
  snob.respond "finale"
  # outputs
  ###
    Its a graphic novel so I am not sure that they can deviate from the path set down less drama more zombie action. EZTV always solid uploads!  in the comic. Agreed, Rick is a bit shit though as a leader, although I think the idea is that he is carrying the weight of the zombie-apocalypse on his shoulders. The comic doesn't have as much talkie-talkie in it
  ###
```

## Examples

You can view more examples in the [example folder.](https://github.com/wearefractal/APPNAME/tree/master/examples)

## LICENSE

(MIT License)

Copyright (c) 2013 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
