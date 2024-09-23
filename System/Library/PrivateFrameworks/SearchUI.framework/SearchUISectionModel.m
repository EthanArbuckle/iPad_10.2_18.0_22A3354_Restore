@implementation SearchUISectionModel

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  BOOL v13;
  int64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  int v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  SearchUISectionModel *v54;
  int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUISectionModel section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  -[SearchUISectionModel section](self, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.other:show_more"));

  if (!TLKSnippetModernizationEnabled())
  {
LABEL_38:
    if (!-[SearchUISectionModel drawPlattersIfNecessary](self, "drawPlattersIfNecessary")
      && (objc_msgSend(v4, "shouldUseInsetRoundedSections") & 1) != 0)
    {
      v14 = 5;
      goto LABEL_44;
    }
    if ((objc_msgSend(v4, "shouldUseInsetRoundedSections") & 1) == 0)
    {
      -[SearchUISectionModel rowModels](self, "rowModels");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "cardSection");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v14 = objc_opt_isKindOfClass() & 1;

      goto LABEL_44;
    }
    goto LABEL_42;
  }
  -[SearchUISectionModel rowModels](self, "rowModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = +[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad");

    if (v13)
    {
      v14 = 2;
      goto LABEL_44;
    }
  }
  else
  {

  }
  -[SearchUISectionModel rowModels](self, "rowModels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v7)
      v14 = 1;
    else
      v14 = 5;
    goto LABEL_44;
  }
  if ((v10 & 1) != 0
    || -[SearchUISectionModel shouldInsetGroupedCollectionStyle](self, "shouldInsetGroupedCollectionStyle"))
  {
LABEL_42:
    v14 = 1;
    goto LABEL_44;
  }
  v49 = v4;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backgroundColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUISectionModel rowModels](self, "rowModels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identifyingResult");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUISectionModel rowModels](self, "rowModels");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "fillsBackgroundWithContent");

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[SearchUISectionModel rowModels](self, "rowModels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  v54 = self;
  if (!v25)
  {
    LOBYTE(v55) = 0;
    LOBYTE(v27) = 0;
    goto LABEL_33;
  }
  v26 = v25;
  v55 = 0;
  LOBYTE(v27) = 0;
  v28 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v57 != v28)
        objc_enumerationMutation(obj);
      v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      -[SearchUISectionModel rowModels](self, "rowModels");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v30, "isEqual:", v32);

      if ((v33 & 1) == 0)
      {
        v34 = objc_msgSend(v30, "fillsBackgroundWithContent");
        v35 = v55;
        if ((v55 & 1) != 0)
        {
          v36 = 0;
          goto LABEL_26;
        }
        if (v52 || (objc_msgSend(v30, "backgroundColor"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v30, "backgroundColor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v52, "isEqual:", v37) ^ 1;

          v35 = v55;
          if (!v52)
LABEL_25:

LABEL_26:
          v24 &= v34;
          v55 = v36 | v35;
          if ((v27 & 1) != 0)
          {
            LOBYTE(v27) = 1;
          }
          else
          {
            objc_msgSend(v30, "identifyingResult");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v51, "isEqual:", v38) ^ 1;

          }
          goto LABEL_29;
        }
        v50 = 0;
        v36 = 0;
        goto LABEL_25;
      }
LABEL_29:
      self = v54;
    }
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  }
  while (v26);
LABEL_33:

  -[SearchUISectionModel rowModels](self, "rowModels");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUISectionModel rowModels](self, "rowModels");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "useCompactVersionOfUI");

  }
  else
  {
    v43 = 0;
  }

  if (v43 & 1 | (((v7 | v24) & 1) == 0) | v27 & 1)
  {

    v4 = v49;
    self = v54;
    goto LABEL_38;
  }
  -[SearchUISectionModel rowModels](v54, "rowModels");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v49;
  if (((unint64_t)objc_msgSend(v48, "count") < 2) | v55 & 1)
    v14 = objc_msgSend(v49, "inPreviewPlatter") ^ 1;
  else
    v14 = 4;

LABEL_44:
  return v14;
}

