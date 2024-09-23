@implementation SearchUIImageGridRowModel

- (SearchUIImageGridRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4 builder:(id)a5
{
  id v8;
  id v9;
  SearchUIImageGridRowModel *v10;
  SearchUIImageGridRowModel *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void (**v19)(void *, _QWORD);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SearchUIImageGridRowModel *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v41.receiver = self;
  v41.super_class = (Class)SearchUIImageGridRowModel;
  v10 = -[SearchUIRowModel initWithResults:itemIdentifier:](&v41, sel_initWithResults_itemIdentifier_, v8, a4);
  v11 = v10;
  if (v10)
  {
    v26 = v10;
    v12 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = v8;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v16);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __68__SearchUIImageGridRowModel_initWithResults_itemIdentifier_builder___block_invoke;
          aBlock[3] = &unk_1EA1F8690;
          v18 = v12;
          v34 = v18;
          v35 = v9;
          v36 = v17;
          v19 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
          objc_msgSend(v18, "count");
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v30;
            do
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v30 != v23)
                  objc_enumerationMutation(v20);
                v19[2](v19, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24++));
              }
              while (v22 != v24);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
            }
            while (v22);
          }

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v14);
    }

    v11 = v26;
    -[SearchUIImageGridRowModel setCardSectionRowModels:](v26, "setCardSectionRowModels:", v12);

    v8 = v27;
  }

  return v11;
}

void __68__SearchUIImageGridRowModel_initWithResults_itemIdentifier_builder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "cardSections", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "buildRowModelFromCardSection:result:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), *(_QWORD *)(a1 + 48));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (SearchUIImageGridRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7 builder:(id)a8
{
  id v13;
  id v14;
  id v15;
  SearchUIImageGridRowModel *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SearchUIImageGridRowModel;
  v16 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](&v29, sel_initWithResult_cardSection_queryId_itemIdentifier_, v13, v14, a6, a7);
  if (v16)
  {
    v17 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v14, "cardSections", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v15, "buildRowModelFromCardSection:result:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22), v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v20);
    }

    -[SearchUIImageGridRowModel setCardSectionRowModels:](v16, "setCardSectionRowModels:", v17);
  }

  return v16;
}

- (id)cardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIImageGridRowModel;
    -[SearchUIRowModel cardSection](&v10, sel_cardSection);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (Class)cardSectionViewClass
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[SearchUICardSectionCreator viewClassForCardSection:horizontal:](SearchUICardSectionCreator, "viewClassForCardSection:horizontal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)isTappable
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIImageGridRowModel;
  v4 = -[SearchUICardSectionRowModel copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUIImageGridRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardSectionRowModels:", v5);

  return v4;
}

- (NSArray)cardSectionRowModels
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCardSectionRowModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionRowModels, 0);
}

@end
