@implementation _UIGravityWellEffectBody

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_UIGravityWellEffectBody distanceFromPrimaryBody](self, "distanceFromPrimaryBody");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<_UIGravityWellEffectBody: %p; distanceFromPrimaryBody: %.2f>"),
               self,
               v4);
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (_UIMorphingPlatterView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
  objc_storeStrong((id *)&self->_anchorView, a3);
}

- (CAPoint3D)positionInPrimaryContainer
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_positionInPrimaryContainer.x;
  y = self->_positionInPrimaryContainer.y;
  z = self->_positionInPrimaryContainer.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPositionInPrimaryContainer:(CAPoint3D)a3
{
  self->_positionInPrimaryContainer = a3;
}

- (double)distanceFromPrimaryBody
{
  return self->_distanceFromPrimaryBody;
}

- (void)setDistanceFromPrimaryBody:(double)a3
{
  self->_distanceFromPrimaryBody = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_preview, 0);
}

@end
