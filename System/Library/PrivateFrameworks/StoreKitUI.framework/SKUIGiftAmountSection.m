@implementation SKUIGiftAmountSection

- (UIControl)amountControl
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIGiftAmountControl *amountControl;
  SKUIGiftAmountControl *v12;
  void *v13;
  SKUIGiftAmountControl *v14;
  SKUIGiftAmountControl *v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftAmountSection amountControl].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  amountControl = self->_amountControl;
  if (!amountControl)
  {
    v12 = [SKUIGiftAmountControl alloc];
    -[SKUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIGiftAmountControl initWithGiftConfiguration:](v12, "initWithGiftConfiguration:", v13);
    v15 = self->_amountControl;
    self->_amountControl = v14;

    -[SKUIGiftAmountControl setAutoresizingMask:](self->_amountControl, "setAutoresizingMask:", 18);
    amountControl = self->_amountControl;
  }
  return (UIControl *)amountControl;
}

- (int64_t)selectedAmount
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftAmountSection selectedAmount].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return -[SKUIGiftAmountControl selectedAmount](self->_amountControl, "selectedAmount");
}

- (NSString)selectedAmountString
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftAmountSection selectedAmountString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIGiftAmountControl selectedAmountString](self->_amountControl, "selectedAmountString");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  result = 152.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 116.0;
  return result;
}

- (int64_t)numberOfRowsInSection
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIGiftAmountSection numberOfRowsInSection].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("GAM"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("GAM"));
    objc_msgSend(v5, "setSelectionStyle:", 0);
  }
  -[SKUIGiftAmountSection amountControl](self, "amountControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v7, "addSubview:", v6);

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a3, "backgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftAmountControl setBackgroundColor:](self->_amountControl, "setBackgroundColor:", v8);
  objc_msgSend(v7, "setBackgroundColor:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountControl, 0);
}

- (void)amountControl
{
  OUTLINED_FUNCTION_1();
}

- (void)selectedAmount
{
  OUTLINED_FUNCTION_1();
}

- (void)selectedAmountString
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfRowsInSection
{
  OUTLINED_FUNCTION_1();
}

@end