- (NSArray)rowModels
{
  return self->_rowModels;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SearchUISectionModel section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (SearchUISection)section
{
  return self->_section;
}

- (int)separatorStyleForIndex:(unint64_t)a3 shouldDrawTopAndBottomSeparators:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a4;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchui_safeObjectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUISectionModel rowModels](self, "rowModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchui_safeObjectAtIndex:", a3 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "separatorStyle");
  if (!v10 && !v4
    || objc_msgSend(v8, "fillsBackgroundWithContent")
    && !-[SearchUISectionModel shouldInsetGroupedCollectionStyle](self, "shouldInsetGroupedCollectionStyle"))
  {
    goto LABEL_3;
  }
  if (v11 == 3)
    goto LABEL_15;
  if (v11)
    goto LABEL_12;
  if ((objc_msgSend(v10, "prefersNoSeparatorAbove") & 1) == 0)
  {
LABEL_15:
    if (objc_msgSend(v10, "hasLeadingImage"))
      v11 = 3;
    else
      v11 = 2;
  }
  else
  {
LABEL_3:
    v11 = 1;
  }
LABEL_12:

  return v11;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unsigned __int8 isKindOfClass;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  BOOL v39;
  char v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v8 = a3;
  v9 = a4;
  v34 = a5;
  v10 = objc_msgSend(v9, "shouldUseInsetRoundedSections");
  -[SearchUISectionModel rowModels](self, "rowModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v12;
  objc_msgSend(v12, "cardSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = TLKSnippetModernizationEnabled() ^ 1;
  else
    v14 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();
  objc_msgSend(v8, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v10)
  {
    if (((-[SearchUISectionModel drawPlattersIfNecessary](self, "drawPlattersIfNecessary") | v14) & 1) != 0)
    {
LABEL_6:
      v19 = 2;
      goto LABEL_11;
    }
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_6;
  }
  if (((isKindOfClass | v16) & 1) != 0)
    v19 = 2;
  else
    v19 = 1;
LABEL_11:
  v20 = v18 == 3;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", v19);
  +[SearchUIAutoLayout sectionCornerRadius](SearchUIAutoLayout, "sectionCornerRadius");
  objc_msgSend(v21, "_setCornerRadius:");
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B8]), "initWithListAppearance:", v19);
  objc_msgSend(v9, "appearance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUISeparatorView separatorColorForAppearance:](SearchUISeparatorView, "separatorColorForAppearance:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setColor:", v24);

  objc_msgSend(v21, "setSeparatorConfiguration:", v22);
  v25 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke;
  v44[3] = &unk_1EA1F86D8;
  v26 = v34;
  v45 = v26;
  v27 = v9;
  v46 = v27;
  objc_msgSend(v21, "setLeadingSwipeActionsConfigurationProvider:", v44);
  v41[0] = v25;
  v41[1] = 3221225472;
  v41[2] = __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_2;
  v41[3] = &unk_1EA1F86D8;
  v28 = v26;
  v42 = v28;
  v29 = v27;
  v43 = v29;
  objc_msgSend(v21, "setTrailingSwipeActionsConfigurationProvider:", v41);
  v36[0] = v25;
  v36[1] = 3221225472;
  v36[2] = __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_3;
  v36[3] = &unk_1EA1F8700;
  v39 = v20;
  v40 = v10;
  v37 = v28;
  v38 = v29;
  v30 = v29;
  v31 = v28;
  objc_msgSend(v21, "setItemSeparatorHandler:", v36);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v21, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDecorationItems:", MEMORY[0x1E0C9AA60]);
  -[SearchUISectionModel reloadCornerMaskingOverrideWithAttributes:](self, "reloadCornerMaskingOverrideWithAttributes:", v30);

  return v32;
}

- (void)reloadCornerMaskingOverrideWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUISectionModel rowModels](self, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "isEqual:", v8) & 1) == 0
    && +[SearchUISectionBackgroundStyleUtilities backgroundStyleNeedsInset:](SearchUISectionBackgroundStyleUtilities, "backgroundStyleNeedsInset:", -[SearchUISectionModel sectionBackgroundStyleWithAttributes:](self, "sectionBackgroundStyleWithAttributes:", v4)))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SearchUISectionModel rowModels](self, "rowModels", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v14, "setCornerMask:", 0);
          objc_msgSend(v14, "setHasCustomCornerRounding:", 1);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "setCornerMask:", objc_msgSend(v6, "cornerMask") | 3);
    objc_msgSend(v6, "setHasCustomCornerRounding:", 1);
    objc_msgSend(v8, "setCornerMask:", objc_msgSend(v8, "cornerMask") | 0xC);
    objc_msgSend(v8, "setHasCustomCornerRounding:", 1);
  }

}

- (BOOL)drawPlattersIfNecessary
{
  return self->_drawPlattersIfNecessary;
}

id __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "separatorStyleForIndex:", objc_msgSend(v5, "item"));
  v9 = objc_msgSend(v5, "row");
  objc_msgSend(v7, "rowModels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForIndex:", objc_msgSend(v5, "section") + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "row") && (objc_msgSend(MEMORY[0x1E0DBDA48], "isWatchOS") & 1) == 0)
    v13 = 2 * *(unsigned __int8 *)(a1 + 48);
  else
    v13 = 2;
  v14 = v11 - 1;
  objc_msgSend(v6, "setTopSeparatorVisibility:", v13);
  if (v8 == 1
    || (objc_msgSend(v7, "drawPlattersIfNecessary") & 1) == 0
    && !*(_BYTE *)(a1 + 49)
    && v9 == v14
    && (objc_msgSend(v12, "drawPlattersIfNecessary") & 1) != 0)
  {
    v15 = 2;
  }
  else
  {
    v15 = 2 * *(unsigned __int8 *)(a1 + 48);
  }
  objc_msgSend(v6, "setBottomSeparatorVisibility:", v15);
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfSections");

  if (v9 == v14)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasFooter"))
    {
      v18 = objc_msgSend(v5, "section");
      if (v17 >= 2 && v18 == v17 - 1)
        objc_msgSend(v6, "setBottomSeparatorVisibility:", 0);
    }
  }

  return v6;
}

- (int)separatorStyleForIndex:(unint64_t)a3
{
  return -[SearchUISectionModel separatorStyleForIndex:shouldDrawTopAndBottomSeparators:](self, "separatorStyleForIndex:shouldDrawTopAndBottomSeparators:", a3, 0);
}

- (BOOL)shouldHeightMatchSection
{
  return 0;
}

+ (SearchUISectionModel)sectionModelWithRows:(id)a3 drawPlattersIfNecessary:(BOOL)a4 section:(id)a5 expandedCollectionSections:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  SearchUISectionModel *v16;

  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v11, "collectionSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionStyle");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend((id)v13, "initiallyVisibleCardSectionCount");

  LOBYTE(v13) = objc_msgSend(v10, "containsObject:", v12);
  if ((v13 & 1) == 0 && v14 && objc_msgSend(v9, "count") > v14)
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v15;
  }
  v16 = -[SearchUISectionModel initWithRowModels:section:]([SearchUISectionModel alloc], "initWithRowModels:section:", v9, v11);

  -[SearchUISectionModel setDrawPlattersIfNecessary:](v16, "setDrawPlattersIfNecessary:", v8);
  return v16;
}

- (void)setDrawPlattersIfNecessary:(BOOL)a3
{
  self->_drawPlattersIfNecessary = a3;
}

- (SearchUISectionModel)initWithRowModels:(id)a3 section:(id)a4
{
  id v7;
  id v8;
  SearchUISectionModel *v9;
  SearchUISectionModel *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SearchUISectionModel;
  v9 = -[SearchUISectionModel init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rowModels, a3);
    objc_storeStrong((id *)&v10->_section, a4);
    v10->_drawPlattersIfNecessary = 1;
    -[SearchUISectionModel backgroundColor](v10, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
            -[SearchUISectionModel backgroundColor](v10, "backgroundColor", (_QWORD)v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setBackgroundColor:", v18);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v14);
      }

    }
  }

  return v10;
}

