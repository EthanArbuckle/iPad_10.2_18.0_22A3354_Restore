@implementation FxImage

+ (id)alloc
{
  void *v5;
  uint64_t v6;
  NSString *v7;
  objc_super v8;

  if ((id)objc_opt_class() == a1)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = NSStringFromSelector(a2);
    objc_msgSend(v5, "raise:format:", v6, CFSTR("*** %@ sent to abstract class %@. Use a subclass instead."), v7, objc_opt_class());
    return 0;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___FxImage;
    return objc_msgSendSuper2(&v8, sel_alloc);
  }
}

- (FxImage)init
{
  FxImage *result;
  FxImage *v3;
  FxImage *v4;
  FxImage v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FxImage;
  result = -[FxImage init](&v11, sel_init);
  if (result)
  {
    v3 = result;
    result = (FxImage *)operator new(0xD0uLL, MEMORY[0x1E0DE4E10]);
    v4 = result;
    if (result)
    {
      result->super.isa = 0;
      result->_imagePriv = 0;
      result[1] = (FxImage)xmmword_1B3554640;
      result[2].super.isa = 0;
      result[2]._imagePriv = 0;
      result[3].super.isa = (Class)2;
      LOBYTE(result[3]._imagePriv) = 1;
      result[4]._imagePriv = 0;
      result[5].super.isa = 0;
      result[4].super.isa = (Class)0x3FF0000000000000;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&result[5]._imagePriv = _Q0;
      result[7].super.isa = 0;
      result[7]._imagePriv = 0;
      result[6]._imagePriv = (FxImagePriv *)65792;
      v10 = *(FxImage *)(MEMORY[0x1E0C9D648] + 16);
      result[8] = *(FxImage *)MEMORY[0x1E0C9D648];
      result[9] = v10;
      result[10].super.isa = 0;
      result[10]._imagePriv = 0;
      result[11].super.isa = (Class)objc_alloc_init(FxMatrix44);
      v4[11]._imagePriv = 0;
      LODWORD(v4[12].super.isa) = 0;
      result = v3;
      v4[12]._imagePriv = 0;
    }
    v3->_imagePriv = (FxImagePriv *)v4;
  }
  return result;
}

