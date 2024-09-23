@implementation SearchUICombinedCardSectionRowModel

- (SearchUICombinedCardSectionRowModel)initWithResult:(id)a3 cardSectionRowModels:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8;
  SearchUICombinedCardSectionRowModel *v9;
  SearchUICombinedCardSectionRowModel *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICombinedCardSectionRowModel;
  v9 = -[SearchUIRowModel initWithResult:itemIdentifier:](&v12, sel_initWithResult_itemIdentifier_, a3, a5);
  v10 = v9;
  if (v9)
    -[SearchUICombinedCardSectionRowModel setCardSectionRowModels:](v9, "setCardSectionRowModels:", v8);

  return v10;
}

- (SearchUICombinedCardSectionRowModel)initWithResult:(id)a3 cardSectionRowModels:(id)a4 cardSection:(id)a5 dataSourceIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SearchUICombinedCardSectionRowModel *v14;
  objc_super v16;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchUICombinedCardSectionRowModel;
  v14 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](&v16, sel_initWithResult_cardSection_queryId_itemIdentifier_, v13, v12, objc_msgSend(v13, "queryId"), v11);

  if (v14)
    -[SearchUICombinedCardSectionRowModel setCardSectionRowModels:](v14, "setCardSectionRowModels:", v10);

  return v14;
}

- (id)nextCard
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "nextCard");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "nextCard");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "card");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = v4;
  v12 = v10;

  return v12;
}

- (BOOL)isTappable
{
  return 1;
}

- (int)separatorStyle
{
  void *v2;
  void *v3;
  int v4;

  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "separatorStyle");

  return v4;
}

- (NSArray)snippetUICardSections
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  +[SnippetUIUtilities supportsConfigurationForCombinedRowModel:](SnippetUIUtilities, "supportsConfigurationForCombinedRowModel:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)reuseIdentifier
{
  void *v3;
  __CFString *v4;
  objc_super v6;

  -[SearchUICombinedCardSectionRowModel snippetUICardSections](self, "snippetUICardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = CFSTR("SnippetUICombinedCell");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICombinedCardSectionRowModel;
    -[SearchUIRowModel reuseIdentifier](&v6, sel_reuseIdentifier);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)punchouts
{
  void *v3;
  uint64_t v4;
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
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "punchout");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "punchout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      return v8;
  }
  else
  {

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v8 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "punchouts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "punchouts");
          v16 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dragURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "dragURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "dragURL");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)firstRowModel
{
  void *v2;
  void *v3;

  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dragTitle
{
  void *v2;
  void *v3;

  -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dragText
{
  void *v2;
  void *v3;

  -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dragSubtitle
{
  void *v2;
  void *v3;

  -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDraggable
{
  void *v2;
  char v3;

  -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDraggable");

  return v3;
}

- (Class)cellViewClass
{
  return (Class)objc_opt_class();
}

- (id)cardSection
{
  void *v3;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUICombinedCardSectionRowModel;
  -[SearchUIRowModel cardSection](&v8, sel_cardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICombinedCardSectionRowModel;
    -[SearchUIRowModel cardSection](&v7, sel_cardSection);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (id)backgroundColor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;
  objc_super v12;

  if (!-[SearchUIRowModel allowBackgroundColor](self, "allowBackgroundColor"))
    return 0;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICombinedCardSectionRowModel;
  -[SearchUIRowModel cardSection](&v12, sel_cardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (v11.receiver = self,
        v11.super_class = (Class)SearchUICombinedCardSectionRowModel,
        -[SearchUIRowModel backgroundColor](&v11, sel_backgroundColor),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v4 = v7;
    }
    else
    {
      -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (id)backgroundImage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUICombinedCardSectionRowModel;
  -[SearchUIRowModel cardSection](&v12, sel_cardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (v11.receiver = self,
        v11.super_class = (Class)SearchUICombinedCardSectionRowModel,
        -[SearchUIRowModel backgroundImage](&v11, sel_backgroundImage),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v4 = v7;
    }
    else
    {
      -[SearchUICombinedCardSectionRowModel firstRowModel](self, "firstRowModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundImage");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICombinedCardSectionRowModel;
  v4 = -[SearchUIRowModel copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardSectionRowModels:", v5);

  return v4;
}

- (void)setIsTopHit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SearchUICombinedCardSectionRowModel;
  -[SearchUIRowModel setIsTopHit:](&v14, sel_setIsTopHit_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SearchUICombinedCardSectionRowModel cardSectionRowModels](self, "cardSectionRowModels", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setIsTopHit:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)cardSectionRowModels
{
  return self->_cardSectionRowModels;
}

- (void)setCardSectionRowModels:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionRowModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionRowModels, 0);
}

@end
