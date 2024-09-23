@implementation PKAccessoryDeviceView

- (PKAccessoryDeviceView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKAccessoryDeviceView)initWithPass:(id)a3 accessory:(id)a4 cutoutFrame:(CGRect)a5 parentView:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  void *v17;
  PKAccessoryDeviceView *v18;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v20.receiver = self;
  v20.super_class = (Class)PKAccessoryDeviceView;
  v18 = -[PKAccessoryDeviceView initWithFrame:](&v20, sel_initWithFrame_);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessory, a4);
    objc_storeStrong((id *)&v18->_pass, a3);
    v18->_cutoutFrame.origin.x = x;
    v18->_cutoutFrame.origin.y = y;
    v18->_cutoutFrame.size.width = width;
    v18->_cutoutFrame.size.height = height;
    objc_storeStrong((id *)&v18->_parentView, a6);
    v18->_state = 0;
    -[PKAccessoryDeviceView changeToState:](v18, "changeToState:", 0);
    v18->_animationDelay = 4.0;
    -[PKAccessoryDeviceView _setColors](v18, "_setColors");
    -[PKAccessoryDeviceView presentOnParentView](v18, "presentOnParentView");
  }

  return v18;
}

- (PKAccessoryDeviceView)initWithState:(int64_t)a3 accessory:(id)a4 cutoutFrame:(CGRect)a5 parentView:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  void *v16;
  PKAccessoryDeviceView *v17;
  objc_super v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  v15 = a6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v19.receiver = self;
  v19.super_class = (Class)PKAccessoryDeviceView;
  v17 = -[PKAccessoryDeviceView initWithFrame:](&v19, sel_initWithFrame_);

  if (v17)
  {
    v17->_state = a3;
    objc_storeStrong((id *)&v17->_accessory, a4);
    v17->_cutoutFrame.origin.x = x;
    v17->_cutoutFrame.origin.y = y;
    v17->_cutoutFrame.size.width = width;
    v17->_cutoutFrame.size.height = height;
    objc_storeStrong((id *)&v17->_parentView, a6);
    -[PKAccessoryDeviceView _setColors](v17, "_setColors");
    -[PKAccessoryDeviceView changeToState:](v17, "changeToState:", v17->_state);
    -[PKAccessoryDeviceView presentOnParentView](v17, "presentOnParentView");
  }

  return v17;
}

- (void)setCutoutFrame:(CGRect)a3
{
  self->_cutoutFrame = a3;
  -[PKAccessoryDeviceView changeToState:](self, "changeToState:", self->_state);
}

- (void)_setColors
{
  void *v3;
  UIColor *v4;
  UIColor *strokeColor;
  UIColor *v6;
  UIColor *v7;
  void *v8;
  void *v9;
  UIColor *v10;
  UIColor *backgroundColor;
  UIColor *v12;
  UIColor *v13;
  UIColor *v14;
  id v15;

  -[PKAccessoryDevice primaryColorData](self->_accessory, "primaryColorData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  if (v3)
  {
    PKUIColorFromP3ColorData(v3);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    strokeColor = self->_strokeColor;
    self->_strokeColor = v4;

  }
  if (!self->_strokeColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v7 = self->_strokeColor;
    self->_strokeColor = v6;

  }
  -[PKAccessoryDevice secondaryColorData](self->_accessory, "secondaryColorData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    PKUIColorFromP3ColorData(v8);
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v10;

  }
  v12 = self->_backgroundColor;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v14 = self->_backgroundColor;
    self->_backgroundColor = v13;

    v12 = self->_backgroundColor;
  }
  -[PKAccessoryDeviceView setBackgroundColor:](self, "setBackgroundColor:", v12);

}

