@implementation BCNavigationBar

- (BCNavigationBar)initWithFrame:(CGRect)a3
{
  BCNavigationBar *v3;
  BCNavigationBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCNavigationBar;
  v3 = -[BCNavigationBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BCNavigationBar bc_commonInit](v3, "bc_commonInit");
  return v4;
}

- (BCNavigationBar)initWithCoder:(id)a3
{
  BCNavigationBar *v3;
  BCNavigationBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCNavigationBar;
  v3 = -[BCNavigationBar initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BCNavigationBar bc_commonInit](v3, "bc_commonInit");
  return v4;
}

+ (double)padding
{
  return 22.0;
}

+ (double)titlePadding
{
  return 16.0;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCNavigationBar;
  -[BCNavigationBar setHidden:](&v4, "setHidden:", a3);
  -[BCNavigationBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v6, "setTitleView:", 0);

}

- (void)setLeftItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v5, "setLeftBarButtonItems:", v4);

}

- (NSArray)leftItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leftBarButtonItems"));

  return (NSArray *)v3;
}

- (void)setRightItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v5, "setRightBarButtonItems:", v4);

}

- (NSArray)rightItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rightBarButtonItems"));

  return (NSArray *)v3;
}

- (void)setLeftItems:(id)a3 rightItems:(id)a4 titleView:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v16 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v12, "setLeftBarButtonItems:animated:", v11, v6);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v13, "setRightBarButtonItems:animated:", v10, v6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v14, "setTitle:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v15, "setTitleView:", v16);

  objc_msgSend(v16, "_accessibilitySetIsSpeakThisElement:", 0);
}

- (void)setLeftItems:(id)a3 rightItems:(id)a4 title:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v13, "setLeftBarButtonItems:animated:", v12, v6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v14, "setRightBarButtonItems:animated:", v11, v6);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v15, "setTitle:", v10);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v16, "setTitleView:", 0);

}

- (void)setSeparatorsVisible:(BOOL)a3
{
  -[BCNavigationBar _setHidesShadow:](self, "_setHidesShadow:", !a3);
}

- (void)setBackgroundHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bc_item](self, "bc_item"));
  objc_msgSend(v4, "_setBackgroundHidden:", v3);

}

- (void)setItems:(id)a3
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCNavigationBar.m", 120, (uint64_t)"-[BCNavigationBar setItems:]", (uint64_t)"NO", CFSTR("%s is not supported by %@"), v5, v6, v7, (uint64_t)"-[BCNavigationBar setItems:]");

}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCNavigationBar.m", 125, (uint64_t)"-[BCNavigationBar setItems:animated:]", (uint64_t)"NO", CFSTR("%s is not supported by %@"), v6, v7, v8, (uint64_t)"-[BCNavigationBar setItems:animated:]");

}

- (int64_t)_accessibilitySortPriority
{
  void *v3;
  Class v4;
  Class v5;
  uint64_t v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar nextResponder](self, "nextResponder"));
  v4 = NSClassFromString(CFSTR("BKPDFModernBookViewController"));
  if (v3)
  {
    v5 = v4;
    while ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextResponder"));

      v3 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }

    return 1000;
  }
  else
  {
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)BCNavigationBar;
    return -[BCNavigationBar _accessibilitySortPriority](&v8, "_accessibilitySortPriority");
  }
}

- (void)bc_commonInit
{
  UINavigationItem *v3;
  UINavigationItem *bc_item;
  void *v5;
  objc_super v6;
  UINavigationItem *v7;

  v3 = (UINavigationItem *)objc_alloc_init((Class)UINavigationItem);
  bc_item = self->_bc_item;
  self->_bc_item = v3;

  v7 = self->_bc_item;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v6.receiver = self;
  v6.super_class = (Class)BCNavigationBar;
  -[BCNavigationBar setItems:animated:](&v6, "setItems:animated:", v5, 0);

}

- (UINavigationItem)bc_item
{
  return self->_bc_item;
}

- (void)setBc_item:(id)a3
{
  objc_storeStrong((id *)&self->_bc_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bc_item, 0);
}

@end
