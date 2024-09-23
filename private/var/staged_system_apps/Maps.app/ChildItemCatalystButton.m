@implementation ChildItemCatalystButton

+ (id)childItemCatalystButton
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ChildItemCatalystButton buttonWithType:](ChildItemCatalystButton, "buttonWithType:", 1));
  objc_msgSend((id)objc_opt_class(a1), "contentEdgeInsets");
  objc_msgSend(v3, "setContentEdgeInsets:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v4, "setLineBreakMode:", 0);

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)ChildItemCatalystButton;
  -[ChildItemCatalystButton sizeThatFits:](&v6, "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 5.0;
  v3 = 10.0;
  v4 = 7.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIFont)buttonTitleFont
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ChildItemCatalystButton;
  v2 = objc_msgSend(objc_msgSendSuper2(&v4, "class"), "titleFont");
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setChildItem:(id)a3
{
  GEOMapItemChildItem *v5;
  GEOMapItemChildItem *childItem;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = (GEOMapItemChildItem *)a3;
  childItem = v5;
  if (self->_childItem != v5)
  {
    objc_storeStrong((id *)&self->_childItem, a3);
    childItem = self->_childItem;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ChildItemButton buttonTitleWithChildItem:](ChildItemButton, "buttonTitleWithChildItem:", childItem));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006B3BA4;
  v8[3] = &unk_1011AD260;
  objc_copyWeak(&v9, &location);
  -[ChildItemCatalystButton setTitle:tapHandler:](self, "setTitle:tapHandler:", v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)setTitle:(id)a3 tapHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _MKPlaceActionButtonController *v10;
  _MKPlaceActionButtonController *buttonController;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)_MKPlaceActionButtonController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1006B3CF0;
  v12[3] = &unk_1011C02B0;
  v13 = v6;
  v9 = v6;
  v10 = (_MKPlaceActionButtonController *)objc_msgSend(v8, "initWithTitle:subTitle:selectedBlock:", v7, 0, v12);

  buttonController = self->_buttonController;
  self->_buttonController = v10;

  -[ChildItemCatalystButton setButtonController:](self, "setButtonController:", self->_buttonController);
}

- (void)setDelegate:(id)a3
{
  ChildItemButtonDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

+ (id)titleFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleBody);
}

+ (CGColor)extraShadowLayerBackgroundColorWithDarkMode:(BOOL)a3 isbuttonEnabled:(BOOL)a4
{
  id v4;
  CGColor *v5;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor", a3, a4)));
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  return v5;
}

- (ChildItemButtonDelegate)delegate
{
  return (ChildItemButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (GEOMapItemChildItem)childItem
{
  return self->_childItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonController, 0);
}

@end
