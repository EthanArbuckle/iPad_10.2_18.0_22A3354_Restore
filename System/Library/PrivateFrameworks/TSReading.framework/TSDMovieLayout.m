@implementation TSDMovieLayout

- (TSDMovieLayout)initWithInfo:(id)a3
{
  TSDMovieLayout *v3;
  TSDMovieLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDMovieLayout;
  v3 = -[TSDMediaLayout initWithInfo:](&v6, sel_initWithInfo_, a3);
  v4 = v3;
  if (v3)
  {
    if (!-[TSDMovieLayout movieInfo](v3, "movieInfo"))
    {

      v4 = 0;
    }
    -[TSDLayout invalidateFrame](v4, "invalidateFrame");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mDynamicInfoGeometry = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  -[TSDDrawableLayout dealloc](&v3, sel_dealloc);
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMovieLayout;
  -[TSDMediaLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 517)
    -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (id)i_computeWrapPath
{
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
}

- (BOOL)supportsRotation
{
  return 1;
}

- (id)layoutGeometryFromInfo
{
  objc_super v3;

  if (self->mDynamicInfoGeometry)
    return -[TSDLayoutGeometry initWithInfoGeometry:]([TSDLayoutGeometry alloc], "initWithInfoGeometry:", self->mDynamicInfoGeometry);
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  return -[TSDLayout layoutGeometryFromInfo](&v3, sel_layoutGeometryFromInfo);
}

- (id)movieInfo
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return (id)TSUDynamicCast();
}

- (void)takeRotationFromTracker:(id)a3
{
  void *v5;
  _OWORD v6[3];
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDMovieLayout;
  -[TSDLayout takeRotationFromTracker:](&v11, sel_takeRotationFromTracker_);

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  if (a3)
    objc_msgSend(a3, "rotateTransform");
  else
    memset(v7, 0, sizeof(v7));
  -[TSDLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v7);
  v5 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  self->mDynamicInfoGeometry = (TSDInfoGeometry *)(id)objc_msgSend(v5, "geometryByAppendingTransform:", v6);
  -[TSDLayout invalidatePosition](self, "invalidatePosition");
}

- (void)beginDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  -[TSDLayout beginDynamicOperation](&v3, sel_beginDynamicOperation);
  -[TSDMovieLayout p_createDynamicCopies](self, "p_createDynamicCopies");
}

- (void)endDynamicOperation
{
  objc_super v3;

  if (-[TSDInfo owningAttachment](-[TSDLayout info](self, "info"), "owningAttachment"))
    -[TSDDrawableLayout invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieLayout;
  -[TSDLayout endDynamicOperation](&v3, sel_endDynamicOperation);
  -[TSDMovieLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");
}

- (CGRect)fullReflectionBoundsForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  CGFloat MaxY;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxY = CGRectGetMaxY(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v9 = CGRectGetWidth(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v10 = CGRectGetHeight(v16) + 1.0;
  v11 = MinX;
  v12 = MaxY;
  v13 = v9;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)fullReflectionFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDStyledLayout i_baseFrame](self, "i_baseFrame");
  -[TSDMovieLayout fullReflectionBoundsForRect:](self, "fullReflectionBoundsForRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)computeLayoutGeometry
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  objc_super v36;
  CGRect v37;

  v36.receiver = self;
  v36.super_class = (Class)TSDMovieLayout;
  v3 = -[TSDLayout computeLayoutGeometry](&v36, sel_computeLayoutGeometry);
  objc_opt_class();
  -[TSDMediaLayout stroke](self, "stroke");
  v4 = (void *)TSUDynamicCast();
  -[TSDMediaLayout setShouldRenderFrameStroke:](self, "setShouldRenderFrameStroke:", 0);
  if (v4 && objc_msgSend(v4, "shouldRender"))
  {
    if (objc_msgSend(v4, "isFrame"))
    {
      objc_msgSend(v3, "size");
      v5 = TSDRectWithSize();
      v7 = v6;
      v9 = v8;
      v11 = v10;
      objc_msgSend(v4, "coverageRect:");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v20, "setSize:", v17, v19);
      if (v20)
        objc_msgSend(v20, "transform");
      else
        memset(&v34, 0, sizeof(v34));
      CGAffineTransformTranslate(&v35, &v34, v13, v15);
      v33 = v35;
      objc_msgSend(v20, "setTransform:", &v33);
      v21 = v20;
      v28 = -v13;
      v29 = -v15;
      v24 = v5;
      v25 = v7;
      v26 = v9;
      v27 = v11;
    }
    else
    {
      objc_msgSend(v4, "width");
      v23 = v22 * 0.5;
      v21 = (id)objc_msgSend(v3, "geometryByOutsettingBy:", v23, v23);
      objc_msgSend(v3, "size");
      v24 = TSDRectWithSize();
      v28 = v23;
      v29 = v23;
    }
    v37 = CGRectOffset(*(CGRect *)&v24, v28, v29);
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  }
  else
  {
    objc_msgSend(v3, "size");
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", TSDRectWithSize());
    v21 = v3;
    if (!v4)
      return v3;
  }
  if (objc_msgSend(v4, "isFrame"))
  {
    objc_msgSend(v3, "size");
    objc_msgSend(v4, "coverageRectWithoutAdornment:", TSDRectWithSize());
    -[TSDMediaLayout setShouldRenderFrameStroke:](self, "setShouldRenderFrameStroke:", objc_msgSend(v4, "shouldRenderForSizeIncludingCoverage:", v30, v31));
  }
  return v21;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  _BOOL4 v3;
  TSDLayoutGeometry *v5;
  TSDAbstractLayout *v6;
  CGAffineTransform v7;
  CGAffineTransform t2;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  v3 = a3;
  memset(&v10, 0, sizeof(v10));
  v5 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v5)
  {
    -[TSDLayoutGeometry fullTransform](v5, "fullTransform");
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    if (!v3)
      goto LABEL_10;
  }
  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    v6 = -[TSDAbstractLayout parent](self, "parent");
    if (v6)
      -[TSDAbstractLayout transformInRoot](v6, "transformInRoot");
    else
      memset(&t2, 0, sizeof(t2));
    v7 = v10;
    CGAffineTransformConcat(&v9, &v7, &t2);
    v10 = v9;
  }
LABEL_10:
  v9 = v10;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  return CGRectApplyAffineTransform(v11, &v9);
}

- (void)p_createDynamicCopies
{
  void *v3;
  uint64_t v4;

  if (self->mDynamicInfoGeometry)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieLayout p_createDynamicCopies]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieLayout.m"), 240, CFSTR("expected nil value for '%s'"), "mDynamicInfoGeometry");
  }
  self->mDynamicInfoGeometry = (TSDInfoGeometry *)objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "copy");
}

- (void)p_destroyDynamicCopies
{
  TSDInfoGeometry *mDynamicInfoGeometry;
  void *v4;
  uint64_t v5;

  mDynamicInfoGeometry = self->mDynamicInfoGeometry;
  if (!mDynamicInfoGeometry)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieLayout p_destroyDynamicCopies]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieLayout.m"), 246, CFSTR("invalid nil value for '%s'"), "mDynamicInfoGeometry");
    mDynamicInfoGeometry = self->mDynamicInfoGeometry;
  }

  self->mDynamicInfoGeometry = 0;
}

@end
