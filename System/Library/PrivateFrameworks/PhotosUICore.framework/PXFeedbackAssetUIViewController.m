@implementation PXFeedbackAssetUIViewController

- (PXFeedbackAssetUIViewController)initWithAsset:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PXFeedbackAssetUIViewController *v9;
  PXFeedbackAssetUIViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedbackAssetUIViewController;
  v9 = -[PXFeedbackAssetUIViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
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
  void *v9;
  PXFeedbackLikeItOrNotComboUIViewController *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXFeedbackAssetUIViewController;
  -[PXFeedbackAssetUIViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
  -[PXFeedbackAssetUIViewController setNavigationController:](self, "setNavigationController:", v3);

  -[PXFeedbackAssetUIViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackAssetUIViewController addChildViewController:](self, "addChildViewController:", v4);

  -[PXFeedbackAssetUIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackAssetUIViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  -[PXFeedbackAssetUIViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didMoveToParentViewController:", self);

  -[PXFeedbackAssetUIViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToolbarHidden:", 0);

  v10 = -[PXFeedbackLikeItOrNotComboUIViewController initWithDelegate:]([PXFeedbackLikeItOrNotComboUIViewController alloc], "initWithDelegate:", self);
  -[PXFeedbackAssetUIViewController setFeedbackController:](self, "setFeedbackController:", v10);

  -[PXFeedbackAssetUIViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackAssetUIViewController feedbackController](self, "feedbackController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

}

- (id)longTitleText
{
  return PXLocalizedStringFromTable(CFSTR("FeedbackLikeItOrNotViewController.longTitle.AutoLoop"), CFSTR("PXFeedbackCollection"));
}

- (id)viewTitleForRadar
{
  return CFSTR("AutoLoop Feedback");
}

- (BOOL)shouldDisplaySecondaryFeedbackButtons
{
  return 0;
}

- (id)positiveFeedbackKeys
{
  return +[PXFeedbackEntry positiveFeedbackForAutoLoopKeys](PXFeedbackEntry, "positiveFeedbackForAutoLoopKeys");
}

- (id)negativeFeedbackKeys
{
  return +[PXFeedbackEntry negativeFeedbackForAutoLoopKeys](PXFeedbackEntry, "negativeFeedbackForAutoLoopKeys");
}

- (void)userIndicatedLike
{
  id v3;

  -[PXFeedbackAssetUIViewController setUserLikedIt:](self, "setUserLikedIt:", 1);
  -[PXFeedbackAssetUIViewController feedbackController](self, "feedbackController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMoreFeedbackForm");

}

- (void)userIndicatedDislike
{
  id v3;

  -[PXFeedbackAssetUIViewController setUserLikedIt:](self, "setUserLikedIt:", 0);
  -[PXFeedbackAssetUIViewController feedbackController](self, "feedbackController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMoreFeedbackForm");

}

- (void)userSentPositiveFeedback:(id)a3 negativeFeedback:(id)a4 customFeedback:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[PXFeedbackAssetUIViewController asset](self, "asset");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackAssetUIViewController _fileRadarWithAutoLoopAsset:positiveFeedback:negativeFeedback:](self, "_fileRadarWithAutoLoopAsset:positiveFeedback:negativeFeedback:", v9, v8, v7);

}

- (void)userDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PXFeedbackAssetUIViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackAssetUIViewController:didFinish:", self, v3);

}

- (void)_fileRadarWithAutoLoopAsset:(id)a3 positiveFeedback:(id)a4 negativeFeedback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXFeedbackAssetUIViewController setAsset:](self, "setAsset:", v10);
  -[PXFeedbackAssetUIViewController setPositiveFeedback:](self, "setPositiveFeedback:", v9);

  -[PXFeedbackAssetUIViewController setNegativeFeedback:](self, "setNegativeFeedback:", v8);
  -[PXFeedbackAssetUIViewController setAutoLoopFrameworkDiagnosticFileURLs:](self, "setAutoLoopFrameworkDiagnosticFileURLs:", 0);
  -[PXFeedbackAssetUIViewController setAutoLoopFrameworkDiagnosticsCurrentTask:](self, "setAutoLoopFrameworkDiagnosticsCurrentTask:", 0);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Collecting data for radar..."), 0, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackAssetUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, &__block_literal_global_88700);
  -[PXFeedbackAssetUIViewController _startAutoLoopVideoTaskForDiagnosticsWithAsset:](self, "_startAutoLoopVideoTaskForDiagnosticsWithAsset:", v10);

}

- (void)continueFiling
{
  _BOOL4 v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  __CFString *v29;
  _QWORD v30[4];
  id v31;
  PXFeedbackAssetUIViewController *v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = -[PXFeedbackAssetUIViewController userLikedIt](self, "userLikedIt");
  v4 = CFSTR("Negative");
  if (v3)
    v4 = CFSTR("Positive");
  v29 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AutoLoop Feedback: %@"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("— AutoLoop Truthing Feedback —\n"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\nOverall impression: %@\n\n"), v29);
  objc_msgSend(v5, "appendFormat:", CFSTR("- Positive Feedback -\n"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PXFeedbackAssetUIViewController positiveFeedback](self, "positiveFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v43;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
        -[PXFeedbackAssetUIViewController positiveFeedback](self, "positiveFeedback");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@\n"), v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "appendFormat:", CFSTR("\n- Negative Feedback -\n"));
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v38 = 0u;
  -[PXFeedbackAssetUIViewController negativeFeedback](self, "negativeFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v18);
        -[PXFeedbackAssetUIViewController negativeFeedback](self, "negativeFeedback");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "valueForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@\n"), v19, v21);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__88676;
  v36[4] = __Block_byref_object_dispose__88677;
  v37 = (id)objc_opt_new();
  v23 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v23, "setVersion:", 2);
  objc_msgSend(v23, "setLoadingMode:", 0x10000);
  -[PXFeedbackAssetUIViewController asset](self, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke;
  v30[3] = &unk_1E5124638;
  v35 = v36;
  v25 = v22;
  v31 = v25;
  v32 = self;
  v26 = v28;
  v33 = v26;
  v27 = v5;
  v34 = v27;
  objc_msgSend(v25, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v24, 0, v23, v30, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

  _Block_object_dispose(v36, 8);
}

- (void)_startAutoLoopVideoTaskForDiagnosticsWithAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PXFeedbackAssetUIViewController *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v6, "setVideoComplementAllowed:", 1);
  objc_msgSend(v6, "setVersion:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PXFeedbackAssetUIViewController__startAutoLoopVideoTaskForDiagnosticsWithAsset___block_invoke;
  v8[3] = &unk_1E5124660;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v5, "requestAVAssetForAsset:options:resultHandler:", v7, v6, v8);

}

- (void)autoloopVideoTaskStatusDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXFeedbackAssetUIViewController autoLoopFrameworkDiagnosticsCurrentTask](self, "autoLoopFrameworkDiagnosticsCurrentTask");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v6 = objc_msgSend(v4, "status");

    if (v6 == 4)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v4, "temporaryFilesDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 1);
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = *MEMORY[0x1E0C99A18];
      v30[0] = *MEMORY[0x1E0C99A18];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v11;
      v23 = v8;
      objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v13, 4, &__block_literal_global_182_88657);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
            v24 = 0;
            objc_msgSend(v20, "getResourceValue:forKey:error:", &v24, v12, 0);
            v21 = v24;
            if ((objc_msgSend(v21, "BOOLValue") & 1) != 0)
              objc_msgSend(v7, "addObject:", v20);
            else
              objc_msgSend(v15, "skipDescendants");

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

      -[PXFeedbackAssetUIViewController setAutoLoopFrameworkDiagnosticFileURLs:](self, "setAutoLoopFrameworkDiagnosticFileURLs:", v7);
      -[PXFeedbackAssetUIViewController continueFiling](self, "continueFiling");

    }
  }
  else
  {

  }
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PXFeedbackAssetUIViewControllerDelegate)delegate
{
  return (PXFeedbackAssetUIViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)userLikedIt
{
  return self->_userLikedIt;
}

- (void)setUserLikedIt:(BOOL)a3
{
  self->_userLikedIt = a3;
}

- (NSDictionary)positiveFeedback
{
  return self->_positiveFeedback;
}

- (void)setPositiveFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_positiveFeedback, a3);
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

- (PXAutoloopVideoProcessTask)autoLoopFrameworkDiagnosticsCurrentTask
{
  return self->_autoLoopFrameworkDiagnosticsCurrentTask;
}

- (void)setAutoLoopFrameworkDiagnosticsCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_autoLoopFrameworkDiagnosticsCurrentTask, a3);
}

- (NSArray)autoLoopFrameworkDiagnosticFileURLs
{
  return self->_autoLoopFrameworkDiagnosticFileURLs;
}

- (void)setAutoLoopFrameworkDiagnosticFileURLs:(id)a3
{
  objc_storeStrong((id *)&self->_autoLoopFrameworkDiagnosticFileURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoLoopFrameworkDiagnosticFileURLs, 0);
  objc_storeStrong((id *)&self->_autoLoopFrameworkDiagnosticsCurrentTask, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_negativeFeedback, 0);
  objc_storeStrong((id *)&self->_positiveFeedback, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asset, 0);
}

BOOL __68__PXFeedbackAssetUIViewController_autoloopVideoTaskStatusDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    NSLog(CFSTR("[Error] %@ (%@)"), a3, a2);
  return a3 == 0;
}

void __82__PXFeedbackAssetUIViewController__startAutoLoopVideoTaskForDiagnosticsWithAsset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  PXAutoloopVideoProcessTask *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mainFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXAutoloopVideoInput inputWithAsset:imageURL:](PXAutoloopVideoInput, "inputWithAsset:imageURL:", v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(PXAutoloopVideoProcessTask);
  -[PXAutoloopVideoTask setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 40));
  -[PXAutoloopVideoProcessTask setShouldExtractGateFeatures:](v6, "setShouldExtractGateFeatures:", 1);
  -[PXAutoloopVideoTask runWithInput:](v6, "runWithInput:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setAutoLoopFrameworkDiagnosticsCurrentTask:", v6);

}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v5, "setVideoComplementAllowed:", 1);
  objc_msgSend(v5, "setVersion:", 1);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_2;
  v11[3] = &unk_1E5124610;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v6, "requestURLForVideo:options:resultHandler:", v7, v5, v11);

}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", a2);
  v3 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v3, "setVideoComplementAllowed:", 1);
  objc_msgSend(v3, "setVersion:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_3;
  v8[3] = &unk_1E51245E8;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v8[4] = v6;
  v8[1] = 3221225472;
  v9 = v7;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v4, "requestURLForVideo:options:resultHandler:", v5, v3, v8);

}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v5);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "autoLoopFrameworkDiagnosticFileURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_4;
  v13[3] = &unk_1E5142510;
  objc_copyWeak(&v14, &location);
  LOBYTE(v12) = 0;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v9, v10, CFSTR("Other Bug"), CFSTR("832794"), CFSTR("Photos - AutoLoops"), CFSTR("Truthing"), 0, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __49__PXFeedbackAssetUIViewController_continueFiling__block_invoke_4(uint64_t a1, uint64_t a2)
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
  objc_msgSend(v4, "feedbackAssetUIViewController:didFinish:", v5, a2);

}

@end
