@implementation PUWallpaperPosterEditToolBar

- (PUWallpaperPosterEditToolBar)initWithFrame:(CGRect)a3
{
  PUWallpaperPosterEditToolBar *v3;
  PUWallpaperPosterEditToolBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterEditToolBar;
  v3 = -[PUWallpaperPosterEditToolBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PUWallpaperPosterEditToolBar _setupView](v3, "_setupView");
  return v4;
}

- (void)_setupView
{
  UIButton *v3;
  UIButton *firstActionButton;
  UIButton *v5;
  UIButton *secondActionButton;
  UIButton *v7;
  UIButton *thirdActionButton;
  UIButton *v9;
  UIButton *fourthActionButton;
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
  void *v47;
  void *v48;
  _QWORD v49[14];

  v49[12] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditToolBar _createActionButton](self, "_createActionButton");
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  firstActionButton = self->_firstActionButton;
  self->_firstActionButton = v3;

  -[PUWallpaperPosterEditToolBar _createActionButton](self, "_createActionButton");
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  secondActionButton = self->_secondActionButton;
  self->_secondActionButton = v5;

  -[PUWallpaperPosterEditToolBar _createActionButton](self, "_createActionButton");
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  thirdActionButton = self->_thirdActionButton;
  self->_thirdActionButton = v7;

  -[PUWallpaperPosterEditToolBar _createActionButton](self, "_createActionButton");
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  fourthActionButton = self->_fourthActionButton;
  self->_fourthActionButton = v9;

  v34 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton leadingAnchor](self->_firstActionButton, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar leadingAnchor](self, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 20.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v46;
  -[UIButton bottomAnchor](self->_firstActionButton, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar bottomAnchor](self, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v43;
  -[UIButton topAnchor](self->_firstActionButton, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar topAnchor](self, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v40;
  -[UIButton leadingAnchor](self->_secondActionButton, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_firstActionButton, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v37;
  -[UIButton bottomAnchor](self->_secondActionButton, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar bottomAnchor](self, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v33;
  -[UIButton topAnchor](self->_secondActionButton, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar topAnchor](self, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v30;
  -[UIButton trailingAnchor](self->_fourthActionButton, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar trailingAnchor](self, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v27;
  -[UIButton bottomAnchor](self->_fourthActionButton, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar bottomAnchor](self, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v24;
  -[UIButton topAnchor](self->_fourthActionButton, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar topAnchor](self, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v21;
  -[UIButton trailingAnchor](self->_thirdActionButton, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_fourthActionButton, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -20.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v13;
  -[UIButton bottomAnchor](self->_thirdActionButton, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar bottomAnchor](self, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v16;
  -[UIButton topAnchor](self->_thirdActionButton, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditToolBar topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v20);

}

- (id)_createActionButton
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfiguration:forImageInState:", v4, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v5);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUWallpaperPosterEditToolBar addSubview:](self, "addSubview:", v3);
  return v3;
}

- (void)setLeadingMenuElements:(id)a3
{
  NSArray *v5;
  NSArray *leadingMenuElements;
  void *v7;
  void *v8;
  NSArray *v9;

  v5 = (NSArray *)a3;
  leadingMenuElements = self->_leadingMenuElements;
  v9 = v5;
  if (leadingMenuElements != v5)
  {
    -[PUWallpaperPosterEditToolBar firstActionButton](self, "firstActionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditToolBar secondActionButton](self, "secondActionButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditToolBar _setMenuElements:oldMenuElements:onButtonOne:onButtonTwo:](self, "_setMenuElements:oldMenuElements:onButtonOne:onButtonTwo:", v9, leadingMenuElements, v7, v8);

    objc_storeStrong((id *)&self->_leadingMenuElements, a3);
  }

}

- (void)setTrailingMenuElements:(id)a3
{
  NSArray *v5;
  NSArray *trailingMenuElements;
  void *v7;
  void *v8;
  NSArray *v9;

  v5 = (NSArray *)a3;
  trailingMenuElements = self->_trailingMenuElements;
  v9 = v5;
  if (trailingMenuElements != v5)
  {
    -[PUWallpaperPosterEditToolBar thirdActionButton](self, "thirdActionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditToolBar fourthActionButton](self, "fourthActionButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditToolBar _setMenuElements:oldMenuElements:onButtonOne:onButtonTwo:](self, "_setMenuElements:oldMenuElements:onButtonOne:onButtonTwo:", v9, trailingMenuElements, v7, v8);

    objc_storeStrong((id *)&self->_trailingMenuElements, a3);
  }

}

- (id)viewForMenuElementIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (-[NSArray count](self->_leadingMenuElements, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_leadingMenuElements, "objectAtIndex:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;

      objc_msgSend(v7, "identifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
        break;

      if (++v5 >= -[NSArray count](self->_leadingMenuElements, "count"))
        goto LABEL_9;
    }
    if (v5)
      -[PUWallpaperPosterEditToolBar secondActionButton](self, "secondActionButton");
    else
      -[PUWallpaperPosterEditToolBar firstActionButton](self, "firstActionButton");
    goto LABEL_20;
  }
LABEL_9:
  if (-[NSArray count](self->_trailingMenuElements, "count"))
  {
    v9 = 0;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_trailingMenuElements, "objectAtIndex:", v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;

      objc_msgSend(v7, "identifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v4)
        break;

      if (++v9 >= -[NSArray count](self->_trailingMenuElements, "count"))
        goto LABEL_17;
    }
    if (v9)
      -[PUWallpaperPosterEditToolBar fourthActionButton](self, "fourthActionButton");
    else
      -[PUWallpaperPosterEditToolBar thirdActionButton](self, "thirdActionButton");
LABEL_20:
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v12;

    goto LABEL_25;
  }
LABEL_17:
  v11 = 0;
LABEL_25:

  return v11;
}

- (void)_setMenuElements:(id)a3 oldMenuElements:(id)a4 onButtonOne:(id)a5 onButtonTwo:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v14 = 0;
    if (!v13)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v10, "objectAtIndex:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
LABEL_5:
    -[PUWallpaperPosterEditToolBar _removeMenuElement:fromButton:](self, "_removeMenuElement:fromButton:", v13, v11);
LABEL_6:
  if (v14)
    -[PUWallpaperPosterEditToolBar _removeMenuElement:fromButton:](self, "_removeMenuElement:fromButton:", v14, v12);
  objc_msgSend(v17, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v17, "count") < 2)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v17, "objectAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setHidden:", v15 == 0);
  objc_msgSend(v12, "setHidden:", v16 == 0);
  if (v15)
    -[PUWallpaperPosterEditToolBar _setMenuElement:onButton:](self, "_setMenuElement:onButton:", v15, v11);
  if (v16)
    -[PUWallpaperPosterEditToolBar _setMenuElement:onButton:](self, "_setMenuElement:onButton:", v16, v12);

}

- (void)_setMenuElement:(id)a3 onButton:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(v7, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v5, "setMenu:", v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 0);
      objc_msgSend(v5, "setMenu:", 0);
      objc_msgSend(v5, "addAction:forControlEvents:", v7, 0x2000);
    }
  }

}

- (void)_removeMenuElement:(id)a3 fromButton:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setMenu:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "removeAction:forControlEvents:", v6, 0x2000);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterEditToolBar;
  -[PUWallpaperPosterEditToolBar hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

- (NSArray)leadingMenuElements
{
  return self->_leadingMenuElements;
}

- (NSArray)trailingMenuElements
{
  return self->_trailingMenuElements;
}

- (PUWallpaperPosterEditToolbarDelegate)delegate
{
  return (PUWallpaperPosterEditToolbarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)firstActionButton
{
  return self->_firstActionButton;
}

- (void)setFirstActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_firstActionButton, a3);
}

- (UIButton)secondActionButton
{
  return self->_secondActionButton;
}

- (void)setSecondActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondActionButton, a3);
}

- (UIButton)thirdActionButton
{
  return self->_thirdActionButton;
}

- (void)setThirdActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_thirdActionButton, a3);
}

- (UIButton)fourthActionButton
{
  return self->_fourthActionButton;
}

- (void)setFourthActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_fourthActionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fourthActionButton, 0);
  objc_storeStrong((id *)&self->_thirdActionButton, 0);
  objc_storeStrong((id *)&self->_secondActionButton, 0);
  objc_storeStrong((id *)&self->_firstActionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingMenuElements, 0);
  objc_storeStrong((id *)&self->_leadingMenuElements, 0);
}

@end
