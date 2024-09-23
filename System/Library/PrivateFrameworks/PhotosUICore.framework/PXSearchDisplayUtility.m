@implementation PXSearchDisplayUtility

+ (id)listStringJoiningSearchTerms:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = sub_1A7AE3A10();
  sub_1A69C9924(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v4;
}

+ (BOOL)attributedStringFontNeedsUpdate:(id)a3 currentFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v5 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "attributesAtIndex:effectiveRange:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DC1390];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1390]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v12 != v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)highlightedAttributedStringForString:(id)a3 highlightedSubstring:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  id v22;
  id v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11 && a6)
  {
    v12 = *MEMORY[0x1E0DC1140];
    v25 = *MEMORY[0x1E0DC1140];
    v26[0] = a6;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = a6;
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CB3778]);

    v17 = (void *)objc_msgSend(v16, "initWithString:attributes:", v9, v15);
    v18 = objc_msgSend(v9, "rangeOfString:options:", v10, 129);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v17, "addAttribute:value:range:", v12, v11, v18, v19);
    v20 = (void *)objc_msgSend(v17, "copy");

  }
  else
  {
    v21 = (objc_class *)MEMORY[0x1E0CB3498];
    v22 = a6;
    v23 = [v21 alloc];

    v20 = (void *)objc_msgSend(v23, "initWithString:", &stru_1E5149688);
  }

  return v20;
}

+ (id)localizedListStringFromSearchTokenNames:(id)a3 searchText:(id)a4 includeQuotationDelimitersForSearchText:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v14, "length"))
        {
          if (v5)
          {
            PXLocalizedStringFromTable(CFSTR("QUOTED_SEARCH_TEXT_FORMAT"), CFSTR("PhotosUICore"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v14;
            PXStringWithValidatedFormat();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16, v23);

          }
          else
          {
            objc_msgSend(v8, "addObject:", v14);
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v17 = v24;
  if (objc_msgSend(v24, "length"))
  {
    if (v5)
    {
      PXLocalizedStringFromTable(CFSTR("QUOTED_SEARCH_TEXT_FORMAT"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v24;
      PXStringWithValidatedFormat();
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
    objc_msgSend(v8, "addObject:", v17, v22);
  }
  +[PXSearchDisplayUtility listStringJoiningSearchTerms:](PXSearchDisplayUtility, "listStringJoiningSearchTerms:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)defaultStringAttributes
{
  return +[PXSearchTitlesSpec searchDefaultTitleAttributes](PXSearchTitlesSpec, "searchDefaultTitleAttributes");
}

+ (id)wordEmbeddingTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)wordEmbeddingPathColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (BOOL)layoutDirectionIsRTL
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  return v3;
}

+ (BOOL)shouldUseAccessibilityLayout
{
  void *v2;
  NSString *v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

+ (double)automaticRowHeight
{
  return *MEMORY[0x1E0DC53D8];
}

+ (id)displayStringFromResultCount:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 >> 5 < 0xC35)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%li"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 100000)
      v3 = CFSTR("SEARCH_SUGGESTED_RESULTS_THOUSAND_COUNT");
    else
      v3 = CFSTR("SEARCH_SUGGESTED_RESULTS_THOUSAND_PLUS_COUNT");
    PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
