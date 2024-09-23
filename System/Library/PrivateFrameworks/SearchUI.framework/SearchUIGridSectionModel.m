@implementation SearchUIGridSectionModel

+ (int64_t)sectionType
{
  return 1;
}

- (SearchUIGridSectionModel)initWithRowModels:(id)a3 numberOfColumns:(int64_t)a4 gridStyle:(int)a5 section:(id)a6
{
  uint64_t v6;
  SearchUIGridSectionModel *v8;
  SearchUIGridSectionModel *v9;
  objc_super v11;

  v6 = *(_QWORD *)&a5;
  v11.receiver = self;
  v11.super_class = (Class)SearchUIGridSectionModel;
  v8 = -[SearchUISectionModel initWithRowModels:section:](&v11, sel_initWithRowModels_section_, a3, a6);
  v9 = v8;
  if (v8)
  {
    -[SearchUIGridSectionModel setNumberOfColumns:](v8, "setNumberOfColumns:", a4);
    -[SearchUIGridSectionModel setGridStyle:](v9, "setGridStyle:", v6);
  }
  return v9;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  SearchUIGridSectionModel *v30;
  id v31;
  void *v32;

  v7 = a3;
  objc_msgSend(a5, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiersInSectionWithIdentifier:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SearchUIGridSectionModel numberOfColumns](self, "numberOfColumns");
  if (!v10)
  {
    objc_msgSend(v7, "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectiveContentSize");
    v13 = v12;

    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") && v13 > 500.0)
    {
      v10 = 6;
    }
    else if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad") && v13 > 500.0)
    {
      v10 = 5;
    }
    else if (objc_msgSend(MEMORY[0x1E0DBDA48], "isWatchOS"))
    {
      v10 = 2;
    }
    else
    {
      v10 = 4;
    }
  }
  objc_msgSend(v9, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cardSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v9, "count") == 1)
      v10 = 1;
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldFillAvailableSpace:", v10 == 1);

  }
  if (-[SearchUIGridSectionModel gridStyle](self, "gridStyle") == 1)
  {
    if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0)
    {
      v30 = self;
      v31 = v7;
      v10 = 3;
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isWatchOS") & 1) == 0)
      {
        -[SearchUIGridSectionModel setCornerMaskRulesOnRowModels:forColumnCount:](self, "setCornerMaskRulesOnRowModels:forColumnCount:", v9, v10);
        -[SearchUIGridSectionModel rfHeroImageGridLayouSectionForCardSection:](self, "rfHeroImageGridLayouSectionForCardSection:", v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      v30 = self;
      v31 = v7;
      v10 = 2;
    }
  }
  else
  {
    v30 = self;
    v31 = v7;
  }
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0 / (double)v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "searchUIGridSectionModel_useEstimatedHeight") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v17;
  }
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v32 = v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeWithWidthDimension:heightDimension:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v24, v20, v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0DC3378];
  objc_msgSend(v15, "searchUIGridSectionModel_interItemSpacing");
  objc_msgSend(v26, "fixedSpacing:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInterItemSpacing:", v27);

  v7 = v31;
  objc_msgSend(v15, "searchUIGridSectionModel_groupInsetFor:", v31);
  objc_msgSend(v25, "setContentInsets:");
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchUIGridSectionModel_interItemSpacing");
  objc_msgSend(v28, "setInterGroupSpacing:");
  -[SearchUIGridSectionModel setCornerMaskRulesOnRowModels:forColumnCount:](v30, "setCornerMaskRulesOnRowModels:forColumnCount:", v9, v10);

LABEL_23:
  return v28;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[SearchUISectionModel rowModels](self, "rowModels", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
      return 2;
    else
      return 4;
  }
  else
  {
    -[SearchUISectionModel rowModels](self, "rowModels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "searchUIGridSectionModel_useBackground"))
      v8 = 3;
    else
      v8 = 5;

  }
  return v8;
}

- (id)overriddenAccessibilityIdentifier
{
  return CFSTR("GridCell");
}

- (BOOL)needsHeaderSeparator
{
  return 0;
}

