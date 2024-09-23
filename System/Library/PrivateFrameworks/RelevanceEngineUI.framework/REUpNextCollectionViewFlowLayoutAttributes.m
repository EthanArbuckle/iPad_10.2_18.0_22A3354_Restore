@implementation REUpNextCollectionViewFlowLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  BOOL v9;
  objc_super v11;
  CGRect v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11.receiver = self,
        v11.super_class = (Class)REUpNextCollectionViewFlowLayoutAttributes,
        -[UICollectionViewLayoutAttributes isEqual:](&v11, sel_isEqual_, v4)))
  {
    objc_msgSend(v4, "unitFrameOnScreen");
    v12.origin.x = v5;
    v12.origin.y = v6;
    v12.size.width = v7;
    v12.size.height = v8;
    v9 = CGRectEqualToRect(self->_unitFrameOnScreen, v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REUpNextCollectionViewFlowLayoutAttributes;
  v3 = -[UICollectionViewLayoutAttributes hash](&v7, sel_hash);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", self->_unitFrameOnScreen.origin.x, self->_unitFrameOnScreen.origin.y, self->_unitFrameOnScreen.size.width, self->_unitFrameOnScreen.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REUpNextCollectionViewFlowLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[REUpNextCollectionViewFlowLayoutAttributes unitFrameOnScreen](self, "unitFrameOnScreen");
  objc_msgSend(v4, "setUnitFrameOnScreen:");
  return v4;
}

- (CGRect)unitFrameOnScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unitFrameOnScreen.origin.x;
  y = self->_unitFrameOnScreen.origin.y;
  width = self->_unitFrameOnScreen.size.width;
  height = self->_unitFrameOnScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUnitFrameOnScreen:(CGRect)a3
{
  self->_unitFrameOnScreen = a3;
}

@end
