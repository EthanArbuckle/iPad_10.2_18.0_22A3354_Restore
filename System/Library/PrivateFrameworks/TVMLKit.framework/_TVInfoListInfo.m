@implementation _TVInfoListInfo

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (UIEdgeInsets)headerMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_headerMargin.top;
  left = self->_headerMargin.left;
  bottom = self->_headerMargin.bottom;
  right = self->_headerMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (UIEdgeInsets)headerPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_headerPadding.top;
  left = self->_headerPadding.left;
  bottom = self->_headerPadding.bottom;
  right = self->_headerPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHeaderPadding:(UIEdgeInsets)a3
{
  self->_headerPadding = a3;
}

- (UIView)headerContentView
{
  return self->_headerContentView;
}

- (void)setHeaderContentView:(id)a3
{
  objc_storeStrong((id *)&self->_headerContentView, a3);
}

- (NSArray)dataViews
{
  return self->_dataViews;
}

- (void)setDataViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataViews, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
