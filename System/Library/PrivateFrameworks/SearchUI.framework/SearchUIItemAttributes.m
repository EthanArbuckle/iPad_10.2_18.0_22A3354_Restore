@implementation SearchUIItemAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIItemAttributes;
  if (-[UICollectionViewLayoutAttributes isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[SearchUIItemAttributes isForcingHeight](self, "isForcingHeight");
    v6 = v5 ^ objc_msgSend(v4, "isForcingHeight") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIItemAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIsForcingHeight:", -[SearchUIItemAttributes isForcingHeight](self, "isForcingHeight"));
  return v4;
}

- (BOOL)isForcingHeight
{
  return self->_isForcingHeight;
}

- (void)setIsForcingHeight:(BOOL)a3
{
  self->_isForcingHeight = a3;
}

@end
