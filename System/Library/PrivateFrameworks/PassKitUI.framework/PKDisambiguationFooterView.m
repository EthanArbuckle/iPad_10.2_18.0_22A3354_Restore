@implementation PKDisambiguationFooterView

- (PKDisambiguationFooterView)initWithFrame:(CGRect)a3 action:(id)a4 secondaryAction:(id)a5 title:(id)a6 secondaryTitle:(id)a7 desscription:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  PKDisambiguationFooterView *v21;
  uint64_t v22;
  UIButton *actionButton;
  uint64_t v24;
  UIButton *secondaryActionButton;
  uint64_t v26;
  UILabel *descriptionLabel;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKDisambiguationFooterView;
  v21 = -[PKDisambiguationFooterView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  if (v21)
  {
    if (v17)
    {
      objc_msgSend((id)objc_opt_class(), "buttonWithTitle:textStyle:action:", v19, *MEMORY[0x1E0DC4A88], v17);
      v22 = objc_claimAutoreleasedReturnValue();
      actionButton = v21->_actionButton;
      v21->_actionButton = (UIButton *)v22;

      -[PKDisambiguationFooterView addSubview:](v21, "addSubview:", v21->_actionButton);
    }
    if (v18)
    {
      objc_msgSend((id)objc_opt_class(), "buttonWithTitle:textStyle:action:", v20, *MEMORY[0x1E0DC4AB8], v18);
      v24 = objc_claimAutoreleasedReturnValue();
      secondaryActionButton = v21->_secondaryActionButton;
      v21->_secondaryActionButton = (UIButton *)v24;

      -[PKDisambiguationFooterView addSubview:](v21, "addSubview:", v21->_secondaryActionButton);
    }
    if (a8)
    {
      objc_msgSend((id)objc_opt_class(), "descriptionLabel");
      v26 = objc_claimAutoreleasedReturnValue();
      descriptionLabel = v21->_descriptionLabel;
      v21->_descriptionLabel = (UILabel *)v26;

      -[PKDisambiguationFooterView addSubview:](v21, "addSubview:", v21->_descriptionLabel);
    }
  }

  return v21;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
  -[PKDisambiguationFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSecondaryActionTopPadding:(double)a3
{
  self->_secondaryActionTopPadding = a3;
  -[PKDisambiguationFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
  -[PKDisambiguationFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double topPadding;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double secondaryActionTopPadding;
  double bottomPadding;
  double v26;
  double v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKDisambiguationFooterView layoutMargins](self, "layoutMargins");
  v7 = v6;
  -[PKDisambiguationFooterView layoutMargins](self, "layoutMargins");
  v9 = v7 + v8 + 0.0;
  -[PKDisambiguationFooterView layoutMargins](self, "layoutMargins");
  v11 = v10;
  -[PKDisambiguationFooterView layoutMargins](self, "layoutMargins");
  v13 = v12;
  topPadding = self->_topPadding;
  if (topPadding <= 0.0)
    topPadding = 5.0;
  v15 = v9 + topPadding;
  -[UILabel text](self->_descriptionLabel, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", width - (v11 + v13) + -20.0, height);
    v15 = v15 + v17;
  }
  -[UIButton titleForState:](self->_actionButton, "titleForState:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

  }
  else
  {
    -[UIButton imageForState:](self->_actionButton, "imageForState:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_9;
  }
  -[UIButton sizeToFit](self->_actionButton, "sizeToFit");
  -[UIButton frame](self->_actionButton, "frame");
  v15 = v15 + 20.0 + v20;
LABEL_9:
  -[UIButton titleForState:](self->_secondaryActionButton, "titleForState:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

  }
  else
  {
    -[UIButton imageForState:](self->_secondaryActionButton, "imageForState:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_15;
  }
  -[UIButton sizeToFit](self->_secondaryActionButton, "sizeToFit");
  -[UIButton frame](self->_secondaryActionButton, "frame");
  secondaryActionTopPadding = self->_secondaryActionTopPadding;
  if (secondaryActionTopPadding <= 0.0)
    secondaryActionTopPadding = 5.0;
  v15 = v23 + v15 + secondaryActionTopPadding;
LABEL_15:
  bottomPadding = self->_bottomPadding;
  if (bottomPadding <= 0.0)
    bottomPadding = 5.0;
  v26 = v15 + bottomPadding;
  v27 = width;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
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
  double topPadding;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double secondaryActionTopPadding;
  void *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;

  v48.receiver = self;
  v48.super_class = (Class)PKDisambiguationFooterView;
  -[PKDisambiguationFooterView layoutSubviews](&v48, sel_layoutSubviews);
  -[PKDisambiguationFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[PKDisambiguationFooterView layoutMargins](self, "layoutMargins");
  v10 = v4 + v9;
  v13 = v6 - (v11 + v12);
  v15 = v8 - (v9 + v14);
  topPadding = 5.0;
  if (self->_topPadding > 0.0)
    topPadding = self->_topPadding;
  v17 = v10 + topPadding;
  v18 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[UILabel text](self->_descriptionLabel, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v19;
  v44 = v18;
  v46 = v20;
  if (v21)
  {
    -[UILabel frame](self->_descriptionLabel, "frame");
    -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v13 + -20.0, v15);
    UIRectCenteredXInRect();
    v18 = v22;
    v20 = v23;
    v19 = v24;
  }
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v18, v17, v20, v19, *(_QWORD *)&v42, *(_QWORD *)&v44, *(_QWORD *)&v46);
  v49.origin.x = v18;
  v49.origin.y = v17;
  v49.size.width = v20;
  v49.size.height = v19;
  MaxY = CGRectGetMaxY(v49);
  -[UIButton titleForState:](self->_actionButton, "titleForState:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {

LABEL_8:
    MaxY = MaxY + 20.0;
    -[UIButton frame](self->_actionButton, "frame");
    UIRectCenteredXInRect();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    goto LABEL_9;
  }
  -[UIButton imageForState:](self->_actionButton, "imageForState:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    goto LABEL_8;
  v33 = v43;
  v29 = v45;
  v31 = v47;
LABEL_9:
  -[UIButton setFrame:](self->_actionButton, "setFrame:", v29, MaxY, v31, v33);
  v50.origin.x = v29;
  v50.origin.y = MaxY;
  v50.size.width = v31;
  v50.size.height = v33;
  v34 = CGRectGetMaxY(v50);
  secondaryActionTopPadding = self->_secondaryActionTopPadding;
  -[UIButton titleForState:](self->_secondaryActionButton, "titleForState:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {

  }
  else
  {
    -[UIButton imageForState:](self->_secondaryActionButton, "imageForState:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v45;
    v39 = v47;
    v40 = v43;
    if (!v38)
      goto LABEL_13;
  }
  -[UIButton frame](self->_secondaryActionButton, "frame", v37);
  UIRectCenteredXInRect();
LABEL_13:
  v41 = 5.0;
  if (secondaryActionTopPadding > 0.0)
    v41 = secondaryActionTopPadding;
  -[UIButton setFrame:](self->_secondaryActionButton, "setFrame:", v37, v34 + v41, v39, v40);
}

- (double)_recommendedSecondaryActionTopPaddingForTableView:(id)a3
{
  id v4;
  double Height;
  double v6;
  double v7;
  double MinY;
  double MaxY;
  double v10;
  double bottomPadding;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  Height = CGRectGetHeight(v17);
  objc_msgSend(v4, "contentInset");
  v7 = v6;
  objc_msgSend(v4, "_rectForTableFooterView");
  MinY = CGRectGetMinY(v18);
  objc_msgSend(v4, "setNeedsLayout");
  objc_msgSend(v4, "layoutIfNeeded");
  -[PKDisambiguationFooterView setNeedsLayout](self, "setNeedsLayout");
  -[PKDisambiguationFooterView layoutIfNeeded](self, "layoutIfNeeded");
  -[UIButton frame](self->_actionButton, "frame");
  MaxY = CGRectGetMaxY(v19);
  -[UIButton bounds](self->_secondaryActionButton, "bounds");
  v10 = CGRectGetHeight(v20);
  if (self->_bottomPadding <= 0.0)
    bottomPadding = 5.0;
  else
    bottomPadding = self->_bottomPadding;
  -[PKDisambiguationFooterView layoutMargins](self, "layoutMargins");
  v13 = bottomPadding + v12;
  objc_msgSend(v4, "contentInset");
  v15 = v14;

  return fmax(Height - v7 - MinY - MaxY - v10 - v13 - v15, 50.0);
}

- (void)sizeToFitForTableView:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[PKDisambiguationFooterView sizeToFit](self, "sizeToFit");
  -[PKDisambiguationFooterView _recommendedSecondaryActionTopPaddingForTableView:](self, "_recommendedSecondaryActionTopPaddingForTableView:", v4);
  v6 = v5;

  -[PKDisambiguationFooterView setSecondaryActionTopPadding:](self, "setSecondaryActionTopPadding:", v6);
  -[PKDisambiguationFooterView sizeToFit](self, "sizeToFit");
}

+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 action:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0DC3520];
  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "preferredFontForTextStyle:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pkui_plainConfigurationWithTitle:font:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)descriptionLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3990]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setTextAlignment:", 1);
  return v3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)secondaryActionTopPadding
{
  return self->_secondaryActionTopPadding;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
