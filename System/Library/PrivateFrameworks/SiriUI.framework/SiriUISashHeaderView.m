@implementation SiriUISashHeaderView

- (SiriUISashHeaderView)initWithFrame:(CGRect)a3
{
  SiriUISashHeaderView *v3;
  UILabel *v4;
  UILabel *headerLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SiriUISashHeaderView;
  v3 = -[SiriUISashHeaderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v4;

    v6 = v3->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = v3->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_textColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setTextAlignment:](v3->_headerLabel, "setTextAlignment:", 0);
    -[UILabel setNumberOfLines:](v3->_headerLabel, "setNumberOfLines:", 1);
    -[SiriUISashHeaderView addSubview:](v3, "addSubview:", v3->_headerLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *headerLabel;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUISashHeaderView;
  -[SiriUISashHeaderView layoutSubviews](&v10, sel_layoutSubviews);
  -[SiriUISashHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 + 16.0;
  v8 = v7 - (16.0 + 16.0);
  -[UILabel _setLastLineBaselineFrameOriginY:](self->_headerLabel, "_setLastLineBaselineFrameOriginY:", 23.0);
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v8, v4);
  headerLabel = self->_headerLabel;
  -[UILabel frame](headerLabel, "frame");
  -[UILabel setFrame:](headerLabel, "setFrame:", v6);
}

- (double)desiredHeightForWidth:(double)a3
{
  return 36.0;
}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_headerLabel, "setText:", a3);
  -[SiriUISashHeaderView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)reuseIdentifier
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("ReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)defaultHeight
{
  return 36.0;
}

+ (id)elementKind
{
  return (id)*MEMORY[0x24BDF7630];
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
