@implementation PUAudioClassificationAssetBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAudioClassificationAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUAudioClassificationAssetBrowserDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUTTR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v13, 0, self, sel__presentTapToRadar);
  v15.receiver = self;
  v15.super_class = (Class)PUAudioClassificationAssetBrowserDebugViewController;
  -[PUPhotosGridViewController getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:](&v15, sel_getTitle_prompt_shouldHideBackButton_leftBarButtonItems_rightBarButtonItems_, a3, a4, a5, a6, a7);
  if (*a6)
  {
    objc_msgSend(*a6, "arrayByAddingObject:", v14);
  }
  else
  {
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)_presentTapToRadar
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAnyAssetSelectedInAssetCollection:", v4);

  if ((v5 & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E58A9910;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D7B428], "presentTermsAndConditionsForUIViewController:completion:", self, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("File radar without attaching photos?\nSelecting incorrect photos can help improve the audio classification feature."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E58A8DE8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);
    objc_msgSend(v6, "addAction:", v8);
    -[PUAudioClassificationAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Collecting data for radar..."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E58AB790;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PUAudioClassificationAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);

}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  NSString *audioClassificationName;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  BOOL v31;
  NSObject *v32;
  id v34;
  id obj;
  NSObject *v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  const __CFString *v43;
  NSObject *v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t v49[128];
  uint8_t buf[4];
  NSObject *v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v36 = v6;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v42);
  v10 = v42;

  if ((v9 & 1) != 0)
  {
    v11 = objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v34 = v7;
    obj = v7;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          v16 = v11;
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          -[PUAudioClassificationAssetBrowserDebugViewController _cloneAsset:toDirectory:](self, "_cloneAsset:toDirectory:", v17, v36);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mediaAnalysisProperties");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "audioClassification");
          PHAssetMediaAnalysisStringsWithMultipleAudioClassifications();
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v47[0] = CFSTR("image");
          objc_msgSend(v18, "lastPathComponent");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
            v23 = (const __CFString *)v21;
          else
            v23 = &stru_1E58AD278;
          v47[1] = CFSTR("audioClassifications");
          v48[0] = v23;
          v48[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v16;
          -[NSObject addObject:](v16, "addObject:", v24);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      }
      while (v13);
    }

    v45[0] = CFSTR("type");
    v45[1] = CFSTR("audioClassificationName");
    audioClassificationName = self->_audioClassificationName;
    v46[0] = CFSTR("audioClassifications");
    v46[1] = audioClassificationName;
    v45[2] = CFSTR("report");
    v43 = CFSTR("FP");
    v44 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v10;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v27, 1, &v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v37;

    if (v28)
    {
      -[NSObject URLByAppendingPathComponent:](v36, "URLByAppendingPathComponent:", CFSTR("report.json"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = 1;
      if ((objc_msgSend(v28, "writeToURL:atomically:", v30, 1) & 1) == 0)
      {
        PLUIGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v7 = v34;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v30;
          v52 = 2112;
          v53 = v29;
          _os_log_impl(&dword_1AAB61000, v32, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
        }

        v31 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      PLUIGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v29;
        _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
      v31 = 0;
    }
    v7 = v34;
LABEL_24:

    goto LABEL_25;
  }
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v36;
    v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  v31 = 0;
  v29 = v10;
LABEL_25:

  return v31;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      if (objc_msgSend(v11, "type") == 9)
        break;
      if (v8 == (id)++v10)
      {
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v8 = v11;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalFilename");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathExtension:", v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(MEMORY[0x1E0CD1470]);
      objc_msgSend(v18, "setNetworkAccessAllowed:", 1);
      objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = dispatch_semaphore_create(0);
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__23154;
      v27[4] = __Block_byref_object_dispose__23155;
      v28 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __80__PUAudioClassificationAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke;
      v23[3] = &unk_1E589E168;
      v26 = v27;
      v12 = v17;
      v24 = v12;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "writeDataForAssetResource:toFile:options:completionHandler:", v8, v12, v18, v23);
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

      _Block_object_dispose(v27, 8);
      goto LABEL_12;
    }
    v12 = 0;
  }
  else
  {
LABEL_9:
    v12 = 0;
LABEL_12:

  }
  return v12;
}

- (NSString)audioClassificationName
{
  return self->_audioClassificationName;
}

- (void)setAudioClassificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1800);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioClassificationName, 0);
}

void __80__PUAudioClassificationAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to write asset data to URL: %@, error: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "assetCollectionAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = objc_msgSend(a1[5], "count");
  v5 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v4 / (double)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" Audio Classification has %ld incorrect classification(s)"), *((_QWORD *)a1[4] + 225), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("— Audio Classification Feedback —\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Audio Classification: \"%@\"\n"), *((_QWORD *)a1[4] + 225));
  objc_msgSend(v9, "appendFormat:", CFSTR("Incorrect Classification(s): %ld of %ld (%@)\n"), v4, v3, v7);
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "_writeDiagnosticsToURL:incorrectAssets:", v14, a1[5]) & 1) == 0)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 4, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (!v17)
  {
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }

  }
  v20 = (void *)MEMORY[0x1E0D7B428];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_173;
  v24[3] = &unk_1E58A8E10;
  v24[4] = a1[4];
  v25 = a1[6];
  v26 = v16;
  v27 = v14;
  v21 = v14;
  v22 = v16;
  LOBYTE(v23) = 0;
  objc_msgSend(v20, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v8, v9, CFSTR("Other Bug"), CFSTR("994107"), CFSTR("Audio - DSP Algorithm Machine Learning"), CFSTR("All"), CFSTR("1132540"), v17, v23, v24);

}

void __86__PUAudioClassificationAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_173(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  v2 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }

  }
}

uint64_t __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", 0);
}

void __74__PUAudioClassificationAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", v3);

  }
}

@end