- (void)presentOnParentView
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD handler[4];
  NSObject *v7;
  id v8;
  id location;

  -[PKAccessoryDeviceView removeFromSuperview](self, "removeFromSuperview");
  -[PKAccessoryDeviceView setAlpha:](self, "setAlpha:", 1.0);
  -[UIView addSubview:](self->_parentView, "addSubview:", self);
  -[UIView bringSubviewToFront:](self->_parentView, "bringSubviewToFront:", self);
  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v4 = dispatch_time(0, 12000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__PKAccessoryDeviceView_presentOnParentView__block_invoke;
  handler[3] = &unk_1E3E612C0;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __44__PKAccessoryDeviceView_presentOnParentView__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  char v6;
  id v7;
  id *v8;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained + 63;
    v8 = WeakRetained;
    v5 = objc_loadWeakRetained(WeakRetained + 63);
    v6 = objc_opt_respondsToSelector();

    WeakRetained = v8;
    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(v4);
      objc_msgSend(v7, "accessoryDeviceDidReachHardTimeout");

      WeakRetained = v8;
    }
  }

}

- (void)changeToState:(int64_t)a3
{
  NSObject *timeOutBlockTimer;
  PKAccessoryDeviceViewDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  self->_state = a3;
  timeOutBlockTimer = self->_timeOutBlockTimer;
  if (timeOutBlockTimer)
    dispatch_source_cancel(timeOutBlockTimer);
  -[PKAccessoryDeviceView setNeedsLayout](self, "setNeedsLayout");
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "accessoryDeviceDidChangeStateTo:", a3);

  }
}

- (void)layoutSubviews
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAccessoryDeviceView;
  -[PKAccessoryDeviceView layoutSubviews](&v9, sel_layoutSubviews);
  switch(self->_state)
  {
    case 0:
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to processing state", v8, 2u);
      }

      self->_animationDelay = 4.0;
      -[PKAccessoryDeviceView _layoutProcessingState](self, "_layoutProcessingState");
      break;
    case 1:
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to success state", v8, 2u);
      }

      self->_animationDelay = 4.0;
      -[PKAccessoryDeviceView _layoutSuccessState](self, "_layoutSuccessState");
      break;
    case 2:
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to success with intervention state", v8, 2u);
      }

      self->_animationDelay = 10.0;
      -[PKAccessoryDeviceView _layoutSuccessWithUserInterventionState](self, "_layoutSuccessWithUserInterventionState");
      break;
    case 3:
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to failure state", v8, 2u);
      }

      self->_animationDelay = 4.0;
      -[PKAccessoryDeviceView _layoutFailureState](self, "_layoutFailureState");
      break;
    case 4:
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to try again state", v8, 2u);
      }

      self->_animationDelay = 4.0;
      -[PKAccessoryDeviceView _layoutTryAgainState](self, "_layoutTryAgainState");
      break;
    default:
      return;
  }
}

- (void)_layoutSuccessState
{
  _QWORD v3[5];

  -[UILabel setAlpha:](self->_label, "setAlpha:", 0.0);
  -[PKGlyphView setAlpha:](self->_glyph, "setAlpha:", 0.0);
  -[PKGlyphView setState:](self->_glyph, "setState:", 11);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PKAccessoryDeviceView__layoutSuccessState__block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.3);
}

uint64_t __44__PKAccessoryDeviceView__layoutSuccessState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void)_layoutFailureState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  PKGlyphView *glyph;
  id v9;
  uint64_t v10;
  _QWORD v11[5];

  -[UILabel setAlpha:](self->_label, "setAlpha:", 0.0);
  -[PKGlyphView setAlpha:](self->_glyph, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark"), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKGlyphView primaryColor](self->_glyph, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_flatImageWithColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[PKGlyphView setState:](self->_glyph, "setState:", 10);
  glyph = self->_glyph;
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "CGImage");
  objc_msgSend(v9, "alignmentRectInsets");
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](glyph, "setCustomImage:withAlignmentEdgeInsets:", v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__PKAccessoryDeviceView__layoutFailureState__block_invoke;
  v11[3] = &unk_1E3E612E8;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.3);

}

