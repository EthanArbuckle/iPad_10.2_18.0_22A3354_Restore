@implementation PRComplicationGalleryApplicationCell

- (PRComplicationGalleryApplicationCell)initWithFrame:(CGRect)a3
{
  PRComplicationGalleryApplicationCell *v3;
  PRComplicationGalleryApplicationCell *v4;
  void *v5;
  PRComplicationGalleryApplicationTitleView *v6;
  PRComplicationGalleryApplicationTitleView *titleView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *separatorView;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
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
  objc_super v45;
  _QWORD v46[4];
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)PRComplicationGalleryApplicationCell;
  v3 = -[PRComplicationGalleryApplicationCell initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRComplicationGalleryApplicationCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(PRComplicationGalleryApplicationTitleView);
    titleView = v4->_titleView;
    v4->_titleView = v6;

    objc_msgSend(v5, "addSubview:", v4->_titleView);
    -[PRComplicationGalleryApplicationTitleView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = (void *)MEMORY[0x1E0CB3718];
    -[PRComplicationGalleryApplicationTitleView leadingAnchor](v4->_titleView, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v38;
    -[PRComplicationGalleryApplicationTitleView trailingAnchor](v4->_titleView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v8;
    -[PRComplicationGalleryApplicationTitleView topAnchor](v4->_titleView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v5;
    objc_msgSend(v5, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v11;
    -[PRComplicationGalleryApplicationTitleView bottomAnchor](v4->_titleView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v15);

    -[PRComplicationGalleryApplicationTitleView setContentInsets:](v4->_titleView, "setContentInsets:", 12.0, 27.0, 12.0, 27.0);
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = v4->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[PRComplicationGalleryApplicationCell setSeparatorVisible:](v4, "setSeparatorVisible:", 1);
    objc_msgSend(v44, "addSubview:", v4->_separatorView);
    v35 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](v4->_separatorView, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryApplicationTitleView titleLabelLeadingAnchor](v4->_titleView, "titleLabelLeadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v39;
    -[UIView trailingAnchor](v4->_separatorView, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v21;
    -[UIView bottomAnchor](v4->_separatorView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v24;
    -[UIView heightAnchor](v4->_separatorView, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scale");
    objc_msgSend(v25, "constraintEqualToConstant:", 1.0 / v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v29);

    v30 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v31);

    -[PRComplicationGalleryApplicationCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v30);
  }
  return v4;
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    -[UIView setHidden:](self->_separatorView, "setHidden:", !a3);
  }
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (PRComplicationGalleryApplicationTitleView)titleView
{
  return self->_titleView;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
