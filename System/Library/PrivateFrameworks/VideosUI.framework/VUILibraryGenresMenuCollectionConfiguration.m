@implementation VUILibraryGenresMenuCollectionConfiguration

- (id)generateCollectionView
{
  VUILegacyCollectionView *v2;
  id v3;
  VUILegacyCollectionView *v4;
  void *v5;
  void *v6;

  v2 = [VUILegacyCollectionView alloc];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v4 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v2, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[VUILegacyCollectionView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[VUILegacyCollectionView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
  -[VUILegacyCollectionView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
  -[VUILegacyCollectionView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
  -[VUILegacyCollectionView setBackgroundColor:](v4, "setBackgroundColor:", 0);
  -[VUILegacyCollectionView setOpaque:](v4, "setOpaque:", 0);
  -[VUILegacyCollectionView registerClass:forCellWithReuseIdentifier:](v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("MenuCellIdentifier"));
  -[VUILegacyCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("MenuSectionHeaderCellIdentifier"));
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"Genres\"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v6);

  return v4;
}

- (id)configureCollectionViewCellForCollectionView:(id)a3 ForItem:(id)a4 AtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("MenuCellIdentifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "section"))
  {
    objc_msgSend(v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "section") == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "valueForKey:", CFSTR("title"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForKey:", CFSTR("type"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          VUILibraryGenreImageNameFromGenre(objc_msgSend(v13, "integerValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
        v12 = 0;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColor:", v18);

    }
    else
    {
      v12 = v7;
      v15 = 0;
    }
    objc_msgSend(v9, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v12, v11, v19);

    objc_msgSend(v9, "setImageName:", v15);
  }
  else
  {
    VUILibraryCategoryStringFromType(objc_msgSend(v7, "unsignedIntegerValue"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v12, v11, v16);

  }
  objc_msgSend(v9, "setHideChevron:", 0);

  return v9;
}

- (id)configureSizingCellForItem:(id)a3 AtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VUILibraryMenuItemViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[VUILibraryGenresMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(VUILibraryMenuItemViewCell);
    -[VUILibraryGenresMenuCollectionConfiguration setMenuItemSizingCell:](self, "setMenuItemSizingCell:", v9);

  }
  if (objc_msgSend(v7, "section"))
  {
    -[VUILibraryGenresMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryGenresMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v12, v14);
  }
  else
  {
    VUILibraryCategoryStringFromType(objc_msgSend(v6, "unsignedIntegerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryGenresMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryGenresMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v10, v13, v16);

  }
  -[VUILibraryGenresMenuCollectionConfiguration menuItemSizingCell](self, "menuItemSizingCell");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)minimumLineSpacing
{
  return 0.0;
}

- (Class)classForCollectionViewCell
{
  return (Class)objc_opt_class();
}

- (VUILibraryMenuItemViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemSizingCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItemSizingCell, 0);
}

@end
