@implementation DBSLargerSizesHelpTextView

- (DBSLargerSizesHelpTextView)initWithSpecifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  DBSLargerSizesHelpTextView *v7;
  uint64_t v8;
  UILabel *helpLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DBSLargerSizesHelpTextView;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[DBSLargerSizesHelpTextView initWithFrame:](&v16, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    helpLabel = v7->_helpLabel;
    v7->_helpLabel = (UILabel *)v8;

    DBS_LocalizedStringForLargeFontSettings(CFSTR("LARGER_SIZES_HELP_TEXT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7->_helpLabel, "setText:", v10);

    PreferencesTableViewFooterFont();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_helpLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "altTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_helpLabel, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v7->_helpLabel, "setBackgroundColor:", v14);

    -[UILabel setTextAlignment:](v7->_helpLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v7->_helpLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v7->_helpLabel, "setNumberOfLines:", 0);
    -[DBSLargerSizesHelpTextView addSubview:](v7, "addSubview:", v7->_helpLabel);
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
  v6.super_class = (Class)DBSLargerSizesHelpTextView;
  -[DBSLargerSizesHelpTextView layoutSubviews](&v6, sel_layoutSubviews);
  -[DBSLargerSizesHelpTextView bounds](self, "bounds");
  v4 = v3;
  -[DBSLargerSizesHelpTextView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSLargerSizesHelpTextView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", v5, v4);

}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  CGRect v6;

  -[DBSLargerSizesHelpTextView layoutForWidth:inTableView:](self, "layoutForWidth:inTableView:", a4, a3);
  -[UILabel frame](self->_helpLabel, "frame");
  return CGRectGetMaxY(v6) + 5.0;
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  id v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;

  v6 = a4;
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v12 = v7;
  v14 = v13;
  if (v7 >= a3)
    v15 = a3;
  else
    v15 = v7;
  objc_msgSend(v6, "_sectionContentInset");
  v17 = v16;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v12;
  v20.size.height = v14;
  v18 = v15 + (v17 - CGRectGetMinX(v20) + 10.0) * -2.0;
  if (v18 > 0.0)
  {
    -[UILabel frame](self->_helpLabel, "frame");
    -[UILabel sizeThatFits:](self->_helpLabel, "sizeThatFits:", v18, 1.79769313e308);
    -[UILabel setFrame:](self->_helpLabel, "setFrame:", 10.0, 0.0, v18, v19);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLabel, 0);
}

@end
