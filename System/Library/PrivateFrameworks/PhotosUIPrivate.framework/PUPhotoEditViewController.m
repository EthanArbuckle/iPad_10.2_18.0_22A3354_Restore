@implementation PUPhotoEditViewController

- (PUPhotoEditViewController)initWithPhoto:(id)a3 mediaProvider:(id)a4 mediaDestination:(id)a5
{
  id v10;
  id v11;
  id v12;
  PUPhotoEditViewController *v13;
  PXSystemAVResourceReclamationController *v14;
  PXSystemAVResourceReclamationController *avResourceReclamationController;
  PUPhotoEditViewControllerSpec *v16;
  PUPhotoEditViewControllerSpec *photoEditSpec;
  PUPhotoEditAggregateSession *v18;
  PUPhotoEditAggregateSession *aggregateSession;
  _PPTState *v20;
  _PPTState *pptState;
  PXTimeInterval *v22;
  PXTimeInterval *enterEditTimeInterval;
  NSObject *v24;
  void *v25;
  os_signpost_id_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  PXTimeInterval *v31;
  id v32;
  NSObject *v33;
  id v34;
  PXTimeInterval *v35;
  PXTimeInterval *resourceLoadingInterval;
  PXTimeInterval *v37;
  PXTimeInterval *resourceCheckingInterval;
  PXTimeInterval *v39;
  PXTimeInterval *resourceDownloadInterval;
  PXTimeInterval *v41;
  PXTimeInterval *autoCalcInterval;
  PXTimeInterval *v43;
  PXTimeInterval *filterInterval;
  PXTimeInterval *v45;
  PXTimeInterval *exitEditTimeInterval;
  PXTimeInterval *v47;
  PXTimeInterval *editSessionTimeInterval;
  PUEnterEditPerformanceEventBuilder *v49;
  PUEnterEditPerformanceEventBuilder *enterEditEventBuilder;
  PUExitEditPerformanceEventBuilder *v51;
  PUExitEditPerformanceEventBuilder *exitEditEventBuilder;
  uint64_t v53;
  char v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  dispatch_queue_t v58;
  OS_dispatch_queue *ttrDiagnosticQueue;
  dispatch_queue_t v60;
  OS_dispatch_queue *smartCopyPasteQueue;
  void *v62;
  id v63;
  void *v65;
  id v66;
  _QWORD v67[4];
  NSObject *v68;
  id v69;
  os_signpost_id_t v70;
  uint64_t v71;
  uint64_t v72;
  objc_super v73;
  _QWORD v74[4];

  v74[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v73.receiver = self;
  v73.super_class = (Class)PUPhotoEditViewController;
  v13 = -[PUPhotoEditViewController initWithNibName:bundle:](&v73, sel_initWithNibName_bundle_, 0, 0);
  if (v13)
  {
    v14 = (PXSystemAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E0D78238]);
    avResourceReclamationController = v13->_avResourceReclamationController;
    v13->_avResourceReclamationController = v14;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PUPhotoEditViewController.m"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photo"));

    }
    v66 = v11;
    v16 = objc_alloc_init(PUPhotoEditViewControllerSpec);
    photoEditSpec = v13->_photoEditSpec;
    v13->_photoEditSpec = v16;

    objc_storeStrong((id *)&v13->_photo, a3);
    objc_storeStrong((id *)&v13->_mediaProvider, a4);
    objc_storeStrong((id *)&v13->_mediaDestination, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v12, "setDelegate:", v13);
    v13->_workImageVersion = 0;
    v13->_layoutOrientation = 1;
    v18 = objc_alloc_init(PUPhotoEditAggregateSession);
    aggregateSession = v13->_aggregateSession;
    v13->_aggregateSession = v18;

    if (-[PUPhotoEditViewController isStandardVideo](v13, "isStandardVideo"))
    {
      -[PUPhotoEditAggregateSession setShouldUseVideoKeys:](v13->_aggregateSession, "setShouldUseVideoKeys:", 1);
      objc_msgSend(v10, "duration");
      -[PUPhotoEditAggregateSession setOriginalDuration:](v13->_aggregateSession, "setOriginalDuration:");
    }
    v20 = objc_alloc_init(_PPTState);
    pptState = v13->_pptState;
    v13->_pptState = v20;

    v22 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    enterEditTimeInterval = v13->_enterEditTimeInterval;
    v13->_enterEditTimeInterval = v22;

    PLPhotoEditGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController enterEditTimeInterval](v13, "enterEditTimeInterval");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = os_signpost_id_make_with_pointer(v24, v25);

    objc_msgSend(v10, "pathForOriginalImageFile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastPathComponent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v10, "pixelWidth");
    v30 = objc_msgSend(v10, "pixelHeight");
    v31 = v13->_enterEditTimeInterval;
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __74__PUPhotoEditViewController_initWithPhoto_mediaProvider_mediaDestination___block_invoke;
    v67[3] = &unk_1E58A44B8;
    v68 = v24;
    v69 = v28;
    v70 = v26;
    v71 = v29;
    v72 = v30;
    v32 = v28;
    v33 = v24;
    v34 = (id)-[PXTimeInterval addStateTransitionHandler:](v31, "addStateTransitionHandler:", v67);
    v35 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    resourceLoadingInterval = v13->_resourceLoadingInterval;
    v13->_resourceLoadingInterval = v35;

    v37 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    resourceCheckingInterval = v13->_resourceCheckingInterval;
    v13->_resourceCheckingInterval = v37;

    v39 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    resourceDownloadInterval = v13->_resourceDownloadInterval;
    v13->_resourceDownloadInterval = v39;

    v41 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    autoCalcInterval = v13->_autoCalcInterval;
    v13->_autoCalcInterval = v41;

    v43 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    filterInterval = v13->_filterInterval;
    v13->_filterInterval = v43;

    v45 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    exitEditTimeInterval = v13->_exitEditTimeInterval;
    v13->_exitEditTimeInterval = v45;

    v47 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E0D7BAE8]);
    editSessionTimeInterval = v13->_editSessionTimeInterval;
    v13->_editSessionTimeInterval = v47;

    v49 = objc_alloc_init(PUEnterEditPerformanceEventBuilder);
    enterEditEventBuilder = v13->_enterEditEventBuilder;
    v13->_enterEditEventBuilder = v49;

    -[PUEnterEditPerformanceEventBuilder setAsset:](v13->_enterEditEventBuilder, "setAsset:", v10);
    v51 = objc_alloc_init(PUExitEditPerformanceEventBuilder);
    exitEditEventBuilder = v13->_exitEditEventBuilder;
    v13->_exitEditEventBuilder = v51;

    -[PUExitEditPerformanceEventBuilder setAsset:](v13->_exitEditEventBuilder, "setAsset:", v10);
    v53 = PXCheckAndNoteUseOfSystemSinceBoot();
    v54 = PUCheckAndNoteFirstEntryIntoEditSinceLaunch_isFirstUseSinceLaunch;
    PUCheckAndNoteFirstEntryIntoEditSinceLaunch_isFirstUseSinceLaunch = 1;
    -[PUPhotoEditViewController enterEditEventBuilder](v13, "enterEditEventBuilder");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFirstSinceBoot:", v53);

    -[PUPhotoEditViewController enterEditEventBuilder](v13, "enterEditEventBuilder");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFirstSinceLaunch:", (v54 & 1) == 0);

    -[PUPhotoEditViewController setFirstSinceBoot:](v13, "setFirstSinceBoot:", v53);
    -[PUPhotoEditViewController setFirstSinceLaunch:](v13, "setFirstSinceLaunch:", (v54 & 1) == 0);
    -[PUPhotoEditViewController _didStartEnterEdit](v13, "_didStartEnterEdit");
    v57 = +[PUPhotoEditSupport currentDeviceShouldAllowRawDecode](PUPhotoEditSupport, "currentDeviceShouldAllowRawDecode");
    objc_msgSend(MEMORY[0x1E0D52108], "setImageSourceDisableRAW:", !v57);
    objc_msgSend(MEMORY[0x1E0D71198], "disableApertureEffects:", PECanRenderPortrait() ^ 1);
    objc_opt_class();
    v13->_isEmbeddedEdit = objc_opt_isKindOfClass() & 1;
    v58 = dispatch_queue_create("PUPhotoEditViewController.ttrDiagnosticQueue", 0);
    ttrDiagnosticQueue = v13->_ttrDiagnosticQueue;
    v13->_ttrDiagnosticQueue = (OS_dispatch_queue *)v58;

    v60 = dispatch_queue_create("PUPhotoEditViewController.smartCopyPasteQueue", 0);
    smartCopyPasteQueue = v13->_smartCopyPasteQueue;
    v13->_smartCopyPasteQueue = (OS_dispatch_queue *)v60;

    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v74[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (id)-[PUPhotoEditViewController registerForTraitChanges:withAction:](v13, "registerForTraitChanges:withAction:", v62, sel_traitEnvironment_didChangeTraitCollection_);

    v11 = v66;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *saveProgressTimer;
  OS_dispatch_source *v8;
  objc_super v9;

  -[PUPhotoEditViewController assetChangeTimeoutTimer](self, "assetChangeTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PUPhotoEditViewController setAssetChangeTimeoutTimer:](self, "setAssetChangeTimeoutTimer:", 0);
  if (self->_progressIndicatorInteractionDisablingToken)
    +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_unregisterChangeObserver:", self);

  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterChangeObserver:", self);

  saveProgressTimer = self->_saveProgressTimer;
  if (saveProgressTimer)
  {
    dispatch_source_cancel(saveProgressTimer);
    v8 = self->_saveProgressTimer;
    self->_saveProgressTimer = 0;

  }
  CGImageRelease(self->_gainMapImage);
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController dealloc](&v9, sel_dealloc);
}

- (void)_updateKeyCommands
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *toolControllerTagsByKeyCommandNumber;
  _BOOL4 v21;
  void **v22;
  id *v23;
  id *v24;
  id *v25;
  int64_t v26;
  void **v27;
  void *v28;
  void *v29;
  id *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int64_t v38;
  void **v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (-[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing")
    || !-[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia"))
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v62 = 1728;
    v3 = self->_addedKeyCommands;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v80 != v6)
            objc_enumerationMutation(v3);
          -[PUPhotoEditViewController removeKeyCommand:](self, "removeKeyCommand:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i), v62);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
      }
      while (v5);
    }

    v64 = (void *)objc_opt_new();
    -[PUPhotoEditViewController _allTools](self, "_allTools");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 1;
      v12 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v76 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_TtC15PhotosUIPrivate26PUPhotoStyleToolController **)(*((_QWORD *)&v75 + 1) + 8 * j);
          if (-[PUPhotoStyleToolController toolControllerTag](v14, "toolControllerTag", v62) != 1005)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PUPhotoStyleToolController toolControllerTag](v14, "toolControllerTag"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setObject:forKeyedSubscript:", v16, v15);

            if (v14 == (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_adjustmentsController)
            {
              v17 = CFSTR("a");
            }
            else if (v14 == (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_filtersController)
            {
              v17 = CFSTR("f");
            }
            else
            {
              if (v14 != (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_cropController)
              {
                if (v14 == self->_photoStylesToolController)
                {
                  v17 = CFSTR("s");
                  goto LABEL_24;
                }
LABEL_25:
                ++v11;

                continue;
              }
              v17 = CFSTR("c");
            }
LABEL_24:
            objc_msgSend(MEMORY[0x1E0DC3930], "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_1E58AD278, 0, sel_navigateToSegment_, v17, 0, v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "addObject:", v18);

            goto LABEL_25;
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      }
      while (v10);
    }

    v19 = (NSDictionary *)objc_msgSend(v65, "copy");
    toolControllerTagsByKeyCommandNumber = self->_toolControllerTagsByKeyCommandNumber;
    self->_toolControllerTagsByKeyCommandNumber = v19;

    v21 = -[PUPhotoEditToolController wantsScrubberKeyControl](self->_currentEditingTool, "wantsScrubberKeyControl");
    v22 = (void **)MEMORY[0x1E0DC4E10];
    v23 = (id *)MEMORY[0x1E0DC4E30];
    v24 = (id *)MEMORY[0x1E0DC4E28];
    v25 = (id *)MEMORY[0x1E0DC4D90];
    if (v21)
    {
      v26 = -[PUPhotoEditToolController scrubberOrientation](self->_currentEditingTool, "scrubberOrientation");
      if (v26 == 1)
        v27 = v22;
      else
        v27 = v23;
      v28 = *v27;
      v29 = (void *)MEMORY[0x1E0DC3930];
      if (v26 == 1)
        v30 = v24;
      else
        v30 = v25;
      v31 = v28;
      objc_msgSend(v29, "keyCommandWithInput:modifierFlags:action:", v31, 0, sel__handleScrubberValueDecrease_);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v32);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v31, 0x20000, sel__handleCoarseScrubberValueDecrease_);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v64, "addObject:", v33);
      v34 = (void *)MEMORY[0x1E0DC3930];
      v35 = *v30;
      objc_msgSend(v34, "keyCommandWithInput:modifierFlags:action:", v35, 0, sel__handleScrubberValueIncrease_);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v36);

      v23 = (id *)MEMORY[0x1E0DC4E30];
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v35, 0x20000, sel__handleCoarseScrubberValueIncrease_);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (id *)MEMORY[0x1E0DC4E28];
      objc_msgSend(v64, "addObject:", v37);

    }
    if (-[PUPhotoEditToolController wantsSliderKeyControl](self->_currentEditingTool, "wantsSliderKeyControl", v62))
    {
      v38 = -[PUPhotoEditToolController scrubberOrientation](self->_currentEditingTool, "scrubberOrientation");
      if (v38 == 1)
        v39 = v22;
      else
        v39 = v25;
      v40 = *v39;
      v41 = (void *)MEMORY[0x1E0DC3930];
      if (v38 == 1)
        v23 = v24;
      v42 = v40;
      objc_msgSend(v41, "keyCommandWithInput:modifierFlags:action:", v42, 0x80000, sel__handleSliderValueDecrease_);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v43);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v42, 655360, sel__handleCoarseSliderValueDecrease_);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v64, "addObject:", v44);
      v45 = (void *)MEMORY[0x1E0DC3930];
      v46 = *v23;
      objc_msgSend(v45, "keyCommandWithInput:modifierFlags:action:", v46, 0x80000, sel__handleSliderValueIncrease_);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v47);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v46, 655360, sel__handleCoarseSliderValueIncrease_);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v64, "addObject:", v48);
    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v49 = v64;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v72;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v72 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * k), "setWantsPriorityOverSystemBehavior:", 1);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
      }
      while (v51);
    }

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel__handleCancelButton_);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v54);

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v55 = v49;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v68;
      do
      {
        for (m = 0; m != v57; ++m)
        {
          if (*(_QWORD *)v68 != v58)
            objc_enumerationMutation(v55);
          -[PUPhotoEditViewController addKeyCommand:](self, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * m));
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
      }
      while (v57);
    }

    v60 = (objc_class *)objc_msgSend(v55, "copy");
    v61 = *(Class *)((char *)&self->super.super.super.isa + v63);
    *(Class *)((char *)&self->super.super.super.isa + v63) = v60;

  }
}

- (BOOL)_updatePreviewOriginal:(BOOL)a3 withPresses:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PUPhotoEditToolController supportsPreviewingOriginal](self->_currentEditingTool, "supportsPreviewingOriginal"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "key");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "charactersIgnoringModifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "isEqualToString:", CFSTR("m")))
          {
            -[PUPhotoEditViewController setShouldBePreviewingOriginal:](self, "setShouldBePreviewingOriginal:", v4);
            v10 = 1;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v15 = v10 & 1;
    v6 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[PUPhotoEditViewController _updatePreviewOriginal:withPresses:](self, "_updatePreviewOriginal:withPresses:", 1, v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditViewController;
    -[PUPhotoEditViewController pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[PUPhotoEditViewController _updatePreviewOriginal:withPresses:](self, "_updatePreviewOriginal:withPresses:", 0, v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditViewController;
    -[PUPhotoEditViewController pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[PUPhotoEditViewController _updatePreviewOriginal:withPresses:](self, "_updatePreviewOriginal:withPresses:", 0, v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditViewController;
    -[PUPhotoEditViewController pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)_updateTraitCollectionAndLayoutReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  PUPhotoEditViewControllerSpec *photoEditSpec;
  id v8;
  _QWORD v9[5];
  id v10;
  CGFloat v11;
  CGFloat v12;

  height = a3.height;
  width = a3.width;
  -[PUPhotoEditViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  photoEditSpec = self->_photoEditSpec;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PUPhotoEditViewController__updateTraitCollectionAndLayoutReferenceSize___block_invoke;
  v9[3] = &unk_1E58AB348;
  v9[4] = self;
  v10 = v6;
  v11 = width;
  v12 = height;
  v8 = v6;
  -[PUViewControllerSpec performChanges:](photoEditSpec, "performChanges:", v9);

}

- (void)_updateTraitCollectionAndLayoutReferenceSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (-[UIViewController pu_isPresenting](self, "pu_isPresenting"))
  {
    -[PUViewControllerSpec layoutReferenceSize](self->_photoEditSpec, "layoutReferenceSize");
    v5 = v8;
    v7 = v9;
  }
  -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", v5, v7);
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;

  -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize](self, "_updateTraitCollectionAndLayoutReferenceSize", a3, a4);
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutReferenceSize");
  -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", 0);

  -[PUPhotoEditViewController _updateSpecDependentUIPieces](self, "_updateSpecDependentUIPieces");
}

- (id)_composition
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[PUPhotoEditViewController editSource](self, "editSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUPhotoEditViewController editSource](self, "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mediaType");
  }
  else
  {
    -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 996, CFSTR("could not work out media type, so no composition for you!"));

      v6 = 0;
      goto LABEL_6;
    }
    v5 = (void *)v7;
    -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "mediaType");

  }
  if (!v6)
    goto LABEL_7;
LABEL_6:
  v9 = (void *)MEMORY[0x1E0D71660];
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "validatedCompositionCopyFor:mediaType:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  NUMediaView *v5;
  NUMediaView *mediaView;
  PEAutoAdjustmentController *v7;
  PEAutoAdjustmentController *autoEnhanceController;
  void *v9;
  int v10;
  PUPhotoEditPerfHUD *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  PUPhotoSceneHUD *v48;
  void *v49;
  PUPhotoSceneHUD *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewDidLoad](&v60, sel_viewDidLoad);
  -[PUPhotoEditViewController px_enableImageModulation](self, "px_enableImageModulation");
  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);
  -[PUPhotoEditViewController contentScrollView](self, "contentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", 3);

  -[PUPhotoEditViewController _createMediaView](self, "_createMediaView");
  v5 = (NUMediaView *)objc_claimAutoreleasedReturnValue();
  mediaView = self->_mediaView;
  self->_mediaView = v5;

  objc_msgSend(v3, "addSubview:", self->_mediaView);
  -[PUPhotoEditViewController _createVideoScrubberIfNeeded](self, "_createVideoScrubberIfNeeded");
  v7 = (PEAutoAdjustmentController *)objc_alloc_init(MEMORY[0x1E0D7CAC0]);
  autoEnhanceController = self->_autoEnhanceController;
  self->_autoEnhanceController = v7;

  -[PUPhotoEditViewController _setupImagePluginSession](self, "_setupImagePluginSession");
  objc_msgSend(v3, "setNeedsUpdateConstraints");
  -[PUPhotoEditViewController _updateLayerModulation](self, "_updateLayerModulation");
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enablePerfDebugHUD");

  if (v10)
  {
    v11 = objc_alloc_init(PUPhotoEditPerfHUD);
    -[PUPhotoEditViewController setPerfHUD:](self, "setPerfHUD:", v11);

    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v13);

    v14 = -[PUPhotoEditViewController isFirstSinceBoot](self, "isFirstSinceBoot");
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFirstSinceBoot:", v14);

    v16 = -[PUPhotoEditViewController isFirstSinceLaunch](self, "isFirstSinceLaunch");
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFirstSinceLaunch:", v16);

    -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnterEditTimeInterval:", v18);

    -[PUPhotoEditViewController resourceCheckingInterval](self, "resourceCheckingInterval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setResourceCheckingInterval:", v20);

    -[PUPhotoEditViewController resourceDownloadInterval](self, "resourceDownloadInterval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setResourceDownloadInterval:", v22);

    -[PUPhotoEditViewController resourceLoadingInterval](self, "resourceLoadingInterval");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setResourceLoadingInterval:", v24);

    -[PUPhotoEditViewController autoCalcInterval](self, "autoCalcInterval");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAutoCalcInterval:", v26);

    -[PUPhotoEditViewController filterInterval](self, "filterInterval");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFilterInterval:", v28);

    -[PUPhotoEditViewController exitEditTimeInterval](self, "exitEditTimeInterval");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setExitEditTimeInterval:", v30);

    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 4.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);

    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 50.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[PUPhotoEditViewController photo](self, "photo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "pathForOriginalImageFile");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastPathComponent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController perfHUD](self, "perfHUD");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setDetailText:", v44);
LABEL_5:

    goto LABEL_6;
  }
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "enableSemanticDevelopmentHUD");

  if (v47)
  {
    v48 = [PUPhotoSceneHUD alloc];
    -[PUPhotoEditViewController photo](self, "photo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[PUPhotoSceneHUD initWithPhoto:](v48, "initWithPhoto:", v49);
    -[PUPhotoEditViewController setSceneHUD:](self, "setSceneHUD:", v50);

    -[PUPhotoEditViewController sceneHUD](self, "sceneHUD");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUPhotoEditViewController sceneHUD](self, "sceneHUD");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v52);

    -[PUPhotoEditViewController sceneHUD](self, "sceneHUD");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, 4.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[PUPhotoEditViewController sceneHUD](self, "sceneHUD");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 50.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__undoManagerDidCloseUndoGroupNotification_, *MEMORY[0x1E0CB33A0], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__undoManagerWillUndo_, *MEMORY[0x1E0CB33D0], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__undoManagerWillRedo_, *MEMORY[0x1E0CB33C8], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__undoManagerDidUndo_, *MEMORY[0x1E0CB33B8], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__undoManagerDidRedo_, *MEMORY[0x1E0CB33B0], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  -[PUPhotoEditViewController avResourceReclamationAssertion](self, "avResourceReclamationAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUPhotoEditViewController avResourceReclamationController](self, "avResourceReclamationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "takeAssertionPreventingResourceReclamationWithReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController setAvResourceReclamationAssertion:](self, "setAvResourceReclamationAssertion:", v9);

  }
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
  -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize](self, "_updateTraitCollectionAndLayoutReferenceSize");
  -[PUViewControllerSpec registerChangeObserver:](self->_photoEditSpec, "registerChangeObserver:", self);
  -[PUPhotoEditViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  if (-[UIViewController pu_isPresenting](self, "pu_isPresenting"))
  {
    -[PUViewControllerSpec layoutReferenceSize](self->_photoEditSpec, "layoutReferenceSize");
    v12 = v15;
    v14 = v16;
  }
  -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", 0, v12, v14);
  -[PUPhotoEditViewController _loadPhotoEditResourcesIfNeeded](self, "_loadPhotoEditResourcesIfNeeded");
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
  -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer");
  -[PUPhotoEditViewController _updateLivePhotoPlaybackGestureRecognizer](self, "_updateLivePhotoPlaybackGestureRecognizer");
  -[PUPhotoEditViewController _updatePreviewingOriginal](self, "_updatePreviewingOriginal");
  -[PUPhotoEditViewController _updateBackgroundColor](self, "_updateBackgroundColor");
  -[PUPhotoEditViewController _updateToolbarBackgroundAnimated:](self, "_updateToolbarBackgroundAnimated:", 0);
  -[PUPhotoEditViewController _createPencilInteractionIfNeeded](self, "_createPencilInteractionIfNeeded");
  -[PEAutoAdjustmentController invalidateCachedAdjustments](self->_autoEnhanceController, "invalidateCachedAdjustments");
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setChangeDelegate:", self);

  if (self->_mediaToolController)
  {
    if (!self->_currentTool)
      -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:");
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
    -[PUPhotoEditViewController _loadPhotoEditResourcesIfNeeded](self, "_loadPhotoEditResourcesIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", v3);
  -[PUPhotoEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXAppIntentsRegisterViewAnnotationView();

  PXRegisterAppIntentsViewAnnotationDelegate();
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllRequests");

  -[PUPhotoEditViewController revertConfirmationAlert](self, "revertConfirmationAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUPhotoEditViewController revertConfirmationAlert](self, "revertConfirmationAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  -[NUMediaView _stopVideoPlayback](self->_mediaView, "_stopVideoPlayback");
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChangeDelegate:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PUViewControllerSpec unregisterChangeObserver:](self->_photoEditSpec, "unregisterChangeObserver:", self);
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 0);
  PXUnregisterAppIntentsViewAnnotationDelegate();
}

- (BOOL)prefersStatusBarHidden
{
  return PLPhysicalDeviceIsIPad() ^ 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") != 1
      || -[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction");
}

- (id)_preferredStatusBarHideAnimationParameters
{
  return objc_alloc_init(MEMORY[0x1E0DC3CC0]);
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 0;
}

- (BOOL)pu_wantsToolbarVisible
{
  return 0;
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (void)_updateProgressEventBlockingViewConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  void *v16;
  UIView *progressEventBlockingView;
  PUPhotoEditToolbar *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *progressEventBlockingViewConstraints;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  if (self->_progressEventBlockingView && !self->_progressEventBlockingViewConstraints)
  {
    if (-[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") == 1
      && (-[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "currentLayoutStyle"),
          v3,
          v4 != 4))
    {
      progressEventBlockingView = self->_progressEventBlockingView;
      v18 = self->_mainToolbar;
      -[UIView leftAnchor](progressEventBlockingView, "leftAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leftAnchor");
      v30 = v19;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v26;
      -[UIView topAnchor](self->_progressEventBlockingView, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "topAnchor");
      v25 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v8;
      -[UIView rightAnchor](self->_progressEventBlockingView, "rightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v12;
      -[UIView bottomAnchor](self->_progressEventBlockingView, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v18;
      -[PUPhotoEditToolbar topAnchor](v18, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      progressEventBlockingViewConstraints = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = v21;

    }
    else
    {
      -[UIView leftAnchor](self->_progressEventBlockingView, "leftAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leftAnchor");
      v30 = v5;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "constraintEqualToAnchor:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v28;
      -[UIView topAnchor](self->_progressEventBlockingView, "topAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditButtonCenteredToolbar bottomAnchor](self->_secondaryToolbar, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v6;
      objc_msgSend(v6, "constraintEqualToAnchor:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v24;
      -[UIView rightAnchor](self->_progressEventBlockingView, "rightAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v7;
      objc_msgSend(v7, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v10;
      -[UIView bottomAnchor](self->_progressEventBlockingView, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v16 = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = v15;
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_progressEventBlockingViewConstraints);
  }
}

- (void)updateViewConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *placeholderImageViewConstraints;
  PUPhotoEditToolbar *mainToolbar;
  int *v26;
  void *v27;
  NSArray *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  void *v38;
  void *v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSArray *mainToolbarConstraints;
  uint64_t v51;
  NSArray *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  NSArray *secondaryToolbarConstraints;
  NSArray *notchButtons;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSArray *v73;
  void *actionButtonConstraints;
  NSArray *v75;
  double v76;
  double v77;
  void *v78;
  UIViewController *currentTool;
  void *v80;
  void *v81;
  PUPhotoEditToolbar *v82;
  uint64_t v83;
  void *v84;
  NSArray *v85;
  NSArray *currentToolViewConstraints;
  PUPhotoEditToolController *previousEditingTool;
  void *v88;
  void *v89;
  PUPhotoEditToolbar *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  NSArray *v94;
  void *v95;
  PUProgressIndicatorView *progressIndicatorView;
  void *v97;
  void *v98;
  void *v99;
  PUProgressIndicatorView *v100;
  void *v101;
  void *v102;
  NSArray *progressIndicatorViewConstraints;
  int64_t v104;
  void *v105;
  uint64_t v106;
  double v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  UILayoutGuide *imageFrameLayoutGuide;
  NSArray *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  NSArray *transientStatusBadgeConstraints;
  double v131;
  NSArray *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  NSArray *assetTypeBadgeConstraints;
  NUMediaView *mediaView;
  void *v143;
  void *v144;
  void *v145;
  NUMediaView *v146;
  void *v147;
  void *v148;
  void *v149;
  NUMediaView *v150;
  void *v151;
  void *v152;
  void *v153;
  NUMediaView *v154;
  void *v155;
  void *v156;
  NSArray *v157;
  NSArray *mediaViewConstraints;
  UIButton *mainActionButton;
  void *v160;
  NSArray *v161;
  NSArray *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  objc_super v176;
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[3];
  _QWORD v180[5];

  v180[3] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController lastKnownPreviewImageSize](self, "lastKnownPreviewImageSize");
  -[PUPhotoEditViewController _placeholderViewFrameForImageSize:](self, "_placeholderViewFrameForImageSize:");
  if (self->_placeholderImageView)
  {
    if (!self->_placeholderImageViewConstraints)
    {
      v7 = v3;
      v8 = v4;
      v9 = v5;
      v10 = v6;
      if (!CGRectIsEmpty(*(CGRect *)&v3))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
        -[UIImageView leftAnchor](self->_placeholderImageView, "leftAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView superview](self->_placeholderImageView, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "leftAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v11, "addObject:", v15);

        -[UIImageView widthAnchor](self->_placeholderImageView, "widthAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToConstant:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v11, "addObject:", v17);

        -[UIImageView topAnchor](self->_placeholderImageView, "topAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView superview](self->_placeholderImageView, "superview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "topAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v11, "addObject:", v21);

        -[UIImageView heightAnchor](self->_placeholderImageView, "heightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToConstant:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v11, "addObject:", v23);

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);
        placeholderImageViewConstraints = self->_placeholderImageViewConstraints;
        self->_placeholderImageViewConstraints = v11;

      }
    }
  }
  mainToolbar = self->_mainToolbar;
  v26 = &OBJC_IVAR___PUOneUpViewControllerSpec__hideStatusBarWhenShowingAccessoryView;
  if (mainToolbar && !self->_mainToolbarConstraints)
  {
    _NSDictionaryOfVariableBindings(CFSTR("_mainToolbar"), mainToolbar, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar setTranslatesAutoresizingMaskIntoConstraints:](self->_mainToolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "currentLayoutStyle");

    if (v30 == 4)
    {
      -[PUPhotoEditToolbar leftAnchor](self->_mainToolbar, "leftAnchor");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "leftAnchor");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "constraintEqualToAnchor:constant:", v169, 27.0);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v180[0] = v168;
      -[PUPhotoEditToolbar centerYAnchor](self->_mainToolbar, "centerYAnchor");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "centerYAnchor");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "constraintEqualToAnchor:", v163);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v180[1] = v31;
      -[PUPhotoEditToolbar heightAnchor](self->_mainToolbar, "heightAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "heightAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v34);
      v35 = v27;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v180[2] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 3);
      v37 = v28;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v37, "addObjectsFromArray:", v38);

      v28 = v37;
      v27 = v35;

      v26 = &OBJC_IVAR___PUOneUpViewControllerSpec__hideStatusBarWhenShowingAccessoryView;
      v39 = v164;
    }
    else
    {
      v40 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
      if (v40 != 2)
      {
        if (v40 == 1)
        {
          -[PUPhotoEditToolbar setLayoutDirection:](self->_mainToolbar, "setLayoutDirection:", 0);
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_mainToolbar]|"), 0x10000, 0, v27);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v41);

          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_mainToolbar]-0@highPriority-|"), 0, &unk_1E59BAC00, v27);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v42);

        }
        goto LABEL_14;
      }
      -[PUPhotoEditToolbar setLayoutDirection:](self->_mainToolbar, "setLayoutDirection:", 1);
      -[PUPhotoEditToolbar rightAnchor](self->_mainToolbar, "rightAnchor");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "rightAnchor");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "constraintEqualToAnchor:", v169);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v179[0] = v168;
      -[PUPhotoEditToolbar topAnchor](self->_mainToolbar, "topAnchor");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditButtonCenteredToolbar bottomAnchor](self->_secondaryToolbar, "bottomAnchor");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "constraintEqualToAnchor:", v165);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v179[1] = v43;
      -[PUPhotoEditToolbar bottomAnchor](self->_mainToolbar, "bottomAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController view](self, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v179[2] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 3);
      v48 = v27;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v49);

      v27 = v48;
      v26 = &OBJC_IVAR___PUOneUpViewControllerSpec__hideStatusBarWhenShowingAccessoryView;

      v39 = v167;
    }

LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v28);
    mainToolbarConstraints = self->_mainToolbarConstraints;
    self->_mainToolbarConstraints = v28;

  }
  v51 = v26[607];
  if (*(Class *)((char *)&self->super.super.super.isa + v51) && !self->_secondaryToolbarConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v52, "addObject:", v56);

    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v52, "addObject:", v60);

    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, 0.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v65) = 1144750080;
    objc_msgSend(v64, "setPriority:", v65);
    objc_msgSend(v64, "setActive:", 1);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v52);
    secondaryToolbarConstraints = self->_secondaryToolbarConstraints;
    self->_secondaryToolbarConstraints = v52;

  }
  if (!self->_actionButtonConstraints)
  {
    notchButtons = self->_notchButtons;
    if (notchButtons)
    {
      -[NSArray objectAtIndexedSubscript:](notchButtons, "objectAtIndexedSubscript:", 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_notchButtons, "objectAtIndexedSubscript:", 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController parentViewController](self, "parentViewController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "view");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "window");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoEditLayoutSupport constraintsForNotchAreaButtonsLeading:trailing:inWindow:](PUPhotoEditLayoutSupport, "constraintsForNotchAreaButtonsLeading:trailing:inWindow:", v68, v69, v72);
      v73 = (NSArray *)objc_claimAutoreleasedReturnValue();
      actionButtonConstraints = self->_actionButtonConstraints;
      self->_actionButtonConstraints = v73;
    }
    else
    {
      mainActionButton = self->_mainActionButton;
      if (!mainActionButton)
      {
        v75 = 0;
        goto LABEL_22;
      }
      if (!self->_cancelButton)
      {
        v75 = 0;
        goto LABEL_22;
      }
      -[UIButton widthAnchor](mainActionButton, "widthAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToConstant:", 66.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v178[0] = v69;
      -[UIButton heightAnchor](self->_mainActionButton, "heightAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToConstant:", 26.0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v178[1] = v71;
      -[UIButton widthAnchor](self->_cancelButton, "widthAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToConstant:", 66.0);
      actionButtonConstraints = (void *)objc_claimAutoreleasedReturnValue();
      v178[2] = actionButtonConstraints;
      -[UIButton heightAnchor](self->_cancelButton, "heightAnchor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "constraintEqualToConstant:", 26.0);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v178[3] = v160;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 4);
      v161 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v162 = self->_actionButtonConstraints;
      self->_actionButtonConstraints = v161;

    }
    v75 = self->_actionButtonConstraints;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v75);
  }
  -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
  if (v77 > 0.0 && v76 > 0.0)
  {
    v78 = *(Class *)((char *)&self->super.super.super.isa + v51);
    if (v78)
      objc_msgSend(v78, "intrinsicContentSize");
  }
  currentTool = self->_currentTool;
  if (currentTool)
  {
    -[UIViewController view](currentTool, "view");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "superview");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      v82 = self->_mainToolbar;
      if (v82)
      {
        v83 = -[PUPhotoEditToolbar layoutOrientation](v82, "layoutOrientation");
        if (v83 == -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation")
          && !self->_currentToolViewConstraints)
        {
          -[UIViewController view](self->_currentTool, "view");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditViewController _constraintsForToolView:wantsFullscreen:](self, "_constraintsForToolView:wantsFullscreen:", v84, -[PUPhotoEditToolController wantsFullscreen](self->_currentEditingTool, "wantsFullscreen"));
          v85 = (NSArray *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v85);
          currentToolViewConstraints = self->_currentToolViewConstraints;
          self->_currentToolViewConstraints = v85;

        }
      }
    }
  }
  previousEditingTool = self->_previousEditingTool;
  if (previousEditingTool)
  {
    -[PUPhotoEditToolController view](previousEditingTool, "view");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "superview");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      v90 = self->_mainToolbar;
      if (v90)
      {
        v91 = -[PUPhotoEditToolbar layoutOrientation](v90, "layoutOrientation");
        if (v91 == -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"))
        {
          -[PUPhotoEditToolController view](self->_previousEditingTool, "view");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditViewController _constraintsForToolView:wantsFullscreen:](self, "_constraintsForToolView:wantsFullscreen:", v92, -[PUPhotoEditToolController wantsFullscreen](self->_previousEditingTool, "wantsFullscreen"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v93);

        }
      }
    }
  }
  if (self->_progressIndicatorView && !self->_progressIndicatorViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v94 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)MEMORY[0x1E0CB3718];
    progressIndicatorView = self->_progressIndicatorView;
    -[PUPhotoEditViewController view](self, "view");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", progressIndicatorView, 9, 0, v97, 9, 1.0, 0.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v94, "addObject:", v98);

    v99 = (void *)MEMORY[0x1E0CB3718];
    v100 = self->_progressIndicatorView;
    -[PUPhotoEditViewController view](self, "view");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v100, 10, 0, v101, 10, 1.0, 0.0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v94, "addObject:", v102);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v94);
    progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
    self->_progressIndicatorViewConstraints = v94;

  }
  -[PUPhotoEditViewController _updateProgressEventBlockingViewConstraints](self, "_updateProgressEventBlockingViewConstraints");
  v104 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "userInterfaceIdiom");

  if ((v106 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v104 == 1)
    v108 = 18.0;
  else
    v108 = 0.0;
  -[NUMediaView _scrollView](self->_mediaView, "_scrollView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "intrinsicContentSize");
  v111 = v110;
  -[PUPhotoEditViewController view](self, "view");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "safeAreaInsets");
  v114 = v113;
  v116 = v115;

  if (self->_transientStatusBadge)
  {
    LOBYTE(imageFrameLayoutGuide) = v109 == 0;
    if (v109)
    {
      if (!self->_transientStatusBadgeConstraints)
      {
        imageFrameLayoutGuide = self->_imageFrameLayoutGuide;
        if (imageFrameLayoutGuide)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v118 = (NSArray *)objc_claimAutoreleasedReturnValue();
          -[CEKBadgeTextView topAnchor](self->_transientStatusBadge, "topAnchor");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditViewController view](self, "view");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "topAnchor");
          v174 = v109;
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "constraintEqualToAnchor:constant:", v121, v108 + v114 + 36.0);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v118, "addObject:", v122);

          -[CEKBadgeTextView centerXAnchor](self->_transientStatusBadge, "centerXAnchor");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditViewController view](self, "view");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "centerXAnchor");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "constraintEqualToAnchor:constant:", v125, 0.0);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v118, "addObject:", v126);

          -[CEKBadgeTextView widthAnchor](self->_transientStatusBadge, "widthAnchor");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "widthAnchor");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v128, 1.0, -18.0);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v118, "addObject:", v129);

          v109 = v174;
          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v118);
          transientStatusBadgeConstraints = self->_transientStatusBadgeConstraints;
          self->_transientStatusBadgeConstraints = v118;

          LOBYTE(imageFrameLayoutGuide) = 0;
        }
      }
    }
  }
  else
  {
    LOBYTE(imageFrameLayoutGuide) = v109 == 0;
  }
  if (self->_assetTypeBadge)
  {
    if (self->_assetTypeBadgeConstraints)
      LOBYTE(imageFrameLayoutGuide) = 1;
    if ((imageFrameLayoutGuide & 1) == 0)
    {
      v131 = v116 + 22.0 + 6.0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v132 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[PXUIAssetBadgeView topAnchor](self->_assetTypeBadge, "topAnchor");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "topAnchor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "constraintEqualToAnchor:constant:", v134, v111 + 6.0);
      v135 = v109;
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v132, "addObject:", v136);

      v109 = v135;
      -[PXUIAssetBadgeView leftAnchor](self->_assetTypeBadge, "leftAnchor");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "leftAnchor");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      if (v104 == 1)
        v139 = 6.0;
      else
        v139 = v131;
      objc_msgSend(v137, "constraintEqualToAnchor:constant:", v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v132, "addObject:", v140);

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v132);
      assetTypeBadgeConstraints = self->_assetTypeBadgeConstraints;
      self->_assetTypeBadgeConstraints = v132;

    }
  }
  mediaView = self->_mediaView;
  if (mediaView && !self->_mediaViewConstraints)
  {
    v143 = (void *)MEMORY[0x1E0CB3718];
    -[PUPhotoEditViewController view](self, "view");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", mediaView, 9, 0, v172, 9, 1.0, 0.0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v177[0] = v144;
    v145 = (void *)MEMORY[0x1E0CB3718];
    v175 = v109;
    v146 = self->_mediaView;
    -[PUPhotoEditViewController view](self, "view");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v146, 10, 0, v147, 10, 1.0, 0.0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v177[1] = v148;
    v149 = (void *)MEMORY[0x1E0CB3718];
    v150 = self->_mediaView;
    -[PUPhotoEditViewController view](self, "view");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v150, 8, 0, v151, 8, 1.0, 0.0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v177[2] = v152;
    v153 = (void *)MEMORY[0x1E0CB3718];
    v154 = self->_mediaView;
    -[PUPhotoEditViewController view](self, "view");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v154, 7, 0, v155, 7, 1.0, 0.0);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v177[3] = v156;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 4);
    v157 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v109 = v175;
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v157);
    mediaViewConstraints = self->_mediaViewConstraints;
    self->_mediaViewConstraints = v157;

  }
  v176.receiver = self;
  v176.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController updateViewConstraints](&v176, sel_updateViewConstraints);

}

- (id)_constraintsForToolView:(id)a3 wantsFullscreen:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PUPhotoEditToolbar *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
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
  PUPhotoEditToolbar *v46;
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[6];

  v4 = a4;
  v50[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_mainToolbar;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v46 = v7;
  if (v4)
  {
    objc_msgSend(v6, "leftAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v12;
    objc_msgSend(v6, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rightAnchor");
    v45 = v13;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v42;
    objc_msgSend(v6, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v41 = v14;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v38;
    objc_msgSend(v6, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v19);

    v20 = v9;
    v21 = v36;
LABEL_11:

    v7 = v46;
    goto LABEL_12;
  }
  v37 = (void *)v8;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "currentLayoutStyle");

  if (v23 == 4)
  {
    objc_msgSend(v6, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v12;
    objc_msgSend(v6, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rightAnchor");
    v45 = v24;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v42;
    objc_msgSend(v6, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditButtonCenteredToolbar bottomAnchor](self->_secondaryToolbar, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v25;
    objc_msgSend(v25, "constraintEqualToAnchor:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v39;
    objc_msgSend(v6, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v26;
    objc_msgSend(v26, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v37;
LABEL_10:
    objc_msgSend(v20, "addObjectsFromArray:", v18);
    goto LABEL_11;
  }
  v27 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  v20 = v37;
  if (v27 == 2)
  {
    objc_msgSend(v6, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v12;
    objc_msgSend(v6, "rightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar leftAnchor](v7, "leftAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v32;
    objc_msgSend(v32, "constraintEqualToAnchor:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v43;
    objc_msgSend(v6, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v42 = v33;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v39;
    objc_msgSend(v6, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v34;
    objc_msgSend(v34, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v17;
    v30 = (void *)MEMORY[0x1E0C99D20];
    v31 = v47;
    goto LABEL_9;
  }
  if (v27 == 1)
  {
    objc_msgSend(v6, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v12;
    objc_msgSend(v6, "rightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rightAnchor");
    v45 = v28;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v42;
    objc_msgSend(v6, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v41 = v29;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v38;
    objc_msgSend(v6, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar topAnchor](v7, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v17;
    v30 = (void *)MEMORY[0x1E0C99D20];
    v31 = v48;
LABEL_9:
    objc_msgSend(v30, "arrayWithObjects:count:", v31, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_12:

  return v20;
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUPhotoEditViewController _updateToolbarsContentPadding](self, "_updateToolbarsContentPadding");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double MaxY;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  UILayoutGuide *v72;
  UILayoutGuide *imageFrameLayoutGuide;
  void *v74;
  void *v75;
  NSArray *imageFrameLayoutGuideConstraints;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSArray *v85;
  NSArray *v86;
  void *v87;
  double MaxX;
  double v89;
  double v90;
  double Width;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  CGFloat v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double MinX;
  CGFloat v113;
  void *v114;
  PUPhotoEditShadowView *mainToolbarShadow;
  PUPhotoEditShadowView *secondaryToolbarShadow;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  int64_t v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  double v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  objc_super v142;
  _QWORD v143[6];
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;

  v143[4] = *MEMORY[0x1E0C80C00];
  v142.receiver = self;
  v142.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewDidLayoutSubviews](&v142, sel_viewDidLayoutSubviews);
  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutReferenceSize");
  v10 = v9;
  v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", v5, v7);
    -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", 0, v5, v7);
  }
  -[PUPhotoEditViewController _updateMediaViewEdgeInsets](self, "_updateMediaViewEdgeInsets");
  -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
  v15 = v14;
  v138 = v17;
  v139 = v16;
  v136 = v18;
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:");
  -[PUPhotoEditViewController _updateToolbarBackgroundAnimated:](self, "_updateToolbarBackgroundAnimated:", 0);
  -[PUPhotoEditViewController irisRevertConfirmationAlert](self, "irisRevertConfirmationAlert");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PUPhotoEditMediaToolController livePhotoButton](self->_mediaToolController, "livePhotoButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController irisRevertConfirmationAlert](self, "irisRevertConfirmationAlert");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "popoverPresentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSourceView:", v20);

    -[PUPhotoEditViewController irisRevertConfirmationAlert](self, "irisRevertConfirmationAlert");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    objc_msgSend(v24, "setSourceRect:");

  }
  -[PUPhotoEditButtonCenteredToolbar frame](self->_secondaryToolbar, "frame");
  MaxY = CGRectGetMaxY(v144);
  -[UIViewController view](self->_currentTool, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v27 = MaxY - CGRectGetMinY(v145);
  -[PUPhotoEditViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaInsets");
  v30 = v27 - v29;

  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "currentLayoutStyle");

  v33 = 0.0;
  if (v32 != 4
    && -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") == 1
    && -[PUPhotoEditToolController wantsFullscreen](self->_currentEditingTool, "wantsFullscreen"))
  {
    -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
    v34 = v7 - CGRectGetMinY(v146);
    -[PUPhotoEditViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "safeAreaInsets");
    v33 = v34 - v36;

  }
  v117 = v7;
  -[UIViewController setAdditionalSafeAreaInsets:](self->_currentTool, "setAdditionalSafeAreaInsets:", v30, 0.0, v33, 0.0);
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v37 = objc_claimAutoreleasedReturnValue();
  v132 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
  v133 = v38;
  v134 = v39;
  v135 = v40;
  v42 = v41;
  -[PUPhotoEditToolController view](self->_currentEditingTool, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  v130 = v45;
  v131 = v44;
  v128 = v47;
  v129 = v46;

  -[PUPhotoEditViewControllerSpec scrubberViewMargin](self->_photoEditSpec, "scrubberViewMargin");
  v141 = v48;
  v127 = v49;
  v51 = v50;
  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  objc_msgSend(v52, "edgeInsets");
  v62 = v54 + v61;
  v64 = v56 + v63;
  v66 = v58 - (v61 + v65);
  v68 = v60 - (v63 + v67);
  -[PUPhotoEditViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "convertRect:fromView:", v52, v62, v64, v66, v68);
  v125 = v71;
  v126 = v70;

  if (!self->_imageFrameLayoutGuide)
  {
    v72 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    imageFrameLayoutGuide = self->_imageFrameLayoutGuide;
    self->_imageFrameLayoutGuide = v72;

    -[PUPhotoEditViewController view](self, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addLayoutGuide:", self->_imageFrameLayoutGuide);

  }
  v140 = (void *)v37;
  if (self->_imageFrameLayoutGuideConstraints)
  {
    -[PUPhotoEditViewController view](self, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "removeConstraints:", self->_imageFrameLayoutGuideConstraints);

    imageFrameLayoutGuideConstraints = self->_imageFrameLayoutGuideConstraints;
    self->_imageFrameLayoutGuideConstraints = 0;

  }
  -[UILayoutGuide leadingAnchor](self->_imageFrameLayoutGuide, "leadingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "leadingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, v15);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v121;
  -[UILayoutGuide trailingAnchor](self->_imageFrameLayoutGuide, "trailingAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "leadingAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:constant:", v118, v15 + v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v137;
  -[UILayoutGuide topAnchor](self->_imageFrameLayoutGuide, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, v139);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2] = v80;
  -[UILayoutGuide bottomAnchor](self->_imageFrameLayoutGuide, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, v139 + v138);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v143[3] = v84;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 4);
  v85 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v86 = self->_imageFrameLayoutGuideConstraints;
  self->_imageFrameLayoutGuideConstraints = v85;

  -[PUPhotoEditViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "addConstraints:", self->_imageFrameLayoutGuideConstraints);

  if (v132 != 1)
  {
    v147.origin.y = v130;
    v147.origin.x = v131;
    v147.size.height = v128;
    v147.size.width = v129;
    MaxX = CGRectGetMaxX(v147);
    -[PUPhotoEditToolController toolGradientDistance](self->_currentEditingTool, "toolGradientDistance");
    v5 = v5 - (v5 - (MaxX - v89) + v5 - (MaxX - v89));
  }
  v90 = fmin(v5 - (v141 + v51), 477.0);
  v148.origin.x = v133;
  v148.origin.y = v134;
  v148.size.width = v135;
  v148.size.height = v42;
  Width = CGRectGetWidth(v148);
  if (Width - v141 - v51 >= v90 || Width <= 210.0)
    v93 = v90;
  else
    v93 = Width - v141 - v51;
  objc_msgSend(v140, "intrinsicContentSize");
  v95 = v94;
  v96 = v127 + v94;
  if (v132 == 1)
  {
    v149.origin.y = v130;
    v149.origin.x = v131;
    v149.size.height = v128;
    v149.size.width = v129;
    v97 = CGRectGetMaxY(v149);
    -[PUPhotoEditToolController toolGradientDistance](self->_currentEditingTool, "toolGradientDistance");
    v99 = v97 - v98;
    v150.origin.x = v133;
    v150.origin.y = v134;
    v150.size.width = v135;
    v150.size.height = v42;
    v100 = CGRectGetMaxY(v150);
    if (v99 < v100)
      v100 = v99;
  }
  else
  {
    v151.origin.x = v133;
    v151.origin.y = v134;
    v151.size.width = v135;
    v151.size.height = v42;
    v101 = CGRectGetMaxY(v151);
    -[PUPhotoEditViewController view](self, "view");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "safeAreaInsets");
    v104 = v117 - v103;

    if (v101 >= v104)
      v100 = v104;
    else
      v100 = v101;
  }
  v105 = v100 - v96;
  -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "sizeToFit");

  -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "frame");
  v109 = v108;
  v111 = v110;

  v152.origin.x = v126 + (v125 - v93) * 0.5;
  v152.origin.y = v105;
  v152.size.width = v93;
  v152.size.height = v95;
  MinX = CGRectGetMinX(v152);
  v153.origin.x = v126 + (v125 - v93) * 0.5;
  v153.origin.y = v105;
  v153.size.width = v93;
  v153.size.height = v95;
  v113 = CGRectGetMinY(v153) + -7.0;
  -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setFrame:", MinX, v113, v109, v111);

  objc_msgSend(v140, "setFrame:", v126 + (v125 - v93) * 0.5 + v141 + v109, v105, v93 + (v141 + v109) * -2.0, v95);
  mainToolbarShadow = self->_mainToolbarShadow;
  if (mainToolbarShadow)
    -[PUPhotoEditViewController _layoutShadowView:forToolbar:](self, "_layoutShadowView:forToolbar:", mainToolbarShadow, self->_mainToolbar);
  secondaryToolbarShadow = self->_secondaryToolbarShadow;
  if (secondaryToolbarShadow)
    -[PUPhotoEditViewController _layoutShadowView:forToolbar:](self, "_layoutShadowView:forToolbar:", secondaryToolbarShadow, self->_secondaryToolbar);

}

- (void)_layoutShadowView:(id)a3 forToolbar:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  id v30;

  v30 = a3;
  v6 = a4;
  -[PUPhotoEditViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  -[PUPhotoEditViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mainToolbarShadowLength");
  v23 = v22;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "secondaryToolbarShadowLength");
  v26 = v25;

  v27 = objc_msgSend(v6, "backgroundStyle");
  switch(v27)
  {
    case 1:
      v28 = v11 - (v18 + v26);
      v29 = 0.0;
      v11 = v18 + v26;
      goto LABEL_7;
    case 2:
      v11 = v14 + v23;
      goto LABEL_6;
    case 3:
      v29 = v9 - (v20 + v26);
      v28 = 0.0;
      v9 = v20 + v26;
      goto LABEL_7;
    case 4:
      v9 = v16 + v26;
LABEL_6:
      v29 = 0.0;
      v28 = 0.0;
LABEL_7:
      objc_msgSend(v30, "setFrame:", v29, v28, v9, v11);
      break;
    default:
      break;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD);
  void (**v10)(void *, _QWORD);
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[5];
  _QWORD aBlock[5];
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_isAnimatingMediaViewInsets = 1;
  -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 1);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E58A7A08;
  aBlock[4] = self;
  v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v13[3] = &unk_1E58A7A08;
  v13[4] = self;
  v10 = (void (**)(void *, _QWORD))_Block_copy(v13);
  if ((objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v10) & 1) == 0)
  {
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "viewWillTransitionToSize animations were not queued by the transition coordinator, running animations manually. Layout issues may occur.", v12, 2u);
    }

    v9[2](v9, 0);
    v10[2](v10, 0);
  }
  -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", width, height);
  -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", v7, width, height);

}

- (double)px_HDRFocus
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)MEMORY[0x1E0D7B500];
  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HDRValueForAsset:", v3);
  v5 = v4;

  return v5;
}

- (double)px_imageModulationIntensity
{
  return 1.0;
}

- (void)setPreferredAppearance:(int64_t)a3
{
  +[PUPhotoEditAppearancePreference setPreferredAppearance:](PUPhotoEditAppearancePreference, "setPreferredAppearance:", a3);
  -[PUPhotoEditViewController _setNeedsUserInterfaceAppearanceUpdateAnimated](self, "_setNeedsUserInterfaceAppearanceUpdateAnimated");
}

- (void)_setNeedsUserInterfaceAppearanceUpdateAnimated
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)MEMORY[0x1E0DC3F10];
  -[PUPhotoEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PUPhotoEditViewController__setNeedsUserInterfaceAppearanceUpdateAnimated__block_invoke;
  v5[3] = &unk_1E58ABD10;
  v5[4] = self;
  objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", v4, 5242880, v5, 0, 0.2);

}

- (int64_t)preferredUserInterfaceStyle
{
  void *v3;
  int v4;
  int64_t v6;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightModeEditor");

  if (!v4
    || -[PUPhotoEditViewController forceDarkUserInterfaceStyleForZoom](self, "forceDarkUserInterfaceStyleForZoom"))
  {
    return 2;
  }
  v6 = +[PUPhotoEditAppearancePreference preferredAppearance](PUPhotoEditAppearancePreference, "preferredAppearance");
  if (v6 == 2)
    return 1;
  else
    return 2 * (v6 == 1);
}

- (void)_updateForcingDarkUserInterfaceStyleForZoomIfNeeded
{
  _BOOL8 v3;

  v3 = -[PUPhotoEditViewController _mediaViewFillsView](self, "_mediaViewFillsView");
  if (v3 != -[PUPhotoEditViewController forceDarkUserInterfaceStyleForZoom](self, "forceDarkUserInterfaceStyleForZoom"))
  {
    -[PUPhotoEditViewController setForceDarkUserInterfaceStyleForZoom:](self, "setForceDarkUserInterfaceStyleForZoom:", v3);
    -[PUPhotoEditViewController setNeedsUserInterfaceAppearanceUpdate](self, "setNeedsUserInterfaceAppearanceUpdate");
  }
}

- (BOOL)_mediaViewFillsView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v22.origin.x = v14;
  v22.origin.y = v16;
  v22.size.width = v18;
  v22.size.height = v20;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v23 = CGRectIntersection(v22, v24);
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  return CGRectEqualToRect(v23, v25);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", -[PUPhotoEditViewController preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle"));
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController presentViewController:animated:completion:](&v10, sel_presentViewController_animated_completion_, v9, v5, v8);

}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_currentTool;
}

- (id)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v4;
  NSUndoManager *v5;

  undoManager = self->_undoManager;
  if (!undoManager)
  {
    v4 = (NSUndoManager *)objc_opt_new();
    v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (void)_undoManagerDidCloseUndoGroupNotification:(id)a3
{
  -[PUPhotoEditViewController _updateUndoRedoButtonsAnimated:](self, "_updateUndoRedoButtonsAnimated:", 0);
  -[PUPhotoEditViewController _updateShowOriginalButtonAnimated:](self, "_updateShowOriginalButtonAnimated:", 0);
}

- (void)_undoManagerWillUndo:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
    goto LABEL_4;
  v6 = -[PUPhotoEditToolbarButton isHeld](self->_moreButton, "isHeld");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v8, "undoMenuItemTitle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseStringWithLocale:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController flashTransientBadgeWithText:](self, "flashTransientBadgeWithText:", v7);

LABEL_4:
  }

}

- (void)_undoManagerWillRedo:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
    goto LABEL_4;
  v6 = -[PUPhotoEditToolbarButton isHeld](self->_moreButton, "isHeld");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v8, "redoMenuItemTitle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseStringWithLocale:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController flashTransientBadgeWithText:](self, "flashTransientBadgeWithText:", v7);

LABEL_4:
  }

}

- (void)_undoManagerDidUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    if (-[PUPhotoEditToolbarButton isHeld](self->_moreButton, "isHeld"))
      -[PUPhotoEditViewController _reloadMoreButtonMenu](self, "_reloadMoreButtonMenu");
    -[PUPhotoEditViewController _updateUndoRedoButtonsAnimated:](self, "_updateUndoRedoButtonsAnimated:", 0);
  }
}

- (void)_undoManagerDidRedo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    if (-[PUPhotoEditToolbarButton isHeld](self->_moreButton, "isHeld"))
      -[PUPhotoEditViewController _reloadMoreButtonMenu](self, "_reloadMoreButtonMenu");
    -[PUPhotoEditViewController _updateUndoRedoButtonsAnimated:](self, "_updateUndoRedoButtonsAnimated:", 0);
  }
}

- (void)_handleUndoButton:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[PUPhotoEditViewController undoManager](self, "undoManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "undoInitiated:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "undo");

}

- (void)_handleRedoButton:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[PUPhotoEditViewController undoManager](self, "undoManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "redoInitiated:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "redo");

}

- (void)_handleShowOriginalButton:(id)a3
{
  if (!-[PUPhotoEditViewController _isPreviewingOriginal](self, "_isPreviewingOriginal", a3))
    self->_showOriginalButtonTapped = 1;
  -[PUPhotoEditViewController _toggleShowOriginal](self, "_toggleShowOriginal");
}

- (void)_willModifyAdjustment
{
  -[PUPhotoEditToolController willModifyAdjustment](self->_currentEditingTool, "willModifyAdjustment");
}

- (void)_didModifyAdjustmentWithLocalizedName:(id)a3
{
  id v3;

  v3 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self->_currentEditingTool, "didModifyAdjustmentWithLocalizedName:", a3);
}

- (void)_handleSemStylesDebugButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PUPhotoEditSemanticStyleDebugViewController *v8;
  void *v9;
  PUPhotoEditSemanticStyleDebugViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PUPhotoEditSemanticStyleDebugViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController compositionController](self, "compositionController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semanticStyleAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D71420];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __57__PUPhotoEditViewController__handleSemStylesDebugButton___block_invoke;
    v26[3] = &unk_1E58A44E0;
    v26[4] = self;
    objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v7, v26);

  }
  v8 = objc_alloc_init(PUPhotoEditSemanticStyleDebugViewController);
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditSemanticStyleDebugViewController setCompositionController:](v8, "setCompositionController:", v9);

  v10 = v8;
  -[PUPhotoEditSemanticStyleDebugViewController loadViewIfNeeded](v10, "loadViewIfNeeded");
  -[PUPhotoEditViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "horizontalSizeClass");

  if (v13 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("SemStyleDebug"), &__block_literal_global_319);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (PUPhotoEditSemanticStyleDebugViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);

    -[PUPhotoEditSemanticStyleDebugViewController setTitle:](v10, "setTitle:", CFSTR("SemStyle Debug Settings"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__dismissSemanticStyleDebugControls_);
    v28[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditSemanticStyleDebugViewController navigationItem](v10, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItems:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditSemanticStyleDebugViewController view](v10, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[PUPhotoEditSemanticStyleDebugViewController view](v10, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[PUPhotoEditSemanticStyleDebugViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 1);
    v27[0] = v14;
    objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditSemanticStyleDebugViewController sheetPresentationController](v15, "sheetPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDetents:", v23);

  }
  else
  {
    -[PUPhotoEditSemanticStyleDebugViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 7);
    -[PUPhotoEditSemanticStyleDebugViewController popoverPresentationController](v10, "popoverPresentationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSourceView:", self->_semStylesDebugButton);
    -[PUPhotoEditToolbarButton bounds](self->_semStylesDebugButton, "bounds");
    objc_msgSend(v25, "setSourceRect:");
    -[PUPhotoEditSemanticStyleDebugViewController setPreferredContentSize:](v10, "setPreferredContentSize:", 580.0, 340.0);

    v15 = v10;
  }
  -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)_dismissSemanticStyleDebugControls:(id)a3
{
  -[PUPhotoEditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CGRect)previewViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[NUMediaView imageFrame](self->_mediaView, "imageFrame");
  if (self->_isAnimatingLayoutOrientation || (v7 = v3, v8 = v4, v9 = v5, v10 = v6, CGRectIsEmpty(*(CGRect *)&v3)))
  {
    -[PUPhotoEditViewController lastKnownPreviewImageSize](self, "lastKnownPreviewImageSize");
    v12 = v11;
    v14 = v13;
    if (-[PUPhotoEditViewController _shouldUseCropPlaceholderViewFrame](self, "_shouldUseCropPlaceholderViewFrame"))
      -[PUPhotoEditViewController _cropPlaceholderViewFrameForImageSize:](self, "_cropPlaceholderViewFrameForImageSize:", v12, v14);
    else
      -[PUPhotoEditViewController _placeholderViewFrameForImageSize:](self, "_placeholderViewFrameForImageSize:", v12, v14);
    v7 = v15;
    v8 = v16;
    v9 = v17;
    v10 = v18;
  }
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_placeholderViewFrameForImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGAffineTransform v24;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec layoutReferenceSize](self->_photoEditSpec, "layoutReferenceSize");
  v7 = v6;
  -[PUViewControllerSpec layoutReferenceSize](self->_photoEditSpec, "layoutReferenceSize");
  if (width == 0.0 || height == 0.0)
  {
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v9 = v8;
    -[PUPhotoEditViewController _mediaViewEdgeInsets](self, "_mediaViewEdgeInsets");
    NUEdgeInsetsInsetRect();
    v12 = v11 / width;
    if (v11 / width >= v10 / height)
      v12 = v10 / height;
    CGAffineTransformMakeScale(&v24, v12, v12);
    -[NUMediaView _edgeInsetsForContentSize:inFrame:alwaysCenterContent:](self->_mediaView, "_edgeInsetsForContentSize:inFrame:alwaysCenterContent:", 1, height * v24.c + v24.a * width, height * v24.d + v24.b * width, 0.0, 0.0, v7, v9);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = v15 + 0.0;
    v20 = v14 + 0.0;
    v22 = v7 - (v16 + v21);
    v23 = v9 - (v14 + v18);
  }
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_shouldUseCropPlaceholderViewFrame
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PUCropToolController *v7;
  PUCropToolController *currentTool;

  -[PUPhotoEditViewController initialPendingEditsRequest](self, "initialPendingEditsRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditViewController initialPendingEditsRequest](self, "initialPendingEditsRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adjustments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "category");

    -[PUPhotoEditViewController _toolControllerForAdjustmentCategory:](self, "_toolControllerForAdjustmentCategory:", v6);
    v7 = (PUCropToolController *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = v7 == self->_cropController;

  }
  if (!-[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop") && !(_DWORD)v3)
    return 0;
  currentTool = (PUCropToolController *)self->_currentTool;
  return !currentTool || currentTool == self->_cropController;
}

- (CGRect)_cropPlaceholderViewFrameForImageSize:(CGSize)a3
{
  PUCropToolControllerSpec *v4;
  PUCropToolControllerSpec *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Height;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double Width;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double MinX;
  double v51;
  double v52;
  double MinY;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  _QWORD v63[4];
  PUCropToolControllerSpec *v64;
  PUPhotoEditViewController *v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect result;

  if (a3.width == 0.0 || a3.height == 0.0)
  {
    v23 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v4 = objc_alloc_init(PUCropToolControllerSpec);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __67__PUPhotoEditViewController__cropPlaceholderViewFrameForImageSize___block_invoke;
    v63[3] = &unk_1E58ABCA8;
    v5 = v4;
    v64 = v5;
    v65 = self;
    -[PUViewControllerSpec performChanges:](v5, "performChanges:", v63);
    -[PUCropToolControllerSpec minimumCropInset](v5, "minimumCropInset");
    v7 = v6;
    -[PUPhotoEditViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[PUPhotoEditButtonCenteredToolbar frame](self->_secondaryToolbar, "frame");
    Height = CGRectGetHeight(v66);
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "currentLayoutStyle");

    if (v17 == 4)
    {
      -[PUCropToolControllerSpec standardSideBarWidth](v5, "standardSideBarWidth");
      v19 = v18;
      -[PUCropToolControllerSpec cropAspectRatioScrollHeight](v5, "cropAspectRatioScrollHeight");
      v61 = v12 + v20;
      -[PUCropToolControllerSpec standardSideBarWidth](v5, "standardSideBarWidth");
      v22 = v21;
    }
    else if (-[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") == 1)
    {
      v19 = v7 + v10;
      -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
      v27 = CGRectGetHeight(v67);
      -[PUCropToolControllerSpec standardBottomBarHeight](v5, "standardBottomBarHeight");
      v61 = v27 + v28;
      v22 = v7 + v14;
    }
    else
    {
      -[PUCropToolControllerSpec cropAspectFlipperWidth](v5, "cropAspectFlipperWidth");
      v19 = v10 + v29;
      -[PUCropToolControllerSpec cropAspectRatioScrollHeight](v5, "cropAspectRatioScrollHeight");
      v61 = v12 + v30;
      -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
      Width = CGRectGetWidth(v68);
      -[PUCropToolControllerSpec standardSideBarWidth](v5, "standardSideBarWidth");
      v22 = Width + v32;
    }
    v33 = v7 + Height;
    -[PUPhotoEditViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    v69.origin.x = v36;
    v69.origin.y = v38;
    v69.size.width = v40;
    v69.size.height = v42;
    v43 = CGRectGetWidth(v69) - v19 - v22;
    v70.origin.x = v36;
    v70.origin.y = v38;
    v70.size.width = v40;
    v70.size.height = v42;
    v44 = CGRectGetHeight(v70) - v33 - v61;
    v71.origin.x = v19;
    v71.origin.y = v33;
    v71.size.width = v43;
    v71.size.height = v44;
    v45 = CGRectGetWidth(v71);
    v72.origin.x = v19;
    v72.origin.y = v33;
    v72.size.width = v43;
    v72.size.height = v44;
    v46 = v45 / CGRectGetHeight(v72);
    v47 = a3.width / a3.height;
    if (v46 <= a3.width / a3.height)
    {
      v78.origin.x = v19;
      v78.origin.y = v33;
      v78.size.width = v43;
      v78.size.height = v44;
      v52 = CGRectGetWidth(v78) / v47;
      v79.origin.x = v19;
      v79.origin.y = v33;
      v79.size.width = v43;
      v79.size.height = v44;
      MinX = CGRectGetMinX(v79);
      v80.origin.x = v19;
      v80.origin.y = v33;
      v80.size.width = v43;
      v80.size.height = v44;
      MinY = CGRectGetMinY(v80);
      v81.origin.x = v19;
      v81.origin.y = v33;
      v81.size.width = v43;
      v81.size.height = v44;
      v51 = MinY + (CGRectGetHeight(v81) - v52) * 0.5;
      v82.origin.x = v19;
      v82.origin.y = v33;
      v82.size.width = v43;
      v82.size.height = v44;
      v48 = CGRectGetWidth(v82);
    }
    else
    {
      v73.origin.x = v19;
      v73.origin.y = v33;
      v73.size.width = v43;
      v73.size.height = v44;
      v48 = v47 * CGRectGetHeight(v73);
      v74.origin.x = v19;
      v74.origin.y = v33;
      v74.size.width = v43;
      v74.size.height = v44;
      v49 = CGRectGetMinX(v74);
      v75.origin.x = v19;
      v75.origin.y = v33;
      v75.size.width = v43;
      v75.size.height = v44;
      MinX = v49 + (CGRectGetWidth(v75) - v48) * 0.5;
      v76.origin.x = v19;
      v76.origin.y = v33;
      v76.size.width = v43;
      v76.size.height = v44;
      v51 = CGRectGetMinY(v76);
      v77.origin.x = v19;
      v77.origin.y = v33;
      v77.size.width = v43;
      v77.size.height = v44;
      v52 = CGRectGetHeight(v77);
    }
    v23 = PURoundRectToPixel(MinX, v51, v48, v52);
    v24 = v54;
    v25 = v55;
    v26 = v56;

  }
  v57 = v23;
  v58 = v24;
  v59 = v25;
  v60 = v26;
  result.size.height = v60;
  result.size.width = v59;
  result.origin.y = v58;
  result.origin.x = v57;
  return result;
}

- (CGRect)_oneUpTransitionPlaceholderViewFrame
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[PUPhotoEditViewController _isReadyToRender](self, "_isReadyToRender"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D52100]);
    -[PUPhotoEditViewController _composition](self, "_composition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithComposition:", v4);

    v26 = 0;
    objc_msgSend(v5, "submitSynchronous:", &v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    objc_msgSend(v6, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "size");
      NUPixelSizeToCGSize();
      -[PUPhotoEditViewController _placeholderViewFrameForImageSize:](self, "_placeholderViewFrameForImageSize:");
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2319);
      v21 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_error_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "Could not load geometry for composition: %@", buf, 0xCu);
      }
      -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
    }
    v14 = v9;
    v16 = v10;
    v18 = v11;
    v20 = v12;

  }
  else
  {
    -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  v22 = v14;
  v23 = v16;
  v24 = v18;
  v25 = v20;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)_clearBadgeConstraints
{
  NSArray *transientStatusBadgeConstraints;
  void *v4;
  NSArray *assetTypeBadgeConstraints;
  id v6;

  if (self->_transientStatusBadgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    transientStatusBadgeConstraints = self->_transientStatusBadgeConstraints;
    self->_transientStatusBadgeConstraints = 0;

    -[PUPhotoEditViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
  if (self->_assetTypeBadgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    assetTypeBadgeConstraints = self->_assetTypeBadgeConstraints;
    self->_assetTypeBadgeConstraints = 0;

    -[PUPhotoEditViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsUpdateConstraints");

  }
}

- (void)setLastKnownPreviewImageSize:(CGSize)a3
{
  self->_lastKnownPreviewImageSize = a3;
  -[PUPhotoEditViewController _clearBadgeConstraints](self, "_clearBadgeConstraints");
}

- (BOOL)_isReadyToRender
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;

  -[PUPhotoEditViewController mainRenderer](self, "mainRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;

  return v6;
}

- (id)_currentViewContentsForDismissTransition
{
  void *v3;
  void *v4;
  void *v5;
  UIImageView *placeholderImageView;
  void *v7;
  void *v8;
  NUMediaView *mediaView;
  void *v10;
  void *v12;

  -[NUMediaView _imageLayer](self->_mediaView, "_imageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUPhotoEditViewController editSource](self, "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_9:
        -[NUMediaView setPipelineFilters:](self->_mediaView, "setPipelineFilters:", MEMORY[0x1E0C9AA60]);
        -[NUMediaView waitForRender](self->_mediaView, "waitForRender");
        objc_msgSend(v3, "contents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    mediaView = self->_mediaView;
    -[PUPhotoEditViewController _composition](self, "_composition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaView setComposition:](mediaView, "setComposition:", v10);

    goto LABEL_9;
  }
  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView && (-[UIImageView isHidden](placeholderImageView, "isHidden") & 1) == 0)
  {
    -[UIImageView layer](self->_placeholderImageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
LABEL_10:

  return v7;
}

- (void)setPlaceholderImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUPhotoEditViewController placeholderImage](self, "placeholderImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    if (v7)
    {
      objc_msgSend(v7, "size");
      -[PUPhotoEditViewController setLastKnownPreviewImageSize:](self, "setLastKnownPreviewImageSize:");
    }
    -[PUPhotoEditViewController _updatePlaceholderImage](self, "_updatePlaceholderImage");
    v6 = v7;
  }

}

- (void)_clearToolbars
{
  PUPhotoEditToolbar *mainToolbar;
  PUPhotoEditShadowView *mainToolbarShadow;
  PUPhotoEditButtonCenteredToolbar *secondaryToolbar;
  PUPhotoEditShadowView *secondaryToolbarShadow;
  NSArray *mainToolbarConstraints;
  NSArray *secondaryToolbarConstraints;
  NSArray *actionButtonConstraints;

  -[PUPhotoEditToolbar setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:](self->_mainToolbar, "setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:", 0, 1, 0, 0);
  -[PUPhotoEditButtonCenteredToolbar setCenterView:leadingViews:trailingViews:](self->_secondaryToolbar, "setCenterView:leadingViews:trailingViews:", 0, 0, 0);
  mainToolbar = self->_mainToolbar;
  self->_mainToolbar = 0;

  mainToolbarShadow = self->_mainToolbarShadow;
  self->_mainToolbarShadow = 0;

  secondaryToolbar = self->_secondaryToolbar;
  self->_secondaryToolbar = 0;

  secondaryToolbarShadow = self->_secondaryToolbarShadow;
  self->_secondaryToolbarShadow = 0;

  mainToolbarConstraints = self->_mainToolbarConstraints;
  self->_mainToolbarConstraints = 0;

  secondaryToolbarConstraints = self->_secondaryToolbarConstraints;
  self->_secondaryToolbarConstraints = 0;

  actionButtonConstraints = self->_actionButtonConstraints;
  self->_actionButtonConstraints = 0;

}

- (void)setLayoutOrientation:(int64_t)a3
{
  -[PUPhotoEditViewController setLayoutOrientation:withTransitionCoordinator:](self, "setLayoutOrientation:withTransitionCoordinator:", a3, 0);
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  int64_t layoutOrientation;
  NSArray *coreToolButtons;
  NSArray *coreToolButtonViews;
  NSDictionary *toolTagLabelMap;
  NSArray *secondaryLeadingViews;
  UIButton *mainActionButton;
  UIButton *cancelButton;
  NSArray *secondaryTrailingViews;
  UIView *secondaryCenterView;
  PUPhotoEditToolbarButton *undoButton;
  PUPhotoEditToolbarButton *redoButton;
  PUPhotoEditToolbarButton *semStylesDebugButton;
  PUPhotoEditToolbarButton *redEyeButton;
  PUPhotoEditToolbarButton *moreButton;
  PUPhotoEditToolbarButton *markupButton;
  PUPhotoEditToolbarButton *showOriginalButton;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  NSArray *progressEventBlockingViewConstraints;
  void *v29;
  PUPhotoEditToolbar *v30;
  PUPhotoEditShadowView *v31;
  PUPhotoEditButtonCenteredToolbar *v32;
  PUPhotoEditShadowView *v33;
  NSArray *currentToolViewConstraints;
  void *v35;
  PUPhotoEditToolbar *mainToolbar;
  void *v37;
  PUPhotoEditButtonCenteredToolbar *secondaryToolbar;
  void *v39;
  NSArray *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  PUPhotoEditShadowView *v50;
  PUPhotoEditShadowView *v51;
  PUPhotoEditToolbar *v52;
  PUPhotoEditButtonCenteredToolbar *v53;
  _QWORD v54[5];
  PUPhotoEditToolbar *v55;
  PUPhotoEditShadowView *v56;
  PUPhotoEditButtonCenteredToolbar *v57;
  PUPhotoEditShadowView *v58;
  _QWORD v59[5];
  id v60;
  PUPhotoEditToolbar *v61;
  PUPhotoEditShadowView *v62;
  id v63;
  PUPhotoEditButtonCenteredToolbar *v64;
  PUPhotoEditShadowView *v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  layoutOrientation = self->_layoutOrientation;
  if (layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    v52 = self->_mainToolbar;
    v50 = self->_mainToolbarShadow;
    v53 = self->_secondaryToolbar;
    v51 = self->_secondaryToolbarShadow;
    -[PUPhotoEditViewController _clearToolbars](self, "_clearToolbars");
    coreToolButtons = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    coreToolButtonViews = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    toolTagLabelMap = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    secondaryLeadingViews = self->_secondaryLeadingViews;
    self->_secondaryLeadingViews = 0;

    mainActionButton = self->_mainActionButton;
    self->_mainActionButton = 0;

    cancelButton = self->_cancelButton;
    self->_cancelButton = 0;

    secondaryTrailingViews = self->_secondaryTrailingViews;
    self->_secondaryTrailingViews = 0;

    secondaryCenterView = self->_secondaryCenterView;
    self->_secondaryCenterView = 0;

    undoButton = self->_undoButton;
    self->_undoButton = 0;

    redoButton = self->_redoButton;
    self->_redoButton = 0;

    semStylesDebugButton = self->_semStylesDebugButton;
    self->_semStylesDebugButton = 0;

    redEyeButton = self->_redEyeButton;
    self->_redEyeButton = 0;

    moreButton = self->_moreButton;
    self->_moreButton = 0;

    markupButton = self->_markupButton;
    self->_markupButton = 0;

    showOriginalButton = self->_showOriginalButton;
    self->_showOriginalButton = 0;

    self->_toolbarButtonsValid = 0;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[PUPhotoEditViewController _allTools](self, "_allTools");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v69 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "setLayoutOrientation:withTransitionCoordinator:", self->_layoutOrientation, v6);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      }
      while (v25);
    }

    -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
    if (self->_progressEventBlockingViewConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      progressEventBlockingViewConstraints = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = 0;

      -[PUPhotoEditViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setNeedsUpdateConstraints");

    }
    -[PUPhotoEditToolPickerController setLayoutDirection:](self->_toolPickerController, "setLayoutDirection:", -[PUPhotoEditViewController currentToolPickerLayoutDirection](self, "currentToolPickerLayoutDirection"));
    -[PUPhotoEditViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    v30 = v52;
    if (!v6)
    {
      -[PUPhotoEditToolbar removeFromSuperview](v52, "removeFromSuperview");
      v31 = v50;
      -[PUPhotoEditShadowView removeFromSuperview](v50, "removeFromSuperview");
      v32 = v53;
      -[PUPhotoEditButtonCenteredToolbar removeFromSuperview](v53, "removeFromSuperview");
      v33 = v51;
      -[PUPhotoEditShadowView removeFromSuperview](v51, "removeFromSuperview");
      if (self->_currentToolViewConstraints)
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
        currentToolViewConstraints = self->_currentToolViewConstraints;
        self->_currentToolViewConstraints = 0;

        -[PUPhotoEditViewController view](self, "view");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setNeedsUpdateConstraints");

      }
      -[PUPhotoEditViewController _clearBadgeConstraints](self, "_clearBadgeConstraints");
      goto LABEL_31;
    }
    if (v52)
    {
      +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:layoutOrientation:](PUPhotoEditLayoutSupport, "layoutConstraintsForHidingView:layoutOrientation:", v52, layoutOrientation);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
LABEL_14:
        +[PUPhotoEditLayoutSupport layoutConstraintsForHidingSecondaryView:layoutOrientation:](PUPhotoEditLayoutSupport, "layoutConstraintsForHidingSecondaryView:layoutOrientation:", v53, layoutOrientation);
        v46 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else
    {
      v49 = 0;
      if (v53)
        goto LABEL_14;
    }
    v46 = 0;
LABEL_20:
    mainToolbar = self->_mainToolbar;
    if (mainToolbar)
    {
      +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:layoutOrientation:](PUPhotoEditLayoutSupport, "layoutConstraintsForHidingView:layoutOrientation:", mainToolbar, self->_layoutOrientation);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    secondaryToolbar = self->_secondaryToolbar;
    if (secondaryToolbar)
    {
      +[PUPhotoEditLayoutSupport layoutConstraintsForHidingSecondaryView:layoutOrientation:](PUPhotoEditLayoutSupport, "layoutConstraintsForHidingSecondaryView:layoutOrientation:", secondaryToolbar, self->_layoutOrientation);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
LABEL_26:
        if (v39)
        {
          objc_msgSend(v39, "setActive:", 1);
          -[PUPhotoEditButtonCenteredToolbar setAlpha:](self->_secondaryToolbar, "setAlpha:", 0.0);
          -[PUPhotoEditShadowView setAlpha:](self->_secondaryToolbarShadow, "setAlpha:", 0.0);
        }
        v48 = v39;
        if (self->_currentToolViewConstraints)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
          v40 = self->_currentToolViewConstraints;
          self->_currentToolViewConstraints = 0;

          -[PUPhotoEditViewController view](self, "view");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setNeedsUpdateConstraints");

        }
        -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 0, v46);
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
        v59[3] = &unk_1E58A4548;
        v59[4] = self;
        v60 = v49;
        v61 = v52;
        v31 = v50;
        v62 = v50;
        v63 = v47;
        v64 = v53;
        v65 = v51;
        v66 = v37;
        v67 = v48;
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
        v54[3] = &unk_1E58A4570;
        v54[4] = self;
        v55 = v61;
        v30 = v52;
        v56 = v62;
        v57 = v64;
        v58 = v65;
        v42 = v48;
        v43 = v37;
        v44 = v47;
        v45 = v49;
        objc_msgSend(v6, "animateAlongsideTransition:completion:", v59, v54);

        v33 = v51;
        v32 = v53;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      v39 = 0;
      if (!v37)
        goto LABEL_26;
    }
    objc_msgSend(v37, "setActive:", 1, v46);
    -[PUPhotoEditToolbar setAlpha:](self->_mainToolbar, "setAlpha:", 0.0);
    -[PUPhotoEditShadowView setAlpha:](self->_mainToolbarShadow, "setAlpha:", 0.0);
    goto LABEL_26;
  }
LABEL_32:

}

- (void)configureEnablenessOfControlButton:(id)a3 animated:(BOOL)a4 canVisuallyDisable:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  unint64_t v10;
  unsigned int v11;
  UIView *progressEventBlockingView;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  char v24;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "resourcesAvailability");

  v11 = (v10 < 4) & (0xBu >> (v10 & 0xF));
  progressEventBlockingView = self->_progressEventBlockingView;
  if (progressEventBlockingView)
    v11 = 0;
  v13 = v11 | !v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v8;
  else
    v14 = 0;
  v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v8;
  else
    v16 = 0;
  v17 = v16;
  v18 = 0;
  if (v10 == 3 && !progressEventBlockingView)
  {
    -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "hasImageValues");

  }
  if (v15)
  {
    objc_msgSend(v15, "setUserInteractionEnabled:", v18);
    if ((_DWORD)v13 != objc_msgSend(v15, "isEnabled"))
    {
      if (v6)
        v20 = 0.25;
      else
        v20 = 0.0;
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __92__PUPhotoEditViewController_configureEnablenessOfControlButton_animated_canVisuallyDisable___block_invoke;
      v22[3] = &unk_1E58AAD68;
      v23 = v15;
      v24 = v13;
      objc_msgSend(v21, "transitionWithView:duration:options:animations:completion:", v23, 5242880, v22, 0, v20);

    }
  }
  else if (v17)
  {
    objc_msgSend(v17, "setEnabled:", v13);
  }

}

- (id)mainLivePhotoView
{
  return (id)-[NUMediaView _livePhotoView](self->_mediaView, "_livePhotoView");
}

- (BOOL)currentAssetNeedsGainMap
{
  unint64_t v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0D52108], "renderMeteorPlusAsHDR") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = ((unint64_t)objc_msgSend(v4, "mediaSubtypes") >> 9) & 1;

  }
  return v3;
}

- (BOOL)isOriginalStyleable
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "fetchSmartStyleExtendedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "originallySmartStyleable");
  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    objc_msgSend(v9, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    if (v6)
      v12 = CFSTR("YES");
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "PUPhotoEditViewController - Asset %{public}@: originallySmartStyleable %@", (uint8_t *)&v14, 0x16u);

  }
  return v6;
}

- (void)_updateRenderedPreviewForceRender:(BOOL)a3
{
  PUPhotoEditToolController *currentEditingTool;
  uint64_t v5;

  currentEditingTool = self->_currentEditingTool;
  if (currentEditingTool
    && (!-[PUPhotoEditToolController wantsDefaultPreviewView](currentEditingTool, "wantsDefaultPreviewView", a3)
     || -[PUPhotoEditToolController shouldHideMediaView](self->_currentEditingTool, "shouldHideMediaView")))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[UIImageView isHidden](self->_placeholderImageView, "isHidden", a3);
  }
  -[NUMediaView setHidden:](self->_mediaView, "setHidden:", v5);
}

- (void)_updateToolbarsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  PUPhotoEditToolbar *v8;
  PUPhotoEditToolbar *mainToolbar;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PUPhotoEditShadowView *mainToolbarShadow;
  PUPhotoEditShadowView *v15;
  PUPhotoEditShadowView *v16;
  PUPhotoEditShadowView *v17;
  PUPhotoEditButtonCenteredToolbar *v18;
  PUPhotoEditButtonCenteredToolbar *secondaryToolbar;
  void *v20;
  void *v21;
  int v22;
  PUPhotoEditShadowView *v23;
  PUPhotoEditShadowView *v24;
  PUPhotoEditShadowView *secondaryToolbarShadow;
  void *v26;
  uint64_t v27;
  NSArray *currentToolViewConstraints;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  PUPhotoEditMediaToolController *v34;
  PUPhotoEditMediaToolController *mediaToolController;
  PUPhotoEditMediaToolController *v36;
  void *v37;
  NSArray *coreToolButtons;
  NSArray *coreToolButtonViews;
  NSDictionary *toolTagLabelMap;
  int v41;
  PUPhotoEditMediaToolController *v42;
  NSArray *v43;
  NSArray *v44;
  NSDictionary *v45;
  PUPhotoEditMediaToolController *v46;
  PUPhotoEditPortraitToolController *portraitToolController;
  PUPhotoEditPortraitToolController *v48;
  PUPhotoEditPortraitToolController *v49;
  id v50;
  NSArray *v51;
  NSArray *v52;
  NSDictionary *v53;
  NSArray *v54;
  NSArray *v55;
  NSDictionary *v56;
  PUPhotoEditPortraitToolController *v57;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *photoStylesToolController;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v59;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v60;
  id v61;
  NSArray *v62;
  NSArray *v63;
  NSDictionary *v64;
  NSArray *v65;
  NSArray *v66;
  NSDictionary *v67;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v68;
  NSArray *v69;
  NSArray *v70;
  NSDictionary *v71;
  _TtC15PhotosUIPrivate21PUAudioToolController *v72;
  _TtC15PhotosUIPrivate21PUAudioToolController *v73;
  _TtC15PhotosUIPrivate21PUAudioToolController *audioToolController;
  id v75;
  NSArray *v76;
  NSArray *v77;
  NSDictionary *v78;
  void *v79;
  NSArray *v80;
  NSArray *allTools;
  void *v82;
  NSArray *v83;
  NSArray *v84;
  void *v85;
  NSArray *v86;
  NSArray *v87;
  NSArray **p_allTools;
  void *v89;
  int v90;
  uint64_t v91;
  NSArray *v92;
  PUPhotoEditToolbarButton *moreButton;
  PUPhotoEditToolbarButton *markupButton;
  PUPhotoEditToolbarButton *showOriginalButton;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i;
  void *v101;
  void *v102;
  void *v103;
  _BOOL8 v104;
  void *v105;
  PUPhotoEditToolPickerController *toolPickerController;
  void *v107;
  id v108;
  NSArray *v109;
  NSArray *v110;
  UIButton *v111;
  UIButton *v112;
  void *v113;
  double v114;
  double v115;
  id v116;
  UIButton *v117;
  void *v118;
  uint64_t v119;
  char v120;
  void *v121;
  void *v122;
  NSArray *v123;
  NSArray *notchButtons;
  PUCropToolController *currentEditingTool;
  uint64_t v126;
  uint64_t v127;
  double v128;
  UIButton *v129;
  PUPhotoEditToolbar *v130;
  int64_t v131;
  void *v132;
  NSArray *v133;
  void *v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t j;
  int64_t currentlyHighlightedToolButtonTag;
  NSArray *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t k;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  _BOOL4 v152;
  char v153;
  void *v154;
  UIButton *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _QWORD v168[5];
  _BYTE v169[128];
  _BYTE v170[128];
  _QWORD v171[2];
  UIButton *cancelButton;
  void *v173;
  _BYTE v174[128];
  PUPhotoEditPortraitToolController *v175;
  PUPhotoEditMediaToolController *v176;
  _QWORD v177[3];

  v3 = a3;
  v177[1] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if (!v6 || self->_updatingToolbars)
    return;
  -[PUPhotoEditViewController _loadToolsIfNeeded](self, "_loadToolsIfNeeded");
  self->_updatingToolbars = 1;
  -[PUPhotoEditViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_mainToolbar)
  {
    v8 = objc_alloc_init(PUPhotoEditToolbar);
    mainToolbar = self->_mainToolbar;
    self->_mainToolbar = v8;

    -[PUPhotoEditToolbar setDelegate:](self->_mainToolbar, "setDelegate:", self);
    -[PUPhotoEditToolbar setupWithLayoutOrientation:](self->_mainToolbar, "setupWithLayoutOrientation:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"));
    objc_msgSend(v7, "addSubview:", self->_mainToolbar);
    -[PUPhotoEditViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    objc_msgSend(v7, "setNeedsUpdateConstraints");
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toolbarLongSideMargin");
    -[PUPhotoEditToolbar setLongSideMargin:](self->_mainToolbar, "setLongSideMargin:");

    if (-[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") == 1)
    {
      -[PUPhotoEditViewController traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (!v12)
        -[PUPhotoEditToolbar setUseiPhonePrimaryPortraitHeight:](self->_mainToolbar, "setUseiPhonePrimaryPortraitHeight:", 1);
    }
  }
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "toolbarShadowsEnabled"))
  {
    mainToolbarShadow = self->_mainToolbarShadow;

    if (!mainToolbarShadow)
    {
      v15 = [PUPhotoEditShadowView alloc];
      v16 = -[PUPhotoEditShadowView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v17 = self->_mainToolbarShadow;
      self->_mainToolbarShadow = v16;

      -[PUPhotoEditShadowView setAlpha:](self->_mainToolbarShadow, "setAlpha:", 0.0);
      objc_msgSend(v7, "addSubview:", self->_mainToolbarShadow);
    }
  }
  else
  {

  }
  if (self->_secondaryToolbar)
  {
    -[PUPhotoEditViewController _updateToolbarShadowAlpha](self, "_updateToolbarShadowAlpha");
  }
  else
  {
    v18 = objc_alloc_init(PUPhotoEditButtonCenteredToolbar);
    secondaryToolbar = self->_secondaryToolbar;
    self->_secondaryToolbar = v18;

    -[PUPhotoEditToolbar setDelegate:](self->_secondaryToolbar, "setDelegate:", self);
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar setPhotoEditSpec:](self->_secondaryToolbar, "setPhotoEditSpec:", v20);

    -[PUPhotoEditToolbar setupWithLayoutOrientation:](self->_secondaryToolbar, "setupWithLayoutOrientation:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"));
    objc_msgSend(v7, "addSubview:", self->_secondaryToolbar);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "toolbarShadowsEnabled");

    if (v22)
    {
      v23 = [PUPhotoEditShadowView alloc];
      v24 = -[PUPhotoEditShadowView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      secondaryToolbarShadow = self->_secondaryToolbarShadow;
      self->_secondaryToolbarShadow = v24;

      -[PUPhotoEditShadowView setAlpha:](self->_secondaryToolbarShadow, "setAlpha:", 0.0);
      objc_msgSend(v7, "addSubview:", self->_secondaryToolbarShadow);
    }
    -[PUPhotoEditViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    objc_msgSend(v7, "setNeedsUpdateConstraints");
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "currentLayoutStyle");

    if (v27 == 4)
      -[PUPhotoEditToolbar setUseLargeShortSideHeight:](self->_secondaryToolbar, "setUseLargeShortSideHeight:", 1);
    -[PUPhotoEditViewController _updateToolbarShadowAlpha](self, "_updateToolbarShadowAlpha");
    -[PUPhotoEditButtonCenteredToolbar setAlpha:](self->_secondaryToolbar, "setAlpha:", 0.0);
    -[PUPhotoEditShadowView setAlpha:](self->_secondaryToolbarShadow, "setAlpha:", 0.0);
    if (v3)
    {
      v168[0] = MEMORY[0x1E0C809B0];
      v168[1] = 3221225472;
      v168[2] = __53__PUPhotoEditViewController__updateToolbarsAnimated___block_invoke;
      v168[3] = &unk_1E58ABD10;
      v168[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v168, 0.2);
    }
    else
    {
      -[PUPhotoEditButtonCenteredToolbar setAlpha:](self->_secondaryToolbar, "setAlpha:", 1.0);
      -[PUPhotoEditViewController _updateToolbarShadowAlpha](self, "_updateToolbarShadowAlpha");
    }
    -[PUPhotoEditViewController _clearBadgeConstraints](self, "_clearBadgeConstraints");
    if (self->_currentToolViewConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      currentToolViewConstraints = self->_currentToolViewConstraints;
      self->_currentToolViewConstraints = 0;

      -[PUPhotoEditViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setNeedsUpdateConstraints");

    }
  }
  -[PUPhotoEditViewController editSource](self, "editSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "mediaType") != 3)
  {

LABEL_26:
    if (!-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
      goto LABEL_30;
    goto LABEL_27;
  }
  -[PUPhotoEditViewController photo](self, "photo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isLivePhotoVisibilityAdjustmentAllowed");

  if ((v32 & 1) == 0)
    goto LABEL_26;
LABEL_27:
  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (!self->_mediaToolController)
    {
      v34 = objc_alloc_init(PUPhotoEditMediaToolController);
      mediaToolController = self->_mediaToolController;
      self->_mediaToolController = v34;

      -[PUPhotoEditMediaToolController setBackdropViewGroupName:](self->_mediaToolController, "setBackdropViewGroupName:", CFSTR("PUPhotoEditToolbarGroupName"));
      -[PUPhotoEditViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
      objc_msgSend(v7, "setNeedsUpdateConstraints");
      v36 = self->_mediaToolController;
      -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolController setAggregateSession:](v36, "setAggregateSession:", v37);

      -[PUPhotoEditToolController setDelegate:](self->_mediaToolController, "setDelegate:", self);
      -[PUPhotoEditMediaToolController setLayoutOrientation:withTransitionCoordinator:](self->_mediaToolController, "setLayoutOrientation:withTransitionCoordinator:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"), 0);
      coreToolButtons = self->_coreToolButtons;
      self->_coreToolButtons = 0;

      coreToolButtonViews = self->_coreToolButtonViews;
      self->_coreToolButtonViews = 0;

      toolTagLabelMap = self->_toolTagLabelMap;
      self->_toolTagLabelMap = 0;

      v152 = 0;
      self->_toolbarButtonsValid = 0;
      v41 = 1;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_30:
  v42 = self->_mediaToolController;
  if (v42)
  {
    v152 = self->_currentEditingTool == (PUPhotoEditToolController *)v42;
    -[PUPhotoEditMediaToolController removeFromParentViewController](v42, "removeFromParentViewController");
    v43 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    v44 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    v45 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    v46 = self->_mediaToolController;
    self->_mediaToolController = 0;

    v41 = 0;
    goto LABEL_33;
  }
LABEL_32:
  v41 = 0;
  v152 = 0;
LABEL_33:
  portraitToolController = self->_portraitToolController;
  if (self->_shouldShowPortraitTool)
  {
    if (!portraitToolController)
    {
      v48 = objc_alloc_init(PUPhotoEditPortraitToolController);
      v49 = self->_portraitToolController;
      self->_portraitToolController = v48;

      -[PUPhotoEditToolController setDelegate:](self->_portraitToolController, "setDelegate:", self);
      -[PUPhotoEditPortraitToolController setBackdropViewGroupName:](self->_portraitToolController, "setBackdropViewGroupName:", CFSTR("PUPhotoEditToolbarGroupName"));
      v50 = (id)-[PUPhotoEditPortraitToolController view](self->_portraitToolController, "view");
      -[PUPhotoEditPortraitToolController setLayoutOrientation:withTransitionCoordinator:](self->_portraitToolController, "setLayoutOrientation:withTransitionCoordinator:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"), 0);
      v51 = self->_coreToolButtons;
      self->_coreToolButtons = 0;

      v52 = self->_coreToolButtonViews;
      self->_coreToolButtonViews = 0;

      v53 = self->_toolTagLabelMap;
      self->_toolTagLabelMap = 0;

      self->_toolbarButtonsValid = 0;
      v41 = 1;
    }
  }
  else if (portraitToolController)
  {
    v54 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    v55 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    v56 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    v57 = self->_portraitToolController;
    self->_portraitToolController = 0;

  }
  photoStylesToolController = self->_photoStylesToolController;
  v149 = v7;
  if (self->_shouldShowStylesTool)
  {
    if (!photoStylesToolController)
    {
      v59 = objc_alloc_init(_TtC15PhotosUIPrivate26PUPhotoStyleToolController);
      v60 = self->_photoStylesToolController;
      self->_photoStylesToolController = v59;

      -[PUPhotoEditToolController setDelegate:](self->_photoStylesToolController, "setDelegate:", self);
      v61 = (id)-[PUPhotoStyleToolController view](self->_photoStylesToolController, "view");
      -[PUPhotoStyleToolController setLayoutOrientation:withTransitionCoordinator:](self->_photoStylesToolController, "setLayoutOrientation:withTransitionCoordinator:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"), 0);
      v62 = self->_coreToolButtons;
      self->_coreToolButtons = 0;

      v63 = self->_coreToolButtonViews;
      self->_coreToolButtonViews = 0;

      v64 = self->_toolTagLabelMap;
      self->_toolTagLabelMap = 0;

      self->_toolbarButtonsValid = 0;
      v41 = 1;
    }
  }
  else if (photoStylesToolController)
  {
    v65 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    v66 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    v67 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    v68 = self->_photoStylesToolController;
    self->_photoStylesToolController = 0;

  }
  v151 = v41;
  if (-[PUPhotoEditViewController isCinematicAudio](self, "isCinematicAudio") && !self->_audioToolController)
  {
    v73 = objc_alloc_init(_TtC15PhotosUIPrivate21PUAudioToolController);
    audioToolController = self->_audioToolController;
    self->_audioToolController = v73;

    -[PUPhotoEditToolController setDelegate:](self->_audioToolController, "setDelegate:", self);
    v75 = (id)-[PUAudioToolController view](self->_audioToolController, "view");
    -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](self->_audioToolController, "setLayoutOrientation:withTransitionCoordinator:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"), 0);
    v76 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    v77 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    v78 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    self->_toolbarButtonsValid = 0;
    v151 = 1;
  }
  else if (!-[PUPhotoEditViewController isCinematicAudio](self, "isCinematicAudio") && self->_audioToolController)
  {
    v69 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    v70 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    v71 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    v72 = self->_audioToolController;
    self->_audioToolController = 0;

  }
  if (self->_audioToolController && !-[NSArray containsObject:](self->__allTools, "containsObject:"))
  {
    v177[0] = self->_audioToolController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "arrayByAddingObjectsFromArray:", self->__allTools);
    v80 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allTools = self->__allTools;
    self->__allTools = v80;

  }
  if (self->_mediaToolController && !-[NSArray containsObject:](self->__allTools, "containsObject:"))
  {
    v176 = self->_mediaToolController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v176, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "arrayByAddingObjectsFromArray:", self->__allTools);
    v83 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v84 = self->__allTools;
    self->__allTools = v83;

  }
  if (self->_portraitToolController && !-[NSArray containsObject:](self->__allTools, "containsObject:"))
  {
    v175 = self->_portraitToolController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "arrayByAddingObjectsFromArray:", self->__allTools);
    v86 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v87 = self->__allTools;
    self->__allTools = v86;

  }
  if (self->_photoStylesToolController)
  {
    p_allTools = &self->__allTools;
    if (!-[NSArray containsObject:](self->__allTools, "containsObject:"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *p_allTools);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "removeObject:", self->_filtersController);
      objc_msgSend(v89, "insertObject:atIndex:", self->_photoStylesToolController, 0);
      -[PUPhotoEditToolController setEnabled:](self->_photoStylesToolController, "setEnabled:", self->_shouldEnableStylesTool);
      v90 = v152;
      if (!self->_shouldEnableStylesTool)
        v90 = 1;
      v152 = v90;
      goto LABEL_67;
    }
    if (self->_photoStylesToolController)
      goto LABEL_68;
  }
  p_allTools = &self->__allTools;
  if (-[NSArray containsObject:](self->__allTools, "containsObject:", self->_filtersController)
    && -[PUPhotoEditViewController isOriginalStyleable](self, "isOriginalStyleable"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *p_allTools);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "removeObject:", self->_filtersController);
LABEL_67:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v89);
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = *p_allTools;
    *p_allTools = (NSArray *)v91;

  }
LABEL_68:
  -[PUPhotoEditViewController _updateToolbarsContentPadding](self, "_updateToolbarsContentPadding");
  moreButton = self->_moreButton;
  self->_moreButton = 0;

  markupButton = self->_markupButton;
  self->_markupButton = 0;

  showOriginalButton = self->_showOriginalButton;
  self->_showOriginalButton = 0;

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v165;
    do
    {
      for (i = 0; i != v98; ++i)
      {
        if (*(_QWORD *)v165 != v99)
          objc_enumerationMutation(v96);
        v101 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "setPhotoEditSpec:", v102);

        objc_msgSend(v101, "reloadToolbarButtons:", 1);
      }
      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
    }
    while (v98);
  }

  -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
  -[PUPhotoEditViewController _updateToolbarButtonPositions](self, "_updateToolbarButtonPositions");
  if (-[PUPhotoEditViewController isRunningAutoCalculators](self, "isRunningAutoCalculators")
    || (-[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput"),
        v103 = (void *)objc_claimAutoreleasedReturnValue(),
        v103,
        !v103))
  {
    v153 = 1;
    v104 = 1;
  }
  else
  {
    v104 = -[PUPhotoEditViewController _shouldHideToolsForQuickCrop](self, "_shouldHideToolsForQuickCrop");
    v153 = 0;
  }
  -[PUPhotoEditToolPickerController view](self->_toolPickerController, "view");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setHidden:", v104);

  toolPickerController = self->_toolPickerController;
  if (toolPickerController)
  {
    -[PUPhotoEditToolPickerController view](toolPickerController, "view");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = v107;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v173, 1);
    v108 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v108 = (id)MEMORY[0x1E0C9AA60];
  }
  v109 = self->_secondaryLeadingViews;
  v110 = self->_secondaryTrailingViews;
  v111 = self->_mainActionButton;
  v112 = self->_cancelButton;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "toolbarLongSideMargin");
  v115 = v114;

  -[PUPhotoEditToolbar setTopActionButtonPadding:](self->_secondaryToolbar, "setTopActionButtonPadding:", 0.0);
  v150 = v108;
  v116 = v108;
  if (-[PUPhotoEditViewController _actionButtonsGoInTopToolbar](self, "_actionButtonsGoInTopToolbar"))
  {
    v117 = v112;
    cancelButton = self->_cancelButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &cancelButton, 1);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "arrayByAddingObjectsFromArray:", v109);
    v119 = objc_claimAutoreleasedReturnValue();

    if (self->_zoomButton)
      v120 = v153;
    else
      v120 = 1;
    if ((v120 & 1) == 0)
    {
      currentEditingTool = (PUCropToolController *)self->_currentEditingTool;
      if (currentEditingTool)
      {
        if (currentEditingTool != self->_cropController)
        {
          -[NSArray arrayByAddingObject:](v110, "arrayByAddingObject:");
          v126 = objc_claimAutoreleasedReturnValue();

          v110 = (NSArray *)v126;
        }
      }
    }
    -[NSArray arrayByAddingObject:](v110, "arrayByAddingObject:", self->_mainActionButton);
    v127 = objc_claimAutoreleasedReturnValue();

    -[PUPhotoEditToolbar setLayoutDirection:](self->_mainToolbar, "setLayoutDirection:", -[PUPhotoEditViewController currentToolPickerLayoutDirection](self, "currentToolPickerLayoutDirection"));
    -[PUPhotoEditToolPickerController setLayoutDirection:](self->_toolPickerController, "setLayoutDirection:", -[PUPhotoEditViewController currentToolPickerLayoutDirection](self, "currentToolPickerLayoutDirection"));
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "toolbarLongSideWideMargin");
    v115 = v128;
    v154 = (void *)v119;
    v122 = (void *)v127;
    v116 = v108;
  }
  else
  {
    v154 = v109;
    v121 = v112;
    v122 = v110;
    if (!v112 || !v111)
    {
      v129 = v112;
      goto LABEL_97;
    }
    v171[0] = v112;
    v171[1] = v111;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 2);
    v123 = (NSArray *)objc_claimAutoreleasedReturnValue();
    notchButtons = self->_notchButtons;
    self->_notchButtons = v123;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v112, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v111, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditButtonCenteredToolbar addSubview:](self->_secondaryToolbar, "addSubview:", v112);
    -[PUPhotoEditButtonCenteredToolbar addSubview:](self->_secondaryToolbar, "addSubview:", v111);

  }
  v111 = 0;
  v129 = 0;
LABEL_97:
  v130 = self->_mainToolbar;
  if (v130)
    -[PUPhotoEditToolbar setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:](v130, "setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:", v116, 1, v111, v129);
  v131 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation", v111);
  -[PUPhotoEditViewController view](self, "view");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditLayoutSupport topToolbarVerticalOffsetForLayoutOrientation:view:](PUPhotoEditLayoutSupport, "topToolbarVerticalOffsetForLayoutOrientation:view:", v131, v132);
  -[PUPhotoEditToolbar setTopActionButtonPadding:](self->_secondaryToolbar, "setTopActionButtonPadding:");

  -[PUPhotoEditButtonCenteredToolbar setCenterView:leadingViews:trailingViews:](self->_secondaryToolbar, "setCenterView:leadingViews:trailingViews:", self->_secondaryCenterView, v154, v122);
  -[PUPhotoEditToolbar setLongSideMargin:](self->_secondaryToolbar, "setLongSideMargin:", v115);
  -[PUPhotoEditViewController _updateCancelButtonAnimated:](self, "_updateCancelButtonAnimated:", v3);
  -[PUPhotoEditViewController _updateMainActionButtonAnimated:](self, "_updateMainActionButtonAnimated:", v3);
  -[PUPhotoEditViewController _updateUndoRedoButtonsAnimated:](self, "_updateUndoRedoButtonsAnimated:", v3);
  -[PUPhotoEditViewController _updateSemStylesDebugButtonAnimated:](self, "_updateSemStylesDebugButtonAnimated:", v3);
  -[PUPhotoEditViewController _updateMoreButtonAnimated:](self, "_updateMoreButtonAnimated:", v3);
  -[PUPhotoEditViewController _updateShowOriginalButtonAnimated:](self, "_updateShowOriginalButtonAnimated:", v3);
  -[PUPhotoEditViewController _updateKeyCommands](self, "_updateKeyCommands");
  if (v151)
    -[PUPhotoEditViewController _setupToolsIfNeeded](self, "_setupToolsIfNeeded");
  v133 = self->_coreToolButtons;
  v134 = v133;
  v148 = v122;
  if (self->_redEyeButton)
  {
    -[NSArray arrayByAddingObject:](v133, "arrayByAddingObject:");
    v135 = objc_claimAutoreleasedReturnValue();

    v134 = (void *)v135;
  }
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v136 = v134;
  v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v160, v170, 16);
  if (v137)
  {
    v138 = v137;
    v139 = *(_QWORD *)v161;
    do
    {
      for (j = 0; j != v138; ++j)
      {
        if (*(_QWORD *)v161 != v139)
          objc_enumerationMutation(v136);
        -[PUPhotoEditViewController configureEnablenessOfControlButton:animated:canVisuallyDisable:](self, "configureEnablenessOfControlButton:animated:canVisuallyDisable:", *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * j), v3, 1);
      }
      v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v160, v170, 16);
    }
    while (v138);
  }

  if (v152)
    -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_adjustmentsController, 0);
  -[PUPhotoEditToolPickerController setSelectedToolTag:](self->_toolPickerController, "setSelectedToolTag:", -[PUPhotoEditToolController toolControllerTag](self->_currentEditingTool, "toolControllerTag"));
  currentlyHighlightedToolButtonTag = self->_currentlyHighlightedToolButtonTag;
  if (currentlyHighlightedToolButtonTag != -[PUPhotoEditToolController toolControllerTag](self->_currentEditingTool, "toolControllerTag"))
  {
    v155 = v129;
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v142 = self->_coreToolButtons;
    v143 = -[NSArray countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v156, v169, 16);
    if (v143)
    {
      v144 = v143;
      v145 = *(_QWORD *)v157;
      do
      {
        for (k = 0; k != v144; ++k)
        {
          if (*(_QWORD *)v157 != v145)
            objc_enumerationMutation(v142);
          objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * k), "setSelected:", -[PUPhotoEditToolController toolControllerTag](self->_currentEditingTool, "toolControllerTag") == objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * k), "tag"));
        }
        v144 = -[NSArray countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v156, v169, 16);
      }
      while (v144);
    }

    self->_currentlyHighlightedToolButtonTag = -[PUPhotoEditToolController toolControllerTag](self->_currentEditingTool, "toolControllerTag");
    v129 = v155;
  }
  self->_updatingToolbars = 0;

}

- (BOOL)_actionButtonsGoInTopToolbar
{
  int64_t v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = !+[PUPhotoEditLayoutSupport doneCancelButtonsInNotchAreaForLayoutOrientation:viewWidth:](PUPhotoEditLayoutSupport, "doneCancelButtonsInNotchAreaForLayoutOrientation:viewWidth:", v3, v5);

  return v6;
}

- (void)_updateToolbarsContentPadding
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *MEMORY[0x1E0DC49E8];
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[PUPhotoEditViewController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v18 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  v19 = v9 > 0.0 && v17 == 1;
  v20 = v9 + 15.0;
  if (!v19)
    v20 = v9;
  if (v18 == 1)
  {
    v21 = v5;
  }
  else
  {
    v20 = v14;
    v21 = v12;
  }
  if (v18 == 2)
    v22 = v14;
  else
    v22 = v20;
  if (v18 == 2)
  {
    v23 = v11;
  }
  else
  {
    v5 = v21;
    v7 = v13;
    v23 = v15;
  }
  -[PUPhotoEditToolbar setContentPadding:](self->_mainToolbar, "setContentPadding:", v12, v13, v22, v23);
  -[PUPhotoEditToolbar setContentPadding:](self->_secondaryToolbar, "setContentPadding:", v5, v7, v14, v23);
}

- (BOOL)_wantsTTRButton
{
  void *v2;
  char v3;

  if (!self->_ttrExceededThreshold || !MEMORY[0x1AF429AFC]())
    return 0;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enablePerfTTRButton");

  return v3;
}

- (BOOL)_shouldHideToolsForQuickCrop
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop");
  if (v2)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "quickCropHideOtherToolsInEdit");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)_markupGetsItsOwnButton
{
  void *v3;
  uint64_t v4;

  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentLayoutStyle");

  if (v4 == 1 && self->_currentEditingTool == &self->_cropController->super)
    return 0;
  else
    return !-[PUPhotoEditViewController _shouldHideToolsForQuickCrop](self, "_shouldHideToolsForQuickCrop");
}

- (BOOL)_shouldShowRawDecodeBadge
{
  PUCropToolController *currentEditingTool;
  BOOL result;

  result = self->_shouldShowRawDecodeBadge
        && (currentEditingTool = (PUCropToolController *)self->_currentEditingTool,
            currentEditingTool != self->_cropController)
        && self->_currentTool
        && currentEditingTool != (PUCropToolController *)self->_photoStylesToolController;
  return result;
}

- (BOOL)_shouldShowProResBadge
{
  PUCropToolController *currentEditingTool;
  BOOL result;

  result = self->_shouldShowProResBadge
        && (currentEditingTool = (PUCropToolController *)self->_currentEditingTool,
            currentEditingTool != self->_cropController)
        && self->_currentTool
        && currentEditingTool != (PUCropToolController *)self->_photoStylesToolController;
  return result;
}

- (void)_reloadToolbarButtonsIfNeeded
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  PUPhotoEditToolbarButton *redEyeButton;
  int v13;
  _BOOL4 v14;
  double v15;
  _BOOL4 v16;
  PUPhotoEditToolbarButton *markupButton;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSArray *v26;
  NSArray *coreToolButtons;
  NSArray *v28;
  NSArray *coreToolButtonViews;
  NSDictionary *v30;
  NSDictionary *toolTagLabelMap;
  void *v32;
  uint64_t v33;
  PUPhotoEditToolPickerController *toolPickerController;
  PUPhotoEditToolPickerController *v35;
  PUPhotoEditToolPickerController *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PXUIAssetBadgeView *assetTypeBadge;
  id v42;
  PXUIAssetBadgeView *v43;
  PXUIAssetBadgeView *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  double v49;
  void *v50;
  void *v51;
  PUPhotoEditToolbarButton *v52;
  void *v53;
  PUPhotoEditToolbarButton *v54;
  PUPhotoEditToolbarButton *v55;
  UIViewController *currentTool;
  UIViewController *v57;
  PUPhotoEditToolbarButton *showOriginalButton;
  _BOOL4 v59;
  void *v60;
  void *v61;
  PUPhotoEditToolbarButton *v62;
  PUPhotoEditToolbarButton *v63;
  char v64;
  PUPhotoEditToolbarButton *undoButton;
  void *v66;
  void *v67;
  PUPhotoEditToolbarButton *v68;
  PUPhotoEditToolbarButton *v69;
  PUPhotoEditToolbarButton *redoButton;
  void *v71;
  void *v72;
  PUPhotoEditToolbarButton *v73;
  PUPhotoEditToolbarButton *v74;
  PUPhotoEditToolbarButton *semStylesDebugButton;
  int v76;
  void *v77;
  PUPhotoEditToolbarButton *v78;
  PUPhotoEditToolbarButton *v79;
  char v80;
  int v81;
  void *v82;
  void *v83;
  PUPhotoEditToolbarButton *v84;
  PUPhotoEditToolbarButton *moreButton;
  void *v86;
  PUPhotoEditToolbarButton *v87;
  PUPhotoEditToolbarButton *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  PUPhotoEditToolbarButton *v92;
  PUPhotoEditToolbarButton *v93;
  char v94;
  void *v95;
  void *v96;
  PUPhotoEditToolbarButton *v97;
  PUPhotoEditToolbarButton *zoomButton;
  void *v99;
  void *v100;
  int v101;
  __objc2_class **v102;
  id v103;
  UIButton *v104;
  UIButton *mainActionButton;
  void *v106;
  char isKindOfClass;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  UIButton **p_cancelButton;
  void *v114;
  int v115;
  PUPhotoEditNotchButton *v116;
  PUPhotoEditNotchButton *v117;
  void *v118;
  PUPhotoEditTitledNotchButton *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _BOOL4 v127;
  UIButton *v128;
  UIButton *ttrButton;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  objc_class *v134;
  void *v135;
  objc_class *v136;
  void *v137;
  SEL v138;
  void *v139;
  _BOOL4 v140;
  int v141;
  int v142;
  void *v143;
  void *v144;
  _BOOL4 v145;
  _BOOL4 v146;
  _BOOL4 v147;
  _BOOL4 v148;
  _BOOL4 v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  id v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[5];
  _QWORD v165[5];
  _OWORD v166[2];
  __int128 v167;
  __int128 v168;
  _QWORD v169[5];
  id v170;
  id v171;
  id location[3];

  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v147 = -[PUPhotoEditViewController _shouldDisplayRedEyeTool](self, "_shouldDisplayRedEyeTool");
  v5 = -[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing");
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = a2;
  if ((objc_msgSend(v6, "editMenuEnabled") & 1) != 0)
  {
    v7 = 1;
  }
  else if (-[PUEditPluginSession isAvailable](self->_pluginSession, "isAvailable"))
  {
    v8 = -[PUPhotoEditViewController _shouldHideToolsForQuickCrop](self, "_shouldHideToolsForQuickCrop");
    if (!v8 && !v5)
      v8 = -[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia");
    v7 = !v8;
  }
  else
  {
    v7 = 0;
  }

  v140 = -[PUPhotoEditViewController _wantsTTRButton](self, "_wantsTTRButton");
  v149 = -[PUPhotoEditViewController _shouldShowRawDecodeBadge](self, "_shouldShowRawDecodeBadge");
  if (v4)
    v9 = self->_undoButton == 0;
  else
    v9 = self->_undoButton != 0;
  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    v142 = 0;
  }
  else
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v10, "enableSemanticStyleDebugUIInEdit");

  }
  v11 = -[PUPhotoEditViewController _canPresentMarkup](self, "_canPresentMarkup");
  if (v11)
    v11 = -[PUPhotoEditViewController _markupGetsItsOwnButton](self, "_markupGetsItsOwnButton");
  v144 = v4;
  v146 = v11;
  redEyeButton = self->_redEyeButton;
  if (redEyeButton)
    v13 = -[PUPhotoEditToolbarButton isHidden](redEyeButton, "isHidden") ^ 1;
  else
    v13 = 0;
  v141 = v7;
  if (v7)
    v14 = self->_moreButton == 0;
  else
    v14 = self->_moreButton != 0;
  -[PXUIAssetBadgeView alpha](self->_assetTypeBadge, "alpha");
  v16 = v15 > 0.0;
  markupButton = self->_markupButton;
  v148 = -[PUPhotoEditViewController _shouldShowProResBadge](self, "_shouldShowProResBadge");
  objc_initWeak(location, self);
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend(v18, "currentLayoutStyle") == 4 && self->_currentEditingTool != &self->_cropController->super;

  v19 = !self->_toolbarButtonsValid || v9;
  v20 = v145;
  if (((v19 | v147 ^ v13 | v14 | v146 ^ (markupButton != 0) | v149 ^ v16 | v16 ^ v148) & 1) != 0
    || ((v145 ^ (self->_showOriginalButton != 0)) & 1) != 0)
  {
    -[PUPhotoEditViewController _allTools](self, "_allTools");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_coreToolButtons)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = v145;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v169[0] = MEMORY[0x1E0C809B0];
      v169[1] = 3221225472;
      v169[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke;
      v169[3] = &unk_1E58A4598;
      v169[4] = self;
      v24 = v21;
      v170 = v24;
      v25 = v22;
      v171 = v25;
      objc_msgSend(v139, "enumerateObjectsUsingBlock:", v169);
      v26 = (NSArray *)objc_msgSend(v24, "copy");
      coreToolButtons = self->_coreToolButtons;
      self->_coreToolButtons = v26;

      v28 = (NSArray *)objc_msgSend(v25, "copy");
      coreToolButtonViews = self->_coreToolButtonViews;
      self->_coreToolButtonViews = v28;

      v30 = (NSDictionary *)objc_msgSend(v23, "copy");
      toolTagLabelMap = self->_toolTagLabelMap;
      self->_toolTagLabelMap = v30;

    }
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "currentLayoutStyle");

    toolPickerController = self->_toolPickerController;
    if (!toolPickerController)
    {
      v35 = -[PUPhotoEditToolPickerController initWithLayoutDirection:style:blurredBackground:]([PUPhotoEditToolPickerController alloc], "initWithLayoutDirection:style:blurredBackground:", -[PUPhotoEditViewController currentToolPickerLayoutDirection](self, "currentToolPickerLayoutDirection"), 0, v33 == 4);
      v36 = self->_toolPickerController;
      self->_toolPickerController = v35;

      toolPickerController = self->_toolPickerController;
    }
    -[PUPhotoEditToolPickerController setToolButtons:](toolPickerController, "setToolButtons:", self->_coreToolButtonViews);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "colorWithAlphaComponent:", 0.6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 == 4)
      v39 = v38;
    else
      v39 = 0;
    -[PUPhotoEditToolPickerController setBackgroundColor:](self->_toolPickerController, "setBackgroundColor:", v39);
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolPickerController setParentSpec:](self->_toolPickerController, "setParentSpec:", v40);

    assetTypeBadge = self->_assetTypeBadge;
    if (!v149 && !v148)
    {
      -[PXUIAssetBadgeView alpha](assetTypeBadge, "alpha");
      if (v49 > 0.0 && !-[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction"))
      {
        v164[0] = MEMORY[0x1E0C809B0];
        v164[1] = 3221225472;
        v164[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_3;
        v164[3] = &unk_1E58ABD10;
        v164[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v164, 0.25);
      }
      goto LABEL_53;
    }
    if (assetTypeBadge)
    {
LABEL_51:
      if (!-[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction"))
      {
        v165[0] = MEMORY[0x1E0C809B0];
        v165[1] = 3221225472;
        v165[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_2;
        v165[3] = &unk_1E58ABD10;
        v165[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v165, 0.25);
      }
LABEL_53:
      v52 = self->_redEyeButton;
      if (!v52)
      {
        -[PUPhotoEditViewController redEyeController](self, "redEyeController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[PUPhotoEditViewController _newToolButtonForTool:](self, "_newToolButtonForTool:", v53);
        v55 = self->_redEyeButton;
        self->_redEyeButton = v54;

        -[PUPhotoEditToolbarButton setIsTopToolbarButton:](self->_redEyeButton, "setIsTopToolbarButton:", 1);
        currentTool = self->_currentTool;
        -[PUPhotoEditViewController redEyeController](self, "redEyeController");
        v57 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (currentTool == v57)
          -[PUPhotoEditToolbarButton setSelected:](self->_redEyeButton, "setSelected:", 1);

        v52 = self->_redEyeButton;
        v20 = v145;
      }
      -[PUPhotoEditToolbarButton setHidden:](v52, "setHidden:", !v147);
      showOriginalButton = self->_showOriginalButton;
      if (showOriginalButton)
        v59 = 0;
      else
        v59 = v20;
      if (v59)
      {
        PULocalizedString(CFSTR("PHOTOEDIT_SHOW_ORIGINAL_ACCESSIBILITY_LABEL"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("square.and.line.vertical.and.square.filled"), 0, v60, v61);
        v62 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        v63 = self->_showOriginalButton;
        self->_showOriginalButton = v62;

        v162[0] = MEMORY[0x1E0C809B0];
        v162[1] = 3221225472;
        v162[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_4;
        v162[3] = &unk_1E58A45C0;
        objc_copyWeak(&v163, location);
        -[PUPhotoEditToolbarButton setActionBlock:](self->_showOriginalButton, "setActionBlock:", v162);
        objc_destroyWeak(&v163);
      }
      else
      {
        if (showOriginalButton)
          v64 = v20;
        else
          v64 = 1;
        if ((v64 & 1) == 0)
        {
          self->_showOriginalButton = 0;

        }
      }
      undoButton = self->_undoButton;
      if (undoButton || !v144)
      {
        if (undoButton && !v144)
        {
          self->_undoButton = 0;

        }
      }
      else
      {
        PULocalizedString(CFSTR("PHOTOEDIT_UNDO_ACCESSIBILITY_LABEL"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("arrow.uturn.backward.circle"), 0, v66, v67);
        v68 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        v69 = self->_undoButton;
        self->_undoButton = v68;

        v160[0] = MEMORY[0x1E0C809B0];
        v160[1] = 3221225472;
        v160[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_5;
        v160[3] = &unk_1E58A45C0;
        objc_copyWeak(&v161, location);
        -[PUPhotoEditToolbarButton setActionBlock:](self->_undoButton, "setActionBlock:", v160);
        objc_destroyWeak(&v161);
      }
      redoButton = self->_redoButton;
      if (redoButton || !v143)
      {
        if (redoButton && !v143)
        {
          self->_redoButton = 0;

        }
      }
      else
      {
        PULocalizedString(CFSTR("PHOTOEDIT_REDO_ACCESSIBILITY_LABEL"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("arrow.uturn.forward.circle"), 0, v71, v72);
        v73 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        v74 = self->_redoButton;
        self->_redoButton = v73;

        v158[0] = MEMORY[0x1E0C809B0];
        v158[1] = 3221225472;
        v158[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_6;
        v158[3] = &unk_1E58A45C0;
        objc_copyWeak(&v159, location);
        -[PUPhotoEditToolbarButton setActionBlock:](self->_redoButton, "setActionBlock:", v158);
        objc_destroyWeak(&v159);
      }
      semStylesDebugButton = self->_semStylesDebugButton;
      if (semStylesDebugButton)
        v76 = 0;
      else
        v76 = v142;
      if (v76 == 1)
      {
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("theatermask.and.paintbrush"), 0, &stru_1E58AD278, v77);
        v78 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        v79 = self->_semStylesDebugButton;
        self->_semStylesDebugButton = v78;

        v156[0] = MEMORY[0x1E0C809B0];
        v156[1] = 3221225472;
        v156[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_7;
        v156[3] = &unk_1E58A45C0;
        objc_copyWeak(&v157, location);
        -[PUPhotoEditToolbarButton setActionBlock:](self->_semStylesDebugButton, "setActionBlock:", v156);
        objc_destroyWeak(&v157);
      }
      else
      {
        if (semStylesDebugButton)
          v80 = v142;
        else
          v80 = 1;
        if ((v80 & 1) == 0)
        {
          self->_semStylesDebugButton = 0;

        }
      }
      v81 = v141;
      if (self->_moreButton)
        v81 = 0;
      if (v81 == 1)
      {
        PULocalizedString(CFSTR("MORE_BUTTON_TITLE"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("ellipsis.circle"), 0, v82, v83);
        v84 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        moreButton = self->_moreButton;
        self->_moreButton = v84;

        -[PUPhotoEditToolbarButton setIsTopToolbarButton:](self->_moreButton, "setIsTopToolbarButton:", 1);
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v83) = objc_msgSend(v86, "editMenuEnabled");

        v87 = self->_moreButton;
        if ((_DWORD)v83)
        {
          -[PUPhotoEditToolbarButton setShowsMenuAsPrimaryAction:](v87, "setShowsMenuAsPrimaryAction:", 1);
          -[PUPhotoEditViewController _reloadMoreButtonMenu](self, "_reloadMoreButtonMenu");
        }
        else
        {
          -[PUPhotoEditToolbarButton setShowsMenuAsPrimaryAction:](v87, "setShowsMenuAsPrimaryAction:", 0);
          -[PUPhotoEditToolbarButton setMenu:](self->_moreButton, "setMenu:", 0);
          v154[0] = MEMORY[0x1E0C809B0];
          v154[1] = 3221225472;
          v154[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_8;
          v154[3] = &unk_1E58A45C0;
          objc_copyWeak(&v155, location);
          -[PUPhotoEditToolbarButton setActionBlock:](self->_moreButton, "setActionBlock:", v154);
          objc_destroyWeak(&v155);
        }
      }
      v88 = self->_markupButton;
      if (v88)
        v89 = 0;
      else
        v89 = v146;
      if (v89)
      {
        PULocalizedString(CFSTR("MARKUP_BUTTON_TITLE"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("pencil.tip.crop.circle"), 0, v90, v91);
        v92 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        v93 = self->_markupButton;
        self->_markupButton = v92;

        -[PUPhotoEditToolbarButton setIsTopToolbarButton:](self->_markupButton, "setIsTopToolbarButton:", 1);
        v152[0] = MEMORY[0x1E0C809B0];
        v152[1] = 3221225472;
        v152[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_9;
        v152[3] = &unk_1E58A45C0;
        objc_copyWeak(&v153, location);
        -[PUPhotoEditToolbarButton setActionBlock:](self->_markupButton, "setActionBlock:", v152);
        objc_destroyWeak(&v153);
      }
      else
      {
        if (v88)
          v94 = v146;
        else
          v94 = 1;
        if ((v94 & 1) == 0)
        {
          self->_markupButton = 0;

        }
      }
      if (!self->_zoomButton && !self->_isEmbeddedEdit)
      {
        PULocalizedString(CFSTR("ZOOM_BUTTON_TITLE"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditToolbarButton buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:](PUPhotoEditToolbarButton, "buttonWithImageNamed:selectedImageNamed:accessibilityLabel:spec:", CFSTR("arrow.up.left.and.arrow.down.right"), CFSTR("arrow.down.right.and.arrow.up.left"), v95, v96);
        v97 = (PUPhotoEditToolbarButton *)objc_claimAutoreleasedReturnValue();
        zoomButton = self->_zoomButton;
        self->_zoomButton = v97;

        -[PUPhotoEditToolbarButton setIsTopToolbarButton:](self->_zoomButton, "setIsTopToolbarButton:", 1);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbarButton setSelectedColor:](self->_zoomButton, "setSelectedColor:", v99);

        v150[0] = MEMORY[0x1E0C809B0];
        v150[1] = 3221225472;
        v150[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_10;
        v150[3] = &unk_1E58A45C0;
        objc_copyWeak(&v151, location);
        -[PUPhotoEditToolbarButton setActionBlock:](self->_zoomButton, "setActionBlock:", v150);
        objc_destroyWeak(&v151);
      }
      if (!self->_mainActionButton)
      {
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "newNotchButtons");

        v102 = off_1E5885B38;
        if (!v101)
          v102 = off_1E5885B50;
        v103 = objc_alloc(*v102);
        v104 = (UIButton *)objc_msgSend(v103, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        mainActionButton = self->_mainActionButton;
        self->_mainActionButton = v104;

        -[UIButton addTarget:action:forControlEvents:](self->_mainActionButton, "addTarget:action:forControlEvents:", self, sel__handleMainActionButton_, 64);
        self->_mainButtonAction = 0;
        if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
        {
          -[PUPhotoEditViewController photo](self, "photo");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            -[PUPhotoEditViewController updateMainButtonForSaveAsNewClipMenu](self, "updateMainButtonForSaveAsNewClipMenu");
        }
        -[PUPhotoEditViewController revertConfirmationAlert](self, "revertConfirmationAlert");
        v108 = (void *)objc_claimAutoreleasedReturnValue();

        if (v108)
        {
          -[PUPhotoEditViewController revertConfirmationAlert](self, "revertConfirmationAlert");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "popoverPresentationController");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "setSourceView:", self->_mainActionButton);

          -[PUPhotoEditViewController revertConfirmationAlert](self, "revertConfirmationAlert");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "popoverPresentationController");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton bounds](self->_mainActionButton, "bounds");
          objc_msgSend(v112, "setSourceRect:");

        }
      }
      p_cancelButton = &self->_cancelButton;
      if (!self->_cancelButton)
      {
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend(v114, "newNotchButtons");

        if (v115)
        {
          v116 = [PUPhotoEditNotchButton alloc];
          v117 = -[PUPhotoEditNotchButton initWithFrame:](v116, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_CANCEL_OR_ICON"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditNotchButton setTitle:fallbackSymbolName:](v117, "setTitle:fallbackSymbolName:", v118, CFSTR("xmark"));
        }
        else
        {
          v119 = [PUPhotoEditTitledNotchButton alloc];
          v117 = -[PUPhotoEditTitledNotchButton initWithFrame:](v119, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_CANCEL_OR_ICON"));
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditNotchButton setTitle:forState:fallbackSymbolName:](v117, "setTitle:forState:fallbackSymbolName:", v120, 0, CFSTR("x.circle"));

          -[PUPhotoEditNotchButton titleLabel](v117, "titleLabel");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "setTextAlignment:", 1);
        }

        objc_storeStrong((id *)&self->_cancelButton, v117);
        -[UIButton addTarget:action:forControlEvents:](*p_cancelButton, "addTarget:action:forControlEvents:", self, sel__handleCancelButton_, 64);
        PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_CANCEL_ACCESSIBILITY"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setAccessibilityLabel:](*p_cancelButton, "setAccessibilityLabel:", v121);

        -[PUPhotoEditViewController cancelConfirmationAlert](self, "cancelConfirmationAlert");
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        if (v122)
        {
          -[PUPhotoEditViewController cancelConfirmationAlert](self, "cancelConfirmationAlert");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "popoverPresentationController");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "setSourceView:", *p_cancelButton);

          -[PUPhotoEditViewController cancelConfirmationAlert](self, "cancelConfirmationAlert");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "popoverPresentationController");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton bounds](*p_cancelButton, "bounds");
          objc_msgSend(v126, "setSourceRect:");

        }
      }
      if (self->_ttrButton)
        v127 = 0;
      else
        v127 = v140;
      if (v127)
      {
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
        v128 = (UIButton *)objc_claimAutoreleasedReturnValue();
        ttrButton = self->_ttrButton;
        self->_ttrButton = v128;

        objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUTTR"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "imageWithRenderingMode:", 2);
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIButton setImage:forState:](self->_ttrButton, "setImage:forState:", v131, 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.670588235, 0.274509804, 0.980392157, 1.0);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTintColor:](self->_ttrButton, "setTintColor:", v132);

        -[UIButton addTarget:action:forControlEvents:](self->_ttrButton, "addTarget:action:forControlEvents:", self, sel__handleTTRButton_, 64);
      }
      -[PUPhotoEditViewController _updateToolbarButtonPositions](self, "_updateToolbarButtonPositions");
      -[PUPhotoEditViewController _updateZoomButton](self, "_updateZoomButton");

      goto LABEL_128;
    }
    v42 = objc_alloc(MEMORY[0x1E0D7BB38]);
    v43 = (PXUIAssetBadgeView *)objc_msgSend(v42, "initWithFrame:", *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
    v44 = self->_assetTypeBadge;
    self->_assetTypeBadge = v43;

    -[PXUIAssetBadgeView setStyle:](self->_assetTypeBadge, "setStyle:", 3);
    -[PXUIAssetBadgeView setTranslatesAutoresizingMaskIntoConstraints:](self->_assetTypeBadge, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (!v149)
    {
LABEL_50:
      v167 = 0u;
      v168 = 0u;
      PXAssetBadgeInfoCreateWithBadges();
      v166[0] = v167;
      v166[1] = v168;
      -[PXUIAssetBadgeView setBadgeInfo:](self->_assetTypeBadge, "setBadgeInfo:", v166);
      -[PUPhotoEditViewController view](self, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addSubview:", self->_assetTypeBadge);

      -[PUPhotoEditViewController view](self, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setNeedsUpdateConstraints");

      -[PXUIAssetBadgeView setAlpha:](self->_assetTypeBadge, "setAlpha:", 0.0);
      v20 = v145;
      goto LABEL_51;
    }
    -[PUPhotoEditViewController photo](self, "photo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = 0;
      goto LABEL_49;
    }
    -[PUPhotoEditViewController photo](self, "photo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_43:
        v47 = v46;

        v48 = v47;
LABEL_49:

        objc_msgSend(v48, "RAWBadgeAttributes");
        goto LABEL_50;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = (objc_class *)objc_opt_class();
      NSStringFromClass(v136);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "px_descriptionForAssertionMessage");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "handleFailureInMethod:object:file:lineNumber:description:", v138, self, CFSTR("PUPhotoEditViewController.m"), 2878, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.photo"), v135, v137);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = (objc_class *)objc_opt_class();
      NSStringFromClass(v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "handleFailureInMethod:object:file:lineNumber:description:", v138, self, CFSTR("PUPhotoEditViewController.m"), 2878, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.photo"), v135);
    }

    goto LABEL_43;
  }
LABEL_128:
  objc_destroyWeak(location);
}

- (void)_updateToolbarButtonPositions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  UIView *v9;
  void *v10;
  BOOL v11;
  PUCropToolController *currentEditingTool;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  UIView *v18;
  uint64_t v19;
  PUPhotoEditToolbarButton *redoButton;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  UIButton *ttrButton;
  NSArray *v25;
  NSArray *secondaryLeadingViews;
  NSArray *v27;
  NSArray *secondaryTrailingViews;
  UIView *secondaryCenterView;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_opt_new();
  -[PUPhotoEditToolController leadingToolbarViews](self->_currentEditingTool, "leadingToolbarViews");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  -[PUPhotoEditToolController centerToolbarView](self->_currentEditingTool, "centerToolbarView");
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController trailingToolbarViews](self->_currentEditingTool, "trailingToolbarViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v10);
  v11 = -[PUPhotoEditViewController currentToolControllerIsScrolling](self, "currentToolControllerIsScrolling");
  if (-[PUPhotoEditViewController _shouldDisplayRedEyeTool](self, "_shouldDisplayRedEyeTool"))
  {
    currentEditingTool = (PUCropToolController *)self->_currentEditingTool;
    if (currentEditingTool != self->_cropController
      && currentEditingTool != (PUCropToolController *)self->_photoStylesToolController)
    {
      objc_msgSend(v4, "insertObject:atIndex:", self->_redEyeButton, 0);
    }
  }
  objc_msgSend(v3, "addObjectsFromArray:", self->_coreToolButtonViews);
  if (!self->_currentEditingTool)
  {
    if (v11)
      goto LABEL_30;
    goto LABEL_28;
  }
  v30 = objc_msgSend(v8, "count");
  if (self->_showOriginalButton)
  {
    v33[0] = self->_showOriginalButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v8);
    v14 = v4;
    v15 = v10;
    v16 = v11;
    v17 = v3;
    v18 = v9;
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v19;
    v9 = v18;
    v3 = v17;
    v11 = v16;
    v10 = v15;
    v4 = v14;
  }
  if (self->_undoButton)
  {
    redoButton = self->_redoButton;
    if (redoButton)
    {
      if (!v30)
      {
        if (self->_showOriginalButton)
        {
          v32[0] = self->_undoButton;
          v32[1] = redoButton;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v21;
        }
        else
        {
          v31[0] = self->_undoButton;
          v31[1] = redoButton;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
          v22 = objc_claimAutoreleasedReturnValue();
        }

        v8 = (id)v22;
      }
    }
  }
  if (self->_semStylesDebugButton)
  {
    objc_msgSend(v8, "arrayByAddingObject:");
    v23 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v23;
  }
  if (!v11)
  {
    if (self->_markupButton)
      objc_msgSend(v4, "addObject:");
    if (self->_moreButton)
      objc_msgSend(v4, "addObject:");
LABEL_28:
    ttrButton = self->_ttrButton;
    if (ttrButton)
      objc_msgSend(v4, "insertObject:atIndex:", ttrButton, 0);
  }
LABEL_30:
  v25 = (NSArray *)objc_msgSend(v8, "copy");
  secondaryLeadingViews = self->_secondaryLeadingViews;
  self->_secondaryLeadingViews = v25;

  v27 = (NSArray *)objc_msgSend(v4, "copy");
  secondaryTrailingViews = self->_secondaryTrailingViews;
  self->_secondaryTrailingViews = v27;

  secondaryCenterView = self->_secondaryCenterView;
  self->_secondaryCenterView = v9;

  self->_toolbarButtonsValid = 1;
}

- (int64_t)_selectionIndicatorType
{
  int64_t v3;
  void *v4;

  if (-[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") == 1)
    return 1;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "currentLayoutStyle") == 4)
    v3 = 3;
  else
    v3 = 2;

  return v3;
}

- (id)_newToolButtonForTool:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  _BOOL4 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "toolControllerTag");
  if (v5 == 1005)
    v6 = 0;
  else
    v6 = -[PUPhotoEditViewController _selectionIndicatorType](self, "_selectionIndicatorType");
  v7 = -[PUPhotoEditViewController showsLabelsForToolButtons](self, "showsLabelsForToolButtons");
  v8 = v5 != 1005 && v7;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditToolbarButton buttonForTool:showingLabel:selectionIndicatorType:spec:](PUPhotoEditToolbarButton, "buttonForTool:showingLabel:selectionIndicatorType:spec:", v4, v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PUPhotoEditViewController__newToolButtonForTool___block_invoke;
  v12[3] = &unk_1E58A45C0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v10, "setActionBlock:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_updateBackgroundColor
{
  PUPhotoEditToolController *currentEditingTool;
  void *v4;
  void *v5;
  id v6;

  currentEditingTool = self->_currentEditingTool;
  if (!currentEditingTool
    || (-[PUPhotoEditToolController preferredPreviewBackgroundColor](currentEditingTool, "preferredPreviewBackgroundColor"), (v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoEditingBackgroundColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PUPhotoEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)_updateToolbarBackgroundAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentLayoutStyle");

  v7 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  v8 = 3;
  if (v7 == 1)
    v8 = 1;
  if (v6 == 4)
    v9 = 4;
  else
    v9 = v8;
  -[PUPhotoEditToolbar setBackgroundStyle:animated:](self->_mainToolbar, "setBackgroundStyle:animated:", v9, v3);
  -[PUPhotoEditViewController _updateToolbarShadowStyling:forToolbar:](self, "_updateToolbarShadowStyling:forToolbar:", self->_mainToolbarShadow, self->_mainToolbar);
  -[PUPhotoEditToolController setUseGradientBackground:animated:](self->_currentEditingTool, "setUseGradientBackground:animated:", 0, v3);
  -[PUPhotoEditMediaToolController setUseGradientBackground:animated:](self->_mediaToolController, "setUseGradientBackground:animated:", 0, v3);
  -[PUPhotoEditToolController setUseGradientBackground:animated:](self->_portraitToolController, "setUseGradientBackground:animated:", 0, v3);
  -[PUPhotoEditToolbar setBackgroundStyle:animated:](self->_secondaryToolbar, "setBackgroundStyle:animated:", 2, v3);
  -[PUPhotoEditViewController _updateToolbarShadowStyling:forToolbar:](self, "_updateToolbarShadowStyling:forToolbar:", self->_secondaryToolbarShadow, self->_secondaryToolbar);
}

- (void)_updateToolbarShadowStyling:(id)a3 forToolbar:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a4, "backgroundStyle");
  v6 = 0;
  switch(v5)
  {
    case 1:
      goto LABEL_5;
    case 2:
      v6 = 0;
      v5 = 0;
      goto LABEL_5;
    case 3:
      v6 = 0;
      v5 = 2;
      goto LABEL_5;
    case 4:
      v6 = 1;
      v5 = 3;
LABEL_5:
      objc_msgSend(v7, "setHidden:", v6);
      objc_msgSend(v7, "setTransparentSide:", v5);
      break;
    default:
      break;
  }

}

- (void)_updateToolbarShadowAlpha
{
  double v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;

  if (-[PUPhotoEditToolController shouldHideMediaView](self->_currentEditingTool, "shouldHideMediaView"))
  {
    -[PUPhotoEditViewController secondaryToolbarShadowAlphaOverride](self, "secondaryToolbarShadowAlphaOverride");
  }
  else
  {
    -[PUPhotoEditViewController mediaView](self, "mediaView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    if (-[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction")
      || !-[PUPhotoEditToolController wantsShadowViews](self->_currentEditingTool, "wantsShadowViews")
      || (v14.origin.x = v7, v14.origin.y = v9, v14.size.width = v11, v14.size.height = v13, CGRectIsEmpty(v14)))
    {
      v4 = 0.0;
      -[PUPhotoEditShadowView setAlpha:](self->_mainToolbarShadow, "setAlpha:", 0.0);
      goto LABEL_8;
    }
    -[PUPhotoEditViewController _imageFrameIntersectionWithMainToolbarFraction](self, "_imageFrameIntersectionWithMainToolbarFraction");
    -[PUPhotoEditShadowView setAlpha:](self->_mainToolbarShadow, "setAlpha:");
    -[PUPhotoEditViewController _imageFrameIntersectionWithSecondaryToolbarFraction](self, "_imageFrameIntersectionWithSecondaryToolbarFraction");
  }
  v4 = v3;
LABEL_8:
  -[PUPhotoEditShadowView setAlpha:](self->_secondaryToolbarShadow, "setAlpha:", v4);
}

- (double)_imageFrameIntersectionWithMainToolbarFraction
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double result;
  int64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  if (CGRectIsEmpty(v18))
    return 0.0;
  v13 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  v14 = v5;
  v15 = v7;
  v16 = v9;
  v17 = v11;
  if (v13 == 1)
  {
    CGRectGetMaxY(*(CGRect *)&v14);
    -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
    CGRectGetMinY(v19);
    -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
    CGRectGetMaxY(v20);
  }
  else
  {
    CGRectGetMaxX(*(CGRect *)&v14);
    -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
    CGRectGetMinX(v21);
    -[PUPhotoEditToolbar frame](self->_mainToolbar, "frame");
    CGRectGetMaxX(v22);
  }
  PXFloatProgressBetween();
  PXClamp();
  return result;
}

- (double)_imageFrameIntersectionWithSecondaryToolbarFraction
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double result;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  if (CGRectIsEmpty(v13))
    return 0.0;
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  CGRectGetMinY(v14);
  -[PUPhotoEditButtonCenteredToolbar frame](self->_secondaryToolbar, "frame");
  CGRectGetMaxY(v15);
  -[PUPhotoEditButtonCenteredToolbar frame](self->_secondaryToolbar, "frame");
  CGRectGetMinY(v16);
  PXFloatProgressBetween();
  PXClamp();
  return result;
}

- (void)_updateSpecDependentUIPieces
{
  _BOOL4 v3;
  NSArray *coreToolButtons;
  NSArray *coreToolButtonViews;
  NSArray *secondaryLeadingViews;
  UIButton *mainActionButton;
  UIButton *cancelButton;
  UIBarButtonItem *edit1upToggleButton;
  NSArray *secondaryTrailingViews;
  UIView *secondaryCenterView;
  PUPhotoEditToolbarButton *redEyeButton;
  PUPhotoEditToolbarButton *moreButton;
  PUPhotoEditToolbarButton *markupButton;
  NSArray *currentToolViewConstraints;
  void *v16;
  void *v17;

  v3 = -[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction");
  -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 0);
  self->_toolbarButtonsValid = 0;
  -[PUPhotoEditToolbar removeFromSuperview](self->_mainToolbar, "removeFromSuperview");
  -[PUPhotoEditShadowView removeFromSuperview](self->_mainToolbarShadow, "removeFromSuperview");
  -[PUPhotoEditButtonCenteredToolbar removeFromSuperview](self->_secondaryToolbar, "removeFromSuperview");
  -[PUPhotoEditShadowView removeFromSuperview](self->_secondaryToolbarShadow, "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_mainToolbarConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_secondaryToolbarConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_actionButtonConstraints);
  -[PUPhotoEditViewController _clearToolbars](self, "_clearToolbars");
  coreToolButtons = self->_coreToolButtons;
  self->_coreToolButtons = 0;

  coreToolButtonViews = self->_coreToolButtonViews;
  self->_coreToolButtonViews = 0;

  secondaryLeadingViews = self->_secondaryLeadingViews;
  self->_secondaryLeadingViews = 0;

  mainActionButton = self->_mainActionButton;
  self->_mainActionButton = 0;

  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;

  edit1upToggleButton = self->_edit1upToggleButton;
  self->_edit1upToggleButton = 0;

  secondaryTrailingViews = self->_secondaryTrailingViews;
  self->_secondaryTrailingViews = 0;

  secondaryCenterView = self->_secondaryCenterView;
  self->_secondaryCenterView = 0;

  redEyeButton = self->_redEyeButton;
  self->_redEyeButton = 0;

  moreButton = self->_moreButton;
  self->_moreButton = 0;

  markupButton = self->_markupButton;
  self->_markupButton = 0;

  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
  if (self->_currentToolViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    currentToolViewConstraints = self->_currentToolViewConstraints;
    self->_currentToolViewConstraints = 0;

    -[PUPhotoEditViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsUpdateConstraints");

  }
  -[PUPhotoEditViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

  -[PUPhotoEditViewController _clearBadgeConstraints](self, "_clearBadgeConstraints");
  if (v3)
    -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 1);
}

- (void)_updateModelDependentControlsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  PUPhotoEditToolbarButton *redEyeButton;
  int v7;

  v3 = a3;
  if (!-[PUPhotoEditToolController isActivelyAdjusting](self->_currentEditingTool, "isActivelyAdjusting"))
  {
    -[PUPhotoEditViewController _updateMainActionButtonAnimated:](self, "_updateMainActionButtonAnimated:", v3);
    -[PUPhotoEditViewController _updateShowOriginalButtonAnimated:](self, "_updateShowOriginalButtonAnimated:", v3);
  }
  -[PUPhotoEditViewController _updatePreviewingOriginal](self, "_updatePreviewingOriginal");
  -[PUPhotoEditViewController _updateKeyCommands](self, "_updateKeyCommands");
  v5 = -[PUPhotoEditViewController _shouldDisplayRedEyeTool](self, "_shouldDisplayRedEyeTool");
  redEyeButton = self->_redEyeButton;
  if (redEyeButton)
    v7 = -[PUPhotoEditToolbarButton isHidden](redEyeButton, "isHidden") ^ 1;
  else
    v7 = 0;
  if (v7 != v5)
    -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 1);
}

- (BOOL)_canCurrentCompositionControllerBeReverted
{
  void *v3;
  BOOL v4;

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPhotoEditViewController _canCompositionControllerBeReverted:](self, "_canCompositionControllerBeReverted:", v3)|| -[PUPhotoEditViewController workImageVersion](self, "workImageVersion") != 1;

  return v4;
}

- (BOOL)_canCompositionControllerBeReverted:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (objc_class *)MEMORY[0x1E0D71180];
  v5 = a3;
  v6 = [v4 alloc];
  -[PUPhotoEditViewController originalComposition](self, "originalComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithComposition:", v7);

  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullSizeImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithMediaURL:timeZoneLookup:", v10, 0);
  else
    v11 = 0;
  v12 = (void *)MEMORY[0x1E0D7CB58];
  -[PUPhotoEditViewController photo](self, "photo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v8, v5, objc_msgSend(v13, "isLivePhoto"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "composition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "isEqual:visualChangesOnly:", v15, 1);

  return v16 ^ 1;
}

- (void)_updateMainActionButtonAnimated:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  char v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD *);
  void *v33;
  PUPhotoEditViewController *v34;
  id v35;
  __CFString *v36;
  id v37;
  id v38;
  id v39;

  v4 = -[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges", a3);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "alwaysShowDoneButton");

  v7 = v6 | v4;
  -[PUPhotoEditViewController photo](self, "photo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isAdjusted"))
  {
    v9 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");

    if (v9 == 1
      && -[PUPhotoEditViewController _canCurrentCompositionControllerBeReverted](self, "_canCurrentCompositionControllerBeReverted"))
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (-[PUPhotoEditViewController workImageVersion](self, "workImageVersion") == 1)
    v10 = 1;
  else
    v10 = !-[PUPhotoEditViewController _isReadyToRender](self, "_isReadyToRender");
LABEL_9:
  v11 = v7 | v10;
  v12 = 1;
  if (!self->_stashedSnapshot)
    v12 = 2;
  if (v11)
    v13 = 1;
  else
    v13 = v12;
  if (v13 != self->_mainButtonAction)
  {
    self->_mainButtonAction = v13;
    if (v13 == 2)
    {
      PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_REVERT_OR_ICON"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_REVERT_ACCESSIBILITY"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkRedColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("arrow.uturn.down");
    }
    else
    {
      PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_DONE_OR_ICON"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("PHOTOEDIT_TOOLBAR_DONE_ACCESSIBILITY"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v18 = CFSTR("checkmark");
    }
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __61__PUPhotoEditViewController__updateMainActionButtonAnimated___block_invoke;
    v33 = &unk_1E58A45E8;
    v34 = self;
    v35 = v14;
    v36 = (__CFString *)v18;
    v37 = v17;
    v38 = v15;
    v39 = v16;
    v20 = v16;
    v21 = v15;
    v22 = v17;
    v23 = v14;
    objc_msgSend(v19, "performWithoutAnimation:", &v30);

  }
  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader", v30, v31, v32, v33, v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "resourcesAvailability");

  if (self->_mainButtonAction == 1)
  {
    if (v25 == 3)
      v26 = v7;
    else
      v26 = 1;
    if ((v26 & 1) != 0)
    {
      if (v25 != 3)
        goto LABEL_32;
    }
    else if (!self->_stashedSnapshot)
    {
LABEL_32:
      v29 = 0;
      goto LABEL_33;
    }
    if (-[PUPhotoEditViewController shouldBePreviewingOriginal](self, "shouldBePreviewingOriginal"))
    {
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "previewOriginalTimesOut");

      if ((v28 & 1) == 0)
        goto LABEL_32;
    }
  }
  else if (v25 != 3)
  {
    goto LABEL_32;
  }
  v29 = self->_progressEventBlockingView == 0;
LABEL_33:
  -[UIButton setEnabled:](self->_mainActionButton, "setEnabled:", v29);
  -[PUPhotoEditViewController updateMainButtonForSaveAsNewClipMenu](self, "updateMainButtonForSaveAsNewClipMenu");
}

- (void)_updateCancelButtonAnimated:(BOOL)a3
{
  -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", -[PUPhotoEditViewController isRevertingToOriginal](self, "isRevertingToOriginal", a3) ^ 1);
}

- (void)_updateUndoRedoButtonsAnimated:(BOOL)a3
{
  id v4;

  -[PUPhotoEditViewController undoManager](self, "undoManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setEnabled:](self->_undoButton, "setEnabled:", objc_msgSend(v4, "canUndo"));
  -[PUPhotoEditToolbarButton setEnabled:](self->_redoButton, "setEnabled:", objc_msgSend(v4, "canRedo"));

}

- (void)_updateSemStylesDebugButtonAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  PUPhotoEditToolbarButton *semStylesDebugButton;
  void *v8;
  id v9;

  -[PUPhotoEditToolbarButton setEnabled:](self->_semStylesDebugButton, "setEnabled:", 1);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semanticStyleAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enabled");

  semStylesDebugButton = self->_semStylesDebugButton;
  if (v6)
    objc_msgSend(v9, "photoEditingToolbarMainButtonColor");
  else
    objc_msgSend(v9, "photoEditingToolbarButtonColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setTintColor:](semStylesDebugButton, "setTintColor:", v8);

}

- (void)_updateMoreButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  _BOOL8 v7;

  v3 = a3;
  v5 = -[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing");
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "editMenuEnabled") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = -[PUEditPluginSession isAvailable](self->_pluginSession, "isAvailable");
    if (v7 && !v5)
      v7 = -[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia") ^ 1;
  }

  -[PUPhotoEditToolbarButton setEnabled:](self->_moreButton, "setEnabled:", v7);
  if (v7)
    -[PUPhotoEditViewController configureEnablenessOfControlButton:animated:canVisuallyDisable:](self, "configureEnablenessOfControlButton:animated:canVisuallyDisable:", self->_moreButton, v3, 1);
}

- (void)_updateShowOriginalButtonAnimated:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  int64_t v6;

  if (self->_showOriginalButton)
  {
    v4 = -[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges", a3);
    -[PUPhotoEditViewController photo](self, "photo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isAdjusted"))
    {
      v6 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");

      if (v6 == 1
        && -[PUPhotoEditViewController _canCurrentCompositionControllerBeReverted](self, "_canCurrentCompositionControllerBeReverted"))
      {
        v4 = 1;
LABEL_10:
        -[PUPhotoEditToolbarButton setEnabled:](self->_showOriginalButton, "setEnabled:", v4);
        return;
      }
    }
    else
    {

    }
    if (-[PUPhotoEditViewController workImageVersion](self, "workImageVersion") != 1)
      v4 = -[PUPhotoEditViewController _isReadyToRender](self, "_isReadyToRender") | v4;
    goto LABEL_10;
  }
}

- (void)_updateMediaViewLayoutWithCoordinator:(id)a3 layoutOrientation:(int64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__PUPhotoEditViewController__updateMediaViewLayoutWithCoordinator_layoutOrientation___block_invoke;
  v4[3] = &unk_1E58A7A08;
  v4[4] = self;
  objc_msgSend(a3, "animateAlongsideTransition:completion:", v4, 0);
}

- (void)_updateMediaViewEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[PUPhotoEditViewController mediaViewEdgeInsetsUpdateDisableCount](self, "mediaViewEdgeInsetsUpdateDisableCount") <= 0)
  {
    -[NUMediaView edgeInsets](self->_mediaView, "edgeInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PUPhotoEditViewController _mediaViewEdgeInsets](self, "_mediaViewEdgeInsets");
    -[NUMediaView setEdgeInsets:](self->_mediaView, "setEdgeInsets:");
    -[NUMediaView edgeInsets](self->_mediaView, "edgeInsets");
    v15 = v6 == v14 && v4 == v11;
    v16 = v15 && v10 == v13;
    if (!v16 || v8 != v12)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "mediaViewInsetsUpdated");
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v20);
      }

    }
  }
}

- (UIEdgeInsets)_currentToolPreviewInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  PUPhotoEditToolController *v8;
  PUPhotoEditToolController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v7 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  v8 = self->_currentEditingTool;
  v9 = v8;
  v10 = v6;
  v11 = v5;
  v12 = v4;
  v13 = v3;
  if (v8)
  {
    -[PUPhotoEditToolController preferredPreviewViewInsets](v8, "preferredPreviewViewInsets");
    v13 = v14;
    v12 = v15;
    v11 = v16;
    v10 = v17;
  }
  if (v12 == v4 && v13 == v3 && v10 == v6 && v11 == v5)
  {
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "currentLayoutStyle");

    if (v22 == 4)
    {
      v10 = dbl_1AB0EF390[v7 == 1];
      v12 = v10;
    }
    else if (v7 == 1)
    {
      v11 = 141.0;
    }
    else
    {
      v10 = 165.0;
      v12 = 165.0;
    }
  }

  v23 = v13;
  v24 = v12;
  v25 = v11;
  v26 = v10;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (UIEdgeInsets)_mediaViewEdgeInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController _mediaViewEdgeInsetsWithGeometry:](self, "_mediaViewEdgeInsetsWithGeometry:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_mediaViewEdgeInsetsWithGeometry:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  PUPhotoEditViewControllerSpec *photoEditSpec;
  int64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  double MinX;
  BOOL v68;
  double v69;
  double MaxX;
  BOOL v71;
  double MinY;
  double MaxY;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  double rect;
  double v87;
  double v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  UIEdgeInsets result;

  v4 = a3;
  if (-[PUPhotoEditViewController _shouldUseCropPlaceholderViewFrame](self, "_shouldUseCropPlaceholderViewFrame"))
  {
    -[PUPhotoEditViewController lastKnownPreviewImageSize](self, "lastKnownPreviewImageSize");
    -[PUPhotoEditViewController _cropPlaceholderViewFrameForImageSize:](self, "_cropPlaceholderViewFrameForImageSize:");
    -[PUPhotoEditViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    PXEdgeInsetsBetweenRects();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    goto LABEL_31;
  }
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutReferenceSize");
  v16 = v15;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutReferenceSize");
  v19 = v18;

  photoEditSpec = self->_photoEditSpec;
  if (v16 >= v19)
    -[PUPhotoEditViewControllerSpec previewViewInsetsLandscape](photoEditSpec, "previewViewInsetsLandscape");
  else
    -[PUPhotoEditViewControllerSpec previewViewInsetsPortrait](photoEditSpec, "previewViewInsetsPortrait");
  v21 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditLayoutSupport topToolbarVerticalOffsetForLayoutOrientation:view:](PUPhotoEditLayoutSupport, "topToolbarVerticalOffsetForLayoutOrientation:view:", v21, v22);

  -[PUPhotoEditViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaInsets");

  -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditViewController _currentToolPreviewInsets](self, "_currentToolPreviewInsets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (self->_currentEditingTool == &self->_cropController->super)
  {
    v31 = v24;
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "currentLayoutStyle");

    v34 = v30;
    v35 = v28;
    v36 = v26;
    if (-[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") == 1)
    {
      v36 = *MEMORY[0x1E0DC49E8];
      v35 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v34 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v31 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    if (-[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation") != 1 || v33 == 4)
    {
      -[PUPhotoEditToolController view](self->_currentEditingTool, "view");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "frame");
      v38 = v36 + v83;

      -[PUPhotoEditToolController view](self->_currentEditingTool, "view");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "frame");
      v40 = v35 + v85;

      goto LABEL_13;
    }
  }
  else
  {
    UIEdgeInsetsAdd();
    UIEdgeInsetsAdd();
    -[PUPhotoEditToolController additionalPreviewViewInsets](self->_currentEditingTool, "additionalPreviewViewInsets");
  }
  UIEdgeInsetsAdd();
  v38 = v37;
  v40 = v39;
  v34 = v41;
  v31 = v42;
LABEL_13:
  if (!-[PUPhotoEditToolController handlesMediaViewInsets](self->_currentEditingTool, "handlesMediaViewInsets"))
  {
    -[PUPhotoEditViewController mediaView](self, "mediaView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v45 = v44;
    v47 = v46;
    v87 = v49;
    v88 = v48;

    objc_msgSend(v4, "size");
    NUPixelSizeToCGSize();
    if (*MEMORY[0x1E0C9D820] == v51 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v50)
    {
      -[PUPhotoEditViewController lastKnownPreviewImageSize](self, "lastKnownPreviewImageSize");
    }
    else
    {
      objc_msgSend(v4, "size");
      NUPixelSizeToCGSize();
    }
    v54 = v52;
    v55 = v53;
    if (v52 < 1.0 || v53 < 1.0)
    {
      -[PUPhotoEditViewController photo](self, "photo");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (double)(unint64_t)objc_msgSend(v56, "pixelWidth");

      -[PUPhotoEditViewController photo](self, "photo");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (double)(unint64_t)objc_msgSend(v57, "pixelHeight");

    }
    if (v54 >= 1.0 && v55 >= 1.0)
    {
      v58 = v34 + v38;
      rect = v38 + v47;
      v59 = v88 - (v31 + v40);
      v60 = v87 - v58;
      PFSizeWithAspectRatioFittingSize();
      v61 = v40 + v45;
      v62 = v59;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      x = v89.origin.x;
      y = v89.origin.y;
      width = v89.size.width;
      height = v89.size.height;
      MinX = CGRectGetMinX(v89);
      v90.origin.y = rect;
      v90.origin.x = v61;
      v90.size.width = v62;
      v90.size.height = v60;
      v68 = MinX < CGRectGetMinX(v90);
      v69 = v61;
      if (!v68)
      {
        v91.origin.x = x;
        v91.origin.y = y;
        v91.size.width = width;
        v91.size.height = height;
        MaxX = CGRectGetMaxX(v91);
        v92.origin.x = v61;
        v92.origin.y = rect;
        v92.size.width = v62;
        v92.size.height = v60;
        v71 = MaxX <= CGRectGetMaxX(v92);
        v69 = x;
        if (!v71)
        {
          v93.origin.x = v61;
          v93.origin.y = rect;
          v93.size.width = v62;
          v93.size.height = v60;
          v69 = CGRectGetMaxX(v93) - width;
        }
      }
      v94.origin.x = v69;
      v94.origin.y = y;
      v94.size.width = width;
      v94.size.height = height;
      MinY = CGRectGetMinY(v94);
      v95.origin.x = v61;
      v95.origin.y = rect;
      v95.size.width = v62;
      v95.size.height = v60;
      if (MinY >= CGRectGetMinY(v95))
      {
        v96.origin.x = v69;
        v96.origin.y = y;
        v96.size.width = width;
        v96.size.height = height;
        MaxY = CGRectGetMaxY(v96);
        v97.origin.x = v61;
        v97.origin.y = rect;
        v97.size.width = v62;
        v97.size.height = v60;
        if (MaxY > CGRectGetMaxY(v97))
        {
          v98.origin.x = v61;
          v98.origin.y = rect;
          v98.size.width = v62;
          v98.size.height = v60;
          CGRectGetMaxY(v98);
        }
      }
      PXEdgeInsetsBetweenRects();
      v38 = v74;
      v40 = v75;
      v34 = v76;
      v31 = v77;
    }
  }
  v7 = floor(v38);
  v9 = floor(v40);
  v11 = floor(v34);
  v13 = floor(v31);
LABEL_31:

  v78 = v7;
  v79 = v9;
  v80 = v11;
  v81 = v13;
  result.right = v81;
  result.bottom = v80;
  result.left = v79;
  result.top = v78;
  return result;
}

- (void)_showProgressIndicator
{
  PUProgressIndicatorView *v3;
  PUProgressIndicatorView *progressIndicatorView;
  NSObject *v5;
  double v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 5);
  progressIndicatorView = self->_progressIndicatorView;
  self->_progressIndicatorView = v3;

  -[PUProgressIndicatorView setShowsBackground:](self->_progressIndicatorView, "setShowsBackground:", 1);
  -[PUProgressIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "Will show progress indicator.", v9, 2u);
  }

  -[PUProgressIndicatorView defaultProgressIndicatorDelay](self->_progressIndicatorView, "defaultProgressIndicatorDelay");
  if (self->_inProgressSaveIsDeferredRender)
  {
    v6 = v6 * 3.0;
  }
  else if (self->_inProgressSaveIsFromSwipe)
  {
    v6 = v6 / 3.0;
  }
  -[PUProgressIndicatorView beginShowingProgressWithDelay:animated:](self->_progressIndicatorView, "beginShowingProgressWithDelay:animated:", 1, v6);
  -[PUPhotoEditViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_progressIndicatorView);

  -[PUPhotoEditViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
  -[PUPhotoEditViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsUpdateConstraints");

}

- (void)_hideProgressIndicatorImmediately:(BOOL)a3
{
  _BOOL8 v3;
  PUProgressIndicatorView *v5;
  PUProgressIndicatorView *progressIndicatorView;
  NSArray *progressIndicatorViewConstraints;
  NSObject *v8;
  _QWORD v9[4];
  PUProgressIndicatorView *v10;
  uint8_t buf[16];

  v3 = a3;
  v5 = self->_progressIndicatorView;
  progressIndicatorView = self->_progressIndicatorView;
  self->_progressIndicatorView = 0;

  progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
  self->_progressIndicatorViewConstraints = 0;

  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "Will hide progress indicator.", buf, 2u);
  }

  if (-[PUProgressIndicatorView isShowingProgress](v5, "isShowingProgress"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__PUPhotoEditViewController__hideProgressIndicatorImmediately___block_invoke;
    v9[3] = &unk_1E58ABD10;
    v10 = v5;
    -[PUProgressIndicatorView endShowingProgressImmediately:animated:withCompletionHandler:](v10, "endShowingProgressImmediately:animated:withCompletionHandler:", v3, 1, v9);

  }
  -[PUPhotoEditViewController _didEndEnterEdit](self, "_didEndEnterEdit");

}

- (void)_updateProgressIndicatorInteractionDisabledWithReason:(int64_t)a3 showsIndicator:(BOOL)a4 isSavingWithProgress:(BOOL)a5
{
  _BOOL4 v5;
  id progressIndicatorInteractionDisablingToken;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  UIView *v15;
  UIView *progressEventBlockingView;
  void *v17;
  void *progressEventBlockingViewConstraints;
  void *v19;
  UIView *v20;
  UIView *v21;
  int v22;
  int v23;
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  progressIndicatorInteractionDisablingToken = self->_progressIndicatorInteractionDisablingToken;
  if (a3)
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (progressIndicatorInteractionDisablingToken)
    {
      if (v10)
      {
        v22 = 67109120;
        v23 = a3;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "Interaction still disabled for reason: %d", (uint8_t *)&v22, 8u);
      }
    }
    else
    {
      if (v10)
      {
        v22 = 67109120;
        v23 = a3;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "Disabling user interaction for photo edit progress indicator for reason: %d", (uint8_t *)&v22, 8u);
      }

      +[PUInterfaceManager beginDisablingUserInteractionForReason:withExpectedTimeout:](PUInterfaceManager, "beginDisablingUserInteractionForReason:withExpectedTimeout:", a3, 180.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_progressIndicatorInteractionDisablingToken;
      self->_progressIndicatorInteractionDisablingToken = v19;
    }

  }
  else
  {
    v11 = a5;
    if (progressIndicatorInteractionDisablingToken)
    {
      PLPhotoEditGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_INFO, "Re-enabling user interaction for photo edit progress indicator.", (uint8_t *)&v22, 2u);
      }

      +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:", self->_progressIndicatorInteractionDisablingToken);
      v13 = self->_progressIndicatorInteractionDisablingToken;
      self->_progressIndicatorInteractionDisablingToken = 0;

    }
    if (v5 && v11)
    {
      if (self->_progressEventBlockingView)
        return;
      v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v15 = (UIView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      progressEventBlockingView = self->_progressEventBlockingView;
      self->_progressEventBlockingView = v15;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressEventBlockingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PUPhotoEditViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertSubview:belowSubview:", self->_progressEventBlockingView, self->_progressIndicatorView);

      -[PUPhotoEditViewController _updateProgressEventBlockingViewConstraints](self, "_updateProgressEventBlockingViewConstraints");
      -[PUPhotoEditViewController view](self, "view");
      progressEventBlockingViewConstraints = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(progressEventBlockingViewConstraints, "setNeedsLayout");
      goto LABEL_20;
    }
  }
  if (!v5)
  {
    v20 = self->_progressEventBlockingView;
    if (v20)
    {
      -[UIView removeFromSuperview](v20, "removeFromSuperview");
      v21 = self->_progressEventBlockingView;
      self->_progressEventBlockingView = 0;

      progressEventBlockingViewConstraints = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = 0;
LABEL_20:

      -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
    }
  }
}

- (id)debugStringDescribingProgressReasons:(unint64_t)a3
{
  __int16 v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "checkingForDownload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "downloadingResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "autocalculators");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "autoEnhanceCalculations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "transitioningToAutoCalculators");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "reverting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "cachingVideo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "waitingToDismiss");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v15);

  if ((v3 & 0x100) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "burningTrim");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

    if ((v3 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "loadingCrop");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  if ((v3 & 0x200) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "saving");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
LABEL_13:
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateProgressIndicatorAnimated:(BOOL)a3
{
  char v4;
  void *v5;
  BOOL v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  PUProgressIndicatorView *progressIndicatorView;
  void *v30;
  PUProgressIndicatorView *v31;
  uint64_t v32;
  _BOOL4 v33;
  const __CFString *v34;
  const __CFString *v35;
  __CFString *v36;
  void *v37;
  NSObject *v38;
  int v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (-[PUPhotoEditViewController _isWaitingForAssetChange](self, "_isWaitingForAssetChange", a3))
  {
    v4 = 0x80;
  }
  else if (-[PUPhotoEditViewController _isWaitingForSaveCompletion](self, "_isWaitingForSaveCompletion"))
  {
    v4 = 0x80;
  }
  else
  {
    v4 = 0;
  }
  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resourcesAvailability") == 1;

  v7 = v4 | v6;
  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "resourcesAvailability");

  if (v9 == 2)
    v10 = v7 | 2;
  else
    v10 = v7;
  if (-[PUPhotoEditViewController isRevertingToOriginal](self, "isRevertingToOriginal"))
    v10 |= 0x20u;
  v11 = v10 & 0xA3;
  if (-[PEAutoAdjustmentController isBusy](self->_autoEnhanceController, "isBusy"))
    v12 = 8;
  else
    v12 = 0;
  v13 = -[PUPhotoEditViewController isCachingVideo](self, "isCachingVideo");
  v14 = 64;
  if (!v13)
    v14 = 0;
  v15 = v12 | v11 | v14;
  v16 = -[PUPhotoEditViewController isRunningAutoCalculators](self, "isRunningAutoCalculators");
  v17 = 4;
  if (!v16)
    v17 = 0;
  v18 = v15 | v17 | (16 * self->_isTransitioningFromDownloadingToRunningAutoCalculators);
  if (-[PUPhotoEditViewController burningInTrim](self, "burningInTrim"))
    v19 = 512;
  else
    v19 = 0;
  v20 = -[PUPhotoEditViewController _isSaveProgressAvailable](self, "_isSaveProgressAvailable");
  v21 = 1024;
  if (!v20)
    v21 = 0;
  v22 = v18 | v19 | v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[PUPhotoEditToolController imageLoadingInProgress](self->_currentEditingTool, "imageLoadingInProgress"))
  {
    v23 = v22 & 0xFFFFFFFFFFFFFEFFLL;
    if ((v22 & 0x200) != 0)
      goto LABEL_26;
LABEL_28:
    if ((v23 & 0x403) != 0)
    {
      v24 = 0;
    }
    else if ((v23 & 0x20) != 0)
    {
      v24 = 12;
    }
    else if ((v23 & 0x80) != 0)
    {
      v24 = 13;
    }
    else if ((v23 & 8) != 0)
    {
      v24 = 14;
    }
    else
    {
      v24 = ((uint64_t)(v23 << 55) >> 63) & 0xF;
    }
    goto LABEL_37;
  }
  v23 = v22 | 0x100;
  if ((v22 & 0x200) == 0)
    goto LABEL_28;
LABEL_26:
  v24 = 16;
LABEL_37:
  if (-[PUPhotoEditViewController px_isVisible](self, "px_isVisible"))
    v25 = (v23 & 0x7EB) != 0 || (v23 & 0x14) == 4;
  else
    v25 = 0;
  if (self->_currentProgressReasons == v23)
    goto LABEL_51;
  self->_currentProgressReasons = v23;
  PLPhotoEditGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
  if (!v23)
  {
    if (v27)
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_INFO, "No more reasons for showing progress", (uint8_t *)&v39, 2u);
    }

LABEL_51:
    if (v25)
      goto LABEL_52;
    goto LABEL_57;
  }
  if (v25)
  {
    if (v27)
    {
      -[PUPhotoEditViewController debugStringDescribingProgressReasons:](self, "debugStringDescribingProgressReasons:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412290;
      v40 = v28;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_INFO, "Showing progress for the reasons: %@", (uint8_t *)&v39, 0xCu);

    }
LABEL_52:
    if (!self->_progressIndicatorView)
    {
      -[PUPhotoEditViewController _showProgressIndicator](self, "_showProgressIndicator");
      LODWORD(progressIndicatorView) = 1;
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  if (v27)
  {
    -[PUPhotoEditViewController debugStringDescribingProgressReasons:](self, "debugStringDescribingProgressReasons:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412290;
    v40 = v30;
    _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_INFO, "Not showing progress but operations are ongoing: %@", (uint8_t *)&v39, 0xCu);

  }
LABEL_57:
  progressIndicatorView = self->_progressIndicatorView;
  if (!progressIndicatorView)
    goto LABEL_60;
  -[PUPhotoEditViewController _hideProgressIndicatorImmediately:](self, "_hideProgressIndicatorImmediately:", 0);
LABEL_59:
  LODWORD(progressIndicatorView) = 0;
LABEL_60:
  v31 = self->_progressIndicatorView;
  if (!v31)
    goto LABEL_87;
  v32 = (~(_WORD)v23 & 0x480) == 0 || (v23 & 0x23) != 0;
  if (((v32 | progressIndicatorView) & 1) == 0)
  {
    v32 = -[PUProgressIndicatorView isDeterminate](v31, "isDeterminate");
    v31 = self->_progressIndicatorView;
  }
  -[PUProgressIndicatorView setDeterminate:](v31, "setDeterminate:", v32);
  v33 = -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo");
  if ((v23 & 1) != 0)
  {
    v36 = CFSTR("PHOTOEDIT_PROGRESS_CHECKING_RESOURCE_PHOTO");
LABEL_81:
    PULocalizedString(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_82;
  }
  if ((v23 & 2) != 0)
  {
    v36 = CFSTR("PHOTOEDIT_PROGRESS_DOWNLOADING_PHOTO");
    goto LABEL_81;
  }
  if ((v23 & 0x2A0) != 0)
  {
    v34 = CFSTR("PHOTOEDIT_PROGRESS_SAVING_PHOTO");
    v35 = CFSTR("PHOTOEDIT_PROGRESS_SAVING_VIDEO");
    goto LABEL_78;
  }
  if ((v23 & 8) != 0)
  {
    v34 = CFSTR("PHOTOEDIT_PROGRESS_AUTOENHANCING_PHOTO");
    v35 = CFSTR("PHOTOEDIT_PROGRESS_AUTOENHANCING_VIDEO");
    goto LABEL_78;
  }
  if ((v23 & 0x40) != 0)
  {
    v36 = CFSTR("PHOTOEDIT_PROGRESS_PREPARING_VIDEO");
    goto LABEL_81;
  }
  if ((v23 & 4) != 0)
  {
    v34 = CFSTR("PHOTOEDIT_PROGRESS_LOADING_PHOTO_ADJUSTMENTS");
    v35 = CFSTR("PHOTOEDIT_PROGRESS_LOADING_VIDEO_ADJUSTMENTS");
LABEL_78:
    if (v33)
      v36 = (__CFString *)v35;
    else
      v36 = (__CFString *)v34;
    goto LABEL_81;
  }
  if ((v23 & 0x100) != 0)
  {
    v36 = CFSTR("PHOTOEDIT_PROGRESS_CROP_RENDERING");
    goto LABEL_81;
  }
  v37 = 0;
LABEL_82:
  PLPhotoEditGetLog();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = 138543362;
    v40 = v37;
    _os_log_impl(&dword_1AAB61000, v38, OS_LOG_TYPE_INFO, "Progress indicator message: %{public}@", (uint8_t *)&v39, 0xCu);
  }

  if (v37)
    -[PUProgressIndicatorView setLocalizedMessage:](self->_progressIndicatorView, "setLocalizedMessage:", v37);

LABEL_87:
  -[PUPhotoEditViewController _updateProgressIndicatorInteractionDisabledWithReason:showsIndicator:isSavingWithProgress:](self, "_updateProgressIndicatorInteractionDisabledWithReason:showsIndicator:isSavingWithProgress:", v24, v25, (v23 >> 10) & 1);
}

- (void)_updatePlaceholderImage
{
  void *v3;
  UIImageView *placeholderImageView;
  uint64_t v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PXImageLayerModulator *placeholderImageLayerModulator;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  -[PUPhotoEditViewController placeholderImage](self, "placeholderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    placeholderImageView = self->_placeholderImageView;
    v5 = MEMORY[0x1E0C809B0];
    if (!placeholderImageView)
    {
      v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v3);
      v7 = self->_placeholderImageView;
      self->_placeholderImageView = v6;

      -[UIImageView setContentMode:](self->_placeholderImageView, "setContentMode:", 1);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_placeholderImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setPreferredImageDynamicRange:](self->_placeholderImageView, "setPreferredImageDynamicRange:", 2);
      self->_placeholderImageViewTransitioningOut = 0;
      -[PUPhotoEditViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_placeholderImageView);

      v9 = (void *)MEMORY[0x1E0D7B500];
      -[PUPhotoEditViewController photo](self, "photo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "optionsForAsset:", v10);
      v13 = v12;

      -[PUPhotoEditViewController px_imageModulationManager](self, "px_imageModulationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "checkoutImageLayerModulatorWithOptions:", v11, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke;
      v21[3] = &unk_1E58A9E78;
      v21[4] = self;
      objc_msgSend(v15, "performChanges:", v21);
      placeholderImageLayerModulator = self->_placeholderImageLayerModulator;
      self->_placeholderImageLayerModulator = (PXImageLayerModulator *)v15;
      v17 = v15;

      placeholderImageView = self->_placeholderImageView;
    }
    -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
    -[UIImageView setFrame:](placeholderImageView, "setFrame:");
    -[UIImageView setHidden:](self->_placeholderImageView, "setHidden:", 0);
    -[PUPhotoEditViewController placeholderImageLayerModulator](self, "placeholderImageLayerModulator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke_2;
    v20[3] = &unk_1E58A9E78;
    v20[4] = self;
    objc_msgSend(v18, "performChanges:", v20);

    -[PUPhotoEditViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
  }
  -[PUPhotoEditMediaToolController trimController](self->_mediaToolController, "trimController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPlaceholderImage:", v3);

}

- (void)_updateSubviewsOrdering
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PUPhotoEditViewController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", self->_mediaView);
  objc_msgSend(v10, "bringSubviewToFront:", self->_placeholderImageView);
  if (-[PUPhotoEditToolController shouldHideMediaView](self->_currentEditingTool, "shouldHideMediaView"))
  {
    -[UIViewController view](self->_currentTool, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", v3);

  }
  if (self->_mainToolbarShadow)
    objc_msgSend(v10, "bringSubviewToFront:");
  if (self->_secondaryToolbarShadow)
    objc_msgSend(v10, "bringSubviewToFront:");
  if (!-[PUPhotoEditToolController shouldHideMediaView](self->_currentEditingTool, "shouldHideMediaView"))
  {
    -[UIViewController view](self->_currentTool, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", v4);

  }
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", v5);

  -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", v6);

  objc_msgSend(v10, "bringSubviewToFront:", self->_transientStatusBadge);
  objc_msgSend(v10, "bringSubviewToFront:", self->_assetTypeBadge);
  objc_msgSend(v10, "bringSubviewToFront:", self->_mainToolbar);
  objc_msgSend(v10, "bringSubviewToFront:", self->_secondaryToolbar);
  if (-[PUPhotoEditViewController _isInEditRevertTransitionSnapshotVisible](self, "_isInEditRevertTransitionSnapshotVisible"))
  {
    -[PUPhotoEditViewController inEditRevertTransitionSnapshot](self, "inEditRevertTransitionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", v7);

  }
  objc_msgSend(v10, "bringSubviewToFront:", self->_progressEventBlockingView);
  objc_msgSend(v10, "bringSubviewToFront:", self->_progressIndicatorView);
  -[PUPhotoEditViewController perfHUD](self, "perfHUD");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", v8);

  -[PUPhotoEditViewController sceneHUD](self, "sceneHUD");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", v9);

}

- (void)_updateLayoutOrientationWithViewSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v13;
  id v14;

  height = a3.height;
  width = a3.width;
  v14 = a4;
  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentLayoutStyle");

  -[PUPhotoEditViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (width > height && v10 == 0 || v8 == 4)
    v13 = 2;
  else
    v13 = 1;
  -[PUPhotoEditViewController setLayoutOrientation:withTransitionCoordinator:](self, "setLayoutOrientation:withTransitionCoordinator:", v13, v14);

}

- (BOOL)_shouldDisplayRedEyeTool
{
  BOOL v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = -[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo")
    || -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo");
  -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v4 && !v3)
  {
    -[PUPhotoEditViewController imageProperties](self, "imageProperties");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = (void *)v6,
          v8 = (void *)MEMORY[0x1E0D7CB58],
          -[PUPhotoEditViewController imageProperties](self, "imageProperties"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v8) = objc_msgSend(v8, "photoWasTakenWithoutFlashWithImageProperties:", v9),
          v9,
          v7,
          (_DWORD)v8))
    {
      -[PUPhotoEditViewController compositionController](self, "compositionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "redEyeAdjustmentController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasCorrections");

      if (!v12)
        return 0;
    }
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "playbackStyle");

    if (v14 != 5)
    {
      -[PUPhotoEditViewController photo](self, "photo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v15, "playbackVariation") != 3;

    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (BOOL)shouldEnableImageModulation
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend(MEMORY[0x1E0D52108], "renderMeteorPlusAsHDR"))
    return 1;
  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "mediaSubtypes") & 0x200) == 0;

  return v4;
}

- (void)_updateLayerModulation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  if (-[PUPhotoEditViewController shouldEnableImageModulation](self, "shouldEnableImageModulation"))
  {
    v3 = (void *)MEMORY[0x1E0D7B500];
    -[PUPhotoEditViewController photo](self, "photo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "optionsForAsset:", v4);
    v7 = v6;

    -[PUPhotoEditViewController imageLayerModulator](self, "imageLayerModulator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PUPhotoEditViewController px_imageModulationManager](self, "px_imageModulationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "checkoutImageLayerModulatorWithOptions:", v5, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController setImageLayerModulator:](self, "setImageLayerModulator:", v10);

    }
    -[PUPhotoEditViewController imageLayerModulator](self, "imageLayerModulator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__PUPhotoEditViewController__updateLayerModulation__block_invoke;
    v18[3] = &unk_1E58A9E78;
    v18[4] = self;
    objc_msgSend(v11, "performChanges:", v18);

    -[PUPhotoEditViewController px_imageModulationManager](self, "px_imageModulationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController livePhotoViewModulator](self, "livePhotoViewModulator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "checkInLivePhotoViewModulator:", v14);

    -[PUPhotoEditViewController px_imageModulationManager](self, "px_imageModulationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "checkoutLivePhotoViewModulatorWithOptions:", v5, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __51__PUPhotoEditViewController__updateLayerModulation__block_invoke_2;
    v17[3] = &unk_1E58A4610;
    v17[4] = self;
    objc_msgSend(v16, "performChanges:", v17);
    -[PUPhotoEditViewController setLivePhotoViewModulator:](self, "setLivePhotoViewModulator:", v16);

  }
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  id v5;

  if (objc_msgSend(a4, "layoutStyleChanged", a3))
  {
    -[PUPhotoEditViewController _updateSpecDependentUIPieces](self, "_updateSpecDependentUIPieces");
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolPickerController setParentSpec:](self->_toolPickerController, "setParentSpec:", v5);

  }
}

- (void)setShouldBePreviewingOriginal:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_shouldBePreviewingOriginal != a3)
  {
    v3 = a3;
    self->_shouldBePreviewingOriginal = a3;
    if (a3)
    {
      -[PUPhotoEditViewController _loadOriginalImageIfNeeded](self, "_loadOriginalImageIfNeeded");
      -[PUPhotoEditViewController _livePhotoGestureRecognizer](self, "_livePhotoGestureRecognizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pu_cancel");

    }
    -[PUPhotoEditViewController _updatePreviewingOriginal](self, "_updatePreviewingOriginal");
    -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUPhotoEditViewController _updateMainActionButtonAnimated:](self, "_updateMainActionButtonAnimated:", 0);
      -[PUPhotoEditViewController _updateShowOriginalButtonAnimated:](self, "_updateShowOriginalButtonAnimated:", 0);
    }
    if (v3)
    {
      -[PUPhotoEditViewController mediaView](self, "mediaView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pause");

      -[PUPhotoEditToolController previewingOriginalDidStart](self->_currentEditingTool, "previewingOriginalDidStart");
    }
    else
    {
      -[PUPhotoEditToolController previewingOriginalDidStop](self->_currentEditingTool, "previewingOriginalDidStop");
    }
  }
}

- (void)setPreviewRenderType:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD block[5];
  id v21;
  void (**v22)(_QWORD);
  _QWORD aBlock[5];
  _QWORD v24[5];
  _QWORD v25[6];
  char v26;

  if (self->_previewRenderType != a3)
  {
    self->_previewRenderType = a3;
    if (-[PUPhotoEditViewController _isPreviewingOriginal](self, "_isPreviewingOriginal"))
    {
      -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5
        && (v6 = (void *)v5,
            v7 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion"),
            v6,
            v7 != 1))
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke;
        v25[3] = &unk_1E58A4688;
        v25[4] = self;
        v25[5] = a3;
        v26 = 1;
        -[PUPhotoEditViewController asShotCompositionController:](self, "asShotCompositionController:", v25);
      }
      else
      {
        -[PUPhotoEditViewController photo](self, "photo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PUPhotoEditViewController photo](self, "photo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }

        if (+[PUPhotoEditSupport currentDeviceShouldAllowRawDecode](PUPhotoEditSupport, "currentDeviceShouldAllowRawDecode")&& objc_msgSend(v9, "shouldUseRAWResourceAsUnadjustedEditBase"))
        {
          objc_msgSend(MEMORY[0x1E0D71260], "pipelineFiltersForRAWShowingOriginalWithGeometry");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[PUPhotoEditViewController _defaultRenderPipelineFiltersForCurrentMode](self, "_defaultRenderPipelineFiltersForCurrentMode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D71260], "pipelineFiltersForShowingOriginalWithGeometry");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v16)
          -[NUMediaView setPipelineFilters:](self->_mediaView, "setPipelineFilters:", v16);
        -[PUPhotoEditViewController _updateMediaViewEdgeInsets](self, "_updateMediaViewEdgeInsets");
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_10;
        v24[3] = &unk_1E58ABD10;
        v24[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v24);

      }
    }
    else
    {
      v10 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_11;
      aBlock[3] = &unk_1E58ABD10;
      aBlock[4] = self;
      v11 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (-[PUPhotoEditViewController showOriginalCausedSizeChange](self, "showOriginalCausedSizeChange"))
      {
        -[PUPhotoEditViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "snapshotViewAfterScreenUpdates:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PUPhotoEditViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v13);

        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_12;
        block[3] = &unk_1E58ABAF0;
        v21 = v13;
        v22 = v11;
        block[4] = self;
        v15 = v13;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      else
      {
        v11[2](v11);
        v19[0] = v10;
        v19[1] = 3221225472;
        v19[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_16;
        v19[3] = &unk_1E58ABD10;
        v19[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v19);
      }

    }
  }
}

- (BOOL)_isPreviewingOriginal
{
  return (unint64_t)(-[PUPhotoEditViewController previewRenderType](self, "previewRenderType") - 1) < 2;
}

- (void)_updatePreviewingOriginal
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;

  if (-[PUPhotoEditViewController shouldBePreviewingOriginal](self, "shouldBePreviewingOriginal"))
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71660], "synchronousInputSizeForCompositionController:", v3);
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "cropAdjustmentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "cropAdjustmentController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isCropIdentityForImageSize:", v5, v7);

    }
    else
    {
      v10 = 1;
    }
    if (-[PUPhotoEditViewController workImageVersion](self, "workImageVersion") == 1)
      v12 = v10;
    else
      v12 = 1;
    if (v12)
      v11 = 1;
    else
      v11 = 2;
    -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setToggledOriginal:", 1);

  }
  else
  {
    v11 = 0;
  }
  -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[PUPhotoEditViewController setPreviewRenderType:](self, "setPreviewRenderType:", v11);
}

- (void)_updateTransientStatusBadgeForPreviewingOriginal
{
  _BOOL8 v3;
  int64_t v4;
  __CFString *v5;
  id v6;

  v3 = -[PUPhotoEditViewController _isPreviewingOriginal](self, "_isPreviewingOriginal");
  -[PUPhotoEditViewController _setTransientStatusBadgeVisible:](self, "_setTransientStatusBadgeVisible:", v3);
  if (v3)
  {
    v4 = -[PUPhotoEditViewController previewRenderType](self, "previewRenderType");
    if (v4 == 2)
    {
      v5 = CFSTR("PHOTOEDIT_PREVIEWING_CROPPED_ORIGINAL");
      goto LABEL_7;
    }
    if (v4 == 1)
    {
      v5 = CFSTR("PHOTOEDIT_PREVIEWING_ORIGINAL");
LABEL_7:
      PULocalizedString(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[CEKBadgeTextView _setText:](self->_transientStatusBadge, "_setText:", v6);

    }
  }
}

- (void)_setTransientStatusBadgeVisible:(BOOL)a3
{
  CEKBadgeTextView *transientStatusBadge;
  id v5;
  CEKBadgeTextView *v6;
  CEKBadgeTextView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CEKBadgeTextView *v13;
  NSArray *transientStatusBadgeConstraints;
  void *v15;

  transientStatusBadge = self->_transientStatusBadge;
  if (a3)
  {
    if (!transientStatusBadge)
    {
      v5 = objc_alloc(MEMORY[0x1E0D0D028]);
      v6 = (CEKBadgeTextView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v7 = self->_transientStatusBadge;
      self->_transientStatusBadge = v6;

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKBadgeTextView _setFillColor:](self->_transientStatusBadge, "_setFillColor:", v9);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorWithAlphaComponent:", 0.8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKBadgeTextView _setContentColor:](self->_transientStatusBadge, "_setContentColor:", v11);

      -[CEKBadgeTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_transientStatusBadge, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PUPhotoEditViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_transientStatusBadge);

      -[PUPhotoEditViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNeedsUpdateConstraints");

    }
  }
  else if (transientStatusBadge)
  {
    -[CEKBadgeTextView removeFromSuperview](transientStatusBadge, "removeFromSuperview");
    v13 = self->_transientStatusBadge;
    self->_transientStatusBadge = 0;

    transientStatusBadgeConstraints = self->_transientStatusBadgeConstraints;
    self->_transientStatusBadgeConstraints = 0;

  }
}

- (void)flashTransientBadgeWithText:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v6[6];
  _QWORD v7[5];

  v4 = a3;
  -[PUPhotoEditViewController _setTransientStatusBadgeVisible:](self, "_setTransientStatusBadgeVisible:", 1);
  -[CEKBadgeTextView _setText:](self->_transientStatusBadge, "_setText:", v4);

  -[CEKBadgeTextView setAlpha:](self->_transientStatusBadge, "setAlpha:", 0.0);
  -[CEKBadgeTextView invalidateIntrinsicContentSize](self->_transientStatusBadge, "invalidateIntrinsicContentSize");
  v5 = self->_transientStatusBadgeRequestID + 1;
  self->_transientStatusBadgeRequestID = v5;
  v6[5] = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke;
  v7[3] = &unk_1E58ABD10;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_2;
  v6[3] = &unk_1E58A46B0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.1);
}

- (double)transientBadgeWidthForText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0DC1138];
  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = *MEMORY[0x1E0DC4A90];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 0, v7, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v9 = v8;

  return v9;
}

- (void)_focusViewForInteractionWithDelay
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hideUIForInteractionEnabled");

  if ((v4 & 1) != 0 || self->_currentEditingTool == &self->_photoStylesToolController->super)
  {
    -[PUPhotoEditViewController focusViewForInteractionDelayTimer](self, "focusViewForInteractionDelayTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (-[PUPhotoEditToolController shouldObserveGenericFocusingViewForInteractionDelay](self->_currentEditingTool, "shouldObserveGenericFocusingViewForInteractionDelay")&& (+[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance"), v6 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "hideUIForInteractionFadeOutDelay"), v8 = v7, v6, v8 != 0.0))
      {
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateByAddingTimeInterval:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_alloc(MEMORY[0x1E0C99E88]);
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __62__PUPhotoEditViewController__focusViewForInteractionWithDelay__block_invoke;
        v17 = &unk_1E58A46D8;
        objc_copyWeak(&v18, &location);
        v12 = (void *)objc_msgSend(v11, "initWithFireDate:interval:repeats:block:", v10, 0, &v14, 1.0);
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v14, v15, v16, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTimer:forMode:", v12, *MEMORY[0x1E0C99860]);

        -[PUPhotoEditViewController setFocusViewForInteractionDelayTimer:](self, "setFocusViewForInteractionDelayTimer:", v12);
        objc_destroyWeak(&v18);

        objc_destroyWeak(&location);
      }
      else
      {
        -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 1);
      }
    }
  }
}

- (void)_cancelPendingFocusViewForInteractionWithDelay
{
  void *v3;

  -[PUPhotoEditViewController focusViewForInteractionDelayTimer](self, "focusViewForInteractionDelayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PUPhotoEditViewController setFocusViewForInteractionDelayTimer:](self, "setFocusViewForInteractionDelayTimer:", 0);
}

- (BOOL)isFocusingViewForInteraction
{
  return self->_focusingViewForInteraction;
}

- (void)setFocusingViewForInteraction:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int v14;
  _QWORD v15[6];
  char v16;
  BOOL v17;
  BOOL v18;

  v3 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hideUIForInteractionEnabled");

  if (((v6 & 1) != 0 || self->_currentEditingTool == &self->_photoStylesToolController->super)
    && (!v3
     || !UIAccessibilityIsVoiceOverRunning()
     || self->_currentEditingTool == &self->_photoStylesToolController->super)
    && self->_focusingViewForInteraction != v3)
  {
    self->_focusingViewForInteraction = v3;
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction");
    if (v8)
      objc_msgSend(v7, "hideUIForInteractionFadeOutDuration");
    else
      objc_msgSend(v7, "hideUIForInteractionFadeInDuration");
    v10 = v9;
    -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "currentLayoutStyle");

    v13 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
    LOBYTE(v14) = 0;
    if (!self->_isImageZooming && v12 != 4)
    {
      v14 = -[PUPhotoEditToolController shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable](self->_currentEditingTool, "shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable");
      if (v14)
      {
        if (v13 != 1)
          LOBYTE(v14) = objc_msgSend(v7, "shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation");
      }
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PUPhotoEditViewController_setFocusingViewForInteraction___block_invoke;
    v15[3] = &unk_1E58A4700;
    v15[4] = self;
    *(double *)&v15[5] = (double)!v8;
    v16 = v14;
    v17 = v13 != 1;
    v18 = v8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v15, &__block_literal_global_472_63862, v10, 0.0);
    -[PUPhotoEditViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");

  }
}

- (void)rotateAssetsCounterclockwise:(id)a3
{
  -[PUCropToolController setInitialAction:](self->_cropController, "setInitialAction:", 1);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_cropController, 1);
}

- (void)rotateAssetsClockwise:(id)a3
{
  -[PUCropToolController setInitialAction:](self->_cropController, "setInitialAction:", 2);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_cropController, 1);
}

- (void)autoEnhanceAssets:(id)a3
{
  -[PUAdjustmentsToolController setInitialAction:](self->_adjustmentsController, "setInitialAction:", 1);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_adjustmentsController, 1);
}

- (void)navigateToSegment:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  PXNumberPropertyFromCommand();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[NSDictionary objectForKeyedSubscript:](self->_toolControllerTagsByKeyCommandNumber, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    -[PUPhotoEditViewController _toolControllerForTag:](self, "_toolControllerForTag:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", v7, 1);

    v4 = v8;
  }

}

- (void)toggleEditor:(id)a3
{
  if (self->_mainButtonAction == 1)
    -[PUPhotoEditViewController _handleDoneAction:](self, "_handleDoneAction:", a3);
  else
    -[PUPhotoEditViewController _handleCancelButton:](self, "_handleCancelButton:", a3);
}

- (void)copyAdjustments:(id)a3
{
  -[PUPhotoEditViewController _copyEditsSkippingOptions:](self, "_copyEditsSkippingOptions:", 0);
}

- (void)copyAdjustmentsSkippingOptions:(id)a3
{
  -[PUPhotoEditViewController _copyEditsSkippingOptions:](self, "_copyEditsSkippingOptions:", 1);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v6 = a4;
  if (sel_navigateToSegment_ == a3)
  {
    PXNumberPropertyFromCommand();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_toolControllerTagsByKeyCommandNumber, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    if (sel_autoEnhanceAssets_ == a3)
    {
      v7 = -[PUAdjustmentsToolController canPerformAction:withSender:](self->_adjustmentsController, "canPerformAction:withSender:", a3, v6);
    }
    else if (sel_copyAdjustments_ == a3)
    {
      v7 = -[PUPhotoEditViewController _canCopyEdits](self, "_canCopyEdits");
    }
    else if (sel_pasteAdjustments_ == a3)
    {
      v7 = -[PUPhotoEditViewController _canPasteEdits](self, "_canPasteEdits");
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)PUPhotoEditViewController;
      v7 = -[PUPhotoEditViewController canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
    }
    v10 = v7;
  }

  return v10;
}

- (void)validateCommand:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  PXNumberPropertyFromCommand();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char *)objc_msgSend(v11, "action") == sel_navigateToSegment_)
  {
    objc_msgSend(v11, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      if (v4)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_toolControllerTagsByKeyCommandNumber, "objectForKeyedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "integerValue");

        -[PUPhotoEditViewController _toolControllerForTag:](self, "_toolControllerForTag:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDiscoverabilityTitle:", v10);

LABEL_9:
        goto LABEL_10;
      }
    }
  }
  if ((char *)objc_msgSend(v11, "action") == sel_toggleEditor_)
  {
    PULocalizedString(CFSTR("MENU_ITEM_TITLE_CLOSE_EDITOR"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDiscoverabilityTitle:", v9);
    goto LABEL_9;
  }
  if ((char *)objc_msgSend(v11, "action") == sel_autoEnhanceAssets_)
    -[PUAdjustmentsToolController validateCommand:](self->_adjustmentsController, "validateCommand:", v11);
LABEL_10:

}

- (id)_toolControllerForTag:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "toolControllerTag") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_handleToolbarToolButton:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  PUPhotoEditViewController *v25;
  id v26;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 4517, CFSTR("The sender must be a button"));

  }
  v6 = v5;
  -[PUPhotoEditViewController _toolControllerForTag:](self, "_toolControllerForTag:", objc_msgSend(v6, "tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 4522, CFSTR("No tool associated with this button"));

  }
  if (objc_msgSend(v7, "enabled"))
  {
    -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", v7, 1);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v7, "disabledToolAlertTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disabledToolAlertMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("PHOTOEDIT_CONFIRM_REVERT_BUTTON"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __54__PUPhotoEditViewController__handleToolbarToolButton___block_invoke;
    v24 = &unk_1E58A4748;
    v25 = self;
    v26 = v6;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 2, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v14, v21, v22, v23, v24, v25);

    v15 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("CANCEL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v17);

    objc_msgSend(v11, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", self);
    objc_msgSend(v18, "setPermittedArrowDirections:", 15);
    -[PUPhotoEditViewController setDisabledToolRevertAlert:](self, "setDisabledToolRevertAlert:", v11);
    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)_handleTTRButton:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Edit Perf - [TTR] - Entry Into Edit Took %.2f seconds"), v6);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v8, "appendFormat:", CFSTR("Slow Entry Into Edit"));
  objc_msgSend(v8, "appendFormat:", CFSTR("\n\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("Total Time = %.4f\n"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUPhotoEditViewController isFirstSinceBoot](self, "isFirstSinceBoot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("First Since Boot   = %@\n"), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUPhotoEditViewController isFirstSinceLaunch](self, "isFirstSinceLaunch"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("First Since Launch = %@\n"), v10);

  -[PUPhotoEditViewController resourceLoadingInterval](self, "resourceLoadingInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "duration");
  objc_msgSend(v8, "appendFormat:", CFSTR("  Resource Loading Duration = %.4f\n"), v12);

  -[PUPhotoEditViewController resourceCheckingInterval](self, "resourceCheckingInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "duration");
  objc_msgSend(v8, "appendFormat:", CFSTR("    Checking Duration       = %.4f\n"), v14);

  -[PUPhotoEditViewController resourceDownloadInterval](self, "resourceDownloadInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "duration");
  objc_msgSend(v8, "appendFormat:", CFSTR("    Download Duration       = %.4f\n"), v16);

  -[PUPhotoEditViewController autoCalcInterval](self, "autoCalcInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "duration");
  objc_msgSend(v8, "appendFormat:", CFSTR("  Auto Calc Duration = %.4f\n"), v18);

  objc_msgSend(v8, "appendFormat:", CFSTR("\n"));
  -[PUPhotoEditViewController photo](self, "photo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromByteCount:", objc_msgSend(v19, "originalFilesize"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("Asset File Size: %@"), v20);

  objc_msgSend(v8, "appendFormat:", CFSTR("\n\n"));
  LOBYTE(v21) = 1;
  objc_msgSend(MEMORY[0x1E0D7B428], "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v22, v8, CFSTR("Performance"), CFSTR("476277"), CFSTR("Photos UI Edit"), CFSTR("iOS"), CFSTR("1103304"), 0, v21, 0);

}

- (void)_handle1upToggleButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges", a3))
  {
    -[PUPhotoEditViewController _handleSaveAction:](self, "_handleSaveAction:", 0);
  }
  else
  {
    -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishSessionWithEnd:", 2);

    -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSessionEndReason:", 2);

    -[PUPhotoEditViewController _resignCurrentTool](self, "_resignCurrentTool");
    -[PUPhotoEditViewController photo](self, "photo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController didFinishWithAsset:savedChanges:](self, "didFinishWithAsset:savedChanges:", v6, 0);

  }
}

- (void)_handleCancelButton:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = -[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges", a3);
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "User pressed cancel button; hasUnsavedChanges? %@",
      (uint8_t *)&v12,
      0xCu);
  }

  if (v4 || self->_stashedSnapshot)
  {
    -[PUPhotoEditViewController _showCancelAndRevertOptionsAllowResetTool:](self, "_showCancelAndRevertOptionsAllowResetTool:", 0);
  }
  else
  {
    -[PUPhotoEditViewController _didStartExitAction](self, "_didStartExitAction");
    -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishSessionWithEnd:", 2);

    -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSessionEndReason:", 2);

    -[PUPhotoEditViewController _resignCurrentTool](self, "_resignCurrentTool");
    -[PUPhotoEditViewController didFinishWithChanges:](self, "didFinishWithChanges:", 0);
    -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cancelAllRequests");

    if (v10)
    {
      -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSessionEndReason:", 5);

    }
    -[PUPhotoEditViewController _didEndExitActionWithSessionKeys:](self, "_didEndExitActionWithSessionKeys:", 0);
  }
  objc_msgSend(MEMORY[0x1E0D520B0], "reapAllStoragePools");
}

- (void)_showCancelAndRevertOptionsAllowResetTool:(BOOL)a3
{
  _BOOL4 v3;
  PUPhotoEditToolController *currentEditingTool;
  char v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  v3 = a3;
  currentEditingTool = self->_currentEditingTool;
  if (currentEditingTool)
    v6 = !-[PUPhotoEditToolController canResetToDefaultValue](currentEditingTool, "canResetToDefaultValue");
  else
    v6 = 1;
  v7 = -[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges");
  if (self->_stashedSnapshot)
    v8 = 1;
  else
    v8 = v7;
  v9 = (void *)MEMORY[0x1E0DC3450];
  PULocalizedString(CFSTR("PHOTOEDIT_DISCARD_CHANGES_DESCRIPTION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (v6 & 1) == 0)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "showResetToolButton");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0DC3448];
      -[PUPhotoEditToolController localizedResetToolActionTitle](self->_currentEditingTool, "localizedResetToolActionTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke;
      v24[3] = &unk_1E58A8DE8;
      v24[4] = self;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addAction:", v16);
      if (!v8)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  if ((v8 & 1) != 0)
  {
LABEL_13:
    PULocalizedString(CFSTR("PHOTOEDIT_DISCARD_CHANGES"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke_2;
    v23[3] = &unk_1E58A8DE8;
    v23[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v17, 2, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v18);

LABEL_14:
    v19 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("CANCEL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v21);

    objc_msgSend(v11, "popoverPresentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", self);
    -[PUPhotoEditViewController setCancelConfirmationAlert:](self, "setCancelConfirmationAlert:", v11);
    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)_resignCurrentTool
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "leavingEditWithCancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_showJpegPreviewForRawRevertAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  PULocalizedString(CFSTR("EDITING_JPEG_WITH_UNDERLYING_RAW"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("EDITING_JPEG_WITH_UNDERLYING_RAW_REVERT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PUPhotoEditViewController__showJpegPreviewForRawRevertAlert__block_invoke;
  v12[3] = &unk_1E58A8DE8;
  v12[4] = self;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v7);

  v8 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("EDITING_JPEG_WITH_UNDERLYING_RAW_USEJPEG"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v10);

  objc_msgSend(v4, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);
  -[PUPhotoEditViewController setJpegPreviewForRawConfirmationAlert:](self, "setJpegPreviewForRawConfirmationAlert:", v4);
  -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_handleScrubberValueIncrease:(id)a3
{
  -[PUPhotoEditToolController increaseScrubberValue:](self->_currentEditingTool, "increaseScrubberValue:", 0);
}

- (void)_handleCoarseScrubberValueIncrease:(id)a3
{
  -[PUPhotoEditToolController increaseScrubberValue:](self->_currentEditingTool, "increaseScrubberValue:", 1);
}

- (void)_handleScrubberValueDecrease:(id)a3
{
  -[PUPhotoEditToolController decreaseScrubberValue:](self->_currentEditingTool, "decreaseScrubberValue:", 0);
}

- (void)_handleCoarseScrubberValueDecrease:(id)a3
{
  -[PUPhotoEditToolController decreaseScrubberValue:](self->_currentEditingTool, "decreaseScrubberValue:", 1);
}

- (void)_handleSliderValueIncrease:(id)a3
{
  -[PUPhotoEditToolController increaseSliderValue:](self->_currentEditingTool, "increaseSliderValue:", 0);
}

- (void)_handleCoarseSliderValueIncrease:(id)a3
{
  -[PUPhotoEditToolController increaseSliderValue:](self->_currentEditingTool, "increaseSliderValue:", 1);
}

- (void)_handleSliderValueDecrease:(id)a3
{
  -[PUPhotoEditToolController decreaseSliderValue:](self->_currentEditingTool, "decreaseSliderValue:", 0);
}

- (void)_handleCoarseSliderValueDecrease:(id)a3
{
  -[PUPhotoEditToolController decreaseSliderValue:](self->_currentEditingTool, "decreaseSliderValue:", 1);
}

- (void)_handleMainActionButton:(id)a3
{
  id v5;
  int64_t mainButtonAction;
  void *v7;
  id v8;

  v5 = a3;
  mainButtonAction = self->_mainButtonAction;
  switch(mainButtonAction)
  {
    case 0:
      v8 = v5;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 4729, CFSTR("Invalid action for button."));

      goto LABEL_7;
    case 2:
      v8 = v5;
      -[PUPhotoEditViewController _handleRevertButton:](self, "_handleRevertButton:", v5);
      goto LABEL_7;
    case 1:
      v8 = v5;
      -[PUPhotoEditViewController _handleDoneButton:](self, "_handleDoneButton:", v5);
LABEL_7:
      v5 = v8;
      break;
  }

}

- (void)_handleSaveAction:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  char isKindOfClass;
  uint64_t v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[5];
  NSObject *v75;
  id v76;
  id v77;
  char *v78;
  _QWORD v79[5];
  NSObject *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint8_t *v85;
  char *v86;
  _QWORD v87[4];
  id v88;
  uint8_t *v89;
  uint8_t buf[8];
  uint8_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  _QWORD aBlock[4];
  id v97;
  id v98;
  PUPhotoEditViewController *v99;
  NSObject *v100;
  id v101;
  id v102[3];
  id location;
  _QWORD v104[4];
  id v105;
  PUPhotoEditViewController *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = -[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges");
  v6 = v5;
  if (a3 || !v5 || -[PUPhotoEditViewController workImageVersion](self, "workImageVersion") != 1)
    goto LABEL_8;
  v7 = -[PUPhotoEditViewController _canCurrentCompositionControllerBeReverted](self, "_canCurrentCompositionControllerBeReverted");
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isVideoEnabled") ^ 1;

  }
  else
  {
    v10 = 0;
  }

  if (((v7 | v10) & 1) != 0)
  {
LABEL_8:
    -[PUPhotoEditViewController photo](self, "photo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isContentAdjustmentAllowed");

    v13 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(MEMORY[0x1E0D71260], "newCompositionControllerWithComposition:", v72);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "alwaysShowDoneButton");

    if (self->_stashedSnapshot)
    {
      -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPluginSaved:", 1);

    }
    PLPhotoEditGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (char *)os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v20, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    -[PUPhotoEditViewController _didStartExitAction](self, "_didStartExitAction");
    if ((v12 & (v15 | v6)) != 1)
    {
      if (self->_stashedSnapshot)
      {
        -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "finishSessionWithEnd:newCompositionController:oldCompositionController:", 0, 0, 0);
        v36 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = 0;
      }
      -[PUPhotoEditViewController didFinishWithChanges:](self, "didFinishWithChanges:", 0);
      v43 = v20;
      v44 = v43;
      if ((unint64_t)(v18 - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v44, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v18, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
      }

      -[PUPhotoEditViewController _didEndExitActionWithSessionKeys:](self, "_didEndExitActionWithSessionKeys:", v36);
      goto LABEL_56;
    }
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    -[PUPhotoEditViewController _allTools](self, "_allTools");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v108 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "prepareForSave:", *(UIViewController **)(*((_QWORD *)&v107 + 1) + 8 * i) == self->_currentTool);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
      }
      while (v22);
    }

    objc_msgSend(v73, "smartToneAdjustmentController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "enabled");

    if (v26)
    {
      v27 = *MEMORY[0x1E0D71468];
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke;
      v104[3] = &unk_1E58A4798;
      v105 = v73;
      v106 = self;
      objc_msgSend(v105, "modifyAdjustmentWithKey:modificationBlock:", v27, v104);

    }
    if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
    {
      -[PUPhotoEditViewController mediaView](self, "mediaView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "player");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pause");

    }
    -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "finishSessionWithEnd:newCompositionController:oldCompositionController:", 0, v73, v71);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSessionEndReason:", 0);

    if (a3 == 2)
      v33 = 1;
    else
      v33 = 2 * (a3 == 1);
    -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSaveActionType:", v33);

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3;
    aBlock[3] = &unk_1E58A47E8;
    objc_copyWeak(v102, &location);
    v97 = v71;
    v35 = v73;
    v98 = v35;
    v99 = self;
    v102[1] = v13;
    v68 = v20;
    v100 = v68;
    v102[2] = v18;
    v36 = v31;
    v101 = v36;
    v37 = _Block_copy(aBlock);
    if (a3 == 2)
    {
      if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
      {
        -[PUPhotoEditViewController mediaView](self, "mediaView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "_didReleaseAVObjects");

        if ((v47 & 1) == 0)
        {
          -[PUPhotoEditViewController mediaView](self, "mediaView");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "_releaseAVObjects");

          -[PUPhotoEditMediaToolController trimController](self->_mediaToolController, "trimController");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "releaseAVObjects");

        }
      }
      -[PUPhotoEditViewController photo](self, "photo");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 4966, CFSTR("PUPhotoEditSaveActionBurnInTrimToNewClip: photo must be PHAsset"));

      }
      -[PUPhotoEditViewController photo](self, "photo");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController setBurningInTrim:](self, "setBurningInTrim:", 1);
      -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
      -[PUPhotoEditViewController originalComposition](self, "originalComposition");
      v52 = objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v70 = (void *)objc_msgSend(MEMORY[0x1E0D71260], "newCompositionControllerWithComposition:", v52);
        objc_msgSend(v35, "source");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setSource:mediaType:", v53, objc_msgSend(v35, "mediaType"));

      }
      else
      {
        v70 = 0;
      }
      v59 = v37;
      -[PUPhotoEditMediaToolController cinematographyScript](self->_mediaToolController, "cinematographyScript", v52);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)MEMORY[0x1E0D7CB68];
      v62 = MEMORY[0x1E0C80D38];
      v63 = MEMORY[0x1E0C80D38];
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_579;
      v74[3] = &unk_1E58A48F0;
      v74[4] = self;
      v75 = v68;
      v78 = v18;
      v76 = v36;
      v77 = v59;
      v64 = (id)objc_msgSend(v61, "burnInTrimToNewAsset:compositionController:asShotCompositionController:cinematographyScript:queue:completion:", v39, v35, v70, v60, v62, v74);

      v37 = v59;
    }
    else if (a3 == 1)
    {
      -[PUPhotoEditViewController photo](self, "photo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v55 = objc_opt_isKindOfClass();

      if ((v55 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 4886, CFSTR("PUPhotoEditSaveActionSaveAsDuplicate: photo must be PHAsset"));

      }
      -[PUPhotoEditViewController photo](self, "photo");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v91 = buf;
      v92 = 0x3032000000;
      v93 = __Block_byref_object_copy__63616;
      v94 = __Block_byref_object_dispose__63617;
      v95 = 0;
      objc_msgSend(v56, "photoLibrary");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = MEMORY[0x1E0C809B0];
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_561;
      v87[3] = &unk_1E58AAE48;
      v88 = v56;
      v89 = buf;
      v79[0] = v58;
      v79[1] = 3221225472;
      v79[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2_564;
      v79[3] = &unk_1E58A48C8;
      v79[4] = self;
      v80 = v68;
      v86 = v18;
      v81 = v36;
      v85 = buf;
      v39 = v88;
      v82 = v39;
      v83 = v35;
      v84 = v37;
      objc_msgSend(v57, "performChanges:completionHandler:", v87, v79);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (a3)
      {
LABEL_55:

        objc_destroyWeak(v102);
        objc_destroyWeak(&location);
LABEL_56:

        return;
      }
      -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PUPhotoEditViewController _newOutputForContentEditingInput:compositionController:](self, "_newOutputForContentEditingInput:compositionController:", v38, v35);

      -[PUPhotoEditViewController photo](self, "photo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *, id, void *, id, _QWORD))v37 + 2))(v37, v40, v35, v41, v39, 0);

    }
    goto LABEL_55;
  }
  PLPhotoEditGetLog();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v45, OS_LOG_TYPE_INFO, "Saving edits via revert to avoid render", buf, 2u);
  }

  -[PUPhotoEditViewController _performRevertAction](self, "_performRevertAction");
}

- (void)_commitEditSessionActionWithAsset:(id)a3 initialCompositionController:(id)a4 savedCompositionController:(id)a5 localizedActionName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PUPhotoEditViewController *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PXAction *v24;
  void *v25;
  PXAction *executedSessionAction;
  PXAction *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D7B158]);
    v15 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    objc_msgSend(v14, "setProgress:", v15);

    objc_msgSend(v14, "setShowCheckmarkOnCompletion:", 1);
    objc_msgSend(v14, "setShouldAutoDisplay:", 1);
    objc_msgSend(v14, "setShouldUseProgressText:", 1);
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke;
    v34[3] = &unk_1E58ABD10;
    v35 = v16;
    v29 = v16;
    objc_msgSend(v14, "setCancellationHandler:", v34);
    v17 = self;
    v31 = v11;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CA78]), "initWithCompositionController:asset:", v11, v10);
    v30 = v12;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CA78]), "initWithCompositionController:asset:", v12, v10);
    v20 = objc_alloc(MEMORY[0x1E0D7B3B0]);
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "progress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7CD28], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (PXAction *)objc_msgSend(v20, "initWithPresetManager:asset:sourcePreset:targetPreset:syncProgress:asyncLoadingStatusManager:", v21, v10, v18, v19, v22, v23);

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAction setAllowSynchronousRendering:](v24, "setAllowSynchronousRendering:", objc_msgSend(v25, "allowSynchronousBatchRendering"));

    -[PXAction setLocalizedActionName:](v24, "setLocalizedActionName:", v13);
    executedSessionAction = v17->_executedSessionAction;
    v17->_executedSessionAction = v24;
    v27 = v24;

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke_2;
    v32[3] = &unk_1E58A4918;
    v33 = v14;
    v28 = v14;
    -[PXAction setCompletionHandler:](v27, "setCompletionHandler:", v32);

    v12 = v30;
    v11 = v31;

  }
}

- (void)_commitSaveAsCopyWithAsset:(id)a3
{
  PXAction *v4;
  PXAction *executedSessionAction;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (PXAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B8A8]), "initWithAsset:", v6);
    executedSessionAction = self->_executedSessionAction;
    self->_executedSessionAction = v4;

  }
}

- (void)_handleDoneButton:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  if (-[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia", a3)
    && (-[PUPhotoEditViewController photo](self, "photo"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "mediaType"),
        v4,
        v5 != 2))
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    PELocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PELocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    PELocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__PUPhotoEditViewController__handleDoneButton___block_invoke;
    v21[3] = &unk_1E58A8DE8;
    v21[4] = self;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    PELocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __47__PUPhotoEditViewController__handleDoneButton___block_invoke_2;
    v20[3] = &unk_1E58A8DE8;
    v20[4] = self;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, &__block_literal_global_597);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v19);

    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
  else
  {
    -[PUPhotoEditViewController _handleSaveAction:](self, "_handleSaveAction:", 0);
  }
}

- (void)_handleDoneAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  -[UIButton menu](self->_mainActionButton, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0DC3450];
    PULocalizedString(CFSTR("EDITED_TRIM_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("EDITED_TRIM_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("EDITED_TRIM_SAVE_VIDEO"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__PUPhotoEditViewController__handleDoneAction___block_invoke;
    v23[3] = &unk_1E58AA850;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("EDITED_TRIM_SAVE_AS_NEW_CLIP"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __47__PUPhotoEditViewController__handleDoneAction___block_invoke_2;
    v21[3] = &unk_1E58AA850;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("EDITED_TRIM_CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v19);

    objc_msgSend(v9, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSourceView:", self->_mainActionButton);
    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
  else
  {
    -[PUPhotoEditViewController _handleSaveAction:](self, "_handleSaveAction:", 0);
  }

}

- (void)_handleRevertButton:(id)a3
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v4 = -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo", a3);
  v5 = CFSTR("PHOTOEDIT_CONFIRM_REVERT_MESSAGE");
  if (v4)
    v5 = CFSTR("VIDEOEDIT_CONFIRM_REVERT_MESSAGE");
  v6 = v5;
  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalAdjustmentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(MEMORY[0x1E0D711A0], "locallySupportedFormatVersions"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "formatVersion"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "indexOfObject:", v10),
        v10,
        v9,
        v11 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v12 = CFSTR("PHOTOEDIT_UNSUPPORTED_REVERT_WARNING");
    if (v4)
      v12 = CFSTR("VIDEOEDIT_UNSUPPORTED_REVERT_WARNING");
    v13 = v12;

    v14 = CFSTR("PHOTOEDIT_IGNORE_REVERT_WARNING");
    v6 = v13;
  }
  else
  {
    v14 = CFSTR("PHOTOEDIT_CONFIRM_REVERT_BUTTON");
  }
  PULocalizedString(v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __49__PUPhotoEditViewController__handleRevertButton___block_invoke;
  v24[3] = &unk_1E58A8DE8;
  v24[4] = self;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 2, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("CANCEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v22);

  objc_msgSend(v16, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", self);
  objc_msgSend(v23, "setPermittedArrowDirections:", 15);
  -[PUPhotoEditViewController setRevertConfirmationAlert:](self, "setRevertConfirmationAlert:", v16);
  -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

}

- (int)_saveRevertedComposition:(id)a3 contentEditingInput:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  PUPhotoEditViewController *v22;
  id v23;
  uint8_t buf[16];

  v8 = a5;
  v9 = a3;
  v10 = -[PUPhotoEditViewController _newOutputForContentEditingInput:compositionController:](self, "_newOutputForContentEditingInput:compositionController:", a4, v9);
  PLPhotoEditGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _saveRevertedComposition:contentEditingInput:withCompletionHandler:]: using -[PEMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoEditModel:useRawIfAvailable:completionHandler:] to revert", buf, 2u);
  }

  -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "editingVisibility");
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __96__PUPhotoEditViewController__saveRevertedComposition_contentEditingInput_withCompletionHandler___block_invoke;
  v21 = &unk_1E58A4960;
  v22 = self;
  v23 = v8;
  v16 = v8;
  LODWORD(v15) = objc_msgSend(v12, "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v13, v9, v10, 1, v15, &v18);

  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1, v18, v19, v20, v21, v22);
  return v15;
}

- (int)_revertToEmptyCompositionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[16];

  v4 = a3;
  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D71260], "newCompositionControllerWithComposition:", v5);
  v7 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");
  -[PUPhotoEditViewController photo](self, "photo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAdjusted");

  if ((v9 & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D71660], "isIdentityCompositionController:", v6)
      ? (v10 = v7 == 1)
      : (v10 = 0),
        v10))
  {
    PLPhotoEditGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _revertToEmptyCompositionWithCompletionHandler:]: resetting in memory", buf, 2u);
    }

    -[PUPhotoEditViewController _resetModelAndBaseImagesToWorkImageVersion:](self, "_resetModelAndBaseImagesToWorkImageVersion:", 1);
    if (v4)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke_619;
      v17[3] = &unk_1E58AB968;
      v17[4] = self;
      v18 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v17);

    }
    v14 = 0;
  }
  else
  {
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _revertToEmptyCompositionWithCompletionHandler:]: using -[PEMediaDestination revertEditsForAsset:completionHandler:] to revert", buf, 2u);
    }

    -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E58A4960;
    v19[4] = self;
    v20 = v4;
    v14 = objc_msgSend(v12, "revertEditsForAsset:completionHandler:", v13, v19);

  }
  return v14;
}

- (void)asShotCompositionController:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[2];
  id location;
  _QWORD v15[5];

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CD1500]);
  objc_msgSend(v6, "setResultHandlerQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(v6, "setNetworkAccessAllowed:", 1);
  -[PUPhotoEditViewController photo](self, "photo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginalChoice:", objc_msgSend(v7, "originalResourceChoice"));

  objc_msgSend(v6, "setForceRunAsUnadjustedAsset:", 1);
  objc_msgSend(v6, "setForceReturnFullLivePhoto:", 1);
  objc_msgSend(v6, "setSkipDisplaySizeImage:", 1);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PUPhotoEditViewController_asShotCompositionController___block_invoke;
  v15[3] = &unk_1E58A4988;
  v15[4] = self;
  objc_msgSend(v6, "setProgressHandler:", v15);
  objc_initWeak(&location, self);
  -[PUPhotoEditViewController photo](self, "photo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __57__PUPhotoEditViewController_asShotCompositionController___block_invoke_2;
  v11[3] = &unk_1E58A49B0;
  objc_copyWeak(v13, &location);
  v10 = v5;
  v13[1] = (id)a2;
  v11[4] = self;
  v12 = v10;
  objc_msgSend(v9, "requestContentEditingInputWithOptions:completionHandler:", v6, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)_performRevertAction
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ExitEditRevertAction", " enableTelemetry=YES ", buf, 2u);
  }

  -[PUPhotoEditViewController _didStartExitAction](self, "_didStartExitAction");
  -[PUPhotoEditViewController setRevertingToOriginal:](self, "setRevertingToOriginal:", 1);
  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_downloadingForRevert = objc_msgSend(v7, "baseVersion") != 0;

  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
  v8 = (void *)MEMORY[0x1E0D71260];
  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "newCompositionControllerWithComposition:", v9);

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke;
  v16[3] = &unk_1E58A4A50;
  v16[4] = self;
  v17 = v10;
  v18 = v12;
  v19 = v6;
  v20 = v4;
  v13 = v6;
  v14 = v12;
  v15 = v10;
  -[PUPhotoEditViewController asShotCompositionController:](self, "asShotCompositionController:", v16);

}

- (void)_performDiscardAction
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  PUPhotoEditSnapshot *stashedSnapshot;
  void *v8;
  PUPhotoEditSnapshot *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  PUPhotoEditViewController *v14;
  os_signpost_id_t v15;
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[PUPhotoEditViewController _isWaitingForSaveCompletion](self, "_isWaitingForSaveCompletion")
    && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "User initiated discard while save is in progress", buf, 2u);
  }
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ExitEditCancelAction", " enableTelemetry=YES ", buf, 2u);
  }

  -[PUPhotoEditViewController _didStartExitAction](self, "_didStartExitAction");
  stashedSnapshot = self->_stashedSnapshot;
  if (stashedSnapshot)
  {
    -[PUPhotoEditSnapshot adjustmentData](stashedSnapshot, "adjustmentData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = self->_stashedSnapshot;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50__PUPhotoEditViewController__performDiscardAction__block_invoke;
      v12[3] = &unk_1E58A4A78;
      v14 = self;
      v15 = v4;
      v13 = v6;
      -[PUPhotoEditViewController _restoreSnapshot:withCompletionHandler:](self, "_restoreSnapshot:withCompletionHandler:", v9, v12);

    }
    else
    {
      -[PUPhotoEditViewController _performRevertAction](self, "_performRevertAction");
    }
  }
  else
  {
    -[PUPhotoEditViewController didFinishWithChanges:](self, "didFinishWithChanges:", 0);
    v10 = v6;
    v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_END, v4, "ExitEditCancelAction", " enableTelemetry=YES ", buf, 2u);
    }

    -[PUPhotoEditViewController _didEndExitActionWithSessionKeys:](self, "_didEndExitActionWithSessionKeys:", 0);
  }

}

- (void)_startWaitingForAssetChange:(id)a3
{
  id v4;
  NSMutableSet *assetsWaitingForLibraryNotification;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSObject *v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    assetsWaitingForLibraryNotification = self->_assetsWaitingForLibraryNotification;
    if (!assetsWaitingForLibraryNotification)
    {
      v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      v7 = self->_assetsWaitingForLibraryNotification;
      self->_assetsWaitingForLibraryNotification = v6;

      assetsWaitingForLibraryNotification = self->_assetsWaitingForLibraryNotification;
    }
    -[NSMutableSet addObject:](assetsWaitingForLibraryNotification, "addObject:", v4);
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[NSMutableSet count](self->_assetsWaitingForLibraryNotification, "count");
      v11 = 138412546;
      v12 = v4;
      v13 = 1024;
      v14 = v9;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _startWaitingForAssetChange] for %@; now waiting on %d assets",
        (uint8_t *)&v11,
        0x12u);
    }

    -[PUPhotoEditViewController setAssetChangeDismissalState:](self, "setAssetChangeDismissalState:", 1);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_registerChangeObserver:", self);

  }
}

- (void)_startTimeoutTimerForAssetChange
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (-[PUPhotoEditViewController assetChangeDismissalState](self, "assetChangeDismissalState") & 0xFFFFFFFFFFFFFFFELL) == 2;
  PLPhotoEditGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "PUPhotoEditViewController not starting timeout timer as we are already in a terminal state for asset change notifications", (uint8_t *)&buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = objc_msgSend(v6, "px_areChangesPaused");
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "PUPhotoEditViewController starting asset change timeout timer. Are Library Changes Paused: %d", (uint8_t *)&buf, 8u);

    }
    objc_initWeak(&buf, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__PUPhotoEditViewController__startTimeoutTimerForAssetChange__block_invoke;
    v9[3] = &unk_1E58A46D8;
    objc_copyWeak(&v10, &buf);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 30.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController setAssetChangeTimeoutTimer:](self, "setAssetChangeTimeoutTimer:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&buf);
  }
}

- (void)_timeoutWaitingForAssetChange
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "px_areChangesPaused");

  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 67109120;
    v9 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "PUPhotoEditViewController timeout while waiting for an asset change from the library. Are Library Changes Paused: %d", (uint8_t *)&v8, 8u);
  }

  -[PUPhotoEditViewController photo](self, "photo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController _stopWaitingForAssetChangeWithAsset:success:](self, "_stopWaitingForAssetChangeWithAsset:success:", v6, 0);

  PXAssertGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    v8 = 67109120;
    v9 = v4;
    _os_log_fault_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_FAULT, "Timeout waiting for asset change. Paused: %d", (uint8_t *)&v8, 8u);
  }

}

- (void)_stopWaitingForAssetChangeWithAsset:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _DWORD v10[2];
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableSet removeObject:](self->_assetsWaitingForLibraryNotification, "removeObject:", v6);
  if (!-[NSMutableSet count](self->_assetsWaitingForLibraryNotification, "count"))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10[0] = 67109120;
      v10[1] = v4;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _stopWaitingForAssetChangeWithAsset:success:] - success: %d", (uint8_t *)v10, 8u);
    }

    -[PUPhotoEditViewController assetChangeTimeoutTimer](self, "assetChangeTimeoutTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[PUPhotoEditViewController setAssetChangeTimeoutTimer:](self, "setAssetChangeTimeoutTimer:", 0);
    if (v4)
      v9 = 2;
    else
      v9 = 3;
    -[PUPhotoEditViewController setAssetChangeDismissalState:](self, "setAssetChangeDismissalState:", v9);
    -[PUPhotoEditViewController _notifyDelegateSaveFinishedIfReadyWithAsset:](self, "_notifyDelegateSaveFinishedIfReadyWithAsset:", v6);
  }

}

- (BOOL)_isWaitingForAssetChange
{
  return -[PUPhotoEditViewController assetChangeDismissalState](self, "assetChangeDismissalState") == 1;
}

- (void)_startWaitingForSaveRequestID:(int)a3
{
  NSObject *v5;
  uint8_t v6[16];

  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _startWaitingForSaveRequestID:]", v6, 2u);
  }

  -[PUPhotoEditViewController setSaveCompletionDismissalState:](self, "setSaveCompletionDismissalState:", 1);
  self->_inProgressSaveRequestID = a3;
  -[PUPhotoEditViewController _startMonitoringSaveProgressIfNeeded](self, "_startMonitoringSaveProgressIfNeeded");
}

- (void)_stopWaitingForSaveRequestWithAsset:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController _stopWaitingForSaveRequestWithAsset:] - asset: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
    v6 = 2;
  else
    v6 = 3;
  self->_inProgressSaveRequestID = 0;
  -[PUPhotoEditViewController _stopMonitoringSaveProgress](self, "_stopMonitoringSaveProgress");
  -[PUPhotoEditViewController setSaveCompletionDismissalState:](self, "setSaveCompletionDismissalState:", v6);
  -[PUPhotoEditViewController _notifyDelegateSaveFinishedIfReadyWithAsset:](self, "_notifyDelegateSaveFinishedIfReadyWithAsset:", v4);

}

- (BOOL)_isWaitingForSaveCompletion
{
  return -[PUPhotoEditViewController saveCompletionDismissalState](self, "saveCompletionDismissalState") == 1;
}

- (void)_startMonitoringSaveProgressIfNeeded
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  os_log_type_t v5;
  OS_dispatch_source *v7;
  OS_dispatch_source *saveProgressTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD handler[4];
  id v13;
  id buf[2];

  if (self->_saveProgressTimer)
  {
    PLPhotoEditGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return;
    }
    LOWORD(buf[0]) = 0;
    v3 = "Attempted to begin monitoring photo edit save progress while monitoring is already in progress";
    v4 = v2;
    v5 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
    _os_log_impl(&dword_1AAB61000, v4, v5, v3, (uint8_t *)buf, 2u);
    goto LABEL_5;
  }
  if (-[PUPhotoEditViewController _isSaveProgressAvailable](self, "_isSaveProgressAvailable"))
  {
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    saveProgressTimer = self->_saveProgressTimer;
    self->_saveProgressTimer = v7;

    v9 = self->_saveProgressTimer;
    if (!v9)
    {
      PLPhotoEditGetLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      LOWORD(buf[0]) = 0;
      v3 = "Unable to create timer to monitor photo edit save progress";
      v4 = v2;
      v5 = OS_LOG_TYPE_ERROR;
      goto LABEL_4;
    }
    v10 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v9, v10, 0x1DCD6500uLL, 0x5F5E100uLL);
    objc_initWeak(buf, self);
    v11 = self->_saveProgressTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__PUPhotoEditViewController__startMonitoringSaveProgressIfNeeded__block_invoke;
    handler[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v13, buf);
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume((dispatch_object_t)self->_saveProgressTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

- (void)_stopMonitoringSaveProgress
{
  NSObject *saveProgressTimer;
  OS_dispatch_source *v4;

  saveProgressTimer = self->_saveProgressTimer;
  if (saveProgressTimer)
  {
    dispatch_source_cancel(saveProgressTimer);
    v4 = self->_saveProgressTimer;
    self->_saveProgressTimer = 0;

  }
}

- (void)_updateSaveProgress
{
  void *v3;
  double v4;
  double v5;

  if (-[PUPhotoEditViewController _isSaveProgressAvailable](self, "_isSaveProgressAvailable"))
  {
    -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "progressForRequestWithIdentifier:", self->_inProgressSaveRequestID);
    v5 = v4 * 0.95;

    -[PUProgressIndicatorView setCurrentProgress:](self->_progressIndicatorView, "setCurrentProgress:", v5);
  }
}

- (BOOL)_isSaveProgressAvailable
{
  PUPhotoEditViewController *v2;
  void *v3;

  if (!self->_inProgressSaveRequestID)
    return 0;
  v2 = self;
  -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "supportsProgressForRequestWithIdentifier:", v2->_inProgressSaveRequestID);

  return (char)v2;
}

- (void)_cancelInProgressSaveRequest
{
  void *v3;

  if (self->_inProgressSaveRequestID)
  {
    -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequestWithIdentifier:", self->_inProgressSaveRequestID);

    self->_inProgressSaveRequestID = 0;
  }
}

- (void)_notifyDelegateSaveFinishedIfReadyWithAsset:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (-[PUPhotoEditViewController _isWaitingForAssetChange](self, "_isWaitingForAssetChange"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (-[PUPhotoEditViewController _isWaitingForSaveCompletion](self, "_isWaitingForSaveCompletion"))
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    v16 = 1024;
    v17 = -[PUPhotoEditViewController saveCompletionDismissalState](self, "saveCompletionDismissalState");
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "_notifyDelegateSaveFinishedIfReadyWithAsset: isWaitingForAssetChange: %@ isWaitingForSaveCompletion: %@   saveCompletionDismissalState: %d", buf, 0x1Cu);
  }

  if (!-[PUPhotoEditViewController _isWaitingForAssetChange](self, "_isWaitingForAssetChange")
    && !-[PUPhotoEditViewController _isWaitingForSaveCompletion](self, "_isWaitingForSaveCompletion")
    && -[PUPhotoEditViewController saveCompletionDismissalState](self, "saveCompletionDismissalState") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_unregisterChangeObserver:", self);

    v9 = dispatch_time(0, 100000000);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__PUPhotoEditViewController__notifyDelegateSaveFinishedIfReadyWithAsset___block_invoke;
    v10[3] = &unk_1E58ABCA8;
    v10[4] = self;
    v11 = v4;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);

  }
}

- (BOOL)_canPresentExtensions
{
  return (-[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing")
       || !-[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia"))
      && -[PUEditPluginSession isAvailable](self->_pluginSession, "isAvailable");
}

- (void)_presentExtensions
{
  id v3;

  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginSession beginSessionWithAsset:fromViewController:sourceElement:includeMarkupInList:](self->_pluginSession, "beginSessionWithAsset:fromViewController:sourceElement:includeMarkupInList:", v3, self, self->_moreButton, -[PUPhotoEditViewController _markupGetsItsOwnButton](self, "_markupGetsItsOwnButton") ^ 1);

}

- (id)_moreButtonMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC36F8];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __44__PUPhotoEditViewController__moreButtonMenu__block_invoke;
  v12 = &unk_1E58A4AA0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v2, "elementWithUncachedProvider:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"), v9, v10, v11, v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, v5, 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v7;
}

- (void)_produceMoreButtonMenuElementsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(id, id);

  v17 = (void (**)(id, id))a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = -[PUPhotoEditViewController _copyPasteEditsSubmenu](self, "_copyPasteEditsSubmenu");
  objc_msgSend(v4, "addObject:", v5);

  -[PUPhotoEditViewController photo](self, "photo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PUPhotoEditViewController _saveAsDuplicateSubmenu](self, "_saveAsDuplicateSubmenu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lightModeEditor");

  if (v10)
  {
    -[PUPhotoEditViewController _appearanceSubmenu](self, "_appearanceSubmenu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  -[PUPhotoEditViewController _extensionsSubmenu](self, "_extensionsSubmenu");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  -[PUPhotoEditViewController _undoRedoSubmenu](self, "_undoRedoSubmenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  -[PUPhotoEditViewController _toolActionsSubmenu](self, "_toolActionsSubmenu");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v14 = objc_msgSend(v4, "addObject:", v14);
  if (MEMORY[0x1AF429AFC](v14))
  {
    -[PUPhotoEditViewController _internalActionsSubmenu](self, "_internalActionsSubmenu");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  v17[2](v17, v4);

}

- (void)_reloadMoreButtonMenu
{
  id v3;

  -[PUPhotoEditViewController _moreButtonMenu](self, "_moreButtonMenu");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton setMenu:](self->_moreButton, "setMenu:", v3);

}

- (id)_undoRedoSubmenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3428];
  -[PUPhotoEditViewController undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undoMenuItemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.backward"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke;
  v27[3] = &unk_1E58A6930;
  v9 = v3;
  v28 = v9;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAttributes:", 8);
  if ((objc_msgSend(v9, "canUndo") & 1) == 0)
    objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | 1);
  v11 = (void *)MEMORY[0x1E0DC3428];
  v12 = objc_loadWeakRetained(&location);
  objc_msgSend(v12, "undoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "redoMenuItemTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.forward"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  v23 = 3221225472;
  v24 = __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke_2;
  v25 = &unk_1E58A6930;
  v16 = v9;
  v26 = v16;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v14, v15, 0, &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setAttributes:", 8, v22, v23, v24, v25);
  if ((objc_msgSend(v16, "canRedo") & 1) == 0)
    objc_msgSend(v17, "setAttributes:", objc_msgSend(v17, "attributes") | 1);
  v18 = (void *)MEMORY[0x1E0DC39D0];
  v30[0] = v10;
  v30[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v20;
}

- (id)_saveAsDuplicateSubmenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_SAVE_AS_DUPLICATE_ACTION_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__PUPhotoEditViewController__saveAsDuplicateSubmenu__block_invoke;
  v14 = &unk_1E58AB5D0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges", v11, v12, v13, v14))
    objc_msgSend(v6, "setAttributes:", 1);
  v7 = (void *)MEMORY[0x1E0DC39D0];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v9;
}

- (id)_copyPasteEditsSubmenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_COPY_ADJUST"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("slider.horizontal.2.square.on.square"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke;
  v21[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PUPhotoEditViewController _canCopyEdits](self, "_canCopyEdits"))
    objc_msgSend(v7, "setAttributes:", 1);
  v8 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_PASTE_ADJUST"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("slider.horizontal.2.square.badge.arrow.down"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v17 = 3221225472;
  v18 = __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke_2;
  v19 = &unk_1E58AB5D0;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v10, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PUPhotoEditViewController _canPasteEdits](self, "_canPasteEdits", v16, v17, v18, v19))
    objc_msgSend(v11, "setAttributes:", 1);
  v12 = (void *)MEMORY[0x1E0DC39D0];
  v24[0] = v7;
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v14;
}

- (id)_appearanceSubmenu
{
  void *v2;
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[5];

  v26[3] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("appearance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PUPhotoEditAppearancePreference preferredAppearance](PUPhotoEditAppearancePreference, "preferredAppearance");
  v4 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_APPEARANCE_MENU_ITEM_SYSTEM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke;
  v23[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v2, 0, v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setState:", v3 == 0);
  v8 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_APPEARANCE_MENU_ITEM_DARK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_2;
  v21[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v2, 0, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setState:", v3 == 1);
  v11 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PHOTOEDIT_APPEARANCE_MENU_ITEM_LIGHT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_3;
  v19[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, v2, 0, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setState:", v3 == 2);
  v14 = (void *)MEMORY[0x1E0DC39D0];
  PULocalizedString(CFSTR("PHOTOEDIT_APPEARANCE_MENU_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v26[1] = v10;
  v26[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", v15, v2, 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  return v17;
}

- (id)_extensionsSubmenu
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = -[PUPhotoEditViewController _canPresentExtensions](self, "_canPresentExtensions");
  v4 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("MARKUP_BUTTON_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil.tip.crop.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke;
  v22[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUPhotoEditViewController _markupGetsItsOwnButton](self, "_markupGetsItsOwnButton")
    || !-[PUPhotoEditViewController _canPresentMarkup](self, "_canPresentMarkup")
    || !v3)
  {
    objc_msgSend(v8, "setAttributes:", 4);
  }
  v9 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("PLUGIN_MENU_ITEM_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("app.connected.to.app.below.fill"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = 3221225472;
  v19 = __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke_2;
  v20 = &unk_1E58AB5D0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(v12, "setAttributes:", 4, v17, v18, v19, v20);
  v13 = (void *)MEMORY[0x1E0DC39D0];
  v25[0] = v8;
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v15;
}

- (id)_toolActionsSubmenu
{
  void *v2;
  void *v3;

  -[PUPhotoEditToolController toolActionsForMenu](self->_currentEditingTool, "toolActionsForMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_internalActionsSubmenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__PUPhotoEditViewController__internalActionsSubmenu__block_invoke;
  v14 = &unk_1E58AB5D0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", CFSTR("File a Radar"), v4, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolController internalToolActionsForMenu](self->_currentEditingTool, "internalToolActionsForMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v9;
}

- (BOOL)_isZoomedIn
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoomScale");
  v5 = v4;
  objc_msgSend(v3, "minimumZoomScale");
  LOBYTE(v2) = v5 > v6 * 1.05;

  return (char)v2;
}

- (void)_updateZoomButton
{
  if (self->_zoomButton)
    -[PUPhotoEditToolbarButton setSelected:](self->_zoomButton, "setSelected:", -[PUPhotoEditViewController _isZoomedIn](self, "_isZoomedIn"));
}

- (void)_handleZoomButton:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[PUPhotoEditViewController mediaView](self, "mediaView", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PUPhotoEditViewController _isZoomedIn](self, "_isZoomedIn"))
  {
    objc_msgSend(v13, "minimumZoomScale");
    objc_msgSend(v13, "setZoomScale:animated:", 1);
  }
  else
  {
    objc_msgSend(v13, "_renderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    objc_msgSend(v13, "zoomToRect:animated:", 1, v6, v8, v10, v12);
  }

}

- (BOOL)_canPresentMarkup
{
  return !-[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo")
      && !-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo")
      && -[PUEditPluginSession markupIsAvailable](self->_pluginSession, "markupIsAvailable");
}

- (void)_presentMarkup
{
  id v3;

  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginSession beginMarkupSessionWithAsset:fromViewController:](self->_pluginSession, "beginMarkupSessionWithAsset:fromViewController:", v3, self);

}

- (void)_handleAutoEnhanceButton:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((-[PEAutoAdjustmentController isBusy](self->_autoEnhanceController, "isBusy", a3) & 1) == 0)
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 5845, CFSTR("Need a compositionController to compute AutoEnhance"));

    }
    -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 5846, CFSTR("Need a valuesCalculator to compute AutoEnhance"));

    }
    if (objc_msgSend(MEMORY[0x1E0D7CAC0], "isAutoEnhanceEnabledForCompositionController:", v8))
      -[PEAutoAdjustmentController disableAutoEnhanceOnCompositionController:](self->_autoEnhanceController, "disableAutoEnhanceOnCompositionController:", v8);
    else
      -[PUPhotoEditViewController applyAutoEnhance:completion:](self, "applyAutoEnhance:completion:", v8, 0);

  }
}

- (void)applyAutoEnhance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PEAutoAdjustmentController *autoEnhanceController;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  autoEnhanceController = self->_autoEnhanceController;
  -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PUPhotoEditViewController_applyAutoEnhance_completion___block_invoke;
  v11[3] = &unk_1E58A4AC8;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  -[PEAutoAdjustmentController enableAutoEnhanceOnCompositionController:valuesCalculator:completionHandler:](autoEnhanceController, "enableAutoEnhanceOnCompositionController:valuesCalculator:completionHandler:", v6, v9, v11);

  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_updateMutedState
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentControllerForKey:", *MEMORY[0x1E0D71380]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v4 = objc_msgSend(v5, "enabled");
  else
    v4 = -[PUPhotoEditViewController hasLoopingVideoAdjustment](self, "hasLoopingVideoAdjustment");
  -[NUMediaView setMuted:](self->_mediaView, "setMuted:", v4);

}

- (void)toggleLivePhotoActive
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isVideoEnabled") & 1) != 0
    || !objc_msgSend(v3, "reenablingLivePhotoShouldRemoveEdits"))
  {
    v4 = objc_alloc(MEMORY[0x1E0D7B3A8]);
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCompositionController:livePhotoModel:", v5, v3);

    -[PUPhotoEditViewController undoManager](self, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executeWithUndoManager:completionHandler:", v7, &__block_literal_global_678);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PUPhotoEditViewController_toggleLivePhotoActive__block_invoke;
    v8[3] = &unk_1E58A9910;
    v8[4] = self;
    -[PUPhotoEditViewController _presentWarningForIrisRemovesEditsWithCompletion:](self, "_presentWarningForIrisRemovesEditsWithCompletion:", v8);
  }

}

- (void)_setPlaybackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 && objc_msgSend(v5, "reenablingLivePhotoShouldRemoveEdits"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__PUPhotoEditViewController__setPlaybackEnabled___block_invoke;
    v7[3] = &unk_1E58A9910;
    v7[4] = self;
    -[PUPhotoEditViewController _presentWarningForIrisRemovesEditsWithCompletion:](self, "_presentWarningForIrisRemovesEditsWithCompletion:", v7);
  }
  else
  {
    objc_msgSend(v6, "setVideoEnabled:", v3);
  }

}

- (void)_handleLivePhotoTouchRecognizer:(id)a3
{
  if (objc_msgSend(a3, "state") != 2)
    -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
}

- (void)_presentWarningForIrisRemovesEditsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 5926, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = (void *)MEMORY[0x1E0DC3450];
  PULocalizedString(CFSTR("PHOTOEDIT_LIVE_PHOTO_REMOVES_EDITS_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("CANCEL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke;
  v23[3] = &unk_1E58AB6C0;
  v12 = v5;
  v24 = v12;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("PHOTOEDIT_CONFIRM_REVERT_BUTTON"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke_2;
  v21[3] = &unk_1E58AB6C0;
  v22 = v12;
  v16 = v12;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 2, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  objc_msgSend(v8, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPermittedArrowDirections:", 15);
  -[PUPhotoEditMediaToolController livePhotoButton](self->_mediaToolController, "livePhotoButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceView:", v19);
  objc_msgSend(v19, "bounds");
  objc_msgSend(v18, "setSourceRect:");
  objc_msgSend(v18, "setDelegate:", self);
  -[PUPhotoEditViewController setIrisRevertConfirmationAlert:](self, "setIrisRevertConfirmationAlert:", v8);
  -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NUMediaView *mediaView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a4, "videoEnabledDidChange"))
  {
    -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer");
    -[PUPhotoEditViewController _updateSwipeDownGestureRecognizer](self, "_updateSwipeDownGestureRecognizer");
    -[PUPhotoEditViewController _updatePluginSession](self, "_updatePluginSession");
    self->_toolbarButtonsValid = 0;
    -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11++), "baseMediaInvalidated");
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    -[NUMediaView setVideoEnabled:animated:](self->_mediaView, "setVideoEnabled:animated:", objc_msgSend(v6, "isVideoEnabled"), 1);
    if (!-[PUPhotoEditToolController suppressesEditUpdates](self->_currentEditingTool, "suppressesEditUpdates"))
    {
      -[PUPhotoEditViewController editSource](self, "editSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        mediaView = self->_mediaView;
        v14 = (void *)MEMORY[0x1E0D71660];
        -[PUPhotoEditViewController compositionController](self, "compositionController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController editSource](self, "editSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "validatedCompositionCopyFor:mediaType:", v15, objc_msgSend(v16, "mediaType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUMediaView setComposition:](mediaView, "setComposition:", v17);

        -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
      }
    }
  }

}

- (void)_performInEditRevertWithToolButton:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  -[PUPhotoEditViewController _toolControllerForTag:](self, "_toolControllerForTag:", objc_msgSend(a3, "tag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPhotoEditViewController _toolTypeForToolWithTag:](self, "_toolTypeForToolWithTag:", objc_msgSend(v4, "toolControllerTag"));
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
  -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PUPhotoEditViewController__performInEditRevertWithToolButton___block_invoke;
  v9[3] = &unk_1E58A4B10;
  v10 = v4;
  v11 = v5;
  v9[4] = self;
  v8 = v4;
  objc_msgSend(v6, "revertEditsForAsset:completionHandler:", v7, v9);

}

- (BOOL)_isInEditRevertTransitionSnapshotVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUPhotoEditViewController inEditRevertTransitionSnapshot](self, "inEditRevertTransitionSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_installInEditRevertTransitionSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];

  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setInEditRevertTransitionSnapshot:](self, "setInEditRevertTransitionSnapshot:", v4);

  -[PUPhotoEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController inEditRevertTransitionSnapshot](self, "inEditRevertTransitionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PUPhotoEditViewController__installInEditRevertTransitionSnapshot__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
}

- (void)_uninstallInEditRevertTransitionSnapshotAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  if (-[PUPhotoEditViewController _isInEditRevertTransitionSnapshotVisible](self, "_isInEditRevertTransitionSnapshotVisible"))
  {
    if (v3)
    {
      v6[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke;
      v7[3] = &unk_1E58ABD10;
      v7[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke_2;
      v6[3] = &unk_1E58A9910;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.3);
    }
    else
    {
      -[PUPhotoEditViewController inEditRevertTransitionSnapshot](self, "inEditRevertTransitionSnapshot");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[PUPhotoEditViewController setInEditRevertTransitionSnapshot:](self, "setInEditRevertTransitionSnapshot:", 0);
    }
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableSet copy](self->_assetsWaitingForLibraryNotification, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v4, "contentOrThumbnailChangedForAsset:", v11);
        PLPhotoEditGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (v12)
        {
          if (v14)
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController photoLibraryDidChangeOnMainQueue:] - change was for our photo", v15, 2u);
          }

          -[PUPhotoEditViewController _stopWaitingForAssetChangeWithAsset:success:](self, "_stopWaitingForAssetChangeWithAsset:success:", v11, 1);
        }
        else
        {
          if (v14)
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_INFO, "-[PUPhotoEditViewController photoLibraryDidChangeOnMainQueue:] - not for our photo", v15, 2u);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)photoLibraryChangesPausedDidChange
{
  void *v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "px_areChangesPaused");

  PLPhotoEditGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "PUPhotoEditViewController observed library changes pause change: %d", (uint8_t *)v5, 8u);
  }

}

- (void)_createPencilInteractionIfNeeded
{
  UIPencilInteraction *v4;
  UIPencilInteraction *pencilInteraction;
  NUMediaView *mediaView;
  void *v7;

  if (!self->_pencilInteraction)
  {
    v4 = (UIPencilInteraction *)objc_alloc_init(MEMORY[0x1E0DC3AC8]);
    pencilInteraction = self->_pencilInteraction;
    self->_pencilInteraction = v4;

    -[UIPencilInteraction setDelegate:](self->_pencilInteraction, "setDelegate:", self);
    mediaView = self->_mediaView;
    if (!mediaView)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 6109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_mediaView"));

      mediaView = self->_mediaView;
    }
    -[NUMediaView addInteraction:](mediaView, "addInteraction:", self->_pencilInteraction);
  }
}

- (void)_startMarkupSession
{
  void *v3;
  id v4;

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PUEditPluginSession beginMarkupSessionWithAsset:fromViewController:](self->_pluginSession, "beginMarkupSessionWithAsset:fromViewController:", v4, self);

  }
}

- (void)pencilInteractionDidTap:(id)a3
{
  void *v4;

  -[PUPhotoEditViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    && !-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo")
    && !-[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo"))
  {
    -[PUPhotoEditViewController _startMarkupSession](self, "_startMarkupSession");
  }
}

- (void)_installGestureRecognizer:(id)a3 type:(unint64_t)a4
{
  id v6;
  PUPhotoEditToolController *currentEditingTool;
  BOOL v8;
  void *v9;
  id v10;

  v6 = a3;
  currentEditingTool = self->_currentEditingTool;
  v10 = v6;
  if (currentEditingTool
    && (v8 = -[PUPhotoEditToolController supportsGesturesOfType:](currentEditingTool, "supportsGesturesOfType:", a4),
        v6 = v10,
        !v8))
  {
    objc_msgSend(v10, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", v10);

  }
  else
  {
    -[NUMediaView addGestureRecognizer:](self->_mediaView, "addGestureRecognizer:", v6);
  }

}

- (void)_updateTogglePreviewGestureRecognizer
{
  UITapGestureRecognizer *togglePreviewTapGestureRecognizer;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  uint64_t v6;
  PUPhotoEditToolController *currentEditingTool;

  togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  if (!togglePreviewTapGestureRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTogglePreviewTapGesture_);
    v5 = self->_togglePreviewTapGestureRecognizer;
    self->_togglePreviewTapGestureRecognizer = v4;

    -[UITapGestureRecognizer setDelegate:](self->_togglePreviewTapGestureRecognizer, "setDelegate:", self);
    togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  }
  -[PUPhotoEditViewController _installGestureRecognizer:type:](self, "_installGestureRecognizer:type:", togglePreviewTapGestureRecognizer, 0);
  if (self->_livePhotoIsPlaying)
  {
    v6 = 0;
  }
  else
  {
    currentEditingTool = self->_currentEditingTool;
    if (currentEditingTool)
      v6 = -[PUPhotoEditToolController wantsTapToToggleOriginalEnabled](currentEditingTool, "wantsTapToToggleOriginalEnabled");
    else
      v6 = 1;
  }
  -[UITapGestureRecognizer setEnabled:](self->_togglePreviewTapGestureRecognizer, "setEnabled:", v6);
}

- (void)_handleTogglePreviewTapGesture:(id)a3
{
  UITapGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  UITapGestureRecognizer *v11;

  v4 = (UITapGestureRecognizer *)a3;
  if (self->_togglePreviewTapGestureRecognizer == v4)
  {
    v11 = v4;
    v5 = -[UITapGestureRecognizer state](v4, "state") == 3;
    v4 = v11;
    if (v5)
    {
      -[PUPhotoEditViewController compositionController](self, "compositionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v11;
      if (v6)
      {
        -[UITapGestureRecognizer touches](v11, "touches");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "type");
        if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo")
          || (v10 = -[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo"), v9 != 2)
          || v10)
        {
          -[PUPhotoEditViewController _toggleShowOriginal](self, "_toggleShowOriginal");
        }
        else
        {
          -[PUPhotoEditViewController _startMarkupSession](self, "_startMarkupSession");
        }

        v4 = v11;
      }
    }
  }

}

- (void)_toggleShowOriginal
{
  _BOOL8 v3;
  void *v4;

  if (-[PUPhotoEditViewController togglingShowOriginal](self, "togglingShowOriginal"))
  {
    self->_showOriginalButtonTapped = 0;
  }
  else
  {
    if (-[PUPhotoEditViewController shouldBePreviewingOriginal](self, "shouldBePreviewingOriginal"))
    {
      v3 = 0;
    }
    else
    {
      -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "resourcesAvailability") == 3;

    }
    -[PUPhotoEditViewController setShouldBePreviewingOriginal:](self, "setShouldBePreviewingOriginal:", v3);
    -[PUPhotoEditViewController setTogglingShowOriginal:](self, "setTogglingShowOriginal:", v3);
  }
}

- (void)_startShowingOriginalBadge
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  _QWORD v12[6];

  -[PUPhotoEditViewController _updateTransientStatusBadgeForPreviewingOriginal](self, "_updateTransientStatusBadgeForPreviewingOriginal");
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "previewOriginalTimesOut")
    && (-[PUPhotoEditToolController wantsTapToToggleOriginalEnabled](self->_currentEditingTool, "wantsTapToToggleOriginalEnabled")|| self->_showOriginalButtonTapped))
  {
    v4 = self->_togglePreviewOriginalOffRequestID + 1;
    self->_togglePreviewOriginalOffRequestID = v4;
    objc_msgSend(v3, "previewOriginalDuration");
    v6 = v5;
    -[PUPhotoEditViewController photo](self, "photo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canPlayLoopingVideo");
    v9 = 1.0;
    if (v8)
      v9 = 2.0;
    v10 = v6 * v9;

    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__PUPhotoEditViewController__startShowingOriginalBadge__block_invoke;
    v12[3] = &unk_1E58AACF0;
    v12[4] = self;
    v12[5] = v4;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v12);
  }
  self->_showOriginalButtonTapped = 0;

}

- (void)_updateSwipeDownGestureRecognizer
{
  UISwipeGestureRecognizer *swipeDownGestureRecognizer;
  void *v4;
  int v5;
  UISwipeGestureRecognizer *v6;
  UISwipeGestureRecognizer *v7;

  swipeDownGestureRecognizer = self->_swipeDownGestureRecognizer;
  if (swipeDownGestureRecognizer)
    goto LABEL_5;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "swipeToExitEdit");

  if (v5)
  {
    v6 = (UISwipeGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel__handleSwipeDownGesture_);
    v7 = self->_swipeDownGestureRecognizer;
    self->_swipeDownGestureRecognizer = v6;

    -[UISwipeGestureRecognizer setDelegate:](self->_swipeDownGestureRecognizer, "setDelegate:", self);
    -[UISwipeGestureRecognizer setDirection:](self->_swipeDownGestureRecognizer, "setDirection:", 8);
  }
  swipeDownGestureRecognizer = self->_swipeDownGestureRecognizer;
  if (swipeDownGestureRecognizer)
LABEL_5:
    -[PUPhotoEditViewController _installGestureRecognizer:type:](self, "_installGestureRecognizer:type:", swipeDownGestureRecognizer, 2);
}

- (void)_handleSwipeDownGesture:(id)a3
{
  if (self->_swipeDownGestureRecognizer == a3 && objc_msgSend(a3, "state") == 3)
  {
    self->_inProgressSaveIsFromSwipe = 1;
    -[PUPhotoEditViewController _handle1upToggleButton:](self, "_handle1upToggleButton:", 0);
  }
}

- (id)_livePhotoGestureRecognizer
{
  NUMediaView *mediaView;
  void *v3;
  void *v4;

  mediaView = self->_mediaView;
  if (mediaView)
  {
    -[NUMediaView _livePhotoView](mediaView, "_livePhotoView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playbackGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_updateLivePhotoPlaybackGestureRecognizer
{
  uint64_t v3;
  PUPhotoEditToolController *currentEditingTool;
  id v5;

  if (!-[PUPhotoEditToolController suppressesEditUpdates](self->_currentEditingTool, "suppressesEditUpdates"))
  {
    -[PUPhotoEditViewController _livePhotoGestureRecognizer](self, "_livePhotoGestureRecognizer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = 1;
    -[PUPhotoEditViewController _installGestureRecognizer:type:](self, "_installGestureRecognizer:type:", v5, 1);
    objc_msgSend(v5, "setDelegate:", self);
    currentEditingTool = self->_currentEditingTool;
    if (currentEditingTool)
      v3 = -[PUPhotoEditToolController wantsDefaultPreviewView](currentEditingTool, "wantsDefaultPreviewView");
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  UITapGestureRecognizer *togglePreviewTapGestureRecognizer;
  PUPhotoEditToolController *currentEditingTool;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  PUAdjustmentsToolController *v32;
  BOOL v33;
  int v34;
  void *v35;
  char v36;
  CGPoint v38;
  CGRect v39;

  v4 = a3;
  -[PUPhotoEditViewController _livePhotoGestureRecognizer](self, "_livePhotoGestureRecognizer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  if (togglePreviewTapGestureRecognizer != v4 && v5 != (_QWORD)v4)
  {
    LOBYTE(v34) = 1;
    goto LABEL_16;
  }
  currentEditingTool = self->_currentEditingTool;
  if (!currentEditingTool)
  {
    LOBYTE(v34) = 1;
    goto LABEL_14;
  }
  -[PUPhotoEditToolController view](currentEditingTool, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[PUPhotoEditToolController preferredPreviewViewInsets](self->_currentEditingTool, "preferredPreviewViewInsets");
  -[PUPhotoEditToolController additionalPreviewViewInsets](self->_currentEditingTool, "additionalPreviewViewInsets");
  UIEdgeInsetsAdd();
  v20 = v12 + v19;
  v22 = v14 + v21;
  v24 = v16 - (v19 + v23);
  v26 = v18 - (v21 + v25);
  -[PUPhotoEditToolController view](self->_currentEditingTool, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v27);
  v29 = v28;
  v31 = v30;

  v39.origin.x = v20;
  v39.origin.y = v22;
  v39.size.width = v24;
  v39.size.height = v26;
  v38.x = v29;
  v38.y = v31;
  v34 = CGRectContainsPoint(v39, v38);
  v32 = (PUAdjustmentsToolController *)self->_currentEditingTool;
  if (v32 == self->_adjustmentsController)
  {
    v33 = 0;
    if (!v34)
      goto LABEL_14;
LABEL_12:
    if (!v33)
      LOBYTE(v34) = -[PUPhotoEditToolController gestureRecognizerShouldBegin:](v32, "gestureRecognizerShouldBegin:", v4);
    goto LABEL_14;
  }
  v33 = v32 != (PUAdjustmentsToolController *)self->_filtersController;
  if (v34)
    goto LABEL_12;
LABEL_14:
  if (v6 == v4)
  {
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isVideoEnabled");

    LOBYTE(v34) = v36 & v34;
  }
LABEL_16:
  if (self->_currentEditingTool == &self->_mediaToolController->super
    && -[PUPhotoEditViewController isPortraitVideo](self, "isPortraitVideo"))
  {
    LOBYTE(v34) = togglePreviewTapGestureRecognizer != v4;
  }

  return v34;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  BOOL v7;
  UITapGestureRecognizer *togglePreviewTapGestureRecognizer;

  v5 = (UITapGestureRecognizer *)a3;
  -[PUPhotoEditViewController _livePhotoGestureRecognizer](self, "_livePhotoGestureRecognizer");
  v6 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == v5;

  togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  if (togglePreviewTapGestureRecognizer == v5)
    return -[PUPhotoEditToolPickerController selectedToolTag](self->_toolPickerController, "selectedToolTag") != 1005
        || v6 == v5;
  return v7;
}

- (void)_loadPhotoEditResourcesIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditViewController editSource](self, "editSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || objc_msgSend(v4, "resourcesAvailability") == 1 || objc_msgSend(v4, "resourcesAvailability") == 2)
  {
LABEL_15:

    goto LABEL_16;
  }
  if (v7)
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v4)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 6329, CFSTR("Cannot have a nil asset"));

      if (!v4)
        goto LABEL_8;
    }
    objc_msgSend(v4, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v8)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaType:", objc_msgSend(v8, "mediaType"));
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaSubtypes:", objc_msgSend(v8, "mediaSubtypes"));
      v16 = objc_claimAutoreleasedReturnValue();
      PLPhotoEditGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v18;
        v35 = 2114;
        v36 = v15;
        v37 = 2114;
        v38 = v16;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_INFO, "Asset [%{public}@] of type: %{public}@ and subtype: %{public}@ loaded for editing.", buf, 0x20u);

      }
      v32 = (void *)v16;

      -[PUPhotoEditViewController compositionController](self, "compositionController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "pu_workImageSize");
      v21 = v20;
      v23 = v22;
      v24 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");
      -[PUPhotoEditViewController photo](self, "photo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v26 = (void *)v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PUPhotoEditViewController photo](self, "photo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
      }

      objc_msgSend(v27, "fetchPropertySetsIfNeeded");
      objc_msgSend(v27, "spatialMediaProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "spatialMediaType") == 2;

      v30 = objc_alloc_init(MEMORY[0x1E0D7CB20]);
      objc_msgSend(v30, "setRequireAdjustments:", v19 == 0);
      objc_msgSend(v30, "setRequireLocalResources:", 1);
      objc_msgSend(v30, "setVersion:", v24);
      objc_msgSend(v30, "setDelegate:", self);
      objc_msgSend(v30, "setTargetSize:", v21, v23);
      objc_msgSend(v30, "setRequireOriginalsDownloaded:", v29);
      objc_msgSend(v4, "enqueueRequest:", v30);
      -[PUPhotoEditViewController _didStartResourceLoading](self, "_didStartResourceLoading");

      goto LABEL_15;
    }
LABEL_8:
    v10 = objc_alloc(MEMORY[0x1E0D7CB28]);
    v11 = (void *)objc_msgSend(v10, "initWithAsset:loadingQueue:", v8, MEMORY[0x1E0C80D38]);

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSkipDisplaySizeImage:", objc_msgSend(v12, "skipPHContentEditingInputDisplaySizeImage"));

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSimulateEditEntryError:", objc_msgSend(v13, "simulateEditEntryError"));

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSimulateEditEntryError:", objc_msgSend(v14, "simulatedEditingEntryErrorType") != 0);

    -[PUPhotoEditViewController setResourceLoader:](self, "setResourceLoader:", v11);
    v4 = v11;
    goto LABEL_9;
  }
LABEL_16:

}

- (void)_loadOriginalImageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PUPhotoEditViewController resourceLoader](self, "resourceLoader");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditViewController originalImageEditSource](self, "originalImageEditSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6 && v11)
  {
    if (objc_msgSend(v11, "resourcesAvailability") == 1 || objc_msgSend(v11, "resourcesAvailability") == 2)
    {
      v6 = 0;
    }
    else
    {
      if (!v5)
        goto LABEL_7;
      objc_msgSend(v5, "pu_workImageSize");
      v8 = v7;
      v10 = v9;
      v6 = objc_alloc_init(MEMORY[0x1E0D7CB20]);
      objc_msgSend(v6, "setVersion:", 1);
      objc_msgSend(v6, "setRequireLocalResources:", 1);
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "setTargetSize:", v8, v10);
      objc_msgSend(v11, "enqueueRequest:", v6);
      -[PUPhotoEditViewController _didStartResourceLoading](self, "_didStartResourceLoading");
    }
  }

LABEL_7:
}

- (void)photoEditResourceLoadRequestResourcesAvailabilityChanged:(id)a3 previousAvailability:(int64_t)a4 currentAvailability:(int64_t)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state");

  if (v9 == 1)
  {
    if (a4 == 1 || a5 != 1)
    {
      if (a4 == 1 && a5 != 1)
      {
        -[PUPhotoEditViewController resourceCheckingInterval](self, "resourceCheckingInterval");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endInterval");

      }
      if (a4 != 2 && a5 == 2)
      {
        -[PUPhotoEditViewController resourceDownloadInterval](self, "resourceDownloadInterval");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "beginInterval");
LABEL_14:

        return;
      }
    }
    else
    {
      -[PUPhotoEditViewController resourceCheckingInterval](self, "resourceCheckingInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginInterval");

    }
    if (a4 == 2 && a5 != 2)
    {
      -[PUPhotoEditViewController resourceDownloadInterval](self, "resourceDownloadInterval");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endInterval");
      goto LABEL_14;
    }
  }
}

- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *, int);
  void *v18;
  PUPhotoEditViewController *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[PUPhotoEditViewController photo](self, "photo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D7B1F8];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke;
  v23[3] = &unk_1E58A5298;
  v23[4] = self;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke_2;
  v18 = &unk_1E58A4B38;
  v19 = self;
  v13 = v10;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v12, "checkIsSupportedAndPresentAlertForAsset:type:alertControllerPresenter:completionHandler:", v11, 0, v23, &v15);
  -[PUPhotoEditViewController _didEndResourceLoading](self, "_didEndResourceLoading", v15, v16, v17, v18, v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PUEditingErrorPresentationController *v12;
  void *v13;
  PUEditingErrorPresentationController *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUPhotoEditViewController _didEndResourceLoading](self, "_didEndResourceLoading");
  -[PUPhotoEditViewController _didEndEnterEdit](self, "_didEndEnterEdit");
  -[PUPhotoEditViewController _handleResourceLoadChange](self, "_handleResourceLoadChange");
  -[PUPhotoEditViewController initialPendingEditsRequest](self, "initialPendingEditsRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishedWithSuccess:error:", 0, v10);

  -[PUPhotoEditViewController _uninstallInEditRevertTransitionSnapshotAnimated:](self, "_uninstallInEditRevertTransitionSnapshotAnimated:", 0);
  if (objc_msgSend(v10, "code") != 3072)
  {
    v12 = [PUEditingErrorPresentationController alloc];
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUEditingErrorPresentationController initWithError:forAsset:](v12, "initWithError:forAsset:", v10, v13);

    objc_initWeak(&location, self);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __78__PUPhotoEditViewController_resourceLoader_request_mediaLoadDidFailWithError___block_invoke;
    v19 = &unk_1E58AB2F8;
    objc_copyWeak(&v20, &location);
    -[PUErrorPresentationController alertControllerWithCompletion:](v14, "alertControllerWithCompletion:", &v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0, v16, v17, v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5
{
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1, a4);
  -[PUProgressIndicatorView setCurrentProgress:](self->_progressIndicatorView, "setCurrentProgress:", a5);
}

- (void)_handleDidLoadAdjustmentsAndBaseImageWithResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  NSString *pluginSessionIdentifier;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSArray *coreToolButtons;
  NSArray *coreToolButtonViews;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "retrievedVersion");
  objc_msgSend(v4, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "composition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController quickCropContext](self, "quickCropContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "composition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyCropRectToCompositionController:", v9);
    -[PUPhotoEditViewController undoManager](self, "undoManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "isUndoing") & 1) == 0 && (objc_msgSend(v14, "isRedoing") & 1) == 0)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B358]), "initWithCompositionController:sourceComposition:", v9, v12);
      PULocalizedString(CFSTR("PHOTOEDIT_CROP_GENERIC_ACTION_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLocalizedActionName:", v16);

      objc_msgSend(v15, "registerWithUndoManager:", v14);
    }

  }
  if (objc_msgSend(v4, "penultimateAvailability"))
    v17 = objc_msgSend(v4, "penultimateAvailability") == 1;
  else
    v17 = -[PUPhotoEditViewController isPenultimateAvailable](self, "isPenultimateAvailable");
  objc_msgSend(v4, "editSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (self->_pluginSessionIdentifier)
  {
    objc_msgSend(v18, "setIdentifier:");
    pluginSessionIdentifier = self->_pluginSessionIdentifier;
    self->_pluginSessionIdentifier = 0;

  }
  PLPhotoEditGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LOWORD(v38) = 0;
    _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_INFO, "processing adjustments", (uint8_t *)&v38, 2u);
  }

  -[PUPhotoEditViewController setEditSource:](self, "setEditSource:", v19);
  objc_msgSend(v4, "contentEditingInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setEditSourceContentEditingInput:](self, "setEditSourceContentEditingInput:", v22);

  -[PUPhotoEditViewController setHasLoadedRaw:](self, "setHasLoadedRaw:", objc_msgSend(v4, "assetLoadingAsRaw"));
  -[PUPhotoEditViewController setWorkImageVersion:](self, "setWorkImageVersion:", v5);
  -[PUPhotoEditViewController setPenultimateAvailable:](self, "setPenultimateAvailable:", v17);
  -[PUPhotoEditViewController setCompositionController:](self, "setCompositionController:", v9);
  objc_msgSend(v4, "originalComposition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setOriginalComposition:](self, "setOriginalComposition:", v23);

  -[PUPhotoEditViewController setUneditedComposition:](self, "setUneditedComposition:", v10);
  -[PUPhotoEditViewController _updatePhotoEditIrisModel](self, "_updatePhotoEditIrisModel");
  v24 = objc_msgSend(v4, "assetLoadingAsRaw");
  -[PUPhotoEditViewController enterEditEventBuilder](self, "enterEditEventBuilder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEditingWithRaw:", v24);

  v26 = objc_msgSend(v4, "assetLoadingAsRaw");
  -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEditingWithRaw:", v26);

  if (self->_needToReloadTools)
  {
    coreToolButtons = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    coreToolButtonViews = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    self->_toolbarButtonsValid = 0;
    -[PUPhotoEditViewController _loadToolsIfNeeded:](self, "_loadToolsIfNeeded:", 1);
    self->_needToReloadTools = 0;
  }
  if (v4)
    objc_msgSend(v4, "videoComplementOriginalStillImageTime");
  else
    memset(v39, 0, sizeof(v39));
  -[PUPhotoEditViewController setOriginalStillImageTime:](self, "setOriginalStillImageTime:", v39);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71990]), "initWithEditSource:", v19);
  objc_msgSend(v19, "source");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSource:mediaType:", v31, objc_msgSend(v19, "mediaType"));

  objc_msgSend(v30, "setCompositionController:", v9);
  -[PUPhotoEditViewController setMainRenderer:](self, "setMainRenderer:", v30);
  objc_msgSend(v4, "imageURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = v32;
  }
  else
  {
    objc_msgSend(v4, "videoComplementURL");
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = v34;

  if (v5 == 1 && v35)
  {
    objc_msgSend(v4, "editSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController _setOriginalURL:originalEditSource:](self, "_setOriginalURL:originalEditSource:", v35, v36);

  }
  v37 = objc_initWeak(&v38, self);
  -[PUPhotoEditViewController _continueLoadingWithAutocalculators](self, "_continueLoadingWithAutocalculators");

  objc_destroyWeak(&v38);
}

- (void)_continueLoadingWithAutocalculators
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  id *location;
  id *locationa;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[4];
  id v43;
  _QWORD v44[5];
  NSObject *v45;
  id v46[2];
  _QWORD v47[5];
  NSObject *v48;
  id v49;
  id buf;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  PLPhotoEditGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "starting auto calculators", (uint8_t *)&buf, 2u);
  }

  v5 = dispatch_group_create();
  objc_initWeak(&buf, self);
  -[PUPhotoEditViewController setRunningAutoCalculators:](self, "setRunningAutoCalculators:", 1);
  -[PUPhotoEditViewController _updateValuesCalculator](self, "_updateValuesCalculator");
  dispatch_group_enter(v5);
  -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke;
  v47[3] = &unk_1E58AA2E0;
  location = &v49;
  objc_copyWeak(&v49, &buf);
  v47[4] = self;
  v8 = v5;
  v48 = v8;
  objc_msgSend(v6, "precomputeImageValuesWithCompletion:", v47);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52178]), "initWithName:", CFSTR("PUPhotoEditViewController-raw-property"));
  dispatch_group_enter(v8);
  -[PUPhotoEditViewController _composition](self, "_composition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v7;
  v44[1] = 3221225472;
  v44[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_712;
  v44[3] = &unk_1E58A4B60;
  objc_copyWeak(v46, &buf);
  v46[1] = (id)a2;
  v44[4] = self;
  v11 = v8;
  v45 = v11;
  objc_msgSend(v9, "submitPropertiesRequestForComposition:completion:", v10, v44);

  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_716;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v43, &buf);
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);
  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
  self->_isTransitioningFromDownloadingToRunningAutoCalculators = 1;
  -[PUPhotoEditViewController _handleResourceLoadChange](self, "_handleResourceLoadChange");
  self->_isTransitioningFromDownloadingToRunningAutoCalculators = 0;
  -[PUPhotoEditViewController editSource](self, "editSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "mediaType") != 3)
  {
    -[PUPhotoEditViewController photo](self, "photo", &v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isLivePhoto");

    if (!v14)
      goto LABEL_7;
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyCannotSupportVideoEdits");
  }

LABEL_7:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", location);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "basePhotoInvalidated");
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v16);
  }

  -[PUPhotoEditViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNeedsLayout");

  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
  -[PUPhotoEditViewController _updateMutedState](self, "_updateMutedState");
  -[PUPhotoEditViewController _updateMediaViewPlaybackStyle](self, "_updateMediaViewPlaybackStyle");
  -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
  -[PUPhotoEditViewController photo](self, "photo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isOriginalRaw"))
    goto LABEL_21;
  -[PUPhotoEditViewController photo](self, "photo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "originalResourceChoice") != 3)
  {

LABEL_21:
    goto LABEL_22;
  }
  -[PUPhotoEditViewController photo](self, "photo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isAdjusted");

  if (v23)
  {
    if (+[PUPhotoEditSupport currentDeviceShouldAllowRawDecode](PUPhotoEditSupport, "currentDeviceShouldAllowRawDecode"))
    {
      v24 = (void *)MEMORY[0x1E0D75130];
      -[PUPhotoEditViewController imageProperties](self, "imageProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "metadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = objc_msgSend(v24, "canLoadAssetAsRawForInteractiveEditingWithImageProperties:", v26);

      if ((_DWORD)v24)
        -[PUPhotoEditViewController _showJpegPreviewForRawRevertAlert](self, "_showJpegPreviewForRawRevertAlert");
    }
  }
LABEL_22:
  if (-[PUPhotoEditViewController currentAssetNeedsGainMap](self, "currentAssetNeedsGainMap"))
  {
    v27 = objc_alloc(MEMORY[0x1E0D51FF0]);
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "composition");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithComposition:", v29);

    objc_msgSend(v30, "setAuxiliaryImageType:", 7);
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2_719;
    v36[3] = &unk_1E58A79E0;
    objc_copyWeak(&v37, &buf);
    objc_msgSend(v30, "submit:", v36);
    objc_msgSend(MEMORY[0x1E0D71268], "sourceFilterNoOrientation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPipelineFilters:", v32);

    objc_msgSend(v30, "setName:", CFSTR("PUPhotoEditViewController-renderMeteorPlusGainMap-crop"));
    -[PUPhotoEditViewController _addCropToolGainMapWithRequest:](self, "_addCropToolGainMapWithRequest:", v30);
    objc_destroyWeak(&v37);

  }
  else
  {
    -[PUPhotoEditViewController setGainMapImage:](self, "setGainMapImage:", 0);
    -[PUCropToolController setGainMapImage:](self->_cropController, "setGainMapImage:", 0);
    LODWORD(v33) = 0;
    -[PUPhotoEditViewController setGainMapValue:](self, "setGainMapValue:", v33);
  }
  objc_destroyWeak(&v43);

  objc_destroyWeak(v46);
  objc_destroyWeak(locationa);
  objc_destroyWeak(&buf);

}

- (void)_updateMediaViewPlaybackStyle
{
  _BOOL8 v3;
  _BOOL8 v4;
  NUMediaView *mediaView;
  void *v6;

  v3 = -[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo");
  v4 = v3 || -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo");
  -[NUMediaView setVideoEnabled:animated:](self->_mediaView, "setVideoEnabled:animated:", v4, v3);
  -[NUMediaView setLoopsVideoPlayback:](self->_mediaView, "setLoopsVideoPlayback:", v3);
  mediaView = self->_mediaView;
  -[PUPhotoEditViewController _composition](self, "_composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUMediaView setComposition:](mediaView, "setComposition:", v6);

  if (v4)
    -[PUPhotoEditViewController _updatePluginSession](self, "_updatePluginSession");
}

- (BOOL)isStandardVideo
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediaType");

  -[PUPhotoEditViewController photo](self, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPlayLoopingVideo");

  if (v4 == 2)
    return v6 ^ 1;
  else
    return 0;
}

- (BOOL)isSpatialMedia
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  -[PUPhotoEditViewController photo](self, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  if ((objc_msgSend(v4, "isSpatialMedia") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "isSpatialMedia");

  return v7;
}

- (BOOL)_enableSpatialMediaEditing
{
  void *v3;
  void *v4;
  BOOL v5;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "enableSpatialMediaEditing"))
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mediaType") != 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isLoopingVideo
{
  return -[PUPhotoEditViewController _isLoopingVideo:](self, "_isLoopingVideo:", 1);
}

- (BOOL)isHighframeRateVideo
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PUPhotoEditViewController editSource](self, "editSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PUPhotoEditViewController playbackRateOptions](self, "playbackRateOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v5;
}

- (BOOL)isPortraitVideo
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;

  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_hasCheckedPortraitVideo)
      return self->_isAssetPortraitVideo;
    self->_isAssetPortraitVideo = 0;
    -[PUPhotoEditViewController photo](self, "photo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsAllMetadata"))
    {
      -[PUPhotoEditViewController editSource](self, "editSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_9:
        self->_hasCheckedPortraitVideo = 1;
        return self->_isAssetPortraitVideo;
      }
      v7 = (void *)MEMORY[0x1E0C8AF90];
      -[PUPhotoEditViewController editSource](self, "editSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetWithURL:", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x1E0D71178], "assetIsCinematicVideo:", v4))
      {
        if (objc_msgSend(MEMORY[0x1E0D71178], "currentSystemCanRenderAsset:", v4))
          self->_isAssetPortraitVideo = 1;
      }
    }

    goto LABEL_9;
  }
  return 0;
}

- (BOOL)isCinematicAudio
{
  int IsRenderSupported;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;

  IsRenderSupported = _os_feature_enabled_impl();
  if (IsRenderSupported)
  {
    IsRenderSupported = PICinematicAudioIsRenderSupported();
    if (IsRenderSupported)
    {
      -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        LOBYTE(IsRenderSupported) = 0;
        return IsRenderSupported;
      }
      if (self->_hasCheckedCinematicAudio)
        goto LABEL_11;
      self->_isAssetCinematicAudio = 0;
      -[PUPhotoEditViewController photo](self, "photo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsAllMetadata"))
      {
        -[PUPhotoEditViewController editSource](self, "editSource");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_10:
          self->_hasCheckedCinematicAudio = 1;
LABEL_11:
          LOBYTE(IsRenderSupported) = self->_isAssetCinematicAudio;
          return IsRenderSupported;
        }
        v8 = (void *)MEMORY[0x1E0C8AF90];
        -[PUPhotoEditViewController editSource](self, "editSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "videoURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "assetWithURL:", v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x1E0D52348], "assetIsCinematicAudio:", v5))
          self->_isAssetCinematicAudio = 1;
      }

      goto LABEL_10;
    }
  }
  return IsRenderSupported;
}

- (id)playbackRateOptions
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *playbackRateOptions;
  NSArray *v10;

  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "baseVersion"))
  {

LABEL_8:
    v10 = 0;
    return v10;
  }
  v4 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");

  if (v4 != 1)
    goto LABEL_8;
  if (!self->_playbackRateOptions)
  {
    -[PUPhotoEditViewController editSource](self, "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D7CB18];
      -[PUPhotoEditViewController editSource](self, "editSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "playbackRateOptionsForEditSource:", v7);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      playbackRateOptions = self->_playbackRateOptions;
      self->_playbackRateOptions = v8;

    }
  }
  v10 = self->_playbackRateOptions;
  return v10;
}

- (void)initialCinematographyLoadComplete
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D71180]);
    -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "initWithComposition:", v5);

    objc_msgSend(v9, "adjustmentConstants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PIPortraitVideoAdjustmentKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PUPhotoEditViewController_initialCinematographyLoadComplete__block_invoke;
    v10[3] = &unk_1E58A4B88;
    v10[4] = self;
    objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v7, v10);

    objc_msgSend(v9, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController setUneditedComposition:](self, "setUneditedComposition:", v8);

    -[PUPhotoEditViewController _updateMainActionButtonAnimated:](self, "_updateMainActionButtonAnimated:", 1);
    -[PUPhotoEditViewController _updateShowOriginalButtonAnimated:](self, "_updateShowOriginalButtonAnimated:", 1);

  }
}

- (BOOL)hasLoopingVideoAdjustment
{
  return -[PUPhotoEditViewController _isLoopingVideo:](self, "_isLoopingVideo:", 0);
}

- (BOOL)_isLoopingVideo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v3 = a3;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mediaType");

  if (v7 == 2 || !v5)
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canPlayLoopingVideo");
  }
  else
  {
    objc_msgSend(v5, "autoLoopAdjustmentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "enabled") & 1) != 0 || !v3)
    {
      objc_msgSend(v8, "flavor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PIAutoLoopFlavorFromString();

      if (v11)
        v12 = v11 == 3;
      else
        v12 = 1;
      v9 = !v12;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_isLivePhotoEffect
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLivePhoto");

  if (v4)
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autoLoopAdjustmentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "enabled"))
    {
      objc_msgSend(v6, "flavor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PIAutoLoopFlavorFromString();

      LOBYTE(v4) = v8 == 2 || (v8 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (void)_handleDidLoadOriginalWithResult:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "imageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v6, "videoComplementURL"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v6, "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController _setOriginalURL:originalEditSource:](self, "_setOriginalURL:originalEditSource:", v4, v5);

  }
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);

}

- (void)_handleResourceLoadChange
{
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 1);
}

- (void)mediaDestination:(id)a3 willBeginSaveRequest:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PUPhotoEditViewController_mediaDestination_willBeginSaveRequest___block_invoke;
  v8[3] = &unk_1E58ABD10;
  v9 = v5;
  v7 = v5;
  -[PUPhotoEditViewController setSaveBackgroundTaskIdentifier:](self, "setSaveBackgroundTaskIdentifier:", objc_msgSend(v6, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("PhotoKit Edits Save"), v8));

}

- (void)mediaDestination:(id)a3 didCompleteSaveRequest:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBackgroundTask:", -[PUPhotoEditViewController saveBackgroundTaskIdentifier](self, "saveBackgroundTaskIdentifier"));

}

- (void)_updateValuesCalculator
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[PUPhotoEditViewController editSource](self, "editSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0D7CB60]);
        objc_msgSend(v4, "setDelegate:", self);
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSettingsDelegate:", v5);

        -[PUPhotoEditViewController setValuesCalculator:](self, "setValuesCalculator:", v4);
      }
      objc_msgSend(v4, "setEditSource:", v7);
      -[PUPhotoEditViewController compositionController](self, "compositionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCompositionController:", v6);

      -[PUPhotoEditViewController _setupToolsIfNeeded](self, "_setupToolsIfNeeded");
      -[PUPhotoEditViewController _updateKeyCommands](self, "_updateKeyCommands");

    }
  }

}

- (void)setCompositionController:(id)a3
{
  PICompositionController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PICompositionController *v11;

  v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    -[PUPhotoEditViewController editSource](self, "editSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUPhotoEditViewController editSource](self, "editSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController editSource](self, "editSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PICompositionController setSource:mediaType:](v11, "setSource:mediaType:", v8, objc_msgSend(v9, "mediaType"));

    }
    -[PUPhotoEditViewController _updateMainActionButtonAnimated:](self, "_updateMainActionButtonAnimated:", 1);
    -[PUPhotoEditViewController _updateShowOriginalButtonAnimated:](self, "_updateShowOriginalButtonAnimated:", 1);
    -[PICompositionController setChangeDelegate:](v11, "setChangeDelegate:", self);
    -[PUPhotoEditViewController _updateModelDependentControlsAnimated:](self, "_updateModelDependentControlsAnimated:", 0);
    -[PUPhotoEditViewController _updateValuesCalculator](self, "_updateValuesCalculator");
    -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "precomputeImageValues");

    -[PUPhotoEditViewController _setupToolsIfNeeded](self, "_setupToolsIfNeeded");
    -[PUPhotoEditViewController _updateKeyCommands](self, "_updateKeyCommands");
    v5 = v11;
  }

}

- (void)setUneditedComposition:(id)a3
{
  NUComposition *v4;
  NUComposition *uneditedComposition;

  if (self->_uneditedComposition != a3)
  {
    v4 = (NUComposition *)objc_msgSend(a3, "copy");
    uneditedComposition = self->_uneditedComposition;
    self->_uneditedComposition = v4;

    -[PUPhotoEditViewController _updateModelDependentControlsAnimated:](self, "_updateModelDependentControlsAnimated:", 0);
  }
}

- (void)_setOriginalURL:(id)a3 originalEditSource:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if (!self->_originalImageEditSource)
  {
    objc_storeStrong((id *)&self->_originalImageEditSource, a4);
    if (objc_msgSend(v7, "mediaType") != 2)
      PLGetOrientationAndUntransformedSizeFromImageURL();
    self->_originalImageExifOrientation = PLOrientationIsValid() == 0;
    -[PUPhotoEditViewController _updatePreviewingOriginal](self, "_updatePreviewingOriginal");
  }

}

- (void)setOriginalStillImageTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_originalStillImageTime;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime time2;
  CMTime time1;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_originalStillImageTime = &self->_originalStillImageTime;
  time1 = *(CMTime *)a3;
  time2 = (CMTime)self->_originalStillImageTime;
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->__allTools;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          time1 = (CMTime)*a3;
          objc_msgSend(v11, "setOriginalStillImageTime:", &time1, (_QWORD)v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v8);
    }

    v12 = *(_OWORD *)&a3->var0;
    p_originalStillImageTime->epoch = a3->var3;
    *(_OWORD *)&p_originalStillImageTime->value = v12;
  }
}

- (id)_orientedCIImageFromUIImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoEditViewController photo](self, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = *MEMORY[0x1E0C9E140];
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)MEMORY[0x1E0C9DDC8];
  v9 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "imageWithCGImage:options:", objc_msgSend(v9, "CGImage"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageOrientation");

  objc_msgSend(v10, "imageByApplyingOrientation:", PLExifOrientationFromImageOrientation());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_resetModelAndBaseImagesToWorkImageVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUPhotoEditViewController setWorkImageVersion:](self, "setWorkImageVersion:", a3);
  v4 = (void *)MEMORY[0x1E0D71260];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D71260], "newComposition");
  v13 = (id)objc_msgSend(v4, "newCompositionControllerWithComposition:", v5);

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImageOrientation:", objc_msgSend(v6, "imageOrientation"));

  -[PUPhotoEditViewController editSource](self, "editSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController editSource](self, "editSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSource:mediaType:", v8, objc_msgSend(v9, "mediaType"));

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyChangesFromCompositionController:", v13);

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setUneditedComposition:](self, "setUneditedComposition:", v12);

  -[PUPhotoEditViewController setEditSource:](self, "setEditSource:", 0);
  -[PUPhotoEditViewController setMainRenderer:](self, "setMainRenderer:", 0);
  -[PUPhotoEditViewController _updateModelDependentControlsAnimated:](self, "_updateModelDependentControlsAnimated:", 0);
  -[PUPhotoEditViewController _updateValuesCalculator](self, "_updateValuesCalculator");
  -[PUPhotoEditViewController _updatePhotoEditIrisModel](self, "_updatePhotoEditIrisModel");

}

- (void)_updatePhotoEditIrisModel
{
  void *v3;
  void *v4;
  PUPhotoEditIrisModel *v5;
  id v6;

  -[PUPhotoEditViewController photo](self, "photo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v6 && objc_msgSend(v6, "isLivePhoto"))
  {
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterChangeObserver:", self);

    v5 = -[PUPhotoEditIrisModel initWithAsset:compositionController:]([PUPhotoEditIrisModel alloc], "initWithAsset:compositionController:", v6, v3);
    -[PUPhotoEditViewController setPhotoEditIrisModel:](self, "setPhotoEditIrisModel:", v5);
    -[PUViewModel registerChangeObserver:](v5, "registerChangeObserver:", self);
    -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer");

  }
  -[PUPhotoEditMediaToolController photoEditLivePhotoModelUpdated](self->_mediaToolController, "photoEditLivePhotoModelUpdated");

}

- (void)_captureSnapshotOfBasePhotoWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;
  PUPhotoEditSnapshot *v10;
  void *v11;
  void *v12;
  void (**v13)(id, PUPhotoEditSnapshot *);

  v13 = (void (**)(id, PUPhotoEditSnapshot *))a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 7058, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v5 = (void *)MEMORY[0x1E0D71260];
  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "newCompositionControllerWithComposition:", v6);

  v8 = -[PUPhotoEditViewController workImageVersion](self, "workImageVersion");
  if (-[PUPhotoEditViewController _canCompositionControllerBeReverted:](self, "_canCompositionControllerBeReverted:", v7))
  {
    v9 = v8 == 1;
  }
  else
  {
    v9 = 0;
  }
  if (v9)
  {
    v10 = objc_alloc_init(PUPhotoEditSnapshot);
    v13[2](v13, v10);
  }
  else
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v10 = (PUPhotoEditSnapshot *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditSnapshot captureSnapshotForAsset:mediaProvider:completion:](PUPhotoEditSnapshot, "captureSnapshotForAsset:mediaProvider:completion:", v10, v11, v13);

  }
}

- (void)_restoreSnapshot:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  PUPhotoEditViewController *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __68__PUPhotoEditViewController__restoreSnapshot_withCompletionHandler___block_invoke;
  v20 = &unk_1E58A4960;
  v21 = self;
  v8 = v7;
  v22 = v8;
  v9 = _Block_copy(&v17);
  objc_msgSend(v6, "adjustmentData", v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoLibraryURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1508]), "initWithPhotoEditSnapshot:appropriateForURL:", v6, v12);
    -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photo](self, "photo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "saveEditsForAsset:usingContentEditingOutput:livePhotoState:completionHandler:", v15, v13, objc_msgSend(v16, "editingVisibility"), v9);

  }
  else
  {
    -[PUPhotoEditViewController mediaDestination](self, "mediaDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "revertEditsForAsset:completionHandler:", v13, v9);
  }

  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
}

- (void)_requestLivePhotoAssetWithFilters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD block[4];
  id v22;

  v6 = a3;
  v7 = a4;
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isVideoEnabled");

  -[NUMediaView composition](self->_mediaView, "composition");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D521A0]), "initWithComposition:", v10);
    objc_msgSend(v12, "setName:", CFSTR("PUPhotoEditViewController-LivePhoto"));
    objc_msgSend(v12, "setPipelineFilters:", v6);
    v13 = objc_alloc(MEMORY[0x1E0D52198]);
    v14 = (void *)objc_msgSend(v13, "initWithName:responseQueue:", CFSTR("PUPhotoEditViewController-LivePhoto"), MEMORY[0x1E0C80D38]);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke_2;
    v19 = &unk_1E58A4BB0;
    v20 = v7;
    v15 = v7;
    objc_msgSend(v14, "setCompletionBlock:", &v16);
    objc_msgSend(v14, "submitRequest:", v12, v16, v17, v18, v19);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke;
    block[3] = &unk_1E58ABAC8;
    v22 = v7;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v14 = v22;
  }

}

- (BOOL)_hasUnsavedChanges
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  uint64_t v7;
  void *v8;

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_4;
    goto LABEL_6;
  }
  v5 = 1;
  v6 = objc_msgSend(v3, "isEqual:visualChangesOnly:", v4, 1);
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
LABEL_4:
      v5 = objc_msgSend(v8, "hasUnsavedChanges");
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (BOOL)isVideoOn
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isVideoEnabled");
  }
  else
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "canPlayPhotoIris") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[PUPhotoEditViewController photo](self, "photo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "canPlayLoopingVideo") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[PUPhotoEditViewController photo](self, "photo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "playbackStyle") == 4;

      }
    }

  }
  return v5;
}

- (void)setRunningAutoCalculators:(BOOL)a3
{
  if (self->_runningAutoCalculators != a3)
  {
    self->_runningAutoCalculators = a3;
    if (a3)
      -[PUPhotoEditViewController _didStartAutoCalc](self, "_didStartAutoCalc");
    else
      -[PUPhotoEditViewController _didEndAutoCalc](self, "_didEndAutoCalc");
    -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
  }
}

- (void)setIsCachingVideo:(BOOL)a3
{
  if (self->_isCachingVideo != a3)
  {
    self->_isCachingVideo = a3;
    -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1);
  }
}

- (BOOL)_shouldRequestAsyncAdjustmentForAsset:(id)a3 compositionController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  id v13;
  unsigned int v14;
  NSObject *v15;
  _DWORD v17[2];
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "mediaType");
  v8 = v7;
  if (v7 == 2)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "disableAsynchronousRenderingVideos") ^ 1;
  }
  else
  {
    if (v7 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "useAsynchronousRenderingPhotos");
  }

LABEL_7:
  v11 = objc_msgSend(MEMORY[0x1E0D71660], "isKeyOnlyAdjustmentForCompositionController:key:", v6, *MEMORY[0x1E0D71390]);
  v12 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  v14 = objc_msgSend(v13, "mediaSubtypes");
  if (v11)
    v10 &= v14 >> 20;
  PLPhotoEditGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17[0] = 67110144;
    v17[1] = v10;
    v18 = 2048;
    v19 = v8;
    v20 = 2048;
    v21 = objc_msgSend(v12, "mediaSubtypes");
    v22 = 1024;
    v23 = v11;
    v24 = 1024;
    v25 = (*(_QWORD *)&v14 & 0x100000uLL) >> 20;
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_INFO, "_shouldRequestAsyncAdjustmentForAsset returns %d, assetType:%lu subType:%lu isOrientationOnlyAdjustment:%d isHDR:%d", (uint8_t *)v17, 0x28u);
  }

  return v10;
}

- (id)_newOutputForContentEditingInput:(id)a3 compositionController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PUPhotoEditViewController photo](self, "photo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUPhotoEditViewController _shouldRequestAsyncAdjustmentForAsset:compositionController:](self, "_shouldRequestAsyncAdjustmentForAsset:compositionController:", v8, v6);

  PLPhotoEditGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mediaType");
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218496;
    v19 = v12;
    v20 = 2048;
    v21 = objc_msgSend(v13, "mediaSubtypes");
    v22 = 1024;
    v23 = v9;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_INFO, "Creating ContentEditingOutput for assetType:%lu subType:%lu async:%d", (uint8_t *)&v18, 0x1Cu);

  }
  v14 = (void *)MEMORY[0x1E0D7CB38];
  -[PUPhotoEditViewController photo](self, "photo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v7, v6, v15, v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setGainMapImage:(CGImage *)a3
{
  CGImage *gainMapImage;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
    -[PUPhotoEditViewController _updateLayerModulation](self, "_updateLayerModulation");
  }
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    -[PUPhotoEditViewController _updateLayerModulation](self, "_updateLayerModulation");
  }
}

- (void)_updateGainMap
{
  void *v3;
  void *v4;
  CGImage *v5;

  if (-[PUPhotoEditViewController currentAssetNeedsGainMap](self, "currentAssetNeedsGainMap"))
  {
    v3 = (void *)MEMORY[0x1E0D51FF0];
    -[PUPhotoEditViewController _composition](self, "_composition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CGImage *)objc_msgSend(v3, "createGainMapForComposition:", v4);

    -[PUPhotoEditViewController setGainMapImage:](self, "setGainMapImage:", v5);
    CGImageRelease(v5);
  }
}

- (void)_loadToolsIfNeeded
{
  -[PUPhotoEditViewController _loadToolsIfNeeded:](self, "_loadToolsIfNeeded:", 0);
}

- (void)_loadToolsIfNeeded:(BOOL)a3
{
  NSArray *allTools;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *v12;
  PUCropToolController *cropController;
  PUFilterToolController *filtersController;
  PUAdjustmentsToolController *adjustmentsController;
  PUPhotoEditPortraitToolController *portraitToolController;
  _TtC15PhotosUIPrivate21PUAudioToolController *audioToolController;
  PUPhotoEditMediaToolController *mediaToolController;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *photoStylesToolController;
  PUCropToolController *v20;
  PUCropToolController *v21;
  PUFilterToolController *v22;
  PUFilterToolController *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  PUAdjustmentsToolController *v32;
  PUAdjustmentsToolController *v33;
  PURedeyeToolController *v34;
  PUPhotoEditPortraitToolController *v35;
  _TtC15PhotosUIPrivate21PUAudioToolController *v36;
  PUPhotoEditMediaToolController *v37;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v38;
  id v39;
  PUFilterToolController *v40;
  void *v41;
  NSArray *v42;
  NSArray *v43;
  NSArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  id *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  NSObject *v57;
  id v58[2];
  _QWORD v59[4];
  id v60;
  NSObject *v61;
  id v62[2];
  id location;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _QWORD v69[4];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!self->_didLoadTools || a3)
  {
    allTools = self->__allTools;
    if (allTools)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v6 = allTools;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v65 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v10, "willMoveToParentViewController:", 0);
            objc_msgSend(v10, "view");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeFromSuperview");

            objc_msgSend(v10, "removeFromParentViewController");
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v7);
      }

      v12 = self->__allTools;
      self->__allTools = 0;

      cropController = self->_cropController;
      self->_cropController = 0;

      filtersController = self->_filtersController;
      self->_filtersController = 0;

      adjustmentsController = self->_adjustmentsController;
      self->_adjustmentsController = 0;

      portraitToolController = self->_portraitToolController;
      self->_portraitToolController = 0;

      audioToolController = self->_audioToolController;
      self->_audioToolController = 0;

      mediaToolController = self->_mediaToolController;
      self->_mediaToolController = 0;

      photoStylesToolController = self->_photoStylesToolController;
      self->_photoStylesToolController = 0;

    }
    if (-[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing", a3)
      || !-[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia"))
    {
      v20 = (PUCropToolController *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNibName:bundle:", 0, 0);
      v21 = self->_cropController;
      self->_cropController = v20;

      v22 = -[PUFilterToolController initWithNibName:bundle:]([PUFilterToolController alloc], "initWithNibName:bundle:", 0, 0);
      v23 = self->_filtersController;
      self->_filtersController = v22;

      objc_initWeak(&location, self->_filtersController);
      -[PUPhotoEditViewController filterInterval](self, "filterInterval");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoEditGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)os_signpost_id_make_with_pointer(v25, self->_filtersController);
      v27 = MEMORY[0x1E0C809B0];
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke;
      v59[3] = &unk_1E58A6AC0;
      v28 = v24;
      v60 = v28;
      v50 = v62;
      objc_copyWeak(v62, &location);
      v29 = v25;
      v61 = v29;
      v62[1] = v26;
      -[PUFilterToolController setWillLoadFilterThumbnails:](self->_filtersController, "setWillLoadFilterThumbnails:", v59);
      v55[0] = v27;
      v55[1] = 3221225472;
      v55[2] = __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke_747;
      v55[3] = &unk_1E58A6AC0;
      v30 = v28;
      v56 = v30;
      objc_copyWeak(v58, &location);
      v31 = v29;
      v57 = v31;
      v58[1] = v26;
      -[PUFilterToolController setDidFinishLoadingFilterThumbnails:](self->_filtersController, "setDidFinishLoadingFilterThumbnails:", v55);
      v32 = -[PUAdjustmentsToolController initWithNibName:bundle:]([PUAdjustmentsToolController alloc], "initWithNibName:bundle:", 0, 0);
      v33 = self->_adjustmentsController;
      self->_adjustmentsController = v32;

      v34 = -[PURedeyeToolController initWithNibName:bundle:]([PURedeyeToolController alloc], "initWithNibName:bundle:", 0, 0);
      -[PUPhotoEditViewController setRedEyeController:](self, "setRedEyeController:", v34);
      v35 = self->_portraitToolController;
      self->_portraitToolController = 0;

      v36 = self->_audioToolController;
      self->_audioToolController = 0;

      v37 = self->_mediaToolController;
      self->_mediaToolController = 0;

      v38 = self->_photoStylesToolController;
      self->_photoStylesToolController = 0;

      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = self->_filtersController;
      v69[0] = self->_adjustmentsController;
      v69[1] = v40;
      v69[2] = self->_cropController;
      v69[3] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObjectsFromArray:", v41);

      v42 = (NSArray *)objc_msgSend(v39, "copy");
      v43 = self->__allTools;
      self->__allTools = v42;

      objc_destroyWeak(v58);
      objc_destroyWeak(v62);

      objc_destroyWeak(&location);
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = self->__allTools;
    v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v52 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          -[PUPhotoEditViewController aggregateSession](self, "aggregateSession", v50);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setAggregateSession:", v49);

          objc_msgSend(v48, "setDelegate:", self);
          objc_msgSend(v48, "setLayoutOrientation:withTransitionCoordinator:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"), 0);
        }
        v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      }
      while (v45);
    }

    self->_didLoadTools = 1;
    -[PUPhotoEditViewController _setupToolsIfNeeded](self, "_setupToolsIfNeeded");
    -[PUPhotoEditViewController _updateKeyCommands](self, "_updateKeyCommands");
  }
}

- (void)_setupToolsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  PEAutoAdjustmentController *v16;
  PEAutoAdjustmentController *autoEnhanceController;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController _allTools](self, "_allTools");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController editSource](self, "editSource");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3 && v4 && v5 && v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "compositionController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            -[PUPhotoEditViewController photo](self, "photo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setupWithAsset:compositionController:editSource:valuesCalculator:", v15, v3, v7, v4);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    -[PUAdjustmentsToolController autoAdjustmentController](self->_adjustmentsController, "autoAdjustmentController");
    v16 = (PEAutoAdjustmentController *)objc_claimAutoreleasedReturnValue();
    autoEnhanceController = self->_autoEnhanceController;
    self->_autoEnhanceController = v16;

    v5 = v18;
  }

}

- (id)_allTools
{
  -[PUPhotoEditViewController _loadToolsIfNeeded](self, "_loadToolsIfNeeded");
  return self->__allTools;
}

- (int64_t)_toolTypeForToolWithTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 1002) > 4)
    return 0;
  else
    return qword_1AB0EFD48[a3 - 1002];
}

- (id)_defaultRenderPipelineFiltersForCurrentMode
{
  void *v3;

  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo")
    || -[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo"))
  {
    objc_msgSend((id)objc_opt_class(), "_defaultMediaViewRenderPipelineFilters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultLivePhotoRenderPipelineFilters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)switchToEditingTool:(id)a3 animated:(BOOL)a4
{
  -[PUPhotoEditViewController switchToEditingTool:animated:completionHandler:](self, "switchToEditingTool:animated:completionHandler:", a3, a4, 0);
}

- (void)switchToEditingTool:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  PUAdjustmentsToolController *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  PUAdjustmentsToolController *v16;
  PUPhotoEditToolController *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NUMediaView *mediaView;
  void *v24;
  dispatch_time_t v25;
  PUAdjustmentsToolController *adjustmentsController;
  _BOOL4 v27;
  _QWORD block[5];
  PUAdjustmentsToolController *v29;
  id v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD aBlock[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E58ABAC8;
  v10 = v9;
  v37 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12 = (PUAdjustmentsToolController *)v8;
  -[PUPhotoEditToolController compositionController](v12, "compositionController");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        v15 = -[PUPhotoEditToolController canBecomeActiveTool](v12, "canBecomeActiveTool"),
        v14,
        v15)
    && !self->_switchingToolsAnimated)
  {
    v16 = v12;
    if (!v12)
    {
      adjustmentsController = self->_adjustmentsController;
      if ((PUAdjustmentsToolController *)self->_currentTool == adjustmentsController)
      {
        v16 = 0;
      }
      else
      {
        -[PUPhotoEditToolController compositionController](adjustmentsController, "compositionController");
        v16 = (PUAdjustmentsToolController *)objc_claimAutoreleasedReturnValue();

        if (v16)
          v16 = self->_adjustmentsController;
      }
    }
    if (-[PUAdjustmentsToolController toolControllerTag](v16, "toolControllerTag") == 1005
      && (PUAdjustmentsToolController *)self->_currentTool == v16)
    {
      v17 = self->_previousEditingTool;

      v16 = (PUAdjustmentsToolController *)v17;
    }
    if (v16 == (PUAdjustmentsToolController *)self->_currentTool)
    {
      -[PUAdjustmentsToolController reactivate](v16, "reactivate");
      v11[2](v11);
    }
    else
    {
      v27 = v6;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[NSArray arrayByAddingObject:](self->_coreToolButtons, "arrayByAddingObject:", self->_redEyeButton);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setSelected:", -[PUAdjustmentsToolController toolControllerTag](v16, "toolControllerTag") == objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "tag"));
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v20);
      }

      -[PUPhotoEditToolPickerController setSelectedToolTag:](self->_toolPickerController, "setSelectedToolTag:", -[PUAdjustmentsToolController toolControllerTag](v16, "toolControllerTag"));
      if (-[PUPhotoEditToolController suppressesEditUpdates](self->_currentEditingTool, "suppressesEditUpdates"))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        -[PUPhotoEditViewController _updateGainMap](self, "_updateGainMap");
        mediaView = self->_mediaView;
        -[PUPhotoEditViewController _composition](self, "_composition");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUMediaView setComposition:](mediaView, "setComposition:", v24);

        -[NUMediaView waitForRender](self->_mediaView, "waitForRender");
        if (-[NUMediaView loopsVideoPlayback](self->_mediaView, "loopsVideoPlayback"))
          -[NUMediaView _startVideoPlayback](self->_mediaView, "_startVideoPlayback");
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        v25 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke_2;
        block[3] = &unk_1E58A4C18;
        block[4] = self;
        v16 = v16;
        v29 = v16;
        v31 = v27;
        v30 = v10;
        dispatch_after(v25, MEMORY[0x1E0C80D38], block);

      }
      else
      {
        -[PUPhotoEditViewController _transitionToEditingTool:animated:completionHandler:](self, "_transitionToEditingTool:animated:completionHandler:", v16, v27, v10);
      }
    }
  }
  else
  {
    v11[2](v11);
    v16 = v12;
  }

}

- (void)_chooseInitialEditingTool
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PUCropToolController *v8;
  void *v9;
  PUPhotoEditPortraitToolController *portraitToolController;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _BYTE v18[24];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_currentTool)
    return;
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
  -[PUPhotoEditViewController initialPendingEditsRequest](self, "initialPendingEditsRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditViewController initialPendingEditsRequest](self, "initialPendingEditsRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adjustments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "category");

    -[PUPhotoEditViewController _toolControllerForAdjustmentCategory:](self, "_toolControllerForAdjustmentCategory:", v7);
  }
  else
  {
    -[PUPhotoEditViewController _toolControllerForInitialToolType:](self, "_toolControllerForInitialToolType:", -[PUPhotoEditViewController initialToolType](self, "initialToolType"));
  }
  v8 = (PUCropToolController *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", v8, v8 == self->_cropController);
  -[PUPhotoEditViewController photo](self, "photo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "mediaSubtypes") & 0x10) != 0)
  {
    portraitToolController = self->_portraitToolController;
    if (portraitToolController)
    {
      v11 = -[PUPhotoEditPortraitToolController majorVersion](portraitToolController, "majorVersion");
      v12 = -[PUPhotoEditPortraitToolController minorVersion](self->_portraitToolController, "minorVersion");
      v13 = -[PUPhotoEditPortraitToolController sDOFRenderingVersion](self->_portraitToolController, "sDOFRenderingVersion");
      PLPhotoEditGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v18 = 134218496;
        *(_QWORD *)&v18[4] = v11;
        *(_WORD *)&v18[12] = 2048;
        *(_QWORD *)&v18[14] = v12;
        *(_WORD *)&v18[22] = 2048;
        v19 = v13;
        v15 = "Portrait photo asset version: %lu.%lu / sDOF rendering version: %lu";
        v16 = v14;
        v17 = 32;
LABEL_11:
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_INFO, v15, v18, v17);
      }
    }
    else
    {
      PLPhotoEditGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        v15 = "Unable to read portrait photo asset version.";
        v16 = v14;
        v17 = 2;
        goto LABEL_11;
      }
    }

  }
  if (-[PUPhotoEditViewController initialToolType](self, "initialToolType", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19) == 8)
    -[PUPhotoEditViewController _handleMarkupButton:](self, "_handleMarkupButton:", 0);

}

- (id)_toolControllerForInitialToolType:(int64_t)a3
{
  PUAdjustmentsToolController *v4;
  PUAdjustmentsToolController *v5;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *photoStylesToolController;
  _TtC15PhotosUIPrivate26PUPhotoStyleToolController *v7;
  void *v8;
  uint64_t v9;
  PUCropToolController *cropController;
  uint64_t v11;

  switch(-[PUPhotoEditViewController initialToolType](self, "initialToolType", a3))
  {
    case 0:
    case 8:
      -[PUPhotoEditViewController _defaultInitialToolController](self, "_defaultInitialToolController");
      v4 = (PUAdjustmentsToolController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 1:
      goto LABEL_8;
    case 2:
      v5 = self->_adjustmentsController;
      -[PUAdjustmentsToolController setInitialAction:](self->_adjustmentsController, "setInitialAction:", 1);
      return v5;
    case 3:
      v5 = self->_filtersController;
      photoStylesToolController = self->_photoStylesToolController;
      if (photoStylesToolController)
      {
        v7 = photoStylesToolController;

        v5 = (PUAdjustmentsToolController *)v7;
      }
      return v5;
    case 4:
      v8 = self->_photoStylesToolController;
      if (v8)
        goto LABEL_14;
LABEL_8:
      v9 = 1608;
LABEL_10:
      v8 = *(Class *)((char *)&self->super.super.super.isa + v9);
      goto LABEL_14;
    case 5:
      v9 = 1592;
      goto LABEL_10;
    case 6:
      cropController = self->_cropController;
      v11 = 1;
      goto LABEL_13;
    case 7:
      cropController = self->_cropController;
      v11 = 2;
LABEL_13:
      -[PUCropToolController setInitialAction:](cropController, "setInitialAction:", v11);
      v8 = self->_cropController;
LABEL_14:
      v4 = v8;
LABEL_15:
      v5 = v4;
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_defaultInitialToolController
{
  PUAdjustmentsToolController *photoStylesToolController;
  PUAdjustmentsToolController *v4;
  void *v5;
  void *v6;
  int v7;
  void *portraitToolController;
  PUAdjustmentsToolController *v9;

  photoStylesToolController = (PUAdjustmentsToolController *)self->_photoStylesToolController;
  if (photoStylesToolController)
    v4 = photoStylesToolController;
  if (self->_portraitToolController)
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "depthAdjustmentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enabled");

    if (v7)
    {
      portraitToolController = self->_portraitToolController;
LABEL_10:
      v9 = portraitToolController;

      photoStylesToolController = v9;
      return photoStylesToolController;
    }
  }
  if (self->_mediaToolController
    && (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo")
     || -[PUPhotoEditViewController isHighframeRateVideo](self, "isHighframeRateVideo")))
  {
    portraitToolController = self->_mediaToolController;
    goto LABEL_10;
  }
  if (!photoStylesToolController)
    photoStylesToolController = self->_adjustmentsController;
  return photoStylesToolController;
}

- (void)_transitionToEditingTool:(id)a3 animated:(BOOL)a4
{
  -[PUPhotoEditViewController _transitionToEditingTool:animated:completionHandler:](self, "_transitionToEditingTool:animated:completionHandler:", a3, a4, 0);
}

- (void)_transitionToEditingTool:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  UIViewController *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  UIViewController *currentTool;
  UIViewController *v15;
  UIViewController *v16;
  UIViewController *v17;
  UIViewController *v18;
  UIViewController *v19;
  UIViewController *v20;
  void (**v21)(_QWORD);
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  UIViewController *v26;
  PUPhotoEditViewController *v27;
  UIViewController *v28;
  UIViewController *v29;
  UIViewController *v30;
  id v31;
  BOOL v32;
  _QWORD aBlock[4];
  id v34;

  v8 = (UIViewController *)a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E58ABAC8;
  v11 = v9;
  v34 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  currentTool = self->_currentTool;
  if (currentTool == v8)
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }
  else
  {
    v15 = currentTool;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v8;
    else
      v17 = 0;
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_2;
    v25[3] = &unk_1E58A4C68;
    v18 = v17;
    v26 = v18;
    v27 = self;
    v28 = v8;
    v32 = a4;
    v19 = v16;
    v29 = v19;
    v31 = v13;
    v20 = v15;
    v30 = v20;
    v21 = (void (**)(_QWORD))_Block_copy(v25);
    v22 = v21;
    if (v18)
    {
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_5;
      v23[3] = &unk_1E58ABAC8;
      v24 = v21;
      -[UIViewController prepareForToolTransitionWithCompletion:](v18, "prepareForToolTransitionWithCompletion:", v23);

    }
    else
    {
      v21[2](v21);
    }

  }
}

- (void)_transitionToNewToolViewController:(id)a3 oldToolViewController:(id)a4 animationBlock:(id)a5 completion:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  void *v23;
  double v24;
  double v25;
  float v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  _QWORD v35[5];
  id v36;
  void (**v37)(_QWORD);
  _QWORD aBlock[5];
  id v39;
  id v40;
  id v41;
  double v42;
  BOOL v43;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(_QWORD))a6;
  -[NUMediaView setHidden:](self->_mediaView, "setHidden:", -[PUPhotoEditToolController shouldHideMediaView](self->_currentEditingTool, "shouldHideMediaView"));
  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    -[PUPhotoEditMediaToolController trimController](self->_mediaToolController, "trimController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pause");

  }
  objc_msgSend(v12, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PUPhotoEditViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController addChildViewController:](self, "addChildViewController:", v12);
    objc_msgSend(v19, "addSubview:", v17);
    objc_msgSend(v12, "didMoveToParentViewController:", self);
    objc_msgSend(v19, "setNeedsUpdateConstraints");

  }
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIgnoresUpdates:", 1);

  v21 = -[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop");
  if (v7)
  {
    if (v13)
      v22 = 0;
    else
      v22 = v21;
    v34 = v22;
    objc_msgSend(v17, "setAlpha:", 0.0);
    -[PUPhotoEditViewController setMediaViewEdgeInsetsUpdateDisableCount:](self, "setMediaViewEdgeInsetsUpdateDisableCount:", -[PUPhotoEditViewController mediaViewEdgeInsetsUpdateDisableCount](self, "mediaViewEdgeInsetsUpdateDisableCount")+ 1);
    -[PUPhotoEditViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutIfNeeded");

    -[PUPhotoEditViewController setMediaViewEdgeInsetsUpdateDisableCount:](self, "setMediaViewEdgeInsetsUpdateDisableCount:", -[PUPhotoEditViewController mediaViewEdgeInsetsUpdateDisableCount](self, "mediaViewEdgeInsetsUpdateDisableCount")- 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
    v25 = v24;
    UIAnimationDragCoefficient();
    v27 = v25 * v26;
    v28 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke;
    aBlock[3] = &unk_1E58A4C90;
    v41 = v14;
    aBlock[4] = self;
    v43 = v34;
    v42 = v27;
    v39 = v17;
    v40 = v18;
    v29 = _Block_copy(aBlock);
    v35[0] = v28;
    v35[1] = 3221225472;
    v35[2] = __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke_2;
    v35[3] = &unk_1E58A6BF8;
    v35[4] = self;
    v37 = v15;
    v36 = v13;
    v30 = _Block_copy(v35);
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateWithDuration:delay:options:animations:start:completion:", 0, v29, 0, v30, v27, 0.0);

  }
  else
  {
    -[PUPhotoEditViewController _updateBackgroundColor](self, "_updateBackgroundColor");
    v15[2](v15);
    if (v13)
    {
      objc_msgSend(v13, "willMoveToParentViewController:", 0);
      objc_msgSend(v13, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeFromSuperview");

      objc_msgSend(v13, "removeFromParentViewController");
    }
    -[PUPhotoEditViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setIgnoresUpdates:", 0);

  }
  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", v7);
  -[PUPhotoEditViewController _updateToolbarBackgroundAnimated:](self, "_updateToolbarBackgroundAnimated:", v7);
  -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer");
  -[PUPhotoEditViewController _updateLivePhotoPlaybackGestureRecognizer](self, "_updateLivePhotoPlaybackGestureRecognizer");
  -[PUPhotoEditViewController _updateSwipeDownGestureRecognizer](self, "_updateSwipeDownGestureRecognizer");
  -[PEAutoAdjustmentController invalidateCachedAdjustments](self->_autoEnhanceController, "invalidateCachedAdjustments");
  -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precomputeImageValues");

  -[PUEditPluginSession updateAvailability](self->_pluginSession, "updateAvailability");
  -[PUPhotoEditViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");

}

- (id)_createMediaView
{
  id v3;
  void *v4;
  NUBufferRenderClient *v5;
  NUBufferRenderClient *renderImageClient;
  NUBufferRenderClient *v7;
  void *v8;
  double v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D523E0]);
  -[PUPhotoEditViewController _defaultRenderPipelineFiltersForCurrentMode](self, "_defaultRenderPipelineFiltersForCurrentMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPipelineFilters:", v4);

  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setMaximumZoomScale:", 1.0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (NUBufferRenderClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52018]), "initWithName:", CFSTR("Edit View Controller Display"));
  renderImageClient = self->_renderImageClient;
  self->_renderImageClient = v5;

  v7 = self->_renderImageClient;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  -[NUBufferRenderClient setPriority:](v7, "setPriority:", v8);

  objc_msgSend(v3, "setClipsToBounds:", 0);
  v9 = 0.0;
  if (!self->_isEmbeddedEdit)
    v9 = 6.0;
  objc_msgSend(v3, "setMaximumZoomScale:", v9);
  objc_msgSend(v3, "setCenterContent:", 0);
  objc_msgSend(v3, "setAlwaysBounceScrollView:", 0);
  if ((objc_msgSend(MEMORY[0x1E0D52108], "enableDash5") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D52108], "renderMeteorPlusAsHDR"))
  {
    objc_msgSend(v3, "setHdrEnabled:", PXUserAllowFullHDR());
  }
  return v3;
}

- (int64_t)currentToolPickerLayoutDirection
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;

  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentLayoutStyle");

  v5 = -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation");
  v6 = 1;
  if (v4 != 4)
    v6 = 2;
  if (v5 == 2)
    return v6;
  else
    return v4 == 4;
}

- (BOOL)_isQuickCrop
{
  void *v2;
  BOOL v3;

  -[PUPhotoEditViewController quickCropContext](self, "quickCropContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_createVideoScrubberIfNeeded
{
  void *v3;
  PUAVKitMediaTimelineView *v4;
  PUAVKitMediaTimelineView *videoScrubberView;
  void *v6;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id videoScrubberTimeObserver;
  UIButton *v14;
  UIButton *playPauseButton;
  UIButton *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    v4 = objc_alloc_init(PUAVKitMediaTimelineView);
    videoScrubberView = self->_videoScrubberView;
    self->_videoScrubberView = v4;

    -[PUPhotoEditViewController photo](self, "photo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mediaSubtypes");

    v8 = 4.0;
    if ((*(_QWORD *)&v7 & 0x100000) == 0)
      v8 = 1.0;
    -[PUAVKitMediaTimelineView setWhiteValue:](self->_videoScrubberView, "setWhiteValue:", v8);
    -[PUAVKitMediaTimelineView setOverrideUserInterfaceStyle:](self->_videoScrubberView, "setOverrideUserInterfaceStyle:", 2);
    -[PUAVKitMediaTimelineView setShowsTimeLabels:](self->_videoScrubberView, "setShowsTimeLabels:", 1);
    -[PUAVKitMediaTimelineView setPlaying:](self->_videoScrubberView, "setPlaying:", 1);
    -[PUAVKitMediaTimelineView setAlpha:](self->_videoScrubberView, "setAlpha:", 0.0);
    -[PUAVKitMediaTimelineView setDelegate:](self->_videoScrubberView, "setDelegate:", self);
    -[PUPhotoEditViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSubview:aboveSubview:", self->_videoScrubberView, self->_mediaView);

    v10 = MEMORY[0x1E0C809B0];
    if (!self->_videoScrubberTimeObserver)
    {
      objc_initWeak(&location, self);
      -[NUMediaView player](self->_mediaView, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke;
      v24[3] = &unk_1E58A4CB8;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v11, "addPlaybackTimeObserver:", v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      videoScrubberTimeObserver = self->_videoScrubberTimeObserver;
      self->_videoScrubberTimeObserver = v12;

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    +[PUPhotoEditSupport createPlayPauseButton](PUPhotoEditSupport, "createPlayPauseButton");
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    playPauseButton = self->_playPauseButton;
    self->_playPauseButton = v14;

    objc_initWeak(&location, self);
    v16 = self->_playPauseButton;
    v17 = (void *)MEMORY[0x1E0DC3428];
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke_2;
    v22[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v17, "actionWithHandler:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v16, "addAction:forControlEvents:", v18, 64);

    v19 = (void *)MEMORY[0x1E0DC3658];
    -[PUAVKitMediaTimelineView whiteValue](self->_videoScrubberView, "whiteValue");
    objc_msgSend(v19, "colorWithWhite:alpha:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_playPauseButton, "setTintColor:", v20);

    -[PUPhotoEditViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "insertSubview:aboveSubview:", self->_playPauseButton, self->_mediaView);

    -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 1);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)_updateVideoScrubber
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PUPhotoEditToolController *currentEditingTool;
  PUPhotoEditToolController *v14;
  float Seconds;
  void *v16;
  double v17;
  float v18;
  void *v19;
  double v20;
  float v21;
  void *v22;
  double v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  CMTime v27;
  CMTime lhs;
  CMTime time;
  char v30;
  char v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;

  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return;
  v4 = (void *)v3;
  v5 = -[PUPhotoEditViewController isScrubbingVideo](self, "isScrubbingVideo");

  if (v5)
    return;
  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v34, 0, sizeof(v34));
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "mediaDuration");
  else
    memset(&v34, 0, sizeof(v34));

  memset(&v33, 0, sizeof(v33));
  CMTimeMake(&v33, 0, v34.timescale);
  memset(&v32, 0, sizeof(v32));
  objc_msgSend(v6, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "currentTime");
  else
    memset(&v32, 0, sizeof(v32));

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trimAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "startTime");
    if ((v31 & 1) != 0)
    {
      objc_msgSend(v12, "endTime");
      if ((v30 & 1) != 0)
      {
        objc_msgSend(v12, "startTime");
        v33 = time;
        objc_msgSend(v12, "endTime");
        v34 = time;
        currentEditingTool = self->_currentEditingTool;
        if (currentEditingTool)
        {
          lhs = v33;
          -[PUPhotoEditToolController displayedTimeForOriginalAssetTime:](currentEditingTool, "displayedTimeForOriginalAssetTime:", &lhs);
          v14 = self->_currentEditingTool;
          v33 = time;
          if (v14)
          {
            lhs = v34;
            -[PUPhotoEditToolController displayedTimeForOriginalAssetTime:](v14, "displayedTimeForOriginalAssetTime:", &lhs);
LABEL_17:
            v34 = time;
            goto LABEL_18;
          }
        }
        else
        {
          memset(&v33, 0, sizeof(v33));
        }
        memset(&time, 0, sizeof(time));
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  if ((v33.flags & 1) != 0 && (v34.flags & 1) != 0 && (v32.flags & 1) != 0)
  {
    lhs = v33;
    v27 = v32;
    CMTimeAdd(&time, &lhs, &v27);
    v32 = time;
    time = v33;
    Seconds = CMTimeGetSeconds(&time);
    -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v17 = Seconds;
    objc_msgSend(v16, "setMinValue:", v17);

    time = v34;
    v18 = CMTimeGetSeconds(&time);
    -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v20 = v18;
    objc_msgSend(v19, "setMaxValue:", v20);

    time = v32;
    v21 = CMTimeGetSeconds(&time);
    -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = v21;
    objc_msgSend(v22, "setCurrentValue:", v23);

    objc_msgSend(v6, "player");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "playbackState") == 3)
    {
      time = v32;
      lhs = v34;
      v25 = CMTimeCompare(&time, &lhs) != 0;
    }
    else
    {
      v25 = 0;
    }

    -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSelected:", v25);

  }
}

- (void)_updateVideoScrubberDisplayAnimate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  char v7;
  int v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  _QWORD v21[7];
  BOOL v22;
  BOOL v23;
  _QWORD aBlock[5];
  char v25;

  v3 = a3;
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return;
  v6 = 0.0;
  if (!self->_toolControllerWantsScrubber
    || self->_isAnimatingLayoutOrientation
    || self->_isAnimatingMediaViewInsets
    || self->_isImageZooming)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    if (!-[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction")
      || -[PUPhotoEditViewController isScrubbingVideo](self, "isScrubbingVideo"))
    {
      v9 = 1.0;
      v7 = 1;
      v8 = 1;
      goto LABEL_8;
    }
    v7 = 0;
    v8 = 1;
  }
  v9 = 0.0;
LABEL_8:
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alpha");
  v12 = v11;
  v13 = v9 != v11;

  if (v8)
  {
    if (-[PUPhotoEditViewController isFocusingViewForInteraction](self, "isFocusingViewForInteraction"))
      v6 = 0.0;
    else
      v6 = 1.0;
  }
  -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alpha");
  v16 = v15;

  if (v6 != v16 || v9 != v12)
  {
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke;
    aBlock[3] = &unk_1E58AAD68;
    v25 = v7;
    aBlock[4] = self;
    v18 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v3)
    {
      v21[0] = v17;
      v21[1] = 3221225472;
      v21[2] = __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke_2;
      v21[3] = &unk_1E58A4CE0;
      v22 = v13;
      v21[4] = self;
      v23 = v6 != v16;
      *(double *)&v21[5] = v9;
      *(double *)&v21[6] = v6;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateWithDuration:delay:options:animations:start:completion:", 4, v21, v18, 0, 0.25, 0.3);
    }
    else
    {
      if (v9 != v12)
      {
        -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAlpha:", v9);

      }
      if (v6 != v16)
      {
        -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAlpha:", v6);

      }
      v18[2](v18);
    }

  }
}

- (void)mediaTimelineControlViewWillBeginChanging:(id)a3
{
  void *v4;
  double v5;
  id v6;

  -[PUPhotoEditViewController setIsScrubbingVideo:](self, "setIsScrubbingVideo:", 1);
  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "playbackRate");
  -[PUPhotoEditViewController setWasPlayingBeforeBeginningToScrubVideo:](self, "setWasPlayingBeforeBeginningToScrubVideo:", v5 == 1.0);
  objc_msgSend(v6, "pause");
  -[PUPhotoEditViewController _focusViewForInteractionWithDelay](self, "_focusViewForInteractionWithDelay");

}

- (void)mediaTimelineControlViewDidChangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int32_t v7;
  float v8;
  float v9;
  float v10;
  CMTime v11;
  CMTime lhs;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
LABEL_5:
    v7 = 600;
    goto LABEL_6;
  }
  objc_msgSend(v6, "currentTime");
  v7 = v17;
  if (!(_DWORD)v17)
    goto LABEL_5;
LABEL_6:
  memset(&v15, 0, sizeof(v15));
  objc_msgSend(v4, "currentValue");
  CMTimeMakeWithSeconds(&v15, v8, v7);
  memset(&v14, 0, sizeof(v14));
  objc_msgSend(v4, "minValue");
  v10 = v9;

  CMTimeMakeWithSeconds(&v14, v10, v7);
  if ((v15.flags & 1) != 0 && (v14.flags & 1) != 0)
  {
    memset(&v13, 0, sizeof(v13));
    lhs = v15;
    v11 = v14;
    CMTimeSubtract(&v13, &lhs, &v11);
    lhs = v13;
    objc_msgSend(v6, "seekToTime:exact:", &lhs, 0);
  }

}

- (void)mediaTimelineControlViewDidEndChanging:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[PUPhotoEditViewController setIsScrubbingVideo:](self, "setIsScrubbingVideo:", 0);
  if (-[PUPhotoEditViewController wasPlayingBeforeBeginningToScrubVideo](self, "wasPlayingBeforeBeginningToScrubVideo"))
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pauseAfterMovingPlayhead");

    if (v5)
    {
      -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
    }
    else
    {
      -[PUPhotoEditViewController mediaView](self, "mediaView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "play");

      -[PUPhotoEditViewController playPauseButton](self, "playPauseButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 1;
    }
    objc_msgSend(v6, "setSelected:", v8);

  }
  -[PUPhotoEditViewController _cancelPendingFocusViewForInteractionWithDelay](self, "_cancelPendingFocusViewForInteractionWithDelay");
  -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 0);
}

- (void)toolControllerDidFinishLoadingThumbnails:(id)a3
{
  -[_PPTState leaveDispatchGroup](self->_pptState, "leaveDispatchGroup", a3);
}

- (void)toolController:(id)a3 updateModelDependentControlsAnimated:(BOOL)a4
{
  -[PUPhotoEditViewController _updateModelDependentControlsAnimated:](self, "_updateModelDependentControlsAnimated:", a4);
}

- (void)toolControllerDidChangeIsActivelyAdjusting:(id)a3
{
  -[PUPhotoEditViewController _updateModelDependentControlsAnimated:](self, "_updateModelDependentControlsAnimated:", 1);
  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
}

- (void)toolControllerDidChangeIsPerformingLiveInteraction:(id)a3
{
  if (objc_msgSend(a3, "isPerformingLiveInteraction"))
  {
    -[PUPhotoEditViewController _focusViewForInteractionWithDelay](self, "_focusViewForInteractionWithDelay");
  }
  else
  {
    -[PUPhotoEditViewController _cancelPendingFocusViewForInteractionWithDelay](self, "_cancelPendingFocusViewForInteractionWithDelay");
    -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 0);
  }
}

- (void)toolController:(id)a3 didChangePreferredPreviewViewInsetsAnimated:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];

  if (!self->_switchingToolsAnimated && a4)
  {
    -[PUPhotoEditViewController view](self, "view", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__PUPhotoEditViewController_toolController_didChangePreferredPreviewViewInsetsAnimated___block_invoke;
    v7[3] = &unk_1E58ABD10;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, &__block_literal_global_760);
  }
}

- (void)toolControllerDidChangeWantsDefaultPreviewView:(id)a3
{
  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
}

- (void)toolControllerDidChangeWantsTapToToggleOriginalEnabled:(id)a3 enabled:(BOOL)a4
{
  -[UITapGestureRecognizer setEnabled:](self->_togglePreviewTapGestureRecognizer, "setEnabled:", a4);
}

- (void)toolControllerWantsToToggleOriginal:(id)a3
{
  self->_showOriginalButtonTapped = 1;
  -[PUPhotoEditViewController _toggleShowOriginal](self, "_toggleShowOriginal", a3);
}

- (void)toolControllerWantsGestureRecognizerUpdate:(id)a3
{
  -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer", a3);
  -[PUPhotoEditViewController _updateLivePhotoPlaybackGestureRecognizer](self, "_updateLivePhotoPlaybackGestureRecognizer");
  -[PUPhotoEditViewController _updateSwipeDownGestureRecognizer](self, "_updateSwipeDownGestureRecognizer");
}

- (void)toolControllerDidUpdateToolbar:(id)a3
{
  if (self->_currentEditingTool == a3)
    -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 1);
}

- (id)toolControllerUneditedCompositionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D71260];
  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "newCompositionControllerWithComposition:", v4);

  return v5;
}

- (id)toolControllerOriginalCompositionController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUPhotoEditViewController originalComposition](self, "originalComposition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D71260];
    -[PUPhotoEditViewController originalComposition](self, "originalComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "newCompositionControllerWithComposition:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($5A0616AB7869379E861635CACF312FD6)toolControllerImageModulationOptions:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  $5A0616AB7869379E861635CACF312FD6 result;

  v3 = (void *)MEMORY[0x1E0D7B500];
  -[PUPhotoEditViewController photo](self, "photo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "optionsForAsset:", v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = *(float *)&v9;
  result.var0 = v8;
  return result;
}

- (id)toolControllerPreviewView:(id)a3
{
  return self->_mediaView;
}

- (id)toolControllerLivePhoto:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVideoEnabled");

  if (v5)
  {
    -[NUMediaView _livePhotoView](self->_mediaView, "_livePhotoView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "livePhoto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CGSize)toolControllerOriginalOrientedImageSize:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PUPhotoEditViewController toolControllerOriginalImageSize:](self, "toolControllerOriginalImageSize:", a3);
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageOrientation");
  PLOrientationTransformImageSize();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)toolControllerOriginalImageSize:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PUPhotoEditViewController compositionController](self, "compositionController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71660], "synchronousInputSizeForCompositionController:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (unint64_t)toolControllerSourceAssetType:(id)a3
{
  unint64_t v4;

  v4 = -[PUPhotoEditViewController hasLoadedRaw](self, "hasLoadedRaw", a3);
  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
    return v4 | 2;
  else
    return v4;
}

- (void)toolControllerDidFinish:(id)a3
{
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", 0, 1);
}

- (void)toolController:(id)a3 showVideoScrubber:(BOOL)a4 animated:(BOOL)a5
{
  self->_toolControllerWantsScrubber = a4;
  -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", a5);
}

- (CGPoint)toolController:(id)a3 originalPointFromViewPoint:(CGPoint)a4 view:(id)a5
{
  double v5;
  double v6;
  CGPoint result;

  -[NUMediaView convertPoint:fromView:toSpace:](self->_mediaView, "convertPoint:fromView:toSpace:", a5, CFSTR("/masterSpace"), a4.x, a4.y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)toolController:(id)a3 viewPointFromOriginalPoint:(CGPoint)a4 view:(id)a5
{
  double v5;
  double v6;
  CGPoint result;

  -[NUMediaView convertPoint:fromSpace:toView:](self->_mediaView, "convertPoint:fromSpace:toView:", CFSTR("/masterSpace"), a5, a4.x, a4.y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)toolControllerHitEventForwardView:(id)a3
{
  void *v3;
  void *v4;

  -[PUPhotoEditViewController mediaView](self, "mediaView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)toolController:(id)a3 didChangeIsScrolling:(BOOL)a4
{
  _BOOL8 v4;
  _QWORD v6[6];

  v4 = a4;
  if (-[PUPhotoEditViewController currentToolControllerIsScrolling](self, "currentToolControllerIsScrolling", a3) != a4)
  {
    -[PUPhotoEditViewController setCurrentToolControllerIsScrolling:](self, "setCurrentToolControllerIsScrolling:", v4);
    -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__PUPhotoEditViewController_toolController_didChangeIsScrolling___block_invoke;
    v6[3] = &unk_1E58AACF0;
    v6[4] = self;
    *(double *)&v6[5] = (double)(v4 ^ 1);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.2);
  }
}

- (void)toolControllerWantsSecondaryToolbarShadow:(id)a3 alpha:(double)a4
{
  -[PUPhotoEditViewController setSecondaryToolbarShadowAlphaOverride:](self, "setSecondaryToolbarShadowAlphaOverride:", a3, a4);
  -[PUPhotoEditViewController _updateToolbarShadowAlpha](self, "_updateToolbarShadowAlpha");
}

- (id)mediaView
{
  return self->_mediaView;
}

- (id)secondaryToolbar
{
  return self->_secondaryToolbar;
}

- (id)currentTool
{
  return self->_currentTool;
}

- (id)fontForButtons
{
  void *v3;
  void *v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUPhotoEditViewController _actionButtonsGoInTopToolbar](self, "_actionButtonsGoInTopToolbar"))
    objc_msgSend(v3, "photoEditingToolbarButtonCompactFont");
  else
    objc_msgSend(v3, "photoEditingToolbarButtonNormalFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)showsLabelsForToolButtons
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  void *v5;

  -[PUPhotoEditViewController photoEditSpec](self, "photoEditSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentLayoutStyle");

  if (v3 == 1)
    return 0;
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_TOOL_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "length") != 0;

  return v4;
}

- (void)dismissLivePhotoRevertConfirmationAlert
{
  void *v3;

  -[PUPhotoEditViewController irisRevertConfirmationAlert](self, "irisRevertConfirmationAlert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PUPhotoEditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)isImageZooming
{
  return self->_isImageZooming;
}

- (id)imageProperties
{
  return self->_imageProperties;
}

- (void)removeCropToolGainMap
{
  double v3;

  -[PUCropToolController setGainMapImage:](self->_cropController, "setGainMapImage:", 0);
  LODWORD(v3) = 0;
  -[PUCropToolController setGainMapValue:](self->_cropController, "setGainMapValue:", v3);
}

- (void)addCropToolGainMapIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[PUPhotoEditViewController currentAssetNeedsGainMap](self, "currentAssetNeedsGainMap"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D51FF0]);
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithComposition:", v5);

    objc_msgSend(v6, "setAuxiliaryImageType:", 7);
    objc_msgSend(MEMORY[0x1E0D71268], "sourceFilterNoOrientation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPipelineFilters:", v8);

    objc_msgSend(v6, "setName:", CFSTR("PUPhotoEditViewController-renderMeteorPlusGainMap-crop"));
    -[PUPhotoEditViewController _addCropToolGainMapWithRequest:](self, "_addCropToolGainMapWithRequest:", v6);

  }
}

- (void)_addCropToolGainMapWithRequest:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke;
  v3[3] = &unk_1E58AB198;
  v3[4] = self;
  objc_msgSend(a3, "submit:", v3);
}

- (void)mediaViewWillBeginZooming:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isImageZooming = 1;
  -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 0);
  -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mediaViewWillBeginZooming:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PUPhotoEditViewController _setTransientStatusBadgeVisible:](self, "_setTransientStatusBadgeVisible:", 0);
  -[PUPhotoEditViewController _focusViewForInteractionWithDelay](self, "_focusViewForInteractionWithDelay");

}

- (void)mediaViewDidEndZooming:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isImageZooming = 0;
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUPhotoEditViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
  -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 1);
  -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "mediaViewDidEndZooming:", v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[PUPhotoEditViewController _updateForcingDarkUserInterfaceStyleForZoomIfNeeded](self, "_updateForcingDarkUserInterfaceStyleForZoomIfNeeded");
  if (!-[PUPhotoEditToolController isPerformingLiveInteraction](self->_currentEditingTool, "isPerformingLiveInteraction"))
  {
    -[PUPhotoEditViewController _cancelPendingFocusViewForInteractionWithDelay](self, "_cancelPendingFocusViewForInteractionWithDelay");
    -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 0);
  }

}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "mediaView:didZoom:", v6, a4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[PUPhotoEditViewController _updateForcingDarkUserInterfaceStyleForZoomIfNeeded](self, "_updateForcingDarkUserInterfaceStyleForZoomIfNeeded");
  -[PUPhotoEditViewController _updateZoomButton](self, "_updateZoomButton");
  -[PUPhotoEditViewController _updateToolbarShadowAlpha](self, "_updateToolbarShadowAlpha");

}

- (void)mediaViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isImageZooming = 1;
  -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 0);
  -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mediaViewWillBeginDragging:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PUPhotoEditViewController _setTransientStatusBadgeVisible:](self, "_setTransientStatusBadgeVisible:", 0);
  -[PUPhotoEditViewController _focusViewForInteractionWithDelay](self, "_focusViewForInteractionWithDelay");

}

- (void)mediaViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_isImageZooming = 0;
  -[PUPhotoEditViewController _updateForcingDarkUserInterfaceStyleForZoomIfNeeded](self, "_updateForcingDarkUserInterfaceStyleForZoomIfNeeded");
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PUPhotoEditViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
  -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 1);
  -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "mediaViewDidEndDragging:willDecelerate:", v6, v4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  if (!-[PUPhotoEditToolController isPerformingLiveInteraction](self->_currentEditingTool, "isPerformingLiveInteraction"))
  {
    -[PUPhotoEditViewController _cancelPendingFocusViewForInteractionWithDelay](self, "_cancelPendingFocusViewForInteractionWithDelay");
    -[PUPhotoEditViewController setFocusingViewForInteraction:](self, "setFocusingViewForInteraction:", 0);
  }

}

- (void)mediaViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mediaViewDidEndDecelerating:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)mediaViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoEditViewController _updateForcingDarkUserInterfaceStyleForZoomIfNeeded](self, "_updateForcingDarkUserInterfaceStyleForZoomIfNeeded");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mediaViewDidScroll:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PUPhotoEditViewController _updateToolbarShadowAlpha](self, "_updateToolbarShadowAlpha");
}

- (void)mediaViewDidFinishRendering:(id)a3 withStatistics:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  void *v23;
  dispatch_time_t v24;
  _QWORD block[5];
  CGRect v26;
  CGRect v27;

  v6 = a3;
  v7 = a4;
  -[PUPhotoEditViewController videoScrubberView](self, "videoScrubberView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PUPhotoEditViewController lastKnownMediaViewImageFrame](self, "lastKnownMediaViewImageFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v6, "imageFrame");
    v27.origin.x = v18;
    v27.origin.y = v19;
    v27.size.width = v20;
    v27.size.height = v21;
    v26.origin.x = v11;
    v26.origin.y = v13;
    v26.size.width = v15;
    v26.size.height = v17;
    v22 = CGRectEqualToRect(v26, v27);

    if (!v22)
    {
      -[PUPhotoEditViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNeedsLayout");

    }
  }
  objc_msgSend(v6, "imageFrame");
  -[PUPhotoEditViewController setLastKnownMediaViewImageFrame:](self, "setLastKnownMediaViewImageFrame:");
  if (-[PUPhotoEditViewController shouldBePreviewingOriginal](self, "shouldBePreviewingOriginal")
    && -[PUPhotoEditViewController _isPreviewingOriginal](self, "_isPreviewingOriginal")
    && !-[PUPhotoEditViewController showOriginalCausedSizeChange](self, "showOriginalCausedSizeChange"))
  {
    -[PUPhotoEditViewController _startShowingOriginalBadge](self, "_startShowingOriginalBadge");
  }
  if (-[PUPhotoEditViewController _isInEditRevertTransitionSnapshotVisible](self, "_isInEditRevertTransitionSnapshotVisible"))
  {
    v24 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PUPhotoEditViewController_mediaViewDidFinishRendering_withStatistics___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_after(v24, MEMORY[0x1E0C80D38], block);
  }
  if ((-[NUMediaView loopsVideoPlayback](self->_mediaView, "loopsVideoPlayback") & 1) != 0
    || -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    -[PUPhotoEditMediaToolController videoRenderingChanged](self->_mediaToolController, "videoRenderingChanged");
  }
  else
  {
    -[PUPhotoEditViewController _handleMediaViewReady:statistics:](self, "_handleMediaViewReady:statistics:", v6, v7);
    -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
    -[PUPhotoEditViewController _updateKeyCommands](self, "_updateKeyCommands");
  }

}

- (void)mediaViewDidUpdateLivePhoto:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NUMediaView _livePhotoView](self->_mediaView, "_livePhotoView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "overridePhoto"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v4, "overridePhoto"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "livePhoto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setPlaceholderImage:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[PUPhotoEditMediaToolController videoRenderingChanged](self->_mediaToolController, "videoRenderingChanged");
}

- (void)mediaViewIsReadyForVideoPlayback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CMTime v7;
  CMTime lhs;
  CMTime v9;
  CMTime v10[2];

  -[PUPhotoEditViewController _handleMediaViewReady:statistics:](self, "_handleMediaViewReady:statistics:", a3, 0);
  memset(&v10[1], 0, sizeof(CMTime));
  -[PUPhotoEditViewController initialSeekTime](self, "initialSeekTime");
  if ((unsigned __int128)0 >> 96 && -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trimAdjustmentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    memset(v10, 0, 24);
    if (v5)
    {
      objc_msgSend(v5, "startTime");
      if ((v10[0].flags & 1) != 0)
      {
        lhs = v10[1];
        v7 = v10[0];
        CMTimeAdd(&v9, &lhs, &v7);
        v10[1] = v9;
      }
    }
    -[PUPhotoEditMediaToolController trimController](self->_mediaToolController, "trimController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10[1];
    objc_msgSend(v6, "setPlayheadTime:forceSeek:", &v9, 1);

    v9 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    -[PUPhotoEditViewController setInitialSeekTime:](self, "setInitialSeekTime:", &v9);

  }
}

- (void)mediaViewDidPlayToEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  if (self->_currentTool == &self->_audioToolController->super.super)
  {
    -[PUPhotoEditViewController mediaView](self, "mediaView", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CA2E68];
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v5, "seekToTime:exact:", &v8, 1);

    -[PUPhotoEditViewController mediaView](self, "mediaView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "play");

  }
}

- (void)mediaViewDidStartPreparingVideo:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);

  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CachingVideo", ", v9, 2u);
  }

  if (!-[PUPhotoEditToolController isActivelyAdjusting](self->_currentEditingTool, "isActivelyAdjusting"))
    -[PUPhotoEditViewController setIsCachingVideo:](self, "setIsCachingVideo:", 1);
}

- (void)mediaViewDidFinishPreparingVideo:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  -[PUPhotoEditViewController setIsCachingVideo:](self, "setIsCachingVideo:", 0);
  -[PUPhotoEditMediaToolController videoRenderingChanged](self->_mediaToolController, "videoRenderingChanged");
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);

  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_END, v6, "CachingVideo", ", v9, 2u);
  }

}

- (void)mediaViewWillBeginLivePhotoPlayback:(id)a3
{
  id ppt_willBeginPlaybackBlock;
  void (**v5)(void);

  self->_livePhotoIsPlaying = 1;
  -[PUPhotoEditViewController setShouldBePreviewingOriginal:](self, "setShouldBePreviewingOriginal:", 0);
  -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer");
  v5 = (void (**)(void))_Block_copy(self->_ppt_willBeginPlaybackBlock);
  if (v5)
  {
    ppt_willBeginPlaybackBlock = self->_ppt_willBeginPlaybackBlock;
    self->_ppt_willBeginPlaybackBlock = 0;

    v5[2]();
  }

}

- (void)mediaViewDidEndLivePhotoPlayback:(id)a3
{
  id ppt_didEndPlaybackBlock;
  void (**v5)(void);

  self->_livePhotoIsPlaying = 0;
  -[PUPhotoEditViewController _updateTogglePreviewGestureRecognizer](self, "_updateTogglePreviewGestureRecognizer", a3);
  v5 = (void (**)(void))_Block_copy(self->_ppt_didEndPlaybackBlock);
  if (v5)
  {
    ppt_didEndPlaybackBlock = self->_ppt_didEndPlaybackBlock;
    self->_ppt_didEndPlaybackBlock = 0;

    v5[2]();
  }

}

- (void)_handleMediaViewReady:(id)a3 statistics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[4];
  id v22;
  id location;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "_geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    NUPixelSizeToCGSize();
    -[PUPhotoEditViewController setLastKnownPreviewImageSize:](self, "setLastKnownPreviewImageSize:");

  }
  v10 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest");
  if (v7 && v10)
  {
    -[_PPTState setHasRendered:](self->_pptState, "setHasRendered:", 1);
    -[PUPhotoEditViewController _ppt_conditionallyExecuteAfterRender](self, "_ppt_conditionallyExecuteAfterRender");
    -[_PPTState renderStatistics](self->_pptState, "renderStatistics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v7);

  }
  -[PUPhotoEditViewController _updateVideoScrubber](self, "_updateVideoScrubber");
  if (-[NUMediaView loopsVideoPlayback](self->_mediaView, "loopsVideoPlayback")
    && !-[PUPhotoEditToolController handlesVideoPlaying](self->_currentEditingTool, "handlesVideoPlaying"))
  {
    -[NUMediaView _startVideoPlayback](self->_mediaView, "_startVideoPlayback");
  }
  objc_initWeak(&location, self);
  v12 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PUPhotoEditViewController__handleMediaViewReady_statistics___block_invoke;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v22, &location);
  dispatch_after(v12, MEMORY[0x1E0C80D38], block);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "mediaViewIsReady");
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v14);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_removePlaceholderImageViewIfNeeded
{
  UIImageView *placeholderImageView;
  UIImageView *v4;
  void *v5;
  uint64_t v6;
  UIImageView *v7;
  _QWORD v8[4];
  UIImageView *v9;
  PUPhotoEditViewController *v10;
  _QWORD v11[4];
  UIImageView *v12;

  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView)
  {
    if (!self->_placeholderImageViewTransitioningOut)
    {
      v4 = placeholderImageView;
      self->_placeholderImageViewTransitioningOut = 1;
      v5 = (void *)MEMORY[0x1E0DC3F10];
      v6 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke;
      v11[3] = &unk_1E58ABD10;
      v12 = v4;
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke_2;
      v8[3] = &unk_1E58AAE08;
      v9 = v12;
      v10 = self;
      v7 = v12;
      objc_msgSend(v5, "animateWithDuration:animations:completion:", v11, v8, 0.5);

    }
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  UIButton *cancelButton;
  void *v7;
  void *v8;
  UIButton *mainActionButton;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController cancelConfirmationAlert](self, "cancelConfirmationAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    cancelButton = self->_cancelButton;

    if (cancelButton)
    {
      objc_msgSend(v10, "setSourceView:", self->_cancelButton);
      -[UIButton bounds](self->_cancelButton, "bounds");
      objc_msgSend(v10, "setSourceRect:");
    }
  }
  else
  {

  }
  objc_msgSend(v10, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController revertConfirmationAlert](self, "revertConfirmationAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    mainActionButton = self->_mainActionButton;

    if (mainActionButton)
    {
      objc_msgSend(v10, "setSourceView:", self->_mainActionButton);
      -[UIButton bounds](self->_mainActionButton, "bounds");
      objc_msgSend(v10, "setSourceRect:");
    }
  }
  else
  {

  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;

  v4 = a3;
  -[PUPhotoEditViewController setCancelConfirmationAlert:](self, "setCancelConfirmationAlert:", 0);
  -[PUPhotoEditViewController setRevertConfirmationAlert:](self, "setRevertConfirmationAlert:", 0);
  -[PUPhotoEditViewController setJpegPreviewForRawConfirmationAlert:](self, "setJpegPreviewForRawConfirmationAlert:", 0);
  -[PUPhotoEditViewController setIrisRevertConfirmationAlert:](self, "setIrisRevertConfirmationAlert:", 0);
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)editPluginSession:(id)a3 loadAdjustmentDataWithHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v6, "isEqual:visualChangesOnly:", v7, 1) & 1) == 0)
  {
    self->_pluginWorkImageVersionIsValid = 1;
    self->_pluginWorkImageVersion = 2;
    v5[2](v5, 0);
  }
  else
  {
    self->_pluginWorkImageVersionIsValid = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(v8, "setVersion:", 16);
    -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photo](self, "photo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PUPhotoEditViewController_editPluginSession_loadAdjustmentDataWithHandler___block_invoke;
    v11[3] = &unk_1E58AA608;
    v12 = v5;
    objc_msgSend(v9, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v8, v11, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  }
}

- (void)editPluginSession:(id)a3 loadPlaceholderImageWithHandler:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_workImageSize");
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0D71990]);
  -[PUPhotoEditViewController editSource](self, "editSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithEditSource:", v12);

  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositionController:", v14);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__PUPhotoEditViewController_editPluginSession_loadPlaceholderImageWithHandler___block_invoke;
  v16[3] = &unk_1E58A4D28;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v13, "renderImageWithTargetSize:contentMode:name:completion:", 0, CFSTR("PUPhotoEditViewController-pluginPreview"), v16, v8, v10);

}

- (void)editPluginSession:(id)a3 loadDisplaySizeImageWithHandler:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t pluginWorkImageVersion;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  -[PUPhotoEditViewController _updatePluginWorkImageVersion](self, "_updatePluginWorkImageVersion");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_workImageSize");
  v8 = v7;
  v10 = v9;
  pluginWorkImageVersion = self->_pluginWorkImageVersion;
  if (pluginWorkImageVersion < 2)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    if (self->_pluginWorkImageVersion)
    {
      v13 = 0;
    }
    else if (-[PUPhotoEditViewController isPenultimateAvailable](self, "isPenultimateAvailable"))
    {
      v13 = 8;
    }
    else
    {
      v13 = 1;
    }
    objc_msgSend(v12, "setVersion:", v13);
    objc_msgSend(v12, "setResizeMode:", 1);
    objc_msgSend(v12, "setDeliveryMode:", 1);
    -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photo](self, "photo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke;
    v22[3] = &unk_1E58AA608;
    v17 = &v23;
    v23 = v5;
    objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v19, 0, v12, v22, v8, v10);

    goto LABEL_10;
  }
  if (pluginWorkImageVersion == 2)
  {
    v14 = objc_alloc(MEMORY[0x1E0D71990]);
    -[PUPhotoEditViewController editSource](self, "editSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v14, "initWithEditSource:", v15);

    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositionController:", v16);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke_2;
    v20[3] = &unk_1E58A4D28;
    v17 = &v21;
    v21 = v5;
    objc_msgSend(v12, "renderImageWithTargetSize:contentMode:name:completion:", 0, CFSTR("PUPhotoEditViewController-pluginPreviewAdjusted"), v20, v8, v10);
LABEL_10:

  }
}

- (void)editPluginSession:(id)a3 loadThumbnailImageWithSize:(CGSize)a4 loadHandler:(id)a5
{
  double height;
  double width;
  id v9;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 8750, CFSTR("imageSize is zero"));

  }
  PLPhysicalScreenScale();
  PXSizeScale();
  v12 = v11;
  v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v15, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v15, "setDeliveryMode:", 1);
  objc_msgSend(v15, "setResizeMode:", 1);
  -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__PUPhotoEditViewController_editPluginSession_loadThumbnailImageWithSize_loadHandler___block_invoke;
  v20[3] = &unk_1E58AA608;
  v21 = v9;
  v18 = v9;
  objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, 0, v15, v20, v12, v14);

}

- (void)editPluginSession:(id)a3 loadFullSizeImageWithHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  int64_t pluginWorkImageVersion;
  void *v13;
  int64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  _QWORD aBlock[5];
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUPhotoEditViewController _updatePluginWorkImageVersion](self, "_updatePluginWorkImageVersion");
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke;
  aBlock[3] = &unk_1E58A4D50;
  aBlock[4] = self;
  v9 = v7;
  v35 = v9;
  v10 = _Block_copy(aBlock);
  self->_pluginWorkingOffPenultimate = 0;
  PLPhotoEditGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    pluginWorkImageVersion = self->_pluginWorkImageVersion;
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v37 = pluginWorkImageVersion;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "Loading full size image for plugin; work image version: %d - asset: %@",
      buf,
      0x12u);

  }
  v14 = self->_pluginWorkImageVersion;
  switch(v14)
  {
    case 2:
      PLPhotoEditGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_INFO, "Image was edited during this session, so rendering image for plugin", buf, 2u);
      }

      v19 = objc_alloc(MEMORY[0x1E0D71990]);
      -[PUPhotoEditViewController editSource](self, "editSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v19, "initWithEditSource:", v20);

      -[PUPhotoEditViewController compositionController](self, "compositionController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCompositionController:", v21);

      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_791;
      v24[3] = &unk_1E58A4DC0;
      v25 = v10;
      objc_msgSend(v15, "generateJPEGImageDataWithCompressionQuality:livePhotoPairingIdentifier:completionHandler:", 0, v24, 0.899999976);
      v17 = v25;
      goto LABEL_11;
    case 1:
      v15 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
      objc_msgSend(v15, "setVersion:", 0);
      objc_msgSend(v15, "setLoadingMode:", 0x10000);
      objc_msgSend(v15, "setDeliveryMode:", 1);
      objc_msgSend(v15, "setNetworkAccessAllowed:", 1);
      -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditViewController photo](self, "photo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_788;
      v26[3] = &unk_1E58A4E38;
      v26[4] = self;
      v27 = v9;
      objc_msgSend(v22, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v23, 0, v15, v26, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

      v17 = v27;
      goto LABEL_11;
    case 0:
      v15 = objc_alloc_init(MEMORY[0x1E0CD1500]);
      objc_msgSend(v15, "setForceReturnFullLivePhoto:", 1);
      objc_msgSend(v15, "setContentMode:", 0);
      objc_msgSend(v15, "setForcePrepareCurrentBaseVersionInAddition:", 1);
      v33[0] = v8;
      v33[1] = 3221225472;
      v33[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_779;
      v33[3] = &unk_1E58A4838;
      v33[4] = self;
      objc_msgSend(v15, "setCanHandleRAW:", v33);
      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2;
      v31[3] = &unk_1E58A4D78;
      v32 = v6;
      objc_msgSend(v15, "setCanHandleAdjustmentData:", v31);
      objc_msgSend(v15, "setNetworkAccessAllowed:", 1);
      -[PUPhotoEditViewController photo](self, "photo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_3;
      v28[3] = &unk_1E58A4E10;
      v28[4] = self;
      v29 = v10;
      v30 = v9;
      objc_msgSend(v16, "requestContentEditingInputWithOptions:completionHandler:", v15, v28);

      v17 = v32;
LABEL_11:

      break;
  }

}

- (void)editPluginSession:(id)a3 loadVideoURLWithHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUPhotoEditViewController_editPluginSession_loadVideoURLWithHandler___block_invoke;
  aBlock[3] = &unk_1E58A4E60;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[PUPhotoEditViewController _editPluginSession:checkVideoEnabled:loadVideoComplementURLWithHandler:](self, "_editPluginSession:checkVideoEnabled:loadVideoComplementURLWithHandler:", v8, 0, v9);

}

- (void)editPluginSession:(id)a3 loadVideoComplementURLWithHandler:(id)a4
{
  -[PUPhotoEditViewController _editPluginSession:checkVideoEnabled:loadVideoComplementURLWithHandler:](self, "_editPluginSession:checkVideoEnabled:loadVideoComplementURLWithHandler:", a3, 1, a4);
}

- (void)_editPluginSession:(id)a3 checkVideoEnabled:(BOOL)a4 loadVideoComplementURLWithHandler:(id)a5
{
  _BOOL4 v6;
  id v9;
  _QWORD *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  int64_t pluginWorkImageVersion;
  uint64_t v20;
  void *v21;
  void (*v22)(_QWORD *, _QWORD, __int128 *);
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD *v32;
  __int128 v33;
  uint64_t v34;
  _QWORD aBlock[4];
  id v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v6
    || (-[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isVideoEnabled"),
        v11,
        (v12 & 1) != 0))
  {
    -[PUPhotoEditViewController _updatePluginWorkImageVersion](self, "_updatePluginWorkImageVersion");
    -[PUPhotoEditViewController photo](self, "photo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v39 = 0uLL;
    v40 = 0;
    if (v13)
      objc_msgSend(v13, "photoIrisStillDisplayTime");
    v15 = objc_alloc_init(MEMORY[0x1E0CD1808]);
    objc_msgSend(v15, "setVideoComplementAllowed:", 1);
    objc_msgSend(v15, "setDeliveryMode:", 1);
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke;
    aBlock[3] = &unk_1E58A4E88;
    v17 = v10;
    v36 = v17;
    v37 = v39;
    v38 = v40;
    v18 = _Block_copy(aBlock);
    pluginWorkImageVersion = self->_pluginWorkImageVersion;
    if (pluginWorkImageVersion == 2)
    {
      switch(-[PUPhotoEditViewController workImageVersion](self, "workImageVersion"))
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 8977, CFSTR("unknown work image version"));

          break;
        case 1:
          v24 = v15;
          v25 = 1;
          goto LABEL_23;
        case 2:
          if (-[PUPhotoEditViewController isPenultimateAvailable](self, "isPenultimateAvailable"))
            v25 = 8;
          else
            v25 = 1;
          v24 = v15;
          goto LABEL_23;
        case 3:
          v24 = v15;
          v25 = 0;
LABEL_23:
          objc_msgSend(v24, "setVersion:", v25);
          break;
        default:
          break;
      }
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_2;
      v31[3] = &unk_1E58A4ED8;
      v31[4] = self;
      v33 = v39;
      v34 = v40;
      v32 = v17;
      v26 = _Block_copy(v31);

      v18 = v26;
      goto LABEL_25;
    }
    if (pluginWorkImageVersion == 1)
    {
      v21 = v15;
      v20 = 0;
    }
    else
    {
      if (pluginWorkImageVersion)
      {
LABEL_25:
        -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v16;
        v29[1] = 3221225472;
        v29[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_4;
        v29[3] = &unk_1E58AA330;
        v30 = v18;
        v28 = v18;
        objc_msgSend(v27, "requestAsynchronousVideoURLForAsset:options:resultHandler:", v14, v15, v29);

        goto LABEL_26;
      }
      if (-[PUPhotoEditViewController isPenultimateAvailable](self, "isPenultimateAvailable"))
        v20 = 8;
      else
        v20 = 1;
      v21 = v15;
    }
    objc_msgSend(v21, "setVersion:", v20);
    goto LABEL_25;
  }
  v22 = (void (*)(_QWORD *, _QWORD, __int128 *))v10[2];
  v39 = *MEMORY[0x1E0CA2E18];
  v40 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v22(v10, 0, &v39);
LABEL_26:

}

- (void)editPluginSession:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD aBlock[5];
  id v22;

  v7 = a4;
  v8 = a5;
  -[PUPhotoEditViewController _updatePluginWorkImageVersion](self, "_updatePluginWorkImageVersion");
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E58A4960;
  aBlock[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = _Block_copy(aBlock);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_4;
  v18[3] = &unk_1E58ABAF0;
  v18[4] = self;
  v12 = v7;
  v19 = v12;
  v13 = v11;
  v20 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(v18);
  v15 = v14;
  if (self->_stashedSnapshot)
  {
    v14[2](v14);
  }
  else
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_7;
    v16[3] = &unk_1E58A4F50;
    v16[4] = self;
    v17 = v14;
    -[PUPhotoEditViewController _captureSnapshotOfBasePhotoWithCompletionHandler:](self, "_captureSnapshotOfBasePhotoWithCompletionHandler:", v16);

  }
}

- (id)pluginActivitiesForEditPluginSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  PUEditActionActivity *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_currentEditingTool)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PUPhotoEditToolController editActionActivities](self->_currentEditingTool, "editActionActivities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v5);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "editMenuEnabled");

    if ((v7 & 1) == 0)
    {
      v8 = -[PUPhotoEditViewController copyPresetAction](self, "copyPresetAction");
      objc_msgSend(v4, "addObject:", v8);

      -[PUPhotoEditViewController pastePresetAction](self, "pastePresetAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      if (MEMORY[0x1AF429AFC]())
      {
        -[PUPhotoEditViewController radarAction](self, "radarAction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
    }
    v11 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_updatePluginWorkImageVersion
{
  unint64_t v3;

  if (!self->_pluginWorkImageVersionIsValid)
  {
    v3 = -[PUEditPluginSession adjustmentType](self->_pluginSession, "adjustmentType");
    if (v3 <= 2)
      self->_pluginWorkImageVersion = qword_1AB0EFD70[v3];
    self->_pluginWorkImageVersionIsValid = 1;
  }
}

- (void)_updatePluginSession
{
  _BOOL4 v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;

  v3 = -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo")
    || -[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v3 || (isKindOfClass & 1) != 0)
  {
    if (!v3 && (isKindOfClass & 1) != 0)
      -[PUPhotoEditViewController _setupImagePluginSession](self, "_setupImagePluginSession");
  }
  else
  {
    -[PUPhotoEditViewController _setupVideoPluginSession](self, "_setupVideoPluginSession");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVideoEnabled");

    -[PUEditPluginSession setAllowLivePhotoExtensions:](self->_pluginSession, "setAllowLivePhotoExtensions:", v6);
    if (-[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing"))
      v7 = -[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia");
    else
      v7 = 0;
    -[PUEditPluginSession setAllowSpatialPhotoExtensions:](self->_pluginSession, "setAllowSpatialPhotoExtensions:", v7);
  }
  -[PUPhotoEditViewController editPluginSessionAvailabilityDidChange:](self, "editPluginSessionAvailabilityDidChange:", self->_pluginSession);
  -[PUPhotoEditViewController _updateMoreButtonAnimated:](self, "_updateMoreButtonAnimated:", 1);
}

- (void)_setupImagePluginSession
{
  PUImageEditPluginSession *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  PUEditPluginSession *pluginSession;

  v3 = objc_alloc_init(PUImageEditPluginSession);
  -[PUEditPluginSession setDataSource:](v3, "setDataSource:", self);
  -[PUEditPluginSession setDelegate:](v3, "setDelegate:", self);
  -[PUPhotoEditViewController photo](self, "photo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPlayPhotoIris");

  -[PUImageEditPluginSession setAllowLivePhotoExtensions:](v3, "setAllowLivePhotoExtensions:", v5);
  if (-[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing"))
    v6 = -[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia");
  else
    v6 = 0;
  -[PUImageEditPluginSession setAllowSpatialPhotoExtensions:](v3, "setAllowSpatialPhotoExtensions:", v6);
  pluginSession = self->_pluginSession;
  self->_pluginSession = &v3->super;

}

- (void)_setupVideoPluginSession
{
  PUVideoEditPluginSession *v3;
  PUEditPluginSession *pluginSession;

  v3 = objc_alloc_init(PUVideoEditPluginSession);
  -[PUEditPluginSession setDataSource:](v3, "setDataSource:", self);
  -[PUEditPluginSession setDelegate:](v3, "setDelegate:", self);
  -[PUVideoEditPluginSession setAllowLoopingVideoExtensions:](v3, "setAllowLoopingVideoExtensions:", -[PUPhotoEditViewController isLoopingVideo](self, "isLoopingVideo"));
  pluginSession = self->_pluginSession;
  self->_pluginSession = &v3->super;

}

- (void)_updatePenultimateAvailableWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v5, "setVersion:", 16);
  -[PUPhotoEditViewController mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E58A4E38;
  v11[4] = self;
  v12 = v4;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v10 = v4;
  objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v5, v11, v8, v9);

}

- (void)editPluginSessionAvailabilityDidChange:(id)a3
{
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
}

- (void)editPluginSessionWillBegin:(id)a3
{
  id v3;

  -[PUPhotoEditViewController aggregateSession](self, "aggregateSession", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPluginStarted:", 1);

}

- (void)editPluginSession:(id)a3 didEndWithCompletionType:(unint64_t)a4 forPluginIdentifier:(id)a5
{
  id v8;
  id v9;
  NSURL *pluginFullSizeImageURL;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a5;
  if (self->_pluginFullSizeImageURL)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v9, "removeItemAtURL:error:", self->_pluginFullSizeImageURL, 0);

    pluginFullSizeImageURL = self->_pluginFullSizeImageURL;
    self->_pluginFullSizeImageURL = 0;

  }
  -[PUPhotoEditViewController _mediaViewEdgeInsets](self, "_mediaViewEdgeInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
  v20 = v19;
  UIAnimationDragCoefficient();
  -[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:](self->_mediaView, "_transitionToInsets:duration:animationCurve:updateRenderContent:", 0, 0, v12, v14, v16, v18, v20 * v21);
  -[PUPhotoEditViewController aggregateSession](self, "aggregateSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPluginIdentifier:", v8);

  if (a4 == 3)
  {
    -[PUPhotoEditViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "undoManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "removeAllActions");
  }

}

- (void)didFinishWithAsset:(id)a3 savedChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  uint8_t buf[24];
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "didFinishWithAsset - saved changes: %@", buf, 0xCu);
  }

  -[PUPhotoEditViewController cancelConfirmationAlert](self, "cancelConfirmationAlert");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[PUPhotoEditViewController cancelConfirmationAlert](self, "cancelConfirmationAlert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController presentedViewController](self, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      -[PUPhotoEditViewController presentedViewController](self, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);

      -[PUPhotoEditViewController setCancelConfirmationAlert:](self, "setCancelConfirmationAlert:", 0);
    }
  }
  -[PUPhotoEditViewController sessionDelegate](self, "sessionDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoEditController:didFinishEditingSessionForAsset:completed:", self, v6, v4);
  v15 = -[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo");
  -[PUPhotoEditViewController presentationDelegate](self, "presentationDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoEditGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v26 = v18;
    _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_INFO, "didFinishWithAsset - sessionDelegate: %@, presentationDelegate: %@, isStandardVideo: %@", buf, 0x20u);

  }
  if (v15)
  {
    objc_msgSend(v6, "modificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", -1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    memset(buf, 0, sizeof(buf));
    -[NUMediaView player](self->_mediaView, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "currentTime");
    else
      memset(buf, 0, sizeof(buf));

    if (self->_inProgressSaveIsDeferredRender)
    {
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    }
    v23 = *(_OWORD *)buf;
    v24 = *(_QWORD *)&buf[16];
    objc_msgSend(v16, "editController:didFinishPreparingForTransitionAfterEditingVideo:modificationDate:seekTime:", self, v6, v20, &v23);

  }
  else
  {
    objc_msgSend(v16, "editController:didFinishPreparingForTransitionAfterEditingPhoto:", self, v6);
  }

}

- (void)didFinishWithChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (!a3)
    -[PUPhotoEditViewController _cancelInProgressSaveRequest](self, "_cancelInProgressSaveRequest");
  -[PUPhotoEditViewController photo](self, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController didFinishWithAsset:savedChanges:](self, "didFinishWithAsset:savedChanges:", v5, v3);

  -[_PPTState setHasRendered:](self->_pptState, "setHasRendered:", 0);
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, void *);
  _QWORD v25[4];
  id v26;
  PUPhotoEditViewController *v27;

  v24 = (void (**)(id, void *))a4;
  -[PUPhotoEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PUPhotoEditViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController _oneUpTransitionPlaceholderViewFrame](self, "_oneUpTransitionPlaceholderViewFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (!-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
    goto LABEL_3;
  -[PUPhotoEditViewController mediaView](self, "mediaView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_videoPlayerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "snapshotViewAfterScreenUpdates:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFrame:", v8, v10, v12, v14);
  if (!v17)
  {
LABEL_3:
    -[PUPhotoEditViewController _currentViewContentsForDismissTransition](self, "_currentViewContentsForDismissTransition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v10, v12, v14);
    objc_msgSend(v17, "setContentMode:", 2);
    objc_msgSend(v17, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContents:", v18);

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__PUPhotoEditViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke;
  v25[3] = &unk_1E58A4F78;
  v20 = v17;
  v26 = v20;
  v27 = self;
  +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:](PUOneUpAssetTransitionContext, "oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:", 0, v6, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController executedSessionAction](self, "executedSessionAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setExecutedAction:", v23);

  if (v24)
    v24[2](v24, v22);

}

- (id)oneUpAssetTransition:(id)a3 adjustTransitionInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (-[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop"))
  {
    -[PUPhotoEditViewController quickCropContext](self, "quickCropContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyCropToAssetTransitionInfo:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  char v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;

  v9 = a4;
  v10 = a6;
  objc_msgSend(v9, "transitionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    v80 = 0uLL;
    v81 = 0;
    if (v11 && (objc_msgSend(v11, "seekTime"), (BYTE12(v80) & 1) != 0))
    {
      v78 = v80;
      v12 = v81;
    }
    else
    {
      v78 = *MEMORY[0x1E0CA2E68];
      v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    }
    v79 = v12;
    v76 = v78;
    v77 = v12;
    -[PUPhotoEditViewController setInitialSeekTime:](self, "setInitialSeekTime:", &v76);
  }
  -[PUPhotoEditViewController photo](self, "photo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "mediaSubtypes");

  objc_msgSend(v11, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setPlaceholderImage:](self, "setPlaceholderImage:", v15);

  objc_msgSend(v11, "imageLayerModulator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setGainMapImage:](self, "setGainMapImage:", objc_msgSend(v16, "gainMapImage"));
  objc_msgSend(v16, "gainMapValue");
  -[PUPhotoEditViewController setGainMapValue:](self, "setGainMapValue:");
  -[PUPhotoEditViewController _updatePlaceholderImage](self, "_updatePlaceholderImage");
  objc_msgSend(v9, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");
  objc_msgSend(v19, "setAlpha:", 0.0);
  v62 = v16;
  v63 = v10;
  if (-[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop"))
  {
    objc_msgSend(v11, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;
    v24 = v23;

    v25 = v22 / v24;
    objc_msgSend(v17, "frame");
    v28 = v27;
    if (v25 >= v26 / v27)
    {
      v32 = v25 * v27;
      v31 = (v26 - v25 * v27) * 0.5;
      v30 = 0.0;
    }
    else
    {
      v29 = v26 / v25;
      v30 = (v27 - v26 / v25) * 0.5;
      v31 = 0.0;
      v32 = v26;
      v28 = v29;
    }
  }
  else
  {
    objc_msgSend(v18, "frame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    objc_msgSend(v9, "fromView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromView:", v41, v34, v36, v38, v40);
    v31 = v42;
    v30 = v43;
    v32 = v44;
    v28 = v45;

  }
  v46 = (v14 >> 20) & 1;
  objc_msgSend(v18, "setFrame:", v31, v30, v32, v28);
  objc_msgSend(v17, "insertSubview:aboveSubview:", v18, self->_mediaView);
  -[PUPhotoEditViewController previewViewFrame](self, "previewViewFrame");
  objc_msgSend(v17, "convertRect:fromView:", v19);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  -[PUPhotoEditViewController _hideEphemeralViews:](self, "_hideEphemeralViews:", 1);
  +[PUInterfaceManager beginDisablingUserInteractionForReason:](PUInterfaceManager, "beginDisablingUserInteractionForReason:", 7);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)MEMORY[0x1E0DC3F10];
  v57 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke;
  v69[3] = &unk_1E58A9C48;
  v72 = v48;
  v73 = v50;
  v74 = v52;
  v75 = v54;
  v70 = v18;
  v71 = v19;
  v64[0] = v57;
  v64[1] = 3221225472;
  v64[2] = __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2;
  v64[3] = &unk_1E58A4FA0;
  v64[4] = self;
  v65 = v70;
  v68 = v46;
  v66 = v55;
  v67 = v63;
  v58 = v63;
  v59 = v55;
  v60 = v70;
  v61 = v19;
  objc_msgSend(v56, "animateWithDuration:animations:completion:", v69, v64, a5);

}

- (void)oneUpAssetTransitionWillBegin:(id)a3
{
  -[PUPhotoEditViewController _hideEphemeralViews:](self, "_hideEphemeralViews:", 1);
}

- (void)oneUpAssetTransitionDidEnd:(id)a3
{
  void *v4;
  id v5;

  -[PUPhotoEditViewController _hideEphemeralViews:](self, "_hideEphemeralViews:", 0);
  -[PUPhotoEditViewController px_imageModulationManager](self, "px_imageModulationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController imageLayerModulator](self, "imageLayerModulator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkInImageLayerModulator:", v4);

}

- (void)_hideEphemeralViews:(BOOL)a3
{
  -[UIImageView setHidden:](self->_placeholderImageView, "setHidden:", a3);
  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  return !-[PUPhotoEditViewController _hasUnsavedChanges](self, "_hasUnsavedChanges", a3);
}

- (void)_didStartExitAction
{
  void *v3;
  void *v4;

  -[PUPhotoEditViewController exitEditTimeInterval](self, "exitEditTimeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginInterval");

  -[PUPhotoEditViewController editSessionTimeInterval](self, "editSessionTimeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endInterval");

  self->_leavingEdit = 1;
}

- (void)_didEndExitActionWithSessionKeys:(id)a3
{
  -[PUPhotoEditViewController _didEndExitActionWithSessionKeys:initialComposition:](self, "_didEndExitActionWithSessionKeys:initialComposition:", a3, 0);
}

- (void)_didEndExitActionWithSessionKeys:(id)a3 initialComposition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  PUPhotoEditViewController *v59;
  id v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUPhotoEditViewController exitEditTimeInterval](self, "exitEditTimeInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state");

  -[PUPhotoEditViewController exitEditTimeInterval](self, "exitEditTimeInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endInterval");

  -[PUPhotoEditViewController ppt_exitActionCompleteNotificationBlock](self, "ppt_exitActionCompleteNotificationBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PUPhotoEditViewController ppt_exitActionCompleteNotificationBlock](self, "ppt_exitActionCompleteNotificationBlock");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();

    -[PUPhotoEditViewController setPpt_exitActionCompleteNotificationBlock:](self, "setPpt_exitActionCompleteNotificationBlock:", 0);
  }
  if (v9 == 1)
  {
    -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositionController:", v14);

    -[PUPhotoEditViewController exitEditTimeInterval](self, "exitEditTimeInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    objc_msgSend(v13, "setExitEditDuration:");

    v16 = PUCheckAndNoteIsFirstExitFromEditSinceLaunch_isFirstUseSinceLaunch;
    PUCheckAndNoteIsFirstExitFromEditSinceLaunch_isFirstUseSinceLaunch = 1;
    objc_msgSend(v13, "setFirstSinceLaunch:", (v16 & 1) == 0);
    objc_msgSend(v13, "buildEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if (v6)
    {
      v58 = v13;
      v59 = self;
      v60 = v6;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      obj = v6;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v63;
        v22 = MEMORY[0x1E0C9AAB0];
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v63 != v21)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "substringFromIndex:", 26);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "invertedSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "componentsSeparatedByCharactersInSet:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "componentsJoinedByString:", CFSTR("_"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, v28);
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v20);
      }

      self = v59;
      -[PUPhotoEditViewController aggregateSession](v59, "aggregateSession");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pluginIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v60;
      v13 = v58;
      if (v30)
      {
        -[PUPhotoEditViewController aggregateSession](v59, "aggregateSession");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pluginIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, CFSTR("pluginIdentifier"));

      }
    }
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D09830]);

    -[PUPhotoEditViewController photo](self, "photo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D09828]);

    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *MEMORY[0x1E0D096F8], v18);
    v36 = objc_alloc(MEMORY[0x1E0D7CAD8]);
    -[PUPhotoEditViewController enterEditEventBuilder](self, "enterEditEventBuilder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController exitEditEventBuilder](self, "exitEditEventBuilder");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithLegacyEnterEditEvent:andExitEvent:", v37, v38);
    -[PUPhotoEditViewController setEditSessionEventBuilder:](self, "setEditSessionEventBuilder:", v39);

    -[PUPhotoEditViewController editSessionTimeInterval](self, "editSessionTimeInterval");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "duration");
    v42 = v41;
    -[PUPhotoEditViewController editSessionEventBuilder](self, "editSessionEventBuilder");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setEditSessionDuration:", v42);

    v44 = v7;
    if (!v7)
    {
      -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PUPhotoEditViewController editSessionEventBuilder](self, "editSessionEventBuilder");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setInitialComposition:", v44);

    if (!v7)
    -[PUPhotoEditViewController adjustmentIdentifierAndVersion](self, "adjustmentIdentifierAndVersion");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController editSessionEventBuilder](self, "editSessionEventBuilder");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAdjustmentIdentifierAndVersion:", v46);

    v48 = -[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop");
    -[PUPhotoEditViewController editSessionEventBuilder](self, "editSessionEventBuilder");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setSessionEntryPoint:", v48);

    if (-[PUPhotoEditViewController _isQuickCrop](self, "_isQuickCrop"))
    {
      -[PUPhotoEditViewController quickCropContext](self, "quickCropContext");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "selectedAspectRatio");
      v52 = v51;
      v54 = v53;
      -[PUPhotoEditViewController editSessionEventBuilder](self, "editSessionEventBuilder");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setQuickCropSelectedAspectRatio:", v52, v54);

    }
    -[PUPhotoEditViewController editSessionEventBuilder](self, "editSessionEventBuilder");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "buildEvent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *MEMORY[0x1E0D7CB78], v57);
  }
  objc_msgSend(MEMORY[0x1E0D520B0], "reapAllStoragePools");

}

- (void)fulfillPendingEditsRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIViewController *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD aBlock[5];
  id v21;
  id v22;

  v4 = a3;
  -[PUPhotoEditViewController photo](self, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  -[PUPhotoEditToolController compositionController](self->_currentEditingTool, "compositionController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        v9 = -[PUPhotoEditToolController canBecomeActiveTool](self->_currentEditingTool, "canBecomeActiveTool"),
        v8,
        v9))
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke;
    aBlock[3] = &unk_1E58AB790;
    aBlock[4] = self;
    v11 = v4;
    v21 = v11;
    v22 = v6;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v11, "adjustments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "category");

    if (v15 == 10)
    {
      -[PUPhotoEditViewController _presentMarkup](self, "_presentMarkup");
      objc_msgSend(v11, "finishedWithSuccess:error:", 1, 0);
    }
    else
    {
      -[PUPhotoEditViewController _toolControllerForAdjustmentCategory:](self, "_toolControllerForAdjustmentCategory:", v15);
      v17 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      -[UIViewController configureForAdjustmentCategory:](v17, "configureForAdjustmentCategory:", v15);
      if (self->_currentTool == v17)
      {
        v12[2](v12);
      }
      else
      {
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_4;
        v18[3] = &unk_1E58ABAC8;
        v19 = v12;
        -[PUPhotoEditViewController switchToEditingTool:animated:completionHandler:](self, "switchToEditingTool:animated:completionHandler:", v17, 1, v18);

      }
    }

  }
  else
  {
    +[PUPhotoEditPendingEditsRequest errorWithCode:debugDescription:](PUPhotoEditPendingEditsRequest, "errorWithCode:debugDescription:", 3, CFSTR("Editing resources have not loaded"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishedWithSuccess:error:", 0, v16);

  }
}

- (id)_toolControllerForAdjustmentCategory:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v5 = 1608;
      goto LABEL_11;
    case 4:
      v5 = 1600;
      goto LABEL_11;
    case 5:
      v5 = 1632;
      goto LABEL_11;
    case 6:
    case 7:
    case 8:
      v5 = 1592;
      goto LABEL_11;
    case 9:
      v5 = 1624;
      goto LABEL_11;
    case 10:
      -[PUPhotoEditViewController _defaultInitialToolController](self, "_defaultInitialToolController", v3, v4);
      self = (PUPhotoEditViewController *)objc_claimAutoreleasedReturnValue();
      return self;
    case 11:
      v5 = 1616;
      goto LABEL_11;
    case 12:
      v5 = 1648;
LABEL_11:
      self = (PUPhotoEditViewController *)*(id *)((char *)&self->super.super.super.isa + v5);
      break;
    default:
      return self;
  }
  return self;
}

- (void)_didStartEnterEdit
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginInterval");

  -[PUPhotoEditViewController editSessionTimeInterval](self, "editSessionTimeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginInterval");

  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUPhotoEditViewController isFirstSinceBoot](self, "isFirstSinceBoot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUPhotoEditViewController isFirstSinceLaunch](self, "isFirstSinceLaunch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "FirstSinceBoot=%@, FirstSinceLaunch=%@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_didEndEnterEdit
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);

  -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 1)
  {
    -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endInterval");

    -[PUPhotoEditViewController sceneHUD](self, "sceneHUD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "update");

    -[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "duration");
    v9 = v8;

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ttrButtonDurationThreshold");
    self->_ttrExceededThreshold = v9 >= v11;

    if (-[PUPhotoEditViewController _wantsTTRButton](self, "_wantsTTRButton"))
      -[PUPhotoEditViewController _reloadToolbarButtonsIfNeeded](self, "_reloadToolbarButtonsIfNeeded");
    -[PUPhotoEditViewController enterEditEventBuilder](self, "enterEditEventBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnterEditDuration:", v9);
    -[PUPhotoEditViewController resourceCheckingInterval](self, "resourceCheckingInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    objc_msgSend(v12, "setResourceCheckingDuration:");

    -[PUPhotoEditViewController resourceDownloadInterval](self, "resourceDownloadInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "duration");
    objc_msgSend(v12, "setResourceDownloadDuration:");

    -[PUPhotoEditViewController resourceLoadingInterval](self, "resourceLoadingInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    objc_msgSend(v12, "setResourceLoadingDuration:");

    -[PUPhotoEditViewController autoCalcInterval](self, "autoCalcInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "duration");
    objc_msgSend(v12, "setAutoCalcDuration:");

    objc_msgSend(v12, "buildEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.edit.perf.enteredit"), v17);

  }
  -[PUPhotoEditViewController ppt_editIsReadyNotificationBlock](self, "ppt_editIsReadyNotificationBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PUPhotoEditViewController ppt_editIsReadyNotificationBlock](self, "ppt_editIsReadyNotificationBlock");
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v19[2]();

    -[PUPhotoEditViewController setPpt_editIsReadyNotificationBlock:](self, "setPpt_editIsReadyNotificationBlock:", 0);
  }
}

- (void)_didStartResourceLoading
{
  id v2;

  -[PUPhotoEditViewController resourceLoadingInterval](self, "resourceLoadingInterval");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginInterval");

}

- (void)_didEndResourceLoading
{
  id v2;

  -[PUPhotoEditViewController resourceLoadingInterval](self, "resourceLoadingInterval");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endInterval");

}

- (void)_didStartAutoCalc
{
  id v2;

  -[PUPhotoEditViewController autoCalcInterval](self, "autoCalcInterval");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginInterval");

}

- (void)_didEndAutoCalc
{
  void *v2;

  -[PUPhotoEditViewController autoCalcInterval](self, "autoCalcInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endInterval");

  objc_msgSend(MEMORY[0x1E0D71258], "requestVisionCleanUp");
}

- (void)ppt_setEditIsReadyNotificationBlock:(id)a3
{
  void (**v4)(void);
  void *v5;
  uint64_t v6;
  void *v7;
  id ppt_editIsReadyNotificationBlock;
  void (**v9)(void);

  v4 = (void (**)(void))a3;
  v9 = v4;
  if (v4
    && (-[PUPhotoEditViewController enterEditTimeInterval](self, "enterEditTimeInterval"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "state"),
        v5,
        v4 = v9,
        v6 == 2))
  {
    v9[2]();
  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "copy");
    ppt_editIsReadyNotificationBlock = self->_ppt_editIsReadyNotificationBlock;
    self->_ppt_editIsReadyNotificationBlock = v7;

  }
}

- (void)ppt_cancelEdits
{
  -[PUPhotoEditViewController ppt_cancelEditsWithCompletion:](self, "ppt_cancelEditsWithCompletion:", 0);
}

- (void)ppt_save
{
  -[PUPhotoEditViewController ppt_saveWithCompletion:](self, "ppt_saveWithCompletion:", 0);
}

- (void)ppt_revert
{
  -[PUPhotoEditViewController ppt_revertWithCompletion:](self, "ppt_revertWithCompletion:", 0);
}

- (void)ppt_cancelEditsWithCompletion:(id)a3
{
  -[PUPhotoEditViewController setPpt_exitActionCompleteNotificationBlock:](self, "setPpt_exitActionCompleteNotificationBlock:", a3);
  -[PUPhotoEditViewController _performDiscardAction](self, "_performDiscardAction");
}

- (void)ppt_saveWithCompletion:(id)a3
{
  -[PUPhotoEditViewController setPpt_exitActionCompleteNotificationBlock:](self, "setPpt_exitActionCompleteNotificationBlock:", a3);
  -[PUPhotoEditViewController _handleDoneButton:](self, "_handleDoneButton:", self);
}

- (void)ppt_revertWithCompletion:(id)a3
{
  -[PUPhotoEditViewController setPpt_exitActionCompleteNotificationBlock:](self, "setPpt_exitActionCompleteNotificationBlock:", a3);
  -[PUPhotoEditViewController _performRevertAction](self, "_performRevertAction");
}

- (void)ppt_executeAfterRender:(id)a3
{
  -[PUPhotoEditViewController setPpt_afterRenderBlock:](self, "setPpt_afterRenderBlock:", a3);
  -[PUPhotoEditViewController _ppt_conditionallyExecuteAfterRender](self, "_ppt_conditionallyExecuteAfterRender");
}

- (void)_ppt_conditionallyExecuteAfterRender
{
  PUPhotoEditViewController *v3;
  id ppt_afterRenderBlock;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (-[PUPhotoEditViewController _isReadyToRender](self, "_isReadyToRender")
    && -[_PPTState hasRendered](self->_pptState, "hasRendered"))
  {
    v3 = self;
    objc_sync_enter(v3);
    ppt_afterRenderBlock = v3->_ppt_afterRenderBlock;
    if (ppt_afterRenderBlock)
    {
      v5 = _Block_copy(ppt_afterRenderBlock);
      v6 = v3->_ppt_afterRenderBlock;
      v3->_ppt_afterRenderBlock = 0;

    }
    else
    {
      v5 = 0;
    }
    objc_sync_exit(v3);

    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __65__PUPhotoEditViewController__ppt_conditionallyExecuteAfterRender__block_invoke;
      v7[3] = &unk_1E58AB968;
      v7[4] = v3;
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }
}

- (void)ppt_selectFiltersController:(id)a3
{
  id v4;
  _PPTState *v5;
  PUFilterToolController *filtersController;
  id v7;
  _PPTState *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  _PPTState *v13;
  id v14;

  v4 = a3;
  v5 = self->_pptState;
  -[_PPTState enterDispatchGroup](v5, "enterDispatchGroup");
  filtersController = self->_filtersController;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke;
  v12 = &unk_1E58AB968;
  v13 = v5;
  v14 = v4;
  v7 = v4;
  v8 = v5;
  -[PUPhotoEditToolController setPpt_didBecomeActiveToolBlock:](filtersController, "setPpt_didBecomeActiveToolBlock:", &v9);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_filtersController, 1, v9, v10, v11, v12);

}

- (void)ppt_selectAdjustmentsController:(id)a3
{
  -[PUPhotoEditToolController setPpt_didBecomeActiveToolBlock:](self->_adjustmentsController, "setPpt_didBecomeActiveToolBlock:", a3);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_adjustmentsController, 1);
}

- (void)ppt_selectCropController:(id)a3
{
  -[PUPhotoEditToolController setPpt_didBecomeActiveToolBlock:](self->_cropController, "setPpt_didBecomeActiveToolBlock:", a3);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_cropController, 1);
}

- (void)ppt_selectPerspectiveController:(id)a3
{
  -[PUPhotoEditToolController setPpt_didBecomeActiveToolBlock:](self->_cropController, "setPpt_didBecomeActiveToolBlock:", a3);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_cropController, 1);
}

- (void)ppt_selectPortraitController:(id)a3
{
  -[PUPhotoEditToolController setPpt_didBecomeActiveToolBlock:](self->_portraitToolController, "setPpt_didBecomeActiveToolBlock:", a3);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_portraitToolController, 1);
}

- (void)ppt_selectStyleController:(id)a3
{
  -[PUPhotoEditToolController setPpt_didBecomeActiveToolBlock:](self->_photoStylesToolController, "setPpt_didBecomeActiveToolBlock:", a3);
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_photoStylesToolController, 1);
}

- (void)ppt_applyAutoenhance:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(MEMORY[0x1E0D7CAC0], "isAutoEnhanceEnabledForCompositionController:", v4))
    -[PUPhotoEditViewController _handleAutoEnhanceButton:](self, "_handleAutoEnhanceButton:", self);
  -[PUPhotoEditViewController setPpt_afterAutoenhanceBlock:](self, "setPpt_afterAutoenhanceBlock:", v5);
  -[PUPhotoEditViewController _handleAutoEnhanceButton:](self, "_handleAutoEnhanceButton:", self);

}

- (void)ppt_scrollLightSlider:(id)a3
{
  _PPTState *pptState;
  objc_class *v5;
  id v6;
  id v7;

  pptState = self->_pptState;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v6 = objc_alloc_init(v5);
  -[_PPTState setRenderStatistics:](pptState, "setRenderStatistics:", v6);

  -[PUAdjustmentsToolController ppt_selectLightSlider:](self->_adjustmentsController, "ppt_selectLightSlider:", v7);
}

- (void)ppt_scrollColorSlider:(id)a3
{
  _PPTState *pptState;
  objc_class *v5;
  id v6;
  id v7;

  pptState = self->_pptState;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v6 = objc_alloc_init(v5);
  -[_PPTState setRenderStatistics:](pptState, "setRenderStatistics:", v6);

  -[PUAdjustmentsToolController ppt_selectColorSlider:](self->_adjustmentsController, "ppt_selectColorSlider:", v7);
}

- (void)ppt_scrollBWSlider:(id)a3
{
  _PPTState *pptState;
  objc_class *v5;
  id v6;
  id v7;

  pptState = self->_pptState;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v6 = objc_alloc_init(v5);
  -[_PPTState setRenderStatistics:](pptState, "setRenderStatistics:", v6);

  -[PUAdjustmentsToolController ppt_selectBWSlider:](self->_adjustmentsController, "ppt_selectBWSlider:", v7);
}

- (void)ppt_configureSelectedSliderWithSteps:(int64_t)a3
{
  -[PUAdjustmentsToolController ppt_setSteps:](self->_adjustmentsController, "ppt_setSteps:", a3);
}

- (void)ppt_scrollSelectedSliderByDelta
{
  -[PUAdjustmentsToolController ppt_scrollSelectedSliderByDelta](self->_adjustmentsController, "ppt_scrollSelectedSliderByDelta");
}

- (void)ppt_scrollSliderNamed:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUAdjustmentsToolController *adjustmentsController;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  adjustmentsController = self->_adjustmentsController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PUPhotoEditViewController_ppt_scrollSliderNamed_value_completion___block_invoke;
  v14[3] = &unk_1E58A5838;
  objc_copyWeak(&v17, &location);
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  -[PUAdjustmentsToolController ppt_selectSliderNamed:completion:](adjustmentsController, "ppt_selectSliderNamed:completion:", v8, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)ppt_navigateToPortraitLightingEffects:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PUPhotoEditViewController_ppt_navigateToPortraitLightingEffects___block_invoke;
  v6[3] = &unk_1E58AB968;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUPhotoEditViewController ppt_selectPortraitController:](self, "ppt_selectPortraitController:", v6);

}

- (void)ppt_selectLightingEffect:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  _QWORD v19[4];
  dispatch_semaphore_t v20;

  v6 = a3;
  v18 = (void (**)(_QWORD))a4;
  -[PUPhotoEditPortraitToolController lightingControl](self->_portraitToolController, "lightingControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedLightingType");
  objc_msgSend(MEMORY[0x1E0D0D078], "displayNameForLightingType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  while (1)
  {
    objc_msgSend(v9, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) != 0 || v10 > 9)
      break;
    v14 = dispatch_semaphore_create(0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__PUPhotoEditViewController_ppt_selectLightingEffect_completionBlock___block_invoke;
    v19[3] = &unk_1E58ABD10;
    v20 = v14;
    v15 = v14;
    -[PUPhotoEditViewController ppt_selectNextLightingEffect:](self, "ppt_selectNextLightingEffect:", v19);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    ++v10;
    v16 = objc_msgSend(v7, "selectedLightingType");
    objc_msgSend(MEMORY[0x1E0D0D078], "displayNameForLightingType:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v17;
  }
  if (v18)
    v18[2](v18);

}

- (void)ppt_selectNextLightingEffect:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  -[PUPhotoEditPortraitToolController lightingControl](self->_portraitToolController, "lightingControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedLightingType");
  if (v5 > 6)
    v6 = 0;
  else
    v6 = qword_1AB0EFD88[v5];
  objc_msgSend(v4, "ppt_selectLightingType:", v6);
  if (v7)
    v7[2]();

}

- (void)ppt_selectStyle:(id)a3 completionBlock:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[PUPhotoStyleToolController ppt_selectWithStyle:](self->_photoStylesToolController, "ppt_selectWithStyle:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)ppt_playLivePhotoWithWillBeginPlaybackBlock:(id)a3 didEndPlaybackBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PUPhotoEditViewController setPpt_willBeginPlaybackBlock:](self, "setPpt_willBeginPlaybackBlock:", a3);
  -[PUPhotoEditViewController setPpt_didEndPlaybackBlock:](self, "setPpt_didEndPlaybackBlock:", v6);

  -[PUPhotoEditViewController mainLivePhotoView](self, "mainLivePhotoView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPlaybackWithStyle:", 1);

}

- (id)ppt_renderStatisticsDictionaryForTimeInterval:(double)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[12];
  _QWORD v32[12];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[_PPTState renderStatistics](self->_pptState, "renderStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "duration", (_QWORD)v27);
        v11 = v11 + v15;
        objc_msgSend(v14, "prepareDuration");
        v12 = v12 + v16;
        objc_msgSend(v14, "completeDuration");
        v10 = v10 + v17;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  v18 = (double)v5;

  v31[0] = CFSTR("neutrinoFPS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v5 / a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  v32[1] = CFSTR("fps");
  v31[1] = CFSTR("neutrinoFPSUnits");
  v31[2] = CFSTR("neutrinoAveragePrepareDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 / v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v20;
  v32[3] = CFSTR("sec");
  v31[3] = CFSTR("neutrinoAveragePrepareDurationUnits");
  v31[4] = CFSTR("neutrinoAverageRenderDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 / v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v21;
  v32[5] = CFSTR("sec");
  v31[5] = CFSTR("neutrinoAverageRenderDurationUnits");
  v31[6] = CFSTR("neutrinoAverageCompleteDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 / v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v22;
  v32[7] = CFSTR("sec");
  v31[7] = CFSTR("neutrinoAverageCompleteDurationUnits");
  v31[8] = CFSTR("neutrinoNumRenders");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v23;
  v32[9] = CFSTR("renders");
  v31[9] = CFSTR("neutrinoNumRendersUnits");
  v31[10] = CFSTR("neutrinoRenderTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = CFSTR("neutrinoRenderTimeIntervalUnits");
  v32[10] = v24;
  v32[11] = CFSTR("sec");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)photoEditToolbar:(id)a3 accessibilityHUDItemForButton:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "accessibilityHUDItemForButton:", v5);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v16 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0DC3418]);
  v16 = (void *)objc_msgSend(v15, "initWithTitle:image:imageInsets:scaleImage:", v6, v14, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

LABEL_11:
  return v16;
}

- (void)photoEditToolbar:(id)a3 showAccessibilityHUDForItem:(id)a4
{
  -[PUPhotoEditViewController _showAccessibilityHUDItem:](self, "_showAccessibilityHUDItem:", a4);
}

- (void)compositionController:(id)a3 didAddAdjustment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController compositionControllerDidChangeForAdjustments:](self, "compositionControllerDidChangeForAdjustments:", v8);

  }
}

- (void)compositionController:(id)a3 didRemoveAdjustment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController compositionControllerDidChangeForAdjustments:](self, "compositionControllerDidChangeForAdjustments:", v8);

  }
}

- (void)compositionController:(id)a3 didUpdateAdjustment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController compositionControllerDidChangeForAdjustments:](self, "compositionControllerDidChangeForAdjustments:", v8);

  }
}

- (void)compositionController:(id)a3 didUpdateAdjustments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController compositionControllerDidChangeForAdjustments:](self, "compositionControllerDidChangeForAdjustments:", v8);

  }
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  NSObject *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  BOOL v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoEditViewController adjustmentConstants](self, "adjustmentConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_leavingEdit)
    goto LABEL_66;
  objc_msgSend(v5, "PILivePhotoKeyFrameAdjustmentKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  if (v8)
  {
    if (-[PUPhotoEditViewController gainMapImage](self, "gainMapImage"))
    {
      -[PUPhotoEditViewController compositionController](self, "compositionController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "composition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("livePhotoKeyFrame"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[PUPhotoEditViewController setGainMapImage:](self, "setGainMapImage:", 0);
    }
    -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "smartToneAdjustmentControllerCreatingIfNecessary:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v6, "PISmartToneAdjustmentKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modifyAdjustmentWithKey:modificationBlock:", v16, &__block_literal_global_860);

    }
    -[PUPhotoEditViewController valuesCalculator](self, "valuesCalculator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_2;
    v70[3] = &unk_1E58A7B50;
    v74 = v15 != 0;
    v71 = v13;
    v72 = v6;
    v73 = v17;
    v18 = v17;
    v19 = v13;
    objc_msgSend(v18, "precomputeImageValuesWithCompletion:", v70);

  }
  objc_msgSend(v6, "PICropAdjustmentKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v20))
  {

  }
  else
  {
    objc_msgSend(v6, "PIOrientationAdjustmentKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v4, "containsObject:", v21);

    if (!v22)
      goto LABEL_15;
  }
  if (self->_currentEditingTool != &self->_cropController->super
    && -[PUPhotoEditViewController currentAssetNeedsGainMap](self, "currentAssetNeedsGainMap"))
  {
    -[PUPhotoEditViewController _updateGainMap](self, "_updateGainMap");
  }
LABEL_15:
  objc_msgSend(v6, "PIPortraitAdjustmentKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v23) & 1) != 0)
  {
    v24 = -[PUPhotoEditViewController currentAssetNeedsGainMap](self, "currentAssetNeedsGainMap");

    if (!v24)
      goto LABEL_22;
LABEL_20:
    -[PUPhotoEditViewController _updateGainMap](self, "_updateGainMap");
    goto LABEL_22;
  }
  objc_msgSend(v6, "PIDepthAdjustmentKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v25) & 1) == 0)
  {

    goto LABEL_22;
  }
  v26 = -[PUPhotoEditViewController currentAssetNeedsGainMap](self, "currentAssetNeedsGainMap");

  if (v26)
    goto LABEL_20;
LABEL_22:
  if (-[PUPhotoEditToolController suppressesEditUpdates](self->_currentEditingTool, "suppressesEditUpdates"))
    goto LABEL_45;
  -[PUPhotoEditViewController editSource](self, "editSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    goto LABEL_45;
  objc_msgSend(v6, "PIAutoLoopAdjustmentKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v4, "containsObject:", v28);

  if (v29)
  {
    -[PUPhotoEditViewController compositionController](self, "compositionController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "autoLoopAdjustmentController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "enabled"))
      v32 = 2;
    else
      v32 = 1;
    -[NUMediaView _renderer](self->_mediaView, "_renderer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDisplayType:", v32);

  }
  v34 = (void *)MEMORY[0x1E0D71660];
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController editSource](self, "editSource");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "validatedCompositionCopyFor:mediaType:", v35, objc_msgSend(v36, "mediaType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PICropAdjustmentKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v38))
  {

LABEL_32:
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52100]), "initWithComposition:", v37);
    objc_msgSend(v41, "setName:", CFSTR("PUPhotoEditViewController-compositionControllerDidChangeForAdjustments-GeometryChangesRequest"));
    v69 = 0;
    objc_msgSend(v41, "submitSynchronous:", &v69);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v69;
    objc_msgSend(v42, "geometry");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[PUPhotoEditViewController setMediaViewEdgeInsetsUpdateDisableCount:](self, "setMediaViewEdgeInsetsUpdateDisableCount:", -[PUPhotoEditViewController mediaViewEdgeInsetsUpdateDisableCount](self, "mediaViewEdgeInsetsUpdateDisableCount")+ 1);
      -[PUPhotoEditViewController mediaView](self, "mediaView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_renderView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setGeometry:", v44);

      if (!self->_switchingToolsAnimated)
      {
        -[PUPhotoEditViewController _mediaViewEdgeInsetsWithGeometry:](self, "_mediaViewEdgeInsetsWithGeometry:", v44);
        -[NUMediaView setEdgeInsets:](self->_mediaView, "setEdgeInsets:");
      }
      -[NUMediaView setComposition:](self->_mediaView, "setComposition:", v37);
      -[NUMediaView waitForRender](self->_mediaView, "waitForRender");
      -[PUPhotoEditViewController setMediaViewEdgeInsetsUpdateDisableCount:](self, "setMediaViewEdgeInsetsUpdateDisableCount:", -[PUPhotoEditViewController mediaViewEdgeInsetsUpdateDisableCount](self, "mediaViewEdgeInsetsUpdateDisableCount")- 1);
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2319);
      v47 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v63 = v47;
        objc_msgSend(v41, "name");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = v64;
        v78 = 2112;
        v79 = v43;
        _os_log_error_impl(&dword_1AAB61000, v63, OS_LOG_TYPE_ERROR, "Could not load geometry for request %@: %@", buf, 0x16u);

      }
      -[NUMediaView setComposition:](self->_mediaView, "setComposition:", v37);
    }

    goto LABEL_44;
  }
  objc_msgSend(v6, "PIOrientationAdjustmentKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v4, "containsObject:", v39);

  if (v40)
    goto LABEL_32;
  -[NUMediaView setComposition:](self->_mediaView, "setComposition:", v37);
LABEL_44:
  -[PUPhotoEditViewController _updateRenderedPreviewForceRender:](self, "_updateRenderedPreviewForceRender:", 0);

LABEL_45:
  -[PUPhotoEditViewController setShouldBePreviewingOriginal:](self, "setShouldBePreviewingOriginal:", 0);
  if (!-[PUPhotoEditToolController isActivelyAdjusting](self->_currentEditingTool, "isActivelyAdjusting"))
  {
    -[PUPhotoEditViewController _updateModelDependentControlsAnimated:](self, "_updateModelDependentControlsAnimated:", 0);
    -[PUPhotoEditViewController _updateValuesCalculator](self, "_updateValuesCalculator");
  }
  objc_msgSend(v6, "PIAutoLoopAdjustmentKey");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v4, "containsObject:", v48);

  if (v49)
    -[PUPhotoEditViewController _updateMediaViewPlaybackStyle](self, "_updateMediaViewPlaybackStyle");
  objc_msgSend(v6, "PIMuteAdjustmentKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v4, "containsObject:", v50);

  if (v51)
    -[PUPhotoEditViewController _updateMutedState](self, "_updateMutedState");
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = 0;
  }
  v53 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D71380]);
  v54 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D71310]);
  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo") && !v53 && !v54)
  {
    -[PUPhotoEditViewController mediaView](self, "mediaView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "player");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "pause");

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[PUPhotoEditViewController _allTools](self, "_allTools", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v66 != v60)
          objc_enumerationMutation(v57);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "compositionControllerDidChangeForAdjustments:", v4);
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v59);
  }

  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "compositionDidChange");

  -[PUPhotoEditViewController updateMainButtonForSaveAsNewClipMenu](self, "updateMainButtonForSaveAsNewClipMenu");
LABEL_66:

}

- (BOOL)isLivePhotoVideoEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PUPhotoEditViewController photoEditIrisModel](self, "photoEditIrisModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVideoEnabled");

  return v5;
}

- (void)setLivePhotoVideoEnabled:(BOOL)a3
{
  if (-[PUPhotoEditViewController isLivePhotoVideoEnabled](self, "isLivePhotoVideoEnabled") != a3)
    -[PUPhotoEditViewController toggleLivePhotoActive](self, "toggleLivePhotoActive");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 2440);
  return self;
}

- (int64_t)positionForBar:(id)a3
{
  return 1;
}

- (void)editValuesCalculatorHasChangedImageValues:(id)a3
{
  -[PUPhotoEditToolController editValuesCalculatorHasChangedImageValues:](self->_currentEditingTool, "editValuesCalculatorHasChangedImageValues:", a3);
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 0);
}

- (void)editValuesCalculatorHasChangedFlashStatus:(id)a3
{
  -[PUPhotoEditToolController editValuesCalculatorHasChangedFlashStatus:](self->_currentEditingTool, "editValuesCalculatorHasChangedFlashStatus:", a3);
  -[PUPhotoEditViewController _updateToolbarsAnimated:](self, "_updateToolbarsAnimated:", 1);
}

- (void)editValuesCalculatorHasChangedGeometricValues:(id)a3
{
  -[PUPhotoEditToolController editValuesCalculatorHasChangedGeometricValues:](self->_currentEditingTool, "editValuesCalculatorHasChangedGeometricValues:", a3);
}

- (void)editValuesCalculatorDidFinishComputingGeometricValues:(id)a3
{
  -[PUPhotoEditToolController editValuesCalculatorDidFinishComputingGeometricValues:](self->_currentEditingTool, "editValuesCalculatorDidFinishComputingGeometricValues:", a3);
}

- (void)trimToolPlayerWrapper:(id)a3 requestAssetWithFilters:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  NURenderContext *videoRenderContext;
  NURenderContext *v21;
  NURenderContext *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;

  v7 = a4;
  v8 = a5;
  if (-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
  {
    -[NUMediaView composition](self->_mediaView, "composition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[PUPhotoEditMediaToolController trimController](self->_mediaToolController, "trimController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrubberHeight");
      v12 = v11;

      -[PUPhotoEditViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayScale");
      v16 = v12 * v15;

      v17 = 41.0;
      if (v16 >= 41.0)
        v17 = v16;
      v18 = vcvtpd_s64_f64(v17);
      if ((v18 & 0x8000000000000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C0]), "initWithTargetPixelSize:", v18, v18);
      videoRenderContext = self->_videoRenderContext;
      if (!videoRenderContext)
      {
        v21 = (NURenderContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52248]), "initWithPurpose:", 2);
        v22 = self->_videoRenderContext;
        self->_videoRenderContext = v21;

        videoRenderContext = self->_videoRenderContext;
      }
      -[NURenderContext cancelAllRequests](videoRenderContext, "cancelAllRequests");
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52338]), "initWithComposition:", v9);
      objc_msgSend(v23, "setRenderContext:", self->_videoRenderContext);
      objc_msgSend(v23, "setSampleMode:", 2);
      objc_msgSend(v23, "setName:", CFSTR("PUPhotoEditViewController-trimToolClient"));
      objc_msgSend(v23, "setPipelineFilters:", v7);
      objc_msgSend(v23, "setScalePolicy:", v19);
      objc_msgSend(v23, "setResponseQueue:", MEMORY[0x1E0C80D38]);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_2;
      v28[3] = &unk_1E58A4BB0;
      v29 = v8;
      objc_msgSend(v23, "submit:", v28);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke;
      block[3] = &unk_1E58ABAC8;
      v31 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v19 = v31;
    }

  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_870;
    v26[3] = &unk_1E58A5058;
    v27 = v8;
    -[PUPhotoEditViewController _requestLivePhotoAssetWithFilters:completion:](self, "_requestLivePhotoAssetWithFilters:completion:", v7, v26);
    v9 = v27;
  }

}

- (UIMenu)askToSaveAsNewClipMenu
{
  UIMenu *askToSaveAsNewClipMenu;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIMenu *v12;
  UIMenu *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  askToSaveAsNewClipMenu = self->_askToSaveAsNewClipMenu;
  if (!askToSaveAsNewClipMenu)
  {
    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0DC39D0];
    v4 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(CFSTR("EDITED_TRIM_SAVE_VIDEO"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("video.badge.checkmark"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke;
    v20[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v17, v16, 0, v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v7 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(CFSTR("EDITED_TRIM_SAVE_AS_NEW_CLIP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("video.badge.plus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke_2;
    v18[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "menuWithTitle:children:", &stru_1E58AD278, v11);
    v12 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    v13 = self->_askToSaveAsNewClipMenu;
    self->_askToSaveAsNewClipMenu = v12;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    askToSaveAsNewClipMenu = self->_askToSaveAsNewClipMenu;
  }
  return askToSaveAsNewClipMenu;
}

- (void)updateMainButtonForSaveAsNewClipMenu
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!-[PUPhotoEditViewController isStandardVideo](self, "isStandardVideo"))
    goto LABEL_8;
  -[PUPhotoEditViewController photo](self, "photo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_8;
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trimAdjustmentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PUPhotoEditViewController uneditedComposition](self, "uneditedComposition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("trim"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || v10 && (objc_msgSend(v6, "isEqual:visualChangesOnly:", v10, 1) & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v10 = 0;
    if (!v6)
    {
LABEL_7:

LABEL_8:
      -[UIButton setMenu:](self->_mainActionButton, "setMenu:", 0);
      return;
    }
  }

  -[PUPhotoEditViewController askToSaveAsNewClipMenu](self, "askToSaveAsNewClipMenu");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](self->_mainActionButton, "setMenu:", v11);

  -[UIButton setShowsMenuAsPrimaryAction:](self->_mainActionButton, "setShowsMenuAsPrimaryAction:", 1);
}

- (id)adjustmentConstants
{
  return (id)objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
}

- (PUEditActionActivity)copyPresetAction
{
  PUEditActionActivity *copyPresetAction;
  PUEditActionActivity *v4;
  void *v5;
  PUEditActionActivity *v6;
  PUEditActionActivity *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  copyPresetAction = self->_copyPresetAction;
  if (!copyPresetAction)
  {
    v4 = [PUEditActionActivity alloc];
    PULocalizedString(CFSTR("PHOTOEDIT_COPY_ADJUST"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUEditActionActivity initWithActionName:activityType:systemImageName:](v4, "initWithActionName:activityType:systemImageName:", v5, CFSTR("copyPreset"), CFSTR("slider.horizontal.2.square.on.square"));
    v7 = self->_copyPresetAction;
    self->_copyPresetAction = v6;

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__PUPhotoEditViewController_copyPresetAction__block_invoke;
    v12[3] = &unk_1E58A5080;
    objc_copyWeak(&v13, &location);
    -[PUEditActionActivity setCanPerformActivityActionHandler:](self->_copyPresetAction, "setCanPerformActivityActionHandler:", v12);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __45__PUPhotoEditViewController_copyPresetAction__block_invoke_2;
    v10[3] = &unk_1E58A50A8;
    objc_copyWeak(&v11, &location);
    -[PUEditActionActivity setPerformActivityActionHandler:](self->_copyPresetAction, "setPerformActivityActionHandler:", v10);
    -[PUEditActionActivity setDisablesInsteadOfHides:](self->_copyPresetAction, "setDisablesInsteadOfHides:", 1);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    copyPresetAction = self->_copyPresetAction;
  }
  return copyPresetAction;
}

- (PUEditActionActivity)pastePresetAction
{
  PUEditActionActivity *pastePresetAction;
  PUEditActionActivity *v4;
  void *v5;
  PUEditActionActivity *v6;
  PUEditActionActivity *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  pastePresetAction = self->_pastePresetAction;
  if (!pastePresetAction)
  {
    v4 = [PUEditActionActivity alloc];
    PULocalizedString(CFSTR("PHOTOEDIT_PASTE_ADJUST"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUEditActionActivity initWithActionName:activityType:systemImageName:](v4, "initWithActionName:activityType:systemImageName:", v5, CFSTR("pastePreset"), CFSTR("slider.horizontal.2.square.badge.arrow.down"));
    v7 = self->_pastePresetAction;
    self->_pastePresetAction = v6;

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__PUPhotoEditViewController_pastePresetAction__block_invoke;
    v12[3] = &unk_1E58A5080;
    objc_copyWeak(&v13, &location);
    -[PUEditActionActivity setCanPerformActivityActionHandler:](self->_pastePresetAction, "setCanPerformActivityActionHandler:", v12);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __46__PUPhotoEditViewController_pastePresetAction__block_invoke_2;
    v10[3] = &unk_1E58A50A8;
    objc_copyWeak(&v11, &location);
    -[PUEditActionActivity setPerformActivityActionHandler:](self->_pastePresetAction, "setPerformActivityActionHandler:", v10);
    -[PUEditActionActivity setDisablesInsteadOfHides:](self->_pastePresetAction, "setDisablesInsteadOfHides:", 1);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    pastePresetAction = self->_pastePresetAction;
  }
  return pastePresetAction;
}

- (PUEditActionActivity)radarAction
{
  PUEditActionActivity *radarAction;
  PUEditActionActivity *v4;
  PUEditActionActivity *v5;
  _QWORD v7[4];
  id v8;
  id location;

  radarAction = self->_radarAction;
  if (!radarAction)
  {
    v4 = -[PUEditActionActivity initWithActionName:activityType:systemImageName:]([PUEditActionActivity alloc], "initWithActionName:activityType:systemImageName:", CFSTR("File a Radar"), CFSTR("fileRadar"), CFSTR("ant.circle"));
    v5 = self->_radarAction;
    self->_radarAction = v4;

    -[PUEditActionActivity setCanPerformActivityActionHandler:](self->_radarAction, "setCanPerformActivityActionHandler:", &__block_literal_global_887);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__PUPhotoEditViewController_radarAction__block_invoke_2;
    v7[3] = &unk_1E58A50A8;
    objc_copyWeak(&v8, &location);
    -[PUEditActionActivity setPerformActivityActionHandler:](self->_radarAction, "setPerformActivityActionHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    radarAction = self->_radarAction;
  }
  return radarAction;
}

- (BOOL)_canCopyEdits
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  int v8;

  v3 = -[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing");
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableSelectiveCopyEdits");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71328]);
    objc_msgSend(v5, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71390]);
  }
  v8 = objc_msgSend(MEMORY[0x1E0D7CAF0], "hasValidAdjustmentsInCompositionController:", v5);
  if (((v8 ^ 1 | v3) & 1) == 0)
    v8 = !-[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia");

  return v8;
}

- (void)_copyEditsSkippingOptions:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  PUPhotoEditCopyEditsViewController *v9;
  void *v10;
  PUPhotoEditCopyEditsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (a3
    || (-[PUPhotoEditViewController photo](self, "photo"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = +[PUPhotoEditCopyEditsViewController shouldPresentForCopyingFromCompositionController:asset:](PUPhotoEditCopyEditsViewController, "shouldPresentForCopyingFromCompositionController:asset:", v6, v7), v7, !v8))
  {
    objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71328]);
    objc_msgSend(v6, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71390]);
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v11 = (PUPhotoEditCopyEditsViewController *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController photo](self, "photo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditCopyEditsViewController copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:](v11, "copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:", v6, v17, 1);

  }
  else
  {
    v9 = [PUPhotoEditCopyEditsViewController alloc];
    -[PUPhotoEditViewController photo](self, "photo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUPhotoEditCopyEditsViewController initWithCompositionController:asset:](v9, "initWithCompositionController:asset:", v6, v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v11);
    objc_msgSend(v12, "setModalPresentationStyle:", 7);
    objc_msgSend(v12, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceItem:", self->_moreButton);
    objc_msgSend(v13, "adaptiveSheetPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDetents:", v16);

    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

- (BOOL)_canPasteEdits
{
  BOOL v3;
  void *v4;
  int v5;

  v3 = -[PUPhotoEditViewController _enableSpatialMediaEditing](self, "_enableSpatialMediaEditing");
  objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPresetOnPasteboard");
  if (v5 && !v3)
    v5 = !-[PUPhotoEditViewController isSpatialMedia](self, "isSpatialMedia");

  return v5;
}

- (void)_pasteEdits
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PEEditActionEventBuilder *v9;
  PEEditActionEventBuilder *pasteEditsEventBuilder;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *smartCopyPasteQueue;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id location;
  _QWORD block[4];
  id v30;
  PUPhotoEditViewController *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presetFromPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalyticsEventBuilderDelegate:", self);
  v6 = objc_alloc(MEMORY[0x1E0D7CAD0]);
  -[PUPhotoEditViewController photo](self, "photo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (PEEditActionEventBuilder *)objc_msgSend(v6, "initWithBaseAction:assets:", v5, v8);
  pasteEditsEventBuilder = self->_pasteEditsEventBuilder;
  self->_pasteEditsEventBuilder = v9;

  if (v5)
  {
    -[PUPhotoEditViewController photo](self, "photo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUPhotoEditViewController photo](self, "photo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "px_descriptionForAssertionMessage");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10454, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.photo"), v24, v25);

        }
        objc_msgSend(v12, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "isEligibleForSmartPasteWithPhotoLibrary:", v13);

        if (v14)
        {
          smartCopyPasteQueue = self->_smartCopyPasteQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke;
          block[3] = &unk_1E58ABCA8;
          v30 = v5;
          v31 = self;
          dispatch_async(smartCopyPasteQueue, block);

LABEL_11:
          goto LABEL_12;
        }
LABEL_10:
        -[PUPhotoEditViewController _willModifyAdjustment](self, "_willModifyAdjustment");
        objc_initWeak(&location, self);
        -[PUPhotoEditViewController compositionController](self, "compositionController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController photo](self, "photo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditViewController editSource](self, "editSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke_4;
        v26[3] = &unk_1E58AB470;
        objc_copyWeak(&v27, &location);
        v26[4] = self;
        objc_msgSend(v5, "applyToCompositionController:asset:editSource:completion:", v19, v20, v21, v26);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10454, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.photo"), v18);

    }
    v12 = 0;
    goto LABEL_10;
  }
LABEL_12:

}

- (void)_sendPasteEditsAnalytics
{
  PEEditActionEventBuilder *pasteEditsEventBuilder;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PEEditActionEventBuilder *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pasteEditsEventBuilder = self->_pasteEditsEventBuilder;
  if (pasteEditsEventBuilder)
  {
    -[PEEditActionEventBuilder buildEvents](pasteEditsEventBuilder, "buildEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      v8 = *MEMORY[0x1E0D7CB70];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v8, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    v10 = self->_pasteEditsEventBuilder;
  }
  else
  {
    v10 = 0;
  }
  self->_pasteEditsEventBuilder = 0;

}

- (void)updateAnalyticsEventBuilderActionType:(id)a3 forAssets:(id)a4
{
  -[PEEditActionEventBuilder registerActionType:forAssets:](self->_pasteEditsEventBuilder, "registerActionType:forAssets:", a3, a4);
}

- (void)_fileRadar
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "addDiagnosticProvider:", self);
  objc_msgSend(v3, "setComponent:", 35);
  objc_msgSend(v3, "setAttachmentsIncludeAnyUserAsset:", 1);
  objc_msgSend(v3, "setTitle:", CFSTR("[iOS][TTR] "));
  PXFileRadarWithConfiguration();

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  OS_dispatch_queue *ttrDiagnosticQueue;
  id v31;
  id v32;
  id v33;
  id v34;
  PUPhotoEditToolController *currentEditingTool;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  PUPhotoEditViewController *v44;
  id v45;
  __CFString *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PUPhotoEditToolController willFileDiagnostic](self->_currentEditingTool, "willFileDiagnostic");
  objc_msgSend(v5, "beginCollectionOperationWithName:timeout:", CFSTR("Edit Render Content Operation"), 5.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = MEMORY[0x1E0C809B0];
  v40 = v6;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  -[PUPhotoEditViewController photo](self, "photo");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10522, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.photo"), v16);

LABEL_7:
    v41 = 0;
    goto LABEL_8;
  }
  v11 = (void *)v10;
  objc_opt_class();
  v41 = v11;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10522, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.photo"), v38, v39);

    v11 = v41;
    v9 = MEMORY[0x1E0C809B0];
  }

  v12 = (void *)MEMORY[0x1E0CD1390];
  v51[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v9;
  v48[1] = 3221225472;
  v48[2] = __71__PUPhotoEditViewController_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  v48[3] = &unk_1E58A5138;
  v48[4] = self;
  v49 = v5;
  v50 = v6;
  objc_msgSend(v12, "px_generateResourceFilesForAssets:completionHandler:", v13, v48);

LABEL_8:
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "debugDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CompositionControllerDebugDescription"), CFSTR("EditSession"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttachmentWithText:name:", v18, v19);

  objc_msgSend(v5, "beginCollectionOperationWithName:timeout:", CFSTR("Edit Render Content Operation"), 180.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0D7CB38];
  -[PUPhotoEditViewController editSourceContentEditingInput](self, "editSourceContentEditingInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController photo](self, "photo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v22, v23, v24, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(MEMORY[0x1E0D7CB40]);
  objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setScalePolicy:", v27);

  objc_msgSend(v26, "setApplyVideoOrientationAsMetadata:", 1);
  v28 = (void *)MEMORY[0x1E0D7CB38];
  -[PUPhotoEditViewController compositionController](self, "compositionController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  ttrDiagnosticQueue = self->_ttrDiagnosticQueue;
  v42[0] = v9;
  v42[1] = 3221225472;
  v42[2] = __71__PUPhotoEditViewController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2;
  v42[3] = &unk_1E58A5160;
  v31 = v20;
  v43 = v31;
  v44 = self;
  v32 = v25;
  v45 = v32;
  v46 = CFSTR("EditSession");
  v33 = v5;
  v47 = v33;
  v34 = (id)objc_msgSend(v28, "exportCompositionController:forContentEditingOutput:settings:completionQueue:completion:", v29, v32, v26, ttrDiagnosticQueue, v42);

  currentEditingTool = self->_currentEditingTool;
  if (currentEditingTool)
    -[PUPhotoEditToolController addAttachmentsForTapToRadar:](currentEditingTool, "addAttachmentsForTapToRadar:", v33);

}

- (id)_renameFileAt:(id)a3 usingPrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v5, v10, &v17);
  v13 = v17;

  if ((v12 & 1) != 0)
  {
    v14 = v10;
  }
  else
  {
    PLPhotoEditGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Could not prefix URL: %@ - Error: %@", buf, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(id, id, uint64_t);

  v12 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetHandler"));

    if (v7)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10627, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  -[PUPhotoEditViewController photo](self, "photo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;

    if (v9)
      v12[2](v12, v9, 1);
  }
  else
  {

    v9 = 0;
  }
  v7[2](v7);

}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (PUEditableAsset)photo
{
  return self->_photo;
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PEMediaDestination)mediaDestination
{
  return self->_mediaDestination;
}

- (int64_t)initialToolType
{
  return self->_initialToolType;
}

- (void)setInitialToolType:(int64_t)a3
{
  self->_initialToolType = a3;
}

- (PUPhotoEditPendingEditsRequest)initialPendingEditsRequest
{
  return self->_initialPendingEditsRequest;
}

- (void)setInitialPendingEditsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_initialPendingEditsRequest, a3);
}

- (PUQuickCropContext)quickCropContext
{
  return self->_quickCropContext;
}

- (void)setQuickCropContext:(id)a3
{
  objc_storeStrong((id *)&self->_quickCropContext, a3);
}

- (PUPhotoEditViewControllerPresentationDelegate)presentationDelegate
{
  return (PUPhotoEditViewControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (PUPhotoEditViewControllerSessionDelegate)sessionDelegate
{
  return (PUPhotoEditViewControllerSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (PXImageLayerModulator)imageLayerModulator
{
  return self->_imageLayerModulator;
}

- (void)setImageLayerModulator:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayerModulator, a3);
}

- (PXLivePhotoViewModulator)livePhotoViewModulator
{
  return self->_livePhotoViewModulator;
}

- (void)setLivePhotoViewModulator:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoViewModulator, a3);
}

- (PXImageLayerModulator)placeholderImageLayerModulator
{
  return self->_placeholderImageLayerModulator;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 2416);
  return self;
}

- (void)setInitialSeekTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_initialSeekTime.value = *(_OWORD *)&a3->var0;
  self->_initialSeekTime.epoch = var3;
}

- (PEValuesCalculator)valuesCalculator
{
  return self->_valuesCalculator;
}

- (void)setValuesCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_valuesCalculator, a3);
}

- (PLPhotoEditRenderer)mainRenderer
{
  return self->_mainRenderer;
}

- (void)setMainRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_mainRenderer, a3);
}

- (PURedeyeToolController)redEyeController
{
  return self->_redEyeController;
}

- (void)setRedEyeController:(id)a3
{
  objc_storeStrong((id *)&self->_redEyeController, a3);
}

- (PUPhotoEditAggregateSession)aggregateSession
{
  return self->_aggregateSession;
}

- (void)_setAggregateSession:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateSession, a3);
}

- (PELivePortraitBehaviorController)livePortraitBehaviorController
{
  return self->_livePortraitBehaviorController;
}

- (void)setLivePortraitBehaviorController:(id)a3
{
  objc_storeStrong((id *)&self->_livePortraitBehaviorController, a3);
}

- (PEResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (void)setWorkImageVersion:(int64_t)a3
{
  self->_workImageVersion = a3;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PXAction)executedSessionAction
{
  return self->_executedSessionAction;
}

- (void)setExecutedSessionAction:(id)a3
{
  objc_storeStrong((id *)&self->_executedSessionAction, a3);
}

- (NUComposition)uneditedComposition
{
  return self->_uneditedComposition;
}

- (NUComposition)originalComposition
{
  return self->_originalComposition;
}

- (void)setOriginalComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2000);
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)setAdjustmentIdentifierAndVersion:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, a3);
}

- (PUPhotoEditIrisModel)photoEditIrisModel
{
  return self->_photoEditIrisModel;
}

- (void)setPhotoEditIrisModel:(id)a3
{
  objc_storeStrong((id *)&self->_photoEditIrisModel, a3);
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (void)setEditSource:(id)a3
{
  objc_storeStrong((id *)&self->_editSource, a3);
}

- (PUAVKitMediaTimelineView)videoScrubberView
{
  return self->_videoScrubberView;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (BOOL)isScrubbingVideo
{
  return self->_isScrubbingVideo;
}

- (void)setIsScrubbingVideo:(BOOL)a3
{
  self->_isScrubbingVideo = a3;
}

- (BOOL)wasPlayingBeforeBeginningToScrubVideo
{
  return self->_wasPlayingBeforeBeginningToScrubVideo;
}

- (void)setWasPlayingBeforeBeginningToScrubVideo:(BOOL)a3
{
  self->_wasPlayingBeforeBeginningToScrubVideo = a3;
}

- (NURenderContext)videoRenderContext
{
  return self->_videoRenderContext;
}

- (PHContentEditingInput)editSourceContentEditingInput
{
  return self->_editSourceContentEditingInput;
}

- (void)setEditSourceContentEditingInput:(id)a3
{
  objc_storeStrong((id *)&self->_editSourceContentEditingInput, a3);
}

- (BOOL)hasLoadedRaw
{
  return self->_hasLoadedRaw;
}

- (void)setHasLoadedRaw:(BOOL)a3
{
  self->_hasLoadedRaw = a3;
}

- (PLEditSource)originalImageEditSource
{
  return self->_originalImageEditSource;
}

- (void)setOriginalImageEditSource:(id)a3
{
  objc_storeStrong((id *)&self->_originalImageEditSource, a3);
}

- (int64_t)originalImageExifOrientation
{
  return self->_originalImageExifOrientation;
}

- (void)setOriginalImageExifOrientation:(int64_t)a3
{
  self->_originalImageExifOrientation = a3;
}

- (BOOL)isPenultimateAvailable
{
  return self->_penultimateAvailable;
}

- (void)setPenultimateAvailable:(BOOL)a3
{
  self->_penultimateAvailable = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 2440);
  return self;
}

- (BOOL)isCachingVideo
{
  return self->_isCachingVideo;
}

- (BOOL)isRunningAutoCalculators
{
  return self->_runningAutoCalculators;
}

- (BOOL)isTransitioningFromDownloadingToRunningAutoCalculators
{
  return self->_isTransitioningFromDownloadingToRunningAutoCalculators;
}

- (void)setIsTransitioningFromDownloadingToRunningAutoCalculators:(BOOL)a3
{
  self->_isTransitioningFromDownloadingToRunningAutoCalculators = a3;
}

- (BOOL)isRevertingToOriginal
{
  return self->_revertingToOriginal;
}

- (void)setRevertingToOriginal:(BOOL)a3
{
  self->_revertingToOriginal = a3;
}

- (int64_t)assetChangeDismissalState
{
  return self->_assetChangeDismissalState;
}

- (void)setAssetChangeDismissalState:(int64_t)a3
{
  self->_assetChangeDismissalState = a3;
}

- (int64_t)saveCompletionDismissalState
{
  return self->_saveCompletionDismissalState;
}

- (void)setSaveCompletionDismissalState:(int64_t)a3
{
  self->_saveCompletionDismissalState = a3;
}

- (NSTimer)assetChangeTimeoutTimer
{
  return self->_assetChangeTimeoutTimer;
}

- (void)setAssetChangeTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assetChangeTimeoutTimer, a3);
}

- (int64_t)previewRenderType
{
  return self->_previewRenderType;
}

- (BOOL)shouldBePreviewingOriginal
{
  return self->_shouldBePreviewingOriginal;
}

- (BOOL)togglingShowOriginal
{
  return self->_togglingShowOriginal;
}

- (void)setTogglingShowOriginal:(BOOL)a3
{
  self->_togglingShowOriginal = a3;
}

- (UIAlertController)cancelConfirmationAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_cancelConfirmationAlert);
}

- (void)setCancelConfirmationAlert:(id)a3
{
  objc_storeWeak((id *)&self->_cancelConfirmationAlert, a3);
}

- (UIAlertController)revertConfirmationAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_revertConfirmationAlert);
}

- (void)setRevertConfirmationAlert:(id)a3
{
  objc_storeWeak((id *)&self->_revertConfirmationAlert, a3);
}

- (UIAlertController)jpegPreviewForRawConfirmationAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_jpegPreviewForRawConfirmationAlert);
}

- (void)setJpegPreviewForRawConfirmationAlert:(id)a3
{
  objc_storeWeak((id *)&self->_jpegPreviewForRawConfirmationAlert, a3);
}

- (UIAlertController)irisRevertConfirmationAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_irisRevertConfirmationAlert);
}

- (void)setIrisRevertConfirmationAlert:(id)a3
{
  objc_storeWeak((id *)&self->_irisRevertConfirmationAlert, a3);
}

- (UIAlertController)disabledToolRevertAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_disabledToolRevertAlert);
}

- (void)setDisabledToolRevertAlert:(id)a3
{
  objc_storeWeak((id *)&self->_disabledToolRevertAlert, a3);
}

- (CGSize)lastKnownPreviewImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastKnownPreviewImageSize.width;
  height = self->_lastKnownPreviewImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)lastKnownMediaViewImageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastKnownMediaViewImageFrame.origin.x;
  y = self->_lastKnownMediaViewImageFrame.origin.y;
  width = self->_lastKnownMediaViewImageFrame.size.width;
  height = self->_lastKnownMediaViewImageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastKnownMediaViewImageFrame:(CGRect)a3
{
  self->_lastKnownMediaViewImageFrame = a3;
}

- (BOOL)burningInTrim
{
  return self->_burningInTrim;
}

- (void)setBurningInTrim:(BOOL)a3
{
  self->_burningInTrim = a3;
}

- (int64_t)mediaViewEdgeInsetsUpdateDisableCount
{
  return self->_mediaViewEdgeInsetsUpdateDisableCount;
}

- (void)setMediaViewEdgeInsetsUpdateDisableCount:(int64_t)a3
{
  self->_mediaViewEdgeInsetsUpdateDisableCount = a3;
}

- (UIPencilInteraction)pencilInteraction
{
  return self->_pencilInteraction;
}

- (void)setPencilInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteraction, a3);
}

- (PUPhotoEditPerfHUD)perfHUD
{
  return self->_perfHUD;
}

- (void)setPerfHUD:(id)a3
{
  objc_storeStrong((id *)&self->_perfHUD, a3);
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (PUPhotoSceneHUD)sceneHUD
{
  return self->_sceneHUD;
}

- (void)setSceneHUD:(id)a3
{
  objc_storeStrong((id *)&self->_sceneHUD, a3);
}

- (UIView)inEditRevertTransitionSnapshot
{
  return self->_inEditRevertTransitionSnapshot;
}

- (void)setInEditRevertTransitionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_inEditRevertTransitionSnapshot, a3);
}

- (BOOL)isFirstSinceBoot
{
  return self->_firstSinceBoot;
}

- (void)setFirstSinceBoot:(BOOL)a3
{
  self->_firstSinceBoot = a3;
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  self->_firstSinceLaunch = a3;
}

- (PXTimeInterval)enterEditTimeInterval
{
  return self->_enterEditTimeInterval;
}

- (void)setEnterEditTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_enterEditTimeInterval, a3);
}

- (PXTimeInterval)resourceCheckingInterval
{
  return self->_resourceCheckingInterval;
}

- (void)setResourceCheckingInterval:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCheckingInterval, a3);
}

- (PXTimeInterval)resourceDownloadInterval
{
  return self->_resourceDownloadInterval;
}

- (void)setResourceDownloadInterval:(id)a3
{
  objc_storeStrong((id *)&self->_resourceDownloadInterval, a3);
}

- (PXTimeInterval)resourceLoadingInterval
{
  return self->_resourceLoadingInterval;
}

- (void)setResourceLoadingInterval:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoadingInterval, a3);
}

- (PXTimeInterval)autoCalcInterval
{
  return self->_autoCalcInterval;
}

- (void)setAutoCalcInterval:(id)a3
{
  objc_storeStrong((id *)&self->_autoCalcInterval, a3);
}

- (PXTimeInterval)filterInterval
{
  return self->_filterInterval;
}

- (void)setFilterInterval:(id)a3
{
  objc_storeStrong((id *)&self->_filterInterval, a3);
}

- (PXTimeInterval)exitEditTimeInterval
{
  return self->_exitEditTimeInterval;
}

- (void)setExitEditTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_exitEditTimeInterval, a3);
}

- (PXTimeInterval)editSessionTimeInterval
{
  return self->_editSessionTimeInterval;
}

- (void)setEditSessionTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_editSessionTimeInterval, a3);
}

- (PUEnterEditPerformanceEventBuilder)enterEditEventBuilder
{
  return self->_enterEditEventBuilder;
}

- (void)setEnterEditEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_enterEditEventBuilder, a3);
}

- (PUExitEditPerformanceEventBuilder)exitEditEventBuilder
{
  return self->_exitEditEventBuilder;
}

- (void)setExitEditEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_exitEditEventBuilder, a3);
}

- (PEEditSessionEventBuilder)editSessionEventBuilder
{
  return self->_editSessionEventBuilder;
}

- (void)setEditSessionEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_editSessionEventBuilder, a3);
}

- (id)ppt_afterRenderBlock
{
  return objc_getProperty(self, a2, 2288, 1);
}

- (void)setPpt_afterRenderBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 2288);
}

- (id)ppt_afterAutoenhanceBlock
{
  return objc_getProperty(self, a2, 2296, 1);
}

- (void)setPpt_afterAutoenhanceBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 2296);
}

- (id)ppt_willBeginPlaybackBlock
{
  return objc_getProperty(self, a2, 2304, 1);
}

- (void)setPpt_willBeginPlaybackBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 2304);
}

- (id)ppt_didEndPlaybackBlock
{
  return objc_getProperty(self, a2, 2312, 1);
}

- (void)setPpt_didEndPlaybackBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 2312);
}

- (id)ppt_editIsReadyNotificationBlock
{
  return self->_ppt_editIsReadyNotificationBlock;
}

- (void)setPpt_editIsReadyNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2320);
}

- (id)ppt_exitActionCompleteNotificationBlock
{
  return self->_ppt_exitActionCompleteNotificationBlock;
}

- (void)setPpt_exitActionCompleteNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2328);
}

- (void)setCopyPresetAction:(id)a3
{
  objc_storeStrong((id *)&self->_copyPresetAction, a3);
}

- (void)setPastePresetAction:(id)a3
{
  objc_storeStrong((id *)&self->_pastePresetAction, a3);
}

- (void)setRadarAction:(id)a3
{
  objc_storeStrong((id *)&self->_radarAction, a3);
}

- (unint64_t)saveBackgroundTaskIdentifier
{
  return self->_saveBackgroundTaskIdentifier;
}

- (void)setSaveBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_saveBackgroundTaskIdentifier = a3;
}

- (NSTimer)focusViewForInteractionDelayTimer
{
  return self->_focusViewForInteractionDelayTimer;
}

- (void)setFocusViewForInteractionDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_focusViewForInteractionDelayTimer, a3);
}

- (BOOL)forceDarkUserInterfaceStyleForZoom
{
  return self->_forceDarkUserInterfaceStyleForZoom;
}

- (void)setForceDarkUserInterfaceStyleForZoom:(BOOL)a3
{
  self->_forceDarkUserInterfaceStyleForZoom = a3;
}

- (BOOL)currentToolControllerIsScrolling
{
  return self->_currentToolControllerIsScrolling;
}

- (void)setCurrentToolControllerIsScrolling:(BOOL)a3
{
  self->_currentToolControllerIsScrolling = a3;
}

- (double)secondaryToolbarShadowAlphaOverride
{
  return self->_secondaryToolbarShadowAlphaOverride;
}

- (void)setSecondaryToolbarShadowAlphaOverride:(double)a3
{
  self->_secondaryToolbarShadowAlphaOverride = a3;
}

- (PXSystemAVResourceReclamationController)avResourceReclamationController
{
  return self->_avResourceReclamationController;
}

- (PXAVResourceReclamationAssertion)avResourceReclamationAssertion
{
  return self->_avResourceReclamationAssertion;
}

- (void)setAvResourceReclamationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_avResourceReclamationAssertion, a3);
}

- (BOOL)showOriginalCausedSizeChange
{
  return self->_showOriginalCausedSizeChange;
}

- (void)setShowOriginalCausedSizeChange:(BOOL)a3
{
  self->_showOriginalCausedSizeChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avResourceReclamationAssertion, 0);
  objc_storeStrong((id *)&self->_avResourceReclamationController, 0);
  objc_storeStrong((id *)&self->_focusViewForInteractionDelayTimer, 0);
  objc_storeStrong((id *)&self->_radarAction, 0);
  objc_storeStrong((id *)&self->_pastePresetAction, 0);
  objc_storeStrong((id *)&self->_copyPresetAction, 0);
  objc_storeStrong(&self->_ppt_exitActionCompleteNotificationBlock, 0);
  objc_storeStrong(&self->_ppt_editIsReadyNotificationBlock, 0);
  objc_storeStrong(&self->_ppt_didEndPlaybackBlock, 0);
  objc_storeStrong(&self->_ppt_willBeginPlaybackBlock, 0);
  objc_storeStrong(&self->_ppt_afterAutoenhanceBlock, 0);
  objc_storeStrong(&self->_ppt_afterRenderBlock, 0);
  objc_storeStrong((id *)&self->_editSessionEventBuilder, 0);
  objc_storeStrong((id *)&self->_exitEditEventBuilder, 0);
  objc_storeStrong((id *)&self->_enterEditEventBuilder, 0);
  objc_storeStrong((id *)&self->_editSessionTimeInterval, 0);
  objc_storeStrong((id *)&self->_exitEditTimeInterval, 0);
  objc_storeStrong((id *)&self->_filterInterval, 0);
  objc_storeStrong((id *)&self->_autoCalcInterval, 0);
  objc_storeStrong((id *)&self->_resourceLoadingInterval, 0);
  objc_storeStrong((id *)&self->_resourceDownloadInterval, 0);
  objc_storeStrong((id *)&self->_resourceCheckingInterval, 0);
  objc_storeStrong((id *)&self->_enterEditTimeInterval, 0);
  objc_storeStrong((id *)&self->_inEditRevertTransitionSnapshot, 0);
  objc_storeStrong((id *)&self->_sceneHUD, 0);
  objc_storeStrong((id *)&self->_perfHUD, 0);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_destroyWeak((id *)&self->_disabledToolRevertAlert);
  objc_destroyWeak((id *)&self->_irisRevertConfirmationAlert);
  objc_destroyWeak((id *)&self->_jpegPreviewForRawConfirmationAlert);
  objc_destroyWeak((id *)&self->_revertConfirmationAlert);
  objc_destroyWeak((id *)&self->_cancelConfirmationAlert);
  objc_storeStrong((id *)&self->_assetChangeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_originalImageEditSource, 0);
  objc_storeStrong((id *)&self->_editSourceContentEditingInput, 0);
  objc_storeStrong((id *)&self->_videoRenderContext, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_videoScrubberView, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_photoEditIrisModel, 0);
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_originalComposition, 0);
  objc_storeStrong((id *)&self->_uneditedComposition, 0);
  objc_storeStrong((id *)&self->_executedSessionAction, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_livePortraitBehaviorController, 0);
  objc_storeStrong((id *)&self->_aggregateSession, 0);
  objc_storeStrong((id *)&self->_redEyeController, 0);
  objc_storeStrong((id *)&self->_mainRenderer, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_placeholderImageLayerModulator, 0);
  objc_storeStrong((id *)&self->_livePhotoViewModulator, 0);
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_quickCropContext, 0);
  objc_storeStrong((id *)&self->_initialPendingEditsRequest, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_pasteEditsEventBuilder, 0);
  objc_storeStrong((id *)&self->_smartCopyPasteQueue, 0);
  objc_storeStrong((id *)&self->_ttrDiagnosticQueue, 0);
  objc_storeStrong((id *)&self->_playbackRateOptions, 0);
  objc_storeStrong((id *)&self->_toolControllerTagsByKeyCommandNumber, 0);
  objc_storeStrong((id *)&self->_addedKeyCommands, 0);
  objc_storeStrong((id *)&self->_askToSaveAsNewClipMenu, 0);
  objc_storeStrong((id *)&self->_assetsWaitingForLibraryNotification, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_pptState, 0);
  objc_storeStrong((id *)&self->_audioToolController, 0);
  objc_storeStrong((id *)&self->_photoStylesToolController, 0);
  objc_storeStrong((id *)&self->_portraitToolController, 0);
  objc_storeStrong((id *)&self->_mediaToolController, 0);
  objc_storeStrong((id *)&self->_adjustmentsController, 0);
  objc_storeStrong((id *)&self->_filtersController, 0);
  objc_storeStrong((id *)&self->_cropController, 0);
  objc_storeStrong((id *)&self->_progressEventBlockingView, 0);
  objc_storeStrong((id *)&self->_saveProgressTimer, 0);
  objc_storeStrong(&self->_progressIndicatorInteractionDisablingToken, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_assetTypeBadge, 0);
  objc_storeStrong((id *)&self->_swipeDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_togglePreviewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transientStatusBadge, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_autoEnhanceController, 0);
  objc_storeStrong((id *)&self->_pluginSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginFullSizeImageSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_pluginFullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_stashedSnapshot, 0);
  objc_storeStrong((id *)&self->_pluginSession, 0);
  objc_storeStrong((id *)&self->_showOriginalButton, 0);
  objc_storeStrong((id *)&self->_zoomButton, 0);
  objc_storeStrong((id *)&self->_semStylesDebugButton, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_redEyeButton, 0);
  objc_storeStrong((id *)&self->_markupButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_secondaryCenterView, 0);
  objc_storeStrong((id *)&self->_secondaryTrailingViews, 0);
  objc_storeStrong((id *)&self->_secondaryLeadingViews, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarShadow, 0);
  objc_storeStrong((id *)&self->_mainToolbarShadow, 0);
  objc_storeStrong((id *)&self->_toolPickerController, 0);
  objc_storeStrong((id *)&self->_edit1upToggleButton, 0);
  objc_storeStrong((id *)&self->_mainActionButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_notchButtons, 0);
  objc_storeStrong((id *)&self->_toolTagLabelMap, 0);
  objc_storeStrong((id *)&self->_coreToolButtonViews, 0);
  objc_storeStrong((id *)&self->_coreToolButtons, 0);
  objc_storeStrong((id *)&self->_secondaryToolbar, 0);
  objc_storeStrong((id *)&self->_mainToolbar, 0);
  objc_storeStrong((id *)&self->_imageFrameLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_imageFrameLayoutGuide, 0);
  objc_storeStrong((id *)&self->_actionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_mediaViewConstraints, 0);
  objc_storeStrong((id *)&self->_progressEventBlockingViewConstraints, 0);
  objc_storeStrong((id *)&self->_progressIndicatorViewConstraints, 0);
  objc_storeStrong((id *)&self->_assetTypeBadgeConstraints, 0);
  objc_storeStrong((id *)&self->_transientStatusBadgeConstraints, 0);
  objc_storeStrong((id *)&self->_placeholderImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_currentToolViewConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarConstraints, 0);
  objc_storeStrong((id *)&self->_mainToolbarConstraints, 0);
  objc_storeStrong((id *)&self->_renderImageClient, 0);
  objc_storeStrong(&self->_videoScrubberTimeObserver, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_currentTool, 0);
  objc_storeStrong((id *)&self->_previousEditingTool, 0);
  objc_storeStrong((id *)&self->_currentEditingTool, 0);
  objc_storeStrong((id *)&self->__allTools, 0);
}

void __71__PUPhotoEditViewController_collectTapToRadarDiagnosticsIntoContainer___block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(a1[4], "_renameFileAt:usingPrefix:", v8, CFSTR("EntryAsset"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = v9;
        else
          v10 = v8;
        objc_msgSend(a1[5], "addAttachment:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  objc_msgSend(a1[6], "endWithSuccess:error:", 1, 0);

}

void __71__PUPhotoEditViewController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "renderedContentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_renameFileAt:usingPrefix:", v7, *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 64);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 64), "addAttachment:", v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "renderedContentURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttachment:", v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "photo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isLivePhoto"))
    {
      objc_msgSend(*(id *)(a1 + 48), "renderedVideoComplementContentURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 32), "endWithSuccess:error:", 1, 0);

        goto LABEL_15;
      }
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "renderedVideoComplementContentURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_renameFileAt:usingPrefix:", v15, *(_QWORD *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(void **)(a1 + 64);
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 64), "addAttachment:", v12);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "renderedVideoComplementContentURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAttachment:", v17);

        v12 = 0;
      }
    }

    goto LABEL_14;
  }
  PLPhotoEditGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "[collectTapToRadarDiagnosticsIntoContainer] Could not get result for exportCompositionController - Error: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "endWithSuccess:error:", 0, v5);
LABEL_15:

}

void __40__PUPhotoEditViewController__pasteEdits__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CB48]), "initWithPasteablePreset:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD **)(a1 + 40);
  v4 = (void *)v3[222];
  objc_msgSend(v3, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerAction:forAssets:", v2, v6);

  objc_msgSend(*(id *)(a1 + 40), "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(*(id *)(a1 + 40), "_willModifyAdjustment");
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "photo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "editSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke_2;
  v13[3] = &unk_1E58A5110;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 40);
  v14 = v11;
  v15 = v12;
  objc_msgSend(v2, "applyToCompositionController:asset:editSource:completion:", v11, v9, v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __40__PUPhotoEditViewController__pasteEdits__block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;

  if (a2 == 1)
  {
    v2 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    PULocalizedString(CFSTR("PHOTOEDIT_PASTE_ADJUST"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_didModifyAdjustmentWithLocalizedName:", v4);

    return objc_msgSend(*(id *)(v2 + 32), "_sendPasteEditsAnalytics");
  }
  return result;
}

void __40__PUPhotoEditViewController__pasteEdits__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8[2];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke_3;
  v5[3] = &unk_1E58A6AC0;
  v8[1] = a2;
  objc_copyWeak(v8, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(v8);
}

uint64_t __40__PUPhotoEditViewController__pasteEdits__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  if (*(_QWORD *)(result + 56) == 1)
  {
    v1 = result;
    v2 = (id *)(result + 48);
    WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    objc_msgSend(WeakRetained, "compositionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applyChangesFromCompositionController:", *(_QWORD *)(v1 + 32));

    v5 = objc_loadWeakRetained(v2);
    PULocalizedString(CFSTR("PHOTOEDIT_PASTE_ADJUST"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didModifyAdjustmentWithLocalizedName:", v6);

    return objc_msgSend(*(id *)(v1 + 40), "_sendPasteEditsAnalytics");
  }
  return result;
}

void __40__PUPhotoEditViewController_radarAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fileRadar");

}

uint64_t __40__PUPhotoEditViewController_radarAction__block_invoke()
{
  return 1;
}

uint64_t __46__PUPhotoEditViewController_pastePresetAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_canPasteEdits");

  return v2;
}

void __46__PUPhotoEditViewController_pastePresetAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pasteEdits");

}

uint64_t __45__PUPhotoEditViewController_copyPresetAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_canCopyEdits");

  return v2;
}

void __45__PUPhotoEditViewController_copyPresetAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_copyEditsSkippingOptions:", 0);

}

void __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSaveAction:", 0);

}

void __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSaveAction:", 2);

}

uint64_t __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(v3, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2319);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Failed to load video: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_870(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "videoAsset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  if (*(_BYTE *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_3;
    block[3] = &unk_1E58AB790;
    v3 = *(id *)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "PISmartToneAdjustmentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_4;
  v4[3] = &unk_1E58A4770;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v3, v4);

}

uint64_t __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAdjustmentSmartToneStatistics:withAccuracy:", a2, 0);
}

void __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "statistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("lightMap"));
  objc_msgSend(v2, "setStatistics:", v4);

}

intptr_t __70__PUPhotoEditViewController_ppt_selectLightingEffect_completionBlock___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __67__PUPhotoEditViewController_ppt_navigateToPortraitLightingEffects___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "setToolSelection:animated:", 1, 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__PUPhotoEditViewController_ppt_scrollSliderNamed_value_completion___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id *WeakRetained;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[201], "ppt_visibleScaleValueForSelectedSlider");
  v4 = llround(v3);
  objc_msgSend(WeakRetained[201], "ppt_valueIncrementForSelectedSlider");
  v6 = (uint64_t)((double)(uint64_t)((int)objc_msgSend(*(id *)(a1 + 32), "intValue") - v4) / v5);
  if (v6 < 1)
  {
    if (v6 < 0)
    {
      v8 = 0;
      do
      {
        v9 = objc_loadWeakRetained(v2);
        objc_msgSend(v9, "_handleSliderValueDecrease:", 0);

        --v8;
      }
      while (v8 > v6);
    }
  }
  else
  {
    do
    {
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "_handleSliderValueIncrease:", 0);

      --v6;
    }
    while (v6);
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

void __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke_2;
  v2[3] = &unk_1E58ABAC8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "groupNotifyOnQueue:withBlock:", MEMORY[0x1E0C80D38], v2);

}

uint64_t __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__PUPhotoEditViewController__ppt_conditionallyExecuteAfterRender__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1664), "hasRendered");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 1;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__63616;
  v30[4] = __Block_byref_object_dispose__63617;
  v31 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "adjustments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        objc_msgSend(*(id *)(a1 + 32), "valuesCalculator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 32);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_2;
        v22[3] = &unk_1E58A4FC8;
        v24 = v32;
        v25 = v30;
        v23 = v2;
        objc_msgSend(v7, "applyToCompositionController:valuesCalculator:asset:livePortraitBehaviorDelegate:completionHandler:", v15, v8, v9, v10, v22);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_3;
  block[3] = &unk_1E58A4FF0;
  v11 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v17 = v15;
  v18 = v14;
  v19 = v11;
  v20 = v32;
  v21 = v30;
  v12 = v14;
  v13 = v15;
  dispatch_group_notify(v2, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_5;
  block[3] = &unk_1E58ABAC8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  if ((a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    if (v6)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "undoManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(v3, "isUndoing") & 1) == 0 && (objc_msgSend(v3, "isRedoing") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B358]), "initWithCompositionController:sourceComposition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "setLocalizedActionName:", CFSTR("Edit Intent"));
    objc_msgSend(v2, "registerWithUndoManager:", v3);

  }
  objc_msgSend(*(id *)(a1 + 56), "finishedWithSuccess:error:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

uint64_t __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_hideEphemeralViews:", 0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1456), "bounds");
    objc_msgSend(*(id *)(a1 + 40), "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1456), "addSubview:", *(_QWORD *)(a1 + 40));
  }
  +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __89__PUPhotoEditViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setSnapshotView:", v3);
  objc_msgSend(*(id *)(a1 + 40), "photo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsset:", v4);

  objc_msgSend(v5, "setAllowAutoPlay:", objc_msgSend(*(id *)(a1 + 40), "isLoopingVideo"));
}

void __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  BOOL v5;
  void *v6;
  _QWORD block[5];
  id v8;
  BOOL v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1820]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "baseVersion") == 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E58A8FD8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPenultimateAvailable:", *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v5 = a2;
  v6 = a3;
  v7 = (unint64_t)v5;
  v8 = (void *)v7;
  if (v7 | v6)
  {
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)v7;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD1D80], -1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1832);
LABEL_6:
  objc_storeStrong((id *)(v9 + 1832), v10);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1585) = 1;
  v11 = *(id **)(a1 + 32);
  if (v11[124])
  {
    objc_msgSend(v11[124], "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "removeFromParentViewController");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 976);
    *(_QWORD *)(v13 + 976) = 0;

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 992);
    *(_QWORD *)(v15 + 992) = 0;

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 1592);
    *(_QWORD *)(v17 + 1592) = 0;

    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 1600);
    *(_QWORD *)(v19 + 1600) = 0;

    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 1608);
    *(_QWORD *)(v21 + 1608) = 0;

    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 1624);
    *(_QWORD *)(v23 + 1624) = 0;

    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 1648);
    *(_QWORD *)(v25 + 1648) = 0;

    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 1616);
    *(_QWORD *)(v27 + 1616) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1704) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1640) = 0;
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(v29 + 1632);
    *(_QWORD *)(v29 + 1632) = 0;

    v11 = *(id **)(a1 + 32);
  }
  objc_msgSend(v11, "_resetModelAndBaseImagesToWorkImageVersion:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_loadPhotoEditResourcesIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(void **)(v33 + 1432);
  *(_QWORD *)(v33 + 1432) = v32;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "removeAllActions");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2;
  v38[3] = &unk_1E58AB968;
  v35 = *(void **)(a1 + 32);
  v36 = *(id *)(a1 + 40);
  v39 = (id)v6;
  v40 = v36;
  v37 = (id)v6;
  objc_msgSend(v35, "_updatePenultimateAvailableWithCompletionHandler:", v38);

}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_4(id *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD aBlock[5];
  id v21;
  id v22;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_5;
  aBlock[3] = &unk_1E58A4F00;
  v3 = a1[5];
  aBlock[4] = a1[4];
  v21 = v3;
  v22 = a1[6];
  v4 = _Block_copy(aBlock);
  v5 = a1[4];
  v6 = v5[175];
  switch(v6)
  {
    case 2:
      objc_msgSend(a1[4], "editSourceContentEditingInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "compositionController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v5, "_newOutputForContentEditingInput:compositionController:", v7, v8);

      objc_msgSend(a1[4], "mediaDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "photo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "compositionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(a1[4], "workImageVersion");
      objc_msgSend(a1[4], "photoEditIrisModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "editingVisibility");
      v16[0] = v2;
      v16[1] = 3221225472;
      v16[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_6;
      v16[3] = &unk_1E58A4F28;
      v18 = a1[6];
      v17 = a1[5];
      v19 = v4;
      objc_msgSend(v10, "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v11, v12, v9, v13, v15, v16);

      break;
    case 1:
      objc_msgSend(a1[5], "setBaseVersion:", 2);
      (*((void (**)(void *, uint64_t))v4 + 2))(v4, 3);
      break;
    case 0:
      objc_msgSend(a1[5], "setBaseVersion:", *((unsigned __int8 *)v5 + 1440));
      (*((void (**)(void *, uint64_t))v4 + 2))(v4, 2);
      break;
  }

}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1408), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaDestination");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveEditsForAsset:usingContentEditingOutput:livePhotoState:completionHandler:", v2, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));

}

uint64_t __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setBaseVersion:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 100000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E58AB968;
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);

}

uint64_t __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, __int128 *);
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *))(v2 + 16);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  return v3(v2, a2, &v5);
}

void __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 13, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PluginFullSize.mov"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

  objc_msgSend(*(id *)(a1 + 32), "mainRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C89E28];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_3;
  v12[3] = &unk_1E58A4EB0;
  v13 = v6;
  v15 = *(_OWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  v14 = *(id *)(a1 + 40);
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "exportVideoToURL:preset:livePhotoPairingIdentifier:completion:", v10, v9, 0, v12);

}

uint64_t __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_3(uint64_t a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, id, __int128 *);
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (a2)
  {
    v3 = *(id *)(a1 + 32);
    v9 = *(_OWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    v3 = 0;
    v9 = *MEMORY[0x1E0CA2E18];
    v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v10 = v4;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, __int128 *))(v5 + 16);
  v7 = v9;
  v8 = v10;
  v6(v5, v3, &v7);

}

uint64_t __71__PUPhotoEditViewController_editPluginSession_loadVideoURLWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416))
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 13, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PluginFullSize.jpg"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PLGetSandboxExtensionToken();
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1416);
    *(_QWORD *)(v8 + 1416) = v7;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 1424);
    *(_QWORD *)(v10 + 1424) = v6;

  }
  v12 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v12, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416), 0);

  objc_msgSend(v13, "writeToURL:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416), 1073741825, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_779(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasLoadedRaw");
}

BOOL __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adjustmentType") == 1;
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "fullSizeImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullSizeImageOrientation");
  _UIImageOrientationForEXIFOrientation();
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v7;
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "received PHContentEditingInput for plugin full-size request; url: %@ - info: %@",
      buf,
      0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1440) = objc_msgSend(v5, "baseVersion") == 1;
  objc_msgSend(*(id *)(a1 + 32), "photo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "photo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      && ((objc_msgSend(v10, "isOriginalRaw") & 1) != 0 || objc_msgSend(v10, "originalResourceChoice") == 1)
      && (objc_msgSend(*(id *)(a1 + 32), "isPenultimateAvailable") & 1) == 0
      && objc_msgSend(v5, "baseVersion") != 1)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
      objc_msgSend(v11, "setLoadingMode:", 0x10000);
      objc_msgSend(v11, "setDeliveryMode:", 1);
      objc_msgSend(v11, "setVersion:", 2);
      objc_msgSend(v11, "setNetworkAccessAllowed:", 1);
      objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_781;
      v29[3] = &unk_1E58A4DE8;
      v30 = v7;
      v31 = *(id *)(a1 + 40);
      objc_msgSend(v12, "requestImagePropertiesForAsset:options:resultHandler:", v10, v11, v29);

      goto LABEL_20;
    }
  }
  else
  {

    v10 = 0;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CD1C10]);
  v13 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v13;
  if (v7 && !v13)
  {
    v25 = v10;
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetsdClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resourceClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "photo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v20 = objc_msgSend(v16, "sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:", v19, &v28, &v27);
    v21 = v28;
    v22 = v27;

    objc_msgSend(v21, "objectForKey:", v17);
    v23 = objc_claimAutoreleasedReturnValue();
    v11 = (id)v23;
    if (!v20 || !v23)
    {
      PLPhotoEditGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v22;
        _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_ERROR, "Error getting sandbox extension token for resource: %@", buf, 0xCu);
      }

    }
    v10 = v25;
    v6 = v26;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_20:

}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_788(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  const __CFString *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD1C18];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD1C08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "integerValue");

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD1C10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD1BE8]);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  PLPhotoEditGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = 1;
  else
    v12 = v6 == 0;
  if (v12)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v13 = CFSTR("(no error received, but no image URL provided)");
    if (v9)
      v13 = v9;
    *(_DWORD *)buf = 138412290;
    v34 = v13;
    v14 = "Error requesting fullsize render image for plugin: %@";
    v15 = v11;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "Received fullsize image for asset";
    v15 = v11;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 2;
  }
  _os_log_impl(&dword_1AAB61000, v15, v16, v14, buf, v17);
LABEL_13:

  if (v6)
    v19 = v8 == 0;
  else
    v19 = 0;
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "assetsdClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resourceClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "photo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = 0;
    v26 = objc_msgSend(v22, "sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:", v25, &v32, &v31);
    v27 = v32;
    v28 = (__CFString *)v31;

    objc_msgSend(v27, "objectForKey:", v23);
    v29 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v29;
    if (!v26 || !v29)
    {
      PLPhotoEditGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v28;
        _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_ERROR, "Error getting sandbox extension token for resource: %@", buf, 0xCu);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_791(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (!v3)
  {
    PLPhotoEditGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "Renderer returned no image data when full-size render requested by plugin", v5, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_781(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  int v17;
  uint8_t buf[16];

  v4 = a3;
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "rendering raw image to a jpeg for plugin full-size request", buf, 2u);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "integerValue");
  v8 = PLExifOrientationFromImageOrientation();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71998]), "initWithURL:type:image:useEmbeddedPreview:", *(_QWORD *)(a1 + 32), v6, 0, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71990]), "initWithEditSource:", v9);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0D71660], "newIdentityCompositionController");
  v12 = MEMORY[0x1E0C809B0];
  v13 = *MEMORY[0x1E0D71390];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_783;
  v16[3] = &__block_descriptor_36_e43_v16__0__PIOrientationAdjustmentController_8l;
  v17 = v8;
  objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v13, v16);
  objc_msgSend(v10, "setCompositionController:", v11);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2_785;
  v14[3] = &unk_1E58A4DC0;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v10, "generateJPEGImageDataWithCompressionQuality:livePhotoPairingIdentifier:completionHandler:", 0, v14, 0.899999976);

}

uint64_t __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_783(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:", *(unsigned int *)(a1 + 32));
}

uint64_t __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2_785(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PUPhotoEditViewController_editPluginSession_loadThumbnailImageWithSize_loadHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[PUPhotoEditViewController editPluginSession:loadThumbnailImageWithSize:loadHandler:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "%s: Error fetching thumbnail image data: %@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __79__PUPhotoEditViewController_editPluginSession_loadPlaceholderImageWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__PUPhotoEditViewController_editPluginSession_loadAdjustmentDataWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1820]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1072));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1456);
  *(_QWORD *)(v2 + 1456) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 1072);
  *(_QWORD *)(v4 + 1072) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1464) = 0;
  objc_msgSend(*(id *)(a1 + 40), "px_imageModulationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "placeholderImageLayerModulator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInImageLayerModulator:", v7);

  objc_msgSend(*(id *)(a1 + 40), "initialPendingEditsRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "fulfillPendingEditsRequest:", v8);
    v8 = v9;
  }

}

void __62__PUPhotoEditViewController__handleMediaViewReady_statistics___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removePlaceholderImageViewIfNeeded");

}

uint64_t __72__PUPhotoEditViewController_mediaViewDidFinishRendering_withStatistics___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isInEditRevertTransitionSnapshotVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_uninstallInEditRevertTransitionSnapshotAnimated:", 1);
  return result;
}

void __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[6];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    objc_msgSend(v3, "auxiliaryImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cgImageRef");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke_2;
    block[3] = &unk_1E58AACF0;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2319);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Could not load gain image: %@", buf, 0xCu);
    }
  }

}

void __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1592), "setGainMapImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1592), "setGainMapValue:");
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

uint64_t __65__PUPhotoEditViewController_toolController_didChangeIsScrolling___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setAlpha:", *(double *)(a1 + 40));
}

void __88__PUPhotoEditViewController_toolController_didChangePreferredPreviewViewInsetsAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setNeedsLayout");

  }
}

void __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "videoScrubberView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", v2);

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v4 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "playPauseButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", v4);

  }
}

void __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateVideoScrubber");

}

void __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "playbackState") == 3)
    objc_msgSend(v3, "pause");
  else
    objc_msgSend(v3, "play");

}

uint64_t __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_mediaViewEdgeInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "_transitionToInsets:duration:animationCurve:updateRenderContent:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateSubviewsOrdering");
  objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundColor");
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

void __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1000) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_updateSubviewsOrdering");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");
  }
  objc_msgSend(*(id *)(a1 + 32), "photoEditIrisModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoresUpdates:", 0);

}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  _QWORD aBlock[5];
  id v24;
  id v25;

  if (objc_msgSend(*(id *)(a1 + 32), "suppressesEditUpdates"))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "loopsVideoPlayback") & 1) != 0
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "player"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v3 = objc_msgSend(v2, "playbackState"),
          v2,
          v3 == 3))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "_stopVideoPlayback");
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 984), *(id *)(*(_QWORD *)(a1 + 40) + 976));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = *(void **)(a1 + 48);
  else
    v4 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 976), v4);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 992), *(id *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v5 + 1064))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1064);
    *(_QWORD *)(v6 + 1064) = 0;

    objc_msgSend(*(id *)(a1 + 40), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    v5 = *(_QWORD *)(a1 + 40);
  }
  *(_BYTE *)(v5 + 1000) = *(_BYTE *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 56), "willResignActiveTool");
  objc_msgSend(*(id *)(a1 + 40), "_defaultRenderPipelineFiltersForCurrentMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "willBecomeActiveTool");
  objc_msgSend(*(id *)(a1 + 32), "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E58AB790;
  aBlock[4] = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v24 = v13;
  v25 = *(id *)(a1 + 32);
  v14 = _Block_copy(aBlock);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_4;
  v17[3] = &unk_1E58A4C40;
  v22 = *(_BYTE *)(a1 + 80);
  v17[4] = *(_QWORD *)(a1 + 40);
  v18 = v13;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 72);
  v15 = v13;
  v16 = _Block_copy(v17);
  objc_msgSend(*(id *)(a1 + 40), "_transitionToNewToolViewController:oldToolViewController:animationBlock:completion:animated:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), v14, v16, *(unsigned __int8 *)(a1 + 80));

}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "_setPipelineFilters:shouldUpdateContent:", *(_QWORD *)(a1 + 40), 0);
  if ((objc_msgSend(*(id *)(a1 + 48), "wantsZoomAndPanEnabled") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setZoomScaleToFit");
  objc_msgSend(*(id *)(a1 + 32), "_updateToolbarShadowAlpha");
  return objc_msgSend(*(id *)(a1 + 48), "updateForIncomingAnimation");
}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (!*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setPipelineFilters:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "videoScrubberView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateVideoScrubber");
  objc_msgSend(*(id *)(a1 + 48), "didResignActiveTool");
  objc_msgSend(*(id *)(a1 + 56), "didBecomeActiveTool");
  objc_msgSend(*(id *)(a1 + 56), "setBackdropViewGroupName:", CFSTR("PUPhotoEditToolbarGroupName"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToEditingTool:animated:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "beginInterval");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setWillLoadFilterThumbnails:", 0);

  v3 = *(id *)(a1 + 40);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "EnterEditFilterThumbnails", " enableTelemetry=YES ", v6, 2u);
  }

}

void __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke_747(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "endInterval");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setDidFinishLoadingFilterThumbnails:", 0);

  v3 = *(id *)(a1 + 40);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_END, v5, "EnterEditFilterThumbnails", " enableTelemetry=YES ", v6, 2u);
  }

}

uint64_t __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  id v12;
  uint8_t buf[16];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    objc_msgSend(v3, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    memset(buf, 0, sizeof(buf));
    v14 = 0;
    objc_msgSend(v3, "photoTime");
    v7 = objc_alloc(MEMORY[0x1E0CD1608]);
    v10 = *(_OWORD *)buf;
    v11 = v14;
    v8 = (void *)objc_msgSend(v7, "initWithImage:uiOrientation:videoAsset:photoTime:asset:options:videoComposition:", 0, 0, v5, &v10, 0, 1, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2319);
    v9 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Failed to load LivePhoto: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __68__PUPhotoEditViewController__restoreSnapshot_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_resetModelAndBaseImagesToWorkImageVersion:", 1);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

uint64_t __67__PUPhotoEditViewController_mediaDestination_willBeginSaveRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLPhotoEditGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Background task expired: canceling save operation!", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "cancelSaveOperation");
}

void __62__PUPhotoEditViewController_initialCinematographyLoadComplete__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "compositionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "portraitVideoAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromAdjustment:", v5);

}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_INFO, "precomputeImageValuesWithCompletion finished", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_703;
  block[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_712(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2;
  block[3] = &unk_1E58A92B0;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v11[1] = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_716(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_chooseInitialEditingTool");

}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2_719(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[6];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v11 = 0;
  objc_msgSend(v3, "result:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v5)
  {
    objc_msgSend(v5, "auxiliaryImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cgImageRef");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_3;
    block[3] = &unk_1E58AACF0;
    block[4] = WeakRetained;
    block[5] = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2319);
    v9 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Could not load gain image: %@", buf, 0xCu);
    }
  }

}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setGainMapImage:", *(_QWORD *)(a1 + 40));
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v23 = 0;
  objc_msgSend(v3, "result:", &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;
  if (v4)
  {
    objc_msgSend(v4, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "photo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "photo");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 64);
        v22 = *(_QWORD *)(a1 + 40);
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v18, v22, CFSTR("PUPhotoEditViewController.m"), 6619, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("strongSelf.photo"), v11);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 64);
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject px_descriptionForAssertionMessage](v8, "px_descriptionForAssertionMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v21, v20, CFSTR("PUPhotoEditViewController.m"), 6619, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("strongSelf.photo"), v11, v12);

LABEL_15:
      }
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(v6, "rawProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = 1;
    else
      v14 = -[NSObject RAWBadgeAttributes](v8, "RAWBadgeAttributes") != 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1520) = v14;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1521) = -[NSObject isProRes](v8, "isProRes");
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(v15 + 1680);
    *(_QWORD *)(v15 + 1680) = v6;
    v17 = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1448), "setImageProperties:", v17);
    goto LABEL_13;
  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "NUImagePropertiesClient for raw property returned error %@", buf, 0xCu);
  }
LABEL_13:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_703(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  int v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "valuesCalculator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "portraitValuesWithAccuracy:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D71358]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PECanRenderPortrait();
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1704) = v7;
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1704))
      v9 = CFSTR("Y");
    else
      v9 = CFSTR("N");
    v30 = 138412290;
    v31 = v9;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "has depth? %@", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend(WeakRetained, "valuesCalculator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "semanticStyleStatistics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if ((PISemanticStyleIsRenderSupported() & 1) != 0)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1640) = objc_msgSend(v13, "enableSemanticStyleInEdit");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1640) = 0;
  }
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "allowDisabledTools");

  v16 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v15)
  {
    if (!*(_BYTE *)(v16 + 1640) || v12)
    {
      if (v12)
        v18 = objc_msgSend(WeakRetained, "_isLivePhotoEffect") ^ 1;
      else
        LOBYTE(v18) = 0;
    }
    else
    {
      v17 = objc_msgSend(WeakRetained, "isOriginalStyleable");
      LOBYTE(v18) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1640) = v17;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1641) = v18;
  }
  else
  {
    v19 = 0;
    if (*(_BYTE *)(v16 + 1640) && v12)
    {
      v19 = objc_msgSend(WeakRetained, "_isLivePhotoEffect") ^ 1;
      v16 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v16 + 1640) = v19;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1641) = 1;
  }
  objc_msgSend(WeakRetained, "_updateToolbarsAnimated:", 1);
  objc_msgSend(WeakRetained, "setRunningAutoCalculators:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1790) = 0;
  objc_msgSend(WeakRetained, "updateProgressIndicatorAnimated:", 1);
  objc_msgSend(WeakRetained, "editSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "mediaType");
  if (v21 == 3
    || (objc_msgSend(WeakRetained, "editSource"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "mediaType") == 1))
  {
    objc_msgSend(WeakRetained, "photo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isLivePhotoVisibilityAdjustmentAllowed");

    if (v21 == 3)
      goto LABEL_30;
  }
  else
  {
    v23 = 0;
  }

LABEL_30:
  if (v5 || (_DWORD)v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0D7CAE8]);
    objc_msgSend(WeakRetained, "photo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithAsset:delegate:hasDepth:hasLive:", v25, WeakRetained, v5 != 0, v23);
    objc_msgSend(WeakRetained, "setLivePortraitBehaviorController:", v26);

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "changeLightingDisablesLive");
    objc_msgSend(WeakRetained, "livePortraitBehaviorController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setChangingPortraitLightingDisablesLive:", v28);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __78__PUPhotoEditViewController_resourceLoader_request_mediaLoadDidFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didFinishWithChanges:", 0);

}

uint64_t __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", a2, 1, 0);
  return 1;
}

void __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke_2(id *a1, int a2)
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  id v6;
  id v7;

  if (a2)
  {
    objc_msgSend(a1[5], "adjustmentIdentifierAndVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setAdjustmentIdentifierAndVersion:", v3);

    v4 = objc_msgSend(a1[6], "version");
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    v6 = a1[5];
    v7 = WeakRetained;
    if (v4 == 1)
      objc_msgSend(WeakRetained, "_handleDidLoadOriginalWithResult:", v6);
    else
      objc_msgSend(WeakRetained, "_handleDidLoadAdjustmentsAndBaseImageWithResult:", v6);
  }
  else
  {
    v7 = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(v7, "didFinishWithChanges:", 0);
  }

}

_QWORD *__55__PUPhotoEditViewController__startShowingOriginalBadge__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == result[187])
    return (_QWORD *)objc_msgSend(result, "setShouldBePreviewingOriginal:", 0);
  return result;
}

void __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "inEditRevertTransitionSnapshot");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "inEditRevertTransitionSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setInEditRevertTransitionSnapshot:", 0);
}

uint64_t __67__PUPhotoEditViewController__installInEditRevertTransitionSnapshot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_uninstallInEditRevertTransitionSnapshotAnimated:", 1);
}

void __64__PUPhotoEditViewController__performInEditRevertWithToolButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1832), a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1585) = 1;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 992);
    if (v9)
    {
      objc_msgSend(v9, "willMoveToParentViewController:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "removeFromParentViewController");
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 976);
      *(_QWORD *)(v11 + 976) = 0;

      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 992);
      *(_QWORD *)(v13 + 992) = 0;

      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 1592);
      *(_QWORD *)(v15 + 1592) = 0;

      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 1600);
      *(_QWORD *)(v17 + 1600) = 0;

      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 1608);
      *(_QWORD *)(v19 + 1608) = 0;

      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 1624);
      *(_QWORD *)(v21 + 1624) = 0;

      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 1616);
      *(_QWORD *)(v23 + 1616) = 0;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1704) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1640) = 0;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(void **)(v25 + 1632);
      *(_QWORD *)(v25 + 1632) = 0;

      v8 = *(_QWORD *)(a1 + 32);
    }
    v27 = *(void **)(v8 + 1408);
    *(_QWORD *)(v8 + 1408) = 0;

    objc_msgSend(*(id *)(a1 + 32), "setInitialToolType:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_resetModelAndBaseImagesToWorkImageVersion:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_installInEditRevertTransitionSnapshot");
    objc_msgSend(*(id *)(a1 + 32), "_loadPhotoEditResourcesIfNeeded");
  }
  else
  {
    PLUIGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_ERROR, "error reverting to original: %@", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "isStandardVideo"))
      v29 = CFSTR("VIDEOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE");
    else
      v29 = CFSTR("PHOTOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE");
    PULocalizedString(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[Internal Only] %@"), v30, v7);
      v31 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v31;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v30, 0, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "addAction:", v35);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v32, 1, 0);

  }
}

uint64_t __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__PUPhotoEditViewController__setPlaybackEnabled___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_performRevertAction");
  return result;
}

uint64_t __50__PUPhotoEditViewController_toggleLivePhotoActive__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_performRevertAction");
  return result;
}

uint64_t __57__PUPhotoEditViewController_applyAutoEnhance_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  id v8;
  uint64_t result;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateProgressIndicatorAnimated:", 1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "ppt_afterAutoenhanceBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "ppt_afterAutoenhanceBlock");
    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "setPpt_afterAutoenhanceBlock:", 0);

    v7[2](v7);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__PUPhotoEditViewController__internalActionsSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fileRadar");

}

void __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentMarkup");

}

void __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentExtensions");

}

void __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPreferredAppearance:", 0);

}

void __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPreferredAppearance:", 1);

}

void __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPreferredAppearance:", 2);

}

void __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_copyEditsSkippingOptions:", 0);

}

void __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pasteEdits");

}

void __52__PUPhotoEditViewController__saveAsDuplicateSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSaveAction:", 1);

}

uint64_t __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "undo");
}

uint64_t __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "redo");
}

void __44__PUPhotoEditViewController__moreButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_produceMoreButtonMenuElementsWithCompletion:", v3);

}

uint64_t __73__PUPhotoEditViewController__notifyDelegateSaveFinishedIfReadyWithAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishWithAsset:savedChanges:", *(_QWORD *)(a1 + 40), 1);
}

void __65__PUPhotoEditViewController__startMonitoringSaveProgressIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSaveProgress");

}

void __61__PUPhotoEditViewController__startTimeoutTimerForAssetChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timeoutWaitingForAssetChange");

}

void __50__PUPhotoEditViewController__performDiscardAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  int8x16_t v13;
  _QWORD block[4];
  int8x16_t v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_EVENT, v9, "ExitEditCancelAction", "Restoring with stashed snapshot", buf, 2u);
  }

  if (v6)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "error restoring snapshot: %@", buf, 0xCu);
    }

  }
  v11 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUPhotoEditViewController__performDiscardAction__block_invoke_632;
  block[3] = &unk_1E58A9DF0;
  v13 = *(int8x16_t *)(a1 + 32);
  v12 = (id)v13.i64[0];
  v15 = vextq_s8(v13, v13, 8uLL);
  v16 = *(_QWORD *)(a1 + 48);
  dispatch_after(v11, MEMORY[0x1E0C80D38], block);

}

uint64_t __50__PUPhotoEditViewController__performDiscardAction__block_invoke_632(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "didFinishWithChanges:", 0);
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ExitEditCancelAction", " enableTelemetry=YES ", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_didEndExitActionWithSessionKeys:", 0);
}

void __49__PUPhotoEditViewController__performRevertAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[2];
  id location[2];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke_621;
    aBlock[3] = &unk_1E58A49D8;
    objc_copyWeak(v34, location);
    v30 = *(id *)(a1 + 40);
    v8 = v5;
    v31 = v8;
    v32 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(void **)(a1 + 64);
    v33 = v9;
    v34[1] = v10;
    v11 = _Block_copy(aBlock);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1568) = 0;
    objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);
    objc_msgSend(v8, "composition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOriginalComposition:", v12);

    v13 = *(void **)(a1 + 32);
    v21 = v7;
    v22 = 3221225472;
    v23 = __49__PUPhotoEditViewController__performRevertAction__block_invoke_631;
    v24 = &unk_1E58A4A28;
    v14 = v8;
    v15 = *(_QWORD *)(a1 + 32);
    v25 = v14;
    v26 = v15;
    v27 = v6;
    v16 = v11;
    v28 = v16;
    v17 = objc_msgSend(v13, "_revertToEmptyCompositionWithCompletionHandler:", &v21);
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v18, "photo", v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_startWaitingForAssetChange:", v19);

    objc_msgSend(*(id *)(a1 + 32), "_startWaitingForSaveRequestID:", v17);
    objc_destroyWeak(v34);
    objc_destroyWeak(location);
  }
  else
  {
    PLPhotoEditGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_INFO, "_performRevertAction: contentEditingInput did not come back from requestContentEditingInputWithOptions", (uint8_t *)location, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setRevertingToOriginal:", 0);
    objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);
  }

}

void __49__PUPhotoEditViewController__performRevertAction__block_invoke_621(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  PXLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_commitEditSessionActionWithAsset:initialCompositionController:savedCompositionController:localizedActionName:", v6, v8, v9, v10);

  objc_msgSend(WeakRetained, "_startTimeoutTimerForAssetChange");
  objc_msgSend(WeakRetained, "_didEndExitActionWithSessionKeys:initialComposition:", 0, *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopWaitingForSaveRequestWithAsset:", v6);

  objc_msgSend(WeakRetained, "setRevertingToOriginal:", 0);
  objc_msgSend(WeakRetained, "updateProgressIndicatorAnimated:", 1);
  if (!v6)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "error reverting to original: %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "photo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_stopWaitingForAssetChangeWithAsset:success:", v12, 0);

    if (objc_msgSend(WeakRetained, "isStandardVideo"))
      v13 = CFSTR("VIDEOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE");
    else
      v13 = CFSTR("PHOTOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE");
    PULocalizedString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[Internal Only] %@"), v14, v5);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addAction:", v19);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v16, 1, 0);

  }
  v20 = *(id *)(a1 + 56);
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 72);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v21, OS_SIGNPOST_INTERVAL_END, v22, "ExitEditRevertAction", " enableTelemetry=YES ", buf, 2u);
  }

}

void __49__PUPhotoEditViewController__performRevertAction__block_invoke_631(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D71660], "isIdentityCompositionController:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke_2;
    v11[3] = &unk_1E58A4A00;
    v9 = *(_QWORD *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v10 = objc_msgSend(v7, "_saveRevertedComposition:contentEditingInput:withCompletionHandler:", v8, v9, v11);
    if ((objc_msgSend(*(id *)(a1 + 40), "_isSaveProgressAvailable") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_startWaitingForSaveRequestID:", v10);
      objc_msgSend(*(id *)(a1 + 40), "updateProgressIndicatorAnimated:", 1);
    }

  }
}

uint64_t __49__PUPhotoEditViewController__performRevertAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PUPhotoEditViewController_asShotCompositionController___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1528), "setCurrentProgress:", a2 * 0.95);
}

void __57__PUPhotoEditViewController_asShotCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    if (v3)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 48));
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0D7CB38], "editSourceForContentEditingInput:useEmbeddedPreview:error:", v3, 0, &v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v21;
      if (v6)
      {
        v20 = 0;
        objc_msgSend(MEMORY[0x1E0D7CB38], "compositionControllerForContentEditingInput:asShot:source:error:", v3, 1, v6, &v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v20;
        if (v8)
        {
          v10 = objc_alloc(MEMORY[0x1E0D75140]);
          objc_msgSend(v3, "fullSizeImageURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithMediaURL:timeZoneLookup:", v11, 0);

          v13 = (void *)MEMORY[0x1E0D7CB58];
          objc_msgSend(v5, "compositionController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "livePhoto");
          v19 = v5;
          v15 = v7;
          v16 = v9;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v8, v14, v17 != 0, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v16;
          v7 = v15;
          v5 = v19;

        }
        else
        {
          v18 = 0;
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v6;
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "-[PEMediaDestination revertEditsForAsset:completionHandler:] complete; saved asset: %@",
      (uint8_t *)&v11,
      0xCu);
  }

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1832), a2);
    objc_msgSend(*(id *)(a1 + 32), "_resetModelAndBaseImagesToWorkImageVersion:", 1);
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);

}

void __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke_619(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "photo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __96__PUPhotoEditViewController__saveRevertedComposition_contentEditingInput_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v6;
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "-[PEMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoEditModel:useRawIfAvailable:completionHandler:] complete; savedAsset: %@",
      (uint8_t *)&v11,
      0xCu);
  }

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1832), a2);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);

}

uint64_t __49__PUPhotoEditViewController__handleRevertButton___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "aggregateSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishSessionWithEnd:", 1);

  objc_msgSend(*(id *)(a1 + 32), "exitEditEventBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionEndReason:", 1);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allTools", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "prepareForSave:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_performRevertAction");
}

void __47__PUPhotoEditViewController__handleDoneAction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSaveAction:", 0);

}

void __47__PUPhotoEditViewController__handleDoneAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSaveAction:", 1);

}

uint64_t __47__PUPhotoEditViewController__handleDoneButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSaveAction:", 0);
}

uint64_t __47__PUPhotoEditViewController__handleDoneButton___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSaveAction:", 1);
}

uint64_t __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelCurrentBatchAction");
}

uint64_t __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideAnimated:allowDelay:", 0, 0);
}

uint64_t __47__PUPhotoEditViewController__handleSaveAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *MEMORY[0x1E0D71468];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2;
  v4[3] = &unk_1E58A4770;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v1, v4);
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, int a6)
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CFAbsoluteTime Current;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  CFAbsoluteTime v36;
  uint64_t v37;

  v10 = a2;
  v11 = a5;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v14 = WeakRetained;
  if (a6)
  {
    objc_msgSend(WeakRetained, "_commitSaveAsCopyWithAsset:", v10);
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    PULocalizedString(CFSTR("EDIT_BUTTON_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_commitEditSessionActionWithAsset:initialCompositionController:savedCompositionController:localizedActionName:", v10, v15, v16, v17);

  }
  objc_msgSend(v14, "mediaView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isAsyncAdjustment") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 48), "isStandardVideo")
    && (objc_msgSend(v18, "_didReleaseAVObjects") & 1) == 0)
  {
    objc_msgSend(v18, "_releaseAVObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1616), "trimController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "releaseAVObjects");

  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v14, "mediaDestination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 48), "photoEditIrisModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "editingVisibility");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_4;
  v31[3] = &unk_1E58A47C0;
  v25 = *(_QWORD *)(a1 + 48);
  v26 = *(void **)(a1 + 56);
  v32 = v10;
  v33 = v25;
  v31[1] = 3221225472;
  v36 = Current;
  v31[4] = v14;
  v27 = v26;
  v28 = *(_QWORD *)(a1 + 88);
  v34 = v27;
  v37 = v28;
  v35 = *(id *)(a1 + 64);
  v29 = v10;
  v30 = objc_msgSend(v21, "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v29, v12, v11, v22, v24, v31);

  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 1548) = objc_msgSend(v11, "isAsyncAdjustment");
  objc_msgSend(v14, "_startWaitingForSaveRequestID:", v30);
  objc_msgSend(v14, "_startWaitingForAssetChange:", v29);
  objc_msgSend(v14, "updateProgressIndicatorAnimated:", 1);

}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_561(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0CD13F8]);
  objc_msgSend(v7, "setCopyOriginal:", 1);
  objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetCopyFromAsset:options:", *(_QWORD *)(a1 + 32), v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderForCreatedAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2_564(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CD1390];
    v33[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "_hasUnsavedChanges") & 1) != 0)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setForceReturnFullLivePhoto:", 1);
      objc_msgSend(v13, "setContentMode:", 0);
      objc_msgSend(v13, "setSkipDisplaySizeImage:", 1);
      v14 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_567;
      v27[3] = &unk_1E58A4838;
      v27[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v13, "setCanHandleRAW:", v27);
      objc_msgSend(v13, "setCanHandleAdjustmentData:", &__block_literal_global_571);
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_573;
      v20[3] = &unk_1E58A48A0;
      v15 = *(void **)(a1 + 40);
      v20[4] = *(_QWORD *)(a1 + 32);
      v16 = v15;
      v17 = *(_QWORD *)(a1 + 88);
      v21 = v16;
      v26 = v17;
      v22 = *(id *)(a1 + 48);
      v23 = *(id *)(a1 + 64);
      v25 = *(id *)(a1 + 72);
      v24 = v12;
      objc_msgSend(v24, "requestContentEditingInputWithOptions:completionHandler:", v13, v20);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "didFinishWithAsset:savedChanges:", v12, 1);
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_565;
    block[3] = &unk_1E58A4810;
    block[4] = *(_QWORD *)(a1 + 32);
    v29 = v5;
    v18 = *(id *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 88);
    v30 = v18;
    v32 = v19;
    v31 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_579(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBurningInTrim:", 0);
    objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);
    PULocalizedString(CFSTR("VIDEOEDIT_EDIT_SAVE_FAILED_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL ONLY] %@"), v15, v6);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v20);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v17, 1, 0);
    PLPhotoEditGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v6;
      _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "error burning in trim to new asset: %@", buf, 0xCu);
    }

    v22 = *(id *)(a1 + 40);
    v23 = v22;
    v24 = *(_QWORD *)(a1 + 64);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v23, OS_SIGNPOST_INTERVAL_END, v24, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_didEndExitActionWithSessionKeys:", *(_QWORD *)(a1 + 48));
    goto LABEL_18;
  }
  v7 = (void *)MEMORY[0x1E0D71660];
  objc_msgSend(v5, "compositionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isIdentityCompositionController:", v8) & 1) == 0)
  {

    goto LABEL_17;
  }
  objc_msgSend(v5, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "slomoAdjustmentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_17:
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v5, "asset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compositionController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "_shouldRequestAsyncAdjustmentForAsset:compositionController:", v26, v27);

    v29 = (void *)MEMORY[0x1E0D7CB38];
    objc_msgSend(v5, "contentEditingInput");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compositionController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v30, v31, v32, v28, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compositionController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentEditingInput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *, void *, uint64_t))(v33 + 16))(v33, v17, v34, v35, v15, 1);

LABEL_18:
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "setBurningInTrim:", 0);
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 64);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v5, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didFinishWithAsset:savedChanges:", v15, 1);
LABEL_19:

}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_565(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isStandardVideo"))
    v2 = CFSTR("VIDEOEDIT_EDIT_SAVE_FAILED_TITLE");
  else
    v2 = CFSTR("PHOTOEDIT_EDIT_SAVE_FAILED_TITLE");
  PULocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1AF429AF0]())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL ONLY] %@"), v3, *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("OK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "error creating duplicate: %@", buf, 0xCu);
  }

  v11 = *(id *)(a1 + 48);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 64);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didEndExitActionWithSessionKeys:", *(_QWORD *)(a1 + 56));
}

uint64_t __47__PUPhotoEditViewController__handleSaveAction___block_invoke_567(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasLoadedRaw");
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_573(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newOutputForContentEditingInput:compositionController:", v5, *(_QWORD *)(a1 + 56));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1B30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "isStandardVideo"))
      v7 = CFSTR("VIDEOEDIT_EDIT_SAVE_FAILED_TITLE");
    else
      v7 = CFSTR("PHOTOEDIT_EDIT_SAVE_FAILED_TITLE");
    PULocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL ONLY] %@"), v8, v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v10, 1, 0);
    PLPhotoEditGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "error saving as duplicate: %@", buf, 0xCu);
    }

    v15 = *(id *)(a1 + 40);
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 80);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v16, OS_SIGNPOST_INTERVAL_END, v17, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_didEndExitActionWithSessionKeys:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2_569(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D7CB38], "adjustmentDataIsSupported:", a2);
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  CFAbsoluteTime v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint8_t buf[4];
  CFAbsoluteTime v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "setBurningInTrim:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_startTimeoutTimerForAssetChange");
  objc_msgSend(*(id *)(a1 + 32), "_stopWaitingForSaveRequestWithAsset:", v7);

  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
    *(_DWORD *)buf = 134217984;
    v24 = v9;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "Finished editor save in %lf seconds", buf, 0xCu);
  }

  if (!v7)
  {
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = *(double *)&v5;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "error saving edits: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_stopWaitingForAssetChangeWithAsset:success:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 32), "updateProgressIndicatorAnimated:", 1);
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
    {
      v12 = objc_msgSend(v5, "code");

      if (v12 == 3072)
      {
        objc_msgSend(*(id *)(a1 + 32), "didFinishWithChanges:", 0);
        goto LABEL_16;
      }
    }
    else
    {

    }
    if (objc_msgSend(*(id *)(a1 + 48), "isStandardVideo"))
      v13 = CFSTR("VIDEOEDIT_EDIT_SAVE_FAILED_TITLE");
    else
      v13 = CFSTR("PHOTOEDIT_EDIT_SAVE_FAILED_TITLE");
    PULocalizedString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL ONLY] %@"), v14, v5);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v19);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v16, 1, 0);
  }
LABEL_16:
  v20 = *(id *)(a1 + 56);
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 80);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v21, OS_SIGNPOST_INTERVAL_END, v22, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didEndExitActionWithSessionKeys:", *(_QWORD *)(a1 + 64));
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valuesCalculator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAdjustmentSmartToneStatistics:withAccuracy:", v3, 0);

}

uint64_t __62__PUPhotoEditViewController__showJpegPreviewForRawRevertAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRevertAction");
}

uint64_t __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "resetToDefaultValueAnimated:", 1);
}

uint64_t __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_isWaitingForSaveCompletion"))
    v2 = 4;
  else
    v2 = 3;
  objc_msgSend(*(id *)(a1 + 32), "aggregateSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishSessionWithEnd:", v2);

  objc_msgSend(*(id *)(a1 + 32), "exitEditEventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionEndReason:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_resignCurrentTool");
  return objc_msgSend(*(id *)(a1 + 32), "_performDiscardAction");
}

uint64_t __54__PUPhotoEditViewController__handleToolbarToolButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performInEditRevertWithToolButton:", *(_QWORD *)(a1 + 40));
}

void __59__PUPhotoEditViewController_setFocusingViewForInteraction___block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  __int128 *v5;
  double v6;
  __int128 v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", *(double *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    memset(&v24, 0, sizeof(v24));
    v2 = *(unsigned __int8 *)(a1 + 49);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "frame");
    v5 = (__int128 *)MEMORY[0x1E0C9BAA8];
    if (v2)
    {
      v6 = v3 * 0.2;
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v23.c = v7;
      *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v8 = 0.0;
    }
    else
    {
      v8 = v4 * 0.2;
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v23.c = v9;
      *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v6 = 0.0;
    }
    CGAffineTransformTranslate(&v24, &v23, v6, v8);
    if (*(_BYTE *)(a1 + 50))
    {
      v20 = *(_OWORD *)&v24.a;
      v21 = *(_OWORD *)&v24.c;
      v10 = *(_OWORD *)&v24.tx;
    }
    else
    {
      v11 = v5[1];
      v20 = *v5;
      v21 = v11;
      v10 = v5[2];
    }
    v22 = v10;
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 1144);
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v10;
    objc_msgSend(v12, "setTransform:", v19);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateToolbarShadowAlpha");
  objc_msgSend(*(id *)(a1 + 32), "_updateVideoScrubberDisplayAnimate:", 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldShowRawDecodeBadge") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldShowProResBadge"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setAlpha:", *(double *)(a1 + 40));
  }
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (*(_BYTE *)(a1 + 50))
  {
    v14 = objc_msgSend(v13, "isPerformingLiveInteraction");
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
    if (!v14)
    {
      objc_msgSend(v13, "setFocusingViewForInteraction:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = 0.0;
      goto LABEL_18;
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v13, "setFocusingViewForInteraction:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = 1.0;
LABEL_18:
  objc_msgSend(v16, "setAlpha:", v18);

}

void __62__PUPhotoEditViewController__focusViewForInteractionWithDelay__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFocusViewForInteractionDelayTimer:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setFocusingViewForInteraction:", 1);

}

uint64_t __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1472), "setAlpha:", 1.0);
}

uint64_t __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  _QWORD v4[4];
  uint64_t v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_3;
  v4[3] = &unk_1E58AACF0;
  v1 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_4;
  v3[3] = &unk_1E58A46B0;
  v3[4] = v5;
  v3[5] = v1;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v4, v3, 0.4, 0.5);
}

uint64_t __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 1480))
    return objc_msgSend(*(id *)(v1 + 1472), "setAlpha:", 0.0);
  return result;
}

_QWORD *__57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_4(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == result[185])
    return (_QWORD *)objc_msgSend(result, "_setTransientStatusBadgeVisible:", 0);
  return result;
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD block[5];
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD v43[5];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(a1 + 40) == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "compositionController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cropAdjustmentController");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v5, "cropAdjustmentController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = *MEMORY[0x1E0D71328];
          v43[0] = v7;
          v43[1] = 3221225472;
          v43[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_2;
          v43[3] = &unk_1E58A4638;
          v43[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v12, v43);
        }
      }
      else
      {

      }
    }
    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_15;
    objc_msgSend(v5, "orientationAdjustmentController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "adjustmentConstants");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "PIOrientationAdjustmentKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v7;
      v42[1] = 3221225472;
      v42[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_3;
      v42[3] = &unk_1E58A4660;
      v42[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v15, v42);

    }
    if (*(_BYTE *)(a1 + 48))
    {
      v16 = *(_QWORD **)(a1 + 32);
      v17 = v16 + 211;
      objc_msgSend(v16, "lastKnownPreviewImageSize");
      *v17 = v18;
      v17[1] = v19;
      objc_msgSend(MEMORY[0x1E0D71660], "synchronousInputSizeForCompositionController:", v5);
      objc_msgSend(*(id *)(a1 + 32), "originalImageExifOrientation");
      PLOrientationTransformImageSize();
      v21 = v20;
      v23 = v22;
      objc_msgSend(*(id *)(a1 + 32), "lastKnownPreviewImageSize");
      v26 = v25 != v23 || v24 != v21;
      objc_msgSend(*(id *)(a1 + 32), "setLastKnownPreviewImageSize:", v21, v23);
    }
    else
    {
LABEL_15:
      v26 = 0;
    }
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_4;
    aBlock[3] = &unk_1E58ABCA8;
    v27 = v5;
    v28 = *(_QWORD *)(a1 + 32);
    v40 = v27;
    v41 = v28;
    v29 = _Block_copy(aBlock);
    v30 = v29;
    if (v26)
    {
      objc_msgSend(*(id *)(a1 + 32), "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "snapshotViewAfterScreenUpdates:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(a1 + 32), "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addSubview:", v32);

      objc_msgSend(*(id *)(a1 + 32), "setShowOriginalCausedSizeChange:", 1);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_5;
      block[3] = &unk_1E58ABAF0;
      v37 = v32;
      v38 = v30;
      block[4] = *(_QWORD *)(a1 + 32);
      v34 = v32;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(void *))v29 + 2))(v29);
      v35[0] = v7;
      v35[1] = 3221225472;
      v35[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_9;
      v35[3] = &unk_1E58ABD10;
      v35[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v35);
    }

  }
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTogglingShowOriginal:", 0);
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_11(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  double *v5;
  _OWORD *v6;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_defaultRenderPipelineFiltersForCurrentMode");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[126];
  objc_msgSend(v2, "_composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setComposition:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setPipelineFilters:", v8);
  v5 = *(double **)(a1 + 32);
  v6 = (_OWORD *)MEMORY[0x1E0C9D820];
  if (v5[211] != *MEMORY[0x1E0C9D820] || v5[212] != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v5, "setLastKnownPreviewImageSize:");
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1688) = *v6;
    v5 = *(double **)(a1 + 32);
  }
  objc_msgSend(v5, "_updateTransientStatusBadgeForPreviewingOriginal");
  objc_msgSend(*(id *)(a1 + 32), "_updateMediaViewEdgeInsets");

}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_12(_QWORD *a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(a1[6] + 16))();
  v2 = dispatch_time(0, 200000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_13;
  v4[3] = &unk_1E58ABCA8;
  v3 = (void *)a1[5];
  v4[4] = a1[4];
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTogglingShowOriginal:", 0);
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_14;
  v9[3] = &unk_1E58ABD10;
  v10 = *(id *)(a1 + 40);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_15;
  v7[3] = &unk_1E58AAE08;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v9, v7, 0.2);

}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_15(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShowOriginalCausedSizeChange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTogglingShowOriginal:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "compositionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cropAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromAdjustment:", v5);

}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setOrientation:", objc_msgSend(v2, "originalImageExifOrientation"));

}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0D71660], "validatedCompositionCopyFor:mediaType:", *(_QWORD *)(a1 + 32), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setComposition:", v2);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_5(_QWORD *a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(a1[6] + 16))();
  v2 = dispatch_time(0, 200000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_6;
  v4[3] = &unk_1E58ABCA8;
  v3 = (void *)a1[5];
  v4[4] = a1[4];
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTogglingShowOriginal:", 0);
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_updateMediaViewEdgeInsets");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_7;
  v9[3] = &unk_1E58ABD10;
  v10 = *(id *)(a1 + 40);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_8;
  v7[3] = &unk_1E58AAE08;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0, v9, v7, 0.1, 0.2);

}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startShowingOriginalBadge");
  objc_msgSend(*(id *)(a1 + 32), "setTogglingShowOriginal:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __51__PUPhotoEditViewController__updateLayerModulation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  v6 = a2;
  objc_msgSend(v3, "_renderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_containerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayer:", v5);

  objc_msgSend(v6, "setGainMapImage:", objc_msgSend(*(id *)(a1 + 32), "gainMapImage"));
  objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
  objc_msgSend(v6, "setGainMapValue:");
  objc_msgSend(v6, "setDisplayingOpaqueContent:", 0);

}

void __51__PUPhotoEditViewController__updateLayerModulation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "mainLivePhotoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLivePhotoView:", v5);

  objc_msgSend(v6, "setGainMapImage:", objc_msgSend(*(id *)(a1 + 32), "gainMapImage"));
  objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
  objc_msgSend(v6, "setGainMapValue:");

}

void __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1456);
  v4 = a2;
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayer:", v3);

  objc_msgSend(v4, "setDisplayingOpaqueContent:", 0);
}

void __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setGainMapImage:", objc_msgSend(v3, "gainMapImage"));
  objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
  objc_msgSend(v4, "setGainMapValue:");

}

uint64_t __63__PUPhotoEditViewController__hideProgressIndicatorImmediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __85__PUPhotoEditViewController__updateMediaViewLayoutWithCoordinator_layoutOrientation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMediaViewEdgeInsets");
}

uint64_t __61__PUPhotoEditViewController__updateMainActionButtonAnimated___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "newNotchButtons");

  v4 = a1[5];
  v5 = *(void **)(a1[4] + 1200);
  v6 = a1[6];
  if (v3)
  {
    objc_msgSend(v5, "setTitle:fallbackSymbolName:", a1[5], a1[6]);
    objc_msgSend(*(id *)(a1[4] + 1200), "setTextColor:", a1[7]);
  }
  else
  {
    v7 = v5;
    objc_msgSend(v7, "setTitle:forState:fallbackSymbolName:", v4, 0, v6);
    objc_msgSend(v7, "setTextColor:", a1[7]);

  }
  objc_msgSend(*(id *)(a1[4] + 1200), "setAccessibilityLabel:", a1[8]);
  return objc_msgSend(*(id *)(a1[4] + 1200), "setBackgroundColor:", a1[9]);
}

void __51__PUPhotoEditViewController__newToolButtonForTool___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleToolbarToolButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke(id *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "toolControllerTag") != 1005)
  {
    v3 = (id)objc_msgSend(a1[4], "_newToolButtonForTool:", v11);
    v4 = objc_msgSend(a1[4], "showsLabelsForToolButtons");
    objc_msgSend(v3, "widthAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToConstant:", 30.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 1);

    objc_msgSend(v3, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 38.0;
    if (v4)
      v9 = 48.0;
    objc_msgSend(v7, "constraintEqualToConstant:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    objc_msgSend(a1[5], "addObject:", v3);
    objc_msgSend(a1[6], "addObject:", v3);
    objc_msgSend(v3, "setSelected:", *((_QWORD *)a1[4] + 124) == (_QWORD)v11);
    objc_msgSend(v3, "setAvailable:", objc_msgSend(v11, "enabled"));

  }
}

uint64_t __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setAlpha:", 1.0);
}

uint64_t __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setAlpha:", 0.0);
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleShowOriginalButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleUndoButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRedoButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSemStylesDebugButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePluginButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleMarkupButton:", v3);

}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_10(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleZoomButton:", v3);

}

uint64_t __53__PUPhotoEditViewController__updateToolbarsAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateToolbarShadowAlpha");
}

uint64_t __92__PUPhotoEditViewController_configureEnablenessOfControlButton_animated_canVisuallyDisable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
}

void __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1040) = 1;
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "setActive:", 1);
    objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);
  }
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    objc_msgSend(v4, "setActive:", 1);
    objc_msgSend(*(id *)(a1 + 72), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 80), "setAlpha:", 0.0);
  }
  v5 = *(void **)(a1 + 88);
  if (v5)
  {
    objc_msgSend(v5, "setActive:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(a1 + 32), "_updateToolbarShadowAlpha");
  }
  v6 = *(void **)(a1 + 96);
  if (v6)
  {
    objc_msgSend(v6, "setActive:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(a1 + 32), "_updateToolbarShadowAlpha");
  }
  v7 = *(_QWORD **)(a1 + 32);
  if (v7[134])
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1072);
    *(_QWORD *)(v8 + 1072) = 0;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsUpdateConstraints");

    v7 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v7, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "_clearBadgeConstraints");
  objc_msgSend(*(id *)(a1 + 32), "mediaView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimumZoomScale");
  objc_msgSend(v12, "setZoomScale:animated:", 1);

}

uint64_t __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(id *a1)
{
  *((_BYTE *)a1[4] + 1040) = 0;
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[6], "removeFromSuperview");
  objc_msgSend(a1[7], "removeFromSuperview");
  objc_msgSend(a1[8], "removeFromSuperview");
  return objc_msgSend(a1[4], "_updateVideoScrubberDisplayAnimate:", 1);
}

void __67__PUPhotoEditViewController__cropPlaceholderViewFrameForImageSize___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTraitCollection:", v2);

}

void __57__PUPhotoEditViewController__handleSemStylesDebugButton___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "valuesCalculator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAdjustmentSemanticStyleStatistics:", v4);

  objc_msgSend(v4, "setEnabled:", 1);
}

double __57__PUPhotoEditViewController__handleSemStylesDebugButton___block_invoke_2()
{
  return 254.0;
}

uint64_t __75__PUPhotoEditViewController__setNeedsUserInterfaceAppearanceUpdateAnimated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUserInterfaceAppearanceUpdate");
}

void __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  id v24;

  v24 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_mediaViewEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (v24)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
    objc_msgSend(v24, "transitionDuration");
    v13 = v12;
    v14 = objc_msgSend(v24, "completionCurve");
    v15 = v11;
    v16 = v4;
    v17 = v6;
    v18 = v8;
    v19 = v10;
    v20 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
    v22 = v21;
    UIAnimationDragCoefficient();
    v20 = v22 * v23;
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
    v16 = v4;
    v17 = v6;
    v18 = v8;
    v19 = v10;
    v14 = 0;
  }
  objc_msgSend(v15, "_transitionToInsets:duration:animationCurve:updateRenderContent:", v14, 1, v16, v17, v18, v19, v20);

}

uint64_t __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateSpecDependentUIPieces");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1041) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateVideoScrubberDisplayAnimate:", 1);
}

uint64_t __74__PUPhotoEditViewController__updateTraitCollectionAndLayoutReferenceSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1824), "setPrefersCompactLayoutForSplitScreen:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1824), "setTraitCollection:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1824), "setLayoutReferenceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __74__PUPhotoEditViewController_initWithPhoto_mediaProvider_mediaDestination___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_signpost_type_t v16;
  os_signpost_id_t v17;
  uint32_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "state") == 1)
  {
    v5 = *(id *)(a1 + 32);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EnterEdit", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    v8 = *(id *)(a1 + 32);
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 48);
    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v8))
      goto LABEL_13;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    v21 = 138412802;
    v22 = v11;
    v23 = 2048;
    v24 = v12;
    v25 = 2048;
    v26 = v13;
    v14 = "Asset Filename=%@, Size:{%lu, %lu}";
    v15 = v9;
    v16 = OS_SIGNPOST_EVENT;
    v17 = v10;
    v18 = 32;
    goto LABEL_12;
  }
  if (a3 != 1)
    return;
  v19 = *(id *)(a1 + 32);
  v9 = v19;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v21) = 0;
    v14 = " enableTelemetry=YES ";
    v15 = v9;
    v16 = OS_SIGNPOST_INTERVAL_END;
    v17 = v20;
    v18 = 2;
LABEL_12:
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v15, v16, v17, "EnterEdit", v14, (uint8_t *)&v21, v18);
  }
LABEL_13:

}

+ (void)preheatEditDependenciesIfNeeded
{
  if (preheatEditDependenciesIfNeeded_onceToken != -1)
    dispatch_once(&preheatEditDependenciesIfNeeded_onceToken, &__block_literal_global_64075);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

+ (id)_defaultLivePhotoRenderPipelineFilters
{
  if (_defaultLivePhotoRenderPipelineFilters_onceToken != -1)
    dispatch_once(&_defaultLivePhotoRenderPipelineFilters_onceToken, &__block_literal_global_750);
  return (id)_defaultLivePhotoRenderPipelineFilters_defaultFilters;
}

+ (id)_defaultMediaViewRenderPipelineFilters
{
  if (_defaultMediaViewRenderPipelineFilters_onceToken != -1)
    dispatch_once(&_defaultMediaViewRenderPipelineFilters_onceToken, &__block_literal_global_751);
  return (id)_defaultMediaViewRenderPipelineFilters_defaultFilters;
}

void __67__PUPhotoEditViewController__defaultMediaViewRenderPipelineFilters__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71268], "noMuteFilter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_defaultMediaViewRenderPipelineFilters_defaultFilters;
  _defaultMediaViewRenderPipelineFilters_defaultFilters = v1;

}

void __67__PUPhotoEditViewController__defaultLivePhotoRenderPipelineFilters__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71268], "noMuteFilter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0D71268], "noTrimFilter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_defaultLivePhotoRenderPipelineFilters_defaultFilters;
  _defaultLivePhotoRenderPipelineFilters_defaultFilters = v2;

}

void __60__PUPhotoEditViewController_preheatEditDependenciesIfNeeded__block_invoke()
{
  id v0;

  if (PLIsMobileSlideShow())
  {
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "scheduleTaskWithQoS:block:", 0, &__block_literal_global_175_64077);

  }
}

void __60__PUPhotoEditViewController_preheatEditDependenciesIfNeeded__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EditPrewarm", ", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D71260], "preheatEditDependencies");
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EditPrewarm", ", v1, 2u);
  }

}

@end
