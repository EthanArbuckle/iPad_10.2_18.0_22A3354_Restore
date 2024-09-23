@implementation SearchUIHorizontallyScrollingCardSectionRowModel

- (SearchUIHorizontallyScrollingCardSectionRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4 builder:(id)a5
{
  id v8;
  id v9;
  SearchUIHorizontallyScrollingCardSectionRowModel *v10;
  SearchUIHorizontallyScrollingCardSectionRowModel *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SearchUIHorizontallyScrollingCardSectionRowModel *v24;
  id v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v36.receiver = self;
  v36.super_class = (Class)SearchUIHorizontallyScrollingCardSectionRowModel;
  v10 = -[SearchUIRowModel initWithResults:itemIdentifier:](&v36, sel_initWithResults_itemIdentifier_, v8, a4);
  v11 = v10;
  if (v10)
  {
    v24 = v10;
    v12 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v8;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v13)
    {
      v14 = v13;
      v27 = *(_QWORD *)v33;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v15);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v16, v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v29;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v29 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(v9, "buildRowModelFromCardSection:result:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21), v16);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v22);

                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            }
            while (v19);
          }

          ++v15;
        }
        while (v15 != v14);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v14);
    }

    v11 = v24;
    -[SearchUIHorizontallyScrollingCardSectionRowModel setCardSectionRowModels:](v24, "setCardSectionRowModels:", v12);
    v24->_numberOfRows = 1;

    v8 = v25;
  }

  return v11;
}

- (SearchUIHorizontallyScrollingCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6 builder:(id)a7
{
  id v12;
  id v13;
  id v14;
  SearchUIHorizontallyScrollingCardSectionRowModel *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SearchUIHorizontallyScrollingCardSectionRowModel;
  v15 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](&v29, sel_initWithResult_cardSection_queryId_itemIdentifier_, v12, v13, a5, a6);
  if (v15)
  {
    v16 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v13, "cardSections", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v14, "buildRowModelFromCardSection:result:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21), v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v19);
    }

    -[SearchUIHorizontallyScrollingCardSectionRowModel setCardSectionRowModels:](v15, "setCardSectionRowModels:", v16);
    if (objc_msgSend(v13, "numberOfRows"))
      v23 = (int)objc_msgSend(v13, "numberOfRows");
    else
      v23 = 1;
    v15->_numberOfRows = v23;

  }
  return v15;
}

- (id)cardSection
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIHorizontallyScrollingCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)reuseIdentifier
{
  return 0;
}

- (BOOL)hasLeadingImage
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUIHorizontallyScrollingCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLeadingImage");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIHorizontallyScrollingCardSectionRowModel;
  v4 = -[SearchUIRowModel copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUIHorizontallyScrollingCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardSectionRowModels:", v5);

  return v4;
}

- (NSArray)cardSectionRowModels
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCardSectionRowModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionRowModels, 0);
}

@end
