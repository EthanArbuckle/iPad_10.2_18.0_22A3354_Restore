@implementation _UIPreviewActionSheetTitleView

- (_UIPreviewActionSheetTitleView)initWithFrame:(CGRect)a3 title:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _UIPreviewActionSheetTitleView *v11;
  _UIPreviewActionSheetTitleView *v12;
  _UIPreviewActionSheetTitleView *v13;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_UIPreviewActionSheetTitleView;
  v11 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    v13 = v12;
    v14 = [UILabel alloc];
    v15 = -[UILabel initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIPreviewActionSheetTitleView title](v13, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v15, "setText:", v16);

    -[UILabel setNumberOfLines:](v15, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v15, "setTextAlignment:", 1);
    if (_AXDarkenSystemColors())
      +[UIColor blackColor](UIColor, "blackColor");
    else
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.56, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v17);

    -[UIView addSubview:](v13, "addSubview:", v15);
    -[_UIPreviewActionSheetTitleView setLabel:](v13, "setLabel:", v15);
    _NSDictionaryOfVariableBindings(CFSTR("label"), v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[label]-|"), 0, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 12, 0, v13, 3, 1.0, 25.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 11, 0, v13, 11, 1.0, -15.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v19);
    -[_UIPreviewActionSheetTitleView _updateLabelFont](v13, "_updateLabelFont");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v13, sel__contentSizeChanged_, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  }
  return v12;
}

- (_UIPreviewActionSheetTitleView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetTitleView;
  return -[UIView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (_UIPreviewActionSheetTitleView)initWithFrame:(CGRect)a3
{
  return -[_UIPreviewActionSheetTitleView initWithFrame:title:](self, "initWithFrame:title:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetTitleView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)_updateLabelFont
{
  void *v3;
  void *v4;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionSheetTitleView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
