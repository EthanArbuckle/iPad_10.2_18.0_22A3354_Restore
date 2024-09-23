@implementation SKUIGiftAmountControl

- (SKUIGiftAmountControl)initWithGiftConfiguration:(id)a3
{
  id v5;
  SKUIGiftAmountControl *v6;
  SKUIGiftAmountControl *v7;
  id *p_giftConfiguration;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *v14;
  NSMutableArray *amountButtons;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIGiftAmountButton *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  UIView *customAmountBackgroundView;
  UIView *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  UITextField *v34;
  UITextField *customAmountField;
  UITextField *v36;
  void *v37;
  UITextField *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  objc_super v52;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftAmountControl initWithGiftConfiguration:].cold.1();
  }
  v52.receiver = self;
  v52.super_class = (Class)SKUIGiftAmountControl;
  v6 = -[SKUIGiftAmountControl init](&v52, sel_init);
  v7 = v6;
  if (v6)
  {
    p_giftConfiguration = (id *)&v6->_giftConfiguration;
    objc_storeStrong((id *)&v6->_giftConfiguration, a3);
    objc_msgSend(*p_giftConfiguration, "fixedGiftAmountLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_giftConfiguration, "fixedGiftAmountValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    amountButtons = v7->_amountButtons;
    v7->_amountButtons = v14;

    if (v11 >= 1)
    {
      v16 = 0;
      v17 = 3;
      if (v13)
        v17 = 4;
      if (v17 >= v11)
        v18 = v11;
      else
        v18 = v17;
      do
      {
        v19 = objc_alloc_init(SKUIGiftAmountButton);
        objc_msgSend(v10, "objectAtIndex:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIGiftAmountButton setTag:](v19, "setTag:", objc_msgSend(v20, "integerValue"));

        objc_msgSend(v9, "objectAtIndex:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIGiftAmountButton setTitle:forState:](v19, "setTitle:forState:", v21, 0);

        -[SKUIGiftAmountButton sizeToFit](v19, "sizeToFit");
        -[SKUIGiftAmountControl addSubview:](v7, "addSubview:", v19);
        -[NSMutableArray addObject:](v7->_amountButtons, "addObject:", v19);

        ++v16;
      }
      while (v18 != v16);
    }
    v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v25 = 110.0;
    else
      v25 = 72.0;
    v26 = objc_msgSend(v22, "initWithFrame:", 0.0, 0.0, v25, 44.0);
    customAmountBackgroundView = v7->_customAmountBackgroundView;
    v7->_customAmountBackgroundView = (UIView *)v26;

    v28 = v7->_customAmountBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[UIView layer](v7->_customAmountBackgroundView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v30, "setBorderColor:", objc_msgSend(v31, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scale");
    objc_msgSend(v30, "setBorderWidth:", 1.0 / v33);

    objc_msgSend(v30, "setCornerRadius:", 7.0);
    -[SKUIGiftAmountControl addSubview:](v7, "addSubview:", v7->_customAmountBackgroundView);
    v34 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    customAmountField = v7->_customAmountField;
    v7->_customAmountField = v34;

    -[UITextField setContentHorizontalAlignment:](v7->_customAmountField, "setContentHorizontalAlignment:", 0);
    -[UITextField setTextAlignment:](v7->_customAmountField, "setTextAlignment:", 1);
    v36 = v7->_customAmountField;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v36, "setFont:", v37);

    -[UITextField setDelegate:](v7->_customAmountField, "setDelegate:", v7);
    -[UITextField setKeyboardType:](v7->_customAmountField, "setKeyboardType:", 4);
    v38 = v7->_customAmountField;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v38, "setTextColor:", v39);

    objc_msgSend(*p_giftConfiguration, "clientContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc(MEMORY[0x1E0CB3778]);
    if (v40)
      objc_msgSend(v40, "localizedStringForKey:inTable:", CFSTR("GIFTING_AMOUNT_OTHER"), CFSTR("Gifting"), v30);
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_AMOUNT_OTHER"), 0, CFSTR("Gifting"), v30);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithString:", v42);

    v44 = objc_msgSend(v43, "length");
    v45 = *MEMORY[0x1E0DC1138];
    -[UITextField font](v7->_customAmountField, "font");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addAttribute:value:range:", v45, v46, 0, v44);

    v47 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addAttribute:value:range:", v47, v48, 0, v44);

    -[UITextField setAttributedPlaceholder:](v7->_customAmountField, "setAttributedPlaceholder:", v43);
    -[UITextField sizeToFit](v7->_customAmountField, "sizeToFit");
    -[SKUIGiftAmountControl addSubview:](v7, "addSubview:", v7->_customAmountField);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObserver:selector:name:object:", v7, sel__textFieldDidBeginEditing_, *MEMORY[0x1E0DC54C8], v7->_customAmountField);
    objc_msgSend(v49, "addObserver:selector:name:object:", v7, sel__textFieldDidChange_, *MEMORY[0x1E0DC54D0], v7->_customAmountField);
    objc_msgSend(v49, "addObserver:selector:name:object:", v7, sel__textFieldDidEndEditing_, *MEMORY[0x1E0DC54D8], v7->_customAmountField);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54C8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D8], 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_amountButtons;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "removeTarget:action:forControlEvents:", self, 0, 4095);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[UITextField setDelegate:](self->_customAmountField, "setDelegate:", 0);
  v9.receiver = self;
  v9.super_class = (Class)SKUIGiftAmountControl;
  -[SKUIGiftAmountControl dealloc](&v9, sel_dealloc);
}

- (int64_t)selectedAmount
{
  void *v3;
  int64_t v4;

  if (self->_selectedAmount > 0)
    return self->_selectedAmount;
  -[UITextField text](self->_customAmountField, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSString)selectedAmountString
{
  void *v2;
  void *v3;

  if (self->_selectedAmount)
  {
    -[SKUIGiftAmountControl viewWithTag:](self, "viewWithTag:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITextField text](self->_customAmountField, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[SKUIGiftAmountControl firstResponder](self, "firstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  -[SKUIGiftAmountControl _updateButtonsWithTouch:](self, "_updateButtonsWithTouch:", v5);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[SKUIGiftAmountControl _updateButtonsWithTouch:](self, "_updateButtonsWithTouch:", a3, a4);
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;

  -[SKUIGiftAmountControl _updateButtonsWithTouch:](self, "_updateButtonsWithTouch:", a3, a4);
  self->_selectedAmount = self->_trackingAmount;
  -[SKUIGiftAmountControl _reloadSelectedButton](self, "_reloadSelectedButton");
  if (self->_selectedAmount)
  {
    -[UITextField _setPrefix:](self->_customAmountField, "_setPrefix:", 0);
    -[UITextField _setSuffix:withColor:](self->_customAmountField, "_setSuffix:withColor:", 0, 0);
    -[UITextField setText:](self->_customAmountField, "setText:", 0);
    -[UIView layer](self->_customAmountBackgroundView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  }
  -[SKUIGiftAmountControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SKUIGiftAmountControl *v6;
  SKUIGiftAmountControl *v7;
  void *customAmountField;
  objc_super v10;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v10.receiver = self;
  v10.super_class = (Class)SKUIGiftAmountControl;
  -[SKUIGiftAmountControl hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (SKUIGiftAmountControl *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[NSMutableArray indexOfObjectIdenticalTo:](v6->_amountButtons, "indexOfObjectIdenticalTo:", v7) != 0x7FFFFFFFFFFFFFFFLL)
    {
      customAmountField = v6;
      v6 = v7;
LABEL_7:
      v7 = customAmountField;

      return v7;
    }
    if (v7 == v6)
    {
      -[UIView frame](v6->_customAmountBackgroundView, "frame");
      v11.x = x;
      v11.y = y;
      if (!CGRectContainsPoint(v12, v11))
      {
        v7 = v6;
        return v7;
      }
      customAmountField = v6->_customAmountField;
      goto LABEL_7;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SKUIGiftAmountControl _layoutForPad](self, "_layoutForPad");
  else
    -[SKUIGiftAmountControl _layoutForPhone](self, "_layoutForPhone");
}

- (void)_layoutForPad
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  UIView *customAmountBackgroundView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  UITextField *customAmountField;
  uint64_t v30;
  NSMutableArray *amountButtons;
  float v32;
  _QWORD v33[12];
  BOOL v34;
  _QWORD v35[4];
  CGRect v36;

  -[SKUIGiftAmountControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SKUIGiftAmountControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[UIView frame](self->_customAmountBackgroundView, "frame");
  v13 = v12;
  v15 = v14;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  v16 = CGRectGetMaxX(v36) + -15.0 - v13;
  v17 = (v10 - v15) * 0.5;
  v18 = floorf(v17);
  customAmountBackgroundView = self->_customAmountBackgroundView;
  if (v11)
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v16, v18, v13, v15, v4, v6, v8, v10);
  }
  else
  {
    v20 = v16;
    v21 = v18;
    v22 = v13;
    v23 = v15;
  }
  -[UIView setFrame:](customAmountBackgroundView, "setFrame:", v20, v21, v22, v23);
  -[UITextField frame](self->_customAmountField, "frame");
  v24 = v16 + 5.0;
  v26 = (v15 - v25) * 0.5;
  v27 = v18 + floorf(v26);
  v28 = v13 + -10.0;
  customAmountField = self->_customAmountField;
  if (v11)
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v24, v27, v28);
  -[UITextField setFrame:](customAmountField, "setFrame:", v24, v27, v28);
  v30 = -[NSMutableArray count](self->_amountButtons, "count");
  if (v30 >= 1)
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0x402E000000000000;
    amountButtons = self->_amountButtons;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v32 = (v16 + -8.0 + -15.0 + (float)((float)(v30 - 1) * -8.0)) / (double)v30;
    v33[2] = __38__SKUIGiftAmountControl__layoutForPad__block_invoke;
    v33[3] = &unk_1E73A2C28;
    v33[4] = v35;
    *(double *)&v33[5] = v4;
    *(double *)&v33[6] = v6;
    *(double *)&v33[7] = v8;
    *(double *)&v33[8] = v10;
    v33[9] = v30;
    *(double *)&v33[10] = v16 + -8.0;
    *(double *)&v33[11] = floorf(v32);
    v34 = v11 == 0;
    -[NSMutableArray enumerateObjectsUsingBlock:](amountButtons, "enumerateObjectsUsingBlock:", v33);
    _Block_object_dispose(v35, 8);
  }
}

void __38__SKUIGiftAmountControl__layoutForPad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  CGFloat v6;
  double v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;

  v15 = a2;
  objc_msgSend(v15, "frame");
  v6 = v5;
  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v8 = (*(double *)(a1 + 64) - v5) * 0.5;
  v9 = floorf(v8);
  if (*(_QWORD *)(a1 + 72) - 1 == a3)
    v10 = *(double *)(a1 + 80) - v7;
  else
    v10 = *(double *)(a1 + 88);
  v11 = v9;
  if (*(_BYTE *)(a1 + 96))
  {
    v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v13 = v11;
    v14 = v10;
  }
  else
  {
    v14 = v10;
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v11);
  }
  objc_msgSend(v15, "setFrame:", v12, v13);
  v16.origin.x = v7;
  v16.origin.y = v11;
  v16.size.width = v14;
  v16.size.height = v6;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGRectGetMaxX(v16) + 8.0;

}

- (void)_layoutForPhone
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *amountButtons;
  float v14;
  double v15;
  float v16;
  double v17;
  UIView *customAmountBackgroundView;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  UITextField *customAmountField;
  double v31;
  double v32;
  double v33;
  _QWORD v34[12];
  BOOL v35;
  _QWORD v36[4];
  CGRect v37;

  -[SKUIGiftAmountControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SKUIGiftAmountControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v12 = -[NSMutableArray count](self->_amountButtons, "count");
  if (v12 >= 1)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0x402E000000000000;
    amountButtons = self->_amountButtons;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v14 = (v8 + -15.0 + -15.0 + (float)((float)(v12 - 1) * -8.0)) / (double)v12;
    v34[2] = __40__SKUIGiftAmountControl__layoutForPhone__block_invoke;
    v34[3] = &unk_1E73A2C28;
    v34[4] = v36;
    v34[5] = v12;
    *(double *)&v34[6] = v8 + -15.0;
    *(double *)&v34[7] = floorf(v14);
    v35 = v11 == 0;
    *(double *)&v34[8] = v4;
    *(double *)&v34[9] = v6;
    *(double *)&v34[10] = v8;
    *(double *)&v34[11] = v10;
    -[NSMutableArray enumerateObjectsUsingBlock:](amountButtons, "enumerateObjectsUsingBlock:", v34);
    _Block_object_dispose(v36, 8);
  }
  -[UIView frame](self->_customAmountBackgroundView, "frame");
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  v15 = CGRectGetMaxX(v37) + -15.0 - (v8 + -30.0);
  v16 = (v10 + -44.0) * 0.5;
  v17 = floorf(v16);
  customAmountBackgroundView = self->_customAmountBackgroundView;
  if (v11)
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v15, v17, v8 + -30.0, 44.0, v4, v6, v8, v10);
  -[UIView setFrame:](customAmountBackgroundView, "setFrame:");
  -[UITextField frame](self->_customAmountField, "frame");
  v20 = v19;
  -[UIView origin](self->_customAmountBackgroundView, "origin");
  v22 = v21 + 5.0;
  -[UIView origin](self->_customAmountBackgroundView, "origin");
  v24 = v23;
  -[UIView size](self->_customAmountBackgroundView, "size");
  v26 = (v25 - v20) * 0.5;
  v27 = v24 + floorf(v26);
  -[UIView size](self->_customAmountBackgroundView, "size");
  v29 = v28 + -10.0;
  customAmountField = self->_customAmountField;
  if (v11)
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v22, v27, v29, v20, v4, v6, v8, v10);
    v22 = v31;
    v27 = v32;
    v20 = v33;
  }
  -[UITextField setFrame:](customAmountField, "setFrame:", v22, v27, v29, v20);
}

