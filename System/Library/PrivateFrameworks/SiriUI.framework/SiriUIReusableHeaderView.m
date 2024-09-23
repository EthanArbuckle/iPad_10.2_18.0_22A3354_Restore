@implementation SiriUIReusableHeaderView

- (SiriUIReusableHeaderView)initWithFrame:(CGRect)a3
{
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUIReusableHeaderView;
  v3 = -[SiriUIReusableHeaderView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[SiriUIContentButton button](SiriUIContentButton, "button");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v3 + 71);
    *((_QWORD *)v3 + 71) = v4;

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 71));
    objc_msgSend(MEMORY[0x24BEA6270], "labelWithHeaderFont");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v3 + 62);
    *((_QWORD *)v3 + 62) = v6;

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 62));
    v8 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "siriui_semiTransparentChevronImageAndAllowNaturalLayout:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithImage:", v9);
    v11 = (void *)*((_QWORD *)v3 + 67);
    *((_QWORD *)v3 + 67) = v10;

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 67));
    *(_OWORD *)(v3 + 504) = SiriUIDefaultSnippetViewInsets;
    *(_OWORD *)(v3 + 520) = *(_OWORD *)&qword_217698188;
  }
  return (SiriUIReusableHeaderView *)v3;
}

- (void)layoutSubviews
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxX;
  void *v22;
  UILabel *headerLabel;
  void *v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)SiriUIReusableHeaderView;
  -[SiriUIReusableHeaderView layoutSubviews](&v25, sel_layoutSubviews);
  -[SiriUIReusableHeaderView bounds](self, "bounds");
  -[UIButton setFrame:](self->_headerAreaButton, "setFrame:");
  -[SiriUIReusableHeaderView bounds](self, "bounds");
  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_contentInsets.right);
  v12 = v11 - (top + self->_contentInsets.bottom);
  -[UIImageView sizeThatFits:](self->_chevronView, "sizeThatFits:", v10, v12);
  UIRectCenteredYInRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (!SiriUISystemLanguageIsRTL())
  {
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    MaxX = CGRectGetMaxX(v26);
    v27.origin.x = v14;
    v27.origin.y = v16;
    v27.size.width = v18;
    v27.size.height = v20;
    v6 = MaxX - CGRectGetWidth(v27);
  }
  -[UIImageView setFrame:](self->_chevronView, "setFrame:", v6, v16, v18, v20);
  -[SiriUIReusableHeaderView bounds](self, "bounds");
  -[SiriUIReusableHeaderView _configureHeaderLabelForBounds:](self, "_configureHeaderLabelForBounds:");
  -[SiriUIReusableHeaderView titleTextColor](self, "titleTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    headerLabel = self->_headerLabel;
    -[SiriUIReusableHeaderView titleTextColor](self, "titleTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](headerLabel, "setTextColor:", v24);

  }
}

- (void)_configureHeaderLabelForBounds:(CGRect)a3
{
  double height;
  double top;
  double bottom;
  double v7;
  UILabel *headerLabel;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  UILabel *v20;
  void *v21;
  id v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  height = a3.size.height;
  v31[1] = *MEMORY[0x24BDAC8D0];
  top = self->_contentInsets.top;
  bottom = self->_contentInsets.bottom;
  v7 = a3.size.width - (self->_contentInsets.left + self->_contentInsets.right);
  headerLabel = self->_headerLabel;
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_headerFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](headerLabel, "setFont:", v9);

  -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 1);
  -[UILabel text](self->_headerLabel, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &stru_24D7DA7D8;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v14 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v14, "setLineSpacing:", 0.0);
  objc_msgSend(v14, "setAlignment:", 1);
  v15 = objc_alloc(MEMORY[0x24BDD1458]);
  v16 = *MEMORY[0x24BDF6628];
  v30 = *MEMORY[0x24BDF6628];
  v31[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v13, v17);

  -[UILabel setAttributedText:](self->_headerLabel, "setAttributedText:", v18);
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  if (v19 <= v7)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scale");
  }
  else
  {
    v20 = self->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "siriui_dynamicHeaderFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 3);
    v22 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v22, "setLineSpacing:", 0.0);
    objc_msgSend(v22, "setMaximumLineHeight:", 36.0);
    objc_msgSend(v22, "setMinimumLineHeight:", 36.0);
    objc_msgSend(v22, "setAlignment:", 1);
    LODWORD(v23) = 1.0;
    objc_msgSend(v22, "setHyphenationFactor:", v23);
    v24 = objc_alloc(MEMORY[0x24BDD1458]);
    v28 = v16;
    v29 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v13, v25);

    -[UILabel setAttributedText:](self->_headerLabel, "setAttributedText:", v26);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scale");

    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v7, height - (top + bottom));
  }

  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_headerLabel, "setFrame:");

}

- (double)desiredHeightForWidth:(double)a3
{
  double v4;
  double v5;
  NSInteger v6;
  double result;

  -[SiriUIReusableHeaderView _configureHeaderLabelForBounds:](self, "_configureHeaderLabelForBounds:", 0.0, 0.0, a3, 1.79769313e308);
  -[UILabel frame](self->_headerLabel, "frame");
  v5 = v4;
  v6 = -[UILabel numberOfLines](self->_headerLabel, "numberOfLines");
  result = v5 + 103.0 + -72.0;
  if (v6 == 1)
    return 72.0;
  return result;
}

- (void)setSnippetViewController:(id)a3
{
  SiriUISnippetViewController **p_snippetViewController;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  UIImageView *chevronView;
  id v10;
  id obj;

  obj = a3;
  p_snippetViewController = &self->_snippetViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);

  v6 = obj;
  if (WeakRetained != obj)
  {
    v7 = objc_storeWeak((id *)&self->_snippetViewController, obj);
    objc_msgSend(obj, "headerPunchOut");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setEnabled:](self->_headerAreaButton, "setEnabled:", v8 != 0);
    chevronView = self->_chevronView;
    if (v8)
    {
      v10 = objc_loadWeakRetained((id *)p_snippetViewController);
      -[UIImageView setHidden:](chevronView, "setHidden:", objc_msgSend(v10, "showHeaderChevron") ^ 1);

    }
    else
    {
      -[UIImageView setHidden:](chevronView, "setHidden:", 1);
    }
    v6 = obj;
  }

}

- (void)setTitleText:(id)a3
{
  void *v5;
  UILabel *headerLabel;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_titleText, a3);
  -[UILabel setText:](self->_headerLabel, "setText:", self->_titleText);
  -[SiriUIReusableHeaderView titleTextColor](self, "titleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    headerLabel = self->_headerLabel;
    -[SiriUIReusableHeaderView titleTextColor](self, "titleTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](headerLabel, "setTextColor:", v7);

  }
  -[SiriUIReusableHeaderView setNeedsLayout](self, "setNeedsLayout");

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
  return 72.0;
}

+ (id)elementKind
{
  return (id)*MEMORY[0x24BDF7630];
}

- (SiriUISnippetViewController)snippetViewController
{
  return (SiriUISnippetViewController *)objc_loadWeakRetained((id *)&self->_snippetViewController);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (UIButton)headerAreaButton
{
  return self->_headerAreaButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAreaButton, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
