@implementation PXFeedbackImageQualityUIViewController

- (PXFeedbackImageQualityUIViewController)initWithAssets:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PXFeedbackImageQualityUIViewController *v9;
  PXFeedbackImageQualityUIViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedbackImageQualityUIViewController;
  v9 = -[PXFeedbackImageQualityUIViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PXFeedbackFormUIViewController *v23;
  void *v24;
  void *v25;
  PXFeedbackFormUIViewController *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PXFeedbackImageQualityUIViewController;
  -[PXFeedbackImageQualityUIViewController viewDidLoad](&v28, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
  -[PXFeedbackImageQualityUIViewController setNavigationController:](self, "setNavigationController:", v3);

  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController addChildViewController:](self, "addChildViewController:", v4);

  -[PXFeedbackImageQualityUIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  -[PXFeedbackImageQualityUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 18);

  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "didMoveToParentViewController:", self);

  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToolbarHidden:", 0);

  v23 = [PXFeedbackFormUIViewController alloc];
  -[PXFeedbackImageQualityUIViewController positiveFeedbackKeys](self, "positiveFeedbackKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController negativeFeedbackKeys](self, "negativeFeedbackKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PXFeedbackFormUIViewController initWithDelegate:positiveKeys:negativeKeys:wantsCustomFeedbackSection:](v23, "initWithDelegate:positiveKeys:negativeKeys:wantsCustomFeedbackSection:", self, v24, v25, 1);

  -[PXFeedbackImageQualityUIViewController navigationController](self, "navigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pushViewController:animated:", v26, 1);

}

- (id)longTitleText
{
  return PXLocalizedStringFromTable(CFSTR("FeedbackLikeItOrNotViewController.longTitle.ImageQuality"), CFSTR("PXFeedbackCollection"));
}

- (id)viewTitleForRadar
{
  return CFSTR("Image Quality Feedback");
}

- (BOOL)shouldDisplaySecondaryFeedbackButtons
{
  return 0;
}

- (id)positiveFeedbackKeys
{
  return +[PXFeedbackEntry positiveFeedbackForImageQualityKeys](PXFeedbackEntry, "positiveFeedbackForImageQualityKeys");
}

- (id)negativeFeedbackKeys
{
  return +[PXFeedbackEntry negativeFeedbackForImageQualityKeys](PXFeedbackEntry, "negativeFeedbackForImageQualityKeys");
}

- (id)negativeAlchemistFeedbackKeys
{
  return +[PXFeedbackEntry negativeAlchemistFeedbackForImageQualityKeys](PXFeedbackEntry, "negativeAlchemistFeedbackForImageQualityKeys");
}

- (void)userSentPositiveFeedback:(id)a3 negativeFeedback:(id)a4 customFeedback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXFeedbackImageQualityUIViewController assets](self, "assets");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController _fileRadarWithAssets:positiveFeedback:negativeFeedback:customFeedback:](self, "_fileRadarWithAssets:positiveFeedback:negativeFeedback:customFeedback:", v11, v10, v9, v8);

}

- (BOOL)shouldContinuePresentingFormAfterFeedback
{
  return 1;
}

- (BOOL)wantsPositiveFeedbackSection
{
  return 0;
}

- (BOOL)wantsCustomFeedbackSection
{
  return 1;
}

- (void)userDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PXFeedbackImageQualityUIViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackImageQualityUIViewController:didFinish:", self, v3);

}

