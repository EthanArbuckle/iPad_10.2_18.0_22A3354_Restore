@implementation WBSCGImage

+ (id)imageWithCGImage:(CGImage *)a3
{
  _QWORD *v4;

  if (a3)
  {
    v4 = objc_alloc_init((Class)objc_opt_class());
    v4[1] = CGImageRetain(a3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)imageByAdoptingCGImage:(CGImage *)a3
{
  _QWORD *v4;

  if (!a3)
    return 0;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)WBSCGImage;
  -[WBSCGImage dealloc](&v3, sel_dealloc);
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

@end
