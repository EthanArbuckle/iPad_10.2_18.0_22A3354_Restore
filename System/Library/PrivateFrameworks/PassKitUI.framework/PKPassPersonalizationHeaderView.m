@implementation PKPassPersonalizationHeaderView

- (PKPassPersonalizationHeaderView)initWithLogoImage:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  PKPassPersonalizationHeaderView *v8;
  id v9;
  void *v10;
  PKTableHeaderView *v11;
  PKTableHeaderView *tableHeaderView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPassPersonalizationHeaderView;
  v8 = -[PKTableHeaderView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    v11 = objc_alloc_init(PKTableHeaderView);
    tableHeaderView = v8->_tableHeaderView;
    v8->_tableHeaderView = v11;

    objc_msgSend(v9, "setLineSpacing:", -2.0);
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v9, 0, objc_msgSend(v10, "length"));
    -[PKTableHeaderView setStyle:](v8->_tableHeaderView, "setStyle:", 2);
    if (v6)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
      objc_msgSend(v13, "setContentMode:", 1);
      objc_msgSend(v13, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 150.0, 40.0);
      -[PKTableHeaderView setImageView:](v8->_tableHeaderView, "setImageView:", v13);

    }
    -[PKTableHeaderView titleLabel](v8->_tableHeaderView, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 1);

    -[PKTableHeaderView titleLabel](v8->_tableHeaderView, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);

    -[PKTableHeaderView titleLabel](v8->_tableHeaderView, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMinimumScaleFactor:", 0.5);

    -[PKTableHeaderView subtitleLabel](v8->_tableHeaderView, "subtitleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 3);

    -[PKTableHeaderView subtitleLabel](v8->_tableHeaderView, "subtitleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedText:", v10);

    -[PKTableHeaderView subtitleLabel](v8->_tableHeaderView, "subtitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

    -[PKTableHeaderView subtitleLabel](v8->_tableHeaderView, "subtitleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMinimumScaleFactor:", 0.2);

    -[PKPassPersonalizationHeaderView addSubview:](v8, "addSubview:", v8->_tableHeaderView);
    -[PKPassPersonalizationHeaderView _configureForCurrentState](v8, "_configureForCurrentState");

  }
  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPassPersonalizationHeaderView;
  -[PKPassPersonalizationHeaderView dealloc](&v2, sel_dealloc);
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PKPassPersonalizationHeaderView _configureForCurrentState](self, "_configureForCurrentState");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKTableHeaderView sizeThatFits:](self->_tableHeaderView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  PKTableHeaderView *tableHeaderView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPersonalizationHeaderView;
  -[PKTableHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  tableHeaderView = self->_tableHeaderView;
  -[PKPassPersonalizationHeaderView bounds](self, "bounds");
  -[PKTableHeaderView setFrame:](tableHeaderView, "setFrame:");
}

- (void)_configureForCurrentState
{
  int v3;
  unint64_t state;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = 0;
  state = self->_state;
  switch(state)
  {
    case 0uLL:
      v6 = CFSTR("PERSONALZIATION_HEADER_READY_TITLE");
      v5 = 0;
      goto LABEL_7;
    case 2uLL:
      v3 = 0;
      v5 = 1;
      v6 = CFSTR("PERSONALZIATION_HEADER_SUCCESS_TITLE");
      goto LABEL_7;
    case 1uLL:
      v5 = 0;
      v3 = 1;
      v6 = CFSTR("PERSONALZIATION_HEADER_PERSONALIZING_TITLE");
LABEL_7:
      PKLocalizedString(&v6->isa);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  v13 = 0;
  v5 = 0;
LABEL_9:
  -[PKTableHeaderView titleLabel](self->_tableHeaderView, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v13);

  -[PKTableHeaderView activityIndicator](self->_tableHeaderView, "activityIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3 ^ 1u;
  objc_msgSend(v8, "setHidden:", v9);

  -[PKTableHeaderView checkmarkLayer](self->_tableHeaderView, "checkmarkLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRevealed:animated:", v5, 0);

  -[PKTableHeaderView activityIndicator](self->_tableHeaderView, "activityIndicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
    objc_msgSend(v11, "stopAnimating");
  else
    objc_msgSend(v11, "startAnimating");

  -[PKTableHeaderView setNeedsLayout](self->_tableHeaderView, "setNeedsLayout");
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
}

@end
