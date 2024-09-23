@implementation TSDFrame

- (TSDFrame)initWithFrameSpec:(id)a3 assetScale:(double)a4 archivableFrameName:(id)a5
{
  TSDFrame *v8;
  TSDFrame *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  TSDFrame *v15;
  objc_super v17;

  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrame initWithFrameSpec:assetScale:archivableFrameName:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 81, CFSTR("invalid nil value for '%s'"), "spec");
    if (a5)
      goto LABEL_3;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4);
  v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrame initWithFrameSpec:assetScale:archivableFrameName:]");
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 82, CFSTR("invalid nil value for '%s'"), "archivableFrameName");
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)TSDFrame;
  v8 = -[TSDStroke initWithColor:width:cap:join:pattern:](&v17, sel_initWithColor_width_cap_join_pattern_, objc_msgSend(MEMORY[0x24BEB3C40], "blackColor", a4), 0, 0, +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"), 2.0);
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      v8->mSpec = (TSDFrameSpec *)objc_msgSend(a3, "copy");
      v9->mFrameName = (NSString *)objc_msgSend(a5, "copy");
      -[TSDFrameSpec i_minimumAssetScale](v9->mSpec, "i_minimumAssetScale");
      TSUClamp();
      v9->mAssetScale = v10;
      p_calculateDerivedValuesFromFrameSpecAndAssetScale(v9->mSpec, &v9->mLeftWidth, &v9->mRightWidth, &v9->mTopHeight, &v9->mBottomHeight, (uint64_t)&v9->mAdornmentSize, v10);
    }
    else
    {
      v15 = v8;
      return 0;
    }
  }
  return v9;
}

- (TSDFrame)initWithFrameSpec:(id)a3 assetScale:(double)a4
{
  return -[TSDFrame initWithFrameSpec:assetScale:archivableFrameName:](self, "initWithFrameSpec:assetScale:archivableFrameName:", a3, objc_msgSend(a3, "frameName"), a4);
}

- (TSDFrame)initWithFrameSpec:(id)a3
{
  return -[TSDFrame initWithFrameSpec:assetScale:](self, "initWithFrameSpec:assetScale:", a3, 1.0);
}

- (TSDFrame)initWithFrameName:(id)a3
{
  return -[TSDFrame initWithFrameSpec:](self, "initWithFrameSpec:", +[TSDFrameSpec frameSpecWithName:](TSDFrameSpec, "frameSpecWithName:", a3));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDFrame;
  -[TSDFrame dealloc](&v3, sel_dealloc);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableFrame *v4;
  TSDFrameSpec *v5;
  double v6;

  v4 = +[TSDMutableFrame allocWithZone:](TSDMutableFrame, "allocWithZone:", a3);
  v5 = -[TSDFrame frameSpec](self, "frameSpec");
  -[TSDFrame assetScale](self, "assetScale");
  return -[TSDFrame initWithFrameSpec:assetScale:archivableFrameName:](v4, "initWithFrameSpec:assetScale:archivableFrameName:", v5, -[TSDFrame archivableFrameName](self, "archivableFrameName"), v6);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  TSDFrameSpec *mSpec;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDFrame;
  LODWORD(v4) = -[TSDStroke isEqual:](&v11, sel_isEqual_);
  if ((_DWORD)v4)
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      mSpec = self->mSpec;
      if (mSpec == (TSDFrameSpec *)objc_msgSend(v4, "frameSpec"))
      {
        LODWORD(v4) = -[NSString isEqualToString:](self->mFrameName, "isEqualToString:", objc_msgSend(v5, "archivableFrameName"));
        if ((_DWORD)v4)
        {
          -[TSDFrame assetScale](self, "assetScale");
          v8 = v7;
          objc_msgSend(v5, "assetScale");
          LOBYTE(v4) = v8 == v9;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

- (unint64_t)hash
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDFrame;
  -[TSDStroke hash](&v4, sel_hash);
  -[TSDFrameSpec hash](self->mSpec, "hash");
  -[NSString hash](self->mFrameName, "hash");
  return TSUHashWithSeed();
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[TSDFrame frameName](self, "frameName");
  -[TSDFrame assetScale](self, "assetScale");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p frameName='%@' assetScale=%f>"), v5, self, v6, v7);
}

- (id)frameName
{
  return -[TSDFrameSpec frameName](-[TSDFrame frameSpec](self, "frameSpec"), "frameName");
}

- (id)archivableFrameName
{
  id result;
  void *v4;
  uint64_t v5;

  result = self->mFrameName;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrame archivableFrameName]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 194, CFSTR("invalid nil value for '%s'"), "mFrameName");
    result = self->mFrameName;
    if (!result)
      return -[TSDFrameSpec frameName](-[TSDFrame frameSpec](self, "frameSpec"), "frameName");
  }
  return result;
}

