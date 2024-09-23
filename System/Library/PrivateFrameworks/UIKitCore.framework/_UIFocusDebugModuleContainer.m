@implementation _UIFocusDebugModuleContainer

- (_UIFocusDebugModuleContainer)initWithModule:(id)a3
{
  id v4;
  _UIFocusDebugModuleContainer *v5;
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
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UIFocusDebugModuleContainer;
  v5 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v5, "addSubview:", v4);
    v17 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](v5, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[UIView bottomAnchor](v5, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v6;
    -[UIView trailingAnchor](v5, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v9;
    -[UIView topAnchor](v5, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v13);

    +[UIColor blackColor](UIColor, "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v15);

  }
  return v5;
}

@end