- (id)backgroundColor
{
  void *v3;
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

  -[SearchUISectionModel asyncLoader](self, "asyncLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUISectionModel asyncLoader](self, "asyncLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUISectionModel section](self, "section");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SearchUISectionModel rowModels](self, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifyingResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (backgroundColor_onceToken != -1)
    dispatch_once(&backgroundColor_onceToken, &__block_literal_global_36);
  if (!objc_msgSend((id)backgroundColor_legacyAllowList, "containsObject:", v10) || v5)
  {
LABEL_11:
    if (v5)
      goto LABEL_21;
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v8, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "backgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
LABEL_12:
  -[SearchUISectionModel section](self, "section");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resultSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") >= 2
    && objc_msgSend(v14, "count") == 1
    && (objc_msgSend(v8, "isTopHit") & 1) != 0)
  {
    objc_msgSend(v16, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_21;
  }
  else
  {

  }
  if (-[SearchUISectionModel shouldInsetGroupedCollectionStyle](self, "shouldInsetGroupedCollectionStyle"))
  {
    +[SearchUIBackgroundColorUtilities disambiguationInnerPlatterColor](SearchUIBackgroundColorUtilities, "disambiguationInnerPlatterColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_21:

  return v5;
}

- (void)prepareForSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchUIAsyncSectionLoader *v10;
  SearchUIAsyncSectionLoader *asyncLoader;
  void *v12;
  id v13;

  -[SearchUISectionModel asyncLoader](self, "asyncLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SearchUISectionModel rowModels](self, "rowModels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUISectionModel rowModels](self, "rowModels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAsyncSectionLoader asyncLoaderSupportingSectionModel:result:queryId:](SearchUIAsyncSectionLoader, "asyncLoaderSupportingSectionModel:result:queryId:", self, v7, objc_msgSend(v9, "queryId"));
    v10 = (SearchUIAsyncSectionLoader *)objc_claimAutoreleasedReturnValue();
    asyncLoader = self->_asyncLoader;
    self->_asyncLoader = v10;

    -[SearchUISectionModel asyncLoader](self, "asyncLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SearchUISectionModel asyncLoader](self, "asyncLoader");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preloadIfNecessary");

    }
  }
}

- (SearchUIAsyncSectionLoader)asyncLoader
{
  return self->_asyncLoader;
}

- (BOOL)shouldLeaveSpaceForChevronForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchui_safeObjectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0
      && -[SearchUISectionModel shouldDisplayChevronForIndex:nextCardsEnabled:](self, "shouldDisplayChevronForIndex:nextCardsEnabled:", a3 + 1, 1);
}

- (BOOL)shouldDisplayChevronForIndex:(unint64_t)a3 nextCardsEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchui_safeObjectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUISectionModel rowModels](self, "rowModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchui_safeObjectAtIndex:", a3 - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUISectionModel rowModels](self, "rowModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchui_safeObjectAtIndex:", a3 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = +[SearchUITableModel shouldDisplayChevronForRowModel:previousRowModel:nextRowModel:nextCardsEnabled:](SearchUITableModel, "shouldDisplayChevronForRowModel:previousRowModel:nextRowModel:nextCardsEnabled:", v8, v10, v12, v4);
  return v4;
}

- (id)overriddenAccessibilityIdentifier
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SearchUISectionModel section](self, "section");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (SearchUISectionModel)sectionModelWithGridRowModels:(id)a3 numberOfColumns:(int64_t)a4 gridStyle:(int)a5 section:(id)a6 expandedCollectionSections:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  SearchUIGridSectionModel *v18;

  v9 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a7;
  v13 = a6;
  objc_msgSend(v13, "collectionSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionStyle");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend((id)v15, "initiallyVisibleCardSectionCount");

  LOBYTE(v15) = objc_msgSend(v12, "containsObject:", v14);
  if ((v15 & 1) == 0 && v16 && objc_msgSend(v11, "count") > v16)
  {
    objc_msgSend(v11, "subarrayWithRange:", 0, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v17;
  }
  v18 = -[SearchUIGridSectionModel initWithRowModels:numberOfColumns:gridStyle:section:]([SearchUIGridSectionModel alloc], "initWithRowModels:numberOfColumns:gridStyle:section:", v11, a4, v9, v13);

  return (SearchUISectionModel *)v18;
}

