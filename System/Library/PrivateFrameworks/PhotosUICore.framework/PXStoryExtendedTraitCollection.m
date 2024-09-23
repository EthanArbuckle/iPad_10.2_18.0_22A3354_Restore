@implementation PXStoryExtendedTraitCollection

- (PXStoryExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3
{
  return -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:displayScale:](self, "initWithLayoutReferenceSize:displayScale:", a3.width, a3.height, 1.0);
}

- (PXStoryExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3 displayScale:(double)a4
{
  CGFloat height;
  CGFloat width;
  PXStoryExtendedTraitCollection *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryExtendedTraitCollection;
  result = -[PXExtendedTraitCollection initWithViewController:](&v8, sel_initWithViewController_, 0);
  if (result)
  {
    result->_layoutReferenceSize.width = width;
    result->_layoutReferenceSize.height = height;
    result->_displayScale = a4;
  }
  return result;
}

- (int64_t)layoutOrientation
{
  if (self->_layoutReferenceSize.width <= self->_layoutReferenceSize.height)
    return 1;
  else
    return 2;
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  objc_super v3;

  self->_layoutReferenceSize = a3;
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExtendedTraitCollection;
  -[PXExtendedTraitCollection setLayoutReferenceSize:](&v3, sel_setLayoutReferenceSize_);
}

- (void)setDisplayScale:(double)a3
{
  objc_super v3;

  self->_displayScale = a3;
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExtendedTraitCollection;
  -[PXExtendedTraitCollection setDisplayScale:](&v3, sel_setDisplayScale_);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryExtendedTraitCollection;
  -[PXStoryExtendedTraitCollection performChanges:](&v3, sel_performChanges_, a3);
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (double)viewportCornerRadius
{
  return self->_viewportCornerRadius;
}

- (NSShadow)viewportShadow
{
  return self->_viewportShadow;
}

- (double)bottomTitleContentOffset
{
  return self->_bottomTitleContentOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportShadow, 0);
}

@end
