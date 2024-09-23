@implementation PXCGImage

- (PXCGImage)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCGImage.m"), 16, CFSTR("%s is not available as initializer"), "-[PXCGImage init]");

  abort();
}

- (PXCGImage)initWithCGImage:(CGImage *)a3
{
  PXCGImage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCGImage;
  v4 = -[PXCGImage init](&v6, sel_init);
  if (v4)
    v4->_image = CGImageRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PXCGImage;
  -[PXCGImage dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return CFHash(-[PXCGImage image](objc_retainAutorelease(self), "image"));
}

- (BOOL)isEqual:(id)a3
{
  PXCGImage *v4;
  CGImage *v5;
  BOOL v6;

  v4 = (PXCGImage *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PXCGImage image](objc_retainAutorelease(v4), "image");
      v6 = v5 == -[PXCGImage image](objc_retainAutorelease(self), "image");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (CGImage)image
{
  return self->_image;
}

@end
