@implementation PKPassPaymentPayStateView

- (PKPassPaymentPayStateView)initWithStyle:(int64_t)a3
{
  PKPassPaymentPayStateView *v4;
  PKPassPaymentPayStateView *v5;
  uint64_t v6;
  PKGlyphView *glyph;
  UILabel *v8;
  UILabel *debugLabel;
  UILabel *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPassPaymentPayStateView;
  v4 = -[PKPassPaymentPayStateView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v4->_layoutState = 0;
    -[PKPassPaymentPayStateView _configureLayoutMetrics](v4, "_configureLayoutMetrics");
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFF0]), "initWithStyle:", 0);
    glyph = v5->_glyph;
    v5->_glyph = (PKGlyphView *)v6;

    -[PKGlyphView setShowQRCode:](v5->_glyph, "setShowQRCode:", a3 == 3);
    -[PKGlyphView updateRasterizationScale:](v5->_glyph, "updateRasterizationScale:", PKUIScreenScale());
    -[PKGlyphView setDelegate:](v5->_glyph, "setDelegate:", v5);
    -[PKPassPaymentPayStateView addSubview:](v5, "addSubview:", v5->_glyph);
    if (PKPayStateDebugUI())
    {
      v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      debugLabel = v5->_debugLabel;
      v5->_debugLabel = v8;

      -[UILabel setNumberOfLines:](v5->_debugLabel, "setNumberOfLines:", 0);
      v10 = v5->_debugLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

      -[PKPassPaymentPayStateView addSubview:](v5, "addSubview:", v5->_debugLabel);
    }
    -[PKPassPaymentPayStateView _applyStatePreservingGlyphState:overridingText:animated:completionHandler:](v5, "_applyStatePreservingGlyphState:overridingText:animated:completionHandler:", 0, 0, 0, 0);
    -[PKPassPaymentPayStateView _resolveLayout](v5, "_resolveLayout");
    -[PKPassPaymentPayStateView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E20]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PKGlyphView setDelegate:](self->_glyph, "setDelegate:", 0);
  -[PKGlyphView setState:animated:completionHandler:](self->_glyph, "setState:animated:completionHandler:", 6, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentPayStateView;
  -[PKPassPaymentPayStateView dealloc](&v3, sel_dealloc);
}

- (void)_resolveLayout
{
  id WeakRetained;
  _QWORD v4[5];

  self->_didLayout = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PKPassPaymentPayStateView__resolveLayout__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  if (self->_didLayout)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "payStateViewDidUpdateLayout:", self);
    }

  }
}

uint64_t __43__PKPassPaymentPayStateView__resolveLayout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double MaxY;
  CGFloat v14;
  UILabel *label;
  PKGlyphView *glyph;
  UILabel *debugLabel;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect remainder;
  CGRect slice;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v26.receiver = self;
  v26.super_class = (Class)PKPassPaymentPayStateView;
  -[PKPassPaymentPayStateView layoutSubviews](&v26, sel_layoutSubviews);
  self->_didLayout = 1;
  -[PKPassPaymentPayStateView bounds](self, "bounds");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v7 = CGRectGetWidth(v27) + -20.0;
  -[PKGlyphView frame](self->_glyph, "frame");
  v28.origin.y = self->_glyphViewPadding;
  v8 = CGRectGetMaxY(v28) + self->_labelTopPadding;
  v23 = v7;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_label, "pkui_sizeThatFits:forceWordWrap:", 1, v7);
  v10 = v9;
  v12 = v11;
  if (self->_label)
  {
    v29.origin.x = 0.0;
    v29.origin.y = v8;
    v29.size.width = v10;
    v29.size.height = v12;
    MaxY = CGRectGetMaxY(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v14 = CGRectGetMaxY(v30) - self->_labelStateBottomInset;
    self->_layoutState = MaxY >= v14;
    if (MaxY >= v14)
    {
      -[PKGlyphView setAlpha:](self->_glyph, "setAlpha:", 0.0);
      memset(&slice, 0, sizeof(slice));
      memset(&remainder, 0, sizeof(remainder));
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      CGRectDivide(v31, &slice, &remainder, self->_labelStateBottomInset, CGRectMaxYEdge);
      label = self->_label;
      v22 = PKUIScreenScale();
      UIRectCenteredIntegralRectScale();
      goto LABEL_6;
    }
  }
  else
  {
    self->_layoutState = 0;
  }
  -[PKGlyphView setAlpha:](self->_glyph, "setAlpha:", 1.0);
  label = self->_label;
  UIRectCenteredXInRect();
LABEL_6:
  -[UILabel setFrame:](label, "setFrame:", *(_QWORD *)&v22);
  glyph = self->_glyph;
  UIRectCenteredXInRect();
  -[PKGlyphView setFrame:](glyph, "setFrame:");
  debugLabel = self->_debugLabel;
  if (debugLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](debugLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v23, 1.79769313e308);
    v19 = v18;
    v21 = v20;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    -[UILabel setFrame:](self->_debugLabel, "setFrame:", 0.0, CGRectGetMaxY(v32) - v21, v19, v21);
  }
}

