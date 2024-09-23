@implementation PUPhotoEditToolPickerSpec

- (PUPhotoEditToolPickerSpec)init
{
  PUPhotoEditToolPickerSpec *v2;
  PUPhotoEditToolPickerSpec *v3;
  PUPhotoEditToolPickerSpec *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditToolPickerSpec;
  v2 = -[PUViewControllerSpec init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_toolParentViewEdgeSpacing = 10.0;
    v2->_horizontalToolTopSpacing = 12.0;
    v2->_horizontalToolBottomSpacing = 0.0;
    v2->_dotSelectionIndicatorDistance = 0.0;
    v2->_dashSelectionIndicatorDistance = 5.0;
    v2->_toolButtonPointerInteractionHighlightPadding = 6.0;
    v4 = v2;
  }

  return v3;
}

- (double)interToolSpacing
{
  int64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 28.0;
  if (v2 == 1)
    return 18.0;
  return result;
}

- (double)interToolVerticalSpacingForToolCount:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double result;
  BOOL v9;
  double v10;

  -[PUViewControllerSpec layoutReferenceSize](self, "layoutReferenceSize");
  v6 = v5;
  v7 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  if (v7 < 2)
  {
    v9 = a3 > 5;
    result = 12.0;
    v10 = 6.0;
LABEL_9:
    if (v9)
      return v10;
    return result;
  }
  if (v7 != 2)
  {
    result = 22.0;
    if (v7 != 3)
      return result;
    v9 = v6 <= 402.0 && a3 > 5;
    result = 16.0;
    v10 = 8.0;
    goto LABEL_9;
  }
  if (a3 < 6)
    return 14.0;
  result = 6.0;
  if (v6 > 375.0)
  {
    result = 8.0;
    if (v6 > 393.0)
      return 14.0;
  }
  return result;
}

- (double)toolParentViewEdgeSpacing
{
  return self->_toolParentViewEdgeSpacing;
}

- (void)setToolParentViewEdgeSpacing:(double)a3
{
  self->_toolParentViewEdgeSpacing = a3;
}

- (double)horizontalToolTopSpacing
{
  return self->_horizontalToolTopSpacing;
}

- (void)setHorizontalToolTopSpacing:(double)a3
{
  self->_horizontalToolTopSpacing = a3;
}

- (double)horizontalToolBottomSpacing
{
  return self->_horizontalToolBottomSpacing;
}

- (void)setHorizontalToolBottomSpacing:(double)a3
{
  self->_horizontalToolBottomSpacing = a3;
}

- (double)dotSelectionIndicatorDistance
{
  return self->_dotSelectionIndicatorDistance;
}

- (void)setDotSelectionIndicatorDistance:(double)a3
{
  self->_dotSelectionIndicatorDistance = a3;
}

- (double)dashSelectionIndicatorDistance
{
  return self->_dashSelectionIndicatorDistance;
}

- (void)setDashSelectionIndicatorDistance:(double)a3
{
  self->_dashSelectionIndicatorDistance = a3;
}

- (double)toolButtonPointerInteractionHighlightPadding
{
  return self->_toolButtonPointerInteractionHighlightPadding;
}

- (void)setToolButtonPointerInteractionHighlightPadding:(double)a3
{
  self->_toolButtonPointerInteractionHighlightPadding = a3;
}

@end
