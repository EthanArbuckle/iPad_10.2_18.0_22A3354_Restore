@implementation PKBillPaymentSuggestedAmountView

- (PKBillPaymentSuggestedAmountView)initWithSuggestedAmount:(id)a3
{
  id v5;
  PKBillPaymentSuggestedAmountView *v6;
  PKBillPaymentSuggestedAmountView *v7;
  void *v8;
  CABackdropLayer *v9;
  CABackdropLayer *background;
  CABackdropLayer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  CABackdropLayer *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKBillPaymentSuggestedAmountView;
  v6 = -[PKBillPaymentSuggestedAmountView init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestedAmount, a3);
    -[PKBillPaymentSuggestedAmountView layer](v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);
    v9 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E0CD2708]);
    background = v7->_background;
    v7->_background = v9;

    -[CABackdropLayer setAllowsInPlaceFiltering:](v7->_background, "setAllowsInPlaceFiltering:", 1);
    v11 = v7->_background;
    PKLayerNullActions();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setActions:](v11, "setActions:", v12);

    -[CABackdropLayer setAllowsGroupOpacity:](v7->_background, "setAllowsGroupOpacity:", 0);
    -[CABackdropLayer setMasksToBounds:](v7->_background, "setMasksToBounds:", 1);
    objc_msgSend(v8, "addSublayer:", v7->_background);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.05);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F20]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_retainAutorelease(v13);
    objc_msgSend(v15, "setValue:forKey:", objc_msgSend(v16, "CGColor"), CFSTR("inputColor0"));
    v17 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "setValue:forKey:", objc_msgSend(v17, "CGColor"), CFSTR("inputColor1"));
    objc_msgSend(v15, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputReversed"));
    v18 = v7->_background;
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setFilters:](v18, "setFilters:", v19);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CABackdropLayer *background;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKBillPaymentSuggestedAmountView;
  -[PKBillPaymentSuggestedAmountView layoutSubviews](&v9, sel_layoutSubviews);
  -[PKBillPaymentSuggestedAmountView bounds](self, "bounds");
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  v6 = v5 * 0.5;
  background = self->_background;
  PKSizeAlignedInRect();
  -[CABackdropLayer setFrame:](background, "setFrame:");
  -[CABackdropLayer cornerRadius](self->_background, "cornerRadius");
  if (v8 != v6)
    -[CABackdropLayer setCornerRadius:](self->_background, "setCornerRadius:", v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 16.0;
  v4 = 16.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (PKBillPaymentSuggestedAmount)suggestedAmount
{
  return self->_suggestedAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAmount, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end
