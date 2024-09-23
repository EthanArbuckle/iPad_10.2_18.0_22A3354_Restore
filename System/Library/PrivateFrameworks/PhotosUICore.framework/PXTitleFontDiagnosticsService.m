@implementation PXTitleFontDiagnosticsService

- (id)title
{
  return CFSTR("Title Font Diagnostics");
}

- (BOOL)canProvideContextualViewController
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableTitleFontService");

  if (!v4)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection")) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)contextualViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection")))
        {
          objc_msgSend(v9, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:", v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3F20];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__PXTitleFontDiagnosticsService_contextualViewController__block_invoke;
  v16[3] = &unk_1E5136628;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "px_viewControllerWithOutput:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __57__PXTitleFontDiagnosticsService_contextualViewController__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionsInCollectionList:options:", *(_QWORD *)(a1 + 32), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXTitleFontDiagnosticsService diagnosticsDescriptionForAssetCollections:](PXTitleFontDiagnosticsService, "diagnosticsDescriptionForAssetCollections:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)diagnosticsDescriptionForAssetCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "defaultTitleFontNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Count: %li\n\n"), objc_msgSend(v4, "count"));
    v7 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke;
    v54[3] = &unk_1E5136650;
    v8 = v6;
    v55 = v8;
    objc_msgSend(a1, "_statisticsDescriptionForAssetCollections:usingFontIndexBlock:", v4, v54);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_stringByIndentingNewLines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Font Distribution:\n\t%@\n"), v10);

    v52[0] = v7;
    v52[1] = 3221225472;
    v52[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_2;
    v52[3] = &unk_1E5136650;
    v11 = v8;
    v53 = v11;
    objc_msgSend(a1, "_statisticsDescriptionForAssetCollections:usingFontIndexBlock:", v4, v52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_stringByIndentingNewLines");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Creation Date Hash Distribution:\n\t%@\n"), v13);

    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_3;
    v50[3] = &unk_1E5136650;
    v51 = v11;
    v14 = v11;
    objc_msgSend(a1, "_statisticsDescriptionForAssetCollections:usingFontIndexBlock:", v4, v50);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_stringByIndentingNewLines");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Title Hash Distribution:\n\t%@\n"), v16);

    objc_msgSend(v5, "appendString:", CFSTR("Font Names:\n"));
    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_4;
    v48[3] = &unk_1E513DD20;
    v17 = v5;
    v49 = v17;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v48);
    objc_msgSend(v17, "appendString:", CFSTR("\n"));

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v18)
  {
    v19 = v18;
    v20 = CFSTR("Assect Collection: %@\n");
    v21 = 0x1E0CD1000uLL;
    v22 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v5, "appendFormat:", v20, v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;
          objc_msgSend(v25, "photosGraphProperties");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("titleCategory"));
          v26 = v20;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("Title Category (from Graph data): %@\n"), v27);

          v28 = *(void **)(v21 + 1584);
          objc_msgSend(v25, "movieData");
          v29 = v19;
          v30 = v21;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "titleFontNameFromMovieData:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("Font Name (from Movie data): %@\n"), v32);

          v20 = v26;
          v21 = v30;
          v19 = v29;

        }
        v33 = objc_msgSend(v24, "titleCategory");
        objc_msgSend(MEMORY[0x1E0CD13B8], "descriptionOfTitleCategory:", objc_msgSend(v24, "titleCategory"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Title Category: %i “%@”\n"), v33, v34);

        objc_msgSend(v24, "creationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Creation Date: %@\n"), v35);

        v36 = (void *)MEMORY[0x1E0CD13B8];
        objc_msgSend(v24, "creationDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Creation Date Hash: %li\n"), objc_msgSend(v36, "titleFontNameHashFromDate:", v37));

        v38 = (void *)MEMORY[0x1E0CD13B8];
        objc_msgSend(v24, "title");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Title Hash: %li\n"), objc_msgSend(v38, "titleFontNameHashFromString:", v39));

        objc_msgSend(v24, "titleFontName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Font Name: %@\n"), v40);

        objc_msgSend(v5, "appendString:", CFSTR("\n"));
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v19);
  }

  return v5;
}

+ (id)_statisticsDescriptionForAssetCollections:(id)a3 usingFontIndexBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, _QWORD);
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(void *, void *, void *);
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  id v25;
  uint64_t v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CD13B8], "defaultTitleFontNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v33;
    do
    {
      v26 = v13;
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v10);
        v16 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        if (v16 >= v8)
        {
          objc_msgSend(v9, "addObject:", CFSTR("Other"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
      }
      v13 = v26 + v12;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXTitleFontDiagnosticsService__statisticsDescriptionForAssetCollections_usingFontIndexBlock___block_invoke;
  aBlock[3] = &unk_1E5136678;
  v27 = v9;
  v29 = v27;
  v31 = v13;
  v25 = v18;
  v30 = v25;
  v19 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if (v8)
  {
    for (j = 0; j != v8; ++j)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", j);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index:%li"), j, v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, v21, v22);

    }
  }
  if ((objc_msgSend(v27, "containsObject:", CFSTR("Other")) & 1) != 0)
    v19[2](v19, CFSTR("Other"), CFSTR("Other"));
  v23 = v25;

  return v23;
}

void __95__PXTitleFontDiagnosticsService__statisticsDescriptionForAssetCollections_usingFontIndexBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5;
  float v6;
  unint64_t i;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2);
  v6 = (float)((float)v5 / (float)*(unint64_t *)(a1 + 48)) * 100.0;
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@\tcount:%li\t%6.1f%%\t"), v8, v5, v6);
  for (i = (unint64_t)(float)(ceilf(v6) * 0.5); i; --i)
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("*"));
  objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));

}

uint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "titleFontName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3);

  return v4;
}

unint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(a2, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "titleFontNameHashFromDate:", v4);
  v6 = v5 % objc_msgSend(*(id *)(a1 + 32), "count");

  return v6;
}

unint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(a2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "titleFontNameHashFromString:", v4);
  v6 = v5 % objc_msgSend(*(id *)(a1 + 32), "count");

  return v6;
}

uint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%li:\t%@\n"), a3, a2);
}

@end
