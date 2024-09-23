@implementation SBHStyleTintButton

- (SBHStyleTintButton)initWithFrame:(CGRect)a3
{
  SBHStyleTintButton *v3;
  SBHStyleTintButton *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBHStyleTintButton;
  v3 = -[SBHStyleTintButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBHStyleTintButton _updateFilters](v3, "_updateFilters");
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[SBHStyleTintButton registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v6, v4, sel__updateFilters);

  }
  return v4;
}

- (void)configureForImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SBHStyleTintButton *v18;
  id v19;

  v4 = a4;
  v6 = a3;
  -[SBHStyleTintButton imageForState:](self, "imageForState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __49__SBHStyleTintButton_configureForImage_animated___block_invoke;
    v17 = &unk_1E8D84EF0;
    v18 = self;
    v19 = v6;
    v9 = (void (**)(_QWORD))_Block_copy(&v14);
    v10 = v9;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD28D0], "animation", v14, v15, v16, v17, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v12);

      objc_msgSend(v11, "setType:", *MEMORY[0x1E0CD3170]);
      objc_msgSend(v11, "setDuration:", 0.15);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      -[SBHStyleTintButton layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAnimation:forKey:", v11, CFSTR("imageUpdateAnimation"));

      v10[2](v10);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    }
    else
    {
      v9[2](v9);
    }

  }
}

uint64_t __49__SBHStyleTintButton_configureForImage_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:forState:", *(_QWORD *)(a1 + 40), 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBHStyleTintButton;
  -[SBHStyleTintButton setHighlighted:](&v8, sel_setHighlighted_);
  v5 = (void *)MEMORY[0x1E0DC3518];
  -[SBHStyleTintButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setVisuallyHighlighted:forViews:initialPress:", v3, v7, v3);

}

- (void)_updateFilters
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBHStyleTintButton traitCollection](self, "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHStyleTintButton _symbolConfigurationForTraitCollection:](self, "_symbolConfigurationForTraitCollection:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStyleTintButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v3, 0);

  if (v8)
  {
    v4 = objc_msgSend(v8, "userInterfaceStyle");
    v5 = (_QWORD *)MEMORY[0x1E0CD2E98];
    if (v4 != 1)
      v5 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  }
  else
  {
    v5 = (_QWORD *)MEMORY[0x1E0CD2E98];
  }
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStyleTintButton layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

}

- (id)_symbolConfigurationForTraitCollection:(id)a3
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "userInterfaceStyle") != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3888];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithPaletteColors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
