@implementation PXTimelineDataSourceOptions

- (id)initForWidgetWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)PXTimelineDataSourceOptions;
  result = -[PXTimelineDataSourceOptions init](&v6, sel_init);
  if (result)
  {
    *((CGFloat *)result + 2) = width;
    *((CGFloat *)result + 3) = height;
    *((_WORD *)result + 4) = 257;
  }
  return result;
}

- (PXTimelineDataSourceOptions)initWithMemoriesOnly
{
  PXTimelineDataSourceOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTimelineDataSourceOptions;
  result = -[PXTimelineDataSourceOptions init](&v3, sel_init);
  if (result)
  {
    result->_widgetSize = (CGSize)*MEMORY[0x1E0C9D820];
    *(_WORD *)&result->_includeSuggestions = 0;
  }
  return result;
}

- (CGSize)widgetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_widgetSize.width;
  height = self->_widgetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWidgetSize:(CGSize)a3
{
  self->_widgetSize = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeAssets
{
  return self->_includeAssets;
}

- (void)setIncludeAssets:(BOOL)a3
{
  self->_includeAssets = a3;
}

@end
