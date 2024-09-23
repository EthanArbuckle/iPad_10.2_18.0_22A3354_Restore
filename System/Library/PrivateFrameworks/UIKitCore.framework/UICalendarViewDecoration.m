@implementation UICalendarViewDecoration

- (UICalendarViewDecoration)init
{
  return -[UICalendarViewDecoration initWithImage:color:size:](self, "initWithImage:color:size:", 0, 0, 1);
}

- (UICalendarViewDecoration)initWithImage:(UIImage *)image color:(UIColor *)color size:(UICalendarViewDecorationSize)size
{
  UIColor *v8;
  UIImage *v9;
  _UICalendarViewImageDecoration *v10;
  UICalendarViewDecoration *v11;

  v8 = color;
  v9 = image;
  v10 = -[_UICalendarViewImageDecoration initWithImage:color:size:]([_UICalendarViewImageDecoration alloc], "initWithImage:color:size:", v9, v8, size);

  v11 = -[UICalendarViewDecoration initWithDecorationItem:](self, "initWithDecorationItem:", v10);
  return v11;
}

- (UICalendarViewDecoration)initWithCustomViewProvider:(void *)customViewProvider
{
  void *v4;
  _UICalendarViewCustomViewDecoration *v5;
  UICalendarViewDecoration *v6;

  v4 = customViewProvider;
  v5 = -[_UICalendarViewCustomViewDecoration initWithCustomViewProvider:]([_UICalendarViewCustomViewDecoration alloc], "initWithCustomViewProvider:", v4);

  v6 = -[UICalendarViewDecoration initWithDecorationItem:](self, "initWithDecorationItem:", v5);
  return v6;
}

- (UICalendarViewDecoration)initWithDecorationItem:(id)a3
{
  id v5;
  UICalendarViewDecoration *v6;
  UICalendarViewDecoration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICalendarViewDecoration;
  v6 = -[UICalendarViewDecoration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_decoration, a3);

  return v7;
}

+ (UICalendarViewDecoration)decorationWithColor:(UIColor *)color size:(UICalendarViewDecorationSize)size
{
  UIColor *v6;
  void *v7;

  v6 = color;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:color:size:", 0, v6, size);

  return (UICalendarViewDecoration *)v7;
}

+ (UICalendarViewDecoration)decorationWithImage:(UIImage *)image
{
  UIImage *v4;
  void *v5;

  v4 = image;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:color:size:", v4, 0, 1);

  return (UICalendarViewDecoration *)v5;
}

+ (UICalendarViewDecoration)decorationWithImage:(UIImage *)image color:(UIColor *)color size:(UICalendarViewDecorationSize)size
{
  UIColor *v8;
  UIImage *v9;
  void *v10;

  v8 = color;
  v9 = image;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:color:size:", v9, v8, size);

  return (UICalendarViewDecoration *)v10;
}

+ (UICalendarViewDecoration)decorationWithCustomViewProvider:(void *)customViewProvider
{
  void *v4;
  void *v5;

  v4 = customViewProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCustomViewProvider:", v4);

  return (UICalendarViewDecoration *)v5;
}

- (UIView)_parent
{
  return -[_UICalendarViewDecorationItem _parent](self->_decoration, "_parent");
}

- (void)_setParent:(id)a3
{
  -[_UICalendarViewDecorationItem _setParent:](self->_decoration, "_setParent:", a3);
}

- (UIView)_decorationView
{
  return -[_UICalendarViewDecorationItem _decorationView](self->_decoration, "_decorationView");
}

- (void)_setDecorationView:(id)a3
{
  -[_UICalendarViewDecorationItem _setDecorationView:](self->_decoration, "_setDecorationView:", a3);
}

- (id)_decorationViewForReuseView:(id)a3
{
  return -[_UICalendarViewDecorationItem _decorationViewForReuseView:](self->_decoration, "_decorationViewForReuseView:", a3);
}

- (id)_decorationViewReusableKey
{
  return -[_UICalendarViewDecorationItem _decorationViewReusableKey](self->_decoration, "_decorationViewReusableKey");
}

+ (double)_referenceHeightForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;

  v4 = a3;
  v5 = v4;
  if (v4
    && (!_MergedGlobals_3_19
     || *((_QWORD *)v4 + 13) != *(_QWORD *)(_MergedGlobals_3_19 + 104)
     || *((_QWORD *)v4 + 15) != *(_QWORD *)(_MergedGlobals_3_19 + 120)))
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleCaption2"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationByApplyingConfiguration:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("square"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&_MergedGlobals_3_19, a3);
    objc_msgSend(v10, "size");
    qword_1ECD7A740 = v11;

  }
  v12 = *(double *)&qword_1ECD7A740;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoration, 0);
}

@end
