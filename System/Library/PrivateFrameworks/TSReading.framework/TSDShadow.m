@implementation TSDShadow

+ (id)p_defaultShadowEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t DeviceRGB;
  CGColor *v5;
  TSDDropShadow *v6;

  v3 = a3;
  DeviceRGB = TSUCGColorCreateDeviceRGB();
  if (DeviceRGB)
  {
    v5 = (CGColor *)DeviceRGB;
    v6 = -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([TSDDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", DeviceRGB, v3, 315.0, 5.0, 1.0, 1.0);
    CGColorRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)defaultShadow
{
  return (id)objc_msgSend(a1, "p_defaultShadowEnabled:", 1);
}

+ (id)defaultDisabledShadow
{
  return (id)objc_msgSend(a1, "p_defaultShadowEnabled:", 0);
}

+ (TSDShadow)shadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  return (TSDShadow *)-[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([TSDDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", a7, a8, a3, a4, a5, a6);
}

+ (id)contactShadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 height:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  return -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:]([TSDContactShadow alloc], "initWithOffset:height:radius:opacity:color:enabled:", a8, a9, a4, a6, a5, a7);
}

+ (TSDShadow)shadowWithNSShadow:(id)a3
{
  double v4;
  long double v5;
  double v6;
  double v7;
  CGColor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGColor *CopyWithAlpha;
  TSDShadow *v17;

  objc_msgSend(a3, "shadowOffset");
  v5 = v4;
  v7 = v6;
  v8 = (CGColor *)objc_msgSend(a3, "shadowColor");
  v9 = -v7;
  v10 = TSDAngleFromDelta(v5, v9) * 57.2957795;
  v11 = TSDDistance(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v5, v9);
  objc_msgSend(a3, "shadowBlurRadius");
  v13 = v12;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", v8), "alphaComponent");
  v15 = v14;
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v8, 1.0);
  v17 = +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", CopyWithAlpha, 1, v10, v11, v13, v15);
  CGColorRelease(CopyWithAlpha);
  return v17;
}

+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  return -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]([TSDCurvedShadow alloc], "initWithOffset:angle:radius:curve:opacity:color:enabled:", a8, a9, a3, a4, a5, a6, a7);
}

- (double)clampOffset:(double)a3
{
  double result;

  TSUClamp();
  return result;
}

- (double)clampRadius:(double)a3
{
  double result;

  TSUClamp();
  return result;
}

- (double)clampOpacity:(double)a3
{
  double result;

  TSUClamp();
  return result;
}

