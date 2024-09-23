@implementation PXFileRadarViewControllerForContentSyndicationAssets

void __PXFileRadarViewControllerForContentSyndicationAssets_block_invoke(uint64_t a1, int a2, int a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  const __CFString *v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Summary:\nExamples:\n* Bad suggestion (poor quality/blurry photo, wrong person/people, uninteresting, etc.)\n* Missing/wrong assets (should include more from the batch, should have chosen different ones from the batch)\n* Don't want to see this asset, etc…?\n\nSteps To Reproduce:\n-\n\nResults:\n-\n\nRegression:\n-\n\nNotes:\n-\n\n"));
  objc_msgSend(v4, "appendString:", CFSTR("--- Shared With You TTR ---\n"));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v40 = a1;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
        objc_msgSend(v9, "fetchPropertySetsIfNeeded");
        objc_msgSend(v4, "appendFormat:", CFSTR("\nAsset: %@"), v9);
        objc_msgSend(v9, "photoLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "wellKnownPhotoLibraryIdentifier");

        if (objc_msgSend(v9, "isGuestAsset"))
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        v13 = v12;
        objc_msgSend(v4, "appendFormat:", CFSTR("\nIs Guest Type: %@"), v13);

        if (v11 == 3)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        v15 = v14;
        objc_msgSend(v4, "appendFormat:", CFSTR("\nIn syndication library: %@"), v15);

        objc_msgSend(v9, "mediaAnalysisProperties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "syndicationProcessingValue");
        PHAssetMediaAnalysisSyndicationProcessingValueDescription();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\nProcessing Value: %@"), v17);

        objc_msgSend(v9, "mediaAnalysisProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "syndicationProcessingVersion");
        PHAssetSyndicationProcessingVersionDescription();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\nProcessing Version: %@"), v19);

        objc_msgSend(v9, "curationProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "syndicationIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\nSyndication Identifier: %@"), v21);

        v22 = v9;
        objc_msgSend(v22, "fetchPropertySetsIfNeeded");
        v23 = objc_msgSend(v22, "syndicationState");

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if ((v23 & 1) != 0)
        {
          objc_msgSend(v24, "addObject:", CFSTR("FromMe"));
          if ((v23 & 2) == 0)
          {
LABEL_14:
            if ((v23 & 4) == 0)
              goto LABEL_15;
            goto LABEL_23;
          }
        }
        else if ((v23 & 2) == 0)
        {
          goto LABEL_14;
        }
        objc_msgSend(v25, "addObject:", CFSTR("SavedToLibrary"));
        if ((v23 & 4) == 0)
        {
LABEL_15:
          if ((v23 & 8) == 0)
            goto LABEL_17;
LABEL_16:
          objc_msgSend(v25, "addObject:", CFSTR("NoAttachmentSyndication"));
          goto LABEL_17;
        }
LABEL_23:
        objc_msgSend(v25, "addObject:", CFSTR("NoConversationSyndication"));
        if ((v23 & 8) != 0)
          goto LABEL_16;
LABEL_17:
        if (!objc_msgSend(v25, "count"))
          objc_msgSend(v25, "addObject:", CFSTR("None (unsaved; can sync)"));
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "appendFormat:", CFSTR("\nSyndication State: %@"), v26);
        objc_msgSend(v4, "appendString:", CFSTR("\n"));
        ++v8;
      }
      while (v6 != v8);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      v6 = v27;
    }
    while (v27);
  }

  objc_msgSend(v4, "appendString:", CFSTR("\n\n"));
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = *(id *)(v40 + 32);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v29);
        +[PXFeedbackTapToRadarUtilities detailedDebugDescriptionFileForAsset:](PXFeedbackTapToRadarUtilities, "detailedDebugDescriptionFileForAsset:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend(v28, "addObject:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v31);
  }

  if (!a2)
  {
    v36 = 0;
    v35 = a3;
    if (a3)
      goto LABEL_40;
LABEL_42:
    v37 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_43;
  }
  v35 = a3;
  if (!*(_QWORD *)(v40 + 40))
  {
    v36 = 0;
    if (a3)
      goto LABEL_40;
    goto LABEL_42;
  }
  v52 = *(_QWORD *)(v40 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
    goto LABEL_42;
LABEL_40:
  v51 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
  LOWORD(v38) = v35;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", CFSTR("[Shared With You TTR]: <Enter Brief Description>"), v4, CFSTR("Serious Bug"), CFSTR("1073867"), CFSTR("Photos UI Messages Sharing"), CFSTR("iOS"), 0, v36, v28, v38, v37, *(_QWORD *)(v40 + 48));

}

@end