- (void)_fileRadarWithAssets:(id)a3 positiveFeedback:(id)a4 negativeFeedback:(id)a5 customFeedback:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *assets;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  _QWORD *v48;
  id v49;
  id location;
  _QWORD v51[6];
  _QWORD v52[3];
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v33 = a4;
  v11 = a5;
  v36 = a6;
  -[PXFeedbackImageQualityUIViewController setAssets:](self, "setAssets:", v10);
  v34 = v11;
  -[PXFeedbackImageQualityUIViewController setNegativeFeedback:](self, "setNegativeFeedback:", v11);
  -[PXFeedbackImageQualityUIViewController setImageQualityDiagnosticFileURLs:](self, "setImageQualityDiagnosticFileURLs:", 0);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v61;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v15), "isSpatialMedia") & 1) != 0)
        {
          v16 = 1;
          goto LABEL_11;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Collecting data for radar..."), 0, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addAction:", v35);
  -[PXFeedbackImageQualityUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v39, 1, 0);
  -[PXFeedbackImageQualityUIViewController _generateTitleForFeedback:forAssets:](self, "_generateTitleForFeedback:forAssets:", self->_negativeFeedback, v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(CFSTR("[Spatial] "), "stringByAppendingString:", v37);
    v17 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v17;
  }
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__79658;
  v58 = __Block_byref_object_dispose__79659;
  v59 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend((id)v55[5], "appendString:", CFSTR("This radar was filed using Photos' internal Tap-to-Radar for Image Quality. If you believe this radar is not in the correct component, please route to Camera Image Feedback | iOS. \n \n"));
  if (v16)
    objc_msgSend((id)v55[5], "appendString:", CFSTR("Observed in immersive mode (Y/N)? \n \n"));
  objc_msgSend((id)v55[5], "appendString:", CFSTR("— Please add any additional comments here —\n"));
  objc_msgSend((id)v55[5], "appendFormat:", CFSTR("%@\n \n"), v36);
  objc_msgSend((id)v55[5], "appendString:", CFSTR("— Image Quality Feedback —\n"));
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v53 = 0;
  -[PXFeedbackImageQualityUIViewController negativeFeedback](self, "negativeFeedback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke;
  v51[3] = &unk_1E513E228;
  v51[4] = v52;
  v51[5] = &v54;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v51);

  -[PXFeedbackImageQualityUIViewController _generateURLsForAssetsDBGFiles:](self, "_generateURLsForAssetsDBGFiles:", self->_assets);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController _generateZippedCaptureFoldersForAssets:](self, "_generateZippedCaptureFoldersForAssets:", self->_assets);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v21 = -[PXFeedbackImageQualityUIViewController _radarComponentForFeedback:](self, "_radarComponentForFeedback:", self->_negativeFeedback);
  -[PXFeedbackImageQualityUIViewController _componentNameForComponent:](self, "_componentNameForComponent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController _componentIDForComponent:](self, "_componentIDForComponent:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController _keywordIDForComponent:](self, "_keywordIDForComponent:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CD1390];
  assets = self->_assets;
  v40[0] = v19;
  v40[1] = 3221225472;
  v40[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_2;
  v40[3] = &unk_1E51228B8;
  objc_copyWeak(&v49, &location);
  v27 = v32;
  v41 = v27;
  v28 = v20;
  v42 = v28;
  v38 = v37;
  v43 = v38;
  v47 = &v54;
  v29 = v23;
  v44 = v29;
  v30 = v22;
  v45 = v30;
  v31 = v24;
  v46 = v31;
  v48 = v52;
  objc_msgSend(v25, "px_generateResourceFilesForAssets:completionHandler:", assets, v40);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v54, 8);

}

- (void)_dismissActiveAlertControllerWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXFeedbackImageQualityUIViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PXFeedbackImageQualityUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v5);

}

- (id)_generateTitleForFeedback:(id)a3 forAssets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ I took a photo and "), CFSTR("IQF :"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "mediaType") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ I took a video and "), CFSTR("IQF :"));
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v12;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "appendString:", v7);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__PXFeedbackImageQualityUIViewController__generateTitleForFeedback_forAssets___block_invoke;
  v19[3] = &unk_1E51228E0;
  v13 = v6;
  v20 = v13;
  v21 = &v22;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (*((_BYTE *)v23 + 24))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "length") - 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v13, "appendString:", CFSTR("it wasn't what I expected"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (int64_t)_radarComponentForFeedback:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PXFeedbackImageQualityUIViewController__radarComponentForFeedback___block_invoke;
  v11[3] = &unk_1E5148268;
  v6 = v5;
  v12 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(v6, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "integerValue");

    }
    else if (objc_msgSend(v6, "containsObject:", &unk_1E53EC8B8))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_componentIDForComponent:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  switch(a3)
  {
    case 1:
      v3 = CFSTR("863870");
      return v3;
    case 2:
      v3 = CFSTR("1576982");
      return v3;
    case 3:
      v3 = CFSTR("819310");
      return v3;
    case 4:
      v3 = CFSTR("1080636");
      return v3;
    case 5:
      v3 = CFSTR("1106155");
      return v3;
    case 6:
      v3 = CFSTR("1571907");
      goto LABEL_11;
    case 7:
      v3 = CFSTR("1104679");
      goto LABEL_11;
    case 8:
      v3 = CFSTR("1579308");
LABEL_11:
      v4 = v3;
      break;
    default:
      v3 = CFSTR("852230");
      break;
  }
  return v3;
}