- (double)minimumAssetScale
{
  double result;

  -[TSDFrameSpec i_minimumAssetScale](-[TSDFrame frameSpec](self, "frameSpec"), "i_minimumAssetScale");
  return result;
}

- (BOOL)hasMask
{
  return -[TSDFrameSpec i_hasMask](-[TSDFrame frameSpec](self, "frameSpec"), "i_hasMask");
}

- (CGRect)p_coverageRectWithoutAdornment:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double mLeftWidth;
  double v21;
  double v22;
  double mTopHeight;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDFrameSpec i_hasImages](self->mSpec, "i_hasImages"))
    v8 = width < 2.0;
  else
    v8 = 1;
  if (!v8 && height >= 2.0)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectInset(v27, 1.0, 1.0);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }
  -[TSDFrameSpec i_leftInset](self->mSpec, "i_leftInset");
  *(float *)&v10 = v10 * self->mAssetScale;
  v11 = ceilf(*(float *)&v10);
  -[TSDFrameSpec i_rightInset](self->mSpec, "i_rightInset");
  *(float *)&v12 = v12 * self->mAssetScale;
  v13 = ceilf(*(float *)&v12);
  -[TSDFrameSpec i_bottomInset](self->mSpec, "i_bottomInset");
  *(float *)&v14 = v14 * self->mAssetScale;
  v15 = ceilf(*(float *)&v14);
  -[TSDFrameSpec i_topInset](self->mSpec, "i_topInset");
  *(float *)&v16 = v16 * self->mAssetScale;
  v17 = ceilf(*(float *)&v16);
  v18 = y + v17;
  v19 = height - (v15 + v17);
  mLeftWidth = self->mLeftWidth;
  v21 = x + v11 - mLeftWidth;
  v22 = mLeftWidth + self->mRightWidth;
  mTopHeight = self->mTopHeight;
  v24 = width - (v11 + v13) + v22;
  v25 = v18 - mTopHeight;
  v26 = v19 + mTopHeight + self->mBottomHeight;
  result.size.height = v26;
  result.size.width = v24;
  result.origin.y = v25;
  result.origin.x = v21;
  return result;
}

- (CGRect)p_coverageRectWithAdornment:(CGRect)a3
{
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[TSDFrame p_coverageRectWithoutAdornment:](self, "p_coverageRectWithoutAdornment:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[TSDFrameSpec i_hasAdornment](self->mSpec, "i_hasAdornment"))
  {
    -[TSDFrame i_adornmentRectForRect:](self, "i_adornmentRectForRect:", v5, v7, v9, v11);
    v5 = TSDUnionRect(v12, v13, v14, v15, v5, v7, v9, v11);
    v7 = v16;
    v9 = v17;
    v11 = v18;
  }
  v19 = v5;
  v20 = v7;
  v21 = v9;
  v22 = v11;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)coverageRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDFrame p_coverageRectWithAdornment:](self, "p_coverageRectWithAdornment:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TSDFrame p_minimumRenderedSize](self, "p_minimumRenderedSize");
  if (v13 < v17 || v15 < v16)
  {
    v15 = height;
    v13 = width;
    v11 = y;
    v9 = x;
  }
  v19 = v9;
  v20 = v11;
  v21 = v13;
  v22 = v15;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)coverageRectWithoutAdornment:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDFrame coverageRect:](self, "coverageRect:");
  v22.origin.x = v8;
  v22.origin.y = v9;
  v22.size.width = v10;
  v22.size.height = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (!CGRectEqualToRect(v20, v22))
  {
    -[TSDFrame p_coverageRectWithoutAdornment:](self, "p_coverageRectWithoutAdornment:", x, y, width, height);
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)isFrame
{
  return 1;
}

