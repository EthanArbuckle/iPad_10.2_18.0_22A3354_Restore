@implementation _UIFloatingTabBarLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setGroupItemMinimized:", -[_UIFloatingTabBarLayoutAttributes isGroupItemMinimized](self, "isGroupItemMinimized"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFloatingTabBarLayoutAttributes;
  if (-[UICollectionViewLayoutAttributes isEqual:](&v8, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[_UIFloatingTabBarLayoutAttributes isGroupItemMinimized](self, "isGroupItemMinimized");
      v6 = v5 ^ objc_msgSend(v4, "isGroupItemMinimized") ^ 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isGroupItemMinimized
{
  return self->_groupItemMinimized;
}

- (void)setGroupItemMinimized:(BOOL)a3
{
  self->_groupItemMinimized = a3;
}

@end
