@implementation SearchUILeadingTrailingSectionModel

+ (int64_t)sectionType
{
  return 3;
}

- (SearchUILeadingTrailingSectionModel)initWithCardSection:(id)a3 rowModels:(id)a4 result:(id)a5 queryId:(unint64_t)a6 section:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  objc_super v29;

  v12 = a3;
  v13 = a7;
  v14 = a5;
  objc_msgSend(v12, "leadingCardSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingTrailingSectionModel rowModelsForCardSections:result:queryId:](self, "rowModelsForCardSections:result:queryId:", v15, v14, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "trailingCardSections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingTrailingSectionModel rowModelsForCardSections:result:queryId:](self, "rowModelsForCardSections:result:queryId:", v17, v14, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v29.receiver = self;
  v29.super_class = (Class)SearchUILeadingTrailingSectionModel;
  v19 = -[SearchUISectionModel initWithRowModels:section:](&v29, sel_initWithRowModels_section_, MEMORY[0x1E0C9AA60], v13);

  if (v19)
  {
    objc_storeStrong((id *)v19 + 6, a3);
    objc_storeStrong((id *)v19 + 7, v16);
    objc_storeStrong((id *)v19 + 8, v18);
    objc_msgSend(v12, "leadingToTrailingRatio");
    v20 = 0.5;
    if (v21 > 0.0)
    {
      objc_msgSend(v12, "leadingToTrailingRatio");
      v23 = v22;
      objc_msgSend(v12, "leadingToTrailingRatio");
      v20 = v23 / (v24 + 1.0);
    }
    *((double *)v19 + 11) = v20;
    *((_QWORD *)v19 + 12) = 0;
    *((_QWORD *)v19 + 9) = 0x4020000000000000;
    *((_QWORD *)v19 + 10) = 0x4020000000000000;
    v25 = *MEMORY[0x1E0DC3298];
    v26 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
    *(_OWORD *)(v19 + 168) = *MEMORY[0x1E0DC3298];
    *(_OWORD *)(v19 + 184) = v26;
    *(_OWORD *)(v19 + 104) = v25;
    *(_OWORD *)(v19 + 120) = v26;
    *(_OWORD *)(v19 + 136) = v25;
    *(_OWORD *)(v19 + 152) = v26;
  }
  objc_msgSend(v19, "primaryCardSection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "customizeSection:isLeading:", v19, objc_msgSend(v19, "primaryCardSectionIsLeading"));

  return (SearchUILeadingTrailingSectionModel *)v19;
}

- (id)rowModelsForCardSections:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[SearchUITableModel tableModelWithCardSections:result:isInline:queryId:shouldCombine:](SearchUITableModel, "tableModelWithCardSections:result:isInline:queryId:shouldCombine:", a3, a4, 0, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableRowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (BOOL)primaryCardSectionIsLeading
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v4 = 0;
    }
    else
    {
      -[SearchUILeadingTrailingSectionModel trailingRowModels](self, "trailingRowModels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") != 1;

    }
  }

  return v4;
}

