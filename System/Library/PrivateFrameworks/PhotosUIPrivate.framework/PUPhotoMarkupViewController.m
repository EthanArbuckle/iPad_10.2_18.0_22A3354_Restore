@implementation PUPhotoMarkupViewController

- (PUPhotoMarkupViewController)initWithReviewAsset:(id)a3 mediaProvider:(id)a4
{
  id v8;
  id v9;
  PUPhotoMarkupViewController *v10;
  PUObserverRegistry *v11;
  PUObserverRegistry *observerRegistry;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoMarkupViewController;
  v10 = -[PUPhotoMarkupViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUPhotoMarkupViewController.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reviewAsset"));

    }
    objc_storeStrong((id *)&v10->_reviewAsset, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
    v11 = objc_alloc_init(PUObserverRegistry);
    observerRegistry = v10->__observerRegistry;
    v10->__observerRegistry = v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  MarkupViewControllerPrivateProtocol *markupViewController;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSUndoManager *v25;
  NSUndoManager *undoManager;
  id v27;
  void *v28;
  void *v29;
  id v30;
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
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)PUPhotoMarkupViewController;
  -[PUPhotoMarkupViewController viewDidLoad](&v46, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoMarkupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v45);
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2050000000;
  v12 = (void *)getPPKMarkupViewControllerClass_softClass;
  v51 = getPPKMarkupViewControllerClass_softClass;
  if (!getPPKMarkupViewControllerClass_softClass)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __getPPKMarkupViewControllerClass_block_invoke;
    v47[3] = &unk_1E58AAEB0;
    v47[4] = &v48;
    __getPPKMarkupViewControllerClass_block_invoke((uint64_t)v47);
    v12 = (void *)v49[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v48, 8);
  v14 = objc_alloc_init(v13);
  PULocalizedString(CFSTR("PUPHOTOBROWSER_ASSET_EXPLORER_REVIEW_SCREEN_MARKUP_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setBackgroundColor:", v45);
  objc_msgSend(v14, "setAnnotationEditingEnabled:", 1);
  objc_msgSend(v14, "setPencilAlwaysDraws:", 1);
  objc_msgSend(v14, "setShowShareButtonInToolbar:", 0);
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setCentersIgnoringContentInsets:", 1);
  markupViewController = self->__markupViewController;
  self->__markupViewController = (MarkupViewControllerPrivateProtocol *)v14;
  v17 = v14;

  -[PUPhotoMarkupViewController reviewAsset](self, "reviewAsset");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoMarkupViewController mediaProvider](self, "mediaProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "inputForAdjustmentWithMediaProvider:canHandleAdjustments:", v18, &__block_literal_global_65663);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "baseImageFileURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "knownAdjustmentData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentPreviewImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFileURL:withArchivedModelData:placeholderImage:", v43, v20, v21);

  -[PUPhotoMarkupViewController _setSourceImageVersion:](self, "_setSourceImageVersion:", objc_msgSend(v19, "adjustmentBaseVersion"));
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButton_);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, self, sel__handleDoneButton_);
  objc_msgSend(v17, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItem:", v23);

  objc_msgSend(v17, "undoManager");
  v25 = (NSUndoManager *)objc_claimAutoreleasedReturnValue();
  undoManager = self->_undoManager;
  self->_undoManager = v25;

  v27 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.backward.circle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithImage:style:target:action:", v28, 0, self, sel__handleUndoButton_);
  -[PUPhotoMarkupViewController setUndoButton:](self, "setUndoButton:", v29);

  v30 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.forward.circle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithImage:style:target:action:", v31, 0, self, sel__handleRedoButton_);
  -[PUPhotoMarkupViewController setRedoButton:](self, "setRedoButton:", v32);

  v54[0] = v22;
  -[PUPhotoMarkupViewController undoButton](self, "undoButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v33;
  -[PUPhotoMarkupViewController redoButton](self, "redoButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLeftBarButtonItems:", v35);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v17);
  -[PUPhotoMarkupViewController addChildViewController:](self, "addChildViewController:", v37);
  v52 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "navigationBar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTitleTextAttributes:", v39);

  objc_msgSend(v37, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v41, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v41);
  objc_msgSend(v37, "didMoveToParentViewController:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObserver:selector:name:object:", self, sel__undoManagerCheckpoint_, *MEMORY[0x1E0CB3398], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoMarkupViewController;
  -[PUPhotoMarkupViewController dealloc](&v4, sel_dealloc);
}

- (void)_handleCancelButton:(id)a3
{
  -[PUPhotoMarkupViewController _notifyObserversDidFinishWithSavedAsset:](self, "_notifyObserversDidFinishWithSavedAsset:", 0);
}

