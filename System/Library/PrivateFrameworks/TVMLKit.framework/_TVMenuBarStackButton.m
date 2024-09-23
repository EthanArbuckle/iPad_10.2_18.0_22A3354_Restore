@implementation _TVMenuBarStackButton

- (_TVMenuBarStackButton)initWithCoder:(id)a3
{
  _TVMenuBarStackButton *v3;
  _TVMenuBarStackButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackButton;
  v3 = -[_TVMenuBarStackButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_TVMenuBarStackButton _configureSubviews](v3, "_configureSubviews");
  return v4;
}

- (_TVMenuBarStackButton)initWithFrame:(CGRect)a3
{
  _TVMenuBarStackButton *v3;
  _TVMenuBarStackButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackButton;
  v3 = -[_TVMenuBarStackButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVMenuBarStackButton _configureSubviews](v3, "_configureSubviews");
  return v4;
}

- (void)setTabBarItem:(id)a3
{
  NSDictionary *v5;
  NSDictionary **p_tabBarItem;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;

  v5 = (NSDictionary *)a3;
  p_tabBarItem = &self->_tabBarItem;
  if (self->_tabBarItem != v5)
  {
    v24 = v5;
    objc_storeStrong((id *)&self->_tabBarItem, a3);
    -[_TVMenuBarStackButton setShowsTouchWhenHighlighted:](self, "setShowsTouchWhenHighlighted:", 0);
    -[NSDictionary objectForKey:](*p_tabBarItem, "objectForKey:", *MEMORY[0x24BE51898]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      -[_TVMenuBarStackButton setTitle:forState:](self, "setTitle:forState:", v7, 0);
    -[NSDictionary objectForKey:](*p_tabBarItem, "objectForKey:", CFSTR("p-image-off"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      -[NSDictionary objectForKey:](*p_tabBarItem, "objectForKey:", *MEMORY[0x24BE51880]);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tv_resourceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageForResource:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_TVMenuBarStackButton setImage:forState:](self, "setImage:forState:", v13, 0);
    }
    -[NSDictionary objectForKey:](*p_tabBarItem, "objectForKey:", CFSTR("p-image-on"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      -[NSDictionary objectForKey:](*p_tabBarItem, "objectForKey:", *MEMORY[0x24BE51888]);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tv_resourceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageForResource:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[_TVMenuBarStackButton setImage:forState:](self, "setImage:forState:", v19, 5);
      -[_TVMenuBarStackButton setImage:forState:](self, "setImage:forState:", v19, 4);

    }
    objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMenuBarStackButton _setImageColor:forState:](self, "_setImageColor:forState:", v20, 4);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMenuBarStackButton _setImageColor:forState:](self, "_setImageColor:forState:", v21, 0);

    objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMenuBarStackButton setTitleColor:forState:](self, "setTitleColor:forState:", v22, 4);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMenuBarStackButton setTitleColor:forState:](self, "setTitleColor:forState:", v23, 0);

    v5 = v24;
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TVMenuBarStackButton;
  -[_TVMenuBarStackButton setSelected:](&v5, sel_setSelected_);
  -[_TVMenuBarStackButton _setSelectedOrHighlighted:](self, "_setSelectedOrHighlighted:", v3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)_TVMenuBarStackButton;
  -[_TVMenuBarStackButton intrinsicContentSize](&v5, sel_intrinsicContentSize);
  v3 = v2 + 8.0;
  v4 = 1.79769313e308;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVMenuBarStackButton;
  -[_TVMenuBarStackButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_TVMenuBarStackButton _updateImageEdgeInsets](self, "_updateImageEdgeInsets");
}

- (void)_configureSubviews
{
  -[_TVMenuBarStackButton setTintAdjustmentMode:](self, "setTintAdjustmentMode:", 2);
  -[_TVMenuBarStackButton _updateImageEdgeInsets](self, "_updateImageEdgeInsets");
  -[_TVMenuBarStackButton setNeedsLayout](self, "setNeedsLayout");
  -[_TVMenuBarStackButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_setSelectedOrHighlighted:(BOOL)a3
{
  uint64_t v4;

  if (a3)
    v4 = 0;
  else
    v4 = 2;
  -[_TVMenuBarStackButton setTintAdjustmentMode:](self, "setTintAdjustmentMode:", v4);
  -[_TVMenuBarStackButton setNeedsLayout](self, "setNeedsLayout");
  -[_TVMenuBarStackButton layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_updateImageEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;

  -[_TVMenuBarStackButton imageEdgeInsets](self, "imageEdgeInsets");
  v4 = v3;
  v6 = v5;
  -[_TVMenuBarStackButton traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutDirection");

  if (v8 == 1)
    v9 = 8.0;
  else
    v9 = 0.0;
  if (v8 == 1)
    v10 = 0.0;
  else
    v10 = 8.0;
  -[_TVMenuBarStackButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v4, v9, v6, v10);
}

- (NSDictionary)tabBarItem
{
  return self->_tabBarItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItem, 0);
}

@end
