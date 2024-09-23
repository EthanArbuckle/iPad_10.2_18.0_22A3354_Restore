@implementation PKPassShareActivationShareActivationCodeView

- (PKPassShareActivationShareActivationCodeView)init
{

  return 0;
}

- (PKPassShareActivationShareActivationCodeView)initWithDelegate:(id)a3
{
  id v4;
  PKPassShareActivationShareActivationCodeView *v5;
  PKPassShareActivationShareActivationCodeView *v6;
  UIView *v7;
  UIView *activationCodeBackgroundView;
  UIView *v9;
  void *v10;
  UILabel *v11;
  UILabel *activationCodeLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPassShareActivationShareActivationCodeView *v19;
  id v20;
  void (**v21)(void *, const __CFString *, char *, const __CFString *);
  uint64_t v22;
  PKContinuousButton *phoneButton;
  uint64_t v24;
  PKContinuousButton *shareButton;
  uint64_t v26;
  PKContinuousButton *copyButton;
  _QWORD v29[4];
  id v30;
  PKPassShareActivationShareActivationCodeView *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPassShareActivationShareActivationCodeView;
  v5 = -[PKPassShareActivationShareActivationCodeView init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_showPhoneCallButton = 1;
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    activationCodeBackgroundView = v6->_activationCodeBackgroundView;
    v6->_activationCodeBackgroundView = v7;

    v9 = v6->_activationCodeBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIView _setContinuousCornerRadius:](v6->_activationCodeBackgroundView, "_setContinuousCornerRadius:", 10.0);
    -[PKPassShareActivationShareActivationCodeView addSubview:](v6, "addSubview:", v6->_activationCodeBackgroundView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    activationCodeLabel = v6->_activationCodeLabel;
    v6->_activationCodeLabel = v11;

    -[UILabel setAdjustsFontSizeToFitWidth:](v6->_activationCodeLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v6->_activationCodeLabel, "setTextAlignment:", 1);
    v13 = v6->_activationCodeLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](v6->_activationCodeLabel, "setNumberOfLines:", 1);
    -[UILabel pkui_setExcludedFromScreenCapture:andBroadcasting:](v6->_activationCodeLabel, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    v15 = v6->_activationCodeLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[PKPassShareActivationShareActivationCodeView addSubview:](v6, "addSubview:", v6->_activationCodeLabel);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v6, sel__showCopyMenu);
    -[UIView addGestureRecognizer:](v6->_activationCodeBackgroundView, "addGestureRecognizer:", v17);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC4920]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __65__PKPassShareActivationShareActivationCodeView_initWithDelegate___block_invoke;
    v29[3] = &unk_1E3E76458;
    v30 = v18;
    v19 = v6;
    v31 = v19;
    v20 = v18;
    v21 = (void (**)(void *, const __CFString *, char *, const __CFString *))_Block_copy(v29);
    v21[2](v21, CFSTR("phone.fill"), sel__phoneButtonPressed, CFSTR("SHARE_ACTIVATION_OVERVIEW_CALL_BUTTON_TITLE"));
    v22 = objc_claimAutoreleasedReturnValue();
    phoneButton = v19->_phoneButton;
    v19->_phoneButton = (PKContinuousButton *)v22;

    v21[2](v21, CFSTR("square.and.arrow.up.fill"), sel__shareButtonPressed, CFSTR("SHARE_ACTIVATION_OVERVIEW_SHARE_BUTTON_TITLE"));
    v24 = objc_claimAutoreleasedReturnValue();
    shareButton = v19->_shareButton;
    v19->_shareButton = (PKContinuousButton *)v24;

    v21[2](v21, CFSTR("doc.on.doc.fill"), sel__copyButtonPressed, CFSTR("SHARE_ACTIVATION_OVERVIEW_COPY_BUTTON_TITLE"));
    v26 = objc_claimAutoreleasedReturnValue();
    copyButton = v19->_copyButton;
    v19->_copyButton = (PKContinuousButton *)v26;

  }
  return v6;
}

PKContinuousButton *__65__PKPassShareActivationShareActivationCodeView_initWithDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  NSString *v7;
  id v8;
  PKContinuousButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  __int128 v20;
  int64x2_t v21;

  v7 = a4;
  v8 = a2;
  v19 = 0x4024000000000000;
  v20 = xmmword_19DEE0240;
  v21 = vdupq_n_s64(2uLL);
  v9 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v19);
  v10 = (void *)MEMORY[0x1E0DC3520];
  PKLocalizedShareableCredentialString(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pkui_plainConfigurationWithTitle:font:lineBreakMode:textAlignment:", v11, *(_QWORD *)(a1 + 32), 4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v12, "setTitleAlignment:", 2);
  objc_msgSend(v12, "setImagePlacement:", 1);
  objc_msgSend(v12, "setImagePadding:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setImage:", v13);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreferredSymbolConfigurationForImage:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBaseBackgroundColor:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBaseForegroundColor:", v16);

  objc_msgSend(v12, "background");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", 0.0);

  -[PKContinuousButton setConfiguration:](v9, "setConfiguration:", v12);
  -[PKContinuousButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), a3, 64);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v9);

  return v9;
}

