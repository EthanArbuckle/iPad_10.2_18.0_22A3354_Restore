@implementation QLPlatformImage

- (void)dealloc
{
  void *v3;
  void (**v4)(void);
  CGImage *cgImage;
  objc_super v6;

  -[QLPlatformImage cleanupDataBlock](self, "cleanupDataBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[QLPlatformImage cleanupDataBlock](self, "cleanupDataBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[QLPlatformImage setCleanupDataBlock:](self, "setCleanupDataBlock:", 0);
  }
  cgImage = self->_cgImage;
  if (cgImage)
    CGImageRelease(cgImage);
  v6.receiver = self;
  v6.super_class = (Class)QLPlatformImage;
  -[QLPlatformImage dealloc](&v6, sel_dealloc);
}

- (void)setCGImage:(CGImage *)a3
{
  CGImage *cgImage;
  double Width;

  cgImage = self->_cgImage;
  if (cgImage != a3)
  {
    CGImageRelease(cgImage);
    self->_cgImage = CGImageRetain(a3);
    Width = (double)CGImageGetWidth(a3);
    -[QLPlatformImage setSize:](self, "setSize:", Width, (double)CGImageGetHeight(a3));
  }
}

- (CGImage)CGImage
{
  return self->_cgImage;
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5
{
  uint64_t v5;
  QLPlatformImage *v8;

  v5 = *(_QWORD *)&a5;
  v8 = objc_alloc_init(QLPlatformImage);
  -[QLPlatformImage setCGImage:](v8, "setCGImage:", a3);
  -[QLPlatformImage setScale:](v8, "setScale:", a4);
  -[QLPlatformImage setOrientation:](v8, "setOrientation:", v5);
  return v8;
}

+ (id)imageWithUIImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_retainAutorelease(v4), objc_msgSend(v6, "CGImage")))
  {
    v7 = objc_msgSend(v6, "imageOrientation");
    if (v7 > 7)
      v8 = 0;
    else
      v8 = dword_20D4DF400[v7];
    v10 = objc_retainAutorelease(v6);
    v11 = objc_msgSend(v10, "CGImage");
    objc_msgSend(v10, "scale");
    objc_msgSend(a1, "imageWithCGImage:scale:orientation:", v11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIImage)UIImage
{
  void *v3;
  CGImage *v4;
  double v5;
  double v6;
  unsigned int v7;
  uint64_t v8;

  v3 = (void *)QLTImageClassWithError();
  v4 = -[QLPlatformImage CGImage](self, "CGImage");
  -[QLPlatformImage scale](self, "scale");
  v6 = v5;
  v7 = -[QLPlatformImage orientation](self, "orientation") - 2;
  if (v7 > 6)
    v8 = 0;
  else
    v8 = dword_20D4DF420[v7];
  return (UIImage *)objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, v8, v6);
}

- (id)cleanupDataBlock
{
  return self->_cleanupDataBlock;
}

- (void)setCleanupDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupDataBlock, 0);
}

@end
