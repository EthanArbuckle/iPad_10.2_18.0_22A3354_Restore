@implementation _PRInlineTextViewController

- (_PRInlineTextViewController)initWithText:(id)a3
{
  id v4;
  _PRInlineTextViewController *v5;
  id v6;
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
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_PRInlineTextViewController;
  v5 = -[_PRInlineTextViewController init](&v29, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

    objc_msgSend(v6, "setText:", v4);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1438]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v8);

    -[_PRInlineTextViewController view](v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v6);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRInlineTextViewController view](v5, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    objc_msgSend(v6, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRInlineTextViewController view](v5, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v20;
    objc_msgSend(v6, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRInlineTextViewController view](v5, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v11;
    objc_msgSend(v6, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRInlineTextViewController view](v5, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v16);

  }
  return v5;
}

@end
