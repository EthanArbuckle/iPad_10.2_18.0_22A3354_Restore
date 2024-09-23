@implementation TSDDrawableLayout

- (void)dealloc
{
  objc_super v3;

  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout dealloc](&v3, sel_dealloc);
}

- (CGRect)boundsInfluencingExteriorWrap
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[TSDAbstractLayout frameInRoot](self, "frameInRoot");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
  if (v11)
  {
    objc_msgSend(v11, "margin");
    if (v12 > 0.0)
    {
      v13 = -v12;
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectInset(v18, v13, v13);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)i_computeWrapPath
{
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
}

- (id)i_wrapPath
{
  id result;

  result = self->mCachedWrapPath;
  if (!result)
  {
    result = -[TSDDrawableLayout i_computeWrapPath](self, "i_computeWrapPath");
    self->mCachedWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)i_externalWrapPath
{
  id result;

  result = self->mCachedExternalWrapPath;
  if (!result)
  {
    result = +[TSDBezierPath exteriorOfBezierPath:](TSDBezierPath, "exteriorOfBezierPath:", -[TSDDrawableLayout i_wrapPath](self, "i_wrapPath"));
    self->mCachedExternalWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)wrapPolygon
{
  id result;
  TSDBezierPath *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  TSDWrapPolygon *v10;
  void *v11;
  uint64_t v12;
  _BYTE v13[48];

  result = self->mCachedWrapPolygon;
  if (!result)
  {
    v4 = -[TSDDrawableLayout i_wrapPath](self, "i_wrapPath");
    v5 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
    if (v5 && (v6 = v5, objc_msgSend(v5, "margin"), v7 > 0.0))
    {
      if (-[TSDBezierPath elementCount](v4, "elementCount") >= 1001)
      {
        -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
        v4 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
      }
      objc_msgSend(v6, "margin");
      v8 = -[TSDBezierPath bezierPathByOffsettingPath:joinStyle:withThreshold:](v4, "bezierPathByOffsettingPath:joinStyle:withThreshold:", 1);
    }
    else
    {
      v8 = (id)-[TSDBezierPath copy](v4, "copy");
    }
    v9 = v8;
    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
    objc_msgSend(v9, "transformUsingAffineTransform:", v13);
    v10 = -[TSDWrapPolygon initWithPath:]([TSDWrapPolygon alloc], "initWithPath:", v9);
    self->mCachedWrapPolygon = v10;
    -[TSDWrapPolygon setIntersectsSelf:](v10, "setIntersectsSelf:", 0);
    result = self->mCachedWrapPolygon;
    if (!result)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableLayout wrapPolygon]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableLayout.m"), 118, CFSTR("invalid nil value for '%s'"), "mCachedWrapPolygon");
      return self->mCachedWrapPolygon;
    }
  }
  return result;
}

- (BOOL)isHTMLWrap
{
  void *v2;

  v2 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isHTMLWrap");
  return (char)v2;
}

- (int)wrapType
{
  void *v2;

  v2 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "type");
  return (int)v2;
}

- (int)wrapDirection
{
  void *v2;

  v2 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
  if (v2)
    return objc_msgSend(v2, "direction");
  else
    return 2;
}

- (int)wrapFitType
{
  void *v2;

  v2 = (void *)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap");
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "fitType");
  return (int)v2;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout invalidate](&v3, sel_invalidate);
  -[TSDDrawableLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)invalidateExteriorWrap
{

  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout dragBy:](&v4, sel_dragBy_, a3.x, a3.y);
  -[TSDDrawableLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)setGeometry:(id)a3
{
  TSDLayoutGeometry *v5;
  TSDLayoutGeometry *v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  double v12;
  TSDWrapPolygon *mCachedWrapPolygon;
  CGFloat v14;
  double v15;
  __int128 v16;
  float64x2_t v17;
  objc_super v18;
  CGAffineTransform v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v5 = -[TSDAbstractLayout geometry](self, "geometry");
  if (!v5)
  {
    if (!self->mCachedWrapPolygon)
      goto LABEL_11;
    goto LABEL_8;
  }
  v6 = v5;
  if (-[TSDLayoutGeometry isEqual:](v5, "isEqual:", a3) || !self->mCachedWrapPolygon)
    goto LABEL_11;
  if (-[TSDLayoutGeometry differsInMoreThanTranslationFrom:](v6, "differsInMoreThanTranslationFrom:", a3))
  {
LABEL_8:
    -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    goto LABEL_11;
  }
  if (a3)
  {
    objc_msgSend(a3, "transform");
    v8 = v23;
    v9 = v24;
    v10 = v25;
  }
  else
  {
    v10 = 0uLL;
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    v8 = 0uLL;
    v9 = 0uLL;
  }
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v16 = *MEMORY[0x24BDBEFB0];
  v17 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v11), v8, *MEMORY[0x24BDBEFB0]));
  -[TSDLayoutGeometry transform](v6, "transform", *(_QWORD *)&v11, v7);
  v12 = TSDSubtractPoints(v17.f64[0], v17.f64[1], vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v15), v20, *(double *)&v16)).f64[0]);
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  CGAffineTransformMakeTranslation(&v19, v12, v14);
  -[TSDWrapPolygon transformUsingAffineTransform:](mCachedWrapPolygon, "transformUsingAffineTransform:", &v19);
LABEL_11:
  v18.receiver = self;
  v18.super_class = (Class)TSDDrawableLayout;
  -[TSDAbstractLayout setGeometry:](&v18, sel_setGeometry_, a3);
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 521)
    -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)parentDidChange
{
  objc_super v3;

  -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableLayout;
  -[TSDLayout parentDidChange](&v3, sel_parentDidChange);
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)i_invalidateWrap
{
  TSDAbstractLayout *v3;
  TSDAbstractLayout *v4;

  v3 = -[TSDAbstractLayout parent](self, "parent");
  if (v3)
  {
    v4 = v3;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v4 = -[TSDAbstractLayout parent](v4, "parent");
      if (!v4)
        return;
    }
    -[TSDAbstractLayout wrappableChildInvalidated:](v4, "wrappableChildInvalidated:", self);
  }
}

- (void)invalidateParentForWrap
{
  if (-[TSDLayout isBeingManipulated](self, "isBeingManipulated"))
    -[TSDDrawableLayout i_invalidateWrap](self, "i_invalidateWrap");
}

- (BOOL)supportsInspectorPositioning
{
  if (-[TSDInfo isAnchoredToText](-[TSDLayout info](self, "info"), "isAnchoredToText")
    && (objc_msgSend((id)-[TSDInfo exteriorTextWrap](-[TSDLayout info](self, "info"), "exteriorTextWrap"), "isHTMLWrap") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return -[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") ^ 1;
  }
}

@end
