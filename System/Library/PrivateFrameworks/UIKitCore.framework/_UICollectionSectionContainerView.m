@implementation _UICollectionSectionContainerView

- (_UICollectionSectionContainerView)initWithFrame:(CGRect)a3
{
  _UICollectionSectionContainerView *v3;
  _UICollectionViewSubviewRouter *v4;
  _UICollectionViewSubviewRouter *subviewRouter;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UICollectionSectionContainerView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (_UICollectionViewSubviewRouter *)-[_UICollectionViewSubviewRouter initWithContainer:]([_UICollectionViewSubviewRouter alloc], v3);
    subviewRouter = v3->_subviewRouter;
    v3->_subviewRouter = v4;

    v6 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v3;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8;
  id v9;
  _UICollectionViewSubviewRouter *subviewRouter;
  objc_super v11;
  int64_t v12;

  v8 = a3;
  v12 = a4;
  v9 = a5;
  if (self)
    subviewRouter = self->_subviewRouter;
  else
    subviewRouter = 0;
  if (-[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:](subviewRouter, "shouldAddSubview:atPosition:relativeTo:", v8, &v12, v9))
  {
    v11.receiver = self;
    v11.super_class = (Class)_UICollectionSectionContainerView;
    -[UIView _addSubview:positioned:relativeTo:](&v11, sel__addSubview_positioned_relativeTo_, v8, v12, v9);
  }

}

- (void)bringSubviewToFront:(id)a3
{
  id v4;
  _UICollectionViewSubviewRouter *subviewRouter;
  objc_super v6;

  v4 = a3;
  if (self)
    subviewRouter = self->_subviewRouter;
  else
    subviewRouter = 0;
  if (-[_UICollectionViewSubviewRouter shouldBringSubviewToFront:](subviewRouter, "shouldBringSubviewToFront:", v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UICollectionSectionContainerView;
    -[UIView bringSubviewToFront:](&v6, sel_bringSubviewToFront_, v4);
  }

}

- (void)sendSubviewToBack:(id)a3
{
  id v4;
  _UICollectionViewSubviewRouter *subviewRouter;
  objc_super v6;

  v4 = a3;
  if (self)
    subviewRouter = self->_subviewRouter;
  else
    subviewRouter = 0;
  if (-[_UICollectionViewSubviewRouter shouldSendSubviewToBack:](subviewRouter, "shouldSendSubviewToBack:", v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UICollectionSectionContainerView;
    -[UIView sendSubviewToBack:](&v6, sel_sendSubviewToBack_, v4);
  }

}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  _UICollectionSectionContainerView *v6;
  objc_super v7;

  v6 = self;
  if (self)
    self = (_UICollectionSectionContainerView *)self->_subviewRouter;
  if (-[_UICollectionSectionContainerView shouldExchangeSubviewAtIndex:withSubviewAtIndex:](self, "shouldExchangeSubviewAtIndex:withSubviewAtIndex:", a3, a4))
  {
    v7.receiver = v6;
    v7.super_class = (Class)_UICollectionSectionContainerView;
    -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](&v7, sel_exchangeSubviewAtIndex_withSubviewAtIndex_, a3, a4);
  }
}

- (void)_willRemoveSubview:(id)a3
{
  id v4;
  _UICollectionViewSubviewRouter *subviewRouter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICollectionSectionContainerView;
  v4 = a3;
  -[UIView _willRemoveSubview:](&v6, sel__willRemoveSubview_, v4);
  if (self)
    subviewRouter = self->_subviewRouter;
  else
    subviewRouter = 0;
  -[_UICollectionViewSubviewRouter willRemoveSubview:](subviewRouter, "willRemoveSubview:", v4, v6.receiver, v6.super_class);

}

- (void)dealloc
{
  objc_super v3;

  -[_UICollectionViewSubviewRouter setContainer:]((uint64_t)self->_subviewRouter, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionSectionContainerView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewRouter, 0);
}

@end