- (id)primaryCardSection
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](self, "primaryCardSectionIsLeading"))
    -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
  else
    -[SearchUILeadingTrailingSectionModel trailingRowModels](self, "trailingRowModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rowModels
{
  void *v3;
  void *v4;
  void *v5;

  -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingTrailingSectionModel trailingRowModels](self, "trailingRowModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
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
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;
  _QWORD v71[3];

  v71[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_6;
  }
  -[SearchUILeadingTrailingSectionModel trailingRowModels](self, "trailingRowModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
LABEL_6:
    v70.receiver = self;
    v70.super_class = (Class)SearchUILeadingTrailingSectionModel;
    -[SearchUISectionModel layoutSectionForEnvironment:attributes:dataSource:](&v70, sel_layoutSectionForEnvironment_attributes_dataSource_, v8, v9, v10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILeadingTrailingSectionModel sectionInsets](self, "sectionInsets");
    objc_msgSend(v56, "setContentInsets:");
    -[SearchUILeadingTrailingSectionModel verticalSpacing](self, "verticalSpacing");
    objc_msgSend(v56, "setInterGroupSpacing:");
    goto LABEL_9;
  }
  -[SearchUILeadingTrailingSectionModel preferredHeight](self, "preferredHeight");
  v15 = v14;
  v16 = v14 <= 0.0;
  objc_msgSend(v10, "controller");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = objc_claimAutoreleasedReturnValue();

  -[SearchUILeadingTrailingSectionModel leadingFractionalWidth](self, "leadingFractionalWidth");
  v20 = v19;
  -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingTrailingSectionModel buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:](self, "buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:", objc_msgSend(v21, "count"), v16, -[SearchUILeadingTrailingSectionModel prefersSeparatorsInLeadingGroup](self, "prefersSeparatorsInLeadingGroup"), v18, v20);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUILeadingTrailingSectionModel leadingGroupContentInsets](self, "leadingGroupContentInsets");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[SearchUILeadingTrailingSectionModel leadingFractionalWidth](self, "leadingFractionalWidth");
  v31 = 1.0 - v30;
  -[SearchUILeadingTrailingSectionModel trailingRowModels](self, "trailingRowModels");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)v18;
  -[SearchUILeadingTrailingSectionModel buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:](self, "buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:", objc_msgSend(v32, "count"), v16, -[SearchUILeadingTrailingSectionModel prefersSeparatorsInTrailingGroup](self, "prefersSeparatorsInTrailingGroup"), v18, v31);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUILeadingTrailingSectionModel trailingGroupContentInsets](self, "trailingGroupContentInsets");
  v34 = v33;
  v36 = v35;
  v66 = v37;
  v39 = v38;
  if (v15 > 0.0)
  {
    -[SearchUILeadingTrailingSectionModel horizontalSpacing](self, "horizontalSpacing");
    objc_msgSend(v69, "setContentInsets:", v23, v25, v27, v29 + v57 * 0.5);
    -[SearchUILeadingTrailingSectionModel horizontalSpacing](self, "horizontalSpacing");
    objc_msgSend(v68, "setContentInsets:", v34, v36 + v58 * 0.5, v66, v39);
    v59 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)MEMORY[0x1E0DC3340];
    -[SearchUILeadingTrailingSectionModel preferredHeight](self, "preferredHeight");
    objc_msgSend(v60, "absoluteDimension:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v59;
  }
  else
  {
    v40 = (void *)MEMORY[0x1E0DC3348];
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v23);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v29);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v27);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "spacingForLeading:top:trailing:bottom:", v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setEdgeSpacing:", v45);

    v46 = (void *)MEMORY[0x1E0DC3348];
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v36);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v34);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v39);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v66);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "spacingForLeading:top:trailing:bottom:", v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setEdgeSpacing:", v51);

    v52 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v52;
  }
  objc_msgSend(v55, "sizeWithWidthDimension:heightDimension:", v53, v54);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x1E0DC3350];
  v71[0] = v69;
  v71[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "horizontalGroupWithLayoutSize:subitems:", v61, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v64);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingTrailingSectionModel sectionInsets](self, "sectionInsets");
  objc_msgSend(v56, "setContentInsets:");

LABEL_9:
  return v56;
}

