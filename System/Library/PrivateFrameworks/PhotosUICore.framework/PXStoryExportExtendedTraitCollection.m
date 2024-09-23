@implementation PXStoryExportExtendedTraitCollection

- (PXStoryExportExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3 displayScale:(double)a4 overrideFullScreenReferenceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PXStoryExportExtendedTraitCollection *result;
  objc_super v10;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryExportExtendedTraitCollection;
  result = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:displayScale:](&v10, sel_initWithLayoutReferenceSize_displayScale_, a3.width, a3.height, a4);
  if (result)
  {
    result->_overrideFullScreenReferenceRect.origin.x = x;
    result->_overrideFullScreenReferenceRect.origin.y = y;
    result->_overrideFullScreenReferenceRect.size.width = width;
    result->_overrideFullScreenReferenceRect.size.height = height;
  }
  return result;
}

- (void)setOverrideFullScreenReferenceRect:(CGRect)a3
{
  self->_overrideFullScreenReferenceRect = a3;
}

- (CGRect)fullScreenReferenceRect
{
  CGRect *p_overrideFullScreenReferenceRect;
  double v4;
  CGFloat width;
  double v6;
  double height;
  double x;
  double y;
  double v10;
  CGRect result;

  p_overrideFullScreenReferenceRect = &self->_overrideFullScreenReferenceRect;
  if (CGRectIsEmpty(self->_overrideFullScreenReferenceRect))
  {
    -[PXStoryExtendedTraitCollection layoutReferenceSize](self, "layoutReferenceSize");
    width = v4;
    -[PXStoryExtendedTraitCollection layoutReferenceSize](self, "layoutReferenceSize");
    height = v6;
    x = 0.0;
    y = 0.0;
  }
  else
  {
    x = p_overrideFullScreenReferenceRect->origin.x;
    y = p_overrideFullScreenReferenceRect->origin.y;
    width = p_overrideFullScreenReferenceRect->size.width;
    height = p_overrideFullScreenReferenceRect->size.height;
  }
  v10 = width;
  result.size.height = height;
  result.size.width = v10;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryExportExtendedTraitCollection;
  -[PXStoryExtendedTraitCollection performChanges:](&v3, sel_performChanges_, a3);
}

- (CGRect)overrideFullScreenReferenceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_overrideFullScreenReferenceRect.origin.x;
  y = self->_overrideFullScreenReferenceRect.origin.y;
  width = self->_overrideFullScreenReferenceRect.size.width;
  height = self->_overrideFullScreenReferenceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
