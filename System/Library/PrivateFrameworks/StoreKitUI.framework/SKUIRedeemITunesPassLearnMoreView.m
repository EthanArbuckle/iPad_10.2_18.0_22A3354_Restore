@implementation SKUIRedeemITunesPassLearnMoreView

- (UIControl)button
{
  UIButton *button;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;

  button = self->_button;
  if (!button)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_button;
    self->_button = v4;

    v6 = self->_button;
    -[SKUIRedeemITunesPassLearnMoreView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIButton titleLabel](self->_button, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[SKUIRedeemITunesPassLearnMoreView addSubview:](self, "addSubview:", self->_button);
    button = self->_button;
  }
  return (UIControl *)button;
}

- (NSString)buttonTitle
{
  return -[UIButton titleForState:](self->_button, "titleForState:", 0);
}

- (NSString)explanationString
{
  return -[UILabel text](self->_explanationLabel, "text");
}

- (UIImage)headerImage
{
  return -[UIImageView image](self->_headerImageView, "image");
}

- (void)setButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKUIRedeemITunesPassLearnMoreView button](self, "button");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  -[SKUIRedeemITunesPassLearnMoreView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setExplanationString:(id)a3
{
  id v4;
  UILabel *explanationLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  id v14;

  v4 = a3;
  explanationLabel = self->_explanationLabel;
  v14 = v4;
  if (!explanationLabel)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->_explanationLabel;
    self->_explanationLabel = v6;

    v8 = self->_explanationLabel;
    -[SKUIRedeemITunesPassLearnMoreView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = self->_explanationLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setNumberOfLines:](self->_explanationLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_explanationLabel, "setTextAlignment:", 1);
    v12 = self->_explanationLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[SKUIRedeemITunesPassLearnMoreView addSubview:](self, "addSubview:", self->_explanationLabel);
    v4 = v14;
    explanationLabel = self->_explanationLabel;
  }
  -[UILabel setText:](explanationLabel, "setText:", v4);
  -[SKUIRedeemITunesPassLearnMoreView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setHeaderImage:(id)a3
{
  id v4;
  UIImageView *headerImageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  id v10;

  v4 = a3;
  headerImageView = self->_headerImageView;
  v10 = v4;
  if (!headerImageView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v7 = self->_headerImageView;
    self->_headerImageView = v6;

    v8 = self->_headerImageView;
    -[SKUIRedeemITunesPassLearnMoreView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SKUIRedeemITunesPassLearnMoreView addSubview:](self, "addSubview:", self->_headerImageView);
    v4 = v10;
    headerImageView = self->_headerImageView;
  }
  -[UIImageView setImage:](headerImageView, "setImage:", v4);
  -[SKUIRedeemITunesPassLearnMoreView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemITunesPassLearnMoreView layoutSubviews]";
}

- (void)setBackgroundColor:(id)a3
{
  UIButton *button;
  id v5;
  objc_super v6;

  button = self->_button;
  v5 = a3;
  -[UIButton setBackgroundColor:](button, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_explanationLabel, "setBackgroundColor:", v5);
  -[UIImageView setBackgroundColor:](self->_headerImageView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIRedeemITunesPassLearnMoreView;
  -[SKUIRedeemITunesPassLearnMoreView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
