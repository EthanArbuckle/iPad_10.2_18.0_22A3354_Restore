@implementation SearchUICardSectionRowModel

- (SearchUICardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  _BOOL8 v7;
  SearchUICardSectionRowModel *v8;
  SearchUICardSectionRowModel *v9;
  objc_super v11;

  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)SearchUICardSectionRowModel;
  v8 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](&v11, sel_initWithResult_cardSection_queryId_itemIdentifier_, a3, a4, a6, a7);
  v9 = v8;
  if (v8)
    -[SearchUICardSectionRowModel setIsInline:](v8, "setIsInline:", v7);
  return v9;
}

- (id)horizontalRowModel
{
  void *v2;

  v2 = (void *)-[SearchUICardSectionRowModel copy](self, "copy");
  objc_msgSend(v2, "setIsHorizontalInLayout:", 1);
  return v2;
}

- (id)punchouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SearchUIRowModel cardSection](self, "cardSection", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "punchoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "urls");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {

          -[SearchUIRowModel cardSection](self, "cardSection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "punchoutOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SearchUICardSectionRowModel anyCardSectionsAreTappable:](self, "anyCardSectionsAreTappable:", v12))
  {

LABEL_14:
    -[SearchUICardSectionRowModel fallbackCardSectionForCompactResult](self, "fallbackCardSectionForCompactResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "punchoutOptions");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v11, "punchout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_14;
  objc_msgSend(v11, "punchout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v13 = (void *)v16;

LABEL_16:
  return v13;
}

- (BOOL)anyCardSectionsAreTappable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "punchoutOptions", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {

LABEL_14:
          v14 = 1;
          goto LABEL_15;
        }
        objc_msgSend(v9, "command");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "cardSections");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SearchUICardSectionRowModel anyCardSectionsAreTappable:](self, "anyCardSectionsAreTappable:", v12);

          if (v13)
            goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }

  v14 = -[SearchUICardSectionRowModel anyCardSectionsHaveNextCards:](self, "anyCardSectionsHaveNextCards:", v4);
LABEL_15:

  return v14;
}

- (BOOL)anyCardSectionsHaveNextCards:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "nextCard", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)reuseIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  -[SearchUICardSectionRowModel cardReuseIdentifier](self, "cardReuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass");
    -[SearchUIRowModel cardSection](self, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[objc_class supportsRecyclingForCardSection:](v4, "supportsRecyclingForCardSection:", v5);

    if (!reuseIdentifier_cardSectionReuseDict)
    {
      v7 = objc_opt_new();
      v8 = (void *)reuseIdentifier_cardSectionReuseDict;
      reuseIdentifier_cardSectionReuseDict = v7;

    }
    if (v4)
      v9 = v6;
    else
      v9 = 0;
    if (v9 == 1)
    {
      objc_msgSend((id)reuseIdentifier_cardSectionReuseDict, "objectForKeyedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        NSStringFromClass(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)reuseIdentifier_cardSectionReuseDict, "setObject:forKeyedSubscript:", v10, v4);
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      v15.receiver = self;
      v15.super_class = (Class)SearchUICardSectionRowModel;
      -[SearchUIRowModel reuseIdentifier](&v15, sel_reuseIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICardSectionRowModel setCardReuseIdentifier:](self, "setCardReuseIdentifier:", v13);

    }
  }
  -[SearchUICardSectionRowModel cardReuseIdentifier](self, "cardReuseIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isFocusable
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICardSectionRowModel;
    v4 = -[SearchUIRowModel isFocusable](&v6, sel_isFocusable);
  }

  return v4;
}

- (BOOL)isQuerySuggestion
{
  void *v2;
  id v3;
  int v4;
  int v5;
  void *v6;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, "suggestionType");
    if (v4)
    {
      v5 = v4;

      if (v5 == 1)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v3, "thumbnail");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_8;

    }
  }
  objc_msgSend(v2, "command");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    LOBYTE(v5) = objc_opt_isKindOfClass();
    goto LABEL_10;
  }
LABEL_8:
  LOBYTE(v5) = 1;
LABEL_10:

LABEL_11:
  return v5 & 1;
}

- (Class)cellViewClass
{
  return (Class)objc_opt_class();
}

- (id)nextCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "card"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v3, "nextCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[SearchUIRowModel cardSection](self, "cardSection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "punchoutOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {

LABEL_8:
        -[SearchUICardSectionRowModel fallbackCardSectionForCompactResult](self, "fallbackCardSectionForCompactResult");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nextCard");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      -[SearchUIRowModel identifyingResult](self, "identifyingResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inlineCard");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cardSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SearchUICardSectionRowModel anyCardSectionsHaveNextCards:](self, "anyCardSectionsHaveNextCards:", v10);

      if (v11)
        goto LABEL_8;
      -[SearchUIRowModel identifyingResult](self, "identifyingResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "card");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_8;
    }
  }
LABEL_9:

  return v5;
}

- (id)fallbackCardSectionForCompactResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "usesCompactDisplay") && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isTappable
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionRowModel nextCard](self, "nextCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && !-[SearchUICardSectionRowModel isQuerySuggestion](self, "isQuerySuggestion"))
  {
    -[SearchUICardSectionRowModel punchouts](self, "punchouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v6 = 1;
LABEL_30:

      goto LABEL_4;
    }
    objc_msgSend(v3, "userActivityRequiredString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v6 = 1;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v3, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v6 = 1;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v4, "intentMessageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_msgSend(v4, "intentMessageData"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = 1;
    }
    else
    {
      -[SearchUIRowModel cardSection](self, "cardSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userReportRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        && !-[SearchUICardSectionRowModel supportsCustomUserReportRequestAfforance](self, "supportsCustomUserReportRequestAfforance"))
      {

        v6 = 1;
        if (!v11)
          goto LABEL_27;
      }
      else
      {
        v20 = v13;
        -[SearchUIRowModel cardSection](self, "cardSection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "commands");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(v3, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "hasPrefix:", CFSTR("com.apple.other")) & 1) != 0)
          {
            v6 = 1;
          }
          else
          {
            -[SearchUIRowModel cardSection](self, "cardSection");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "command");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v16 != 0;

          }
        }

        if (!v11)
          goto LABEL_27;
      }
      v12 = 0;
    }

LABEL_27:
    goto LABEL_28;
  }
  v6 = 1;
LABEL_4:

  return v6;
}

- (BOOL)isDraggable
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[SearchUICardSectionRowModel isQuerySuggestion](self, "isQuerySuggestion"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SearchUIUtilities resultIsSiriAction:](SearchUIUtilities, "resultIsSiriAction:", v4))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[SearchUIRowModel identifyingResult](self, "identifyingResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "hasSuffix:", CFSTR("search-through")) ^ 1;

    }
  }
  return v3;
}

- (id)dragTitle
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = -[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass");
  -[SearchUIRowModel cardSection](self, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class dragTitleForCardSection:](v3, "dragTitleForCardSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dragSubtitle
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  -[SearchUICardSectionRowModel dragURL](self, "dragURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass");
    -[SearchUIRowModel cardSection](self, "cardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class dragSubtitleForCardSection:](v5, "dragSubtitleForCardSection:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)dragText
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[SearchUICardSectionRowModel dragTitle](self, "dragTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionRowModel dragSubtitle](self, "dragSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "appendString:", v4);
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "appendString:", v5);

  return v3;
}

- (id)dragURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[SearchUICardSectionRowModel punchouts](self, "punchouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredOpenableURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "punchout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredOpenableURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int)separatorStyle
{
  void *v3;
  int v4;
  objc_class *v5;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "separatorStyle");

  v5 = -[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass");
  if (v4 || !v5)
    return v4;
  else
    return -[objc_class defaultSeparatorStyleForRowModel:](v5, "defaultSeparatorStyleForRowModel:", self);
}