- (id)buildGroupForFractionalWidth:(double)a3 numberOfCards:(int64_t)a4 isTopAligned:(BOOL)a5 prefersSeparator:(BOOL)a6 forView:(id)a7
{
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SearchUILeadingTrailingSectionModel *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  _QWORD v54[2];

  v53 = a6;
  v54[1] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v12;
  v46 = self;
  if (a5)
  {
    v13 = v12;
    v14 = *MEMORY[0x1E0DC3298];
    v15 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v16 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v17 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    v18 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0 / (double)a4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SearchUILeadingTrailingSectionModel verticalSpacing](self, "verticalSpacing");
    v14 = v19 * 0.5;
    -[SearchUILeadingTrailingSectionModel verticalSpacing](self, "verticalSpacing");
    v16 = v20 * 0.5;
    v17 = 0.0;
    v15 = 0.0;
  }
  v21 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0, v46);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v13;
  objc_msgSend(v21, "sizeWithWidthDimension:heightDimension:", v22, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeWithWidthDimension:heightDimension:", v25, v18);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0DC3340];
  v52 = v11;
  objc_msgSend(MEMORY[0x1E0DBDA48], "pixelWidthForView:", v11);
  objc_msgSend(v28, "estimatedDimension:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeWithWidthDimension:heightDimension:", v27, v29);
  v30 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3328], "layoutAnchorWithEdges:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0DC3380];
  +[SearchUISupplementaryIdentifiers itemSeparatorKind](SearchUISupplementaryIdentifiers, "itemSeparatorKind");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v30;
  objc_msgSend(v32, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v30, v33, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUIUtilities standardCompactHorizontalMargin](SearchUIUtilities, "standardCompactHorizontalMargin");
  objc_msgSend(v34, "setContentInsets:", 0.0, v35, 0.0, 0.0);
  v36 = (void *)objc_opt_new();
  if (a4 >= 1)
  {
    v37 = (void *)MEMORY[0x1E0C9AA60];
    v38 = v18;
    do
    {
      if (v53)
      {
        v39 = v37;
        if (a4 != 1)
        {
          v54[0] = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v39 = v37;
      }
      objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:supplementaryItems:", v23, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (!a5)
        objc_msgSend(v40, "setContentInsets:", v14, v15, v16, v17);
      objc_msgSend(v36, "addObject:", v41);

      --a4;
      v18 = v38;
    }
    while (a4);
  }
  objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:subitems:", v49, v36);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v43 = (void *)MEMORY[0x1E0DC3378];
    objc_msgSend(v47, "verticalSpacing");
    objc_msgSend(v43, "fixedSpacing:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setInterItemSpacing:", v44);

  }
  return v42;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3 forRowModel:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  int64_t v11;
  void *v12;

  v5 = a4;
  -[SearchUILeadingTrailingSectionModel primaryCardSection](self, "primaryCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](self, "primaryCardSectionIsLeading"))
    goto LABEL_7;
  objc_msgSend(v5, "backgroundColor");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  v8 = (void *)v7;
  objc_msgSend(v5, "cardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v6)
  {

LABEL_7:
    -[SearchUILeadingTrailingSectionModel primaryCardSection](self, "primaryCardSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "preferredBackgroundStyleForIsLeadingPrimaryCard:", -[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](self, "primaryCardSectionIsLeading"));

    goto LABEL_8;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  v11 = 3;
LABEL_8:

  return v11;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  void *v4;
  int64_t v5;

  -[SearchUILeadingTrailingSectionModel primaryCardSection](self, "primaryCardSection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "preferredBackgroundStyleForIsLeadingPrimaryCard:", -[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](self, "primaryCardSectionIsLeading"));

  return v5;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  NSDirectionalEdgeInsets result;

  v6 = a3;
  if (-[SearchUILeadingTrailingSectionModel customSectionInsets](self, "customSectionInsets"))
  {
    -[SearchUILeadingTrailingSectionModel sectionInsets](self, "sectionInsets");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SearchUILeadingTrailingSectionModel;
    -[SearchUISectionModel sectionInsetsWithAttributes:sectionIndex:](&v19, sel_sectionInsetsWithAttributes_sectionIndex_, v6, a4);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.trailing = v18;
  result.bottom = v17;
  result.leading = v16;
  result.top = v15;
  return result;
}

- (id)copyWithRowModels:(id)a3
{
  NSObject *v4;

  SearchUIDataSourceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SearchUILeadingTrailingSectionModel copyWithRowModels:].cold.1(v4);

  return (id)-[SearchUILeadingTrailingSectionModel copy](self, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUILeadingTrailingSectionModel;
  v4 = -[SearchUISectionModel copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SearchUILeadingTrailingSectionModel leadingRowModels](self, "leadingRowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLeadingRowModels:", v6);

  -[SearchUILeadingTrailingSectionModel trailingRowModels](self, "trailingRowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTrailingRowModels:", v8);

  -[SearchUILeadingTrailingSectionModel horizontalSpacing](self, "horizontalSpacing");
  objc_msgSend(v4, "setHorizontalSpacing:");
  -[SearchUILeadingTrailingSectionModel verticalSpacing](self, "verticalSpacing");
  objc_msgSend(v4, "setVerticalSpacing:");
  -[SearchUILeadingTrailingSectionModel leadingFractionalWidth](self, "leadingFractionalWidth");
  objc_msgSend(v4, "setLeadingFractionalWidth:");
  -[SearchUILeadingTrailingSectionModel preferredHeight](self, "preferredHeight");
  objc_msgSend(v4, "setPreferredHeight:");
  objc_msgSend(v4, "setPrefersSeparatorsInLeadingGroup:", -[SearchUILeadingTrailingSectionModel prefersSeparatorsInLeadingGroup](self, "prefersSeparatorsInLeadingGroup"));
  objc_msgSend(v4, "setPrefersSeparatorsInTrailingGroup:", -[SearchUILeadingTrailingSectionModel prefersSeparatorsInTrailingGroup](self, "prefersSeparatorsInTrailingGroup"));
  -[SearchUILeadingTrailingSectionModel leadingGroupContentInsets](self, "leadingGroupContentInsets");
  objc_msgSend(v4, "setLeadingGroupContentInsets:");
  -[SearchUILeadingTrailingSectionModel trailingGroupContentInsets](self, "trailingGroupContentInsets");
  objc_msgSend(v4, "setTrailingGroupContentInsets:");
  -[SearchUILeadingTrailingSectionModel sectionInsets](self, "sectionInsets");
  objc_msgSend(v4, "setSectionInsets:");
  return v4;
}

- (SFLeadingTrailingCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (NSArray)leadingRowModels
{
  return self->_leadingRowModels;
}

- (void)setLeadingRowModels:(id)a3
{
  objc_storeStrong((id *)&self->_leadingRowModels, a3);
}

- (NSArray)trailingRowModels
{
  return self->_trailingRowModels;
}

- (void)setTrailingRowModels:(id)a3
{
  objc_storeStrong((id *)&self->_trailingRowModels, a3);
}

- (double)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void)setHorizontalSpacing:(double)a3
{
  self->_horizontalSpacing = a3;
}

- (double)verticalSpacing
{
  return self->_verticalSpacing;
}

- (void)setVerticalSpacing:(double)a3
{
  self->_verticalSpacing = a3;
}

- (double)leadingFractionalWidth
{
  return self->_leadingFractionalWidth;
}

- (void)setLeadingFractionalWidth:(double)a3
{
  self->_leadingFractionalWidth = a3;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferredHeight = a3;
}

- (BOOL)prefersSeparatorsInLeadingGroup
{
  return self->_prefersSeparatorsInLeadingGroup;
}

- (void)setPrefersSeparatorsInLeadingGroup:(BOOL)a3
{
  self->_prefersSeparatorsInLeadingGroup = a3;
}

- (BOOL)prefersSeparatorsInTrailingGroup
{
  return self->_prefersSeparatorsInTrailingGroup;
}

- (void)setPrefersSeparatorsInTrailingGroup:(BOOL)a3
{
  self->_prefersSeparatorsInTrailingGroup = a3;
}

- (NSDirectionalEdgeInsets)leadingGroupContentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_leadingGroupContentInsets.top;
  leading = self->_leadingGroupContentInsets.leading;
  bottom = self->_leadingGroupContentInsets.bottom;
  trailing = self->_leadingGroupContentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setLeadingGroupContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_leadingGroupContentInsets = a3;
}

- (NSDirectionalEdgeInsets)trailingGroupContentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_trailingGroupContentInsets.top;
  leading = self->_trailingGroupContentInsets.leading;
  bottom = self->_trailingGroupContentInsets.bottom;
  trailing = self->_trailingGroupContentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setTrailingGroupContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_trailingGroupContentInsets = a3;
}

- (NSDirectionalEdgeInsets)sectionInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_sectionInsets.top;
  leading = self->_sectionInsets.leading;
  bottom = self->_sectionInsets.bottom;
  trailing = self->_sectionInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setSectionInsets:(NSDirectionalEdgeInsets)a3
{
  self->_sectionInsets = a3;
}

- (BOOL)customSectionInsets
{
  return self->_customSectionInsets;
}

- (void)setCustomSectionInsets:(BOOL)a3
{
  self->_customSectionInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingRowModels, 0);
  objc_storeStrong((id *)&self->_leadingRowModels, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
}

- (void)copyWithRowModels:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Copying SearchUILeadingTrailingSectionModel with new rowModels is unsupported. Returning original as copy!", v1, 2u);
}

@end
