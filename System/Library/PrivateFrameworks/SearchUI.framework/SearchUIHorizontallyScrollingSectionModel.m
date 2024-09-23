@implementation SearchUIHorizontallyScrollingSectionModel

+ (int64_t)sectionType
{
  return 2;
}

- (SearchUIHorizontallyScrollingSectionModel)initWithRowModels:(id)a3 section:(id)a4 numberOfRows:(int64_t)a5
{
  id v8;
  SearchUIHorizontallyScrollingSectionModel *v9;
  unint64_t v10;
  int64_t v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SearchUIHorizontallyScrollingSectionModel;
  v9 = -[SearchUISectionModel initWithRowModels:section:](&v13, sel_initWithRowModels_section_, v8, a4);
  if (v9)
  {
    if (a5)
    {
      v10 = objc_msgSend(v8, "count");
      if (v10 >= a5)
        v11 = a5;
      else
        v11 = v10;
    }
    else
    {
      v11 = 1;
    }
    -[SearchUIHorizontallyScrollingSectionModel setNumberOfRows:](v9, "setNumberOfRows:", v11);
  }

  return v9;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  id v6;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  void *v24;
  char v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
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
  void *v49;
  double v50;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v6;
  if (objc_msgSend(v7, "count"))
  {
    -[SearchUISectionModel rowModels](self, "rowModels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_widthDimension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_heightDimension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeWithWidthDimension:heightDimension:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v8;
  v17 = objc_msgSend(v8, "count");
  v18 = (uint64_t)(double)(v17 / -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows"));
  v19 = -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows");
  objc_msgSend(v15, "widthDimension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEstimated");

  objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_interItemSpacing");
  v23 = v22;
  objc_msgSend(v15, "widthDimension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEstimated");
  v52 = v18;
  if ((v21 & 1) != 0)
  {
    if ((v25 & 1) != 0)
    {
      v26 = 10000.0;
      v27 = 1;
LABEL_9:
      v53 = v27;
      goto LABEL_13;
    }
    objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_widthDimension");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dimension");
    v26 = v23 * (double)(v18 - 1) + v29 * (double)v18;
    v30 = 1;
  }
  else
  {
    if ((v25 & 1) != 0)
    {
      v26 = 10000.0;
      v27 = 2;
      goto LABEL_9;
    }
    objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_widthDimension");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dimension");
    v26 = v31;
    v30 = 2;
  }
  v53 = v30;

LABEL_13:
  v32 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeWithWidthDimension:heightDimension:", v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 < 2)
  {
    v42 = (void *)MEMORY[0x1E0DC3350];
    v56[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "horizontalGroupWithLayoutSize:subitems:", v35, v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = (void *)objc_opt_new();
    if (-[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows"))
    {
      v37 = 0;
      if (v21)
        v38 = v52;
      else
        v38 = 1;
      do
      {
        objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v35, v16, v38, v52);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v39);

        ++v37;
      }
      while (v37 < -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows"));
    }
    objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:subitems:", v35, v36, v52);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3348], "spacingForLeading:top:trailing:bottom:", 0, 0, 0, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setEdgeSpacing:", v41);

  }
  v44 = (void *)MEMORY[0x1E0DC3378];
  objc_msgSend(v11, "_superGroupSpacing", v52);
  objc_msgSend(v44, "fixedSpacing:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setInterItemSpacing:", v45);

  v46 = (void *)MEMORY[0x1E0DC3348];
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 16.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "spacingForLeading:top:trailing:bottom:", 0, 0, 0, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setEdgeSpacing:", v48);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v40);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setOrthogonalScrollingBehavior:", v53);
  v50 = 8.0;
  if (v23 != 0.0)
    v50 = v23;
  objc_msgSend(v49, "setInterGroupSpacing:", v50);

  return v49;
}

- (BOOL)shouldHeightMatchSection
{
  _BOOL4 v3;

  v3 = -[SearchUIHorizontallyScrollingSectionModel drawsBackground](self, "drawsBackground");
  if (v3)
    LOBYTE(v3) = -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows") == 1;
  return v3;
}

- (BOOL)needsHeaderSeparator
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator");

  return v5;
}

- (BOOL)drawsBackground
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "searchUIHorizontallyScrollingSectionModel_useBackground");

  return v5;
}

- (BOOL)selfSizingInTwoAxes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchUIHorizontallyScrollingSectionModel_widthDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEstimated");

  return v6;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  if (-[SearchUIHorizontallyScrollingSectionModel drawsBackground](self, "drawsBackground", a3))
    return 3;
  else
    return 5;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  int v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  NSDirectionalEdgeInsets result;

  v43.receiver = self;
  v43.super_class = (Class)SearchUIHorizontallyScrollingSectionModel;
  v6 = a3;
  -[SearchUISectionModel sectionInsetsWithAttributes:sectionIndex:](&v43, sel_sectionInsetsWithAttributes_sectionIndex_, v6, a4);
  v41 = v7;
  v42 = v8;
  -[SearchUISectionModel rowModels](self, "rowModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_additionalSectionInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cardSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "searchUIHorizontallyScrollingSectionModel_customSectionInsets");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v32 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v33 = objc_msgSend(v6, "shouldUseInsetRoundedSections");

  if (v26 == 0.0 && v24 == 0.0 && v30 == 0.0 && v28 == 0.0)
  {
    v34 = 0.0;
    if (v33)
      v34 = 8.0;
    v35 = 16.0;
    if (v32)
      v35 = 12.0;
    v36 = 4.0;
    if (v31)
      v36 = 2.0;
    v24 = v13 + v36;
    v26 = v41 + v15 + v34;
    v28 = v17 + v35;
    v30 = v42 + v19 + v34;
  }
  v37 = v24;
  v38 = v26;
  v39 = v28;
  v40 = v30;
  result.trailing = v40;
  result.bottom = v39;
  result.leading = v38;
  result.top = v37;
  return result;
}

- (id)overriddenAccessibilityIdentifier
{
  return CFSTR("HorizontallyScrollingCell");
}

- (BOOL)needsHorizontalNavigation
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  -[SearchUISectionModel rowModels](self, "rowModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = (uint64_t)(double)(v4 / -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows"));

  return v5 > 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIHorizontallyScrollingSectionModel;
  v4 = -[SearchUISectionModel copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNumberOfRows:", -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows"));
  return v4;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(int64_t)a3
{
  self->_numberOfRows = a3;
}

@end