- (BOOL)supportsPattern
{
  return 0;
}

- (BOOL)supportsColor
{
  return 0;
}

- (BOOL)supportsLineOptions
{
  return 0;
}

- (BOOL)shouldRender
{
  return 1;
}

- (BOOL)shouldRenderForSizeIncludingCoverage:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.height;
  width = a3.width;
  -[TSDFrame p_minimumRenderedSize](self, "p_minimumRenderedSize");
  return height >= v6 && width >= v5;
}

- (_TSDStrokeOutsets)outsets
{
  double v3;
  double v4;
  double v5;
  double mLeftWidth;
  double v7;
  double v8;
  double mRightWidth;
  double v10;
  double v11;
  double mTopHeight;
  double v13;
  double v14;
  double mBottomHeight;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _TSDStrokeOutsets result;

  v3 = 0.0;
  if (-[TSDFrameSpec i_hasAdornment](self->mSpec, "i_hasAdornment"))
  {
    v4 = self->mTopHeight * 0.5;
    -[TSDFrameSpec i_adornmentPosition](self->mSpec, "i_adornmentPosition");
    v3 = v4 + v5 - self->mAdornmentSize.height * 0.5;
    if (v3 > 0.0)
      v3 = 0.0;
  }
  mLeftWidth = self->mLeftWidth;
  -[TSDFrameSpec i_leftInset](self->mSpec, "i_leftInset");
  v8 = mLeftWidth - v7 * self->mAssetScale;
  mRightWidth = self->mRightWidth;
  -[TSDFrameSpec i_rightInset](self->mSpec, "i_rightInset");
  v11 = mRightWidth - v10 * self->mAssetScale;
  mTopHeight = self->mTopHeight;
  -[TSDFrameSpec i_topInset](self->mSpec, "i_topInset");
  v14 = mTopHeight - v13 * self->mAssetScale - v3;
  mBottomHeight = self->mBottomHeight;
  -[TSDFrameSpec i_bottomInset](self->mSpec, "i_bottomInset");
  v17 = mBottomHeight - v16 * self->mAssetScale;
  v18 = v8;
  v19 = v11;
  v20 = v14;
  result.var3 = v17;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (BOOL)isNullStroke
{
  return 0;
}

- (BOOL)canApplyDirectlyToRepCALayer
{
  return !-[TSDFrame shouldRender](self, "shouldRender");
}

- (BOOL)canApplyToCAShapeLayer
{
  return 0;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6
{
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  TSDFrameRep *v14;
  CGRect BoundingBox;

  if (a4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4, a5, a6);
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrame paintPath:wantsInteriorStroke:inContext:useFastDrawing:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 365, CFSTR("Can't draw interior frame stroke"));
  }
  v14 = -[TSDFrameRep initWithTSDFrame:]([TSDFrameRep alloc], "initWithTSDFrame:", self);
  TSUScreenScale();
  if (v11 != TSDCGContextAssociatedScreenScale((uint64_t)a5))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrame paintPath:wantsInteriorStroke:inContext:useFastDrawing:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 368, CFSTR("rendering a frame into a context with incorrect associated screen scale"));
  }
  BoundingBox = CGPathGetBoundingBox(a3);
  -[TSDFrameRep frameRect:inContext:withTotalScale:](v14, "frameRect:inContext:withTotalScale:", a5, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height, TSDCGContextAssociatedScreenScale((uint64_t)a5));

}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double y;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double mLeftWidth;
  double mTopHeight;
  double mBottomHeight;
  double v21;
  void *v22;
  uint64_t v23;
  float v24;
  float v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double mRightWidth;
  double v34;
  double v35;
  double mAssetScale;
  double v37;
  double width;
  double x;
  TSDFrameRep *v40;

  height = a3.size.height;
  y = a3.origin.y;
  width = a3.size.width;
  x = a3.origin.x;
  if (-[TSDFrameSpec i_hasAdornment](self->mSpec, "i_hasAdornment"))
  {
    v8 = self->mAdornmentSize.height * 0.5;
    -[TSDFrameSpec i_adornmentPosition](self->mSpec, "i_adornmentPosition");
    y = y + v8 - v9;
    height = height - (v8 - v9);
  }
  -[TSDFrameSpec i_leftInset](self->mSpec, "i_leftInset", *(_QWORD *)&height, *(_QWORD *)&y);
  v37 = v10;
  mAssetScale = self->mAssetScale;
  -[TSDFrameSpec i_rightInset](self->mSpec, "i_rightInset");
  v35 = v11;
  v34 = self->mAssetScale;
  -[TSDFrameSpec i_bottomInset](self->mSpec, "i_bottomInset");
  v13 = v12;
  v14 = self->mAssetScale;
  -[TSDFrameSpec i_topInset](self->mSpec, "i_topInset");
  v16 = v15;
  v17 = self->mAssetScale;
  mLeftWidth = self->mLeftWidth;
  mRightWidth = self->mRightWidth;
  mTopHeight = self->mTopHeight;
  mBottomHeight = self->mBottomHeight;
  v40 = -[TSDFrameRep initWithTSDFrame:]([TSDFrameRep alloc], "initWithTSDFrame:", self);
  TSUScreenScale();
  if (v21 != TSDCGContextAssociatedScreenScale((uint64_t)a4))
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrame drawSwatchInRect:inContext:]");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 409, CFSTR("rendering a frame into a context with incorrect associated screen scale"));
  }
  v24 = v13 * v14;
  v25 = v16 * v17;
  v26 = ceilf(v25);
  v27 = v31 + ceilf(v24) + v26 - (mTopHeight + mBottomHeight);
  v28 = v32 - v26 + mTopHeight;
  v29 = v37 * mAssetScale;
  v30 = ceilf(v29);
  *(float *)&v26 = v35 * v34;
  -[TSDFrameRep frameRect:inContext:withTotalScale:](v40, "frameRect:inContext:withTotalScale:", a4, x - v30 + mLeftWidth, v28, width + v30 + ceilf(*(float *)&v26) - (mLeftWidth + mRightWidth), v27, TSDCGContextAssociatedScreenScale((uint64_t)a4));

}

