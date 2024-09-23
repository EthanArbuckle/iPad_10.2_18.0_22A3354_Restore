@implementation SBBannerUnfurlSourceContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBBannerUnfurlSourceContext _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id result;
  CGSize size;
  CGSize v6;

  result = objc_alloc_init(a3);
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_cornerRadius;
    size = self->_referenceCoordinateSpaceBounds.size;
    *((_OWORD *)result + 1) = self->_referenceCoordinateSpaceBounds.origin;
    *((CGSize *)result + 2) = size;
    v6 = self->_referenceFrame.size;
    *((_OWORD *)result + 3) = self->_referenceFrame.origin;
    *((CGSize *)result + 4) = v6;
    *((_OWORD *)result + 5) = self->_referenceVelocity;
  }
  return result;
}

- (CGRect)referenceCoordinateSpaceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceCoordinateSpaceBounds.origin.x;
  y = self->_referenceCoordinateSpaceBounds.origin.y;
  width = self->_referenceCoordinateSpaceBounds.size.width;
  height = self->_referenceCoordinateSpaceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)referenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceFrame.origin.x;
  y = self->_referenceFrame.origin.y;
  width = self->_referenceFrame.size.width;
  height = self->_referenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGPoint)referenceVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_referenceVelocity.x;
  y = self->_referenceVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
