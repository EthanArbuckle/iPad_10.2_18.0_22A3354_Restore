@implementation CardProvider

- (id)cardWithBlur:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSMutableSet *cards;
  NSMutableSet *v7;
  NSMutableSet *v8;

  v3 = a3;
  if (!-[NSMutableSet count](self->_cachedCards, "count")
    || (v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_cachedCards, "anyObject")),
        -[NSMutableSet removeObject:](self->_cachedCards, "removeObject:", v5),
        !v5))
  {
    v5 = -[CardView initAllowingBlurred:]([CardView alloc], "initAllowingBlurred:", v3);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  cards = self->_cards;
  if (!cards)
  {
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v8 = self->_cards;
    self->_cards = v7;

    cards = self->_cards;
  }
  -[NSMutableSet addObject:](cards, "addObject:", v5);
  return v5;
}

- (void)recycleCard:(id)a3
{
  NSMutableSet *cachedCards;
  id v5;

  cachedCards = self->_cachedCards;
  v5 = a3;
  -[NSMutableSet addObject:](cachedCards, "addObject:", v5);
  -[NSMutableSet removeObject:](self->_cards, "removeObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCards, 0);
  objc_storeStrong((id *)&self->_cards, 0);
}

@end
