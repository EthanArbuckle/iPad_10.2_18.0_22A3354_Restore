@implementation ICQViewController

+ (Class)viewControllerClassForPageClassIdentifier:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_ICQUpgradeOfferPageSpecification")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("_ICQUpgradeCompletePageSpecification")))
  {
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (ICQViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ICQViewController initWithPageSpecification:](self, "initWithPageSpecification:", 0, a4);
}

- (ICQViewController)initWithCoder:(id)a3
{
  return -[ICQViewController initWithPageSpecification:](self, "initWithPageSpecification:", 0);
}

- (ICQViewController)initWithPageSpecification:(id)a3
{
  id v5;
  uint64_t v6;
  ICQViewController *v7;
  ICQViewController *v8;
  void *v9;
  objc_class *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_msgSend(v5, "pageClassIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[ICQViewController viewControllerClassForPageClassIdentifier:](ICQViewController, "viewControllerClassForPageClassIdentifier:", v9);

    if ((ICQViewController *)objc_opt_class() == self)
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "internal error: improper class returned", buf, 2u);
      }

      v8 = 0;
    }
    else
    {
      v8 = (ICQViewController *)objc_msgSend([v10 alloc], "initWithPageSpecification:", v5);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICQViewController;
    v7 = -[ICQViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_pageSpecification, a3);
  }

  return v8;
}

+ (BOOL)supportsPageClassIdentifier:(id)a3
{
  return 0;
}

- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "ICQViewController sender:action:parameters:", (uint8_t *)&v18, 2u);
  }

  -[ICQViewController pageDelegate](self, "pageDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      -[ICQViewController pageDelegate](self, "pageDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQStringForAction();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "pageDelegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v18, 0x20u);

    }
    -[ICQViewController pageDelegate](self, "pageDelegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject sender:action:parameters:](v11, "sender:action:parameters:", self, a4, v7);
  }
  else if (v12)
  {
    -[ICQViewController pageDelegate](self, "pageDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v17;
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "ICQViewController - page delegate %@ does not respond to sender:action:parameters:", (uint8_t *)&v18, 0xCu);

  }
}

- (_ICQPageSpecification)pageSpecification
{
  return self->_pageSpecification;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (void)setButtonTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (ICQPageDelegate)pageDelegate
{
  return (ICQPageDelegate *)objc_loadWeakRetained((id *)&self->_pageDelegate);
}

- (void)setPageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageDelegate);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_pageSpecification, 0);
}

@end
