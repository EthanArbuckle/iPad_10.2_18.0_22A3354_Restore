@implementation TSDContactShadow

+ (id)contactShadowWithOffset:(double)a3 height:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOffset:height:radius:opacity:color:enabled:", a7, a8, a3, a4, a5, a6);
}

- (TSDContactShadow)initWithOffset:(double)a3 height:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  _BOOL8 v8;
  void *v15;
  uint64_t v16;
  TSDContactShadow *result;
  objc_super v18;

  v8 = a8;
  if (!a7)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContactShadow.m"), 47, CFSTR("invalid nil value for '%s'"), "color");
  }
  v18.receiver = self;
  v18.super_class = (Class)TSDContactShadow;
  result = -[TSDShadow i_initWithOpacity:color:enabled:](&v18, sel_i_initWithOpacity_color_enabled_, a7, v8, a6);
  if (result)
  {
    result->super.mAngle = 0.0;
    result->mHeight = a4;
    result->super.mRadius = a5;
    result->super.mOffset = a3;
  }
  return result;
}

- (unint64_t)shadowType
{
  return 2;
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
      v14.super_class = (Class)TSDContactShadow;
      v9 = -[TSDShadow isEqual:](&v14, sel_isEqual_, a3);
      if (v9)
      {
        -[TSDContactShadow height](self, "height");
        v11 = v10;
        objc_msgSend(a3, "height");
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

- (id)copyWithZone:(_NSZone *)a3
{
  TSDContactShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = +[TSDContactShadow allocWithZone:](TSDContactShadow, "allocWithZone:", a3);
  -[TSDShadow offset](self, "offset");
  v6 = v5;
  -[TSDContactShadow height](self, "height");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:](v4, "initWithOffset:height:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v11);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableContactShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = +[TSDMutableContactShadow allocWithZone:](TSDMutableContactShadow, "allocWithZone:", a3);
  -[TSDShadow offset](self, "offset");
  v6 = v5;
  -[TSDContactShadow height](self, "height");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:](v4, "initWithOffset:height:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v11);
}

- (id)newShadowClampedForSwatches
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  TSDContactShadow *v9;
  double v10;

  -[TSDShadow offset](self, "offset");
  TSUClamp();
  v4 = v3;
  -[TSDShadow radius](self, "radius");
  TSUClamp();
  v6 = v5;
  -[TSDContactShadow height](self, "height");
  TSUClamp();
  v8 = v7;
  v9 = [TSDContactShadow alloc];
  -[TSDShadow opacity](self, "opacity");
  return -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:](v9, "initWithOffset:height:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v4, v8, v6, v10);
}

- (double)perspective
{
  return asin(self->mHeight) / 3.14159265 * 180.0;
}

- (double)clampRadius:(double)a3
{
  double result;

  TSUClamp();
  return result;
}

- (double)clampOffset:(double)a3
{
  float v3;

  v3 = a3;
  return roundf(v3);
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MidX;
  double MaxY;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDShadow isEnabled](self, "isEnabled"))
  {
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v34.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v34.c = v10;
    *(_OWORD *)&v34.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformInvert(&v35, &v34);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v37 = CGRectApplyAffineTransform(v36, &v35);
    v11 = v37.origin.x;
    v12 = v37.origin.y;
    v13 = v37.size.width;
    v14 = v37.size.height;
    v33 = height;
    MidX = CGRectGetMidX(v37);
    v38.origin.x = v11;
    v38.origin.y = v12;
    v38.size.width = v13;
    v38.size.height = v14;
    v32 = width;
    MaxY = CGRectGetMaxY(v38);
    v39.origin.x = v11;
    v39.origin.y = v12;
    v39.size.width = v13;
    v39.size.height = v14;
    v17 = CGRectGetWidth(v39);
    v18 = TSDRectWithCenterAndSize(MidX, MaxY, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[TSDShadow offset](self, "offset");
    v26 = v25;
    v40.origin.x = v18;
    v40.origin.y = v20;
    v40.size.width = v22;
    v40.size.height = v24;
    v41 = CGRectOffset(v40, 0.0, v26);
    v42 = CGRectInset(v41, -120.0, 0.0);
    v27 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v34.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v34.c = v27;
    *(_OWORD *)&v34.tx = *(_OWORD *)&a4->tx;
    v46 = CGRectApplyAffineTransform(v42, &v34);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = v32;
    v43.size.height = v33;
    v44 = CGRectUnion(v43, v46);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v3;
  double v4;
  CGRect v5;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "alignmentFrameInRoot");
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  result = CGRectInset(v5, -120.0, 0.0);
  v3 = result.size.height + -75.0;
  v4 = 150.0;
  result.size.height = v4;
  result.origin.y = v3;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double v3;
  double v4;
  CGRect v5;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "alignmentFrameInRoot");
  result = CGRectInset(v5, -120.0, 0.0);
  v3 = result.origin.y + result.size.height + -75.0;
  v4 = 150.0;
  result.size.height = v4;
  result.origin.y = v3;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGContext *v20;
  void *v21;
  CGImage *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  -[TSDContactShadow boundsForRep:](self, "boundsForRep:");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if ((objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "shouldRenderContactShadow") & 1) == 0)return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", v17, 150.0);
  v20 = TSDBitmapContextCreate(3, v17);
  CGContextTranslateCTM(v20, -v13, -v15);
  CGContextTranslateCTM(v20, 0.0, v19 * 0.5);
  memset(&v25, 0, sizeof(v25));
  v21 = (void *)objc_msgSend(a3, "styledLayout");
  if (v21)
    objc_msgSend(v21, "transformInRoot");
  else
    memset(&v25, 0, sizeof(v25));
  v24 = v25;
  CGContextConcatCTM(v20, &v24);
  objc_msgSend(a3, "performSelector:withObject:", a5, v20);
  v23 = -[TSDContactShadow newShadowImageFromContext:withSize:bounds:unflipped:](self, "newShadowImageFromContext:withSize:bounds:unflipped:", v20, v6, width, height, v13, v15, v17, v19);
  CGContextRelease(v20);
  return v23;
}

