@implementation PKSelectActionHeader

- (PKSelectActionHeader)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  PKSelectActionHeader *v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *subtitleLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKSelectActionHeader;
  v8 = -[PKSelectActionHeader init](&v25, sel_init);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    v11 = v8->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setText:](v8->_titleLabel, "setText:", v6);
    v13 = PKUIGetMinScreenWidthType();
    v14 = 28.0;
    if (!v13)
      v14 = 24.0;
    v15 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48C0], v14);
    v16 = v8->_titleLabel;
    PKRoundedSystemFontOfSizeAndWeight(v15, *MEMORY[0x1E0DC1420]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    -[UILabel sizeToFit](v8->_titleLabel, "sizeToFit");
    -[UILabel setNeedsLayout](v8->_titleLabel, "setNeedsLayout");
    -[PKSelectActionHeader addSubview:](v8, "addSubview:", v8->_titleLabel);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v8->_subtitleLabel;
    v8->_subtitleLabel = v18;

    -[UILabel setText:](v8->_subtitleLabel, "setText:", v7);
    v20 = v8->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    v22 = v8->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v23);

    -[UILabel sizeToFit](v8->_subtitleLabel, "sizeToFit");
    -[UILabel setNeedsLayout](v8->_subtitleLabel, "setNeedsLayout");
    -[PKSelectActionHeader addSubview:](v8, "addSubview:", v8->_subtitleLabel);
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSelectActionHeader;
  -[PKSelectActionHeader layoutSubviews](&v9, sel_layoutSubviews);
  -[PKSelectActionHeader bounds](self, "bounds");
  v4 = v3;
  -[UILabel frame](self->_titleLabel, "frame");
  v6 = v5;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", (v4 - v7) * 0.5, 20.0);
  -[UILabel frame](self->_subtitleLabel, "frame");
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", (v4 - v8) * 0.5, v6 + 40.0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