uint64_t __44__PKAccessoryDeviceView__layoutFailureState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void)_layoutTryAgainState
{
  id v3;

  PKLocalizedD5xString(CFSTR("PAYMENT_REMOVE_SLEEVE_TRY_AGAIN"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAccessoryDeviceView _showWalletWithMessage:](self, "_showWalletWithMessage:", v3);

}

- (void)_layoutSuccessWithUserInterventionState
{
  id v3;

  PKLocalizedD5xString(CFSTR("PAYMENT_REMOVE_SLEEVE_MORE_PASSES"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAccessoryDeviceView _showWalletWithMessage:](self, "_showWalletWithMessage:", v3);

}

- (void)_layoutProcessingState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *imageBackgroundView;
  void *v9;
  UIView *v10;
  PKGlyphView *v11;
  PKGlyphView *glyph;
  PKGlyphView *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *timeOutBlockTimer;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id location;

  -[UILabel setAlpha:](self->_label, "setAlpha:", 0.0);
  -[PKGlyphView setAlpha:](self->_glyph, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_imageBackgroundView, "setAlpha:", 0.0);
  -[UILabel removeFromSuperview](self->_label, "removeFromSuperview");
  -[PKGlyphView removeFromSuperview](self->_glyph, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_imageBackgroundView, "removeFromSuperview");
  -[PKAccessoryDeviceView setAlpha:](self, "setAlpha:", 1.0);
  -[PKAccessoryDeviceView _setColors](self, "_setColors");
  -[PKAccessoryDeviceView _springBoardCutoutRect](self, "_springBoardCutoutRect");
  -[PKPass frontFaceImage](self->_pass, "frontFaceImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithAspectFillToSize:", 83.0, 52.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resizedImageWithConstraints:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
  imageBackgroundView = self->_imageBackgroundView;
  self->_imageBackgroundView = v7;

  -[UIView layer](self->_imageBackgroundView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setContentMode:](self->_imageBackgroundView, "setContentMode:", 1);
  -[UIView setClipsToBounds:](self->_imageBackgroundView, "setClipsToBounds:", 1);
  -[UIView _setContinuousCornerRadius:](self->_imageBackgroundView, "_setContinuousCornerRadius:", 4.0);
  -[UIView setBackgroundColor:](self->_imageBackgroundView, "setBackgroundColor:", self->_backgroundColor);
  objc_msgSend(v9, "setBorderWidth:", PKUIPixelLength());
  objc_msgSend(v9, "setBorderColor:", -[UIColor CGColor](self->_strokeColor, "CGColor"));
  v10 = self->_imageBackgroundView;
  PKRectRoundToPixel();
  -[UIView setFrame:](v10, "setFrame:");
  -[PKAccessoryDeviceView addSubview:](self, "addSubview:", self->_imageBackgroundView);
  v11 = (PKGlyphView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFF0]), "initWithStyle:", 5);
  glyph = self->_glyph;
  self->_glyph = v11;

  -[PKGlyphView setState:](self->_glyph, "setState:", 7);
  v13 = self->_glyph;
  PKRectRoundToPixel();
  -[PKGlyphView setFrame:](v13, "setFrame:");
  -[PKAccessoryDeviceView addSubview:](self, "addSubview:", self->_glyph);
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  timeOutBlockTimer = self->_timeOutBlockTimer;
  self->_timeOutBlockTimer = v14;

  v16 = self->_timeOutBlockTimer;
  v17 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke;
  v21[3] = &unk_1E3E61310;
  objc_copyWeak(&v22, &location);
  v19 = (void *)objc_msgSend(v21, "copy");
  dispatch_source_set_event_handler((dispatch_source_t)self->_timeOutBlockTimer, v19);
  dispatch_resume((dispatch_object_t)self->_timeOutBlockTimer);
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke_2;
  v20[3] = &unk_1E3E612E8;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v20, 0.3);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 62);
    v4 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v2 = v4;
    }
    if (!v2[61])
    {
      objc_msgSend(v2, "changeToState:", 3);
      v2 = v4;
    }
  }

}

