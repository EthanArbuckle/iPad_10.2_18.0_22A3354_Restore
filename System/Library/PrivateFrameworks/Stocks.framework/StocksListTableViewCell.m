@implementation StocksListTableViewCell

+ (double)cellHeightForStackStatus:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 36.0);
  v6 = v5 + 0.0;
  objc_msgSend(v4, "_scaledValueForValue:", 20.0);
  v8 = v6 + v7;
  if (v3)
  {
    objc_msgSend(v4, "_scaledValueForValue:", 36.0);
    v10 = v9;
    objc_msgSend(v4, "_scaledValueForValue:", 28.0);
    v8 = v8 + v10 + v11;
  }

  return v8;
}

- (StocksListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  StocksListTableViewCell *v4;
  void *v5;
  uint64_t v6;
  UILabel *symbolLabel;
  UILabel *v8;
  uint64_t v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  uint64_t v15;
  UILabel *priceLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  StocksListBoxView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  StocksListBoxView *boxView;
  uint64_t v32;
  UILabel *boxLabel;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  UIImageView *changeSignView;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)StocksListTableViewCell;
  v4 = -[StocksListTableViewCell initWithStyle:reuseIdentifier:](&v53, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_opt_new();
    symbolLabel = v4->_symbolLabel;
    v4->_symbolLabel = (UILabel *)v6;

    v8 = v4->_symbolLabel;
    v9 = *MEMORY[0x24BDF7850];
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_symbolLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v11 = v4->_symbolLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = v4->_symbolLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setBaselineAdjustment:](v4->_symbolLabel, "setBaselineAdjustment:", 1);
    -[StocksListTableViewCell addSubview:](v4, "addSubview:", v4->_symbolLabel);
    v15 = objc_opt_new();
    priceLabel = v4->_priceLabel;
    v4->_priceLabel = (UILabel *)v15;

    v17 = v4->_priceLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_priceLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v19 = v4->_priceLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

    v21 = v4->_priceLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setBaselineAdjustment:](v4->_priceLabel, "setBaselineAdjustment:", 1);
    -[UILabel setTextAlignment:](v4->_priceLabel, "setTextAlignment:", 2);
    -[StocksListTableViewCell addSubview:](v4, "addSubview:", v4->_priceLabel);
    v23 = [StocksListBoxView alloc];
    v24 = (void *)MEMORY[0x24BDF6AC8];
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListTableViewCell traitCollection](v4, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ButtonMask"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CeilToPixel(4.5);
    objc_msgSend(v27, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v28, 0.0, CeilToPixel(4.5));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[StocksListBoxView initWithBackgroundMask:](v23, "initWithBackgroundMask:", v29);
    boxView = v4->_boxView;
    v4->_boxView = (StocksListBoxView *)v30;

    -[StocksListTableViewCell addSubview:](v4, "addSubview:", v4->_boxView);
    v32 = objc_opt_new();
    boxLabel = v4->_boxLabel;
    v4->_boxLabel = (UILabel *)v32;

    v34 = v4->_boxLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v34, "setBackgroundColor:", v35);

    v36 = v4->_boxLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v36, "setFont:", v37);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_boxLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v38 = v4->_boxLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v38, "setTextColor:", v39);

    -[UILabel setBaselineAdjustment:](v4->_boxLabel, "setBaselineAdjustment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_boxLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[StocksListTableViewCell addSubview:](v4, "addSubview:", v4->_boxLabel);
    v40 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v41 = (void *)MEMORY[0x24BDF6AC8];
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListTableViewCell traitCollection](v4, "traitCollection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PlusSign"), v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v40, "initWithImage:", v44);
    changeSignView = v4->_changeSignView;
    v4->_changeSignView = (UIImageView *)v45;

    -[StocksListTableViewCell addSubview:](v4, "addSubview:", v4->_changeSignView);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v47);

    -[StocksListTableViewCell setBoxValueFromRowDataType](v4, "setBoxValueFromRowDataType");
    v48 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[StocksListTableViewCell bounds](v4, "bounds");
    v49 = (void *)objc_msgSend(v48, "initWithFrame:");
    -[StocksListTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v49);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.22, 1.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListTableViewCell selectedBackgroundView](v4, "selectedBackgroundView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBackgroundColor:", v50);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[StocksListTableViewCell setStock:](self, "setStock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)StocksListTableViewCell;
  -[StocksListTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setStock:(id)a3
{
  Stock *v5;
  Stock *v6;

  v5 = (Stock *)a3;
  if (self->_stock != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_stock, a3);
    -[StocksListTableViewCell updateValues](self, "updateValues");
    v5 = v6;
  }

}

- (void)setBoxContentsAlpha:(double)a3 includeChangeSign:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[UILabel setAlpha:](self->_boxLabel, "setAlpha:");
  if (v4)
    -[UIImageView setAlpha:](self->_changeSignView, "setAlpha:", a3);
}