+ (SearchUISectionModel)sectionModelWithScrollingRowModels:(id)a3 numberOfRows:(int64_t)a4 section:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SearchUIHorizontallyScrollingSectionModel *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
        else
        {
          objc_msgSend(v15, "horizontalRowModel", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17 = -[SearchUIHorizontallyScrollingSectionModel initWithRowModels:section:numberOfRows:]([SearchUIHorizontallyScrollingSectionModel alloc], "initWithRowModels:section:numberOfRows:", v9, v8, a4);
  return (SearchUISectionModel *)v17;
}

+ (int64_t)sectionType
{
  return 0;
}

void __39__SearchUISectionModel_backgroundColor__block_invoke()
{
  void *v0;

  v0 = (void *)backgroundColor_legacyAllowList;
  backgroundColor_legacyAllowList = (uint64_t)&unk_1EA228D38;

}

id __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForIndexPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "commandEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler swipeActionsForRowModel:isLeading:environment:](SearchUICommandHandler, "swipeActionsForRowModel:isLeading:environment:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForIndexPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "commandEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler swipeActionsForRowModel:isLeading:environment:](SearchUICommandHandler, "swipeActionsForRowModel:isLeading:environment:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)needsHeader
{
  void *v2;
  BOOL v3;

  -[SearchUISectionModel headerTitle](self, "headerTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)headerTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  -[SearchUISectionModel section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "collectionSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resultSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
LABEL_4:
        v9 = v8;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v8 = v6;
      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(v3, "resultSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)needsHeaderSeparator
{
  void *v2;
  void *v3;
  int v4;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchui_safeObjectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isTopHit") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "fillsBackgroundWithContent") ^ 1;

  return v4;
}

- (NSDirectionalEdgeInsets)headerInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSDirectionalEdgeInsets result;

  -[SearchUISectionModel horizontalInsetWithAttributes:forSupplementary:](self, "horizontalInsetWithAttributes:forSupplementary:", a3, 1);
  v6 = v5;
  v7 = 6.0;
  if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) == 0)
  {
    if (-[SearchUISectionModel needsHeaderSeparator](self, "needsHeaderSeparator"))
      v7 = 8.0;
    else
      v7 = 6.0;
  }
  -[SearchUISectionModel section](self, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = 0.0;
    else
      v12 = 5.0;

  }
  else
  {
    v12 = 0.0;
  }

  v13 = 12.0 - v12;
  v14 = v6;
  v15 = v7;
  v16 = v6;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (double)horizontalInsetWithAttributes:(id)a3 forSupplementary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  double Width;
  double v15;
  double v16;
  BOOL v17;
  CGRect v19;

  v4 = a4;
  v6 = a3;
  if (-[SearchUISectionModel shouldInsetGroupedCollectionStyle](self, "shouldInsetGroupedCollectionStyle"))
    +[SearchUIUtilities disambiguationTableCellContentInset](SearchUIUtilities, "disambiguationTableCellContentInset");
  else
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v8 = v7;
  if (objc_msgSend(v6, "shouldUseInsetRoundedSections"))
  {
    objc_msgSend(v6, "commandEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldUseStandardSectionInsets");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v6, "commandEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      Width = CGRectGetWidth(v19);
      +[SearchUI idealPlatterWidth](SearchUI, "idealPlatterWidth");
      v8 = (Width - v15) * 0.5;

      if (v8 < 8.0)
        v8 = 8.0;
    }
    v16 = v8 + 8.0;
    v17 = !v4;
  }
  else
  {
    if (v4
      || +[SearchUISectionBackgroundStyleUtilities backgroundStyleNeedsInset:](SearchUISectionBackgroundStyleUtilities, "backgroundStyleNeedsInset:", -[SearchUISectionModel sectionBackgroundStyleWithAttributes:](self, "sectionBackgroundStyleWithAttributes:", v6)))
    {
      goto LABEL_14;
    }
    v17 = -[SearchUISectionModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) == 0;
    v16 = 0.0;
  }
  if (!v17)
    v8 = v16;
