@implementation SSRelatedSearchesSectionBuilder

+ (id)supportedBundleIds
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.parsec.related_search");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldSkipSection
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSRelatedSearchesSectionBuilder;
  if (-[SSSectionBuilder shouldSkipSection](&v8, sel_shouldSkipSection))
    return 1;
  -[SSSectionBuilder queryContext](self, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isContactEntitySearch"))
    v3 = -[SSSectionBuilder renderState](self, "renderState") != 4;
  else
    v3 = 0;

  return v3;
}

- (id)buildCardSections
{
  SSRelatedSearchesSectionBuilder *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  SSRelatedSearchesSectionBuilder *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v2 = self;
  v53 = *MEMORY[0x1E0C80C00];
  -[SSSectionBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v3;
  objc_msgSend(v3, "searchString");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v6, "length"))
  {
    objc_msgSend(v5, "searchString");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v7;
  }
  objc_msgSend(v5, "tokenText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length")
    && -[__CFString length](v6, "length")
    && (-[__CFString isEqualToString:](v6, "isEqualToString:", v8) & 1) == 0
    && (objc_msgSend(v5, "isPhotosEntitySearch") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("SEARCH_CONTINUATION_STRING_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "length")
    && !-[__CFString length](v6, "length")
    && (objc_msgSend(v5, "isPhotosEntitySearch") & 1) == 0)
  {
    v9 = v8;
LABEL_12:

    v6 = v9;
  }
  v42 = v8;
  v43 = v5;
  if (!v6)
    v6 = &stru_1E6E549F0;
  -[SSSectionBuilder section](v2, "section");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v17)
  {
    v18 = v17;
    v41 = v2;
    v19 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v21, "inlineCard");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cardSections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "command");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "title");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "text");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "isEqualToString:", v6))
        {

LABEL_29:
          v30 = 1;
          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v25, "searchString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", v6);

          if ((v29 & 1) != 0)
            goto LABEL_29;
        }
        else
        {

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v18)
        continue;
      break;
    }
    v30 = 0;
LABEL_30:
    v2 = v41;
  }
  else
  {
    v30 = 0;
  }

  v45.receiver = v2;
  v45.super_class = (Class)SSRelatedSearchesSectionBuilder;
  -[SSSectionBuilder buildCardSections](&v45, sel_buildCardSections);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v30 & 1) == 0)
  {
    objc_msgSend(CFSTR("rs:"), "stringByAppendingString:", v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIsEmphasized:", 1);
    v34 = (void *)objc_opt_new();
    v51 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFormattedTextPieces:", v35);

    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setSearchString:", v6);
    v37 = (void *)objc_opt_new();
    objc_msgSend(v37, "setSuggestionText:", v34);
    objc_msgSend(v37, "setSuggestionType:", 4);
    objc_msgSend(v37, "setResultIdentifier:", v32);
    objc_msgSend(v37, "setCardSectionId:", v32);
    objc_msgSend(v37, "setCommand:", v36);
    v50 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v31);
    v39 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v39;
  }

  return v31;
}

- (id)buildTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RELATED_SEARCHES"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  return 0;
}

@end