- (int64_t)_defaultGlyphStateForState:(int64_t)a3
{
  int64_t result;
  BOOL v5;
  int64_t v6;
  int64_t style;
  int64_t v8;
  int IsAvailable;

  result = 8;
  switch(a3)
  {
    case 0:
      v5 = !self->_biometricsUnavailableHint;
      v6 = 6;
      goto LABEL_17;
    case 1:
      IsAvailable = PKPearlIsAvailable();
      result = self->_recognizingHint;
      if (IsAvailable)
      {
        v5 = (_DWORD)result == 0;
        v6 = 5;
LABEL_17:
        if (v5)
          result = 0;
        else
          result = v6;
      }
      break;
    case 2:
      if (self->_userIntentStyle == 1)
        result = 6;
      else
        result = 0;
      break;
    case 4:
      style = self->_style;
      v8 = 8;
      if (style == 4)
        v8 = 9;
      if (style == 3)
        result = 7;
      else
        result = v8;
      break;
    case 5:
      result = 9;
      break;
    case 7:
    case 12:
      result = 7;
      break;
    case 8:
      result = 11;
      break;
    case 9:
    case 10:
      result = 10;
      break;
    case 11:
      result = 6;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_canPreserveGlyphForState:(int64_t)a3
{
  return a3 == 1;
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  -[PKPassPaymentPayStateView setState:animated:withOverrideText:preserveGlyphState:completionHandler:](self, "setState:animated:withOverrideText:preserveGlyphState:completionHandler:", a3, a4, 0, 0, a5);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 withOverrideText:(id)a5 preserveGlyphState:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  void (**v12)(id, _QWORD);
  int64_t v13;
  id v14;

  v8 = a6;
  v9 = a4;
  v14 = a5;
  v12 = (void (**)(id, _QWORD))a7;
  if (v14 || self->_state != a3)
  {
    self->_state = a3;
    -[PKPassPaymentPayStateView _applyStatePreservingGlyphState:overridingText:animated:completionHandler:](self, "_applyStatePreservingGlyphState:overridingText:animated:completionHandler:", v8, v14, v9, v12);
  }
  else
  {
    v13 = -[PKPassPaymentPayStateView _defaultGlyphStateForState:](self, "_defaultGlyphStateForState:", a3);
    if (v8 && -[PKPassPaymentPayStateView _canPreserveGlyphForState:](self, "_canPreserveGlyphForState:", self->_state)
      || v13 == -[PKGlyphView state](self->_glyph, "state"))
    {
      if (v12)
        v12[2](v12, 0);
    }
    else
    {
      if (self->_state == 9)
        -[PKPassPaymentPayStateView _showingFailureState](self, "_showingFailureState");
      -[PKGlyphView setState:animated:completionHandler:](self->_glyph, "setState:animated:completionHandler:", v13, v9, v12);
    }
  }

}

- (void)_applyStatePreservingGlyphState:(BOOL)a3 overridingText:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL4 v8;
  void *v10;
  UILabel *label;
  void *v12;
  char v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  uint64_t v20;
  PKGlyphView *glyph;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PKGlyphView *v26;
  id v27;
  uint64_t v28;
  id v29;

  v6 = a5;
  v8 = a3;
  v29 = a6;
  -[PKPassPaymentPayStateView _textForState:textOverride:](self, "_textForState:textOverride:", self->_state, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  if (label)
  {
    -[UILabel attributedText](label, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = PKEqualObjects();

    if ((v13 & 1) != 0)
      goto LABEL_7;
    v14 = self->_label;
    if (v14)
    {
      -[UILabel removeFromSuperview](v14, "removeFromSuperview");
      v15 = self->_label;
      self->_label = 0;

    }
  }
  if (v10)
  {
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v17 = self->_label;
    self->_label = v16;

    v18 = self->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UILabel setAlpha:](self->_label, "setAlpha:", self->_labelAlpha);
    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v10);
    -[UILabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E20]);
    -[PKPassPaymentPayStateView addSubview:](self, "addSubview:", self->_label);
    -[PKPassPaymentPayStateView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_7:
  if (v8 && -[PKPassPaymentPayStateView _canPreserveGlyphForState:](self, "_canPreserveGlyphForState:", self->_state))
    v20 = -[PKGlyphView state](self->_glyph, "state");
  else
    v20 = -[PKPassPaymentPayStateView _defaultGlyphStateForState:](self, "_defaultGlyphStateForState:", self->_state);
  glyph = self->_glyph;
  if ((unint64_t)(self->_state - 9) >= 2)
  {
    -[PKGlyphView setState:animated:completionHandler:](glyph, "setState:animated:completionHandler:", v20, v6, v29);
LABEL_17:
    v25 = 0;
    goto LABEL_18;
  }
  -[PKGlyphView setColorMode:animated:](glyph, "setColorMode:animated:", 3, v6);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 45.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_state == 9)
    -[PKPassPaymentPayStateView _showingFailureState](self, "_showingFailureState");
  -[PKGlyphView setState:animated:completionHandler:](self->_glyph, "setState:animated:completionHandler:", v20, v6, v29);
  if (!v23)
    goto LABEL_17;
  -[PKGlyphView primaryColor](self->_glyph, "primaryColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_flatImageWithColor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  v26 = self->_glyph;
  v27 = objc_retainAutorelease(v25);
  v28 = objc_msgSend(v27, "CGImage");
  objc_msgSend(v27, "alignmentRectInsets");
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](v26, "setCustomImage:withAlignmentEdgeInsets:", v28);
  -[PKPassPaymentPayStateView _resolveLayout](self, "_resolveLayout");

}

- (BOOL)labelWillChangeForState:(int64_t)a3 withOverrideText:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  -[PKPassPaymentPayStateView _textForState:textOverride:](self, "_textForState:textOverride:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel attributedText](self->_label, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKEqualObjects() ^ 1;

  return v7;
}

- (void)emphasizeStateIfPossible:(int64_t)a3 withOverrideText:(id)a4
{
  id v6;
  UILabel *label;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  UILabel *v12;
  void *v13;
  void *v14;

  v6 = a4;
  if (self->_state == a3)
  {
    label = self->_label;
    if (label)
    {
      v14 = v6;
      -[UILabel layer](label, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_shakeAnimation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v9);

      v11 = objc_msgSend(v14, "length");
      v6 = v14;
      if (v11)
      {
        v12 = self->_label;
        -[PKPassPaymentPayStateView _attributedTextWithTitle:](self, "_attributedTextWithTitle:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setAttributedText:](v12, "setAttributedText:", v13);

        -[PKPassPaymentPayStateView setNeedsLayout](self, "setNeedsLayout");
        -[PKPassPaymentPayStateView _resolveLayout](self, "_resolveLayout");
        v6 = v14;
      }
    }
  }

}

- (void)updateDebugLabel:(id)a3 isErrorState:(BOOL)a4
{
  UILabel *debugLabel;
  UILabel *v7;
  void *v8;

  debugLabel = self->_debugLabel;
  if (debugLabel)
  {
    -[UILabel setText:](debugLabel, "setText:", a3);
    v7 = self->_debugLabel;
    if (a4)
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[PKPassPaymentPayStateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_canEmphasizeState:(int64_t)a3
{
  if (a3 == 3)
    return 1;
  if (a3 == 1)
    return PKPearlIsAvailable() ^ 1;
  return 0;
}

- (void)setLabelStateBottomInset:(double)a3
{
  if (self->_labelStateBottomInset != a3)
  {
    self->_labelStateBottomInset = a3;
    if (a3 > 0.0 || self->_layoutState == 1)
    {
      -[PKPassPaymentPayStateView setNeedsLayout](self, "setNeedsLayout");
      -[PKPassPaymentPayStateView _resolveLayout](self, "_resolveLayout");
    }
  }
}

- (void)setLabelAlpha:(double)a3
{
  self->_labelAlpha = a3;
  -[UILabel setAlpha:](self->_label, "setAlpha:");
}

- (void)setBiometricsUnavailableHint:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_biometricsUnavailableHint ^ a3) & 1) == 0)
  {
    self->_biometricsUnavailableHint = a3;
    if (!self->_state)
      -[PKGlyphView setState:animated:completionHandler:](self->_glyph, "setState:animated:completionHandler:", -[PKPassPaymentPayStateView _defaultGlyphStateForState:](self, "_defaultGlyphStateForState:", 0), a4, 0);
  }
}

- (void)_showingFailureState
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  if (self->_state == 9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v5 = objc_opt_respondsToSelector();
      v4 = v6;
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v6, "payStateViewRevealingFailure:", self);
        v4 = v6;
      }
    }

  }
}

