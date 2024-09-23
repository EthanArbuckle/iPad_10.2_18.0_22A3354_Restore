@implementation FxBitmap

- (unint64_t)_packedRowBytes
{
  unint64_t v3;
  objc_super v5;
  objc_super v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)FxBitmap;
  -[FxImage imageInfo](&v6, sel_imageInfo);
  v5.receiver = self;
  v5.super_class = (Class)FxBitmap;
  v3 = -[FxImage depth](&v5, sel_depth);
  return 4 * v7 * (v3 >> 3);
}

- (FxBitmap)init
{
  FxBitmap *result;
  FxBitmap *v3;
  FxBitmapPriv *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FxBitmap;
  result = -[FxImage init](&v5, sel_init);
  if (result)
  {
    v3 = result;
    v4 = (FxBitmapPriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEB90DD3uLL);
    v3->_bitmapPriv = v4;
    if (v4)
      return v3;
    else
      return 0;
  }
  return result;
}

- (FxBitmap)initWithInfo:(id *)a3
{
  __int128 v4;
  __int128 v5;
  FxBitmap *v6;
  FxBitmap *v7;
  FxBitmapPriv *bitmapPriv;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  BOOL v12;
  objc_super v14;
  _OWORD v15[4];
  double var8;

  v4 = *(_OWORD *)&a3->var6;
  v15[2] = *(_OWORD *)&a3->var4;
  v15[3] = v4;
  var8 = a3->var8;
  v5 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v5;
  v14.receiver = self;
  v14.super_class = (Class)FxBitmap;
  v6 = -[FxImage initWithInfo:](&v14, sel_initWithInfo_, v15);
  v7 = v6;
  if (v6)
  {
    bitmapPriv = v6->_bitmapPriv;
    if (bitmapPriv
      || (bitmapPriv = (FxBitmapPriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEB90DD3uLL),
          (v7->_bitmapPriv = bitmapPriv) != 0))
    {
      bitmapPriv->var2 = 1;
      v9 = -[FxBitmap _packedRowBytes](v7, "_packedRowBytes");
      v7->_bitmapPriv->var1 = v9;
      v10 = a3->var1 * v9;
      if (v10 <= 0x32000)
        v11 = a3->var1 * v9;
      else
        v11 = (v10 + 0xFFFF) & 0xFFFFFFFFFFFF0000;
      v7->_bitmapPriv->var0 = malloc_type_malloc(v11, 0x61D1B2F2uLL);
      if (v7->_bitmapPriv->var0)
        v12 = 1;
      else
        v12 = guaranteeMemory == 0;
      if (!v12)
      {
        guaranteeMemory(v11);
        v7->_bitmapPriv->var0 = malloc_type_malloc(v11, 0x89ED93C5uLL);
      }
    }
  }
  return v7;
}

- (FxBitmap)initWithInfo:(id *)a3 andData:(void *)a4
{
  __int128 v5;
  __int128 v6;
  FxBitmap *v7;
  FxBitmap *v8;
  FxBitmapPriv *bitmapPriv;
  objc_super v11;
  _OWORD v12[4];
  double var8;

  v5 = *(_OWORD *)&a3->var6;
  v12[2] = *(_OWORD *)&a3->var4;
  v12[3] = v5;
  var8 = a3->var8;
  v6 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v6;
  v11.receiver = self;
  v11.super_class = (Class)FxBitmap;
  v7 = -[FxImage initWithInfo:](&v11, sel_initWithInfo_, v12);
  v8 = v7;
  if (v7)
  {
    bitmapPriv = v7->_bitmapPriv;
    if (bitmapPriv
      || (bitmapPriv = (FxBitmapPriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEB90DD3uLL),
          (v8->_bitmapPriv = bitmapPriv) != 0))
    {
      bitmapPriv->var0 = a4;
      v8->_bitmapPriv->var2 = 0;
      v8->_bitmapPriv->var1 = -[FxBitmap _packedRowBytes](v8, "_packedRowBytes");
    }
  }
  return v8;
}

- (FxBitmap)initWithInfo:(id *)a3 rowBytes:(unint64_t)a4 andData:(void *)a5
{
  __int128 v6;
  __int128 v7;
  FxBitmap *result;
  FxBitmapPriv *bitmapPriv;
  _OWORD v10[4];
  double var8;

  v6 = *(_OWORD *)&a3->var6;
  v10[2] = *(_OWORD *)&a3->var4;
  v10[3] = v6;
  var8 = a3->var8;
  v7 = *(_OWORD *)&a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v7;
  result = -[FxBitmap initWithInfo:andData:](self, "initWithInfo:andData:", v10, a5);
  if (result)
  {
    bitmapPriv = result->_bitmapPriv;
    if (bitmapPriv)
      bitmapPriv->var1 = a4;
  }
  return result;
}

- (FxBitmap)initWithCopy:(id)a3
{
  _OWORD v5[4];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  if (a3)
    objc_msgSend(a3, "imageInfo");
  v5[2] = v9;
  v5[3] = v10;
  v6 = v11;
  v5[0] = v7;
  v5[1] = v8;
  return -[FxBitmap initWithInfo:](self, "initWithInfo:", v5);
}

