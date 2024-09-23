@implementation _UIActivityContentFooterView

- (_UIActivityContentFooterView)initWithFrame:(CGRect)a3
{
  _UIActivityContentFooterView *v3;
  _UIActivityContentFooterView *v4;
  void *v5;
  _UIActivityContentFooterView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)_UIActivityContentFooterView;
  v3 = -[_UIActivityContentFooterView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIActivityContentFooterView _createEditButton](v3, "_createEditButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityContentFooterView setEditButton:](v4, "setEditButton:", v5);
    v6 = v4;
    -[_UIActivityContentFooterView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityContentFooterView editButton](v6, "editButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityContentFooterView addSubview:](v6, "addSubview:", v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    -[_UIActivityContentFooterView editButton](v6, "editButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 == 6)
    {
      objc_msgSend(v11, "centerXAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentFooterView layoutMarginsGuide](v6, "layoutMarginsGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "centerXAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v16);

      -[_UIActivityContentFooterView editButton](v6, "editButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "centerYAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentFooterView layoutMarginsGuide](v6, "layoutMarginsGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v21);

    }
    else
    {
      objc_msgSend(v11, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentFooterView layoutMarginsGuide](v6, "layoutMarginsGuide");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v25);

      -[_UIActivityContentFooterView editButton](v6, "editButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentFooterView layoutMarginsGuide](v6, "layoutMarginsGuide");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:constant:", v29, 0.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v30);

      -[_UIActivityContentFooterView editButton](v6, "editButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentFooterView topAnchor](v6, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 10.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v34);

      -[_UIActivityContentFooterView bottomAnchor](v6, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentFooterView editButton](v6, "editButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 16.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v20);
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
  }
  return v4;
}

- (id)_createEditButton
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerStyle:", 4);
    objc_msgSend(v5, "setTitleTextAttributesTransformer:", &__block_literal_global_43);
    objc_msgSend(v2, "setConfiguration:", v5);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    objc_msgSend(v2, "setContentHorizontalAlignment:", 4);
    objc_msgSend(v2, "setContentVerticalAlignment:", 1);
  }
  return v2;
}

- (void)prepareForReuse
{
  id v2;

  -[_UIActivityContentFooterView editButton](self, "editButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
}

@end
