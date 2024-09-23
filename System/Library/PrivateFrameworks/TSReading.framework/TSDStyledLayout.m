@implementation TSDStyledLayout

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[TSDAbstractLayout alignmentFrame](self, "alignmentFrame");
  v8 = TSDRoundedRectForScale(v4, v5, v6, v7, a3);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  TSDAbstractLayout *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  TSDAbstractLayout *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v3 = -[TSDAbstractLayout parent](self, "parent");
  -[TSDAbstractLayout alignmentFrame](self, "alignmentFrame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (v3)
  {
    v12 = -[TSDAbstractLayout parent](self, "parent");
    if (v12)
      -[TSDAbstractLayout transformInRoot](v12, "transformInRoot");
    else
      memset(&v17, 0, sizeof(v17));
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectApplyAffineTransform(v18, &v17);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)shadowedNaturalBoundsWithoutOffset
{
  double x;
  double v4;
  CGFloat y;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  void *v10;
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

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  x = TSDRectWithSize();
  y = v4;
  width = v6;
  height = v8;
  v10 = (void *)objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "shadow");
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, "isEnabled"))
    {
      objc_msgSend(v11, "radius");
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

- (CGRect)reflectionBoundsForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  CGFloat MinX;
  CGFloat MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = a3.size.height * 0.400000006;
  v8 = a3.size.height * 0.400000006 + 1.0;
  MinX = CGRectGetMinX(a3);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MaxY = CGRectGetMaxY(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v11 = CGRectGetWidth(v16);
  if (v7 >= 120.0)
    v12 = 121.0;
  else
    v12 = v8;
  v13 = MinX;
  v14 = MaxY;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)i_baseFrame
{
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
  CGRect result;

  -[TSDStyledLayout alignmentFrameInRoot](self, "alignmentFrameInRoot");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    objc_msgSend(-[TSDAbstractLayout geometryInRoot](-[TSDAbstractLayout parent](self, "parent"), "geometryInRoot"), "frame");
    v4 = TSDSubtractPoints(v4, v6, v11);
    v6 = v12;
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)reflectionFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDStyledLayout i_baseFrame](self, "i_baseFrame");
  -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)reflectionFrameInRoot
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDStyledLayout alignmentFrameInRoot](self, "alignmentFrameInRoot");
  -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)reflectionFrameForSubRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat r1;
  CGFloat r1a;
  double v30;
  CGFloat MinX;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDStyledLayout i_baseFrame](self, "i_baseFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v30 = v12;
  v15 = v14;
  v16 = -v8;
  v17 = -v10;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectOffset(v32, v16, v17);
  v27 = v33.origin.y;
  r1 = v33.origin.x;
  v25 = v33.size.height;
  v26 = v33.size.width;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinX = CGRectGetMinX(v33);
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  v18 = v15 + CGRectGetMaxY(v34);
  v35.origin.y = v27;
  v35.origin.x = r1;
  v35.size.height = v25;
  v35.size.width = v26;
  r1a = v18 - CGRectGetMaxY(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v19 = CGRectGetWidth(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v20 = CGRectGetHeight(v37) + 1.0;
  -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:", v9, v11, v30, v15);
  v40.origin.x = v21;
  v40.origin.y = v22;
  v40.size.width = v23;
  v40.size.height = v24;
  v38.origin.x = MinX;
  v38.origin.y = r1a;
  v38.size.width = v19;
  v38.size.height = v20;
  return CGRectIntersection(v38, v40);
}

- (CGRect)frameForCulling
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;
  CGRect v32;

  -[TSDAbstractLayout alignmentFrame](self, "alignmentFrame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v7 = v25.origin.x;
  v8 = v25.origin.y;
  v9 = v25.size.width;
  v10 = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    v11 = (void *)objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "shadow");
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "isEnabled"))
      {
        objc_msgSend(v12, "shadowBoundsForRect:", x, y, width, height);
        v31.origin.x = v13;
        v31.origin.y = v14;
        v31.size.width = v15;
        v31.size.height = v16;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v31);
        v7 = v27.origin.x;
        v8 = v27.origin.y;
        v9 = v27.size.width;
        v10 = v27.size.height;
      }
    }
    if (objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "reflection"))
    {
      -[TSDStyledLayout reflectionBoundsForRect:](self, "reflectionBoundsForRect:", x, y, width, height);
      v32.origin.x = v17;
      v32.origin.y = v18;
      v32.size.width = v19;
      v32.size.height = v20;
      v28.origin.x = v7;
      v28.origin.y = v8;
      v28.size.width = v9;
      v28.size.height = v10;
      v29 = CGRectUnion(v28, v32);
      v7 = v29.origin.x;
      v8 = v29.origin.y;
      v9 = v29.size.width;
      v10 = v29.size.height;
    }
  }
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)opacity
{
  float v3;

  if (self->mIsUpdatingOpacity)
    return self->mDynamicOpacity;
  objc_msgSend(-[TSDStyledLayout styledInfo](self, "styledInfo"), "opacity");
  return v3;
}

- (BOOL)isInvisible
{
  return 0;
}

- (BOOL)canFlip
{
  return 1;
}

- (void)dynamicOpacityChangeDidBegin
{
  self->mIsUpdatingOpacity = 1;
}

- (void)dynamicOpacityUpdateToValue:(double)a3
{
  self->mDynamicOpacity = a3;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self), "processChangedProperty:", 518);
}

- (void)dynamicOpacityChangeDidEnd
{
  self->mIsUpdatingOpacity = 0;
}

@end
