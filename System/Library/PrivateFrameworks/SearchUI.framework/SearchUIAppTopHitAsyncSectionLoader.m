@implementation SearchUIAppTopHitAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "rowModels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v3, "rowModels");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cardSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (SearchUIAppTopHitAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  SearchUIAppTopHitAsyncSectionLoader *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SearchUIAppTopHitAsyncSectionLoader;
  v9 = -[SearchUIAsyncSectionLoader initWithSectionModel:result:queryId:](&v17, sel_initWithSectionModel_result_queryId_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "rowModels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "cardSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAppTopHitAsyncSectionLoader setAppIconCardSection:](v9, "setAppIconCardSection:", v12);

    objc_msgSend(v8, "section");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAppTopHitAsyncSectionLoader setSectionBackgroundColor:](v9, "setSectionBackgroundColor:", v15);

  }
  return v9;
}

+ (int64_t)maxNumOfTopHitEntities
{
  if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
    return 5;
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    return 5;
  return 3;
}

- (id)backgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SearchUIAppTopHitAsyncSectionLoader cardSections](self, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    -[SearchUIAppTopHitAsyncSectionLoader cardSections](self, "cardSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SearchUIAppTopHitAsyncSectionLoader sectionBackgroundColor](self, "sectionBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[SearchUIAppTopHitAsyncSectionLoader appIconCardSection](self, "appIconCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cardSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SearchUIAppTopHitAsyncSectionLoader;
  -[SearchUIAsyncSectionLoader cardSections](&v8, sel_cardSections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppTopHitAsyncSectionLoader appIconCardSection](self, "appIconCardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)responseForCardSections:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setCardSection:", v5);

  objc_msgSend(v6, "setAnimated:", v4);
  objc_msgSend(v6, "setReconfigureExisting:", 1);
  return v6;
}

- (id)buildVerticalLayoutCardSectionFromResult:(id)a3 title:(id)a4 subtitle:(id)a5 command:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setUseAppIconMetrics:", 1);
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTitle:", v14);
  objc_msgSend(v13, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaxLines:", 2);

  objc_msgSend(v13, "setThumbnail:", v12);
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setFootnote:", v16);
  objc_msgSend(v13, "footnote");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaxLines:", 1);

  objc_msgSend(v13, "setCommand:", v9);
  return v13;
}

- (SFAppIconCardSection)appIconCardSection
{
  return self->_appIconCardSection;
}

- (void)setAppIconCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_appIconCardSection, a3);
}

- (SFColor)sectionBackgroundColor
{
  return self->_sectionBackgroundColor;
}

- (void)setSectionBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_appIconCardSection, 0);
}

@end
