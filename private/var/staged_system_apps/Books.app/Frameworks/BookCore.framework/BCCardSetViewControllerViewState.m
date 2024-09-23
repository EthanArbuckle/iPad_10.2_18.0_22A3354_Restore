@implementation BCCardSetViewControllerViewState

- (BCCardSetViewControllerViewState)initWithIsExpanded:(BOOL)a3 viewSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  BCCardSetViewControllerViewState *result;
  objc_super v8;

  height = a4.height;
  width = a4.width;
  v8.receiver = self;
  v8.super_class = (Class)BCCardSetViewControllerViewState;
  result = -[BCCardSetViewControllerViewState init](&v8, "init");
  if (result)
  {
    result->_isExpanded = a3;
    result->_viewSize.width = width;
    result->_viewSize.height = height;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<BCCardSetViewControllerViewState: %p> isExpanded: %d"), self, self->_isExpanded);
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