- (void)setCornerMaskRulesOnRowModels:(id)a3 forColumnCount:(unint64_t)a4
{
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  _QWORD v19[8];
  char v20;

  v18 = a3;
  if (-[SearchUIGridSectionModel gridStyle](self, "gridStyle") == 1
    && (objc_msgSend(MEMORY[0x1E0DBDA48], "isWatchOS") & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") ^ 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v18, "count");
  v8 = vcvtps_u32_f32((float)v7 / (float)a4);
  v9 = 1;
  if ((v6 & 1) != 0)
    v10 = 1;
  else
    v10 = v7 - 1;
  if ((v6 & 1) != 0)
  {
    v11 = v7 - 1;
  }
  else
  {
    v9 = a4 - 1;
    v11 = v8 * a4 - 1;
  }
  v12 = v8 - 1;
  if (v12)
    v13 = v9;
  else
    v13 = v10;
  if (v12)
    v14 = v11;
  else
    v14 = v7 - 1;
  v15 = v12 * a4;
  if (v6)
    v16 = 3;
  else
    v16 = v15;
  v17 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__SearchUIGridSectionModel_setCornerMaskRulesOnRowModels_forColumnCount___block_invoke;
  v19[3] = &__block_descriptor_65_e33_v32__0__SearchUIRowModel_8Q16_B24l;
  v20 = v17 ^ 1;
  v19[4] = 0;
  v19[5] = v13;
  v19[6] = v14;
  v19[7] = v16;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v19);

}

void __73__SearchUIGridSectionModel_setCornerMaskRulesOnRowModels_forColumnCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (*(_QWORD *)(a1 + 32) == a3)
  {
    if (*(_BYTE *)(a1 + 64))
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  if (*(_QWORD *)(a1 + 40) == a3)
  {
    v4 = 1;
    if (!*(_BYTE *)(a1 + 64))
      v4 = 2;
    v3 |= v4;
  }
  if (*(_QWORD *)(a1 + 48) == a3)
  {
    v5 = 4;
    if (!*(_BYTE *)(a1 + 64))
      v5 = 8;
    v3 |= v5;
  }
  if (*(_QWORD *)(a1 + 56) == a3)
  {
    v6 = 8;
    if (!*(_BYTE *)(a1 + 64))
      v6 = 4;
    v3 |= v6;
  }
  v7 = a2;
  objc_msgSend(v7, "setCornerMask:", v3);
  objc_msgSend(v7, "setHasCustomCornerRounding:", 1);

}

- (BOOL)needsHorizontalNavigation
{
  void *v2;
  BOOL v3;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  NSDirectionalEdgeInsets result;

  v6 = a3;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SearchUISectionModel rowModels](self, "rowModels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cardSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchUIGridSectionModel_customSectionInsets");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SearchUIGridSectionModel;
    -[SearchUISectionModel sectionInsetsWithAttributes:sectionIndex:](&v30, sel_sectionInsetsWithAttributes_sectionIndex_, v6, a4);
    v15 = v22;
    v17 = v23;
    v19 = v24;
    v21 = v25;
  }

  v26 = v15;
  v27 = v17;
  v28 = v19;
  v29 = v21;
  result.trailing = v29;
  result.bottom = v28;
  result.leading = v27;
  result.top = v26;
  return result;
}

- (id)rfHeroImageGridLayouSectionForCardSection:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[4];

  v80[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0DBDA48], "isXROS");
  v5 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.666666667);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v75 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeWithWidthDimension:heightDimension:", v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v74 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeWithWidthDimension:heightDimension:", v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v72 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v18);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.333333333);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeWithWidthDimension:heightDimension:", v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();

  v71 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v22);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.333333333);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeWithWidthDimension:heightDimension:", v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();

  v70 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:repeatingSubitem:count:", v26, v14, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0DC3378];
  objc_msgSend(v3, "searchUIGridSectionModel_interItemSpacing");
  if ((v4 & 1) != 0)
    objc_msgSend(v28, "fixedSpacing:");
  else
    objc_msgSend(v28, "flexibleSpacing:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setInterItemSpacing:", v29);

  v30 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 0.666666667);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v14;
  objc_msgSend(v30, "sizeWithWidthDimension:heightDimension:", v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0DC3350];
  v80[0] = v9;
  v80[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)v33;
  objc_msgSend(v34, "horizontalGroupWithLayoutSize:subitems:", v33, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0DC3378];
  objc_msgSend(v3, "searchUIGridSectionModel_interItemSpacing");
  objc_msgSend(v37, "fixedSpacing:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setInterItemSpacing:", v38);

  v39 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.666666667);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v27;
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sizeWithWidthDimension:heightDimension:", v40, v41);
  v42 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v42;
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v42, v77, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0DC3378];
  v45 = v3;
  objc_msgSend(v3, "searchUIGridSectionModel_interItemSpacing");
  objc_msgSend(v44, "flexibleSpacing:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setInterItemSpacing:", v46);

  v47 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 0.333333333);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sizeWithWidthDimension:heightDimension:", v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)MEMORY[0x1E0DC3350];
  v79[0] = v43;
  v79[1] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "horizontalGroupWithLayoutSize:subitems:", v50, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x1E0DC3378];
  objc_msgSend(v45, "searchUIGridSectionModel_interItemSpacing");
  objc_msgSend(v54, "fixedSpacing:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setInterItemSpacing:", v55);

  v56 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sizeWithWidthDimension:heightDimension:", v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0DC3350];
  v78[0] = v36;
  v78[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "verticalGroupWithLayoutSize:subitems:", v59, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (void *)MEMORY[0x1E0DC3378];
  objc_msgSend(v45, "searchUIGridSectionModel_interItemSpacing");
  objc_msgSend(v63, "fixedSpacing:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setInterItemSpacing:", v64);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v62);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return v65;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIGridSectionModel;
  v4 = -[SearchUISectionModel copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNumberOfColumns:", -[SearchUIGridSectionModel numberOfColumns](self, "numberOfColumns"));
  return v4;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (int)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int)a3
{
  self->_gridStyle = a3;
}

@end
