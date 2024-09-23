@implementation SiriUIReusableSubtitledHeaderView

- (SiriUIReusableSubtitledHeaderView)initWithFrame:(CGRect)a3
{
  SiriUIReusableSubtitledHeaderView *v3;
  uint64_t v4;
  UILabel *subtitleLabel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUIReusableSubtitledHeaderView;
  v3 = -[SiriUIReusableHeaderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEA6270], "labelWithSubtitleFont");
    v4 = objc_claimAutoreleasedReturnValue();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v4;

    -[SiriUIReusableSubtitledHeaderView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIReusableSubtitledHeaderView;
  -[SiriUIReusableHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[SiriUIReusableSubtitledHeaderView bounds](self, "bounds");
  -[SiriUIReusableSubtitledHeaderView _configureSubTitleLabelForBounds:](self, "_configureSubTitleLabelForBounds:");
}

- (void)setSubtitleText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1458];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[SiriUIReusableSubtitledHeaderView setAttributedSubtitleText:](self, "setAttributedSubtitleText:", v6);

}

- (NSString)subtitleText
{
  void *v2;
  void *v3;

  -[SiriUIReusableSubtitledHeaderView attributedSubtitleText](self, "attributedSubtitleText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4;
  NSAttributedString *v5;
  NSAttributedString *attributedSubtitleText;

  v4 = a3;
  v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
  attributedSubtitleText = self->_attributedSubtitleText;
  self->_attributedSubtitleText = v5;

  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v4);
  -[SiriUIReusableSubtitledHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureSubTitleLabelForBounds:(CGRect)a3
{
  double height;
  double x;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  double y;
  id v14;
  CGRect v15;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v6 = a3.size.width - (8.0 + 8.0);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
  -[UILabel attributedText](self->_subtitleLabel, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v7, "mutableCopy");

  if (v14)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v8, "setLineSpacing:", 0.0);
    objc_msgSend(v8, "setMinimumLineHeight:", 20.0);
    objc_msgSend(v8, "setMaximumLineHeight:", 20.0);
    objc_msgSend(v8, "setAlignment:", 1);
    v9 = *MEMORY[0x24BDF6628];
    objc_msgSend(v14, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v9, v8, 0, objc_msgSend(v10, "length"));

    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v14);
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  if (v11 > v6)
  {
    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 3);
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v6, height - (10.0 + 10.0));
  }
  v15.origin.y = y + 10.0;
  v15.origin.x = x + 8.0;
  v15.size.width = v6;
  v15.size.height = height - (10.0 + 10.0);
  CGRectGetMaxY(v15);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");

  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");

}

- (double)desiredHeightForWidth:(double)a3
{
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
  void *v15;
  double v16;
  BOOL v17;
  double v18;
  objc_super v20;
  objc_super v21;

  -[SiriUIReusableSubtitledHeaderView _configureSubTitleLabelForBounds:](self, "_configureSubTitleLabelForBounds:", 0.0, 0.0, a3, 1.79769313e308);
  -[UILabel frame](self->_subtitleLabel, "frame");
  v6 = v5;
  if (-[UILabel numberOfLines](self->_subtitleLabel, "numberOfLines") == 1)
  {
    v21.receiver = self;
    v21.super_class = (Class)SiriUIReusableSubtitledHeaderView;
    -[SiriUIReusableHeaderView desiredHeightForWidth:](&v21, sel_desiredHeightForWidth_, a3);
    v8 = v7;
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
    v10 = v8 + v9;
    +[SiriUIReusableHeaderView defaultHeight](SiriUIReusableHeaderView, "defaultHeight");
    return v10 - v11;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SiriUIReusableSubtitledHeaderView;
    -[SiriUIReusableHeaderView desiredHeightForWidth:](&v20, sel_desiredHeightForWidth_, a3);
    v14 = v6 + v13;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v17 = v16 < 2.0;
    v18 = 1.5;
    if (v17)
      v18 = 2.0;
    v12 = v14 + v18;

  }
  return v12;
}

+ (double)defaultHeight
{
  return 97.0;
}

- (NSAttributedString)attributedSubtitleText
{
  return self->_attributedSubtitleText;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_attributedSubtitleText, 0);
}

@end
