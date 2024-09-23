@implementation FxContext

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FxContextPriv *priv;
  CGImage *v16;
  CGImage *var0;
  CGContext *v18;
  CGColorSpace *var3;
  objc_super v20;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v20.receiver);
  priv = self->_priv;
  if (priv)
  {
    switch(priv->var0)
    {
      case 0:
        FxDebugAssert(0, CFSTR("Invalid context type in [-FxContext dealloc]."), v9, v10, v11, v12, v13, v14, (char)v20.receiver);
        break;
      case 1:
        var0 = priv->var2.var0.var0;
        if (var0)
          CGImageRelease(var0);
        break;
      case 2:
        v18 = priv->var2.var0.var0;
        if (v18)
          CGContextRelease(v18);
        break;
      case 3:
        var3 = priv->var2.var2.var3;
        if (var3)
          CGColorSpaceRelease(var3);
        break;
      case 4:
      case 5:
      case 6:
        v16 = priv->var2.var0.var0;
        if (v16)

        break;
      default:
        break;
    }
    free(self->_priv);
  }
  v20.receiver = self;
  v20.super_class = (Class)FxContext;
  -[FxContext dealloc](&v20, sel_dealloc);
}

- (id)initForCGImageWithOptions:(id)a3
{
  FxContext *v4;
  FxContextPriv *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FxContext;
  v4 = -[FxContext init](&v7, sel_init);
  if (v4)
  {
    v5 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5->var0 = 1;
      v5->var2.var2.var0 = 0;
      v4->_priv->var1 = a3;
    }
  }
  return v4;
}

- (FxContext)initWithCGContext:(CGContext *)a3 options:(id)a4
{
  FxContext *v6;
  FxContextPriv *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FxContext;
  v6 = -[FxContext init](&v9, sel_init);
  if (v6)
  {
    v7 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v6->_priv = v7;
    if (v7)
    {
      v7->var0 = 2;
      v6->_priv->var2.var2.var0 = (unint64_t)CGContextRetain(a3);
      v6->_priv->var1 = a4;
    }
  }
  return v6;
}

- (id)initForGLTextureWithOptions:(id)a3
{
  FxContext *v4;
  FxContextPriv *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FxContext;
  v4 = -[FxContext init](&v7, sel_init);
  if (v4)
  {
    v5 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5->var0 = 3;
      v5->var2.var2.var0 = 0;
      *(_OWORD *)(&v4->_priv->var2.var5 + 1) = *MEMORY[0x1E0C9D820];
      v4->_priv->var2.var2.var2 = 0;
      v4->_priv->var2.var2.var3 = 0;
      v4->_priv->var1 = a3;
    }
  }
  return v4;
}

- (FxContext)initWithFxBitmapImage:(id)a3 options:(id)a4
{
  FxContext *v6;
  FxContextPriv *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FxContext;
  v6 = -[FxContext init](&v9, sel_init);
  if (v6)
  {
    v7 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v6->_priv = v7;
    if (v7)
    {
      v7->var0 = 5;
      v6->_priv->var2.var2.var0 = (unint64_t)a3;
      v6->_priv->var1 = a4;
    }
  }
  return v6;
}

- (id)initForCIImageWithOptions:(id)a3
{
  FxContext *v4;
  FxContextPriv *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FxContext;
  v4 = -[FxContext init](&v7, sel_init);
  if (v4)
  {
    v5 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5->var0 = 6;
      v5->var2.var2.var0 = 0;
      v4->_priv->var1 = a3;
    }
  }
  return v4;
}

+ (id)contextForCGImageWithOptions:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForCGImageWithOptions:", a3);
}

+ (id)contextWithCGContext:(CGContext *)a3 options:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCGContext:options:", a3, a4);
}

+ (id)contextForGLTextureWithOptions:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForGLTextureWithOptions:", a3);
}

+ (id)contextWithFxBitmapImage:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFxBitmapImage:options:", a3, a4);
}

+ (id)contextForCIImageWithOptions:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForCIImageWithOptions:", a3);
}

- (void)setCGImage:(CGImage *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *var0;
  char v11;

  if (FxDebugAssert(self->_priv->var0 == 1, CFSTR("Non-CGImage FxContext in -setCGImage:."), (uint64_t)a3, v3, v4, v5, v6, v7, v11))
  {
    var0 = self->_priv->var2.var0.var0;
    if (var0)
      CGImageRelease(var0);
    self->_priv->var2.var2.var0 = (unint64_t)CGImageRetain(a3);
  }
}

