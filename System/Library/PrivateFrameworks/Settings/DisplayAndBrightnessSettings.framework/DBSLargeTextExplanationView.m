@implementation DBSLargeTextExplanationView

- (DBSLargeTextExplanationView)initWithSpecifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  DBSLargeTextExplanationView *v7;
  void *v8;
  char v9;
  UILabel *v10;
  _QWORD *p_bodyExampleLabel;
  UILabel *bodyExampleLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  UITextView *bodyExampleTextView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)DBSLargeTextExplanationView;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[DBSLargeTextExplanationView initWithFrame:](&v25, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sf_isiPhone");

    if ((v9 & 1) != 0)
    {
      v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      p_bodyExampleLabel = &v7->_bodyExampleLabel;
      bodyExampleLabel = v7->_bodyExampleLabel;
      v7->_bodyExampleLabel = v10;

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v7->_bodyExampleLabel, "setBackgroundColor:", v13);

      objc_msgSend(MEMORY[0x24BE75530], "appearance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v7->_bodyExampleLabel, "setTextColor:", v15);

      -[UILabel setNumberOfLines:](v7->_bodyExampleLabel, "setNumberOfLines:", 0);
      -[UILabel setLineBreakMode:](v7->_bodyExampleLabel, "setLineBreakMode:", 0);
      -[UILabel setTextAlignment:](v7->_bodyExampleLabel, "setTextAlignment:", 1);
      DBS_LocalizedStringForLargeFontSettings(CFSTR("DYNAMIC_TYPE_DESCRIPTION"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v7->_bodyExampleLabel, "setText:", v16);

      LODWORD(v17) = 0.5;
      -[UILabel _setHyphenationFactor:](v7->_bodyExampleLabel, "_setHyphenationFactor:", v17);
    }
    else
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA88]), "initWithFrame:", v3, v4, v5, v6);
      p_bodyExampleLabel = &v7->_bodyExampleTextView;
      bodyExampleTextView = v7->_bodyExampleTextView;
      v7->_bodyExampleTextView = (UITextView *)v18;

      DBS_LocalizedStringForLargeFontSettings(CFSTR("DYNAMIC_TYPE_DESCRIPTION"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setText:](v7->_bodyExampleTextView, "setText:", v20);

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](v7->_bodyExampleTextView, "setBackgroundColor:", v21);

      objc_msgSend(MEMORY[0x24BE75530], "appearance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setTextColor:](v7->_bodyExampleTextView, "setTextColor:", v23);

      -[UITextView setTextAlignment:](v7->_bodyExampleTextView, "setTextAlignment:", 1);
      -[UITextView setEditable:](v7->_bodyExampleTextView, "setEditable:", 0);
      -[UITextView setTextContainerInset:](v7->_bodyExampleTextView, "setTextContainerInset:", 0.0, 25.0, 0.0, 25.0);
    }
    -[DBSLargeTextExplanationView addSubview:](v7, "addSubview:", *p_bodyExampleLabel);
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSLargeTextExplanationView;
  -[DBSLargeTextExplanationView layoutSubviews](&v6, sel_layoutSubviews);
  -[DBSLargeTextExplanationView bounds](self, "bounds");
  v4 = v3;
  -[DBSLargeTextExplanationView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSLargeTextExplanationView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", v5, v4);

}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  void *v5;
  int v6;
  int *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGRect v18;

  -[DBSLargeTextExplanationView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", a4, a3);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPhone");
  v7 = &OBJC_IVAR___DBSLargeTextExplanationView__bodyExampleTextView;
  if (v6)
    v7 = &OBJC_IVAR___DBSLargeTextExplanationView__bodyExampleLabel;
  v8 = *(id *)((char *)&self->super.super.super.isa + *v7);

  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v18.origin.x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  return CGRectGetMaxY(v18) + 10.0;
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  int v14;
  double MinX;
  void *v16;
  void *v17;
  char v18;
  id *p_bodyExampleLabel;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(a4, "bounds", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sf_isiPhone");

  if (v14)
  {
    -[DBSLargeTextExplanationView frame](self, "frame");
    MinX = CGRectGetMinX(v26);
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    v10 = v10 + (MinX - CGRectGetMinX(v27) + 25.0) * -2.0;
  }
  if (v10 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "sf_isiPhone");

    if ((v18 & 1) != 0)
    {
      p_bodyExampleLabel = (id *)&self->_bodyExampleLabel;
      -[UILabel setFont:](self->_bodyExampleLabel, "setFont:", v16);
      -[UILabel frame](self->_bodyExampleLabel, "frame");
      -[UILabel sizeThatFits:](self->_bodyExampleLabel, "sizeThatFits:", v10, 1.79769313e308);
      v21 = v20;
      v22 = 10.0;
      v23 = 25.0;
    }
    else
    {
      p_bodyExampleLabel = (id *)&self->_bodyExampleTextView;
      -[UITextView setFont:](self->_bodyExampleTextView, "setFont:", v16);
      -[UITextView frame](self->_bodyExampleTextView, "frame");
      -[DBSLargeTextExplanationView frame](self, "frame");
      v23 = (v10 - v24) * -0.5;
      v28.origin.x = v6;
      v28.origin.y = v8;
      v28.size.width = v10;
      v28.size.height = v12;
      v21 = CGRectGetHeight(v28) + -80.0;
      v22 = 10.0;
    }
    objc_msgSend(*p_bodyExampleLabel, "setFrame:", v23, v22, v10, v21);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyExampleTextView, 0);
  objc_storeStrong((id *)&self->_bodyExampleLabel, 0);
}

@end
