@implementation _UIFloatingTabBarCollectionView

- (void)layoutSubviews
{
  void (**layoutSubviewHandler)(void);
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingTabBarCollectionView;
  -[UICollectionView layoutSubviews](&v4, sel_layoutSubviews);
  layoutSubviewHandler = (void (**)(void))self->_layoutSubviewHandler;
  if (layoutSubviewHandler)
    layoutSubviewHandler[2]();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarCollectionView;
  return -[NSObject accessibilityTraits](&v3, sel_accessibilityTraits) | 0x8000;
}

- (id)layoutSubviewHandler
{
  return self->_layoutSubviewHandler;
}

- (void)setLayoutSubviewHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutSubviewHandler, 0);
}

@end
