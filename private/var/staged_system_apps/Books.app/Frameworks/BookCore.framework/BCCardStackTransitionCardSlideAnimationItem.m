@implementation BCCardStackTransitionCardSlideAnimationItem

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

@end