- (id)mutableCopy
{
  return -[TSDShadow mutableCopyWithZone:](self, "mutableCopyWithZone:", -[TSDShadow zone](self, "zone"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)newShadowClampedForSwatches
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->mColor);
  v3.receiver = self;
  v3.super_class = (Class)TSDShadow;
  -[TSDShadow dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return CFHash(self->mColor);
}

- (BOOL)isContactShadow
{
  return -[TSDShadow shadowType](self, "shadowType") == 2;
}

- (BOOL)isDropShadow
{
  return -[TSDShadow shadowType](self, "shadowType") == 1;
}

- (BOOL)isCurvedShadow
{
  return -[TSDShadow shadowType](self, "shadowType") == 3;
}

- (BOOL)showForEditingText
{
  return 0;
}

- (unint64_t)shadowType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  _BOOL4 v18;
  unint64_t v19;

  if (a3 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    -[TSDShadow angle](self, "angle");
    v6 = v5;
    objc_msgSend(a3, "angle");
    if (v6 != v7)
      goto LABEL_8;
    -[TSDShadow offset](self, "offset");
    v9 = v8;
    objc_msgSend(a3, "offset");
    if (v9 != v10)
      goto LABEL_8;
    -[TSDShadow radius](self, "radius");
    v12 = v11;
    objc_msgSend(a3, "radius");
    if (v12 == v13
      && (-[TSDShadow opacity](self, "opacity"), v15 = v14, objc_msgSend(a3, "opacity"), v15 == v16)
      && (v17 = -[TSDShadow isEnabled](self, "isEnabled"), v17 == objc_msgSend(a3, "isEnabled")))
    {
      v18 = CGColorEqualToColor(-[TSDShadow color](self, "color"), (CGColorRef)objc_msgSend(a3, "color"));
      if (v18)
      {
        v19 = -[TSDShadow shadowType](self, "shadowType");
        LOBYTE(v18) = v19 == objc_msgSend(a3, "shadowType");
      }
    }
    else
    {
LABEL_8:
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mEnabled)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@ type=%@>"), v5, self, *(_OWORD *)&self->mAngle, *(_QWORD *)&self->mRadius, *(_QWORD *)&self->mOpacity, self->mColor, v6, -[TSDShadow typeDescription](self, "typeDescription"));
}

- (id)typeDescription
{
  unint64_t v2;

  v2 = -[TSDShadow shadowType](self, "shadowType");
  if (v2 > 3)
    return 0;
  else
    return off_24D82BF78[v2];
}

- (CGPoint)offsetDelta
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v8 = 0.0;
  v9 = 0.0;
  -[TSDShadow offset](self, "offset");
  v4 = v3;
  -[TSDShadow angle](self, "angle");
  TSDOriginRotate(&v8, v4, v5 * 0.0174532925);
  v6 = v8;
  v7 = v9;
  result.y = v7;
  result.x = v6;
  return result;
}

+ (id)keyPathsForValuesAffectingTSUColor
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

+ (BOOL)automaticallyNotifiesObserversOfTSUColor
{
  return 0;
}