- (id)_textForState:(int64_t)a3 textOverride:(id)a4
{
  id v6;
  void *v7;
  int64_t style;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = v6;
  style = self->_style;
  if (style == 2)
  {
    v9 = 0;
    switch(a3)
    {
      case 1:
        if (PKPearlIsAvailable())
          goto LABEL_23;
        v10 = CFSTR("NFC_PASS_TOUCH_ID");
        goto LABEL_8;
      case 2:
        goto LABEL_9;
      case 4:
      case 5:
      case 6:
        v10 = CFSTR("NFC_PASS_INSTRUCTION");
        goto LABEL_8;
      case 7:
      case 8:
        v10 = CFSTR("NFC_PASS_SUCCESS");
LABEL_8:
        PKLocalizedString(&v10->isa);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 9:
        goto LABEL_10;
      case 10:
        goto LABEL_11;
      default:
        goto LABEL_19;
    }
  }
  v9 = 0;
  switch(a3)
  {
    case 1:
      if (!PKPearlIsAvailable())
      {
        if (self->_persistentEmulationHint)
        {
          v11 = CFSTR("PAYMENT_SERVICE_MODE_TOUCH_ID");
        }
        else if (self->_accessPass)
        {
          v11 = CFSTR("GENERIC_TOUCH_ID");
        }
        else
        {
          v11 = CFSTR("PAYMENT_TOUCH_ID");
        }
        goto LABEL_12;
      }
LABEL_23:
      if (v7)
        goto LABEL_32;
      PKLocalizedPearlString(CFSTR("GENERIC_PEARL"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
LABEL_9:
      -[PKPassPaymentPayStateView _titleForUserIntent](self, "_titleForUserIntent");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
    case 5:
    case 6:
    case 7:
      if (self->_persistentEmulationHint)
      {
        v11 = CFSTR("PAYMENT_INSTRUCTION_SERVICE_MODE");
LABEL_12:
        PKLocalizedPaymentString(&v11->isa);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (style == 3)
      {
        if (a3 != 5)
          goto LABEL_18;
        PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_PASS_INSTRUCTION"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!self->_homeKeyPass)
        {
          if (v6)
          {
LABEL_32:
            v13 = v7;
            goto LABEL_14;
          }
          v11 = CFSTR("GENERIC_INSTRUCTION");
          goto LABEL_12;
        }
        PKLocalizedHomeKeyString(CFSTR("NFC_PASS_INSTRUCTION_LOCK"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_13:
      v13 = v12;
      if (v12)
      {
LABEL_14:
        -[PKPassPaymentPayStateView _attributedTextWithTitle:](self, "_attributedTextWithTitle:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
LABEL_18:
      v9 = 0;
LABEL_19:

      return v9;
    case 8:
      if (v6)
        goto LABEL_32;
      v11 = CFSTR("PAYMENT_SUCCESS");
      goto LABEL_12;
    case 9:
LABEL_10:
      v12 = v6;
      goto LABEL_13;
    case 10:
LABEL_11:
      v11 = CFSTR("PAYMENT_ERROR_NO_TOUCH_ID_OR_PASSCODE");
      goto LABEL_12;
    default:
      goto LABEL_19;
  }
}

- (id)_titleForUserIntent
{
  int64_t userIntentStyle;
  __CFString *v3;
  void *v4;

  userIntentStyle = self->_userIntentStyle;
  if (userIntentStyle == 2)
  {
    v3 = CFSTR("ACCESSIBILITY_PUSH_BUTTON_ASSISTIVE_TOUCH");
  }
  else
  {
    if (userIntentStyle != 3)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("ACCESSIBILITY_PUSH_BUTTON_SWITCH_CONTROL");
  }
  PKLocalizedPearlString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_attributedTextWithTitle:(id)a3
{
  return -[PKPassPaymentPayStateView _attributedTextWithTitle:subtitle:](self, "_attributedTextWithTitle:subtitle:", a3, 0);
}

- (id)_attributedTextWithTitle:(id)a3 subtitle:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)*MEMORY[0x1E0DC48C8];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48C8], 20.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC1138]);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DC1140]);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1100]);

  v13 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v13, "setLineBreakMode:", 4);
  objc_msgSend(v13, "setAlignment:", 1);
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC1178]);

  v15 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (v5)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v7);
    objc_msgSend(v15, "appendAttributedString:", v16);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v8, 16.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v10);

    if (v5)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v7);
      objc_msgSend(v15, "appendAttributedString:", v18);

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v7);
    objc_msgSend(v15, "appendAttributedString:", v19);

  }
  v20 = (void *)objc_msgSend(v15, "copy");

  return v20;
}

