@implementation CardAnimationManager

- (id)defaultCardHeightAnimation
{
  if (qword_1014D3D50 != -1)
    dispatch_once(&qword_1014D3D50, &stru_1011E0BA8);
  return (id)qword_1014D3D48;
}

- (CardAnimation)cardHeightAnimation
{
  CardAnimation *cardHeightAnimation;

  cardHeightAnimation = self->_cardHeightAnimation;
  if (cardHeightAnimation)
    return cardHeightAnimation;
  else
    return (CardAnimation *)(id)objc_claimAutoreleasedReturnValue(-[CardAnimationManager defaultCardHeightAnimation](self, "defaultCardHeightAnimation"));
}

- (void)pushCardHeightAnimation:(id)a3
{
  id v5;
  unint64_t cardHeightAnimationPushCount;
  id v7;

  v5 = a3;
  cardHeightAnimationPushCount = self->_cardHeightAnimationPushCount;
  self->_cardHeightAnimationPushCount = cardHeightAnimationPushCount + 1;
  if (!cardHeightAnimationPushCount)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_cardHeightAnimation, a3);
    v5 = v7;
  }

}

- (void)popCardHeightAnimation
{
  unint64_t v2;
  CardAnimation *cardHeightAnimation;

  v2 = self->_cardHeightAnimationPushCount - 1;
  self->_cardHeightAnimationPushCount = v2;
  if (!v2)
  {
    cardHeightAnimation = self->_cardHeightAnimation;
    self->_cardHeightAnimation = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardHeightAnimation, 0);
}

@end
