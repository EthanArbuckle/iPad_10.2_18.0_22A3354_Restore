@implementation PRWidgetSuggestionCell

- (PRWidgetSuggestionCell)initWithFrame:(CGRect)a3
{
  PRWidgetSuggestionCell *v3;
  UIImageView *v4;
  UIImageView *iconImageView;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PRWidgetSuggestionCell;
  v3 = -[PRWidgetSuggestionCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    -[UIImageView setHidden:](v3->_iconImageView, "setHidden:", 1);
    -[PRWidgetSuggestionCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_iconImageView);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v3->_iconImageView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    -[UIImageView heightAnchor](v3->_iconImageView, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 20.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v18;
    -[UIImageView trailingAnchor](v3->_iconImageView, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetSuggestionCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 4.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v10;
    -[UIImageView bottomAnchor](v3->_iconImageView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetSuggestionCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 4.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

  }
  return v3;
}

- (void)setWidgetWrapperViewController:(id)a3
{
  SBHWidgetWrapperViewController *v5;
  SBHWidgetWrapperViewController **p_widgetWrapperViewController;
  SBHWidgetWrapperViewController *widgetWrapperViewController;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBHWidgetWrapperViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v5 = (SBHWidgetWrapperViewController *)a3;
  p_widgetWrapperViewController = &self->_widgetWrapperViewController;
  widgetWrapperViewController = self->_widgetWrapperViewController;
  if (widgetWrapperViewController != v5)
  {
    -[SBHWidgetWrapperViewController view](widgetWrapperViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDescendantOfView:", self);

    if (v9)
    {
      -[SBHWidgetWrapperViewController parentViewController](*p_widgetWrapperViewController, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bs_removeChildViewController:", *p_widgetWrapperViewController);

    }
    objc_storeStrong((id *)&self->_widgetWrapperViewController, a3);
    if (*p_widgetWrapperViewController)
    {
      -[SBHWidgetWrapperViewController view](*p_widgetWrapperViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRWidgetSuggestionCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetSuggestionCell iconImageView](self, "iconImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:belowSubview:", v11, v13);

      v25 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v11, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetSuggestionCell contentView](self, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v29;
      objc_msgSend(v11, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetSuggestionCell contentView](self, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v24;
      objc_msgSend(v11, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetSuggestionCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v16;
      objc_msgSend(v11, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetSuggestionCell contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activateConstraints:", v22);

      v5 = v21;
    }
  }

}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", a3 == 0);
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconImageView, "image");
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (SBHWidgetWrapperViewController)widgetWrapperViewController
{
  return self->_widgetWrapperViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetWrapperViewController, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