uint64_t __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void)_showWalletWithMessage:(id)a3
{
  UILabel *label;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *v10;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  UIView *v24;
  UIView *imageBackgroundView;
  UIView *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  UILabel *v36;
  _QWORD v37[5];
  CGRect v38;

  label = self->_label;
  v5 = a3;
  -[UILabel setAlpha:](label, "setAlpha:", 0.0);
  -[PKGlyphView setAlpha:](self->_glyph, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_imageBackgroundView, "setAlpha:", 0.0);
  -[UILabel removeFromSuperview](self->_label, "removeFromSuperview");
  -[PKGlyphView removeFromSuperview](self->_glyph, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_imageBackgroundView, "removeFromSuperview");
  -[PKAccessoryDeviceView _springBoardCutoutRect](self, "_springBoardCutoutRect");
  v7 = v6;
  v9 = v8;
  v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  v11 = self->_label;
  self->_label = v10;

  v12 = self->_label;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  -[UILabel setText:](self->_label, "setText:", v5);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
  v14 = self->_label;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v14, "setFont:", v15);

  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 0);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v7 + -44.0 + -16.0 + -48.0, v9 + -44.0);
  v16 = (void *)MEMORY[0x1E0D66DF8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("AddPass_Icon"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PKSizeRoundToPixel();
  objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithAspectFillToSize:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resizedImageWithConstraints:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v21);
  v23 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v24 = (UIView *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 44.0, 44.0);
  imageBackgroundView = self->_imageBackgroundView;
  self->_imageBackgroundView = v24;

  v26 = self->_imageBackgroundView;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

  -[UIView _setContinuousCornerRadius:](self->_imageBackgroundView, "_setContinuousCornerRadius:", 8.0);
  PKRectRoundToPixel();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[UIView setFrame:](self->_imageBackgroundView, "setFrame:");
  PKSizeAlignedInRect();
  objc_msgSend(v22, "setFrame:");
  v36 = self->_label;
  v38.origin.x = v29;
  v38.origin.y = v31;
  v38.size.width = v33;
  v38.size.height = v35;
  CGRectGetMaxX(v38);
  PKRectRoundToPixel();
  -[UILabel setFrame:](v36, "setFrame:");
  -[PKAccessoryDeviceView addSubview:](self, "addSubview:", v22);
  -[PKAccessoryDeviceView addSubview:](self, "addSubview:", self->_imageBackgroundView);
  -[PKAccessoryDeviceView addSubview:](self, "addSubview:", self->_label);
  -[PKAccessoryDeviceView bringSubviewToFront:](self, "bringSubviewToFront:", v22);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __48__PKAccessoryDeviceView__showWalletWithMessage___block_invoke;
  v37[3] = &unk_1E3E612E8;
  v37[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v37, 0.3);

}

uint64_t __48__PKAccessoryDeviceView__showWalletWithMessage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

- (void)dismissViewWithCompletion:(id)a3
{
  id v4;
  double animationDelay;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  animationDelay = self->_animationDelay;
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke;
  v10[3] = &unk_1E3E612E8;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke_2;
  v8[3] = &unk_1E3E61338;
  v8[4] = self;
  v7 = v4;
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v10, v8, 2.0, animationDelay);

}

uint64_t __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)dismissViewImmediatelyWithCompletion:(id)a3
{
  self->_animationDelay = 0.0;
  -[PKAccessoryDeviceView dismissViewWithCompletion:](self, "dismissViewWithCompletion:", a3);
}

- (CGRect)_springBoardCutoutRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cutoutFrame.origin.x;
  y = self->_cutoutFrame.origin.y;
  width = self->_cutoutFrame.size.width;
  height = self->_cutoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)cutoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cutoutFrame.origin.x;
  y = self->_cutoutFrame.origin.y;
  width = self->_cutoutFrame.size.width;
  height = self->_cutoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PKAccessoryDeviceViewDelegate)delegate
{
  return (PKAccessoryDeviceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeOutBlockTimer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