- (void)setActivationCode:(id)a3
{
  id v5;
  NSString *activationCode;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  activationCode = self->_activationCode;
  v9 = (NSString *)v5;
  v7 = activationCode;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_activationCode, a3);
    -[UILabel setText:](self->_activationCodeLabel, "setText:", self->_activationCode);
    -[PKPassShareActivationShareActivationCodeView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setShowPhoneCallButton:(BOOL)a3
{
  if (self->_showPhoneCallButton != a3)
  {
    self->_showPhoneCallButton = a3;
    if (a3)
      -[PKPassShareActivationShareActivationCodeView addSubview:](self, "addSubview:", self->_phoneButton);
    else
      -[PKContinuousButton removeFromSuperview](self->_phoneButton, "removeFromSuperview");
    -[PKPassShareActivationShareActivationCodeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 192.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  double width;
  double height;
  UILabel *activationCodeLabel;
  PKContinuousButton *shareButton;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  PKContinuousButton *copyButton;
  void *v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  uint64_t i;
  CGFloat v16;
  CGPoint origin;
  CGFloat v18;
  CGPoint v19;
  CGFloat v20;
  void *v21;
  CGRect v22;
  CGRect slice;
  CGRect remainder;
  _QWORD v25[2];
  _QWORD v26[4];
  CGRect v27;

  v26[3] = *MEMORY[0x1E0C80C00];
  -[PKPassShareActivationShareActivationCodeView bounds](self, "bounds");
  width = v27.size.width;
  height = v27.size.height;
  remainder = v27;
  memset(&slice, 0, sizeof(slice));
  CGRectDivide(v27, &slice, &remainder, 90.0, CGRectMinYEdge);
  -[UIView setFrame:](self->_activationCodeBackgroundView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UILabel sizeThatFits:](self->_activationCodeLabel, "sizeThatFits:", width, height);
  activationCodeLabel = self->_activationCodeLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](activationCodeLabel, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 32.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, 60.0, CGRectMinYEdge);
  v22 = slice;
  if (self->_showPhoneCallButton)
  {
    shareButton = self->_shareButton;
    v26[0] = self->_phoneButton;
    v26[1] = shareButton;
    v26[2] = self->_copyButton;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v26;
    v9 = 3;
  }
  else
  {
    copyButton = self->_copyButton;
    v25[0] = self->_shareButton;
    v25[1] = copyButton;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v25;
    v9 = 2;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, *(_OWORD *)&v22.origin);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  PKFloatRoundToPixel();
  if (v12)
  {
    v14 = v13;
    for (i = 0; i != v12; ++i)
    {
      v16 = v22.size.width;
      if (i)
      {
        origin = v22.origin;
        v18 = v22.size.height;
        CGRectDivide(*(CGRect *)(&v16 - 2), &slice, &v22, 11.0, CGRectMinXEdge);
        v16 = v22.size.width;
      }
      v19 = v22.origin;
      v20 = v22.size.height;
      CGRectDivide(*(CGRect *)(&v16 - 2), &slice, &v22, v14, CGRectMinXEdge);
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

    }
  }

}

- (void)_phoneButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationCodeViewDidSelectPhone:", self);

}

- (void)_shareButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationCodeViewDidSelectShare:", self);

}

- (void)_copyButtonPressed
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  -[PKContinuousButton setUserInteractionEnabled:](self->_copyButton, "setUserInteractionEnabled:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationCodeViewDidSelectCopy:", self);

  -[PKContinuousButton configuration](self->_copyButton, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = (void *)objc_msgSend(v5, "copy");
  PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_OVERVIEW_COPY_BUTTON_COPIED"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v6, "setImage:", 0);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke;
  v15[3] = &unk_1E3E61388;
  v15[4] = self;
  v16 = v6;
  v10 = v6;
  objc_msgSend(v8, "pkui_animateUsingOptions:delay:animations:completion:", 4, v15, 0, 0.0);
  v11 = dispatch_time(0, 2000000000);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_2;
  v13[3] = &unk_1E3E61388;
  v13[4] = self;
  v14 = v5;
  v12 = v5;
  dispatch_after(v11, MEMORY[0x1E0C80D38], v13);

}

uint64_t __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

void __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  id v7;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v6[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_3;
  v6[3] = &unk_1E3E61388;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = v3;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_4;
  v5[3] = &unk_1E3E62288;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "pkui_animateUsingOptions:delay:animations:completion:", 4, v6, v5, 0.0);

}

uint64_t __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__PKPassShareActivationShareActivationCodeView__copyButtonPressed__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setUserInteractionEnabled:", 1);
}

- (void)_showCopyMenu
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC39E8]);
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:action:", v4, sel__copyActivationCode);

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenuItems:", v7);

  -[UILabel frame](self->_activationCodeLabel, "frame");
  objc_msgSend(v6, "showMenuFromView:rect:", self);

}

- (void)_copyActivationCode
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationCodeViewDidSelectCopy:", self);

}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (BOOL)showPhoneCallButton
{
  return self->_showPhoneCallButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationCode, 0);
  objc_storeStrong((id *)&self->_copyButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_activationCodeLabel, 0);
  objc_storeStrong((id *)&self->_activationCodeBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
