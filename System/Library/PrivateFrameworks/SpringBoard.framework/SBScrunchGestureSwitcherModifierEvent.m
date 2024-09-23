@implementation SBScrunchGestureSwitcherModifierEvent

- (int64_t)type
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBScrunchGestureSwitcherModifierEvent;
  result = -[SBGestureSwitcherModifierEvent copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_OWORD *)result + 10) = self->_initialCentroid;
  *((_OWORD *)result + 11) = self->_centroid;
  *((_QWORD *)result + 19) = *(_QWORD *)&self->_absoluteScale;
  *((_OWORD *)result + 12) = self->_translationWithoutScale;
  return result;
}

- (CGPoint)initialCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialCentroid.x;
  y = self->_initialCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCentroid:(CGPoint)a3
{
  self->_initialCentroid = a3;
}

- (CGPoint)centroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_centroid.x;
  y = self->_centroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (double)absoluteScale
{
  return self->_absoluteScale;
}

- (void)setAbsoluteScale:(double)a3
{
  self->_absoluteScale = a3;
}

- (CGPoint)translationWithoutScale
{
  double x;
  double y;
  CGPoint result;

  x = self->_translationWithoutScale.x;
  y = self->_translationWithoutScale.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslationWithoutScale:(CGPoint)a3
{
  self->_translationWithoutScale = a3;
}

@end
