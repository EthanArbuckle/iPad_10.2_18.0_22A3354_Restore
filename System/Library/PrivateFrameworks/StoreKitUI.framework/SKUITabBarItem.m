@implementation SKUITabBarItem

- (SKUITabBarItem)init
{
  return -[SKUITabBarItem initWithTabIdentifier:](self, "initWithTabIdentifier:", 0);
}

- (SKUITabBarItem)initWithTabIdentifier:(id)a3
{
  id v4;
  SKUITabBarItem *v5;
  uint64_t v6;
  NSString *tabIdentifier;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITabBarItem initWithTabIdentifier:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUITabBarItem;
  v5 = -[SKUITabBarItem init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tabIdentifier = v5->_tabIdentifier;
    v5->_tabIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUITabBarItem;
  -[SKUITabBarItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %@]"), v4, self->_tabIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_tabIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SKUITabBarItem tabIdentifier](self, "tabIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_alwaysCreatesRootViewController;
  *(_QWORD *)(v5 + 16) = self->_barTintStyle;
  objc_storeStrong((id *)(v5 + 24), self->_customRootViewController);
  v6 = -[NSString copyWithZone:](self->_metricsIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSURL copyWithZone:](self->_rootURL, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  objc_storeStrong((id *)(v5 + 48), self->_rootViewControllerClass);
  v10 = -[NSString copyWithZone:](self->_tabIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  objc_storeStrong((id *)(v5 + 64), self->_underlyingTabBarItem);
  objc_storeStrong((id *)(v5 + 72), self->_userInterfaceTintColor);
  return (id)v5;
}

- (BOOL)alwaysCreatesRootViewController
{
  return self->_alwaysCreatesRootViewController;
}

- (void)setAlwaysCreatesRootViewController:(BOOL)a3
{
  self->_alwaysCreatesRootViewController = a3;
}

- (int64_t)barTintStyle
{
  return self->_barTintStyle;
}

- (void)setBarTintStyle:(int64_t)a3
{
  self->_barTintStyle = a3;
}

- (UIViewController)customRootViewController
{
  return self->_customRootViewController;
}

- (void)setCustomRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_customRootViewController, a3);
}

- (NSString)metricsIdentifier
{
  return self->_metricsIdentifier;
}

- (void)setMetricsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (void)setRootURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (Class)rootViewControllerClass
{
  return self->_rootViewControllerClass;
}

- (void)setRootViewControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_rootViewControllerClass, a3);
}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (UITabBarItem)underlyingTabBarItem
{
  return self->_underlyingTabBarItem;
}

- (void)setUnderlyingTabBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingTabBarItem, a3);
}

- (UIColor)userInterfaceTintColor
{
  return self->_userInterfaceTintColor;
}

- (void)setUserInterfaceTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_userInterfaceTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceTintColor, 0);
  objc_storeStrong((id *)&self->_underlyingTabBarItem, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
  objc_storeStrong((id *)&self->_rootViewControllerClass, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_metricsIdentifier, 0);
  objc_storeStrong((id *)&self->_customRootViewController, 0);
}

- (void)initWithTabIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITabBarItem initWithTabIdentifier:]";
}

@end
