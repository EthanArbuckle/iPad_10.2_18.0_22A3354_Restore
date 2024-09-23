@implementation TSDCurvedShadow

+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOffset:angle:radius:curve:opacity:color:enabled:", a8, a9, a3, a4, a5, a6, a7);
}

- (TSDCurvedShadow)initWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  _BOOL8 v9;
  void *v17;
  uint64_t v18;
  TSDCurvedShadow *result;
  objc_super v20;

  v9 = a9;
  if (!a8)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 50, CFSTR("invalid nil value for '%s'"), "color");
  }
  v20.receiver = self;
  v20.super_class = (Class)TSDCurvedShadow;
  result = -[TSDShadow i_initWithOpacity:color:enabled:](&v20, sel_i_initWithOpacity_color_enabled_, a8, v9, a7);
  if (result)
  {
    result->super.mOffset = a3;
    result->super.mRadius = a5;
    result->mCurve = a6;
    result->super.mAngle = a4;
  }
  return result;
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
  if (self->super.mEnabled)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@  curve=%f type=%@>"), v5, self, *(_QWORD *)&self->super.mAngle, *(_QWORD *)&self->super.mOffset, *(_QWORD *)&self->super.mRadius, *(_QWORD *)&self->super.mOpacity, self->super.mColor, v6, *(_QWORD *)&self->mCurve, -[TSDShadow typeDescription](self, "typeDescription"));
}

- (double)clampOffset:(double)a3
{
  float v3;

  v3 = a3;
  return roundf(v3);
}

- (unint64_t)shadowType
{
  return 3;
}

- (double)paddingForBlur
{
  return 40.0;
}

- (CGRect)expandedBoundsForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDCurvedShadow getVerticalOffset:](self, "getVerticalOffset:", a3.size.width, a3.size.height);
  v9 = v8;
  -[TSDCurvedShadow paddingForBlur](self, "paddingForBlur");
  v11 = -v10;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectInset(v12, v11, -v9);
}

- (CGPoint)boundsShiftForSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[TSDCurvedShadow getVerticalOffset:](self, "getVerticalOffset:", a3.width, a3.height);
  v5 = v4;
  -[TSDCurvedShadow paddingForBlur](self, "paddingForBlur");
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)getVerticalOffset:(CGSize)a3
{
  CGFloat v3;
  double v4;

  v3 = a3.height * 0.3;
  -[TSDCurvedShadow paddingForBlur](self, "paddingForBlur");
  return v3 + v4;
}

- (double)offsetFromCurve
{
  double v2;

  -[TSDCurvedShadow curve](self, "curve");
  return v2 * 0.25 * 150.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDCurvedShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = +[TSDCurvedShadow allocWithZone:](TSDCurvedShadow, "allocWithZone:", a3);
  -[TSDShadow offset](self, "offset");
  v6 = v5;
  -[TSDShadow angle](self, "angle");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDCurvedShadow curve](self, "curve");
  v12 = v11;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:](v4, "initWithOffset:angle:radius:curve:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v12, v13);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableCurvedShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = +[TSDMutableCurvedShadow allocWithZone:](TSDMutableCurvedShadow, "allocWithZone:", a3);
  -[TSDShadow offset](self, "offset");
  v6 = v5;
  -[TSDShadow angle](self, "angle");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDCurvedShadow curve](self, "curve");
  v12 = v11;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:](v4, "initWithOffset:angle:radius:curve:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v12, v13);
}

