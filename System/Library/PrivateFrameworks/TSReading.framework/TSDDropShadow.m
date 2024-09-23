@implementation TSDDropShadow

- (TSDDropShadow)initWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  TSDDropShadow *v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSDDropShadow;
  v11 = -[TSDShadow i_initWithOpacity:color:enabled:](&v16, sel_i_initWithOpacity_color_enabled_, a7, a8, a6);
  if (v11)
  {
    TSDNormalizeAngleInDegrees(a3);
    v11->super.mAngle = v12;
    -[TSDShadow clampOffset:](v11, "clampOffset:", a4);
    v11->super.mOffset = v13;
    -[TSDShadow clampRadius:](v11, "clampRadius:", a5);
    v11->super.mRadius = v14;
  }
  return v11;
}

- (unint64_t)shadowType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == self)
    return 1;
  v9 = v3;
  v10 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)TSDDropShadow;
  return -[TSDShadow isEqual:](&v8, sel_isEqual_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDDropShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = +[TSDDropShadow allocWithZone:](TSDDropShadow, "allocWithZone:", a3);
  -[TSDShadow angle](self, "angle");
  v6 = v5;
  -[TSDShadow offset](self, "offset");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v4, "initWithAngle:offset:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v11);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableDropShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = +[TSDMutableDropShadow allocWithZone:](TSDMutableDropShadow, "allocWithZone:", a3);
  -[TSDShadow angle](self, "angle");
  v6 = v5;
  -[TSDShadow offset](self, "offset");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v4, "initWithAngle:offset:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v11);
}

