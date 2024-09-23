@implementation SSLegacySectionBuilder

+ (id)supportedBundleIds
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.spotlight.related_search");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compactCardSectionForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "compactCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)buildSection
{
  SSLegacySectionBuilder *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  id v43;
  uint64_t v44;
  void *v45;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  SSLegacySectionBuilder *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v2 = self;
  v72 = *MEMORY[0x1E0C80C00];
  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableDeepCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSSectionBuilder section](v2, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setResults:", v7);

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = -[SSSectionBuilder isTopHitSection](v2, "isTopHitSection");
  v53 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v4, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v8;
  v52 = v2;
  v55 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v66;
    v49 = v9;
    v50 = v4;
    v48 = v10;
    v47 = v11;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v66 != v54)
          objc_enumerationMutation(v11);
        v13 = *(id *)(*((_QWORD *)&v65 + 1) + 8 * v12);
        objc_msgSend(v13, "inlineCard");
        v14 = objc_claimAutoreleasedReturnValue();
        v56 = v12;
        if (v14)
        {
          v15 = (void *)v14;
          v16 = v13;
LABEL_8:

          v13 = v16;
          goto LABEL_10;
        }
        objc_msgSend(v13, "compactCard");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          +[SSResultBuilder resultBuilderWithResult:](SSResultBuilder, "resultBuilderWithResult:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSSectionBuilder queryContext](v2, "queryContext");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setQueryContext:", v35);

          objc_msgSend(v15, "setIsTopHit:", v10);
          objc_msgSend(v15, "buildResult");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "supportsClearingBackendData"))
            objc_msgSend(v16, "clearBackendData");
          if (v16)
            objc_msgSend(v53, "addObject:", v16);
          goto LABEL_8;
        }
LABEL_10:
        objc_msgSend(v4, "results", v47);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count") == 1)
          v19 = v10;
        else
          v19 = 0;
        if (v19 == 1
          && SSSnippetModernizationEnabled()
          && (objc_msgSend(v13, "usesCompactDisplay") & 1) == 0)
        {
          v20 = objc_msgSend(v13, "shouldUseCompactDisplay");

          if ((v20 & 1) != 0)
            goto LABEL_34;
          objc_msgSend(v13, "inlineCard");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cardSections");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v18 = v22;
          v23 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v62 != v25)
                  objc_enumerationMutation(v18);
                v27 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                objc_msgSend(v27, "backgroundColor");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v28)
                {
                  v29 = (void *)objc_opt_new();
                  objc_msgSend(v13, "relatedAppIdentifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v30)
                  {
                    objc_msgSend(v29, "setApplicationBundleIdentifier:", v30);
                  }
                  else
                  {
                    objc_msgSend(v13, "applicationBundleIdentifier");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v31)
                    {
                      objc_msgSend(v29, "setApplicationBundleIdentifier:", v31);
                    }
                    else
                    {
                      objc_msgSend(v13, "sectionBundleIdentifier");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setApplicationBundleIdentifier:", v32);

                    }
                  }

                  objc_msgSend(v27, "setBackgroundColor:", v29);
                }
              }
              v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
            }
            while (v24);
          }

          v4 = v50;
          v8 = v51;
          v2 = v52;
          v9 = v49;
          v10 = v48;
          v11 = v47;
        }

LABEL_34:
        if (v13)
          objc_msgSend(v9, "addObject:", v13);
        objc_msgSend((id)objc_opt_class(), "compactCardSectionForResult:", v13);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33)
        {
          objc_msgSend(v33, "setSpotlightBackingResult:", v13);
          objc_msgSend(v8, "addObject:", v34);
        }

        v12 = v56 + 1;
      }
      while (v56 + 1 != v55);
      v36 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      v55 = v36;
    }
    while (v36);
  }

  objc_msgSend((id)objc_opt_class(), "disambiguateUIIfNecessary:", v8);
  v37 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v38 = v9;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v58 != v41)
          objc_enumerationMutation(v38);
        v43 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * j);
        if (objc_msgSend(v53, "containsObject:", v43))
        {
          v44 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResult:", v43);

          v43 = (id)v44;
        }
        objc_msgSend(v37, "addObject:", v43);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v40);
  }

  objc_msgSend(v4, "setResults:", v37);
  -[SSSectionBuilder buildButtonItem](v52, "buildButtonItem");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButton:", v45);

  return v4;
}

@end