- (CGSize)p_minimumRenderedSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->mLeftWidth + self->mRightWidth;
  v3 = self->mBottomHeight + self->mTopHeight;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)assetScale
{
  return self->mAssetScale;
}

- (TSDFrameSpec)frameSpec
{
  return self->mSpec;
}

- (double)i_leftWidth
{
  return self->mLeftWidth;
}

- (double)i_rightWidth
{
  return self->mRightWidth;
}

- (double)i_topHeight
{
  return self->mTopHeight;
}

- (double)i_bottomHeight
{
  return self->mBottomHeight;
}

- (CGRect)i_adornmentRectForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3) - (self->mLeftWidth + self->mRightWidth);
  -[TSDFrameSpec i_adornmentPosition](self->mSpec, "i_adornmentPosition");
  v10 = v8 * v9;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = v10 + CGRectGetMinX(v19) + self->mLeftWidth;
  v12 = self->mTopHeight * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinY = CGRectGetMinY(v20);
  -[TSDFrameSpec i_adornmentPosition](self->mSpec, "i_adornmentPosition");
  v15 = self->mAdornmentSize.width;
  v16 = self->mAdornmentSize.height;
  v17 = v11 - v15 * 0.5;
  v18 = v12 + MinY + v14 - v16 * 0.5;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)i_willRenderForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDFrame p_minimumRenderedSize](self, "p_minimumRenderedSize");
  v9 = v8;
  v11 = v10;
  -[TSDFrame p_coverageRectWithAdornment:](self, "p_coverageRectWithAdornment:", x, y, width, height);
  return v13 >= v11 && v12 >= v9;
}

- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3
{
  double v4;

  -[TSDFrame assetScale](self, "assetScale");
  -[TSDFrame minimumAssetScale](self, "minimumAssetScale");
  TSUClamp();
  return -[TSDFrame initWithFrameSpec:assetScale:]([TSDFrame alloc], "initWithFrameSpec:assetScale:", -[TSDFrame frameSpec](self, "frameSpec"), v4);
}

@end
