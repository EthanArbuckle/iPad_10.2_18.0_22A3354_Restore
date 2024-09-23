@implementation SBSystemAperturePillImageView

- (CGSize)systemApertureSize
{
  double width;
  double height;
  CGSize result;

  width = self->_systemApertureSize.width;
  height = self->_systemApertureSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSystemApertureSize:(CGSize)a3
{
  self->_systemApertureSize = a3;
}

@end