- (CGImage)cgImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 1, CFSTR("Non-CGImage FxContext in -cgImage:."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var0.var0;
  else
    return 0;
}

- (CGContext)cgContext
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 2, CFSTR("Non-CGContext FxContext in -cgContext."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var0.var0;
  else
    return 0;
}

- (void)setGLTexture:(unint64_t)a3 size:(CGSize)a4 flipped:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat height;
  CGFloat width;
  FxContextPriv *priv;
  CGColorSpace *var3;
  FxContextPriv *v17;
  CGColorSpace *v18;
  char v19;

  height = a4.height;
  width = a4.width;
  if (FxDebugAssert(self->_priv->var0 == 3, CFSTR("Non-GLTexture FxContext in -setGLTexture:size:flipped:colorSpace."), a3, a5, (uint64_t)a6, v6, v7, v8, v19))
  {
    priv = self->_priv;
    var3 = priv->var2.var2.var3;
    if (var3)
    {
      CGColorSpaceRelease(var3);
      priv = self->_priv;
    }
    priv->var2.var2.var0 = a3;
    v17 = self->_priv;
    v17->var2.var2.var1.width = width;
    v17->var2.var2.var1.height = height;
    v17->var2.var2.var2 = a5;
    if (a6)
      v18 = CGColorSpaceRetain(a6);
    else
      v18 = 0;
    self->_priv->var2.var2.var3 = v18;
  }
}

- (unint64_t)glTexture
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 3, CFSTR("Non-GLTexture FxContext in -glTexture."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var2.var0;
  else
    return 0;
}

- (CGSize)glTextureSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  double width;
  double height;
  FxContextPriv *priv;
  char v13;
  CGSize result;

  v9 = FxDebugAssert(self->_priv->var0 == 3, CFSTR("Non-GLTexture FxContext in -glTextureSize."), v2, v3, v4, v5, v6, v7, v13);
  width = 0.0;
  height = 0.0;
  if (v9)
  {
    priv = self->_priv;
    width = priv->var2.var2.var1.width;
    height = priv->var2.var2.var1.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)glTextureIsFlipped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  char v11;

  v9 = FxDebugAssert(self->_priv->var0 == 3, CFSTR("Non-GLTexture FxContext in -glTextureIsFlipped."), v2, v3, v4, v5, v6, v7, v11);
  if (v9)
    LOBYTE(v9) = self->_priv->var2.var2.var2;
  return v9;
}

- (CGColorSpace)glTextureColorSpace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 3, CFSTR("Non-GLTexture FxContext in -glTextureColorSpace."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var2.var3;
  else
    return 0;
}

- (id)derivedCIContext
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 4, CFSTR("Non-GLContext FxContext in -cglPixelFormat."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var0.var0;
  else
    return 0;
}

- (void)setCIImage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *var0;
  char v11;

  if (FxDebugAssert(self->_priv->var0 == 6, CFSTR("Non-CIImage FxContext in -setCIImage:."), (uint64_t)a3, v3, v4, v5, v6, v7, v11))
  {
    var0 = self->_priv->var2.var0.var0;
    if (var0)

    self->_priv->var2.var2.var0 = (unint64_t)a3;
  }
}

- (id)ciImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 6, CFSTR("Non-CIImage FxContext in -ciImage:."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var0.var0;
  else
    return 0;
}

- (id)bitmap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v10;

  if (FxDebugAssert(self->_priv->var0 == 5, CFSTR("Non-Bitmap FxContext in -bitmap."), v2, v3, v4, v5, v6, v7, v10))return self->_priv->var2.var0.var0;
  else
    return 0;
}

- (void)drawFxSample:(id)a3 withRegionOfInterest:(id)a4
{
  objc_msgSend(a3, "setRegionOfInterest:", a4);
  objc_msgSend(a3, "setContext:", self);
  objc_msgSend(a3, "evaluateWithOptions:", 0);
}

- (int)contextType
{
  return self->_priv->var0;
}

- (id)options
{
  return self->_priv->var1;
}

- (void)setOptions:(id)a3
{
  id var1;

  var1 = self->_priv->var1;
  if (var1)

  self->_priv->var1 = a3;
}

@end
