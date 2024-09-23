@implementation PIMsgImageBuffer

- (PIMsgImageBuffer)initWithBytes:(void *)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(int64_t)a6 bytesPerComponent:(unint64_t)a7 format:(int)a8 colorspace:(CGColorSpace *)a9
{
  uint64_t v9;
  void *v15;
  PIMsgImageBuffer *v16;

  v9 = *(_QWORD *)&a8;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a6 * a5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PIMsgImageBuffer initWithData:width:height:bytesPerRow:bytesPerComponent:format:colorspace:](self, "initWithData:width:height:bytesPerRow:bytesPerComponent:format:colorspace:", v15, a4, a5, a6, a7, v9, a9);

  return v16;
}

- (PIMsgImageBuffer)initWithData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 bytesPerRow:(int64_t)a6 bytesPerComponent:(unint64_t)a7 format:(int)a8 colorspace:(CGColorSpace *)space
{
  id v15;
  PIMsgImageBuffer *v16;
  PIMsgImageBuffer *v17;

  v15 = a3;
  v16 = -[PIMsgImageBuffer init](self, "init");
  v17 = v16;
  if (v16)
  {
    -[PIMsgImageBuffer setData:](v16, "setData:", v15);
    v17->elementByteSize = a7;
    v17->rowElements = a6 / a7;
    v17->width = a4;
    v17->height = a5;
    v17->format = a8;
    if (space)
      v17->bufferColorspace = CGColorSpaceRetain(space);
  }

  return v17;
}

- (void)dealloc
{
  CGColorSpace *bufferColorspace;
  objc_super v4;

  bufferColorspace = self->bufferColorspace;
  if (bufferColorspace)
    CGColorSpaceRelease(bufferColorspace);
  v4.receiver = self;
  v4.super_class = (Class)PIMsgImageBuffer;
  -[PIMsgImageBuffer dealloc](&v4, sel_dealloc);
}

- (void)bytes
{
  return -[NSMutableData mutableBytes](self->data, "mutableBytes");
}

- (id)image
{
  return (id)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", self->data, self->rowElements * self->elementByteSize, self->format, self->bufferColorspace, (double)self->width, (double)self->height);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)elementByteSize
{
  return self->elementByteSize;
}

- (unint64_t)rowElements
{
  return self->rowElements;
}

- (unint64_t)width
{
  return self->width;
}

- (unint64_t)height
{
  return self->height;
}

- (int)format
{
  return self->format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->data, 0);
}

@end
