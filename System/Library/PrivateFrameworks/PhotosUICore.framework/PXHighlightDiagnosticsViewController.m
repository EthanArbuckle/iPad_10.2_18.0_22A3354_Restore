@implementation PXHighlightDiagnosticsViewController

- (PXHighlightDiagnosticsViewController)initWithHighlight:(id)a3
{
  id v5;
  PXHighlightDiagnosticsViewController *v6;
  PXHighlightDiagnosticsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXHighlightDiagnosticsViewController;
  v6 = -[PXCuratedAssetCollectionDiagnosticsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PXHighlightDiagnosticsViewController setTitle:](v6, "setTitle:", CFSTR("Highlight Debug"));
    objc_storeStrong((id *)&v7->_sourceHighlight, a3);
  }

  return v7;
}

- (id)assetsForCurationType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[PHPhotosHighlight photoLibrary](self->_sourceHighlight, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v9);

  objc_msgSend(v6, "setHighlightCurationType:", 0);
  if ((unint64_t)(a3 - 1) < 2)
  {
    v11 = v6;
    v12 = 1;
LABEL_7:
    objc_msgSend(v11, "setHighlightCurationType:", v12);
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    v11 = v6;
    v12 = 2;
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", self->_sourceHighlight, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", self->_sourceHighlight, 0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v10;

  return v13;
}

- (id)radarAttachmentURLs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXHighlightDiagnosticsViewController sourceDictionary](self, "sourceDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[PXCuratedAssetCollectionDiagnosticsViewController fullCurationDebugInformation](self, "fullCurationDebugInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(v5, CFSTR("Photos-Highlight-Debug-Curation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  -[PXCuratedAssetCollectionDiagnosticsViewController hostLayoutDiagnosticDescription](self, "hostLayoutDiagnosticDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(v8, CFSTR("Photos-Highlight-Debug-Layout"), CFSTR("txt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "addObject:", v9);
  -[PXCuratedAssetCollectionDiagnosticsViewController hostViewDiagnosticDescription](self, "hostViewDiagnosticDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(v10, CFSTR("Photos-Highlight-Debug-View"), CFSTR("txt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "addObject:", v11);

  return v3;
}

- (id)sourceDictionary
{
  PHPhotosHighlight *sourceHighlight;
  void *v3;
  void *v4;

  sourceHighlight = self->_sourceHighlight;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXHighlightDiagnosticsHelper preprocessDictionaryForHighlight:inPhotoLibrary:](PXHighlightDiagnosticsHelper, "preprocessDictionaryForHighlight:inPhotoLibrary:", sourceHighlight, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)curationDebugInformationWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight localIdentifier](self->_sourceHighlight, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v33 = v4;
  objc_msgSend(v5, "curationDebugInformationForAssetCollectionWithLocalIdentifier:options:error:", v6, v4, &v41);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v41;

  if (-[PHPhotosHighlight kind](self->_sourceHighlight, "kind") == 3)
  {
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSortDescriptors:", v11);

    v29 = v9;
    objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildDayGroupHighlightsForHighlight:options:", self->_sourceHighlight, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v7, "count"))
      v14 = 0;
    else
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = v13;
    v30 = v7;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v12;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        v18 = 0;
        v19 = v8;
        do
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
          +[PXHighlightDiagnosticsHelper preprocessDictionaryForHighlight:inPhotoLibrary:](PXHighlightDiagnosticsHelper, "preprocessDictionaryForHighlight:inPhotoLibrary:", v20, v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          objc_msgSend(v20, "localIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v19;
          objc_msgSend(v5, "curationDebugInformationForAssetCollectionWithLocalIdentifier:options:error:", v23, v33, &v36);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v36;

          objc_msgSend(v22, "addEntriesFromDictionary:", v24);
          objc_msgSend(v32, "addObject:", v22);
          if (v14)
          {
            if (objc_msgSend(v14, "count"))
            {
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v25 = v34;
              v34[2] = __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke_2;
            }
            else
            {
              v35[0] = MEMORY[0x1E0C809B0];
              v35[1] = 3221225472;
              v25 = v35;
              v35[2] = __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke;
            }
            v25[3] = &unk_1E5134260;
            v25[4] = v14;
            objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v25);

          }
          ++v18;
          v19 = v8;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v16);
    }

    if (v14)
    {
      v26 = v32;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("childDebugInfos"));
      v7 = v14;
      v27 = v30;
    }
    else
    {
      v27 = v30;
      v7 = (id)objc_msgSend(v30, "mutableCopy");
      v26 = v32;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("childDebugInfos"));
    }

  }
  return v7;
}

- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5
{
  PHPhotosHighlight *sourceHighlight;
  void *v9;

  sourceHighlight = self->_sourceHighlight;
  -[PXHighlightDiagnosticsViewController sourceDictionary](self, "sourceDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[PXHighlightDiagnosticsHelper generateSectionTitles:andTableContent:forIndex:sourceHighlight:sourceDictionary:](PXHighlightDiagnosticsHelper, "generateSectionTitles:andTableContent:forIndex:sourceHighlight:sourceDictionary:", a3, a4, a5, sourceHighlight, v9);

  return a5;
}

- (id)radarComponentInfoForRoute:(id)a3
{
  int v3;
  PXCuratedAssetCollectionDiagnosticsRadarComponentInformation *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = objc_msgSend(a3, "isEqualToString:", CFSTR("Backend"));
  v4 = [PXCuratedAssetCollectionDiagnosticsRadarComponentInformation alloc];
  if (v3)
  {
    v5 = CFSTR("1393602");
    v6 = CFSTR("Photos Curated Library");
    v7 = CFSTR("all");
  }
  else
  {
    v5 = CFSTR("937048");
    v6 = CFSTR("Photos UI Library");
    v7 = CFSTR("iOS");
  }
  return -[PXCuratedAssetCollectionDiagnosticsRadarComponentInformation initWithComponentID:name:version:](v4, "initWithComponentID:name:version:", v5, v6, v7);
}

- (id)radarTitleTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PHPhotosHighlight localizedTitle](self->_sourceHighlight, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[CURATED LIBRARY] '%@'"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)radarDescriptionTemplate
{
  return CFSTR("We should have something sensible here");
}

- (id)radarRoutes
{
  return &unk_1E53EA110;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceHighlight, 0);
}

void __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("items"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("rootCluster"));
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("sortedObjects"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v13);
  }

}

void __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v8);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("totalNumberOfItems"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v17);

  }
}

@end
