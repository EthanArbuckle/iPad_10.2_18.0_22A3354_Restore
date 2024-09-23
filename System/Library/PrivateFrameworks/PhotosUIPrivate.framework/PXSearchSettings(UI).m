@implementation PXSearchSettings(UI)

+ (id)settingsControllerModule
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  id v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD aBlock[4];
  id v59;
  uint64_t v60;
  _QWORD v61[3];
  _QWORD v62[2];
  _QWORD v63[8];

  v63[6] = *MEMORY[0x1E0C80C00];
  v51 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83068], "rowWithTitle:valueKeyPath:", CFSTR("Override Matched Text"), CFSTR("overrideMatchedQueryText"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v47;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Indexing Footer"), CFSTR("forceIndexingFooter"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v1;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Indexing Banner Theshold"), CFSTR("indexingBannerPercentageThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 1.0, 100.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_increment:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Indexing Paused Title"), CFSTR("forceIndexingPausedTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("forceIndexingFooter == YES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "condition:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v7;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Autocorrect"), CFSTR("enableAutoCorrect"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "px_rowWithTitle:valueKeyPath:condition:", CFSTR("Disable Top Asset Curation"), CFSTR("disableTopAssetCuration"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sectionWithRows:title:", v10, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetsdClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke;
  aBlock[3] = &unk_1E58A9288;
  v14 = v12;
  v59 = v14;
  v60 = a1;
  v15 = _Block_copy(aBlock);
  v16 = (void *)MEMORY[0x1E0D83010];
  v17 = (void *)MEMORY[0x1E0D830A0];
  v55[0] = v13;
  v55[1] = 3221225472;
  v55[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_6;
  v55[3] = &unk_1E58A7CC0;
  v56 = v14;
  v18 = v15;
  v57 = v18;
  v50 = v14;
  objc_msgSend(v17, "actionWithHandler:", v55);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:action:", CFSTR("Rebuild Search Index"), v19);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83010];
  v21 = (void *)MEMORY[0x1E0D830A0];
  v53[0] = v13;
  v53[1] = 3221225472;
  v53[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_76;
  v53[3] = &unk_1E58A7CE8;
  v54 = v18;
  v48 = v18;
  objc_msgSend(v21, "actionWithHandler:", v53);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:action:", CFSTR("Search Index Status"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83078];
  v62[0] = v46;
  v62[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v25, CFSTR("Index"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Embedding Search"), CFSTR("enableEmbeddingSearch"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Similarity"), CFSTR("embeddingVectorDistanceThreshold"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minValue:maxValue:", -1.0, 0.9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "px_increment:", 0.1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("enableEmbeddingSearch == YES"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "condition:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_queryDepersonalizationType);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Query Depersonalization"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "possibleValues:titles:", &unk_1E59BA840, &unk_1E59BA858);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("enableEmbeddingSearch == YES"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "condition:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0D83078];
  v61[0] = v27;
  v61[1] = v32;
  v61[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionWithRows:title:", v40, CFSTR("⚠️ Embedding Prototype ⚠️"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v43, "addObject:", v52);
  objc_msgSend(v43, "addObject:", v26);
  objc_msgSend(v43, "addObject:", v41);
  objc_msgSend(v43, "addObject:", v42);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Search"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (__CFString)_formatIndexingStatusAlertMessageForRemainingCount:()UI isPaused:elapsedTimeSincePause:
{
  __CFString *v5;
  uint64_t v7;

  if (a4)
  {
    if (a5)
    {
      if (a1 < 1.0)
        a1 = 1.0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Indexing has been paused for %.0f minute(s).\nRemaining objects count: %ld"), *(_QWORD *)&a1, a4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Remaining objects count: %ld"), a4, v7);
    }
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Indexing complete");
  }
  return v5;
}

@end
