@implementation PXMemoryDiagnosticsViewController

- (PXMemoryDiagnosticsViewController)initWithMemory:(id)a3
{
  id v5;
  PXMemoryDiagnosticsViewController *v6;
  PXMemoryDiagnosticsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoryDiagnosticsViewController;
  v6 = -[PXCuratedAssetCollectionDiagnosticsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PXMemoryDiagnosticsViewController setTitle:](v6, "setTitle:", CFSTR("Memory Debug"));
    objc_storeStrong((id *)&v7->_sourceMemory, a3);
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
  -[PHMemory photoLibrary](self->_sourceMemory, "photoLibrary");
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
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", self->_sourceMemory, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", self->_sourceMemory, 0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v10;

  return v13;
}

- (id)sourceDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemory localIdentifier](self->_sourceMemory, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "requestMemoryDebugInformationForMemoryWithLocalIdentifier:error:", v5, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  -[PHMemory photosGraphProperties](self->_sourceMemory, "photosGraphProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemory localIdentifier](self->_sourceMemory, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHMemory photosGraphVersion](self->_sourceMemory, "photosGraphVersion");

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:](PXMemoriesRelatedDiagnosticsHelper, "preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)curationDebugInformationWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CD16F8];
  v5 = a3;
  objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemory localIdentifier](self->_sourceMemory, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "curationDebugInformationForAssetCollectionWithLocalIdentifier:options:error:", v7, v5, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5
{
  int64_t v7;
  PHMemory *sourceMemory;
  void *v9;
  BOOL v10;

  if (a5 == 3)
    v7 = 2;
  else
    v7 = a5;
  sourceMemory = self->_sourceMemory;
  -[PXMemoryDiagnosticsViewController sourceDictionary](self, "sourceDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PXMemoriesRelatedDiagnosticsHelper generateSectionTitles:andTableContent:forIndex:sourceMemory:sourceDictionary:](PXMemoriesRelatedDiagnosticsHelper, "generateSectionTitles:andTableContent:forIndex:sourceMemory:sourceDictionary:", a3, a4, v7, sourceMemory, v9);

  return v10;
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
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  PHMemory *sourceMemory;
  void *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXMemoryDiagnosticsViewController sourceDictionary](self, "sourceDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[PXCuratedAssetCollectionDiagnosticsViewController fullCurationDebugInformation](self, "fullCurationDebugInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", self->_sourceMemory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("memorySummary"));
  PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(v5, CFSTR("MemoryInfoAndCuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "addObject:", v8);
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoAnalysisClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D72050];
  v20 = 0;
  objc_msgSend(v11, "requestExportGraphForPurpose:error:", v12, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v9, "addObject:", v15);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error exporting the graph for TTR: %@", buf, 0xCu);
  }
  if (-[PHMemory isGenerative](self->_sourceMemory, "isGenerative"))
  {

    sourceMemory = self->_sourceMemory;
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0D77E88], "memoryCreationDiagnosticFilesForMemory:error:", sourceMemory, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    if (v17)
      objc_msgSend(v9, "addObjectsFromArray:", v17);

  }
  return v9;
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
    v5 = CFSTR("936729");
    v6 = CFSTR("Photos Memories");
    v7 = CFSTR("all");
  }
  else
  {
    v5 = CFSTR("681154");
    v6 = CFSTR("Photos UI Memories");
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
  -[PHMemory localizedTitle](self->_sourceMemory, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[MEMORIES] '%@'"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)radarDescriptionTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PHMemory localizedTitle](self->_sourceMemory, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n- Do you like/dislike the memory? Why?\n\n- Is the title '%@' correct? What would be a better title?\n\n- Do you like the key asset? Would you have picked another one?\n\n- Was this the right time to show you this memory?\n\n- Did you receive a notification? If so, did you appreciate it?\n\n- Other feedback (people, music, movie, selected pictures, place, etc):\n\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)radarRoutes
{
  return &unk_1E53E9FC0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceMemory, 0);
}

@end