- (void)setShouldStackView:(BOOL)a3
{
  _BOOL8 v4;

  self->_shouldStackView = a3;
  v4 = !a3;
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_symbolLabel, "setAdjustsFontSizeToFitWidth:", v4);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_priceLabel, "setAdjustsFontSizeToFitWidth:", v4);
}

- (void)updateValues
{
  Stock *stock;
  UILabel *symbolLabel;
  void *v5;
  void *v6;
  __CFString *v7;
  _BOOL8 v8;
  BOOL v9;
  StocksListBoxView *boxView;
  void *v11;
  void *v12;
  void *v13;
  StocksListBoxView *v14;
  void *v15;

  stock = self->_stock;
  if (stock)
  {
    symbolLabel = self->_symbolLabel;
    -[Stock listName](stock, "listName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](symbolLabel, "setText:", v5);

    -[Stock price](self->_stock, "price");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[Stock formattedPriceDroppingFractionDigitsIfLengthExceeds:](self->_stock, "formattedPriceDroppingFractionDigitsIfLengthExceeds:", 10);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_24D74CF50;
    }
    -[UILabel setText:](self->_priceLabel, "setText:", v7);
    v9 = -[Stock changeIsNegative](self->_stock, "changeIsNegative");
    boxView = self->_boxView;
    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
      objc_msgSend(v11, "lossColor");
    else
      objc_msgSend(v11, "gainColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[StocksListBoxView setImageMaskColor:](boxView, "setImageMaskColor:", v13);

    -[StocksListTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v8 = self->_stock == 0;
  }
  else
  {
    v8 = 1;
  }
  -[UILabel setHidden:](self->_symbolLabel, "setHidden:", v8);
  -[UILabel setHidden:](self->_priceLabel, "setHidden:", self->_stock == 0);
  -[UILabel setHidden:](self->_boxLabel, "setHidden:", self->_stock == 0);
  v14 = self->_boxView;
  -[Stock change](self->_stock, "change");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[StocksListBoxView setHidden:](v14, "setHidden:", v15 == 0);

  -[StocksListTableViewCell setBoxValueFromRowDataType](self, "setBoxValueFromRowDataType");
}

- (id)changeSignNegative:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;

  v3 = a3;
  +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || changeSignNegative__minusSign)
  {
    if (changeSignNegative__plusSign)
      goto LABEL_7;
    v10 = (void *)MEMORY[0x24BDF6AC8];
    -[StocksListTableViewCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PlusSign"), v5, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)changeSignNegative__plusSign;
    changeSignNegative__plusSign = v11;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    -[StocksListTableViewCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("MinusSign"), v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)changeSignNegative__minusSign;
    changeSignNegative__minusSign = v8;
  }

LABEL_7:
  v12 = &changeSignNegative__minusSign;
  if (!v3)
    v12 = &changeSignNegative__plusSign;
  v13 = (id)*v12;

  return v13;
}

- (void)setBoxValueFromRowDataType
{
  UIImageView *changeSignView;
  _BOOL8 v4;
  Stock *stock;
  UILabel *boxLabel;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  UIImageView *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  changeSignView = self->_changeSignView;
  if (self->_stock)
    v4 = self->_rowDataType == 2;
  else
    v4 = 1;
  -[UIImageView setHidden:](changeSignView, "setHidden:", v4);
  stock = self->_stock;
  if (stock)
  {
    if (self->_rowDataType == 2)
    {
      boxLabel = self->_boxLabel;
      -[Stock change](stock, "change");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[Stock marketcap](self->_stock, "marketcap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[Stock localizedMagnitudeAbbreviatedStringWithString:](Stock, "localizedMagnitudeAbbreviatedStringWithString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](boxLabel, "setText:", v9);

      }
      else
      {
        -[UILabel setText:](boxLabel, "setText:", &stru_24D74CF50);
      }
    }
    else
    {
      v10 = -[Stock changeIsNegative](stock, "changeIsNegative");
      -[Stock change](self->_stock, "change");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[Stock formattedChangePercent:](self->_stock, "formattedChangePercent:", self->_rowDataType == 0);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &stru_24D74CF50;
      }

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByTrimmingCharactersInSet:](v12, "stringByTrimmingCharactersInSet:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel setText:](self->_boxLabel, "setText:", v7);
      if (objc_msgSend(v7, "length")
        && (+[Stock BlankValueString](Stock, "BlankValueString"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v7, "isEqualToString:", v14),
            v14,
            !v15))
      {
        v16 = self->_changeSignView;
        -[StocksListTableViewCell changeSignNegative:](self, "changeSignNegative:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](v16, "setImage:", v17);

      }
      else
      {
        -[UIImageView setHidden:](self->_changeSignView, "setHidden:", 1);
      }
    }

    +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "textAttachmentDirectionIsRightToLeft");

    v20 = 2;
    if (v19)
      v20 = 0;
    if (self->_rowDataType == 2)
      v21 = 1;
    else
      v21 = v20;
    -[UILabel setTextAlignment:](self->_boxLabel, "setTextAlignment:", v21);
    -[UILabel sizeToFit](self->_boxLabel, "sizeToFit");
    -[StocksListTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRowDataType:(int64_t)a3
{
  if (self->_rowDataType != a3)
  {
    self->_rowDataType = a3;
    -[StocksListTableViewCell setBoxValueFromRowDataType](self, "setBoxValueFromRowDataType");
  }
}

- (void)setShowsRowSeparator:(BOOL)a3
{
  -[UIView setHidden:](self->_rowSeparatorView, "setHidden:", !a3);
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MaxX;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat rect;
  double v66;
  double v67;
  double v68;
  double v69;
  objc_super v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v70.receiver = self;
  v70.super_class = (Class)StocksListTableViewCell;
  -[StocksListTableViewCell layoutSubviews](&v70, sel_layoutSubviews);
  v3 = -[StocksListTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = RoundToPixel(0.5);
  objc_msgSend(v4, "_scaledValueForValue:", 36.0);
  v69 = v5;
  objc_msgSend(v4, "_scaledValueForValue:", 28.0);
  v57 = v6;
  objc_msgSend(v4, "_scaledValueForValue:", RoundToPixel(93.0));
  v8 = v7;
  objc_msgSend(v4, "_scaledValueForValue:", 31.5);
  v10 = v9;
  -[StocksListTableViewCell bounds](self, "bounds");
  v56 = v12;
  v54 = v13;
  v15 = v14;
  v64 = v11;
  v16 = v11 + -16.0;
  v17 = v8;
  v18 = v11 + -16.0 - v8;
  v66 = 16.0;
  if (v3)
    v19 = 16.0;
  else
    v19 = v11 + -16.0 - v8;
  -[UILabel sizeToFit](self->_symbolLabel, "sizeToFit");
  -[UILabel sizeToFit](self->_priceLabel, "sizeToFit");
  -[UILabel sizeToFit](self->_boxLabel, "sizeToFit");
  -[UILabel frame](self->_symbolLabel, "frame");
  v21 = v20;
  v68 = v22;
  v60 = v16 - v22;
  v62 = v23;
  -[UILabel frame](self->_priceLabel, "frame");
  v26 = v25;
  v67 = v27;
  rect = v28;
  v63 = v15;
  v58 = v10;
  if (self->_shouldStackView)
  {
    v29 = v24;
    v30 = 16.0;
    if (v3)
    {
      v71.origin.x = v56;
      v71.origin.y = v54;
      v71.size.width = v64;
      v71.size.height = v15;
      v31 = CGRectGetWidth(v71) + -16.0;
      v72.origin.x = v29;
      v72.origin.y = v26;
      v72.size.width = v67;
      v72.size.height = rect;
      v66 = v31 - CGRectGetWidth(v72);
      v73.origin.x = v56;
      v73.origin.y = v54;
      v73.size.width = v64;
      v73.size.height = v63;
      v30 = CGRectGetWidth(v73) + -16.0 - v17;
    }
    v55 = v30;
    objc_msgSend(v4, "ascender");
    objc_msgSend(v4, "ascender");
    v53 = v57 + v69 * 2.0 - v32;
  }
  else
  {
    v55 = v19;
    v34 = v17;
    v53 = (v15 - v10) * 0.5;
    if ((v3 & 1) != 0)
    {
      v35 = 16.0;
      v36 = v10;
      v33 = (v15 - v10) * 0.5;
      MaxX = CGRectGetMaxX(*(CGRect *)(&v34 - 2));
      v38 = MaxX + RoundToPixel(8.0);
      v39 = v67;
      v40 = rect;
      v41 = v38;
    }
    else
    {
      v42 = v18 - v67 - RoundToPixel(8.0);
      v38 = 16.0;
      v26 = v21;
      v39 = v68;
      v40 = v62;
      v41 = v42;
    }
    v66 = v41;
    v43 = v26;
    CGRectGetMaxX(*(CGRect *)&v38);
    objc_msgSend(v4, "ascender");
  }
  objc_msgSend(v4, "ascender");
  v44 = 0.0;
  if (self->_rowDataType != 2)
  {
    -[UIImageView bounds](self->_changeSignView, "bounds");
    v44 = v45 + 2.0;
  }
  -[UILabel frame](self->_boxLabel, "frame");
  v74.size.width = v17 + -16.0 - v44;
  CGRectGetHeight(v74);
  -[UIImageView frame](self->_changeSignView, "frame");
  v47 = v46;
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "textAttachmentDirectionIsRightToLeft");

  v50 = v55 + 8.0;
  if (v49)
  {
    v75.origin.x = v55;
    v75.origin.y = v53;
    v75.size.width = v17;
    v75.size.height = v58;
    v51 = CGRectGetMaxX(v75) + -8.0 - v47;
  }
  else
  {
    v51 = v55 + 8.0;
    v50 = v50 + v44;
  }
  v52 = 16.0;
  if (v3)
    v52 = v60;
  v61 = v52;
  -[UIImageView setFrame:](self->_changeSignView, "setFrame:", RoundRectToPixel(v51));
  -[UILabel setFrame:](self->_boxLabel, "setFrame:", RoundRectToPixel(v50));
  -[StocksListBoxView setFrame:](self->_boxView, "setFrame:", RoundRectToPixel(v55));
  -[UILabel setFrame:](self->_symbolLabel, "setFrame:", RoundRectToPixel(v61));
  -[UILabel setFrame:](self->_priceLabel, "setFrame:", RoundRectToPixel(v66));
  -[UIView setFrame:](self->_rowSeparatorView, "setFrame:", 16.0, v63 - v59, v64 + -32.0);

}

- (CGRect)changeButtonRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[StocksListBoxView frame](self->_boxView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (Stock)stock
{
  return self->_stock;
}

- (int64_t)rowDataType
{
  return self->_rowDataType;
}

- (BOOL)shouldStackView
{
  return self->_shouldStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_rowSeparatorView, 0);
  objc_storeStrong((id *)&self->_changeSignView, 0);
  objc_storeStrong((id *)&self->_boxView, 0);
  objc_storeStrong((id *)&self->_boxLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_symbolLabel, 0);
}

@end
