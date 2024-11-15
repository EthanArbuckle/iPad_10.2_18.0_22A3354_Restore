@implementation _UICalloutBarButtonMetrics

- (_UICalloutBarButtonMetrics)init
{
  _UICalloutBarButtonMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICalloutBarButtonMetrics;
  result = -[_UICalloutBarButtonMetrics init](&v3, sel_init);
  if (result)
  {
    result->_prefersCustomSelection = 0;
    result->_height = 44.0;
    result->_horizontalPadding = 0.0;
    result->_imageWidth = 0.0;
    result->_minimumTitleAndImageSpacing = 0.0;
    result->_cornerRadius = 8.0;
  }
  return result;
}

- (double)height
{
  return self->_height;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (double)minimumTitleAndImageSpacing
{
  return self->_minimumTitleAndImageSpacing;
}

- (BOOL)prefersCustomSelection
{
  return self->_prefersCustomSelection;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