- (BOOL)fillsBackgroundWithContent
{
  return -[objc_class fillsBackgroundWithContentForRowModel:](-[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass"), "fillsBackgroundWithContentForRowModel:", self);
}

- (BOOL)hasLeadingImage
{
  objc_class *v3;
  void *v4;

  v3 = -[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass");
  -[SearchUIRowModel cardSection](self, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[objc_class hasLeadingImageForCardSection:](v3, "hasLeadingImageForCardSection:", v4);

  return (char)v3;
}

- (BOOL)prefersNoSeparatorAbove
{
  return -[objc_class prefersNoSeparatorAboveRowModel:](-[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass"), "prefersNoSeparatorAboveRowModel:", self);
}

- (BOOL)supportsCustomUserReportRequestAfforance
{
  return -[objc_class supportsCustomUserReportRequestAfforance](-[SearchUICardSectionRowModel cardSectionViewClass](self, "cardSectionViewClass"), "supportsCustomUserReportRequestAfforance");
}

- (id)backgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  if (!-[SearchUIRowModel allowBackgroundColor](self, "allowBackgroundColor"))
    return 0;
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v4, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v12.receiver = self;
  v12.super_class = (Class)SearchUICardSectionRowModel;
  -[SearchUIRowModel backgroundColor](&v12, sel_backgroundColor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 || (v9 = v6) != 0)
  {
    v10 = v9;
  }
  else
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)backgroundImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardForRenderingResult:](SearchUIUtilities, "cardForRenderingResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v4, "backgroundImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  -[SearchUICardSectionRowModel backgroundColor](self, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (Class)cardSectionViewClass
{
  void *v3;
  void *v4;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICardSectionCreator viewClassForCardSection:horizontal:](SearchUICardSectionCreator, "viewClassForCardSection:horizontal:", v3, -[SearchUICardSectionRowModel isHorizontalInLayout](self, "isHorizontalInLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "usesCompactDisplay") & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v3, "shouldUseCompactDisplay") & 1) != 0)
  {
    -[SearchUICardSectionRowModel punchouts](self, "punchouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = CFSTR("CompactPunchoutTopHitCell");
      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = CFSTR("PersonEntityHeaderCell");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = CFSTR("EntityInfoCell");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = CFSTR("ImageCell");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_16;
        objc_msgSend(v3, "punchoutOptions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "urls");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          v9 = CFSTR("WebPunchOutCell");
        }
        else
        {
LABEL_16:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = CFSTR("MapViewCell");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v9 = CFSTR("HeroCardCell");
            }
            else
            {
              v15.receiver = self;
              v15.super_class = (Class)SearchUICardSectionRowModel;
              -[SearchUIRowModel accessibilityIdentifier](&v15, sel_accessibilityIdentifier);
              v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
LABEL_21:

  return v9;
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)SearchUICardSectionRowModel;
  -[SearchUICardSectionRowModel description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIRowModel cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v8);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionRowModel;
  v4 = -[SearchUIRowModel copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIsInline:", -[SearchUICardSectionRowModel isInline](self, "isInline"));
  objc_msgSend(v4, "setIsHorizontalInLayout:", -[SearchUICardSectionRowModel isHorizontalInLayout](self, "isHorizontalInLayout"));
  return v4;
}

- (id)contactIdentifiers
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[SearchUIRowModel cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)allowsAppEntityAnnotation
{
  return 1;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setIsInline:(BOOL)a3
{
  self->_isInline = a3;
}

- (BOOL)isHorizontalInLayout
{
  return self->_isHorizontalInLayout;
}

- (void)setIsHorizontalInLayout:(BOOL)a3
{
  self->_isHorizontalInLayout = a3;
}

- (CGSize)minimumLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumLayoutSize.width;
  height = self->_minimumLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumLayoutSize:(CGSize)a3
{
  self->_minimumLayoutSize = a3;
}

- (BOOL)shouldFillAvailableSpace
{
  return self->_shouldFillAvailableSpace;
}

- (void)setShouldFillAvailableSpace:(BOOL)a3
{
  self->_shouldFillAvailableSpace = a3;
}

- (NSString)cardReuseIdentifier
{
  return self->_cardReuseIdentifier;
}

- (void)setCardReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardReuseIdentifier, 0);
}

@end
