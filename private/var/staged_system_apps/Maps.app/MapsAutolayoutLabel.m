@implementation MapsAutolayoutLabel

- (UIEdgeInsets)alignmentRectInsets
{
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CGFloat top;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  if (-[MapsAutolayoutLabel shouldInsetAlignmentToAscender](self, "shouldInsetAlignmentToAscender"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAutolayoutLabel font](self, "font"));
    objc_msgSend(v6, "lineHeight");
    v8 = v7;
    objc_msgSend(v6, "ascender");
    top = UIRoundToViewScale(self, v10, v8 - v9);

  }
  else
  {
    top = UIEdgeInsetsZero.top;
  }
  v12 = top;
  v13 = left;
  v14 = bottom;
  v15 = right;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)shouldInsetAlignmentToAscender
{
  return self->_shouldInsetAlignmentToAscender;
}

- (void)setShouldInsetAlignmentToAscender:(BOOL)a3
{
  self->_shouldInsetAlignmentToAscender = a3;
}

@end