- (id)newShadowClampedForSwatches
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDDropShadow *v11;
  double v12;
  double v13;
  double v14;

  -[TSDShadow radius](self, "radius");
  v4 = v3;
  -[TSDShadow offset](self, "offset");
  v6 = v4 + v5;
  -[TSDShadow radius](self, "radius");
  v8 = v7;
  -[TSDShadow offset](self, "offset");
  v10 = v9;
  if (v6 > 10.0)
  {
    v8 = v8 * (10.0 / v6);
    v10 = v9 * (10.0 / v6);
  }
  v11 = [TSDDropShadow alloc];
  -[TSDShadow angle](self, "angle");
  v13 = v12;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v11, "initWithAngle:offset:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v13, v10, v8, v14);
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "shadowedNaturalBoundsWithoutOffset");
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

  objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "shadowedNaturalBoundsWithoutOffset");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  _BOOL4 v6;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGImage *Image;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  double v27;
  CGColor *v28;
  CGContext *v29;
  CGContext *v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGLayer *v52;
  CGContext *Context;
  void *v54;
  double v55;
  _OWORD v57[3];
  CGAffineTransform v58;
  CGAffineTransform transform;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[3];
  CGSize v64;
  CGRect v65;

  v6 = a6;
  v10 = TSDRoundedSize();
  v12 = v11;
  v13 = TSDRectWithSize();
  v17 = TSDRoundedRect(v13, v14, v15, v16);
  Image = 0;
  if (v19 != 0.0 && v20 != 0.0)
  {
    v22 = v17;
    v23 = v19;
    v24 = vcvtpd_u64_f64(fmax(v10, v19));
    v25 = vcvtpd_u64_f64(fmax(v12, v20));
    if (v24)
      v26 = v25 == 0;
    else
      v26 = 1;
    if (v26)
      return 0;
    v27 = v18;
    v28 = -[TSDShadow color](self, "color");
    v29 = TSDBitmapContextCreate(11, v23);
    if (!v29)
    {
      return 0;
    }
    else
    {
      v30 = v29;
      v31 = (void *)objc_msgSend(a3, "layout");
      if (v31)
        objc_msgSend(v31, "transformInRoot");
      else
        memset(v63, 0, sizeof(v63));
      v32 = TSDTransformAngle((double *)v63);
      TSDSetCGContextInfoForShadowContext((uint64_t)v30, v32);
      -[TSDShadow radius](self, "radius");
      v34 = v33;
      CGContextTranslateCTM(v30, -v22, -v27);
      CGContextTranslateCTM(v30, -(float)((float)v24 + 10.0), -0.0);
      if (v6)
      {
        v61 = 0u;
        v62 = 0u;
        v60 = 0u;
        v35 = (void *)objc_msgSend((id)objc_msgSend(a3, "layout"), "geometry");
        if (v35)
        {
          objc_msgSend(v35, "transform");
          v37 = *((double *)&v60 + 1);
          v36 = *(double *)&v60;
          v39 = *((double *)&v61 + 1);
          v38 = *(double *)&v61;
        }
        else
        {
          v61 = 0u;
          v62 = 0u;
          v39 = 0.0;
          v37 = 0.0;
          v38 = 0.0;
          v36 = 0.0;
          v60 = 0u;
        }
        if (TSDCrossPoints(v36, v38, v37, v39) > 0.0)
        {
          transform.a = -1.0;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.d = 1.0;
          transform.tx = v10;
          transform.ty = 0.0;
          CGContextConcatCTM(v30, &transform);
        }
        v58.b = 0.0;
        v58.c = 0.0;
        v58.a = 1.0;
        *(_OWORD *)&v58.d = xmmword_217C28F10;
        v58.ty = v12;
        CGContextConcatCTM(v30, &v58);
      }
      v64.height = 0.0;
      v64.width = (float)((float)v24 + 10.0);
      CGContextSetShadowWithColor(v30, v64, v34, v28);
      CGContextTranslateCTM(v30, v34, v34);
      if (objc_msgSend(a3, "canDrawShadowInOneStepWithChildren:", 1))
      {
        objc_msgSend(a3, "performSelector:withObject:", a5, v30);
      }
      else
      {
        objc_msgSend(a3, "naturalBounds");
        v41 = v40;
        v43 = v42;
        TSDRectWithSize();
        v45 = v44;
        v47 = v46;
        v48 = TSDShrinkSizeToFitInSize(v41, v43, 2048.0, 2048.0);
        if (v48 > 0.0 && v49 > 0.0)
        {
          v50 = v48 / v45;
          v51 = v49 / v47;
          v52 = CGLayerCreateWithContext(v30, *(CGSize *)&v48, 0);
          Context = CGLayerGetContext(v52);
          v54 = (void *)objc_msgSend(a3, "layout");
          if (v54)
            objc_msgSend(v54, "transformInRoot");
          else
            memset(v57, 0, sizeof(v57));
          v55 = TSDTransformAngle((double *)v57);
          TSDSetCGContextInfoForShadowContext((uint64_t)Context, v55);
          CGContextScaleCTM(Context, v50, v51);
          objc_msgSend(a3, "performSelector:withObject:", a5, Context);
          TSDClearCGContextInfo((uint64_t)Context);
          v65.origin.x = TSDRectWithSize();
          CGContextDrawLayerInRect(v30, v65, v52);
          CGLayerRelease(v52);
        }
      }
      Image = CGBitmapContextCreateImage(v30);
      TSDClearCGContextInfo((uint64_t)v30);
      CGContextRelease(v30);
    }
  }
  return Image;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSDDropShadow_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDDropShadow_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v8;
  void *v9;

  objc_opt_class();
  v2 = TSUDynamicCast();
  if (v2
    && ((v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(*(id *)(a1 + 40), "radius");
    v5 = v4;
    objc_msgSend(v3, "radius");
    if (vabdd_f64(v5, v6) >= 0.00999999978)
      return 3;
    else
      return 4;
  }
  else
  {
    objc_opt_class();
    v8 = TSUDynamicCast();
    if (!v8)
      return 1;
    v9 = (void *)v8;
    if (objc_msgSend(*(id *)(a1 + 40), "isEnabled") && (objc_msgSend(v9, "isEnabled") & 1) != 0)
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
  v5[2] = __50__TSDDropShadow_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDDropShadow *__50__TSDDropShadow_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  long double v4;
  long double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "angle");
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v2, "angle");
    TSDMixAnglesInDegrees(v4, v5, *(double *)(a1 + 48));
    v4 = v6;
    objc_msgSend(*(id *)(a1 + 40), "offset");
    objc_msgSend(v2, "offset");
    TSUMix();
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    objc_msgSend(v2, "radius");
    TSUMix();
    v10 = round(v9);
    objc_msgSend(*(id *)(a1 + 40), "opacity");
    objc_msgSend(v2, "opacity");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "offset");
    v8 = v11;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    v10 = v12;
    objc_msgSend(*(id *)(a1 + 40), "opacity");
  }
  TSUMix();
  v14 = v13;
  v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", objc_msgSend(*(id *)(a1 + 40), "color"));
  if (v2)
    v16 = v2;
  else
    v16 = *(void **)(a1 + 40);
  v17 = (void *)objc_msgSend(v15, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", objc_msgSend(v16, "color")), *(double *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 40), "isEnabled") & 1) != 0)
    v18 = 1;
  else
    v18 = objc_msgSend(v2, "isEnabled");
  return -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([TSDDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend(v17, "CGColor"), v18, (double)v4, v8, v10, v14);
}

@end