- (void)_configureLayoutMetrics
{
  uint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  double *v7;

  switch(self->_style)
  {
    case 0:
    case 4:
      v3 = PKUIGetMinScreenWidthType();
      v4 = 34.0;
      if (!v3)
        v4 = 22.0;
      v5 = 15.0;
      goto LABEL_10;
    case 1:
    case 3:
      v6 = PKUIGetMinScreenType();
      if (v6 >= 0xB)
        return;
      v7 = (double *)&unk_19DF16FB0;
      break;
    case 2:
      v6 = PKUIGetMinScreenType();
      if (v6 >= 0xB)
        return;
      v7 = (double *)&unk_19DF17008;
      break;
    default:
      return;
  }
  v4 = v7[v6];
  v5 = dbl_19DF17060[v6];
LABEL_10:
  self->_glyphViewPadding = v4;
  self->_labelTopPadding = v5;
}

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "payStateView:revealingCheckmark:", self, v4);
      v7 = v9;
    }
  }

}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)layoutState
{
  return self->_layoutState;
}

- (PKGlyphView)glyph
{
  return self->_glyph;
}

- (UILabel)label
{
  return self->_label;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (double)labelStateBottomInset
{
  return self->_labelStateBottomInset;
}

- (double)labelAlpha
{
  return self->_labelAlpha;
}

- (BOOL)biometricsUnavailableHint
{
  return self->_biometricsUnavailableHint;
}

- (BOOL)recognizingHint
{
  return self->_recognizingHint;
}

- (void)setRecognizingHint:(BOOL)a3
{
  self->_recognizingHint = a3;
}

- (int64_t)userIntentStyle
{
  return self->_userIntentStyle;
}

- (void)setUserIntentStyle:(int64_t)a3
{
  self->_userIntentStyle = a3;
}

- (BOOL)persistentEmulationHint
{
  return self->_persistentEmulationHint;
}

- (void)setPersistentEmulationHint:(BOOL)a3
{
  self->_persistentEmulationHint = a3;
}

- (BOOL)accessPass
{
  return self->_accessPass;
}

- (void)setAccessPass:(BOOL)a3
{
  self->_accessPass = a3;
}

- (BOOL)homeKeyPass
{
  return self->_homeKeyPass;
}

- (void)setHomeKeyPass:(BOOL)a3
{
  self->_homeKeyPass = a3;
}

- (PKPassPaymentPayStateViewDelegate)delegate
{
  return (PKPassPaymentPayStateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