void __40__SKUIGiftAmountControl__layoutForPhone__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  id v12;
  CGRect v13;

  v12 = a2;
  objc_msgSend(v12, "frame");
  v6 = v5;
  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (*(_QWORD *)(a1 + 40) - 1 == a3)
    v8 = *(double *)(a1 + 48) - v7;
  else
    v8 = *(double *)(a1 + 56);
  if (*(_BYTE *)(a1 + 96))
  {
    v9 = 0.0;
    v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v11 = v8;
  }
  else
  {
    v11 = v8;
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.0);
  }
  objc_msgSend(v12, "setFrame:", v10, v9);
  v13.origin.x = v7;
  v13.origin.y = 0.0;
  v13.size.width = v11;
  v13.size.height = v6;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGRectGetMaxX(v13) + 8.0;

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_amountButtons;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setBackgroundColor:", v4);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SKUIGiftAmountControl;
  -[SKUIGiftAmountControl setBackgroundColor:](&v10, sel_setBackgroundColor_, v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v13, "setMaximumFractionDigits:", 0);
    objc_msgSend(v13, "setNumberStyle:", 1);
    objc_msgSend(v13, "numberFromString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      v16 = -[SKUIGiftConfiguration currencySymbolPosition](self->_giftConfiguration, "currencySymbolPosition");
      if (v16 == 1)
      {
        objc_msgSend(v9, "_setPrefix:", 0);
        -[SKUIGiftConfiguration currencySymbol](self->_giftConfiguration, "currencySymbol");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setSuffix:withColor:", v18, v19);

      }
      else if (!v16)
      {
        -[SKUIGiftConfiguration currencySymbol](self->_giftConfiguration, "currencySymbol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setPrefix:", v17);

        objc_msgSend(v9, "_setSuffix:withColor:", 0, 0);
      }
    }

  }
  else
  {
    objc_msgSend(v9, "_setPrefix:", 0);
    v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  self->_selectedAmount = 0;
  -[SKUIGiftAmountControl _reloadSelectedButton](self, "_reloadSelectedButton", a3);
  return 1;
}

