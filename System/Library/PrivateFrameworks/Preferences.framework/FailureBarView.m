@implementation FailureBarView

- (FailureBarView)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  FailureBarView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UILabel *titleLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  objc_super v25;

  y = a3.origin.y;
  x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)FailureBarView;
  v5 = -[FailureBarView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "circleImageWithDiameter:color:", v7, 27.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E0CEA638];
      PSPreferencesFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("PasscodeFailure"), v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "stretchableImageWithLeftCapWidth:topCapHeight:", 13, 13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FailureBarView setImage:](v5, "setImage:", v11);
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;
    -[FailureBarView setFrame:](v5, "setFrame:", x, y, v12, v14);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", x, y, v13, v15);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v16;

    v18 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    v22 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[FailureBarView addSubview:](v5, "addSubview:", v5->_titleLabel);

  }
  return v5;
}

- (void)setFailureCount:(int64_t)a3
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("FAILURES");
  if (a3 == 1)
    v5 = CFSTR("FAILURE");
  v6 = v5;
  objc_msgSend(v14, "localizedStringForKey:value:table:", v6, &stru_1E4A69238, CFSTR("PIN Entry"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    PS_LocalizedStringForPINEntry(v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  titleLabel = self->_titleLabel;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](titleLabel, "setText:", v13);

  -[FailureBarView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FailureBarView;
  -[FailureBarView layoutSubviews](&v12, sel_layoutSubviews);
  -[FailureBarView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "leftCapWidth") + 5.0;

  -[FailureBarView bounds](self, "bounds");
  v6 = v5 + v4 * -2.0;
  v8 = v7 + -2.0;
  v9 = (v5 - v6) * 0.5;
  v10 = (v7 - (v7 + -2.0)) * 0.5;
  -[FailureBarView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v9, v10, v6, v8);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
  v6 = v5 + 26.0;
  if (v6 >= width)
    v6 = width;
  v7 = v4 + 4.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
