@implementation PUSceneDebugGridViewController

- (id)sceneTaxonomy
{
  PUSceneDebugGridViewController *v2;
  PFSceneTaxonomy *v3;
  PFSceneTaxonomy *sceneTaxonomy;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sceneTaxonomy)
  {
    v3 = (PFSceneTaxonomy *)objc_alloc_init(MEMORY[0x1E0D75250]);
    sceneTaxonomy = v2->_sceneTaxonomy;
    v2->_sceneTaxonomy = v3;

  }
  objc_sync_exit(v2);

  return v2->_sceneTaxonomy;
}

- (id)_globalHeaderTitle
{
  void *v3;
  BOOL v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[PUSceneDebugGridViewController sceneIdentifier](self, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUSceneDebugGridViewController _isJunkSceneIdentifer:](self, "_isJunkSceneIdentifer:", v3);

  if (v4)
  {
    v5 = CFSTR("Select photos with a red number that should be used by Memories and Search. Select photos with a white number that shouldn't be used by Memories and Search.");
  }
  else
  {
    -[PUSceneDebugGridViewController sceneIdentifier](self, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSceneDebugGridViewController _keywordForSceneIdentifier:](self, "_keywordForSceneIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Select photos with a white number that don't contain \"%@\", and select photos with a red number that contain \"%@\"."), v7, v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6
{
  *a3 = CFSTR(" ");
  *a4 = CFSTR("Loading...");
  *a5 = 0;
  *a6 = 0;
}

- (void)configureGlobalHeaderView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUSceneDebugGridViewController _globalHeaderTitle](self, "_globalHeaderTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (double)globalHeaderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[PUSceneDebugGridViewController _globalHeaderTitle](self, "_globalHeaderTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugGridViewController _existingView](self, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D7B7F0], "sizeThatFits:forTitle:", v3, v6, v8);
  v10 = v9;

  return v10;
}

- (id)_newEditActionItemsWithWideSpacing:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[4];

  v3 = a3;
  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("File Radar"), 0, self, sel__tappedFileRadarButton_);
  v5 = (void *)v4;
  if (v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v11[0] = v6;
    v11[1] = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v11[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)allowSlideshowButton
{
  return 0;
}

- (void)configureDecorationsForCell:(id)a3 withAsset:(id)a4 assetCollection:(id)a5 thumbnailIsPlaceholder:(BOOL)a6 assetMayHaveChanged:(BOOL)a7
{
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  id v26;

  v26 = a3;
  v9 = a4;
  +[PUSceneSettings sharedInstance](PUSceneSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "showConfidenceOverlay");

  if (v9 && v11)
  {
    -[PUSceneDebugGridViewController assetsHighestConfidence](self, "assetsHighestConfidence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v26, "photoContentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setTextBannerVisible:", 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f"), v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textBannerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "cellBannerTextAlignment");
    objc_msgSend(v18, "textBannerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextAlignment:", v22);

    v24 = -[PUSceneDebugGridViewController assetShouldBeSurpassedInNormalUI:](self, "assetShouldBeSurpassedInNormalUI:", v9);
    objc_msgSend(v18, "textBannerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDestructiveText:", v24);

  }
}

