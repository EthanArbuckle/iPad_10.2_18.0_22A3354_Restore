@implementation UIKeyboardEmojiSplitCategoryCell

- (id)symbolFont
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rivenSizeFactor:", 20.0);
  objc_msgSend(off_1E167A828, "fontWithName:size:traits:", CFSTR(".Keycaps-Keys"), 4096);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleFont
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rivenSizeFactor:", 14.0);
  objc_msgSend(off_1E167A828, "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIKeyboardEmojiSplitCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIKeyboardEmojiSplitCategoryCell *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  UIImageView *v22;
  UIImageView *symbol;
  void *v24;
  void *v25;
  CGFloat v26;
  UILabel *v27;
  UILabel *title;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  UIView *v49;
  UIView *selectedCircle;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  UIKeyboardEmojiSplitCategoryCell *v57;
  objc_super v59;
  CGRect v60;

  v59.receiver = self;
  v59.super_class = (Class)UIKeyboardEmojiSplitCategoryCell;
  v4 = -[UITableViewCell initWithStyle:reuseIdentifier:](&v59, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[UIColor blueColor](UIColor, "blueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferencesActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rivenSizeFactor:", 200.0);
    v9 = v8;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferencesActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rivenSizeFactor:", 34.0);
    v13 = v12;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferencesActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rivenSizeFactor:", 32.0);
    v17 = 22.0 - (v16 + -32.0);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferencesActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rivenSizeFactor:", 32.0);
    v21 = v20;

    v22 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v17, 1.0, v21, v13);
    symbol = v4->_symbol;
    v4->_symbol = v22;

    +[UIColor clearColor](UIColor, "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_symbol, "setBackgroundColor:", v24);

    -[UIImageView setContentMode:](v4->_symbol, "setContentMode:", 4);
    -[UITableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v4->_symbol);

    v60.origin.y = 1.0;
    v60.origin.x = v17;
    v60.size.width = v21;
    v60.size.height = v13;
    v26 = CGRectGetMaxX(v60) + 6.0;
    v27 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v26, 0.0, v9 - v26, v13);
    title = v4->_title;
    v4->_title = v27;

    -[UILabel setText:](v4->_title, "setText:", &stru_1E16EDF20);
    -[UIKeyboardEmojiSplitCategoryCell titleFont](v4, "titleFont");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_title, "setFont:", v29);

    +[UIColor clearColor](UIColor, "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_title, "setBackgroundColor:", v30);

    +[UIColor blackColor](UIColor, "blackColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_title, "setTextColor:", v31);

    -[UILabel setTextAlignment:](v4->_title, "setTextAlignment:", 0);
    -[UITableViewCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v4->_title);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "preferencesActions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rivenSizeFactor:", 4.0);
    v36 = v17 - v35;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "preferencesActions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "rivenSizeFactor:", 3.0);
    v40 = 1.0 - v39;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "preferencesActions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "rivenSizeFactor:", 40.0);
    v44 = v43;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "preferencesActions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rivenSizeFactor:", 40.0);
    v48 = v47;

    v49 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v36, v40, v44, v48);
    selectedCircle = v4->_selectedCircle;
    v4->_selectedCircle = v49;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "preferencesActions");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "rivenSizeFactor:", 20.0);
    v54 = v53;
    -[UIView layer](v4->_selectedCircle, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setCornerRadius:", v54);

    -[UIView setHidden:](v4->_selectedCircle, "setHidden:", 1);
    -[UITableViewCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v4->_selectedCircle);

    -[UITableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v57 = v4;
  }

  return v4;
}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_title, "setText:", a3);
}

- (void)setPressIndicatorHidden:(BOOL)a3
{
  -[UIView setHidden:](self->_selectedCircle, "setHidden:", a3);
}

- (void)setSelectedCircleBlendMode:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E80]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_selectedCircle, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v4);

    +[UIColor blackColor](UIColor, "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_selectedCircle, "setBackgroundColor:", v6);

    -[UIView layer](self->_selectedCircle, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1045220557;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BC0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_selectedCircle, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", v9);

    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.380392157, 0.380392157, 0.380392157, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_selectedCircle, "setBackgroundColor:", v11);

    -[UIView layer](self->_selectedCircle, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1061779669;
  }
  v12 = v7;
  objc_msgSend(v7, "setOpacity:", v8);

}

- (UIImageView)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_symbol, a3);
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UIView)selectedCircle
{
  return self->_selectedCircle;
}

- (void)setSelectedCircle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCircle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end
