@implementation OBTextWelcomeController

- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBTextWelcomeController;
  return -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v7, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, a6);
}

- (OBTextWelcomeController)initWithTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBTextWelcomeController;
  return -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v4, sel_initWithTitle_detailText_icon_contentLayout_, a3, 0, 0, 2);
}

- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 contentLayout:(int64_t)a5
{
  return -[OBTextWelcomeController initWithTitle:detailText:icon:contentLayout:](self, "initWithTitle:detailText:icon:contentLayout:", a3, a4, 0, a5);
}

- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBTextWelcomeController;
  return -[OBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v7, sel_initWithTitle_detailText_symbolName_contentLayout_, a3, a4, a5, a6);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
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
  objc_super v32;
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)OBTextWelcomeController;
  -[OBWelcomeController loadView](&v32, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTextWelcomeController setStackView:](self, "setStackView:", v4);

  -[OBTextWelcomeController stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTextWelcomeController stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAxis:", 1);

  -[OBTextWelcomeController stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpacing:", 22.0);

  -[OBWelcomeController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[OBTextWelcomeController stackView](self, "stackView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  -[OBTextWelcomeController stackView](self, "stackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  -[OBTextWelcomeController stackView](self, "stackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v13;
  -[OBTextWelcomeController stackView](self, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v19);

}

- (void)addSectionWithHeader:(id)a3 content:(id)a4
{
  -[OBTextWelcomeController addSectionWithHeader:content:accessoryButton:](self, "addSectionWithHeader:content:accessoryButton:", a3, a4, 0);
}

- (void)addSectionWithHeader:(id)a3 content:(id)a4 accessoryButton:(id)a5
{
  id v8;
  id v9;
  OBTextSectionView *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = a4;
  v9 = a3;
  -[OBTextWelcomeController loadViewIfNeeded](self, "loadViewIfNeeded");
  v10 = -[OBTextSectionView initWithHeader:content:]([OBTextSectionView alloc], "initWithHeader:content:", v9, v8);

  if (v12)
    -[OBTextSectionView addAccessoryButton:](v10, "addAccessoryButton:", v12);
  -[OBTextWelcomeController stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addArrangedSubview:", v10);

  -[OBTextWelcomeController setCurrentBulletedList:](self, "setCurrentBulletedList:", 0);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4
{
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:accessoryButton:](self, "addBulletedListItemWithTitle:description:accessoryButton:", a3, a4, 0);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 accessoryButton:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  OBTextBulletedList *v12;
  OBTextBulletedList *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[OBTextWelcomeController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[OBTextWelcomeController currentBulletedList](self, "currentBulletedList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = [OBTextBulletedList alloc];
    v13 = -[OBBulletedList initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBTextWelcomeController stackView](self, "stackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addArrangedSubview:", v13);

    -[OBTextWelcomeController setCurrentBulletedList:](self, "setCurrentBulletedList:", v13);
  }
  -[OBTextWelcomeController currentBulletedList](self, "currentBulletedList");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addItemWithTitle:description:accessoryButton:", v10, v9, v8);

}

- (BOOL)shouldInlineButtonTray
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTextWelcomeController;
  if (-[OBWelcomeController contentViewUnderButtonTray](&v5, sel_contentViewUnderButtonTray))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)OBTextWelcomeController;
  return -[OBWelcomeController shouldInlineButtonTray](&v4, sel_shouldInlineButtonTray);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (OBTextBulletedList)currentBulletedList
{
  return self->_currentBulletedList;
}

- (void)setCurrentBulletedList:(id)a3
{
  objc_storeStrong((id *)&self->_currentBulletedList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBulletedList, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
