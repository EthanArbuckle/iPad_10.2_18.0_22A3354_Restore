@implementation UIPickerTableViewTitledCell

- (UIPickerTableViewTitledCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 textColor:(id)a5 forceTextAlignmentCentered:(BOOL)a6
{
  id v10;
  UIPickerTableViewTitledCell *v11;
  UILabel *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  UILabel *titleLabel;
  void *v28;
  void *v29;
  objc_super v31;

  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)UIPickerTableViewTitledCell;
  v11 = -[UIPickerTableViewCell initWithStyle:reuseIdentifier:](&v31, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v11)
  {
    v12 = [UILabel alloc];
    -[UIView bounds](v11, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UIPickerTableViewCell style](v11, "style");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "labelSideOffset");
    v23 = v22;
    -[UIPickerTableViewCell style](v11, "style");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "labelSideOffset");
    v26 = -[UILabel initWithFrame:](v12, "initWithFrame:", v14 + v25, v16 + 0.0, v18 - (v23 + v25), v20);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v26;

    -[UILabel setTextAlignment:](v11->_titleLabel, "setTextAlignment:", 1);
    -[UIView setAutoresizingMask:](v11->_titleLabel, "setAutoresizingMask:", 18);
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 20.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_titleLabel, "setFont:", v28);

    +[UIColor clearColor](UIColor, "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11->_titleLabel, "setBackgroundColor:", v29);

    -[UIView addSubview:](v11, "addSubview:", v11->_titleLabel);
    -[UITableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 0);
    objc_storeStrong((id *)&v11->_textColor, a5);
    -[UILabel setTextColor:](v11->_titleLabel, "setTextColor:", v11->_textColor);
  }

  return v11;
}

- (void)_setIsCenterCell:(BOOL)a3 shouldModifyAlphaOfView:(BOOL)a4
{
  _BOOL4 v4;
  UILabel *titleLabel;
  double v7;
  UILabel *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (a4)
  {
    titleLabel = self->_titleLabel;
    v7 = 0.447;
    if (a3)
      v7 = 1.0;
    -[UIView setAlpha:](titleLabel, "setAlpha:", v7);
  }
  v8 = self->_titleLabel;
  -[UIPickerTableViewCell style](self, "style");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v11, "centerCellFontWithTraitCollection:", v9);
  else
    objc_msgSend(v11, "nonCenterCellFontWithTraitCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v10);

}

- (BOOL)_canBeReusedInPickerView
{
  return 1;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  self->_isAttributed = 0;
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSAttributedString)attributedTitle
{
  return -[UILabel attributedText](self->_titleLabel, "attributedText");
}

- (void)setAttributedTitle:(id)a3
{
  self->_isAttributed = 1;
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPickerTableViewTitledCell;
  -[UITableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  if (!self->_isAttributed)
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", self->_textColor);
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (BOOL)_isAttributed
{
  return self->_isAttributed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
