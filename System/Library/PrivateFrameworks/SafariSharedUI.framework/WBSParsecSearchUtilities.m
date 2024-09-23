@implementation WBSParsecSearchUtilities

+ (BOOL)anyParsecSearchResult:(id)a3 fuzzyMatchesSuggestedSiteURLString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = (void *)MEMORY[0x1E0C99E98];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__WBSParsecSearchUtilities_anyParsecSearchResult_fuzzyMatchesSuggestedSiteURLString___block_invoke_2;
    v12[3] = &unk_1E5445130;
    v13 = v7;
    v14 = &v15;
    objc_msgSend(v9, "safari_enumeratePossibleURLsForUserTypedString:withBlock:", v8, v12);
    v10 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __85__WBSParsecSearchUtilities_anyParsecSearchResult_fuzzyMatchesSuggestedSiteURLString___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "subtype") == 1)
  {
    objc_msgSend(v2, "urlString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 4, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __85__WBSParsecSearchUtilities_anyParsecSearchResult_fuzzyMatchesSuggestedSiteURLString___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  char v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (indexOfURLInParsecURLStrings(v10, *(void **)(a1 + 32)) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(v10, "safari_hasScheme:", CFSTR("http"));
    v6 = CFSTR("https");
    if ((v5 & 1) == 0)
    {
      if (!objc_msgSend(v10, "safari_hasScheme:", CFSTR("https")))
      {
        v9 = v10;
        goto LABEL_9;
      }
      v6 = CFSTR("http");
    }
    objc_msgSend(v10, "safari_URLByReplacingSchemeWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = indexOfURLInParsecURLStrings(v7, *(void **)(a1 + 32));
    v9 = v7;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }
  else
  {
    v9 = v10;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a3 = 1;
LABEL_9:

}

@end
