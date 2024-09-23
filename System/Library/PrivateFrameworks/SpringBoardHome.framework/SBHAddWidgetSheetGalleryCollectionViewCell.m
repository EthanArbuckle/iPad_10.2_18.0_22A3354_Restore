@implementation SBHAddWidgetSheetGalleryCollectionViewCell

- (SBHAddWidgetSheetGalleryCollectionViewCell)initWithFrame:(CGRect)a3
{
  SBHAddWidgetSheetGalleryCollectionViewCell *v3;
  SBHAddWidgetSheetGalleryCollectionViewCell *v4;
  void *v5;
  UIView *v6;
  UIView *highlightView;
  UIView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetSheetGalleryCollectionViewCell;
  v3 = -[SBHAddWidgetSheetGalleryCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBHAddWidgetSheetGalleryCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v4->_highlightView;
    v4->_highlightView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_highlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = v4->_highlightView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    objc_msgSend(v5, "addSubview:", v4->_highlightView);
    -[UIView setAlpha:](v4->_highlightView, "setAlpha:", 0.0);

  }
  return v4;
}

- (void)setWidgetWrapperViewController:(id)a3
{
  SBHWidgetWrapperViewController *v5;
  SBHWidgetWrapperViewController **p_widgetWrapperViewController;
  SBHWidgetWrapperViewController *widgetWrapperViewController;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIView *highlightView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  SBHWidgetWrapperViewController *v47;
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v5 = (SBHWidgetWrapperViewController *)a3;
  p_widgetWrapperViewController = &self->_widgetWrapperViewController;
  widgetWrapperViewController = self->_widgetWrapperViewController;
  if (widgetWrapperViewController != v5)
  {
    -[SBHWidgetWrapperViewController view](widgetWrapperViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetGalleryCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      -[SBHWidgetWrapperViewController parentViewController](*p_widgetWrapperViewController, "parentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bs_removeChildViewController:", *p_widgetWrapperViewController);

    }
    objc_storeStrong((id *)&self->_widgetWrapperViewController, a3);
    if (*p_widgetWrapperViewController)
    {
      v47 = v5;
      -[SBHAddWidgetSheetGalleryCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperViewController wrapperView](*p_widgetWrapperViewController, "wrapperView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v12, "addSubview:", v13);
      v34 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v13, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v42);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v40;
      objc_msgSend(v13, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v14;
      objc_msgSend(v13, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v17;
      objc_msgSend(v13, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v12;
      objc_msgSend(v12, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activateConstraints:", v21);

      v45 = v13;
      objc_msgSend(v13, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v33 = (void *)MEMORY[0x1E0CB3718];
        -[UIView leadingAnchor](self->_highlightView, "leadingAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "leadingAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:", v41);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v39;
        -[UIView trailingAnchor](self->_highlightView, "trailingAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "trailingAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "constraintEqualToAnchor:", v35);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v32;
        -[UIView topAnchor](self->_highlightView, "topAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "topAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v25;
        -[UIView bottomAnchor](self->_highlightView, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v48[3] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "activateConstraints:", v29);

      }
      highlightView = self->_highlightView;
      v5 = v47;
      -[SBHWidgetWrapperViewController wrapperView](v47, "wrapperView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cornerRadius");
      -[UIView _setContinuousCornerRadius:](highlightView, "_setContinuousCornerRadius:");

    }
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetGalleryCollectionViewCell;
  -[SBHAddWidgetSheetGalleryCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[SBHAddWidgetSheetGalleryCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", self->_highlightView);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SBHWidgetWrapperViewController wrapperView](self->_widgetWrapperViewController, "wrapperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHighlighted:", v3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetGalleryCollectionViewCell;
  -[SBHAddWidgetSheetGalleryCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[SBHAddWidgetSheetGalleryCollectionViewCell setWidgetWrapperViewController:](self, "setWidgetWrapperViewController:", 0);
}

- (UILabel)debugLabel
{
  return 0;
}

- (SBHWidgetWrapperViewController)widgetWrapperViewController
{
  return self->_widgetWrapperViewController;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_widgetWrapperViewController, 0);
}

@end
