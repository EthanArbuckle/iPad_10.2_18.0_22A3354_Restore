@implementation _TVStarBar

- (unint64_t)numStars
{
  return self->_numStars;
}

- (void)setNumStars:(unint64_t)a3
{
  self->_numStars = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSAttributedString)countStr
{
  return self->_countStr;
}

- (void)setCountStr:(id)a3
{
  objc_storeStrong((id *)&self->_countStr, a3);
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIEdgeInsets)barMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_barMargin.top;
  left = self->_barMargin.left;
  bottom = self->_barMargin.bottom;
  right = self->_barMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBarMargin:(UIEdgeInsets)a3
{
  self->_barMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countStr, 0);
}

@end
