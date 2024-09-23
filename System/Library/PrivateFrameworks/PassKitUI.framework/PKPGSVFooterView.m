@implementation PKPGSVFooterView

- (void)setExpiredSectionCount:(int64_t)a3
{
  int refreshed;
  PKContinuousButton *editButton;
  void *v7;

  if (self->_expiredSectionCount != a3)
  {
    self->_expiredSectionCount = a3;
    refreshed = PKExpiredPassesRefreshEnabled();
    if (a3)
    {
      if (refreshed)
      {
        editButton = self->_editButton;
        PKLocalizedString(CFSTR("TABLE_FOOTER_EXPIRED_PASSES"), CFSTR("%lu"), a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKContinuousButton setTitle:forState:](editButton, "setTitle:forState:", v7, 0);

        -[PKPGSVFooterView setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 64.0;
  result.height = v3;
  return result;
}

- (PKPGSVFooterView)initWithFrame:(CGRect)a3
{
  PKPGSVFooterView *v3;
  PKContinuousButton *v4;
  PKContinuousButton *editButton;
  PKContinuousButton *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  int64x2_t v12;
  int64x2_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPGSVFooterView;
  v3 = -[PKPGSVFooterView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v11 = 0x401C000000000000;
    v12 = vdupq_n_s64(1uLL);
    v13 = vdupq_n_s64(2uLL);
    v4 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v11);
    editButton = v3->_editButton;
    v3->_editButton = v4;

    -[PKContinuousButton setContentEdgeInsets:](v3->_editButton, "setContentEdgeInsets:", 7.0, 14.0, 7.0, 14.0);
    -[PKContinuousButton _setTouchInsets:](v3->_editButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v6 = v3->_editButton;
    PKLocalizedString(CFSTR("TABLE_FOOTER_EDIT_PASSES"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTitle:forState:](v6, "setTitle:forState:", v7, 0);

    -[PKContinuousButton titleLabel](v3->_editButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[PKPGSVFooterView addSubview:](v3, "addSubview:", v3->_editButton);
    -[PKContinuousButton addTarget:action:forControlEvents:](v3->_editButton, "addTarget:action:forControlEvents:", v3, sel__editTapped_, 64);
  }
  return v3;
}

- (void)layoutSubviews
{
  PKContinuousButton *editButton;
  CGRect v4;
  CGRect slice;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PKPGSVFooterView;
  -[PKPGSVFooterView layoutSubviews](&v6, sel_layoutSubviews);
  -[PKPGSVFooterView bounds](self, "bounds");
  memset(&slice, 0, sizeof(slice));
  memset(&v4, 0, sizeof(v4));
  CGRectDivide(v7, &slice, &v4, 64.0, CGRectMinYEdge);
  -[PKContinuousButton sizeToFit](self->_editButton, "sizeToFit");
  editButton = self->_editButton;
  -[PKContinuousButton frame](editButton, "frame");
  PKSizeAlignedInRect();
  -[PKContinuousButton setFrame:](editButton, "setFrame:");
}

- (void)_editTapped:(id)a3
{
  id WeakRetained;
  id v5;

  if (PKUIStoreDemoGatewayWithView(self))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "viewTapped:", self);
      WeakRetained = v5;
    }

  }
}

- (PKPGSVFooterViewDelegate)delegate
{
  return (PKPGSVFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)expiredSectionCount
{
  return self->_expiredSectionCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editButton, 0);
}

@end
