@implementation MailStatusLabelView

- (void)setSecondaryLabelText:(id)a3
{
  UILabel *secondaryLabel;
  void *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  v10 = a3;
  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v6 = -[MailStatusLabelView newLabel:](self, "newLabel:", v5);
    v7 = self->_secondaryLabel;
    self->_secondaryLabel = v6;

    secondaryLabel = self->_secondaryLabel;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](secondaryLabel, "attributedText"));
  v9 = objc_msgSend(v10, "isEqualToAttributedString:", v8);

  if ((v9 & 1) == 0)
  {
    -[UILabel setAttributedText:](self->_secondaryLabel, "setAttributedText:", v10);
    -[MailStatusLabelView _updateBarItemTitle](self, "_updateBarItemTitle");
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  CGFloat v23;
  __n128 v24;
  double v25;
  __n128 v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  __n128 v37;
  double v38;
  double v39;
  __n128 v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat rect;
  double rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  -[MailStatusLabelView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  rect_16 = v7;
  rect_24 = v5;
  v9 = v8;
  -[UILabel sizeToFit](self->_primaryLabel, "sizeToFit");
  -[UILabel sizeToFit](self->_secondaryLabel, "sizeToFit");
  -[UILabel frame](self->_primaryLabel, "frame");
  v43 = v11;
  v45 = v10;
  v13 = v12;
  rect_8 = v14;
  -[UILabel frame](self->_secondaryLabel, "frame");
  rect = v15;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = rect_16;
  v51.size.height = v9;
  Width = CGRectGetWidth(v51);
  v52.origin.y = v43;
  v52.origin.x = v45;
  v46 = v13;
  v52.size.width = v13;
  v23 = v4;
  v52.size.height = rect_8;
  v24.n128_f64[0] = (Width - CGRectGetWidth(v52)) * 0.5;
  v42 = UIRoundToViewScale(self, v24);
  v53.origin.x = v4;
  v53.origin.y = rect_24;
  v53.size.width = rect_16;
  v44 = v9;
  v53.size.height = v9;
  v25 = CGRectGetWidth(v53);
  v54.origin.x = rect;
  v54.origin.y = v17;
  v54.size.width = v19;
  v54.size.height = v21;
  v26.n128_f64[0] = (v25 - CGRectGetWidth(v54)) * 0.5;
  v27 = UIRoundToViewScale(self, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_primaryLabel, "text"));
  v29 = objc_msgSend(v28, "length");

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_secondaryLabel, "text"));
  v31 = objc_msgSend(v30, "length");
  if (v29)
    v32 = rect_8 + 0.0;
  else
    v32 = 0.0;

  v33 = -0.0;
  if (v31)
    v33 = v21;
  v34 = v32 + v33;
  if (v31)
    v35 = -0.5;
  else
    v35 = -1.0;
  v36 = v27 + 0.0;
  v55.origin.x = v23;
  v55.size.width = rect_16;
  v55.origin.y = rect_24;
  v55.size.height = v44;
  v37.n128_f64[0] = v35 + (CGRectGetHeight(v55) - v34) * 0.5;
  v38 = UIRoundToViewScale(self, v37);
  v56.origin.x = v42 + 0.0;
  v56.origin.y = v38;
  v56.size.width = v46;
  v56.size.height = rect_8;
  v39 = v34 + CGRectGetMinY(v56);
  v57.origin.x = v36;
  v57.origin.y = v17;
  v57.size.width = v19;
  v57.size.height = v21;
  v40.n128_f64[0] = v39 - CGRectGetHeight(v57);
  v41 = UIRoundToViewScale(self, v40);
  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v42 + 0.0, v38, v46, rect_8);
  -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v36, v41, v19, v21);
}

- (id)newLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)UILabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView _titleFont](self, "_titleFont"));
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(v4, "setBackgroundColor:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v4, "sizeToFit");
  -[MailStatusLabelView addSubview:](self, "addSubview:", v4);
  return v4;
}

- (void)setPrimaryLabelText:(id)a3
{
  UILabel *primaryLabel;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v9 = a3;
  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    v5 = -[MailStatusLabelView newLabel:](self, "newLabel:", 0);
    v6 = self->_primaryLabel;
    self->_primaryLabel = v5;

    primaryLabel = self->_primaryLabel;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](primaryLabel, "attributedText"));
  v8 = objc_msgSend(v9, "isEqualToAttributedString:", v7);

  if ((v8 & 1) == 0)
  {
    -[UILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v9);
    -[MailStatusLabelView _updateBarItemTitle](self, "_updateBarItemTitle");
  }

}

- (void)_updateBarItemTitle
{
  MailStatusBarViewDelegate *delegate;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  delegate = self->_delegate;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_primaryLabel, "attributedText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_secondaryLabel, "attributedText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  -[MailStatusBarViewDelegate updateBarItemTitle:secondaryTitle:](delegate, "updateBarItemTitle:secondaryTitle:", v5, v7);

  -[MailStatusLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (MailStatusBarViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (MailStatusLabelView)initWithFrame:(CGRect)a3
{
  MailStatusLabelView *v3;
  MailStatusLabelView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailStatusLabelView;
  v3 = -[MailStatusLabelView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MailStatusLabelView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[MailStatusLabelView setOpaque:](v4, "setOpaque:", 0);
  }
  return v4;
}

- (id)_titleFont
{
  return +[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleCaption2, UIContentSizeCategoryExtraLarge);
}

- (NSAttributedString)primaryLabelText
{
  return (NSAttributedString *)-[UILabel text](self->_primaryLabel, "text");
}

- (void)viewDidMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailStatusLabelView;
  -[MailStatusLabelView viewDidMoveToSuperview](&v3, "viewDidMoveToSuperview");
  -[MailStatusLabelView _updateBarItemTitle](self, "_updateBarItemTitle");
}

- (NSAttributedString)secondaryLabelText
{
  return -[UILabel attributedText](self->_secondaryLabel, "attributedText");
}

- (void)updateWithStatusInfo:(id)a3
{
  id v5;

  v5 = a3;
  -[MailStatusLabelView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailStatusLabelView updateWithStatusInfo:]", "MailStatusLabelView.m", 107, "0");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView _titleFont](self, "_titleFont", a3));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView _titleFont](self, "_titleFont"));
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v5);

  -[MailStatusLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