- (id)newShadowClampedForSwatches
{
  double v3;
  double v4;
  double v5;
  double v6;
  TSDCurvedShadow *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[TSDCurvedShadow curve](self, "curve");
  TSUClamp();
  v4 = v3;
  -[TSDShadow offset](self, "offset");
  TSUClamp();
  v6 = v5;
  v7 = [TSDCurvedShadow alloc];
  -[TSDShadow angle](self, "angle");
  v9 = v8;
  -[TSDShadow radius](self, "radius");
  v11 = v10;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:](v7, "initWithOffset:angle:radius:curve:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v9, v11, v4, v12);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v15 = v6;
    v16 = v5;
    v17 = v3;
    v18 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)TSDCurvedShadow;
      v9 = -[TSDShadow isEqual:](&v14, sel_isEqual_, a3);
      if (v9)
      {
        -[TSDCurvedShadow curve](self, "curve");
        v11 = v10;
        objc_msgSend(a3, "curve");
        LOBYTE(v9) = v11 == v12;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)showForEditingText
{
  return 0;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat rect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDShadow isEnabled](self, "isEnabled", a4))
  {
    -[TSDCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", x, y, width, height);
    rect = v9;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[TSDShadow offsetDelta](self, "offsetDelta");
    v17 = v16;
    -[TSDShadow offsetDelta](self, "offsetDelta");
    v19 = v18;
    v25.origin.x = rect;
    v25.origin.y = v11;
    v25.size.width = v13;
    v25.size.height = v15;
    v29 = CGRectOffset(v25, v17, v19);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectUnion(v26, v29);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "geometryInRoot"), "frame");
  -[TSDCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", 0.0, 0.0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "geometryInRoot"), "frame");
  -[TSDCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGContext *v21;
  CGContext *v22;
  CGContext *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  CGImage *Image;
  void *v28;
  double a;
  double b;
  double c;
  double d;
  void *v33;
  uint64_t v34;
  CGImage *v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform transform;
  CGAffineTransform v39;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", -[TSDShadow color](self, "color"));
  if (!objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "shouldRenderCurvedShadow"))return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, height);
  -[TSDShadow opacity](self, "opacity");
  if (v13 == 0.0)
    return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, height);
  objc_msgSend(v12, "alphaComponent");
  if (v14 == 0.0)
    return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, height);
  -[TSDCurvedShadow boundsForRep:](self, "boundsForRep:", a3);
  v17 = v16;
  v19 = v18;
  v21 = TSDBitmapContextCreate(3, v20);
  if (!v21)
  {
    v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]");
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 235, CFSTR("Cannot render curved shadow, the size is too large for the CGContext to render. Returning empty image instead"));
    return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, height);
  }
  v22 = v21;
  v23 = TSDBitmapContextCreate(11, width);
  CGContextTranslateCTM(v23, -v17, -v19);
  memset(&v39, 0, sizeof(v39));
  v24 = (void *)objc_msgSend(a3, "styledLayout");
  if (v24)
    objc_msgSend(v24, "transformInRoot");
  else
    memset(&v39, 0, sizeof(v39));
  transform = v39;
  CGContextConcatCTM(v23, &transform);
  objc_msgSend(a3, "performSelector:withObject:", a5, v23);
  Image = CGBitmapContextCreateImage(v23);
  if (v6)
  {
    memset(&transform, 0, sizeof(transform));
    v28 = (void *)objc_msgSend((id)objc_msgSend(a3, "layout"), "geometry");
    if (v28)
    {
      objc_msgSend(v28, "transform");
      a = transform.a;
      b = transform.b;
      c = transform.c;
      d = transform.d;
    }
    else
    {
      d = 0.0;
      b = 0.0;
      c = 0.0;
      a = 0.0;
      memset(&transform, 0, sizeof(transform));
    }
    if (TSDCrossPoints(a, c, b, d) > 0.0)
    {
      v37.a = -1.0;
      v37.b = 0.0;
      v37.c = 0.0;
      v37.d = 1.0;
      v37.tx = width;
      v37.ty = 0.0;
      CGContextConcatCTM(v22, &v37);
    }
    v36.b = 0.0;
    v36.c = 0.0;
    v36.a = 1.0;
    *(_OWORD *)&v36.d = xmmword_217C28F10;
    v36.ty = height;
    CGContextConcatCTM(v22, &v36);
  }
  if (!Image)
  {
    v33 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]");
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 265, CFSTR("invalid nil value for '%s'"), "imageWithoutShadow");
  }
  v35 = CGBitmapContextCreateImage(v22);
  CGContextRelease(v22);
  CGContextRelease(v23);
  CGImageRelease(Image);
  return v35;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__TSDCurvedShadow_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __40__TSDCurvedShadow_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
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
  uint64_t v17;
  void *v18;

  objc_opt_class();
  v2 = TSUDynamicCast();
  if (v2
    && ((v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(*(id *)(a1 + 40), "curve");
    v5 = v4;
    objc_msgSend(v3, "curve");
    if (vabdd_f64(v5, v6) >= 0.00999999978)
      return 3;
    objc_msgSend(*(id *)(a1 + 40), "angle");
    v8 = v7;
    objc_msgSend(v3, "angle");
    if (vabdd_f64(v8, v9) >= 0.00999999978)
      return 3;
    objc_msgSend(*(id *)(a1 + 40), "offset");
    v11 = v10;
    objc_msgSend(v3, "offset");
    if (vabdd_f64(v11, v12) >= 0.00999999978)
    {
      return 3;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "radius");
      v14 = v13;
      objc_msgSend(v3, "radius");
      if (vabdd_f64(v14, v15) >= 0.00999999978)
        return 3;
      else
        return 4;
    }
  }
  else
  {
    objc_opt_class();
    v17 = TSUDynamicCast();
    if (!v17)
      return 1;
    v18 = (void *)v17;
    if (objc_msgSend(*(id *)(a1 + 40), "isEnabled") && (objc_msgSend(v18, "isEnabled") & 1) != 0)
      return 1;
    else
      return 2;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__TSDCurvedShadow_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDCurvedShadow *__52__TSDCurvedShadow_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
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
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "offset");
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v2, "offset");
    TSUMix();
    v4 = v5;
    objc_msgSend(*(id *)(a1 + 40), "angle");
    objc_msgSend(v2, "angle");
    TSUMix();
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    objc_msgSend(v2, "radius");
    TSUMix();
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "curve");
    objc_msgSend(v2, "curve");
    TSUMix();
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "opacity");
    objc_msgSend(v2, "opacity");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "angle");
    v7 = v12;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    v9 = v13;
    objc_msgSend(*(id *)(a1 + 40), "curve");
    v11 = v14;
    objc_msgSend(*(id *)(a1 + 40), "opacity");
  }
  TSUMix();
  v16 = v15;
  v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", objc_msgSend(*(id *)(a1 + 40), "color"));
  if (v2)
    v18 = v2;
  else
    v18 = *(void **)(a1 + 40);
  v19 = (void *)objc_msgSend(v17, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", objc_msgSend(v18, "color")), *(double *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 40), "isEnabled") & 1) != 0)
    v20 = 1;
  else
    v20 = objc_msgSend(v2, "isEnabled");
  return -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]([TSDCurvedShadow alloc], "initWithOffset:angle:radius:curve:opacity:color:enabled:", objc_msgSend(v19, "CGColor"), v20, v4, v7, v9, v11, v16);
}

- (double)curve
{
  return self->mCurve;
}

@end
