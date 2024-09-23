@implementation TXRImageIndependent

- (TXRImageIndependent)initWithImage:(id)a3 dimensions:(unint64_t)a4 pixelFormat:(unint64_t)a5 alphaInfo:
{
  __int128 v5;
  id v9;
  TXRImageIndependent *v10;
  TXRImageIndependent *v11;
  uint64_t v12;
  TXRBuffer *buffer;
  __int128 v15;
  objc_super v16;

  v15 = v5;
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TXRImageIndependent;
  v10 = -[TXRImageIndependent init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    *(_OWORD *)v10->_dimensions = v15;
    v10->_pixelFormat = a4;
    v10->_alphaInfo = a5;
    v10->super._bytesPerRow = objc_msgSend(v9, "bytesPerRow");
    v11->super._bytesPerImage = objc_msgSend(v9, "bytesPerImage");
    objc_msgSend(v9, "buffer");
    v12 = objc_claimAutoreleasedReturnValue();
    buffer = v11->super._buffer;
    v11->super._buffer = (TXRBuffer *)v12;

    v11->super._offset = objc_msgSend(v9, "offset");
  }

  return v11;
}

- (TXRImageIndependent)initWithImage:(id)a3 dimensions:(unint64_t)a4 pixelFormat:
{
  return -[TXRImageIndependent initWithImage:dimensions:pixelFormat:alphaInfo:](self, "initWithImage:dimensions:pixelFormat:alphaInfo:", a3, a4, 0);
}

- (TXRImageIndependent)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(unint64_t)a5 bytesPerRow:(unint64_t)a6 bytesPerImage:(id)a7 buffer:(unint64_t)a8 offset:
{
  __int128 v8;
  id v16;
  TXRImageIndependent *v17;
  TXRImageIndependent *v18;
  __int128 v20;
  objc_super v21;

  v20 = v8;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TXRImageIndependent;
  v17 = -[TXRImageIndependent init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    *(_QWORD *)v17->_dimensions = v20;
    *(_DWORD *)&v17->_dimensions[8] = DWORD2(v20);
    v17->_pixelFormat = a3;
    v17->_alphaInfo = a4;
    v17->super._bytesPerRow = a5;
    v17->super._bytesPerImage = a6;
    objc_storeStrong((id *)&v17->super._buffer, a7);
    v18->super._offset = a8;
  }

  return v18;
}

- (TXRImageIndependent)initWithCGImage:(CGImage *)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  TXRDefaultBufferAllocator *v10;
  id v11;
  TXRImageIndependent *v12;

  v10 = (TXRDefaultBufferAllocator *)a4;
  v11 = a5;
  if (!v10)
    v10 = objc_alloc_init(TXRDefaultBufferAllocator);
  +[TXRParserImageIO decodeCGImage:desiredPixelFormat:bufferAllocator:options:error:](TXRParserImageIO, "decodeCGImage:desiredPixelFormat:bufferAllocator:options:error:", a3, 0, v10, v11, a6);
  v12 = (TXRImageIndependent *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (TXRImageIndependent)initWithCGImage:(CGImage *)a3 pixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7
{
  TXRDefaultBufferAllocator *v12;
  id v13;
  TXRImageIndependent *v14;
  id v15;
  double v16;

  v12 = (TXRDefaultBufferAllocator *)a5;
  v13 = a6;
  if (!v12)
    v12 = objc_alloc_init(TXRDefaultBufferAllocator);
  +[TXRParserImageIO decodeCGImage:desiredPixelFormat:bufferAllocator:options:error:](TXRParserImageIO, "decodeCGImage:desiredPixelFormat:bufferAllocator:options:error:", a3, a4, v12, v13, a7);
  v14 = (TXRImageIndependent *)objc_claimAutoreleasedReturnValue();

  if (v14 && v14->_pixelFormat != a4)
  {
    v15 = +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:", v14, a4, v12, 0, 0, a7);
    -[TXRImageIndependent dimensions](v14, "dimensions");
    v14 = -[TXRImageIndependent initWithImage:dimensions:pixelFormat:alphaInfo:](v14, "initWithImage:dimensions:pixelFormat:alphaInfo:", v15, a4, -[TXRImageIndependent alphaInfo](v14, "alphaInfo"), v16);

  }
  return v14;
}

- (TXRImageIndependent)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(id)a5 bufferAllocator:
{
  __int128 v5;
  id v9;
  TXRImageIndependent *v10;
  TXRImageIndependent *v11;
  unint64_t v12;
  uint64_t v13;
  TXRBuffer *buffer;
  __int128 v16;
  objc_super v17;

  v16 = v5;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TXRImageIndependent;
  v10 = -[TXRImageIndependent init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    *(_OWORD *)v10->_dimensions = v16;
    v10->_pixelFormat = a3;
    v10->_alphaInfo = a4;
    v10->super._bytesPerRow = +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:](TXRPixelFormatInfo, "packedMemoryLayoutForFormat:dimensions:", a3);
    v11->super._bytesPerImage = v12;
    v13 = objc_msgSend(v9, "newBufferWithLength:", v12 * DWORD2(v16));
    buffer = v11->super._buffer;
    v11->super._buffer = (TXRBuffer *)v13;

    v11->super._offset = 0;
  }

  return v11;
}

- (BOOL)exportToURL:(id)a3 uttype:(__CFString *)a4 error:(id *)a5
{
  return +[TXRParserImageIO exportImage:url:uttype:colorSpace:orientation:error:](TXRParserImageIO, "exportImage:url:uttype:colorSpace:orientation:error:", self, a3, a4, 0, 1, a5);
}

- (CGImage)newCGImageWithColorSpace:(CGColorSpace *)a3 error:(id *)a4
{
  return +[TXRParserImageIO newCGImageFromImage:colorSpace:error:](TXRParserImageIO, "newCGImageFromImage:colorSpace:error:", self, a3, a4);
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setAlphaInfo:(unint64_t)a3
{
  self->_alphaInfo = a3;
}

- (__n128)dimensions
{
  return a1[6];
}

@end