- (CGImage)newShadowImageFromContext:(CGContext *)a3 withSize:(CGSize)a4 bounds:(CGRect)a5 unflipped:(BOOL)a6
{
  double height;
  double v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  CGImage *v53;
  void *v54;
  uint64_t v55;
  CGImage *v56;
  double width;
  CGImage *image;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  double v66[6];

  width = a5.size.width;
  height = a4.height;
  v7 = a4.width;
  v66[4] = *(double *)MEMORY[0x24BDAC8D0];
  v10 = a5.size.height * 0.5;
  -[TSDShadow radius](self, "radius", a3, a6, a4.width, a4.height, a5.origin.x, a5.origin.y);
  v12 = v11;
  -[TSDShadow radius](self, "radius");
  v14 = v13;
  -[TSDContactShadow height](self, "height");
  v16 = v15;
  image = CGBitmapContextCreateImage(a3);
  v17 = objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", -[TSDShadow color](self, "color")), "getRGBAComponents:", v66);
  v18 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIAffineTransform"));
  v19 = *MEMORY[0x24BDBF960];
  objc_msgSend(v18, "setValue:forKey:", v17, *MEMORY[0x24BDBF960]);
  -[TSDShadow offset](self, "offset");
  TSUClamp();
  memset(&v65, 0, sizeof(v65));
  CGAffineTransformMakeTranslation(&v65, 0.0, -v20 - height * 0.5);
  v64 = v65;
  objc_msgSend(v18, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGAffineTransform:", &v64), CFSTR("inputTransform"));
  v21 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorMatrix"));
  v22 = *MEMORY[0x24BDBF9C8];
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(v18, "valueForKey:", *MEMORY[0x24BDBF9C8]), v19);
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), CFSTR("inputRVector"));
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), CFSTR("inputGVector"));
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), CFSTR("inputBVector"));
  v23 = (void *)MEMORY[0x24BDBF690];
  v24 = v66[3];
  -[TSDShadow opacity](self, "opacity");
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(v23, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v24 * v25), CFSTR("inputAVector"));
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", v66[0], v66[1], v66[2], 0.0), CFSTR("inputBiasVector"));
  v26 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CICrop"));
  objc_msgSend(v26, "setValue:forKey:", objc_msgSend(v21, "valueForKey:", v22), v19);
  objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, v10 + -20.0, v7, 20.0), CFSTR("inputRectangle"));
  v27 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CICrop"));
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(v21, "valueForKey:", v22), v19);
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, v10 + -70.0, v7, 70.0), CFSTR("inputRectangle"));
  v28 = (void *)objc_msgSend(v26, "valueForKey:", v22);
  objc_msgSend(v28, "extent");
  if (v29 <= 1.0)
  {
    v32 = objc_msgSend(MEMORY[0x24BDBF660], "imageWithColor:", objc_msgSend(MEMORY[0x24BDBF638], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  }
  else
  {
    v30 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIGaussianBlur"));
    objc_msgSend(v30, "setValue:forKey:", v28, v19);
    *(float *)&v31 = fmin(v12 / 3.0, 55.0);
    objc_msgSend(v30, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31), CFSTR("inputRadius"));
    v32 = objc_msgSend(v30, "valueForKey:", v22);
  }
  v33 = v32;
  v34 = (void *)objc_msgSend(v27, "valueForKey:", v22);
  objc_msgSend(v34, "extent");
  if (v35 <= 1.0)
  {
    v38 = objc_msgSend(MEMORY[0x24BDBF660], "imageWithColor:", objc_msgSend(MEMORY[0x24BDBF638], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  }
  else
  {
    v36 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIGaussianBlur"));
    objc_msgSend(v36, "setValue:forKey:", v34, v19);
    *(float *)&v37 = fmin(v14, 55.0);
    objc_msgSend(v36, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37), CFSTR("inputRadius"));
    v38 = objc_msgSend(v36, "valueForKey:", v22);
  }
  v39 = v38;
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeTranslation(&v64, 0.0, v10);
  v62 = v64;
  CGAffineTransformScale(&v63, &v62, 1.0, v16);
  v64 = v63;
  v62 = v63;
  CGAffineTransformTranslate(&v63, &v62, 0.0, 10.0 - v10);
  v64 = v63;
  v40 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIAffineTransform"));
  objc_msgSend(v40, "setValue:forKey:", v33, v19);
  v63 = v64;
  objc_msgSend(v40, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGAffineTransform:", &v63), CFSTR("inputTransform"));
  memset(&v63, 0, sizeof(v63));
  CGAffineTransformMakeTranslation(&v63, 0.0, v10);
  v61 = v63;
  CGAffineTransformScale(&v62, &v61, 1.0, v16);
  v63 = v62;
  v61 = v62;
  CGAffineTransformTranslate(&v62, &v61, 0.0, 35.0 - v10);
  v63 = v62;
  v41 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIAffineTransform"));
  objc_msgSend(v41, "setValue:forKey:", v39, v19);
  v62 = v63;
  objc_msgSend(v41, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGAffineTransform:", &v62), CFSTR("inputTransform"));
  v42 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorMatrix"));
  objc_msgSend(v42, "setDefaults");
  objc_msgSend(v42, "setValue:forKey:", objc_msgSend(v41, "valueForKey:", v22), v19);
  objc_msgSend(v42, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.5), CFSTR("inputAVector"));
  v43 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CISourceOverCompositing"));
  objc_msgSend(v43, "setValue:forKey:", objc_msgSend(v40, "valueForKey:", v22), v19);
  objc_msgSend(v43, "setValue:forKey:", objc_msgSend(v42, "valueForKey:", v22), CFSTR("inputBackgroundImage"));
  v44 = objc_msgSend(v43, "valueForKey:", v22);
  v45 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIAffineClamp"));
  v46 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v62.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v62.c = v46;
  *(_OWORD *)&v62.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v45, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGAffineTransform:", &v62), CFSTR("inputTransform"));
  objc_msgSend(v45, "setValue:forKey:", v44, v19);
  v47 = objc_msgSend((id)objc_msgSend(v45, "valueForKey:", v22), "imageByCroppingToRect:", 0.0, 0.0, v7, height);
  memset(&v62, 0, sizeof(v62));
  CGAffineTransformMakeScale(&v62, 1.0, -1.0);
  v60 = v62;
  CGAffineTransformTranslate(&v61, &v60, 0.0, height);
  v62 = v61;
  v48 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIAffineTransform"));
  objc_msgSend(v48, "setValue:forKey:", v47, v19);
  v61 = v62;
  objc_msgSend(v48, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGAffineTransform:", &v61), CFSTR("inputTransform"));
  v49 = (void *)objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
  objc_msgSend(v49, "outputImageMaximumSize");
  if (v7 >= v51 || height >= v50)
  {
    v54 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v55 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContactShadow newShadowImageFromContext:withSize:bounds:unflipped:]");
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContactShadow.m"), 383, CFSTR("Cannot render contact shadow, the size is too large for the CIContext to render. Returning empty image instead"));
    v53 = -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, 150.0);
  }
  else
  {
    v52 = (void *)objc_msgSend(v48, "valueForKey:", v22);
    objc_msgSend(v52, "extent");
    v53 = (CGImage *)objc_msgSend(v49, "createCGImage:fromRect:", v52);
  }
  v56 = v53;
  CGImageRelease(image);
  return v56;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__TSDContactShadow_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __41__TSDContactShadow_mixingTypeWithObject___block_invoke(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 40), "height");
    v5 = v4;
    objc_msgSend(v3, "height");
    if (vabdd_f64(v5, v6) >= 0.00999999978)
      return 3;
    objc_msgSend(*(id *)(a1 + 40), "perspective");
    v8 = v7;
    objc_msgSend(v3, "perspective");
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
  v5[2] = __53__TSDContactShadow_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDContactShadow *__53__TSDContactShadow_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
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
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "offset");
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v2, "offset");
    TSUMix();
    v4 = v5;
    objc_msgSend(*(id *)(a1 + 40), "height");
    objc_msgSend(v2, "height");
    TSUMix();
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    objc_msgSend(v2, "radius");
    TSUMix();
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "opacity");
    objc_msgSend(v2, "opacity");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "height");
    v7 = v10;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    v9 = v11;
    objc_msgSend(*(id *)(a1 + 40), "opacity");
  }
  TSUMix();
  v13 = v12;
  v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", objc_msgSend(*(id *)(a1 + 40), "color"));
  if (v2)
    v15 = v2;
  else
    v15 = *(void **)(a1 + 40);
  v16 = (void *)objc_msgSend(v14, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", objc_msgSend(v15, "color")), *(double *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 40), "isEnabled") & 1) != 0)
    v17 = 1;
  else
    v17 = objc_msgSend(v2, "isEnabled");
  return -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:]([TSDContactShadow alloc], "initWithOffset:height:radius:opacity:color:enabled:", objc_msgSend(v16, "CGColor"), v17, v4, v7, v9, v13);
}

- (double)height
{
  return self->mHeight;
}

@end
