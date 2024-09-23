@implementation _UIImageIOSurfaceContent

- (_UIImageIOSurfaceContent)initWithIOSurface:(__IOSurface *)a3 scale:(double)a4
{
  CFTypeID v8;
  _UIImageIOSurfaceContent *v9;
  void *v11;
  void *v12;
  objc_super v13;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1465, CFSTR("Need an ioSurfaceRef"));

  }
  v8 = CFGetTypeID(a3);
  if (v8 != IOSurfaceGetTypeID())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1466, CFSTR("ioSurfaceRef passed is not an IOSurfaceRef"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageIOSurfaceContent;
  v9 = -[_UIImageContent initWithScale:](&v13, sel_initWithScale_, a4);
  if (v9)
    v9->_surfaceRef = (__IOSurface *)CFRetain(a3);
  return v9;
}

- (_UIImageIOSurfaceContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1477, CFSTR("You need to use -initWithIOSurface:scale:"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_surfaceRef);
  v3.receiver = self;
  v3.super_class = (Class)_UIImageIOSurfaceContent;
  -[_UIImageIOSurfaceContent dealloc](&v3, sel_dealloc);
}

- (BOOL)isHDR
{
  return 0;
}

- (id)makeSDRVersion
{
  __IOSurface *surfaceRef;
  void *v4;
  CGImage *CGImage;
  _UIImageCGImageContent *v6;
  _UIImageCGImageContent *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[_UIImageIOSurfaceContent isHDR](self, "isHDR"))
    return self;
  surfaceRef = self->_surfaceRef;
  v9 = CFSTR("dst-gamut");
  v10[0] = &unk_1E1A977B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGImage = (CGImage *)_UIRenderingBufferCreateCGImage(surfaceRef, v4);

  v6 = [_UIImageCGImageContent alloc];
  -[_UIImageContent scale](self, "scale");
  v7 = -[_UIImageCGImageContent initWithCGImage:scale:](v6, "initWithCGImage:scale:", CGImage);
  CGImageRelease(CGImage);
  return v7;
}

- (id)imageRendererFormat
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageIOSurfaceContent;
  -[_UIImageContent imageRendererFormat](&v3, sel_imageRendererFormat);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)typeName
{
  return CFSTR("IOSurface");
}

- (__IOSurface)IOSurface
{
  return self->_surfaceRef;
}

- (BOOL)isIOSurface
{
  return 1;
}

- (CGSize)sizeInPixels
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)IOSurfaceGetWidth(self->_surfaceRef);
  Height = (double)IOSurfaceGetHeight(self->_surfaceRef);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  __IOSurface **v4;
  BOOL v5;
  objc_super v7;

  v4 = (__IOSurface **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageIOSurfaceContent;
  if (-[_UIImageContent isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_surfaceRef == v4[5];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_surfaceRef;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOSurfaceRef:%p"), self->_surfaceRef);
}

- (BOOL)prefersProvidingNonCGImageContentsDirectlyForRendering
{
  return 1;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  CGContextTranslateCTM(a5, 0.0, a3.height);
  CGContextScaleCTM(a5, 1.0, -1.0);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  CGImage *CGImage;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  CGImage = (CGImage *)_UIRenderingBufferCreateCGImage(self->_surfaceRef, 0);
  v12.origin.x = v9;
  v12.origin.y = v10;
  v12.size.width = width;
  v12.size.height = height;
  CGContextDrawImage(a5, v12, CGImage);
  CGImageRelease(CGImage);
}

@end
