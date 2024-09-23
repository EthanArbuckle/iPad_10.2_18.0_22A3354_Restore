@implementation SHSheetContentLayoutProvider

- (SHSheetContentLayoutProvider)initWithLayoutSpec:(id)a3
{
  id v5;
  SHSheetContentLayoutProvider *v6;
  SHSheetContentLayoutProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetContentLayoutProvider;
  v6 = -[SHSheetContentLayoutProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layoutSpec, a3);

  return v7;
}

- (int64_t)_sectionForContext:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SHSheetContentCustomViewSectionIdentifier")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SHSheetContentAppsSectionIdentifier")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("SHSheetContentEmbeddedActionsSectionIdentifier")) & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("SHSheetContentHeroActionsSectionIdentifier"))
         && (objc_msgSend(v3, "enableHeroActions") & 1) != 0)
  {
    v5 = 4;
  }
  else
  {
    v5 = 5;
  }

  return v5;
}

- (id)layoutSectionForContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  switch(-[SHSheetContentLayoutProvider _sectionForContext:](self, "_sectionForContext:", v4))
  {
    case 0:
      -[SHSheetContentLayoutProvider _layoutForCustomViewSectionWithContext:](self, "_layoutForCustomViewSectionWithContext:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[SHSheetContentLayoutProvider _layoutForPeopleSectionWithContext:](self, "_layoutForPeopleSectionWithContext:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
    case 3:
      -[SHSheetContentLayoutProvider _layoutForAppsSectionWithContext:](self, "_layoutForAppsSectionWithContext:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[SHSheetContentLayoutProvider _layoutForHeroActionsSectionWithContext:](self, "_layoutForHeroActionsSectionWithContext:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      -[SHSheetContentLayoutProvider _layoutForActionsSectionWithContext:](self, "_layoutForActionsSectionWithContext:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_layoutForCustomViewSectionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetContentLayoutProvider layoutSpec](self, "layoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3340];
  objc_msgSend(v5, "customViewSectionHeight");
  objc_msgSend(v7, "absoluteDimension:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v6, v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3350];
  v26 = (void *)v9;
  v29[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "horizontalGroupWithLayoutSize:subitems:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customViewVerticalInset");
  v16 = v15;
  objc_msgSend(v5, "customViewVerticalInset");
  objc_msgSend(v14, "setContentInsets:", v16, 0.0, v17, 0.0);
  objc_msgSend(v4, "environment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "verticalSizeClass");

  LODWORD(v18) = objc_msgSend(v4, "enableSectionFooter");
  if ((_DWORD)v18 && v20 != 1)
  {
    v21 = (void *)MEMORY[0x1E0DC3340];
    objc_msgSend(v5, "estimatedFooterHeight");
    objc_msgSend(v21, "absoluteDimension:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSheetContentLayoutProvider _createFooterSupplementaryItemWithHeightDimension:](SHSheetContentLayoutProvider, "_createFooterSupplementaryItemWithHeightDimension:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBoundarySupplementaryItems:", v24);

    objc_msgSend(v14, "setSupplementariesFollowContentInsets:", 0);
  }

  return v14;
}

- (id)_layoutForPeopleSectionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[SHSheetContentLayoutProvider layoutSpec](self, "layoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleIconWidth");
  -[SHSheetContentLayoutProvider _createHorizontalLayoutSectionWithContext:iconWidth:](self, "_createHorizontalLayoutSectionWithContext:iconWidth:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupplementariesFollowContentInsets:", 0);
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "enableTopContentSectionText"))
  {
    v8 = (void *)MEMORY[0x1E0DC3340];
    objc_msgSend(v5, "estimatedHeaderHeight");
    objc_msgSend(v8, "estimatedDimension:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSheetContentLayoutProvider _createHeaderSupplementaryItemWithHeightDimension:](SHSheetContentLayoutProvider, "_createHeaderSupplementaryItemWithHeightDimension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v10);
  }
  if (objc_msgSend(v4, "enableSectionFooter"))
  {
    v11 = (void *)MEMORY[0x1E0DC3340];
    objc_msgSend(v5, "estimatedFooterHeight");
    objc_msgSend(v11, "absoluteDimension:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSheetContentLayoutProvider _createFooterSupplementaryItemWithHeightDimension:](SHSheetContentLayoutProvider, "_createFooterSupplementaryItemWithHeightDimension:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v13);
  }
  objc_msgSend(v6, "setBoundarySupplementaryItems:", v7);

  return v6;
}

- (id)_layoutForAppsSectionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetContentLayoutProvider layoutSpec](self, "layoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingAppIconWidth");
  -[SHSheetContentLayoutProvider _createHorizontalLayoutSectionWithContext:iconWidth:](self, "_createHorizontalLayoutSectionWithContext:iconWidth:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("SHSheetContentPeopleSectionIdentifier"));

  LODWORD(v7) = objc_msgSend(v4, "enableTopContentSectionText");
  if ((_DWORD)v7 && (v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0DC3340];
    objc_msgSend(v5, "estimatedHeaderHeight");
    objc_msgSend(v10, "estimatedDimension:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSheetContentLayoutProvider _createHeaderSupplementaryItemWithHeightDimension:](SHSheetContentLayoutProvider, "_createHeaderSupplementaryItemWithHeightDimension:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBoundarySupplementaryItems:", v13);

    objc_msgSend(v6, "setSupplementariesFollowContentInsets:", 0);
  }

  return v6;
}

- (id)_layoutForHeroActionsSectionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
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
  double v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void *v50;
  id v51;
  SHSheetContentLayoutProvider *v52;
  double v53;
  double v54;
  double v55;
  double v56;

  v4 = a3;
  -[SHSheetContentLayoutProvider layoutSpec](self, "layoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectiveContentSize");
  v9 = v8;

  objc_msgSend(v4, "viewDirectionalLayoutMargins");
  v11 = v10;
  objc_msgSend(v6, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInsets");
  v14 = v11 - v13;

  objc_msgSend(v4, "viewDirectionalLayoutMargins");
  v16 = v15;
  objc_msgSend(v6, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentInsets");
  v19 = v16 - v18;

  objc_msgSend(v5, "heroActionItemSpacing");
  v21 = v20;
  v47 = MEMORY[0x1E0C809B0];
  v48 = 3221225472;
  v49 = __72__SHSheetContentLayoutProvider__layoutForHeroActionsSectionWithContext___block_invoke;
  v50 = &unk_1E40018F8;
  v53 = v9;
  v54 = v14;
  v55 = v19;
  v56 = v20;
  v22 = v4;
  v51 = v22;
  v52 = self;
  v23 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A1AE9514](&v47);
  objc_msgSend(v22, "dataSourceSnapshot", v47, v48, v49, v50);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "numberOfItemsInSection:", v25);

  v27 = objc_msgSend(v5, "shouldUseNarrowLayoutForHeroActionsWithContainerWidth:", v9);
  v28 = 2;
  if (v26 < 2)
    v28 = v26;
  if (v27)
    v29 = v28;
  else
    v29 = v26;
  v30 = v23[2](v23, v29);
  if (v29 >= 3 && v30 >= 3)
  {
    v29 = 2;
    v30 = v23[2](v23, 2);
  }
  +[UIActivityHeroActionCell heightForNumberOfLines:](UIActivityHeroActionCell, "heightForNumberOfLines:", (double)v30);
  v32 = v31;
  v33 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sizeWithWidthDimension:heightDimension:", v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sizeWithWidthDimension:heightDimension:", v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v41, v37, v29);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v21);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterItemSpacing:", v43);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setInterGroupSpacing:", v21);
  objc_msgSend(v5, "actionInterGroupInset");
  objc_msgSend(v44, "setContentInsets:", v14, v14, v45, v19);

  return v44;
}