- (BOOL)assetShouldBeSurpassedInNormalUI:(id)a3
{
  PUSceneDebugGridViewController *v3;
  BOOL v4;
  void *v5;

  v3 = self;
  v4 = -[PUSceneDebugGridViewController assetConfidenceIsAboveThreshold:](self, "assetConfidenceIsAboveThreshold:", a3);
  -[PUSceneDebugGridViewController sceneIdentifier](v3, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[PUSceneDebugGridViewController _isJunkSceneIdentifer:](v3, "_isJunkSceneIdentifer:", v5);

  return v4 ^ v3 ^ 1;
}

- (BOOL)assetConfidenceIsAboveThreshold:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  -[PUSceneDebugGridViewController sceneIdentifier](self, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugGridViewController _thresholdForSceneIdentifer:](self, "_thresholdForSceneIdentifer:", v5);
  v7 = v6;

  -[PUSceneDebugGridViewController assetsHighestConfidence](self, "assetsHighestConfidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  return v12 > v7;
}

- (void)_tappedFileRadarButton:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isAnyAssetSelectedInAssetCollection:", v5);

  if ((v6 & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke_2;
    v10[3] = &unk_1E58A9910;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0D7B428], "alertControllerWithPrivacyTitle:message:completion:", CFSTR("Release Agreement"), CFSTR("You hereby agree that Apple and its affiliates may use, store, and analyze content (including images and metadata associated with images) you submit for debugging purposes of Apple products and services and for testing the debugging solution. Please do not upload any content that contains sensitive information, such as health or financial information, and do not upload objectionable or offensive content (including offensive language and nudity). Apple may retain the images and metadata associated with the images for up to 10 years.\n\nBy choosing to provide content to Apple, you agree and consent to Apple and its subsidiaries and agents transmitting, collecting, maintaining, processing, and using the information described above. Do not upload content that includes images or videos of individuals other than yourself unless you have the individual’s consent to provide Apple with the content and for Apple to use the information as described above. Do not include images that are not yours. By submitting the images, you agree to release Apple from all privacy and intellectual property claims arising out of the use of these images.\n\nYour decision to provide content is completely voluntary and you can choose to submit only a description of the error without an image attachment."), v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSceneDebugGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("File radar without attaching photos?\nSelecting incorrect photos can help improve the scenes feature."), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke;
    v11[3] = &unk_1E58A8DE8;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v8);
    objc_msgSend(v7, "addAction:", v9);
    -[PUSceneDebugGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

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
  v8[2] = __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E58AB790;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PUSceneDebugGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);

}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  PUSceneDebugGridViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  BOOL v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  id obj;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  char v81;
  id v82;
  NSObject *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  _QWORD v93[8];
  _QWORD v94[8];
  _QWORD v95[7];
  _QWORD v96[7];
  void *v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;
  uint8_t buf[4];
  NSObject *v104;
  __int16 v105;
  NSObject *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v73 = v6;
  LOBYTE(v6) = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v92);
  v9 = v92;

  if ((v6 & 1) != 0)
  {
    v65 = v9;
    PFMap();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CD1570];
    v68 = v7;
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchOptionsWithPhotoLibrary:orObject:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = *MEMORY[0x1E0CD1A50];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchPropertySets:", v14);

    v66 = v13;
    v67 = v10;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithObjectIDs:options:", v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSceneDebugGridViewController sceneIdentifier](self, "sceneIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSceneDebugGridViewController _thresholdForSceneIdentifer:](self, "_thresholdForSceneIdentifer:");
    v17 = v16;
    v72 = (void *)objc_opt_new();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v15;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    if (v74)
    {
      v71 = *(_QWORD *)v89;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v89 != v71)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v18);
          v20 = self;
          -[PUSceneDebugGridViewController _cloneAsset:toDirectory:](self, "_cloneAsset:toDirectory:", v19, v73, v65);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_sceneIdentifier);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_opt_new();
          objc_msgSend(v19, "sceneClassifications");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v82 = v23;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
          v78 = v19;
          v79 = v18;
          if (v24)
          {
            v25 = v24;
            v81 = 0;
            v26 = *(_QWORD *)v85;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v85 != v26)
                  objc_enumerationMutation(v82);
                v28 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                v98[0] = v21;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v28, "extendedSceneIdentifier"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v99[0] = v29;
                v98[1] = CFSTR("confidence");
                v30 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v28, "confidence");
                objc_msgSend(v30, "numberWithDouble:");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v99[1] = v31;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "addObject:", v32);
                v33 = objc_msgSend(v28, "extendedSceneIdentifier");
                -[PUSceneDebugGridViewController sceneIdentifier](v20, "sceneIdentifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33 == objc_msgSend(v34, "unsignedIntValue"))
                {
                  objc_msgSend(v28, "confidence");
                  v36 = v35;

                  if (v36 > v17)
                    v81 = 1;
                }
                else
                {

                }
              }
              v25 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
            }
            while (v25);
          }
          else
          {
            v81 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v21, 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sortUsingDescriptors:", v37);

          v95[0] = CFSTR("image");
          objc_msgSend(v80, "lastPathComponent");
          v38 = objc_claimAutoreleasedReturnValue();
          v76 = (void *)v38;
          v39 = &stru_1E58AD278;
          if (v38)
            v39 = (const __CFString *)v38;
          v96[0] = v39;
          v96[1] = v22;
          v95[1] = CFSTR("classifications");
          v95[2] = CFSTR("sceneAnalysisVersion");
          v40 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v78, "sceneAnalysisProperties");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "numberWithShort:", objc_msgSend(v75, "sceneAnalysisVersion"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v96[2] = v41;
          v95[3] = CFSTR("imgOriginalWidth");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "pixelWidth"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v96[3] = v42;
          v95[4] = CFSTR("imgOriginalHeight");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "pixelHeight"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v96[4] = v43;
          v95[5] = CFSTR("userLabel");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v81 & 1) == 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v96[5] = v44;
          v95[6] = CFSTR("sceneAnalysisPrediction");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v81 & 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v96[6] = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 7);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "addObject:", v46);
          v18 = v79 + 1;
          self = v20;
        }
        while (v79 + 1 != v74);
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      }
      while (v74);
    }

    -[PUSceneDebugGridViewController _keywordForSceneIdentifier:](self, "_keywordForSceneIdentifier:", v69);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v47;
    if (v47)
      v49 = (__CFString *)v47;
    else
      v49 = CFSTR("null");
    v50 = v49;

    -[PUSceneDebugGridViewController _labelForSceneIdentifier:](self, "_labelForSceneIdentifier:", v69);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    if (v51)
      v53 = (__CFString *)v51;
    else
      v53 = CFSTR("null");
    v54 = v53;

    v55 = (void *)MGCopyAnswer();
    v56 = (void *)MGCopyAnswer();
    v93[0] = CFSTR("type");
    v93[1] = CFSTR("sceneIdentifier");
    v94[0] = CFSTR("scene");
    v94[1] = v69;
    v94[2] = v54;
    v93[2] = CFSTR("sceneNetLabel");
    v93[3] = CFSTR("confidenceThreshold");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v94[3] = v57;
    v94[4] = v50;
    v93[4] = CFSTR("localized_category");
    v93[5] = CFSTR("deviceType");
    v94[5] = v56;
    v94[6] = v55;
    v93[6] = CFSTR("buildVersion");
    v93[7] = CFSTR("assets");
    v94[7] = v72;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v65;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v58, 1, &v83);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v83;

    if (v59)
    {
      -[NSObject URLByAppendingPathComponent:](v73, "URLByAppendingPathComponent:", CFSTR("report.json"));
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = 1;
      if ((objc_msgSend(v59, "writeToURL:atomically:", v60, 1) & 1) != 0)
      {
LABEL_41:

        v63 = v67;
        v7 = v68;
        goto LABEL_42;
      }
      PLUIGetLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v104 = v60;
        v105 = 2112;
        v106 = v9;
        _os_log_impl(&dword_1AAB61000, v62, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }

    }
    else
    {
      PLUIGetLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v9;
        _os_log_impl(&dword_1AAB61000, v60, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    v61 = 0;
    goto LABEL_41;
  }
  PLUIGetLog();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v104 = v73;
    v105 = 2112;
    v106 = v9;
    _os_log_impl(&dword_1AAB61000, v63, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  v61 = 0;
LABEL_42:

  return v61;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUSceneDebugGridViewController _assetResourceForAsset:](self, "_assetResourceForAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[PUSceneDebugGridViewController _localFileURLForAssetResource:error:](self, "_localFileURLForAssetResource:error:", v8, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  if (v9)
  {
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathExtension:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v16 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v9, v14, &v21);
    v17 = v21;

    if ((v16 & 1) != 0)
    {
      v18 = v14;
    }
    else
    {
      PLUIGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v17;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to clone asset file from URL: %@, to URL: %@, error: %@", buf, 0x20u);
      }

      v18 = 0;
    }

  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v6;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Scene Inspector: Failed to find file URL for asset: %@, assetResource: %@, error: %@", buf, 0x20u);
    }
    v18 = 0;
    v17 = v10;
  }

  return v18;
}