- (void)_handleDoneButton:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  PUReviewAsset *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PUPhotoMarkupViewController reviewAsset](self, "reviewAsset", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPhotoMarkupViewController _sourceImageVersion](self, "_sourceImageVersion");
  -[PUPhotoMarkupViewController _markupViewController](self, "_markupViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createArchivedModelData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentOutputForInputBaseVersion:withLivePhotoSupport:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderedImageFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  LOBYTE(v5) = objc_msgSend(v6, "writeToURL:embeddingSourceImageAndEditModel:error:", v9, 0, &v31);
  v10 = v31;
  if ((v5 & 1) == 0)
  {
    PLAssetExplorerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v9;
      v34 = 2114;
      v35 = v10;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Failed to write image to disk %{public}@: %{public}@", buf, 0x16u);
    }

  }
  if ((objc_msgSend(v4, "mediaSubtypes") & 8) != 0)
  {
    v27 = [PUReviewAsset alloc];
    objc_msgSend(v4, "providedPreviewImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v4, "mediaSubtypes") & 0xFFFFFFFFFFFFFFF7;
    v22 = objc_msgSend(v4, "pixelWidth");
    v21 = objc_msgSend(v4, "pixelHeight");
    objc_msgSend(v4, "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providedImageMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "burstIdentifier");
    v29 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    v13 = objc_msgSend(v4, "numberOfRepresentedAssets");
    objc_msgSend(v4, "providedFullsizeRenderImageURL");
    v28 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providedFullsizeImageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetAdjustments");
    v26 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PUReviewAsset initWithPhoto:mediaSubtypes:width:height:captureDate:metadata:burstIdentifier:representedCount:fullsizeImageURL:fullsizeUnadjustedImageURL:assetAdjustments:identifier:](v27, "initWithPhoto:mediaSubtypes:width:height:captureDate:metadata:burstIdentifier:representedCount:fullsizeImageURL:fullsizeUnadjustedImageURL:assetAdjustments:identifier:", v25, v23, v22, v21, v20, v19, v12, v13, v14, v15, v16, v17);

    v10 = v26;
    v9 = v28;

    v7 = v29;
    v4 = (void *)v24;
    v6 = v30;
  }
  objc_msgSend(v4, "reviewAssetWithAdjustmentOutput:adjustmentData:formatIdentifier:version:", v8, v7, CFSTR("com.apple.Markup"), CFSTR("1.0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoMarkupViewController _notifyObserversDidFinishWithSavedAsset:](self, "_notifyObserversDidFinishWithSavedAsset:", v18);

}

- (void)_notifyObserversDidFinishWithSavedAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  PUObserverRegistry *observerRegistry;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoMarkupViewController _workaroundInputWriteURL](self, "_workaroundInputWriteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "removeItemAtURL:error:", v5, &v13);
    v7 = v13;

    if (v7)
    {
      PLAssetExplorerGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@: %{public}@", buf, 0x16u);
      }

    }
    -[PUPhotoMarkupViewController _setWorkaroundInputWriteURL:](self, "_setWorkaroundInputWriteURL:", 0);

  }
  observerRegistry = self->__observerRegistry;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PUPhotoMarkupViewController__notifyObserversDidFinishWithSavedAsset___block_invoke;
  v11[3] = &unk_1E58A56C8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[PUObserverRegistry enumerateObserversWithBlock:](observerRegistry, "enumerateObserversWithBlock:", v11);

}

- (void)_handleUndoButton:(id)a3
{
  -[NSUndoManager undo](self->_undoManager, "undo", a3);
}

- (void)_handleRedoButton:(id)a3
{
  -[NSUndoManager redo](self->_undoManager, "redo", a3);
}

- (void)_updateUndoRedoButtons
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  if (!-[PUPhotoMarkupViewController updatingUndoButtons](self, "updatingUndoButtons"))
  {
    -[PUPhotoMarkupViewController setUpdatingUndoButtons:](self, "setUpdatingUndoButtons:", 1);
    v3 = -[NSUndoManager canUndo](self->_undoManager, "canUndo");
    -[PUPhotoMarkupViewController undoButton](self, "undoButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

    v5 = -[NSUndoManager canRedo](self->_undoManager, "canRedo");
    -[PUPhotoMarkupViewController redoButton](self, "redoButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v5);

    -[PUPhotoMarkupViewController setUpdatingUndoButtons:](self, "setUpdatingUndoButtons:", 0);
  }
}

- (void)registerObserver:(id)a3
{
  -[PUObserverRegistry registerObserver:](self->__observerRegistry, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[PUObserverRegistry unregisterObserver:](self->__observerRegistry, "unregisterObserver:", a3);
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (MarkupViewControllerPrivateProtocol)_markupViewController
{
  return self->__markupViewController;
}

- (PUObserverRegistry)_observerRegistry
{
  return self->__observerRegistry;
}

- (int64_t)_sourceImageVersion
{
  return self->__sourceImageVersion;
}

- (void)_setSourceImageVersion:(int64_t)a3
{
  self->__sourceImageVersion = a3;
}

- (NSURL)_workaroundInputWriteURL
{
  return self->__workaroundInputWriteURL;
}

- (void)_setWorkaroundInputWriteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
  objc_storeStrong((id *)&self->_undoButton, a3);
}

- (UIBarButtonItem)redoButton
{
  return self->_redoButton;
}

- (void)setRedoButton:(id)a3
{
  objc_storeStrong((id *)&self->_redoButton, a3);
}

- (BOOL)updatingUndoButtons
{
  return self->_updatingUndoButtons;
}

- (void)setUpdatingUndoButtons:(BOOL)a3
{
  self->_updatingUndoButtons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->__workaroundInputWriteURL, 0);
  objc_storeStrong((id *)&self->__observerRegistry, 0);
  objc_storeStrong((id *)&self->__markupViewController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

uint64_t __71__PUPhotoMarkupViewController__notifyObserversDidFinishWithSavedAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "photoMarkupController:didFinishWithSavedAsset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __42__PUPhotoMarkupViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "adjustmentFormatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Markup"));

  objc_msgSend(v2, "adjustmentFormatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("1.0"));

  if (v4 && (v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v2, "adjustmentFormatIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.PaperKit.Markup"));

    objc_msgSend(v2, "adjustmentFormatVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9 & objc_msgSend(v10, "isEqualToString:", CFSTR("1.0"));

  }
  return v7;
}

@end
