@implementation _UIActivityContentSectionFooterView

- (_UIActivityContentSectionFooterView)initWithFrame:(CGRect)a3
{
  _UIActivityContentSectionFooterView *v3;
  id v4;
  void *v5;
  void *v6;
  _UIActivityContentSectionFooterView *v7;
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
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)_UIActivityContentSectionFooterView;
  v3 = -[_UIActivityContentSectionFooterView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setEditable:", 0);
    objc_msgSend(v4, "setSelectable:", 1);
    objc_msgSend(v4, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(v4, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v4, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

    objc_msgSend(v4, "setDelegate:", v3);
    -[_UIActivityContentSectionFooterView setFooterTextView:](v3, "setFooterTextView:", v4);
    v7 = v3;
    -[_UIActivityContentSectionFooterView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityContentSectionFooterView footerTextView](v7, "footerTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionFooterView addSubview:](v7, "addSubview:", v8);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionFooterView footerTextView](v7, "footerTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionFooterView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    -[_UIActivityContentSectionFooterView footerTextView](v7, "footerTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionFooterView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    -[_UIActivityContentSectionFooterView footerTextView](v7, "footerTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionFooterView topAnchor](v7, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

    -[_UIActivityContentSectionFooterView bottomAnchor](v7, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentSectionFooterView footerTextView](v7, "footerTextView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 32.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
  }
  return v3;
}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (void)setFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTextView, 0);
}

@end