- (id)_assetResourceForAsset:(id)a3
{
  void *v4;
  void *v5;

  -[PUSceneDebugGridViewController _preferredAssetResourcesForAnalyzingAsset:](self, "_preferredAssetResourcesForAnalyzingAsset:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugGridViewController _assetResourceFromAcceptableAssetResources:](self, "_assetResourceFromAcceptableAssetResources:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_keywordForSceneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[PUSceneDebugGridViewController sceneTaxonomy](self, "sceneTaxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeRefForExtendedSceneClassId:", objc_msgSend(v4, "unsignedLongLongValue"));
  PFSceneTaxonomyNodeLocalizedLabel();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "unsignedIntValue");
    v7 = objc_msgSend(v4, "unsignedIntegerValue");
    objc_msgSend(0, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to get localized label for scene identifier (%ld) from taxonomy with error:%@"), v7, v8);

    v6 = 0;
  }

  return v6;
}

- (id)_labelForSceneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[PUSceneDebugGridViewController sceneTaxonomy](self, "sceneTaxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeRefForExtendedSceneClassId:", objc_msgSend(v4, "unsignedLongLongValue"));
  PFSceneTaxonomyNodeName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_msgSend(v4, "unsignedIntegerValue");
    objc_msgSend(0, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to get label for scene identifier (%ld) from taxonomy with error:%@"), v7, v8);

  }
  return v6;
}

