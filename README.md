# BitPacker.js
[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg)](http://standardjs.com/)

BitPacker.js is a very fast and efficient way of converting pixels from something like [ImageData()](https://developer.mozilla.org/en-US/docs/Web/API/ImageData) (4 0-255 Uint8Clamped values) into a single 32-bit integer (and vice versa).

### Install:
`npm install bitpacker`

### Usage:
```javascript
const bitPacker = new BitPacker() // Create a new bitpacker object

// Get a pixel value from an image, this would be a "medium gray"
const red = 150
const green = 150
const blue = 150
const alpha = 255 // Fully opaque

// Now convert it to a single packed integer
const packedPixel = bitPacker.packPixel(red, green, blue, alpha) // equals `-6908266`, it's negative when viewed in "normal" JS but inside a uint32Array it will be correct

// And we can do the opposite as well:
const packedPixel2 = -328966 // This is an almost entirely black pixel, it's negative when viewed in "normal" JS but inside a uint32Array it will be correct

const unpackedPixelArray = bitPacker.unpackPixel(packedPixel2) // equals `[250, 250, 250, 255]`
```

This is mainly used so that you can "view" the data from [ImageData()](https://developer.mozilla.org/en-US/docs/Web/API/ImageData) as a [`Uint32Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays#Typed_array_views) instead of a [`Uint8ClampedArray`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays#Typed_array_views) of RGBA values. This means you can loop over the whole image 4x faster, and will only need to unpack and manipulate the pixels you need, and quickly repack them.

In one application this ended up with close to a 3x speedup when processing image data.


### License:
The MIT License (MIT)

See LICENSE.txt for details
