@implementation BCCardStackTransitionCoverMoveAnimationItem

- (BCCardStackTransitioningCoverSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
  objc_storeStrong((id *)&self->_coverSource, a3);
}

- (BCCardStackTransitioningCoverSource)cardCoverSource
{
  return self->_cardCoverSource;
}

- (void)setCardCoverSource:(id)a3
{
  objc_storeStrong((id *)&self->_cardCoverSource, a3);
}

- (BOOL)isFocusedCover
{
  return self->_isFocusedCover;
}

- (void)setIsFocusedCover:(BOOL)a3
{
  self->_isFocusedCover = a3;
}

- (BOOL)needsFadeInOnDismiss
{
  return self->_needsFadeInOnDismiss;
}

- (void)setNeedsFadeInOnDismiss:(BOOL)a3
{
  self->_needsFadeInOnDismiss = a3;
}

- (BOOL)animatesInInnerContainerView
{
  return self->_animatesInInnerContainerView;
}

- (void)setAnimatesInInnerContainerView:(BOOL)a3
{
  self->_animatesInInnerContainerView = a3;
}

- (CGPoint)coverToCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_coverToCenter.x;
  y = self->_coverToCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCoverToCenter:(CGPoint)a3
{
  self->_coverToCenter = a3;
}

- (CGAffineTransform)coverToTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setCoverToTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_coverToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_coverToTransform.c = v4;
  *(_OWORD *)&self->_coverToTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardCoverSource, 0);
  objc_storeStrong((id *)&self->_coverSource, 0);
}

@end