- (FxImage)initWithInfo:(id *)a3
{
  FxImage *result;
  FxImagePriv *imagePriv;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int var0;
  int v10;
  FxImagePriv *v11;
  int var1;
  int v13;

  result = -[FxImage init](self, "init");
  if (result)
  {
    imagePriv = result->_imagePriv;
    if (imagePriv)
    {
      *(_OWORD *)&imagePriv->var0.var0 = *(_OWORD *)&a3->var0;
      v6 = *(_OWORD *)&a3->var2;
      v7 = *(_OWORD *)&a3->var4;
      v8 = *(_OWORD *)&a3->var6;
      imagePriv->var0.var8 = a3->var8;
      *(_OWORD *)&imagePriv->var0.var4 = v7;
      *(_OWORD *)&imagePriv->var0.var6 = v8;
      *(_OWORD *)&imagePriv->var0.var2 = v6;
      var0 = a3->var0;
      if (SLODWORD(a3->var0) >= 0)
        v10 = a3->var0;
      else
        v10 = var0 + 1;
      v11 = result->_imagePriv;
      var1 = a3->var1;
      if (var1 >= 0)
        v13 = a3->var1;
      else
        v13 = var1 + 1;
      v11->var9.var0 = -(v10 >> 1);
      v11->var9.var1 = -(v13 >> 1);
      v11->var9.var2 = var0 - (v10 >> 1);
      v11->var9.var3 = var1 - (v13 >> 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FxImage *v4;
  FxImage *v5;
  FxImagePriv *imagePriv;
  FxImagePriv *v7;
  FxImagePriv *v8;
  FxImagePriv *v9;
  CGSize size;
  _OWORD v12[4];
  uint64_t v13;

  v4 = +[FxImage allocWithZone:](FxImage, "allocWithZone:", a3);
  if (self)
  {
    -[FxImage imageInfo](self, "imageInfo");
  }
  else
  {
    v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  v5 = -[FxImage initWithInfo:](v4, "initWithInfo:", v12);
  imagePriv = self->_imagePriv;
  v7 = v5->_imagePriv;
  *(_OWORD *)&v7->var1 = *(_OWORD *)&imagePriv->var1;
  *(_OWORD *)&v7->var3 = *(_OWORD *)&imagePriv->var3;
  v7->var5 = imagePriv->var5;
  v7->var11 = imagePriv->var11;
  CGColorSpaceRetain(self->_imagePriv->var11);
  v5->_imagePriv->var6 = self->_imagePriv->var6;
  v5->_imagePriv->var7 = self->_imagePriv->var7;
  v8 = self->_imagePriv;
  v9 = v5->_imagePriv;
  size = v8->var8.size;
  v9->var8.origin = v8->var8.origin;
  v9->var8.size = size;
  v5->_imagePriv->var9 = self->_imagePriv->var9;
  v5->_imagePriv->var10 = -[FxMatrix44 initWithFxMatrix:]([FxMatrix44 alloc], "initWithFxMatrix:", self->_imagePriv->var10);
  return v5;
}

- (void)dealloc
{
  FxImagePriv *imagePriv;
  void (*var6)(void *, SEL);
  FxImagePriv *v5;
  objc_super v6;

  imagePriv = self->_imagePriv;
  if (imagePriv)
  {
    var6 = (void (*)(void *, SEL))imagePriv->var6;
    if (!var6 || (var6(imagePriv->var7, a2), (imagePriv = self->_imagePriv) != 0))
    {

      CGColorSpaceRelease(self->_imagePriv->var11);
      v5 = self->_imagePriv;
      if (v5)
        MEMORY[0x1B5E29170](v5, 0x10A0C4053556ED8);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FxImage;
  -[FxImage dealloc](&v6, sel_dealloc);
}

- ($FB0B61818339023072F3326201ECEE09)imageInfo
{
  unint64_t var1;
  __int128 v4;
  __int128 v5;

  var1 = self->var1;
  v4 = *(_OWORD *)(var1 + 48);
  *(_OWORD *)&retstr->var4 = *(_OWORD *)(var1 + 32);
  *(_OWORD *)&retstr->var6 = v4;
  retstr->var8 = *(double *)(var1 + 64);
  v5 = *(_OWORD *)(var1 + 16);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)var1;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (unint64_t)width
{
  return self->_imagePriv->var0.var0;
}

- (unint64_t)height
{
  return self->_imagePriv->var0.var1;
}

- (unint64_t)depth
{
  return self->_imagePriv->var0.var2;
}

- (unint64_t)bytes
{
  return self->_imagePriv->var0.var2 >> 3;
}

- (unint64_t)numActiveChannels
{
  return self->_imagePriv->var0.var3;
}

- (unint64_t)imageType
{
  return self->_imagePriv->var0.var4;
}

- (unint64_t)origin
{
  return self->_imagePriv->var0.var5;
}

- (unint64_t)pixelFormat
{
  return self->_imagePriv->var0.var6;
}

- (BOOL)isPremultiplied
{
  return self->_imagePriv->var0.var7;
}

- (double)pixelAspect
{
  return self->_imagePriv->var0.var8;
}

- (unint64_t)size
{
  return 4 * self->_imagePriv->var0.var0 * self->_imagePriv->var0.var1 * self->_imagePriv->var0.var2;
}

- (unint64_t)fieldOrder
{
  return self->_imagePriv->var2;
}

- (unint64_t)field
{
  return self->_imagePriv->var1;
}

- (BOOL)containsPointX:(int)a3 Y:(int)a4
{
  BOOL result;
  FxImagePriv *imagePriv;

  if (a3 < 0)
    return 0;
  result = 0;
  if ((a4 & 0x80000000) == 0)
  {
    imagePriv = self->_imagePriv;
    if (SLODWORD(imagePriv->var0.var0) > a3)
      return SLODWORD(imagePriv->var0.var1) > a4;
  }
  return result;
}

- (CGRect)bounds
{
  FxImagePriv *imagePriv;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  imagePriv = self->_imagePriv;
  x = imagePriv->var8.origin.x;
  y = imagePriv->var8.origin.y;
  width = imagePriv->var8.size.width;
  height = imagePriv->var8.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (FxRect)dod
{
  FxImagePriv *imagePriv;
  uint64_t v3;
  uint64_t v4;
  FxRect result;

  imagePriv = self->_imagePriv;
  v3 = *(_QWORD *)&imagePriv->var9.var0;
  v4 = *(_QWORD *)&imagePriv->var9.var2;
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (id)pixelTransform
{
  return self->_imagePriv->var10;
}

- (id)inversePixelTransform
{
  return -[FxMatrix44 initWithInverseOfFxMatrix:]([FxMatrix44 alloc], "initWithInverseOfFxMatrix:", self->_imagePriv->var10);
}

- (unint64_t)version
{
  return 1;
}

- (void)setWidth:(unint64_t)a3
{
  self->_imagePriv->var0.var0 = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_imagePriv->var0.var1 = a3;
}

- (void)setWidth:(unint64_t)a3 andHeight:(unint64_t)a4
{
  FxImagePriv *imagePriv;

  imagePriv = self->_imagePriv;
  imagePriv->var0.var0 = a3;
  imagePriv->var0.var1 = a4;
}

- (void)setDepth:(unint64_t)a3
{
  self->_imagePriv->var0.var2 = a3;
}

- (void)setBytes:(unint64_t)a3
{
  self->_imagePriv->var0.var2 = 8 * a3;
}

- (void)setNumActiveChannels:(unint64_t)a3
{
  self->_imagePriv->var0.var3 = a3;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imagePriv->var0.var4 = a3;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_imagePriv->var0.var5 = a3;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_imagePriv->var0.var6 = a3;
}

- (void)setIsPremultiplied:(BOOL)a3
{
  self->_imagePriv->var0.var7 = a3;
}

- (void)setPixelAspect:(double)a3
{
  self->_imagePriv->var0.var8 = a3;
}

- (void)setFieldOrder:(unint64_t)a3
{
  self->_imagePriv->var2 = a3;
}

- (void)setField:(unint64_t)a3
{
  self->_imagePriv->var1 = a3;
}

- (unint64_t)colorInfo
{
  return 2 * ((unint64_t)BYTE1(self->_imagePriv->var5) << 8 != 2048);
}

- (void)setColorInfo:(unint64_t)a3
{
  FxImagePriv *imagePriv;
  uint64_t v4;
  uint64_t v5;

  if (a3 == 2)
  {
    imagePriv = self->_imagePriv;
    v4 = BYTE2(imagePriv->var5);
    v5 = 256;
    goto LABEL_5;
  }
  if (!a3)
  {
    imagePriv = self->_imagePriv;
    v4 = BYTE2(imagePriv->var5);
    v5 = 2048;
LABEL_5:
    imagePriv->var5 = v5 | (v4 << 16);
    return;
  }
  NSLog(CFSTR("FxImage setColorInfo: illegal colorInfo value"), a2);
}

- (unint64_t)nclcValue
{
  return self->_imagePriv->var5;
}

- (void)setNCLCValue:(unint64_t)a3
{
  self->_imagePriv->var5 = a3;
}

- (CGColorSpace)colorSpace
{
  FxImagePriv *imagePriv;

  imagePriv = self->_imagePriv;
  if (sColorSpaceVendor)
    return (CGColorSpace *)sColorSpaceVendor(imagePriv->var5);
  else
    return imagePriv->var11;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  CGColorSpaceRetain(a3);
  CGColorSpaceRelease(self->_imagePriv->var11);
  self->_imagePriv->var11 = a3;
}

- (unint64_t)fxColorPrimaries
{
  int v2;

  v2 = BYTE2(self->_imagePriv->var5);
  if (v2 == 1)
    return 0;
  if (v2 != 9)
    -[FxImage fxColorPrimaries].cold.1();
  return 1;
}

- (void)setFxColorPrimaries:(unint64_t)a3
{
  FxImagePriv *imagePriv;
  uint64_t v4;
  uint64_t v5;

  if (a3 == 1)
  {
    imagePriv = self->_imagePriv;
    v4 = BYTE1(imagePriv->var5);
    v5 = 589824;
    goto LABEL_5;
  }
  if (!a3)
  {
    imagePriv = self->_imagePriv;
    v4 = BYTE1(imagePriv->var5);
    v5 = 0x10000;
LABEL_5:
    imagePriv->var5 = v5 | (v4 << 8);
    return;
  }
  NSLog(CFSTR("FxImage setFxColorPrimaries: illegal FxColorPrimaries value"), a2);
}

- (void)setDynamicRangeType:(unint64_t)a3
{
  self->_imagePriv->var13 = a3;
}

- (unint64_t)dynamicRangeType
{
  return self->_imagePriv->var13;
}

- (void)setEyeType:(int)a3
{
  self->_imagePriv->var12 = a3;
}

- (int)eyeType
{
  return self->_imagePriv->var12;
}

- (void)setBounds:(CGRect)a3
{
  self->_imagePriv->var8 = a3;
}

- (void)setDod:(FxRect)a3
{
  self->_imagePriv->var9 = a3;
}

- (void)setPixelTransform:(id)a3
{
  id var10;
  id v5;

  var10 = self->_imagePriv->var10;
  if (var10 != a3)
  {

    self->_imagePriv->var10 = a3;
    v5 = a3;
  }
}

- (double)scaleX
{
  return self->_imagePriv->var3;
}

- (double)scaleY
{
  return self->_imagePriv->var4;
}

- (void)setScaleX:(double)a3
{
  self->_imagePriv->var3 = a3;
}

- (void)setScaleY:(double)a3
{
  self->_imagePriv->var4 = a3;
}

- (void)setDeallocCallback:(void *)a3 refcon:(void *)a4
{
  self->_imagePriv->var6 = a3;
  self->_imagePriv->var7 = a4;
}

- (BOOL)_verifyImage
{
  FxImagePriv *imagePriv;
  BOOL v4;
  unint64_t var2;
  BOOL v6;
  uint64_t v7;
  FxImagePriv *v9;
  double var3;
  double v11;
  double var4;
  unint64_t var5;
  FxImagePriv *v15;

  imagePriv = self->_imagePriv;
  if (!imagePriv)
  {
    NSLog(CFSTR("FxImage _verifyImage: _imagePriv is nil"));
    return 0;
  }
  if (imagePriv->var0.var0 && imagePriv->var0.var1 && imagePriv->var0.var3 == 4 && imagePriv->var0.var7)
  {
    v4 = 1;
  }
  else
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid width, height, activeChannels, or isPremultiplied"), a2);
    v4 = 0;
  }
  var2 = imagePriv->var0.var2;
  v6 = var2 > 0x20;
  v7 = (1 << var2) & 0x100010100;
  if (v6 || v7 == 0)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid depth"), a2);
    v4 = 0;
  }
  if (imagePriv->var0.var4 - 1 >= 3)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid imageType"), a2);
    v4 = 0;
  }
  if ((imagePriv->var0.var5 | 2) != 2)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid origin"));
    v4 = 0;
  }
  if ((imagePriv->var0.var6 | 2) != 2)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid pixelFormat"));
    v4 = 0;
  }
  if (imagePriv->var0.var8 <= 0.0)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid pixelAspect"));
    v4 = 0;
  }
  v9 = self->_imagePriv;
  if (v9->var1 >= 3)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid field"));
    v4 = 0;
    v9 = self->_imagePriv;
  }
  if (v9->var2 >= 3)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid field order"));
    v4 = 0;
    v9 = self->_imagePriv;
  }
  var3 = v9->var3;
  v6 = var3 <= 0.0;
  v11 = fabs(var3);
  if (v6 || v11 == INFINITY)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid scaleX"), v11);
    v4 = 0;
    v9 = self->_imagePriv;
  }
  var4 = v9->var4;
  if (var4 <= 0.0 || fabs(var4) == INFINITY)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid scaleY"));
    v4 = 0;
    v9 = self->_imagePriv;
  }
  var5 = v9->var5;
  if (BYTE2(var5) > 0xCu
    || ((1 << SBYTE2(var5)) & 0x1202) == 0
    || BYTE1(var5) > 0x12u
    || ((1 << SBYTE1(var5)) & 0x52102) == 0
    || v9->var5)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid nclcValue"));
    v4 = 0;
    v9 = self->_imagePriv;
  }
  if (CGRectIsEmpty(v9->var8))
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid bounds"));
    v4 = 0;
  }
  v15 = self->_imagePriv;
  if (!v15->var10)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid pixelTransform"));
    v4 = 0;
    v15 = self->_imagePriv;
  }
  if (!v15->var11)
  {
    NSLog(CFSTR("FxImage _verifyImage: invalid colorSpace"));
    return 0;
  }
  return v4;
}

+ (void)setColorSpaceVendor:(void *)a3
{
  sColorSpaceVendor = (uint64_t (*)(_QWORD))a3;
}

- (void)fxColorPrimaries
{
  __assert_rtn("-[FxImage fxColorPrimaries]", "FxImage.mm", 392, "false");
}

@end