- (double)_thresholdForSceneIdentifer:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;

  v4 = a3;
  if (-[PUSceneDebugGridViewController _isJunkSceneIdentifer:](self, "_isJunkSceneIdentifer:", v4))
  {
    v5 = 0.15;
  }
  else
  {
    -[PUSceneDebugGridViewController sceneTaxonomy](self, "sceneTaxonomy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeRefForExtendedSceneClassId:", objc_msgSend(v4, "unsignedLongLongValue"));
    PFSceneTaxonomyNodeSearchThreshold();
    v5 = v7;

  }
  return v5;
}

- (BOOL)_isJunkSceneIdentifer:(id)a3
{
  return objc_msgSend(a3, "unsignedIntValue") == 0x7FFFFFFF;
}

- (id)_localFileURLForAssetResource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CD1470]);
  objc_msgSend(v6, "setNetworkAccessAllowed:", 0);
  v7 = dispatch_semaphore_create(0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__82225;
  v28 = __Block_byref_object_dispose__82226;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__82225;
  v22 = __Block_byref_object_dispose__82226;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = &v18;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke;
  v17[3] = &unk_1E58A7928;
  v17[4] = &v24;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke_2;
  v13[3] = &unk_1E58A7950;
  v15 = &v24;
  v9 = v7;
  v14 = v9;
  if (!objc_msgSend(v8, "requestFileURLForAssetResource:options:urlReceivedHandler:completionHandler:", v5, v6, v17, v13))
  {
    if (a4)
    {
      v11 = 0;
      *a4 = 0;
      goto LABEL_9;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (void *)v25[5];
  if (!v10)
  {
    if (a4)
    {
      v11 = 0;
      *a4 = objc_retainAutorelease((id)v19[5]);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v11 = v10;
LABEL_9:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)_assetResourceFromAcceptableAssetResources:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[PUSceneDebugGridViewController _localFileURLForAssetResource:error:](self, "_localFileURLForAssetResource:error:", v10, 0, (_QWORD)v15);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v13 = (void *)v11;
            v12 = v10;

            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(v5, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)_preferredAssetResourcesForAnalyzingAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isTable = NO AND isThumbnail = YES AND maxSideLengthIfSquare >= 256"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD1460];
  objc_msgSend(v3, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allQualityClassesMatchingPredicate:inLibrary:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0CD1438], "assetResourceForAsset:qualityClass:", v3, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v4, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_302_82221);
  return v4;
}

- (NSNumber)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
}

- (NSDictionary)assetsHighestConfidence
{
  return self->_assetsHighestConfidence;
}

- (void)setAssetsHighestConfidence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1816);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsHighestConfidence, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