LABEL_14:

  return v8;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSDirectionalEdgeInsets result;

  v6 = a3;
  v7 = -[SearchUISectionModel needsHeader](self, "needsHeader")
    || -[SearchUISectionModel needsHeaderSeparator](self, "needsHeaderSeparator")
    || -[SearchUISectionModel shouldInsetGroupedCollectionStyle](self, "shouldInsetGroupedCollectionStyle");
  -[SearchUISectionModel horizontalInsetWithAttributes:forSupplementary:](self, "horizontalInsetWithAttributes:forSupplementary:", v6, 0);
  v9 = v8;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "shouldUseInsetRoundedSections"))
  {
    v12 = 0.0;
    if (v7)
      v13 = 0.0;
    else
      v13 = 4.0;
  }
  else
  {
    v14 = -[SearchUISectionModel sectionBackgroundStyleWithAttributes:](self, "sectionBackgroundStyleWithAttributes:", v6);
    if (+[SearchUISectionBackgroundStyleUtilities backgroundStyleNeedsInset:](SearchUISectionBackgroundStyleUtilities, "backgroundStyleNeedsInset:", v14))
    {
      -[SearchUISectionModel section](self, "section");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sectionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

      if (!objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS")
        || (v13 = 12.0,
            -[SearchUISectionModel shouldInsetGroupedCollectionStyle](self, "shouldInsetGroupedCollectionStyle")))
      {
        objc_msgSend(v11, "cardSection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = 12.0;
        else
          v13 = 0.0;

      }
      v19 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
      v20 = 8.0;
      if (v17)
        v20 = 16.0;
      if (v19)
        v12 = 2.0;
      else
        v12 = v20;
      if (v14 == 2)
      {
        objc_opt_class();
        v12 = 0.0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = 0.0;
      }
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
        v21 = 2.0;
      else
        v21 = 4.0;
      if (v7)
        v22 = 0.0;
      else
        v22 = 8.0;
      v23 = objc_msgSend(v11, "fillsBackgroundWithContent");
      v24 = v22 + 8.0;
      if (!a4)
        v24 = 0.0;
      if (((a4 == 0) & v23) != 0)
        v12 = 0.0;
      else
        v12 = v21;
      if (v23)
        v13 = v24;
      else
        v13 = v22;
    }
  }

  v25 = v13;
  v26 = v9;
  v27 = v12;
  v28 = v9;
  result.trailing = v28;
  result.bottom = v27;
  result.leading = v26;
  result.top = v25;
  return result;
}

- (BOOL)needsHorizontalNavigation
{
  return 0;
}

- (BOOL)selfSizingInTwoAxes
{
  return 0;
}

- (BOOL)shouldInsetGroupedCollectionStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SearchUISectionModel section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "collectionSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "collectionSection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "collectionStyle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isInsetGrouped");

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SearchUISectionModel section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | identifier: %@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithRowModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[SearchUISectionModel copy](self, "copy");
  objc_msgSend(v5, "setRowModels:", v4);
  -[SearchUISectionModel backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
          -[SearchUISectionModel backgroundColor](self, "backgroundColor", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBackgroundColor:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDrawPlattersIfNecessary:", -[SearchUISectionModel drawPlattersIfNecessary](self, "drawPlattersIfNecessary"));
  -[SearchUISectionModel section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSection:", v5);

  -[SearchUISectionModel rowModels](self, "rowModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setRowModels:", v7);

  -[SearchUISectionModel asyncLoader](self, "asyncLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsyncLoader:", v8);

  return v4;
}

- (void)setRowModels:(id)a3
{
  objc_storeStrong((id *)&self->_rowModels, a3);
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (void)setAsyncLoader:(id)a3
{
  objc_storeStrong((id *)&self->_asyncLoader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncLoader, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_rowModels, 0);
}

@end
