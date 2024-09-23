@implementation _UIPreviewActionSheetItemView

- (_UIPreviewActionSheetItemView)initWithFrame:(CGRect)a3
{
  return -[_UIPreviewActionSheetItemView initWithFrame:action:](self, "initWithFrame:action:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIPreviewActionSheetItemView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetItemView;
  return -[UIView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (_UIPreviewActionSheetItemView)initWithFrame:(CGRect)a3 action:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIPreviewActionSheetItemView *v10;
  _UIPreviewActionSheetItemView *v11;
  _UIPreviewActionSheetItemView *v12;
  UIImageView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIImageView *v18;
  UILabel *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_UIPreviewActionSheetItemView;
  v10 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = [UIImageView alloc];
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v18 = -[UIImageView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v18, "setContentMode:", 1);
    -[UIView addSubview:](v12, "addSubview:", v18);
    -[_UIPreviewActionSheetItemView setImageView:](v12, "setImageView:", v18);
    v19 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v14, v15, v16, v17);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v19, "setTextAlignment:", 1);
    -[UIView addSubview:](v12, "addSubview:", v19);
    -[_UIPreviewActionSheetItemView setLabel:](v12, "setLabel:", v19);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v12, sel__contentSizeChanged_, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

    -[_UIPreviewActionSheetItemView setAction:](v12, "setAction:", v9);
    -[_UIPreviewActionSheetItemView _updateLabelFont](v12, "_updateLabelFont");
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetItemView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)setAction:(id)a3
{
  UIPreviewAction *v5;
  UIPreviewAction *v6;

  v5 = (UIPreviewAction *)a3;
  if (self->_action != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_action, a3);
    -[_UIPreviewActionSheetItemView _updateTitleFromAction](self, "_updateTitleFromAction");
    -[_UIPreviewActionSheetItemView _updateImageFromAction](self, "_updateImageFromAction");
    -[_UIPreviewActionSheetItemView _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  if (-[_UIPreviewActionSheetItemView selected](self, "selected") != a3)
  {
    -[_UIPreviewActionSheetItemView setSelected:](self, "setSelected:", v5);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    v9 = v8;
    if (v4)
    {
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke_2;
      v10[3] = &unk_1E16B1BF8;
      v11 = v8;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.2);

    }
    else
    {
      v8[2](v8);
    }

  }
}

- (void)_updateLabelFont
{
  void *v3;
  double v4;
  void *v5;
  void *v6;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 20.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryXS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryM")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryL")) & 1) == 0)
  {
    v4 = 22.0;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryXL")) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryXXL")))
        v4 = 23.0;
      else
        v4 = 24.0;
    }
  }

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionSheetItemView label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateTitleFromAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_action)
  {
    -[_UIPreviewActionSheetItemView action](self, "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_effectiveColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIPreviewActionSheetItemView label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewActionSheetItemView action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    if (v7)
      objc_msgSend(v4, "setTextColor:", v7);
    objc_msgSend(v4, "_setTextColorFollowsTintColor:", v7 == 0);

  }
}

- (void)_updateImageFromAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_action)
  {
    -[_UIPreviewActionSheetItemView imageView](self, "imageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewActionSheetItemView action](self, "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_effectiveColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v4);

    -[_UIPreviewActionSheetItemView action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

  }
}

- (void)_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[_UIPreviewActionSheetItemView label](self, "label");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionSheetItemView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 21.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIdentifier:", CFSTR("labelLeading"));
  LODWORD(v9) = 1132068864;
  objc_msgSend(v8, "setPriority:", v9);
  objc_msgSend(v4, "addObject:", v8);
  if (v5)
  {
    objc_msgSend(v3, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -21.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIdentifier:", CFSTR("imageTrailing"));
    LODWORD(v13) = 1148846080;
    objc_msgSend(v12, "setPriority:", v13);
    objc_msgSend(v4, "addObject:", v12);
    objc_msgSend(v3, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, 17.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("labelToImageSpacing"));
    LODWORD(v17) = 1132068864;
    objc_msgSend(v16, "setPriority:", v17);
    objc_msgSend(v4, "addObject:", v16);
    objc_msgSend(v37, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setIdentifier:", CFSTR("labelCentering"));
    LODWORD(v21) = 1132068864;
    objc_msgSend(v20, "setPriority:", v21);
    objc_msgSend(v4, "addObject:", v20);
    objc_msgSend(v3, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

  }
  else
  {
    objc_msgSend(v37, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -21.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIdentifier:", CFSTR("labelTrailing"));
    LODWORD(v27) = 1132068864;
    objc_msgSend(v12, "setPriority:", v27);
    objc_msgSend(v4, "addObject:", v12);
    objc_msgSend(v37, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("labelCentering"));
    LODWORD(v30) = 1144750080;
    objc_msgSend(v16, "setPriority:", v30);
    objc_msgSend(v4, "addObject:", v16);
  }

  objc_msgSend(v37, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 36.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v33);

  objc_msgSend(v37, "lastBaselineAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -21.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v36);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v4);
}

- (UIPreviewAction)action
{
  return self->_action;
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
