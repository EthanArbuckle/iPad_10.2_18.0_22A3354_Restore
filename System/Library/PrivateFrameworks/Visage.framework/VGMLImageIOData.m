@implementation VGMLImageIOData

- (VGMLImageIOData)initWithCVPixelBufferRef:(__CVBuffer *)a3
{
  VGMLImageIOData *v4;
  VGMLImageIOData *v5;
  VGMLImageIOData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VGMLImageIOData;
  v4 = -[VGMLImageIOData init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pixelBuffer = a3;
    CVPixelBufferRetain(a3);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VGMLImageIOData;
  -[VGMLImageIOData dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)cvPixelBufferRef
{
  return self->_pixelBuffer;
}

- (__CVBuffer)resizeToWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return resizeCVPixelBuffer(self->_pixelBuffer, a4, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  +[VGCoderUtilities encodePixelBuffer:forKey:encoder:](VGCoderUtilities, "encodePixelBuffer:forKey:encoder:", self->_pixelBuffer, CFSTR("pixelBuffer"), a3);
}

- (VGMLImageIOData)initWithCoder:(id)a3
{
  __CVBuffer *v4;
  VGMLImageIOData *v5;

  v4 = +[VGCoderUtilities decodePixelBufferForKey:decoder:](VGCoderUtilities, "decodePixelBufferForKey:decoder:", CFSTR("pixelBuffer"), a3);
  v5 = -[VGMLImageIOData initWithCVPixelBufferRef:](self, "initWithCVPixelBufferRef:", v4);
  CVPixelBufferRelease(v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = checkEqualPixelBuffers(-[VGMLImageIOData cvPixelBufferRef](self, "cvPixelBufferRef"), (__CVBuffer *)objc_msgSend(v5, "cvPixelBufferRef"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)debugQuickLookObject
{
  return (id)objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", self->_pixelBuffer);
}

@end
