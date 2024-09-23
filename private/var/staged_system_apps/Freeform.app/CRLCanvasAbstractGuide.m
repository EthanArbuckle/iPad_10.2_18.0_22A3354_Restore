@implementation CRLCanvasAbstractGuide

- (id)renderableWithICC:(id)a3
{
  return 0;
}

- (CRLCanvasAbstractGuide)init
{
  CRLCanvasAbstractGuide *v2;
  void *v3;
  CGSize size;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasAbstractGuide;
  v2 = -[CRLCanvasAbstractGuide init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasGuideController guideColor](CRLCanvasGuideController, "guideColor"));
    v2->mGuideColor = CGColorRetain((CGColorRef)objc_msgSend(v3, "CGColor"));

    size = CGRectNull.size;
    v2->mSnappingObjectFrame.origin = CGRectNull.origin;
    v2->mSnappingObjectFrame.size = size;
  }
  return v2;
}

- (void)setGuideColor:(CGColor *)a3
{
  CGColor *mGuideColor;

  mGuideColor = self->mGuideColor;
  if (mGuideColor)
    CGColorRelease(mGuideColor);
  self->mGuideColor = CGColorRetain(a3);
}

- (void)setSnappingObjectFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!sub_10005FF70(self->mSnappingObjectFrame.origin.x, self->mSnappingObjectFrame.origin.y, self->mSnappingObjectFrame.size.width, self->mSnappingObjectFrame.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    self->mSnappingObjectFrame.origin.x = x;
    self->mSnappingObjectFrame.origin.y = y;
    self->mSnappingObjectFrame.size.width = width;
    self->mSnappingObjectFrame.size.height = height;
    self->mLocationInvalidated = 1;
  }
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  return 1;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  return 1;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract guide at offset %f"), *(_QWORD *)&self->mOffset);
}

- (void)dealloc
{
  CGColor *mGuideColor;
  objc_super v4;

  mGuideColor = self->mGuideColor;
  if (mGuideColor)
    CGColorRelease(mGuideColor);
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasAbstractGuide;
  -[CRLCanvasAbstractGuide dealloc](&v4, "dealloc");
}

- (double)offset
{
  return self->mOffset;
}

- (void)setOffset:(double)a3
{
  self->mOffset = a3;
}

- (CRLCanvasLayout)snappingObjectLayout
{
  return self->mSnappingObjectLayout;
}

- (void)setSnappingObjectLayout:(id)a3
{
  objc_storeStrong((id *)&self->mSnappingObjectLayout, a3);
}

- (CGRect)snappingObjectFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mSnappingObjectFrame.origin.x;
  y = self->mSnappingObjectFrame.origin.y;
  width = self->mSnappingObjectFrame.size.width;
  height = self->mSnappingObjectFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGColor)guideColor
{
  return self->mGuideColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSnappingObjectLayout, 0);
}

@end