- (FxBitmap)initWithCopy:(id)a3 andInfo:(id *)a4 andRowBytes:(unint64_t)a5
{
  __assert_rtn("-[FxBitmap initWithCopy:andInfo:andRowBytes:]", "FxBitmap.mm", 141, "false");
}

- (FxBitmap)initWithCopy:(id)a3 andInfo:(id *)a4
{
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[4];
  double var8;

  v7 = -[FxBitmap _packedRowBytes](self, "_packedRowBytes");
  v8 = *(_OWORD *)&a4->var6;
  v11[2] = *(_OWORD *)&a4->var4;
  v11[3] = v8;
  var8 = a4->var8;
  v9 = *(_OWORD *)&a4->var2;
  v11[0] = *(_OWORD *)&a4->var0;
  v11[1] = v9;
  return -[FxBitmap initWithCopy:andInfo:andRowBytes:](self, "initWithCopy:andInfo:andRowBytes:", a3, v11, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  FxBitmap *v4;
  FxBitmap *v5;
  unint64_t v6;
  FxBitmapPriv *bitmapPriv;
  unint64_t v8;
  size_t v9;
  void *var0;

  v4 = -[FxBitmap initWithCopy:](+[FxBitmap allocWithZone:](FxBitmap, "allocWithZone:", a3), "initWithCopy:", self);
  v5 = v4;
  if (v4)
  {
    if (!v4->_bitmapPriv)
      goto LABEL_10;
    v6 = -[FxBitmap rowBytes](self, "rowBytes");
    bitmapPriv = v5->_bitmapPriv;
    bitmapPriv->var1 = v6;
    bitmapPriv->var2 = 1;
    v8 = -[FxImage height](self, "height");
    v9 = -[FxBitmap rowBytes](self, "rowBytes") * v8;
    v5->_bitmapPriv->var0 = malloc_type_malloc(v9, 0x3D0F1567uLL);
    var0 = v5->_bitmapPriv->var0;
    if (!var0 && guaranteeMemory != 0)
    {
      guaranteeMemory(v9);
      v5->_bitmapPriv->var0 = malloc_type_malloc(v9, 0x13709DBFuLL);
      var0 = v5->_bitmapPriv->var0;
    }
    if (var0)
    {
      memcpy(-[FxBitmap dataPtr](v5, "dataPtr"), -[FxBitmap dataPtr](self, "dataPtr"), v9);
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  FxBitmapPriv *bitmapPriv;
  objc_super v4;

  bitmapPriv = self->_bitmapPriv;
  if (bitmapPriv)
  {
    if (bitmapPriv->var2 && bitmapPriv->var0)
    {
      free(bitmapPriv->var0);
      bitmapPriv = self->_bitmapPriv;
    }
    free(bitmapPriv);
  }
  v4.receiver = self;
  v4.super_class = (Class)FxBitmap;
  -[FxImage dealloc](&v4, sel_dealloc);
}

- (void)dataPtr
{
  return self->_bitmapPriv->var0;
}

- (void)dataPtrForPositionX:(unint64_t)a3 Y:(unint64_t)a4
{
  uint64_t v7;
  char *var0;

  if (!self->_bitmapPriv->var0)
    return 0;
  v7 = -[FxImage depth](self, "depth");
  var0 = (char *)self->_bitmapPriv->var0;
  return &var0[((int)(v7 >> 1) & 0xFFFFFFFFFFFFFFFCLL) * a3 + -[FxBitmap rowBytes](self, "rowBytes") * a4];
}

- (void)setRowBytes:(unint64_t)a3
{
  self->_bitmapPriv->var1 = a3;
}

- (unint64_t)rowBytes
{
  return self->_bitmapPriv->var1;
}

+ (void)setGuaranteeMemoryCallback:(void *)a3
{
  guaranteeMemory = a3;
}

- (BOOL)_verifyImage
{
  _BOOL4 v3;
  FxBitmapPriv *bitmapPriv;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FxBitmap;
  v3 = -[FxImage _verifyImage](&v6, sel__verifyImage);
  if (v3)
  {
    bitmapPriv = self->_bitmapPriv;
    if (bitmapPriv)
    {
      if (bitmapPriv->var0 && bitmapPriv->var1)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      NSLog(CFSTR("FxBitmap _verifyImage: bitmap data is nil, or the row bytes == 0"));
    }
    else
    {
      NSLog(CFSTR("FxBitmap _verifyImage: _bitmapPriv is nil"));
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_ownsData
{
  return self->_bitmapPriv->var2;
}

- (void)_setOwnedDataPtr:(void *)a3
{
  FxBitmapPriv *bitmapPriv;

  bitmapPriv = self->_bitmapPriv;
  if (bitmapPriv->var2 && bitmapPriv->var0)
  {
    free(bitmapPriv->var0);
    bitmapPriv = self->_bitmapPriv;
  }
  bitmapPriv->var0 = a3;
  self->_bitmapPriv->var2 = 1;
}

- (void)_setOwned:(BOOL)a3
{
  self->_bitmapPriv->var2 = a3;
}

@end
