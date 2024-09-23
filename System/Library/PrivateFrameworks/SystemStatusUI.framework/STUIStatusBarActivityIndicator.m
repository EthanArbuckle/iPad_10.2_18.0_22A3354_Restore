@implementation STUIStatusBarActivityIndicator

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (BOOL)wantsCrossfade
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;

  objc_msgSend(a3, "imageTintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarActivityIndicator setColor:](self, "setColor:", v4);

}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
