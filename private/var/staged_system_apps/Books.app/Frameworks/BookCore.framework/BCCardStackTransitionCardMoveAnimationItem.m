@implementation BCCardStackTransitionCardMoveAnimationItem

- (BCCardStackTransitioningCoverSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
  objc_storeStrong((id *)&self->_coverSource, a3);
}

- (BCCardStackTransitioningCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (BOOL)isFocusedCard
{
  return self->_isFocusedCard;
}

- (void)setIsFocusedCard:(BOOL)a3
{
  self->_isFocusedCard = a3;
}

- (CGPoint)cardToCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_cardToCenter.x;
  y = self->_cardToCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCardToCenter:(CGPoint)a3
{
  self->_cardToCenter = a3;
}

- (CGAffineTransform)cardToTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setCardToTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_cardToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_cardToTransform.c = v4;
  *(_OWORD *)&self->_cardToTransform.tx = v3;
}

- (CGAffineTransform)cardSuperviewToTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setCardSuperviewToTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_cardSuperviewToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_cardSuperviewToTransform.c = v4;
  *(_OWORD *)&self->_cardSuperviewToTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_coverSource, 0);
}

@end
