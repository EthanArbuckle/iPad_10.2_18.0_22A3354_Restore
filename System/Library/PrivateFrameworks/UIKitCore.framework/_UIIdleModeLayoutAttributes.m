@implementation _UIIdleModeLayoutAttributes

- (_UIIdleModeLayoutAttributes)init
{
  _UIIdleModeLayoutAttributes *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIIdleModeLayoutAttributes;
  result = -[_UIIdleModeLayoutAttributes init](&v5, sel_init);
  if (result)
  {
    result->_centerOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
    result->_alphaOffset = 0.0;
    result->_wantsDimmingOverlay = 0;
  }
  return result;
}

- (CGPoint)centerOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_centerOffset.x;
  y = self->_centerOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenterOffset:(CGPoint)a3
{
  self->_centerOffset = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)alphaOffset
{
  return self->_alphaOffset;
}

- (void)setAlphaOffset:(double)a3
{
  self->_alphaOffset = a3;
}

- (BOOL)wantsDimmingOverlay
{
  return self->_wantsDimmingOverlay;
}

- (void)setWantsDimmingOverlay:(BOOL)a3
{
  self->_wantsDimmingOverlay = a3;
}

@end
