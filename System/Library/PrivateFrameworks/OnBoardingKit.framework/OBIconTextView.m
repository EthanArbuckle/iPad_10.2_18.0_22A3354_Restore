@implementation OBIconTextView

- (OBIconTextView)initWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5 dataDetectorTypes:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  OBIconTextView *v13;
  OBIconTextView *v14;
  uint64_t v15;
  UIImageView *iconView;
  id v17;
  uint64_t v18;
  UITextView *textView;
  UITextView *v20;
  void *v21;
  UITextView *v22;
  void *v23;
  objc_super v25;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)OBIconTextView;
  v13 = -[OBIconTextView init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_iconSize.width = width;
    v13->_iconSize.height = height;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    iconView = v14->_iconView;
    v14->_iconView = (UIImageView *)v15;

    -[UIImageView setContentMode:](v14->_iconView, "setContentMode:", 2);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v14->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OBIconTextView addSubview:](v14, "addSubview:", v14->_iconView);
    v17 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = v14->_textView;
    v14->_textView = (UITextView *)v18;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v14->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setDataDetectorTypes:](v14->_textView, "setDataDetectorTypes:", a6);
    -[UITextView setEditable:](v14->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](v14->_textView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v14->_textView, "setScrollEnabled:", 0);
    v20 = v14->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    v22 = v14->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v22, "setTextColor:", v23);

    if (v12)
      -[UITextView setText:](v14->_textView, "setText:", v12);
    -[OBIconTextView updateFont](v14, "updateFont");
    -[OBIconTextView addSubview:](v14, "addSubview:", v14->_textView);
  }

  return v14;
}

- (id)viewForFirstBaselineLayout
{
  return self->_textView;
}

- (id)viewForLastBaselineLayout
{
  return self->_textView;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  objc_super v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[OBIconTextView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBIconTextView removeConstraints:](self, "removeConstraints:", v3);

  v29.receiver = self;
  v29.super_class = (Class)OBIconTextView;
  -[OBIconTextView updateConstraints](&v29, sel_updateConstraints);
  v4 = (void *)MEMORY[0x1E0CB3718];
  v30 = CFSTR("padding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_padding);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_iconView, _textView"), self->_iconView, self->_textView, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_iconView]-(padding)-[_textView]|"), 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v8);

  -[UITextView heightAnchor](self->_textView, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBIconTextView heightAnchor](self, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UITextView topAnchor](self->_textView, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBIconTextView topAnchor](self, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIImageView centerYAnchor](self->_iconView, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView firstBaselineAnchor](self->_textView, "firstBaselineAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView font](self->_textView, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "capHeight");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v18 * -0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[OBIconTextView iconSize](self, "iconSize");
  if (v21 != *MEMORY[0x1E0C9D820] || v20 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UIImageView heightAnchor](self->_iconView, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBIconTextView iconSize](self, "iconSize");
    objc_msgSend(v22, "constraintEqualToConstant:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v25) = 1148846080;
    objc_msgSend(v24, "setPriority:", v25);
    objc_msgSend(v24, "setActive:", 1);
    -[UIImageView widthAnchor](self->_iconView, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBIconTextView iconSize](self, "iconSize");
    objc_msgSend(v26, "constraintEqualToConstant:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v28) = 1148846080;
    objc_msgSend(v27, "setPriority:", v28);
    objc_msgSend(v27, "setActive:", 1);

  }
}

- (void)updateFont
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_textView, "setFont:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBIconTextView;
  -[OBIconTextView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBIconTextView updateFont](self, "updateFont");
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)baselineFromBoundsTop
{
  return self->_baselineFromBoundsTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