- (void)_textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SKUIGiftAmountControl tintColor](self, "tintColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView layer](self->_customAmountBackgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

}

- (void)_textFieldDidChange:(id)a3
{
  -[SKUIGiftAmountControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_textFieldDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  -[UITextField text](self->_customAmountField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    -[UIView layer](self->_customAmountBackgroundView, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIGiftAmountControl;
  -[SKUIGiftAmountControl _dynamicUserInterfaceTraitDidChange](&v8, sel__dynamicUserInterfaceTraitDidChange);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextField isFirstResponder](self->_customAmountField, "isFirstResponder"))
  {
    -[SKUIGiftAmountControl tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  -[UIView layer](self->_customAmountBackgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

}

- (void)_reloadSelectedButton
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_amountButtons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "setSelected:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "tag", (_QWORD)v8) == self->_selectedAmount);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateButtonsWithTouch:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BOOL8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGPoint v21;
  CGRect v22;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  self->_trackingAmount = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_amountButtons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "frame", (_QWORD)v15);
        v21.x = v5;
        v21.y = v7;
        v14 = CGRectContainsPoint(v22, v21);
        if (v14)
          self->_trackingAmount = objc_msgSend(v13, "tag");
        objc_msgSend(v13, "setSelected:", v14);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_storeStrong((id *)&self->_customAmountField, 0);
  objc_storeStrong((id *)&self->_customAmountBackgroundView, 0);
  objc_storeStrong((id *)&self->_amountButtons, 0);
}

- (void)initWithGiftConfiguration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftAmountControl initWithGiftConfiguration:]";
}

@end