- (id)_componentNameForComponent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("Camera Image Feedback");
  else
    return off_1E5122928[a3 - 1];
}

- (id)_keywordIDForComponent:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 4)
    return 0;
  else
    return off_1E5122968[a3 - 4];
}

- (id)_generateURLsForAssetsDBGFiles:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v56;
    v8 = CFSTR("IMG");
    v36 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      v37 = v6;
      do
      {
        if (*(_QWORD *)v56 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
        objc_msgSend(v10, "fileURLsForDiagnosticFiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            v42 = v9;
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v40 = v12;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v52;
              while (2)
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v52 != v16)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "originalFilename");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v18, "hasPrefix:", v8))
                  {
                    objc_msgSend(v18, "stringByDeletingPathExtension");
                    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    goto LABEL_18;
                  }

                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
                if (v15)
                  continue;
                break;
              }
            }
            v45 = &stru_1E5149688;
LABEL_18:

            objc_msgSend(v10, "uuid");
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_opt_new();
            NSTemporaryDirectory();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)v19;
            objc_msgSend(v21, "stringByAppendingPathComponent:", v19);
            v22 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v22;
            v44 = v20;
            if ((objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, 0, 0) & 1) == 0)NSLog(CFSTR("Failed to create temporary directory for TTR Image Quality Feedback"));
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v41 = v11;
            v46 = v11;
            v23 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v48;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v48 != v25)
                    objc_enumerationMutation(v46);
                  v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                  objc_msgSend(v27, "lastPathComponent");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v28, "hasPrefix:", v8))
                  {
                    objc_msgSend(v4, "addObject:", v27);
                  }
                  else
                  {
                    v29 = v8;
                    v30 = (void *)MEMORY[0x1E0C99E98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v45, v28);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "stringByAppendingPathComponent:", v31);
                    v32 = v4;
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "fileURLWithPath:", v33);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                    v4 = v32;
                    objc_msgSend(v44, "copyItemAtURL:toURL:error:", v27, v34, 0);
                    objc_msgSend(v32, "addObject:", v34);

                    v8 = v29;
                  }

                }
                v24 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              }
              while (v24);
            }

            v7 = v36;
            v6 = v37;
            v11 = v41;
            v9 = v42;
            v12 = v40;
          }
          else
          {
            objc_msgSend(v4, "addObjectsFromArray:", v11);
          }

        }
        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_generateZippedCaptureFoldersForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id obj;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v26 = v7;
    objc_msgSend(v7, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoDirectoryWithType:", 4);
    v9 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v9;
    -[PXFeedbackImageQualityUIViewController _captureIDsToCaptureFoldersInDirectory:](self, "_captureIDsToCaptureFoldersInDirectory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v27 = v4;
    obj = v4;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v14), "mainFileURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXFeedbackImageQualityUIViewController _captureIDFromURL:](self, "_captureIDFromURL:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lastPathComponent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            NSTemporaryDirectory();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.tar.gz"), v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByAppendingString:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "stringByAppendingPathComponent:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXFeedbackImageQualityUIViewController _archiveFolder:destinationPath:](self, "_archiveFolder:destinationPath:", v23, v22);
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v24);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v12);
    }

    v7 = v26;
    v4 = v27;
  }
  else
  {
    NSLog(CFSTR("No photo library detected for assets"));
  }

  return v30;
}

- (void)_archiveFolder:(id)a3 destinationPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = archive_write_new();
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  v12 = objc_retainAutorelease(v6);
  v9 = open_dprotected_np((const char *)objc_msgSend(v12, "UTF8String"), 514, 3, 0, 416);
  if (v9 < 0)
    v9 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), 514, 2, 0, 416);
  v10 = archive_write_open_fd();
  if ((_DWORD)v10)
  {
    NSLog(CFSTR("Error creating archive at path %@ %d"), v12, v10);
    v9 = -1;
  }
  objc_msgSend(v7, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackImageQualityUIViewController _addDirectoryToArchive:withDirName:archive:](self, "_addDirectoryToArchive:withDirName:archive:", v7, v11, v8);

  archive_write_free();
  if ((v9 & 0x80000000) == 0)
    close(v9);

}

