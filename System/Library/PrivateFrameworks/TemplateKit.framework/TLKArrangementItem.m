@implementation TLKArrangementItem

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 0;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  return 0.0;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  return 0.0;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  return 999.0;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  return 999.0;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

@end