uint64_t __72__SHSheetContentLayoutProvider__layoutForHeroActionsSectionWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  int64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "dataSourceSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiersInSectionWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = (v4 - v5 - v7 - v6 * (double)(a2 - 1)) / (double)a2;
    v15 = *(_QWORD *)v24;
    v16 = 1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "delegate", (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "titleForItemIdentifier:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = +[UIActivityHeroActionCell numberOfLinesForTitle:itemWidth:](UIActivityHeroActionCell, "numberOfLinesForTitle:itemWidth:", v20, v14);
        if (v16 <= v21)
          v16 = v21;

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (NSDirectionalEdgeInsets)_resolvedDirectionalLayoutMargins:(double)a3 trailingMargin:(double)a4
{
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSDirectionalEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 6)
    v8 = 24.0;
  else
    v8 = a4;
  if (v7 == 6)
    v9 = 24.0;
  else
    v9 = a3;
  v10 = 0.0;
  v11 = 0.0;
  result.trailing = v8;
  result.bottom = v11;
  result.leading = v9;
  result.top = v10;
  return result;
}

- (id)_layoutForActionsSectionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  char v42;
  double v43;
  void *v44;
  char v45;
  void *v46;
  int v47;
  double v48;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetContentLayoutProvider layoutSpec](self, "layoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionsLayoutSectionConfigurationWithEnvironment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0DC4090]);
  objc_msgSend(v4, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithConfiguration:layoutEnvironment:", v7, v9);

  objc_msgSend(v10, "setContentInsetsReference:", 2);
  objc_msgSend(v4, "sectionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", v14) & 1) != 0)
  {

  }
  else
  {
    v15 = objc_msgSend(v11, "hasPrefix:", CFSTR("SHSheetContentInformationalActionsSectionIdentifier_"));

    if ((v15 & 1) == 0)
      goto LABEL_5;
  }
  v16 = (void *)MEMORY[0x1E0DC3340];
  objc_msgSend(v5, "estimatedActionFooterHeight");
  objc_msgSend(v16, "estimatedDimension:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetContentLayoutProvider _createFooterSupplementaryItemWithHeightDimension:](SHSheetContentLayoutProvider, "_createFooterSupplementaryItemWithHeightDimension:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v50[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBoundarySupplementaryItems:", v19);

  objc_msgSend(v10, "setSupplementariesFollowContentInsets:", 1);
LABEL_5:
  v20 = objc_msgSend(v13, "indexOfObject:", v11);
  if (v20)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", v20 - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SHSheetContentCustomViewSectionIdentifier")) & 1) != 0
      || (v22 = 0.0, objc_msgSend(v21, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier"))))
    {
      objc_msgSend(v5, "actionInterGroupInset");
      v22 = v23;
    }

  }
  else
  {
    v22 = 0.0;
  }
  objc_msgSend(v4, "viewDirectionalLayoutMargins");
  v25 = v24;
  objc_msgSend(v4, "environment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "container");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentInsets");
  v29 = v25 - v28;

  objc_msgSend(v4, "viewDirectionalLayoutMargins");
  v31 = v30;
  objc_msgSend(v4, "environment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "container");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentInsets");
  v35 = v31 - v34;

  -[SHSheetContentLayoutProvider _resolvedDirectionalLayoutMargins:trailingMargin:](self, "_resolvedDirectionalLayoutMargins:trailingMargin:", v29, v35);
  v37 = v36;
  v39 = v38;
  objc_msgSend(v13, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", v40) & 1) != 0)
  {
    objc_msgSend(v13, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v11, "isEqualToString:", v41);

    v43 = 0.0;
    if ((v42 & 1) != 0)
      goto LABEL_19;
  }
  else
  {

  }
  objc_msgSend(v13, "lastObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v11, "isEqualToString:", v44);

  v43 = 0.0;
  if ((v45 & 1) != 0)
  {
    v29 = v22;
  }
  else
  {
    objc_msgSend(v13, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v11, "isEqualToString:", v46);

    objc_msgSend(v5, "actionInterGroupInset");
    v43 = v48;
    if (!v47)
      v29 = v22;
  }
LABEL_19:
  objc_msgSend(v10, "setContentInsets:", v29, v37, v43, v39);

  return v10;
}

- (id)_createHorizontalLayoutSectionWithContext:(id)a3 iconWidth:(double)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SHSheetContentLayoutProvider layoutSpec](self, "layoutSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAccessibilityContentSize");
  objc_msgSend(v6, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectiveContentSize");
  v12 = v11;

  objc_msgSend(v6, "viewDirectionalLayoutMargins");
  v14 = v13;
  objc_msgSend(v6, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInsets");
  v18 = v14 - v17;

  objc_msgSend(v7, "horizontalCellWidthForContentWidth:sizeOffset:", v12, v18);
  v20 = v19;
  objc_msgSend(v7, "peopleSectionHeight");
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeWithWidthDimension:heightDimension:", v25, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
  {
    v28 = 2;
    v29 = v18;
  }
  else
  {
    v30 = objc_msgSend(v7, "numberOfHorizontalItemsPerGroupForContentWidth:", v12);
    if (v30 == 3)
      v31 = v20 * 0.5;
    else
      v31 = v18 + 1.0 + (v20 - a4) * 0.5;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "userInterfaceIdiom");

    if (v33 == 6)
    {
      v18 = 16.0;
      if (objc_msgSend(v7, "deviceClass") == 10)
        v29 = 24.0;
      else
        v29 = 16.0;
      v34 = (double)v30;
    }
    else
    {
      v29 = v18 + -1.0 + (v20 - a4) * -0.5;
      v34 = (double)v30;
      v18 = (v12 - v29 - v31 - v20 * (double)v30) / (double)v30;
    }
    v20 = v18 * (double)(v30 - 1) + v20 * v34;
    v28 = 1;
  }
  v35 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v22);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sizeWithWidthDimension:heightDimension:", v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0DC3350];
  v46[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "horizontalGroupWithLayoutSize:subitems:", v38, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v18);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setInterItemSpacing:", v42);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setInterGroupSpacing:", v18);
  objc_msgSend(v7, "horizontalSectionBottomInset");
  objc_msgSend(v43, "setContentInsets:", 0.0, v29, v44, v29);
  objc_msgSend(v43, "setOrthogonalScrollingBehavior:", v28);

  return v43;
}

+ (id)_createHeaderSupplementaryItemWithHeightDimension:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC3370];
  v4 = (void *)MEMORY[0x1E0DC3340];
  v5 = a3;
  objc_msgSend(v4, "fractionalWidthDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v7, CFSTR("UIActivityContentHeaderSectionKind"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_createFooterSupplementaryItemWithHeightDimension:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC3370];
  v4 = (void *)MEMORY[0x1E0DC3340];
  v5 = a3;
  objc_msgSend(v4, "fractionalWidthDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v7, CFSTR("UIActivityContentFooterSectionKind"), 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (void)setLayoutSpec:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSpec, a3);
}

- (SHSheetContentLayoutDelegate)delegate
{
  return (SHSheetContentLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
}

@end