- (TSUColor)TSUColor
{
  return (TSUColor *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", -[TSDShadow color](self, "color"));
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4
{
  -[TSDShadow applyToContext:viewScale:flipped:extraOffset:](self, "applyToContext:viewScale:flipped:extraOffset:", a3, 0, a4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5
{
  -[TSDShadow applyToContext:viewScale:flipped:extraOffset:](self, "applyToContext:viewScale:flipped:extraOffset:", a3, a5, a4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5 extraOffset:(CGSize)a6
{
  double height;
  double width;
  _BOOL4 v8;
  double v12;
  double v13;
  int IsCALayerContext;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGSize v21;
  CGFloat v22;
  CGFloat v23;
  CGColor *v24;
  double v25;
  double v26;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  double v29;
  double v30;
  CGSize v31;
  CGSize v32;

  height = a6.height;
  width = a6.width;
  v8 = a5;
  if (-[TSDShadow isEnabled](self, "isEnabled"))
  {
    v29 = 0.0;
    v30 = 0.0;
    -[TSDShadow angle](self, "angle");
    if (v8)
      v13 = v12;
    else
      v13 = -v12;
    IsCALayerContext = TSDCGContextIsCALayerContext((uint64_t)a3);
    v15 = TSDCGContextAssociatedScreenScale((uint64_t)a3);
    v16 = v15;
    if (IsCALayerContext)
    {
      width = TSDMultiplySizeScalar(width, height, 1.0 / v15);
      height = v17;
      v16 = 1.0;
    }
    -[TSDShadow radius](self, "radius");
    v19 = v16 * (v18 * a4);
    -[TSDShadow offset](self, "offset");
    TSDOriginRotate(&v29, v16 * (v20 * a4), v13 * 0.0174532925);
    v31.width = width;
    v31.height = height;
    v21 = CGContextConvertSizeToDeviceSpace(a3, v31);
    v22 = v29 + v21.width;
    v23 = v21.height + v30;
    v24 = -[TSDShadow color](self, "color");
    -[TSDShadow opacity](self, "opacity");
    v26 = v25;
    Alpha = CGColorGetAlpha(-[TSDShadow color](self, "color"));
    CopyWithAlpha = CGColorCreateCopyWithAlpha(v24, v26 * Alpha);
    v32.width = v22;
    v32.height = v23;
    CGContextSetShadowWithColor(a3, v32, v19, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return 0;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28[3];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDShadow isEnabled](self, "isEnabled"))
  {
    -[TSDShadow radius](self, "radius");
    v11 = -v10;
    -[TSDShadow radius](self, "radius");
    v13 = -v12;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectInset(v29, v11, v13);
    v14 = v30.origin.x;
    v15 = v30.origin.y;
    v16 = v30.size.width;
    v17 = v30.size.height;
    -[TSDShadow offsetDelta](self, "offsetDelta");
    v18 = *(float64x2_t *)&a4->c;
    v28[0] = *(float64x2_t *)&a4->a;
    v28[1] = v18;
    v28[2] = *(float64x2_t *)&a4->tx;
    v21 = TSDDeltaApplyAffineTransform(v28, v19, v20);
    v23 = v22;
    v31.origin.x = v14;
    v31.origin.y = v15;
    v31.size.width = v16;
    v31.size.height = v17;
    v35 = CGRectOffset(v31, v21, v23);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v33 = CGRectUnion(v32, v35);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v8[3];
  CGRect result;

  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v8[0] = *MEMORY[0x24BDBD8B8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSDShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalAngle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGAffineTransformMakeRotation(&v13, a4 * 0.0174532925);
  -[TSDShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", &v13, x, y, width, height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)differenceRequiresRebuilding:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  BOOL result;

  result = 1;
  if (a3)
  {
    -[TSDShadow radius](self, "radius");
    v6 = v5;
    objc_msgSend(a3, "radius");
    if (v6 == v7)
    {
      -[TSDShadow opacity](self, "opacity");
      v9 = v8;
      objc_msgSend(a3, "opacity");
      if (v9 == v10 && CGColorEqualToColor(-[TSDShadow color](self, "color"), (CGColorRef)objc_msgSend(a3, "color")))
      {
        v11 = -[TSDShadow isEnabled](self, "isEnabled");
        if (v11 == objc_msgSend(a3, "isEnabled"))
          return 0;
      }
    }
  }
  return result;
}

+ (id)presetKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  double v19;
  char v20;
  double v21;
  uint64_t v22;
  TSDContactShadow *v23;
  uint64_t v24;
  TSDContactShadow *v25;
  id v26;
  id v27;
  id v28;

  if ((objc_msgSend(a3, "isEqual:", String) & 1) == 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShadow bootstrapPresetsOfKind:inTheme:alternate:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 487, CFSTR("Attempt to bootstrap shadow presets for kind %@ in theme <%p>."), a3, a4);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
  v27 = a4;
  v28 = a3;
  if (a5 >= 7)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDShadow bootstrapPresetsOfKind:inTheme:alternate:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 507, CFSTR("invalid theme alternate value"));
    v11 = 0;
  }
  else
  {
    v11 = (uint64_t)*(&off_24D82BF98 + a5);
  }
  v14 = 0;
  v15 = v11 + 32;
  do
  {
    v17 = *(double *)(v15 - 32);
    v16 = *(double *)(v15 - 24);
    v18 = *(_DWORD *)(v15 - 16);
    v19 = *(double *)(v15 - 8);
    v20 = *(_BYTE *)(v15 + 16);
    v21 = *(double *)(v15 + 24);
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", *(float *)v15, *(float *)(v15 + 4), *(float *)(v15 + 8), *(float *)(v15 + 12)), "CGColor");
    if (v14 > 3)
    {
      v24 = v20 & 1;
      if (v14 > 5)
        v23 = -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:]([TSDContactShadow alloc], "initWithOffset:height:radius:opacity:color:enabled:", v22, v24, v16, v21, (double)v18, v19);
      else
        v23 = -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]([TSDCurvedShadow alloc], "initWithOffset:angle:radius:curve:opacity:color:enabled:", v22, v24, v16, v17, (double)v18, v21, v19);
    }
    else
    {
      v23 = -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([TSDDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", v22, v20 & 1, v17, v16, (double)v18, v19);
    }
    v25 = v23;
    objc_msgSend(v10, "addObject:", v23);

    ++v14;
    v15 += 64;
  }
  while (v14 != 8);
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v10);
  objc_msgSend(v27, "setPresets:ofKind:", v26, v28);

}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapShadow_;
}

+ (BOOL)canMixWithNilObjects
{
  return 1;
}

+ (id)mixableObjectClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShadow mixingTypeWithObject:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 591, CFSTR("Implement me in subclass!"));
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4, a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShadow mixedObjectWithFraction:ofObject:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 597, CFSTR("Implement me in subclass!"));
  return 0;
}

- (id)mixedBaseObjectWithObject:(id)a3
{
  if (-[TSDShadow isEnabled](self, "isEnabled"))
    return self;
  else
    return a3;
}

- (id)shadowByTransformingByTransform:(CGAffineTransform *)a3
{
  double v4;
  id v5;
  double v6;
  double v7;

  v4 = fmin(a3->a, a3->d);
  v5 = -[TSDShadow mutableCopy](self, "mutableCopy");
  -[TSDShadow radius](self, "radius");
  objc_msgSend(v5, "setRadius:", floor(v4 * v6));
  -[TSDShadow offset](self, "offset");
  objc_msgSend(v5, "setOffset:", floor(v4 * v7));
  return v5;
}

- (id)NSShadow
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGColor *v10;
  double v11;
  double v12;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  void *v15;
  uint64_t v16;

  if (-[TSDShadow isEnabled](self, "isEnabled"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF6758]);
    -[TSDShadow angle](self, "angle");
    v5 = v4 * 0.0174532925;
    -[TSDShadow offset](self, "offset");
    v7 = v6;
    v8 = TSDDeltaFromAngle(v5);
    objc_msgSend(v3, "setShadowOffset:", TSDMultiplyPointScalar(v8, -v9, v7));
    -[TSDShadow radius](self, "radius");
    objc_msgSend(v3, "setShadowBlurRadius:");
    v10 = -[TSDShadow color](self, "color");
    -[TSDShadow opacity](self, "opacity");
    v12 = v11;
    Alpha = CGColorGetAlpha(v10);
    CopyWithAlpha = CGColorCreateCopyWithAlpha(v10, v12 * Alpha);
    if (!CopyWithAlpha)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShadow NSShadow]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 640, CFSTR("invalid nil value for '%s'"), "color");
    }
    objc_msgSend(v3, "setShadowColor:", CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)angle
{
  return self->mAngle;
}

