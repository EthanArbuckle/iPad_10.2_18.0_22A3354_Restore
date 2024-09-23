@implementation BCCardViewControllerViewState

- (BCCardViewControllerViewState)initWithContentOffset:(CGPoint)a3 contentScrollViewContentOffset:(CGPoint)a4 viewSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  BCCardViewControllerViewState *result;
  objc_super v12;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)BCCardViewControllerViewState;
  result = -[BCCardViewControllerViewState init](&v12, "init");
  if (result)
  {
    result->_cardScrollViewContentOffset.x = v10;
    result->_cardScrollViewContentOffset.y = v9;
    result->_contentScrollViewContentOffset.x = x;
    result->_contentScrollViewContentOffset.y = y;
    result->_viewSize.width = width;
    result->_viewSize.height = height;
  }
  return result;
}

- (id)description
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;

  v3 = NSStringFromCGPoint(self->_cardScrollViewContentOffset);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = NSStringFromCGPoint(self->_contentScrollViewContentOffset);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromCGSize(self->_viewSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<BCCardViewControllerViewState: %p> contentOffset: %@, contentScrollViewContentOffset: %@, viewSize: %@"), self, v4, v6, v8));

  return v9;
}

- (CGPoint)cardScrollViewContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_cardScrollViewContentOffset.x;
  y = self->_cardScrollViewContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)contentScrollViewContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentScrollViewContentOffset.x;
  y = self->_contentScrollViewContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
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
