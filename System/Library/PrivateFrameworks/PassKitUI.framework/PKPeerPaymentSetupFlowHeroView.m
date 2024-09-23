@implementation PKPeerPaymentSetupFlowHeroView

- (PKPeerPaymentSetupFlowHeroView)initWithPeerPaymentPassSnapShot:(id)a3 peerPaymentCredential:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentSetupFlowHeroView *v8;
  PKPeerPaymentSetupFlowHeroView *v9;
  id *p_credential;
  uint64_t v11;
  UIImageView *passSnapshotView;
  void *v13;
  id v14;
  double v15;
  void *v16;
  PKPeerPaymentHeroBubbleView *v17;
  PKPeerPaymentHeroBubbleView *bubbleView;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentSetupFlowHeroView;
  v8 = -[PKPeerPaymentSetupFlowHeroView init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    p_credential = (id *)&v8->_credential;
    objc_storeStrong((id *)&v8->_credential, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    passSnapshotView = v9->_passSnapshotView;
    v9->_passSnapshotView = (UIImageView *)v11;

    -[UIImageView setContentMode:](v9->_passSnapshotView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v9->_passSnapshotView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKPeerPaymentSetupFlowHeroView addSubview:](v9, "addSubview:", v9->_passSnapshotView);
    -[UIImageView layer](v9->_passSnapshotView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldRasterize:", 1);
    objc_msgSend(v13, "setRasterizationScale:", PKUIScreenScale());
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.25, 1.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    LODWORD(v15) = 1041865114;
    objc_msgSend(v13, "setShadowOpacity:", v15);
    objc_msgSend(v13, "setShadowOffset:", 0.0, 4.0);
    objc_msgSend(v13, "setShadowRadius:", 4.0);
    -[PKPeerPaymentSetupFlowHeroView _updateImageViewDynamicColors](v9, "_updateImageViewDynamicColors");
    if (-[PKPeerPaymentSetupFlowHeroView _shouldShowBubbleView](v9, "_shouldShowBubbleView"))
    {
      objc_msgSend(*p_credential, "amount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        -[PKPeerPaymentSetupFlowHeroView _defaultCurrencyAmount](v9, "_defaultCurrencyAmount");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = -[PKPeerPaymentHeroBubbleView initWithCurrencyAmount:regitrationFlowState:]([PKPeerPaymentHeroBubbleView alloc], "initWithCurrencyAmount:regitrationFlowState:", v16, objc_msgSend(*p_credential, "flowState"));
      bubbleView = v9->_bubbleView;
      v9->_bubbleView = v17;

      -[PKPeerPaymentHeroBubbleView sizeToFit](v9->_bubbleView, "sizeToFit");
      -[PKPeerPaymentSetupFlowHeroView addSubview:](v9, "addSubview:", v9->_bubbleView);

    }
    v9->_animationState = objc_msgSend(*p_credential, "flowState") == 2;
    -[PKPeerPaymentHeroBubbleView layer](v9->_bubbleView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAnchorPoint:", 0.0, 0.0);

    -[UIImageView layer](v9->_passSnapshotView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAnchorPoint:", 0.0, 0.0);

  }
  return v9;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double MaxX;
  double MaxY;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v34.receiver = self;
  v34.super_class = (Class)PKPeerPaymentSetupFlowHeroView;
  -[PKPeerPaymentSetupFlowHeroView layoutSubviews](&v34, sel_layoutSubviews);
  -[PKPeerPaymentSetupFlowHeroView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView frame](self->_passSnapshotView, "frame");
  -[PKPeerPaymentHeroBubbleView frame](self->_bubbleView, "frame");
  rect = v11;
  rect_16 = v12;
  rect_24 = v13;
  v32 = v14;
  UIRectCenteredYInRect();
  v17 = v16;
  rect_8 = v15;
  v33 = v18;
  if (self->_bubbleView)
  {
    if (-[PKPeerPaymentSetupFlowHeroView _bubbleIsOnLeftSide](self, "_bubbleIsOnLeftSide"))
    {
      v19 = 0.0;
      v20 = 15.0;
      v22 = rect_24;
      v21 = v32;
      v23 = rect_16;
    }
    else
    {
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.width = v8;
      v35.size.height = v10;
      MaxX = CGRectGetMaxX(v35);
      v36.origin.x = rect;
      v23 = rect_16;
      v22 = rect_24;
      v36.origin.y = rect_16;
      v21 = v32;
      v36.size.width = v32;
      v36.size.height = rect_24;
      v19 = MaxX - CGRectGetWidth(v36);
      v20 = 0.0;
    }
    v37.origin.x = 0.0;
    v37.origin.y = v17;
    v25 = rect_8;
    v37.size.width = rect_8;
    v37.size.height = v33;
    MaxY = CGRectGetMaxY(v37);
    v38.origin.x = v19;
    v38.origin.y = v23;
    v38.size.width = v21;
    v38.size.height = v22;
    v24 = MaxY - CGRectGetHeight(v38);
    v17 = v17 + -2.0;
  }
  else
  {
    v20 = 0.0;
    v22 = rect_24;
    v21 = v32;
    v25 = v15;
    v24 = rect_16;
    v19 = rect;
  }
  if (self->_animationState != 2)
  {
    -[PKPeerPaymentHeroBubbleView setFrame:](self->_bubbleView, "setFrame:", v19, v24, v21, v22);
    -[UIImageView setFrame:](self->_passSnapshotView, "setFrame:", v20, v17, v25, v33);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[UIImageView frame](self->_passSnapshotView, "frame", a3.width, a3.height);
  v6 = v4 + 15.0;
  if (!self->_bubbleView)
    v6 = v4;
  v7 = v5 + 2.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentSetupFlowHeroView;
  -[PKPeerPaymentSetupFlowHeroView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKPeerPaymentSetupFlowHeroView _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
}

- (void)startAnimation
{
  -[PKPeerPaymentSetupFlowHeroView startAnimationWithCompletion:](self, "startAnimationWithCompletion:", 0);
}

- (void)startAnimationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  int64_t animationState;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(_QWORD);
  _QWORD v27[5];
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform buf;
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  animationState = self->_animationState;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (animationState == 1)
  {
    if (v7)
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Starting message bubble animation.", (uint8_t *)&buf, 2u);
    }

    -[UIImageView frame](self->_passSnapshotView, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[PKPeerPaymentHeroBubbleView frame](self->_bubbleView, "frame");
    CGRectGetWidth(v36);
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    CGRectGetMaxX(v37);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    CGRectGetMinY(v38);
    PKFloatRoundToPixel();
    v17 = v16;
    PKFloatRoundToPixel();
    v19 = v18;
    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, 0.25, 0.25);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeTranslation(&v33, v17, v19);
    t1 = buf;
    t2 = v33;
    memset(&v32, 0, sizeof(v32));
    CGAffineTransformConcat(&v32, &t1, &t2);
    PKFloatRoundToPixel();
    v21 = v20;
    PKFloatRoundToPixel();
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeTranslation(&t1, v21, v22);
    self->_animationState = 2;
    v23 = (void *)MEMORY[0x1E0DC3F10];
    v27[0] = MEMORY[0x1E0C809B0];
    v28 = v32;
    v27[1] = 3221225472;
    v27[2] = __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke;
    v27[3] = &unk_1E3E75398;
    v27[4] = self;
    v29 = t1;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke_2;
    v25[3] = &unk_1E3E669E0;
    v25[4] = self;
    v26 = v4;
    objc_msgSend(v23, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v27, v25, 0.7, 0.0, 1.0, 1.0);

  }
  else
  {
    if (v7)
    {
      -[PKPeerPaymentCredential flowState](self->_credential, "flowState");
      PKPeerPaymentRegistrationFlowStateToString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138412290;
      *(_QWORD *)((char *)&buf.a + 4) = v24;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Cannot animate the message bubble when the registration flow state is %@", (uint8_t *)&buf, 0xCu);

    }
    if (v4)
      v4[2](v4);
  }

}

void __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setAffineTransform:", &v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(a1 + 104);
  v7 = *(_OWORD *)(a1 + 88);
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 120);
  objc_msgSend(v4, "setAffineTransform:", &v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "pluginBalloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

}

uint64_t __63__PKPeerPaymentSetupFlowHeroView_startAnimationWithCompletion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(result + 32) + 440) = 3;
    result = *(_QWORD *)(result + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateImageViewDynamicColors
{
  void *v3;
  _QWORD v4[5];

  -[PKPeerPaymentSetupFlowHeroView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PKPeerPaymentSetupFlowHeroView__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __63__PKPeerPaymentSetupFlowHeroView__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (id)_defaultCurrencyAmount
{
  NSDecimalNumber *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("28"));
  v2 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v2, CFSTR("USD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldShowBubbleView
{
  uint64_t v3;

  v3 = -[PKPeerPaymentCredential flowState](self->_credential, "flowState");
  if ((unint64_t)(v3 - 3) < 3)
    return 1;
  if (v3 == 2)
    return -[PKPeerPaymentCredential paymentMode](self->_credential, "paymentMode") != 2;
  return 0;
}

- (BOOL)_bubbleIsOnLeftSide
{
  return (unint64_t)(-[PKPeerPaymentCredential flowState](self->_credential, "flowState") - 6) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_bubbleView, 0);
  objc_storeStrong((id *)&self->_passSnapshotView, 0);
}

@end