- (int)_addFileToArchive:(id)a3 withFileName:(id)a4 archive:(archive *)a5
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  int v17;
  ssize_t v18;
  uint64_t v19;
  int *v20;
  char *v21;
  int *v22;
  stat v23;
  _BYTE v24[8192];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(&v23, 0, sizeof(v23));
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (!v9)
  {
    NSLog(CFSTR("No filename!"));
LABEL_7:
    LODWORD(v12) = -1;
    goto LABEL_8;
  }
  v10 = v9;
  stat(v9, &v23);
  if (!archive_entry_new())
  {
    NSLog(CFSTR("archive_entry_new() failed!"));
    goto LABEL_7;
  }
  archive_entry_copy_stat();
  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v11, "UTF8String");
  archive_entry_set_pathname();
  if (archive_write_header())
  {
    v12 = archive_errno();
    v13 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v14 = archive_error_string();
    NSLog(CFSTR("failed to write header for file, %s, status, %d, reason: %s"), v13, v12, v14);
    archive_entry_free();
    goto LABEL_8;
  }
  v16 = open(v10, 0);
  if (v16 == -1)
  {
    v20 = __error();
    v21 = strerror(*v20);
    v22 = __error();
    NSLog(CFSTR("Error opening file %@:%s (%d)"), v8, v21, *v22);
    archive_entry_free();
    goto LABEL_7;
  }
  v17 = v16;
  v18 = read(v16, v24, 0x2000uLL);
  if (v18 < 1)
  {
LABEL_14:
    LODWORD(v12) = 0;
  }
  else
  {
    v12 = v18;
    while (1)
    {
      v19 = archive_write_data();
      if (v19 != v12)
        break;
      v12 = read(v17, v24, 0x2000uLL);
      if (v12 <= 0)
        goto LABEL_14;
    }
    NSLog(CFSTR("Error writing file %@: request to write %ld bytes but wrote %ld bytes"), v8, v12, v19);
    LODWORD(v12) = archive_errno();
  }
  archive_entry_free();
  close(v17);
LABEL_8:

  return v12;
}

- (int)_addDirectoryToArchive:(id)a3 withDirName:(id)a4 archive:(archive *)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  void *v25;
  id v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v25 = v8;
      v12 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1A85CE17C]();
          v29 = 0;
          objc_msgSend(v6, "stringByAppendingPathComponent:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v16, &v29);

          if (v18)
          {
            objc_msgSend(v14, "lastPathComponent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringByAppendingPathComponent:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v29
                ? -[PXFeedbackImageQualityUIViewController _addDirectoryToArchive:withDirName:archive:](self, "_addDirectoryToArchive:withDirName:archive:", v16, v20, a5): -[PXFeedbackImageQualityUIViewController _addFileToArchive:withFileName:archive:](self, "_addFileToArchive:withFileName:archive:", v16, v20, a5);
            v22 = v21;

            if (v22 == -30)
            {

              objc_autoreleasePoolPop(v15);
              v23 = -30;
              goto LABEL_17;
            }
          }

          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v11)
          continue;
        break;
      }
      v23 = 0;
LABEL_17:
      v8 = v25;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_captureIDFromURL:(id)a3
{
  const __CFURL *v3;
  CGImageSource *v4;
  CGImageSource *v5;
  CFDictionaryRef v6;
  id v8;

  v3 = (const __CFURL *)a3;
  v4 = 0;
  if (-[__CFURL checkResourceIsReachableAndReturnError:](v3, "checkResourceIsReachableAndReturnError:", 0))
  {
    v5 = CGImageSourceCreateWithURL(v3, 0);
    v4 = v5;
    if (v5)
    {
      v6 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      CFRelease(v4);
      if (v6)
      {
        v8 = 0;
        objc_msgSend(MEMORY[0x1E0D75100], "readMetadataType:fromCGImageProperties:value:error:", 13, v6, &v8, 0);
        v4 = (CGImageSource *)v8;
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v4;
}

- (id)_captureIDsToCaptureFoldersInDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  PXFeedbackImageQualityUIViewController *v18;
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke;
  v15[3] = &unk_1E5122908;
  v16 = v4;
  v17 = v5;
  v18 = self;
  v9 = v8;
  v19 = v9;
  v10 = v5;
  v11 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  v12 = v19;
  v13 = v9;

  return v13;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (PXFeedbackImageQualityUIViewControllerDelegate)delegate
{
  return (PXFeedbackImageQualityUIViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)negativeFeedback
{
  return self->_negativeFeedback;
}

- (void)setNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_negativeFeedback, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (PXFeedbackLikeItOrNotComboUIViewController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackController, a3);
}

- (NSArray)imageQualityDiagnosticFileURLs
{
  return self->_imageQualityDiagnosticFileURLs;
}

- (void)setImageQualityDiagnosticFileURLs:(id)a3
{
  objc_storeStrong((id *)&self->_imageQualityDiagnosticFileURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageQualityDiagnosticFileURLs, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_negativeFeedback, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("capture"));
  if ((_DWORD)v4)
  {
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Framework"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "contentsOfDirectoryAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke_2;
    v12[3] = &unk_1E5122908;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    v13 = v6;
    v14 = v8;
    v15 = v9;
    v16 = v11;
    v10 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  }
}

void __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_captureIDFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), v5);
}