uint64_t __76__PUSceneDebugGridViewController__preferredAssetResourcesForAnalyzingAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "pixelWidth");
  v9 = objc_msgSend(v6, "pixelHeight") * v8;
  v10 = objc_msgSend(v7, "pixelWidth");
  v11 = objc_msgSend(v7, "pixelHeight");
  if (v9 <= v11 * v10)
  {
    if (v9 >= v11 * v10)
    {
      objc_msgSend(v6, "assetLocalIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetLocalIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "compare:", v14);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

void __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __73__PUSceneDebugGridViewController__writeDiagnosticsToURL_incorrectAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "assetCollectionAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(a1[4], "assetCollectionAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v72 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(a1[4], "assetConfidenceIsAboveThreshold:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v55 = v3 - v7;
  v10 = objc_msgSend(a1[5], "count");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v11 = a1[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v3;
    v15 = 0;
    v16 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v68 != v16)
          objc_enumerationMutation(v11);
        v15 += objc_msgSend(a1[4], "assetConfidenceIsAboveThreshold:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    }
    while (v13);
  }
  else
  {
    v14 = v3;
    v15 = 0;
  }

  v54 = v10 - v15;
  v18 = a1[4];
  objc_msgSend(v18, "sceneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_thresholdForSceneIdentifer:", v19);
  v21 = v20;

  v22 = v10;
  v23 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringFromNumber:numberStyle:", v24, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v14;
  v25 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v10 / (double)v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringFromNumber:numberStyle:", v26, 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v15 / (double)v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringFromNumber:numberStyle:", v28, 3);
  v29 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v10 - v15) / (double)v55);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringFromNumber:numberStyle:", v31, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = a1[4];
  objc_msgSend(v32, "sceneIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_keywordForSceneIdentifier:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(a1[4], "sceneIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringFromNumber:numberStyle:", v36, 0);
  v37 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" Scene has %ld Incorrect Classification(s)"), v34, v10);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v38, "appendString:", CFSTR("— Scene Classification Feedback —\n"));
  objc_msgSend(v38, "appendFormat:", CFSTR("Scene Keyword: \"%@\"\n"), v34);
  v57 = (void *)v37;
  objc_msgSend(v38, "appendFormat:", CFSTR("Scene Identifier: %@\n"), v37);
  objc_msgSend(v38, "appendFormat:", CFSTR("Scene Threshold: %@\n\n"), v61);
  objc_msgSend(v38, "appendFormat:", CFSTR("Incorrect Classification(s): %ld of %ld (%@)\n"), v22, v58, v60);
  v59 = (void *)v29;
  objc_msgSend(v38, "appendFormat:", CFSTR("  - False Positive(s): %ld of %ld (%@)\n"), v15, v7, v29);
  objc_msgSend(v38, "appendFormat:", CFSTR("  - False Negative(s): %ld of %ld (%@)\n\n\n"), v54, v55, v53);
  NSTemporaryDirectory();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "UUIDString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringByAppendingPathComponent:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v42, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "_writeDiagnosticsToURL:incorrectAssets:", v43, a1[5]) & 1) == 0)
  {
    PLUIGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v43;
      _os_log_impl(&dword_1AAB61000, v44, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v45, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v43, 0, 4, &v66);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v66;
  if (!v46)
  {
    PLUIGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v76 = v43;
      v77 = 2112;
      v78 = v47;
      _os_log_impl(&dword_1AAB61000, v48, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }

  }
  v49 = (void *)MEMORY[0x1E0D7B428];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke_233;
  v62[3] = &unk_1E58A8E10;
  v62[4] = a1[4];
  v63 = a1[6];
  v64 = v45;
  v65 = v43;
  v50 = v43;
  v51 = v45;
  LOWORD(v52) = 0;
  objc_msgSend(v49, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v56, v38, CFSTR("Other Bug"), CFSTR("1116536"), CFSTR("SIML Field Feedback Secured Data | Classification"), CFSTR("all"), CFSTR("1532088"), 0, v46, v52, 0, v62);

}

void __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke_233(uint64_t a1)
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

uint64_t __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", 0);
}

void __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke_2(uint64_t a1, int a2)
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
