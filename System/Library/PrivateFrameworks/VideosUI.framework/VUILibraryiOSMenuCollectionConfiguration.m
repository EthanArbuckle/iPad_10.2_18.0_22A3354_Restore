@implementation VUILibraryiOSMenuCollectionConfiguration

- (VUILibraryiOSMenuCollectionConfiguration)init
{
  VUILibraryiOSMenuCollectionConfiguration *v2;
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryiOSMenuCollectionConfiguration;
  v2 = -[VUILibraryiOSMenuCollectionConfiguration init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

    v2->_isDesignedForIpadEnabled = v4;
  }
  return v2;
}

- (id)generateCollectionView
{
  VUILegacyCollectionView *v3;
  void *v4;
  VUILegacyCollectionView *v5;
  void *v6;

  v3 = [VUILegacyCollectionView alloc];
  -[VUILibraryiOSMenuCollectionConfiguration _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[VUILegacyCollectionView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[VUILegacyCollectionView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 0);
  -[VUILegacyCollectionView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
  -[VUILegacyCollectionView setBackgroundColor:](v5, "setBackgroundColor:", 0);
  -[VUILegacyCollectionView setOpaque:](v5, "setOpaque:", 0);
  if (-[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled"))
  {
    -[VUILegacyCollectionView registerClass:forCellWithReuseIdentifier:](v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("MenuCellIdentifier"));
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryDynamicBackgroundColor");
  }
  else
  {
    -[VUILegacyCollectionView registerClass:forCellWithReuseIdentifier:](v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("MenuCellIdentifier"));
    -[VUILegacyCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("MenuSectionHeaderCellIdentifier"));
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  return v5;
}

- (id)configureCollectionViewCellForCollectionView:(id)a3 ForItem:(id)a4 AtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled");
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("MenuCellIdentifier"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "indexPathsForSelectedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelected:", objc_msgSend(v13, "containsObject:", v10));
    if (objc_msgSend(v10, "section"))
    {
      objc_msgSend(v12, "setShouldAppearAsHeader:", objc_msgSend(v10, "row") == 0);
      objc_msgSend(v12, "setTitle:", v9);
    }
    else
    {
      v18 = objc_msgSend(v9, "unsignedIntegerValue");
      VUILibraryCategoryStringFromType(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v19);
      VUILibraryCategoryImageNameFromType(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setImageName:", v20);

    }
  }
  else
  {
    if (objc_msgSend(v10, "section"))
    {
      objc_msgSend(v12, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v9, v15, v16);
    }
    else
    {
      VUILibraryCategoryStringFromType(objc_msgSend(v9, "unsignedIntegerValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "titleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v14, v16, v21);

    }
    objc_msgSend(v12, "setHideChevron:", 1);
  }

  return v12;
}

- (id)configureSizingCellForItem:(id)a3 AtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  __objc2_class **v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled");
    v10 = off_1E9F96EA8;
    if (!v9)
      v10 = off_1E9F96D60;
    v11 = objc_alloc_init(*v10);
    -[VUILibraryiOSMenuCollectionConfiguration setMenuItemSizingCell:](self, "setMenuItemSizingCell:", v11);

  }
  if (objc_msgSend(v7, "section"))
  {
    if (-[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled"))
    {
      v12 = objc_msgSend(v7, "row") == 0;
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldAppearAsHeader:", v12);

      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:", v6);
    }
    else
    {
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "titleLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v20, v22);

    }
  }
  else
  {
    v15 = objc_msgSend(v6, "unsignedIntegerValue");
    VUILibraryCategoryStringFromType(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled"))
    {
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v14);

      VUILibraryCategoryImageNameFromType(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setImageName:", v17);
    }
    else
    {
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "titleLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v14, v24, v26);

    }
  }

  -[VUILibraryiOSMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (double)minimumLineSpacing
{
  return 0.0;
}

- (Class)classForCollectionViewCell
{
  -[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_layout
{
  id v2;
  id v3;

  if (-[VUILibraryiOSMenuCollectionConfiguration isDesignedForIpadEnabled](self, "isDesignedForIpadEnabled"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSectionProvider:configuration:", &__block_literal_global_99, v2);

  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  }
  return v3;
}

id __51__VUILibraryiOSMenuCollectionConfiguration__layout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC4098];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAppearanceStyle:layoutEnvironment:", 3, v5);
  objc_msgSend(v6, "setAppearanceStyle:", 3);
  objc_msgSend(v6, "setSeparatorStyle:", 0);
  if (a2)
    objc_msgSend(v6, "setStylesFirstItemAsHeader:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4090]), "initWithConfiguration:layoutEnvironment:", v6, v5);

  return v7;
}

- (UICollectionViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemSizingCell, a3);
}

- (BOOL)isDesignedForIpadEnabled
{
  return self->_isDesignedForIpadEnabled;
}

- (void)setIsDesignedForIpadEnabled:(BOOL)a3
{
  self->_isDesignedForIpadEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItemSizingCell, 0);
}

@end
