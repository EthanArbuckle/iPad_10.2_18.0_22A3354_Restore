@implementation FxBitmapImage

- (FxBitmapImage)initWithData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7
{
  CGFloat height;
  CGFloat width;
  FxBitmapImage *v13;
  FxBitmapImagePriv *v14;
  id v15;
  FxBitmapImagePriv *priv;
  objc_super v18;

  height = a5.height;
  width = a5.width;
  v18.receiver = self;
  v18.super_class = (Class)FxBitmapImage;
  v13 = -[FxBitmapImage init](&v18, sel_init);
  if (v13)
  {
    v14 = (FxBitmapImagePriv *)malloc_type_calloc(1uLL, 0x48uLL, 0x10A0040171D60F0uLL);
    v13->_priv = v14;
    if (v14)
    {
      v15 = a3;
      priv = v13->_priv;
      priv->var0 = v15;
      priv->var1 = a4;
      priv->var2.width = width;
      priv->var2.height = height;
      priv->var3 = a6;
      v13->_priv->var4 = CGColorSpaceRetain(a7);
      v13->_priv->var7 = CGDataProviderCreateWithData(v13->_priv->var0, -[FxBitmapImage bytes](v13, "bytes"), (unint64_t)(v13->_priv->var2.height * (double)v13->_priv->var1), (CGDataProviderReleaseDataCallback)MyDataProviderReleaser);
      CGDataProviderRetain(v13->_priv->var7);
    }
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxBitmapImagePriv *priv;
  objc_super v10;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var4)
    {
      CGColorSpaceRelease(priv->var4);
      priv = self->_priv;
    }
    if (priv->var5)
    {
      CGContextRelease(priv->var5);
      priv = self->_priv;
    }
    if (priv->var6)
    {
      CGImageRelease(priv->var6);
      priv = self->_priv;
    }
    if (priv->var7)
    {
      CGDataProviderRelease(priv->var7);
      priv = self->_priv;
    }
    free(priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxBitmapImage;
  -[FxBitmapImage dealloc](&v10, sel_dealloc);
}

+ (id)bitmapWithData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:bytesPerRow:size:format:colorSpace:", a3, a4, *(_QWORD *)&a6, a7, a5.width, a5.height);
}

+ (id)bitmapWithSize:(CGSize)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5
{
  double width;
  double v6;

  width = a3.width;
  v6 = 16.0;
  if (!a4)
    v6 = 4.0;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:bytesPerRow:size:format:colorSpace:", objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (unint64_t)(a3.height* (double)((unint64_t)(width * v6 + 7.0) & 0xFFFFFFFFFFFFFFF8))), (unint64_t)(width * v6 + 7.0) & 0xFFFFFFFFFFFFFFF8, *(_QWORD *)&a4, a5, width, a3.height);
}

- (id)data
{
  return self->_priv->var0;
}

- (void)bytes
{
  return (void *)objc_msgSend(self->_priv->var0, "mutableBytes");
}

- (unint64_t)bytesPerRow
{
  return self->_priv->var1;
}

- (CGSize)size
{
  FxBitmapImagePriv *priv;
  double width;
  double height;
  CGSize result;

  priv = self->_priv;
  width = priv->var2.width;
  height = priv->var2.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)pixelFormat
{
  return self->_priv->var3;
}

- (CGColorSpace)colorSpace
{
  return self->_priv->var4;
}

- (CGContext)cgContext
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxBitmapImagePriv *priv;
  int var3;
  BOOL v11;
  size_t v12;
  uint32_t v13;
  char v15;

  priv = self->_priv;
  if (!priv->var5)
  {
    var3 = priv->var3;
    if (FxDebugAssert(var3 == 0, CFSTR("32-bit-float RGBA not supported yet"), v2, v3, v4, v5, v6, v7, v15))
    {
      v11 = var3 == 0;
      if (var3)
        v12 = 32;
      else
        v12 = 8;
      if (v11)
        v13 = 2;
      else
        v13 = 257;
      self->_priv->var5 = CGBitmapContextCreate(-[FxBitmapImage bytes](self, "bytes"), (unint64_t)self->_priv->var2.width, (unint64_t)self->_priv->var2.height, v12, self->_priv->var1, self->_priv->var4, v13);
      CGContextRetain(self->_priv->var5);
    }
  }
  return self->_priv->var5;
}

- (CGImage)cgImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxBitmapImagePriv *priv;
  int var3;
  int v11;
  size_t v12;
  size_t v13;
  CGBitmapInfo v14;
  char decode;

  priv = self->_priv;
  if (!priv->var6)
  {
    var3 = priv->var3;
    v11 = FxDebugAssert(var3 == 0, CFSTR("32-bit-float RGBA not supported yet"), v2, v3, v4, v5, v6, v7, decode);
    priv = self->_priv;
    if (v11)
    {
      if (var3)
        v12 = 128;
      else
        v12 = 32;
      if (var3)
        v13 = 32;
      else
        v13 = 8;
      if (var3)
        v14 = 257;
      else
        v14 = 2;
      self->_priv->var6 = CGImageCreate((unint64_t)priv->var2.width, (unint64_t)priv->var2.height, v13, v12, priv->var1, priv->var4, v14, priv->var7, 0, 1, kCGRenderingIntentDefault);
      CGImageRetain(self->_priv->var6);
      priv = self->_priv;
    }
  }
  return priv->var6;
}

@end
