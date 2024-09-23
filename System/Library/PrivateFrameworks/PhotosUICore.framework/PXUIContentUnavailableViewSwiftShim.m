@implementation PXUIContentUnavailableViewSwiftShim

- (PXUIContentUnavailableViewSwiftShim)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIContentUnavailableViewSwiftShim;
  return -[PXUIContentUnavailableViewSwiftShim init](&v3, sel_init);
}

- (UIContentUnavailableView)unavailableView
{
  UIContentUnavailableView *view;
  id v4;
  void *v5;
  UIContentUnavailableView *v6;
  UIContentUnavailableView *v7;

  view = self->_view;
  if (!view)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC36B0]);
    +[PXUIContentUnavailableViewSwiftShim lemonade_defaultRowConfigurationWithTitle:subtitle:systemImageName:buttonTitle:buttonIsEnabled:buttonAction:](PXUIContentUnavailableViewSwiftShim, "lemonade_defaultRowConfigurationWithTitle:subtitle:systemImageName:buttonTitle:buttonIsEnabled:buttonAction:", 0, 0, 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIContentUnavailableView *)objc_msgSend(v4, "initWithConfiguration:", v5);
    v7 = self->_view;
    self->_view = v6;

    view = self->_view;
  }
  return view;
}

- (void)updateConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXUIContentUnavailableViewSwiftShim unavailableView](self, "unavailableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

+ (id)lemonade_defaultRowConfigurationWithTitle:(id)a3 subtitle:(id)a4 systemImageName:(id)a5 buttonTitle:(id)a6 buttonIsEnabled:(BOOL)a7 buttonAction:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _BOOL4 v43;

  v43 = a7;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  v16 = (void *)MEMORY[0x1E0DC3698];
  v17 = a4;
  objc_msgSend(v16, "emptyConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B50]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredSymbolConfiguration:", v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTintColor:", v21);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v23);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setColor:", v25);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "secondaryTextProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFont:", v27);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "secondaryTextProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setColor:", v29);

  objc_msgSend(v18, "setImageToTextPadding:", 8.0);
  objc_msgSend(v18, "setTextToSecondaryTextPadding:", 4.0);
  objc_msgSend(v18, "setTextToButtonPadding:", 12.0);
  objc_msgSend(v18, "setButtonToSecondaryButtonPadding:", 12.0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "setDirectionalLayoutMargins:", 20.0, 20.0, 20.0, 20.0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBackgroundColor:", v32);

    objc_msgSend(v18, "setBackground:", v31);
  }
  objc_msgSend(v18, "setText:", v12);
  objc_msgSend(v18, "setSecondaryText:", v17);

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v33);

  }
  else
  {
    objc_msgSend(v18, "setImage:", 0);
  }
  objc_msgSend(v18, "buttonProperties");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v15)
  {
    objc_msgSend(v35, "setTitle:", v14);

    objc_msgSend(v18, "buttonProperties");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setEnabled:", v43);

    objc_msgSend(v18, "buttonProperties");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    v40 = v15;
  }
  else
  {
    objc_msgSend(v35, "setTitle:", 0);

    objc_msgSend(v18, "buttonProperties");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setEnabled:", 1);

    objc_msgSend(v18, "buttonProperties");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    v40 = 0;
  }
  objc_msgSend(v38, "setPrimaryAction:", v40);

  return v18;
}

+ (id)lemonade_defaultFeedConfigurationWithTitle:(id)a3 subtitle:(id)a4 systemImageName:(id)a5 buttonTitle:(id)a6 buttonIsEnabled:(BOOL)a7 buttonAction:(id)a8
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "lemonade_defaultRowConfigurationWithTitle:subtitle:systemImageName:buttonTitle:buttonIsEnabled:buttonAction:", a3, a4, a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryTextProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColor:", v13);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackground:", v15);

  }
  return v8;
}

@end
