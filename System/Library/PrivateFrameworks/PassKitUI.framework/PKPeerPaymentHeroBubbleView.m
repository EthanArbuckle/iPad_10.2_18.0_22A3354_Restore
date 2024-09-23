@implementation PKPeerPaymentHeroBubbleView

- (PKPeerPaymentHeroBubbleView)initWithCurrencyAmount:(id)a3 regitrationFlowState:(unint64_t)a4
{
  id v6;
  PKPeerPaymentHeroBubbleView *v7;
  PKPeerPaymentHeroBubbleView *v8;
  PKPeerPaymentBubbleView *v9;
  unint64_t bubbleState;
  uint64_t v11;
  PKPeerPaymentBubbleView *peerPaymentBubbleView;
  UILabel *v13;
  UILabel *bubbleAmountLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  PKPeerPaymentBubbleView *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v38;

  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKPeerPaymentHeroBubbleView;
  v7 = -[PKPeerPaymentHeroBubbleView init](&v38, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_bubbleState = -[PKPeerPaymentHeroBubbleView _bubbleStateForRegistrationState:](v7, "_bubbleStateForRegistrationState:", a4);
    v9 = [PKPeerPaymentBubbleView alloc];
    bubbleState = v8->_bubbleState;
    if (a4 == 2)
    {
      v11 = -[PKPeerPaymentBubbleView initWithCurrencyAmount:state:](v9, "initWithCurrencyAmount:state:", 0, bubbleState);
      peerPaymentBubbleView = v8->_peerPaymentBubbleView;
      v8->_peerPaymentBubbleView = (PKPeerPaymentBubbleView *)v11;

      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      bubbleAmountLabel = v8->_bubbleAmountLabel;
      v8->_bubbleAmountLabel = v13;

      v15 = v8->_bubbleAmountLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v15, "setFont:", v16);

      v17 = v8->_bubbleAmountLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v17, "setTextColor:", v18);

      -[UILabel setTextAlignment:](v8->_bubbleAmountLabel, "setTextAlignment:", 1);
      -[UILabel setNumberOfLines:](v8->_bubbleAmountLabel, "setNumberOfLines:", 1);
      -[UILabel setAdjustsFontSizeToFitWidth:](v8->_bubbleAmountLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setMinimumScaleFactor:](v8->_bubbleAmountLabel, "setMinimumScaleFactor:", 0.5);
      -[UILabel setBaselineAdjustment:](v8->_bubbleAmountLabel, "setBaselineAdjustment:", 1);
      -[PKPeerPaymentHeroBubbleView _bubbleAmountLabelTextWithAmount:](v8, "_bubbleAmountLabelTextWithAmount:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[PKPeerPaymentHeroBubbleView _bubbleAmountLabelTextAttributes](v8, "_bubbleAmountLabelTextAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v19, v21);

      -[UILabel setAttributedText:](v8->_bubbleAmountLabel, "setAttributedText:", v22);
      -[UILabel setAccessibilityIdentifier:](v8->_bubbleAmountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
      -[PKPeerPaymentHeroBubbleView addSubview:](v8, "addSubview:", v8->_bubbleAmountLabel);

    }
    else
    {
      v23 = -[PKPeerPaymentBubbleView initWithCurrencyAmount:state:](v9, "initWithCurrencyAmount:state:", v6, bubbleState);
      v19 = v8->_peerPaymentBubbleView;
      v8->_peerPaymentBubbleView = (PKPeerPaymentBubbleView *)v23;
    }

    -[PKPeerPaymentBubbleView setDisplaysApplePayLogo:](v8->_peerPaymentBubbleView, "setDisplaysApplePayLogo:", 1);
    -[PKPeerPaymentBubbleView setLiveRenderingEnabled:](v8->_peerPaymentBubbleView, "setLiveRenderingEnabled:", 0);
    v24 = objc_alloc_init(_MergedGlobals_3_1());
    objc_msgSend(v24, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v24, "setOrientation:", 1);
    objc_msgSend(v24, "setHasTail:", 1);
    v25 = a4 - 3;
    objc_msgSend(v24, "setOrientation:", a4 - 3 < 0xFFFFFFFFFFFFFFFELL);
    v26 = *MEMORY[0x1E0DC49E8];
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(v24, "setTextAlignmentInsets:", *MEMORY[0x1E0DC49E8], v27, v28, v29);
    objc_msgSend(v24, "setPluginView:", v8->_peerPaymentBubbleView);
    objc_msgSend(v24, "sizeToFit");
    objc_msgSend(v24, "prepareForDisplay");
    objc_storeStrong((id *)&v8->_pluginBalloonView, v24);
    -[PKPeerPaymentHeroBubbleView addSubview:](v8, "addSubview:", v8->_pluginBalloonView);
    -[objc_class sharedBehaviors](off_1EE4C3CA0(), "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = v8->_peerPaymentBubbleView;
    if (v30)
    {
      objc_msgSend(v30, "pluginBalloonInsetsForMessageFromMe:", v25 < 0xFFFFFFFFFFFFFFFELL);
      v26 = v33;
      v27 = v34;
      v28 = v35;
      v29 = v36;
    }
    -[PKPeerPaymentBubbleView setContentInset:](v32, "setContentInset:", v26, v27, v28, v29);
    if (v8->_bubbleAmountLabel)
      -[PKPeerPaymentHeroBubbleView bringSubviewToFront:](v8, "bringSubviewToFront:");

  }
  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *pluginBalloonView;
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
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  UILabel *bubbleAmountLabel;
  CGFloat v33;
  CGFloat v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35.receiver = self;
  v35.super_class = (Class)PKPeerPaymentHeroBubbleView;
  -[PKPeerPaymentHeroBubbleView layoutSubviews](&v35, sel_layoutSubviews);
  -[PKPeerPaymentHeroBubbleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  pluginBalloonView = self->_pluginBalloonView;
  if (pluginBalloonView)
  {
    -[UIView frame](pluginBalloonView, "frame");
    UIRectCenteredIntegralRect();
    -[UIView setFrame:](self->_pluginBalloonView, "setFrame:");
  }
  if (self->_bubbleAmountLabel)
  {
    -[PKPeerPaymentBubbleView contentInset](self->_peerPaymentBubbleView, "contentInset");
    v13 = v12;
    v15 = v14;
    v17 = v14 + v16;
    v18 = v8 - (v14 + v16);
    v20 = v12 + v19;
    v21 = v10 - (v12 + v19);
    v22 = v4 + v14 + 14.0;
    v23 = v6 + v12 + 12.0;
    v24 = v18 + -28.0;
    v25 = v21 + -24.0;
    -[PKPeerPaymentBubbleView referenceBounds](self->_peerPaymentBubbleView, "referenceBounds");
    v33 = v13 + v27 + 12.0;
    v34 = v15 + v26 + 14.0;
    v30 = v28 - v17 + -28.0;
    v31 = v29 - v20 + -24.0;
    -[UILabel pkui_sizeThatFits:](self->_bubbleAmountLabel, "pkui_sizeThatFits:", v24, v25);
    v36.origin.x = v22;
    v36.origin.y = v23;
    v36.size.width = v24;
    v36.size.height = v25;
    CGRectGetMinX(v36);
    v37.origin.x = v22;
    v37.origin.y = v23;
    v37.size.width = v24;
    v37.size.height = v25;
    CGRectGetWidth(v37);
    v38.origin.x = v34;
    v38.origin.y = v33;
    v38.size.width = v30;
    v38.size.height = v31;
    CGRectGetMinY(v38);
    v39.origin.x = v34;
    v39.origin.y = v33;
    v39.size.width = v30;
    v39.size.height = v31;
    CGRectGetHeight(v39);
    bubbleAmountLabel = self->_bubbleAmountLabel;
    PKRectRoundToPixel();
    -[UILabel setFrame:](bubbleAmountLabel, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 160.0;
  v4 = 115.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_bubbleAmountLabelTextWithAmount:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  __CFString *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99DC8];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v4, "minimalFormattedStringValueInLocale:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E3E7D690;
  }
  return v6;
}

- (id)_bubbleAmountLabelTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1140]);

  objc_msgSend(MEMORY[0x1E0DC1350], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1138]);

  v5 = (void *)objc_msgSend(v2, "copy");
  return v5;
}

- (unint64_t)_bubbleStateForRegistrationState:(unint64_t)a3
{
  if (a3 == 5)
    return 1;
  else
    return 2;
}

- (UILabel)bubbleAmountLabel
{
  return self->_bubbleAmountLabel;
}

- (UIView)pluginBalloonView
{
  return self->_pluginBalloonView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleAmountLabel, 0);
  objc_storeStrong((id *)&self->_peerPaymentBubbleView, 0);
  objc_storeStrong((id *)&self->_pluginBalloonView, 0);
}

@end
