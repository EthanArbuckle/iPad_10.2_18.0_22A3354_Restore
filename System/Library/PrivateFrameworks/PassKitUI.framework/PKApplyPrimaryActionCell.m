@implementation PKApplyPrimaryActionCell

- (PKApplyPrimaryActionCell)initWithFrame:(CGRect)a3
{
  PKApplyPrimaryActionCell *v3;
  PKApplyPrimaryActionCell *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  PKContinuousButton *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  int64x2_t v17;
  _QWORD v18[4];
  id *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKApplyPrimaryActionCell;
  v3 = -[PKApplyPrimaryActionCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKApplyPrimaryActionCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v6 = (void *)MEMORY[0x1E0DC3428];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__PKApplyPrimaryActionCell_initWithFrame___block_invoke;
    v18[3] = &unk_1E3E659D0;
    objc_copyWeak(&v20, &location);
    v7 = v4;
    v19 = v7;
    objc_msgSend(v6, "actionWithHandler:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0x402C000000000000;
    v16 = xmmword_19DEE0240;
    v17 = vdupq_n_s64(2uLL);
    v9 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v15);
    v10 = v7[81];
    v7[81] = v9;

    objc_msgSend(v7[81], "setExclusiveTouch:", 1);
    objc_msgSend(v7[81], "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    objc_msgSend(v7[81], "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 1);
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v11, "setTextAlignment:", 1);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AD0], (NSString *)*MEMORY[0x1E0DC48D0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v7[81], "addAction:forControlEvents:", v8, 64);
    objc_msgSend(v5, "addSubview:", v7[81]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v13);

    objc_msgSend(v5, "setDirectionalLayoutMargins:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __42__PKApplyPrimaryActionCell_initWithFrame___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 657) && WeakRetained[84])
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setLoading:", 1);
    (*(void (**)(void))(v3[84] + 16))();
    WeakRetained = v3;
  }

}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *title;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
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
    objc_storeStrong((id *)&self->_title, a3);
    -[PKContinuousButton setTitle:forState:](self->_button, "setTitle:forState:", v9, 0);
    -[PKApplyPrimaryActionCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setLoading:(BOOL)a3
{
  if (((!self->_loading ^ a3) & 1) == 0)
  {
    self->_loading = a3;
    -[PKContinuousButton setShowSpinner:](self->_button, "setShowSpinner:");
    -[PKContinuousButton setEnabled:](self->_button, "setEnabled:", !self->_loading);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKApplyPrimaryActionCell;
  -[PKApplyPrimaryActionCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKApplyPrimaryActionCell bounds](self, "bounds");
  -[PKApplyPrimaryActionCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKApplyPrimaryActionCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width;
  double v5;
  double v6;
  PKContinuousButton *button;
  double v8;
  double v9;
  CGSize result;

  width = a3.size.width;
  -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", a3.size.width, a3.size.height);
  if (v5 >= 50.0)
    v6 = v5;
  else
    v6 = 50.0;
  if (!self->_isTemplateLayout)
  {
    button = self->_button;
    PKSizeAlignedInRect();
    -[PKContinuousButton setFrame:](button, "setFrame:");
  }
  v8 = width;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKApplyPrimaryActionCell;
  -[PKApplyPrimaryActionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKApplyPrimaryActionCell setLoading:](self, "setLoading:", 0);
  -[PKApplyPrimaryActionCell setTitle:](self, "setTitle:", 0);
  -[PKApplyPrimaryActionCell setAction:](self, "setAction:", 0);
}

- (NSString)title
{
  return self->_title;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (BOOL)loading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