- (double)offset
{
  return self->mOffset;
}

- (double)radius
{
  return self->mRadius;
}

- (double)opacity
{
  return self->mOpacity;
}

- (CGColor)color
{
  return self->mColor;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (id)i_initWithOpacity:(double)a3 color:(CGColor *)a4 enabled:(BOOL)a5
{
  void *v9;
  uint64_t v10;
  TSDShadow *v11;
  TSDShadow *v12;
  double v13;
  CGColorRef v14;
  objc_super v16;

  if (!a4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShadow(Internal) i_initWithOpacity:color:enabled:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow-Internal.m"), 21, CFSTR("invalid nil value for '%s'"), "color");
  }
  v16.receiver = self;
  v16.super_class = (Class)TSDShadow;
  v11 = -[TSDShadow init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[TSDShadow clampOpacity:](v11, "clampOpacity:", a3);
    v12->mOpacity = v13;
    if (a4)
      v14 = CGColorRetain(a4);
    else
      v14 = 0;
    v12->mColor = v14;
    v12->mEnabled = a5;
  }
  return v12;
}

- (CGImage)i_newEmptyImageWithSize:(CGSize)a3
{
  CGContext *v3;
  CGImage *Image;

  v3 = TSDBitmapContextCreate(3, a3.width);
  Image = CGBitmapContextCreateImage(v3);
  CGContextRelease(v3);
  return Image;
}

@end
