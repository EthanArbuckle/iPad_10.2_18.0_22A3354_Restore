@implementation _UIFindNavigatorSearchFieldButton

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[UIButton intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v7 = v6;
  v9 = v8;
  if (-[_UIFindNavigatorSearchFieldButton usesSquareIntrinsicSize](self, "usesSquareIntrinsicSize"))
    v10 = v9;
  else
    v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)usesSquareIntrinsicSize
{
  return self->_usesSquareIntrinsicSize;
}

- (void)setUsesSquareIntrinsicSize:(BOOL)a3
{
  self->_usesSquareIntrinsicSize = a3;
}

@end