void __69__PXFeedbackImageQualityUIViewController__radarComponentForFeedback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(a3, "isEqual:", MEMORY[0x1E0C9AAB0]);
  v6 = v9;
  if (v5)
  {
    if ((objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBadColorKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBadFocusKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBadContrastKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityTooNoisyKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBlurryKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBadPortraitBlurKey) & 1) != 0)
    {
      v7 = &unk_1E53EC840;
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
      v6 = v9;
      goto LABEL_10;
    }
    if ((objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBadHDRKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityBadFlashKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityShortLivePhotoKey) & 1) != 0
      || (objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityMuteLivePhotoKey) & 1) != 0)
    {
      v7 = &unk_1E53EC858;
      goto LABEL_9;
    }
    if ((objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualitySemanticDevelopmentBadEffectKey) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualitySemanticDevelopmentNoEffectKey) & 1) != 0)
    {
      v7 = &unk_1E53EC870;
      goto LABEL_9;
    }
    if ((objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualityBadTrackingCPVKey) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualityBadCinematographyCPVKey) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualityBadRenderingCPVKey) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualityHardToChangeCPVKey) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", kPXFeedbackImageQualityGenericBadCPVKey) & 1) != 0)
    {
      v7 = &unk_1E53EC888;
      goto LABEL_9;
    }
    if ((objc_msgSend(v9, "isEqualToString:", kPXFeedbackProvideOriginalAndEdit) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", kPXFeedbackProvideOriginalAndEditSysdiagnose) & 1) != 0)
    {
      v7 = &unk_1E53EC8A0;
      goto LABEL_9;
    }
    if ((objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityUncomfortableStereoViewingKey) & 1) != 0
      || (v8 = objc_msgSend(v9, "isEqual:", kPXFeedbackImageQualityMotionUncomfortableKey), v6 = v9, v8))
    {
      v7 = &unk_1E53EC8B8;
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __78__PXFeedbackImageQualityUIViewController__generateTitleForFeedback_forAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(a3, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    PXLocalizedStringFromTable(v6, CFSTR("PXFeedbackCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@, "), v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(a3, "isEqual:", MEMORY[0x1E0C9AAB0]);
  v6 = v8;
  if (v5)
  {
    PXLocalizedStringFromTable(v8, CFSTR("PXFeedbackCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", kPXFeedbackProvideOriginalAndEditSysdiagnose))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR("%@\n"), v7);

    v6 = v8;
  }

}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_3;
  v9[3] = &unk_1E5122890;
  objc_copyWeak(&v19, (id *)(a1 + 96));
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 80);
  v13 = v4;
  v17 = v5;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  v16 = v6;
  v18 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v19);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v2 = (id *)(a1 + 104);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_4;
  v8[3] = &unk_1E5122890;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 88);
  v12 = v4;
  v16 = v5;
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 72);
  v6 = *(id *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 96);
  v15 = v6;
  v17 = v7;
  objc_copyWeak(&v18, v2);
  objc_msgSend(WeakRetained, "_dismissActiveAlertControllerWithCompletion:", v8);

  objc_destroyWeak(&v18);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v8 = *(unsigned __int8 *)(v7 + 24);
  if (*(_BYTE *)(v7 + 24))
  {
    v15[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_5;
  v13[3] = &unk_1E5142510;
  objc_copyWeak(&v14, (id *)(a1 + 104));
  BYTE1(v10) = 1;
  LOBYTE(v10) = v8 != 0;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v5, v4, CFSTR("Other Bug"), v11, v12, CFSTR("iOS"), v6, 0, v3, v10, v9, v13);
  if (v8)

  objc_destroyWeak(&v14);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id *v3;
  void *v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "feedbackImageQualityUIViewController:didFinish:", v5, a2);

}

@end
