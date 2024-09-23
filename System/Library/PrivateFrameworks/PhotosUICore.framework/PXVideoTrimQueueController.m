@implementation PXVideoTrimQueueController

- (PXVideoTrimQueueController)initWithPhotoLibrary:(id)a3 videoSources:(id)a4 videoSourcesSharingInfo:(id)a5 customExportsInfo:(id)a6 album:(id)a7
{
  id v13;
  id v14;
  id v15;
  PXVideoTrimQueueController *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v25;
  id obj;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v32 = a6;
  v31 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PXVideoTrimQueueController;
  v16 = -[PXVideoTrimQueueController init](&v37, sel_init);
  if (v16)
  {
    obj = a5;
    v28 = v15;
    v29 = a6;
    v30 = v13;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (objc_class *)objc_opt_class();
              NSStringFromClass(v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("PXVideoTrimQueueController.m"), 122, CFSTR("PXVideoTrimQueueController can only accept PLManagedAsset and/or PLStreamShareSource instances as video sources, but it receives an instance of %@"), v23);

            }
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v16->_photoLibrary, a3);
    objc_storeStrong((id *)&v16->_videosSources, a4);
    objc_storeStrong((id *)&v16->_videosSourcesSharingInfo, obj);
    objc_storeStrong((id *)&v16->_customExportsInfo, v29);
    objc_storeStrong((id *)&v16->_album, a7);
    v13 = v30;
    v15 = v28;
  }

  return v16;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v7;
    objc_storeWeak((id *)&self->_delegate, obj);
  }

}

- (void)start
{
  PLPhotoLibrary *photoLibrary;
  _QWORD v3[5];

  photoLibrary = self->_photoLibrary;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PXVideoTrimQueueController_start__block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PLPhotoLibrary performTransaction:](photoLibrary, "performTransaction:", v3);
}

- (void)_presentViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXVideoTrimQueueController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controller:presentViewController:", self, v4);

}

- (void)_dismissViewControllerWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXVideoTrimQueueController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controller:dismissViewControllerWithCompletion:", self, v4);

}

- (void)_showTrimViewControllerForSource:(id)a3
{
  id v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a3;
  if (v5)
  {
    v21 = v5;
    v6 = (double)objc_msgSend(MEMORY[0x1E0D719E0], "maxVideoLengthForPublishing");
    -[PXVideoTrimQueueController alternateSourceToUseIfNeededFromSource:](self, "alternateSourceToUseIfNeededFromSource:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_alloc((Class)getPLUIEditVideoViewControllerClass());
      PXLocalizedStringFromTable(CFSTR("TRIM_FOR_PUBLISH_TITLE"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithPhoto:trimTitle:", v7, v9);
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "mediaURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isFileURL"))
      {
        -[PLPhotoLibrary photoFromAssetURL:](self->_photoLibrary, "photoFromAssetURL:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc((Class)getPLUIEditVideoViewControllerClass());
        PXLocalizedStringFromTable(CFSTR("TRIM_FOR_PUBLISH_TITLE"), CFSTR("PhotosUICore"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v12, "initWithPhoto:trimTitle:", v11, v13);

LABEL_11:
LABEL_12:

        if (v10)
        {
LABEL_13:
          objc_msgSend(v10, "setDelegate:", self);
          objc_msgSend(v10, "setExtendedLayoutIncludesOpaqueBars:", 1);
          objc_msgSend(v10, "setParentInPopoverException:", 1);
          v16 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x1E0DC4CB8], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DC5928], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DC5870], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DC58B8], 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setImagePickerOptions:", v18);

          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
          -[PXVideoTrimQueueController _presentViewController:](self, "_presentViewController:", v19);

          v5 = v21;
          goto LABEL_14;
        }
LABEL_15:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoTrimQueueController.m"), 203, CFSTR("%@ Unable to create trimming view controller for video source: %@ (source to use: %@)"), self, v21, v7);

        v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_15;
      v9 = (void *)v14;
    }
    v15 = objc_alloc((Class)getPLUIEditVideoViewControllerClass());
    PXLocalizedStringFromTable(CFSTR("TRIM_FOR_PUBLISH_TITLE"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v15, "initWithVideoURL:trimTitle:", v9, v11);
    goto LABEL_11;
  }
LABEL_14:

}

- (id)alternateSourceToUseIfNeededFromSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "videoInfoKeyForSource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v5)
  {
    -[PXVideoTrimQueueController customExportsInfo](self, "customExportsInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v4;
    if (v8)
    {
      v6 = v8;

    }
  }

  return v6;
}

- (BOOL)_shouldShowVideoTooLongAlertForVideoSource:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  double v21;

  v4 = (void *)MEMORY[0x1E0D719E0];
  v5 = a3;
  v6 = objc_msgSend(v4, "maxVideoLengthForPublishing");
  -[PXVideoTrimQueueController alternateSourceToUseIfNeededFromSource:](self, "alternateSourceToUseIfNeededFromSource:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "mediaType") == 1)
    {
      objc_msgSend(v7, "mediaURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isFileURL"))
      {
        objc_msgSend(v13, "scheme");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("assets-library"));

        if (v15)
        {
          -[PLPhotoLibrary photoFromAssetURL:](self->_photoLibrary, "photoFromAssetURL:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D71B20], "durationForManagedAsset:applyVideoAdjustments:", v16, 1);
          if (v16)
          {
            v18 = v17;
            v19 = objc_msgSend(v16, "kind");
            v12 = v18 > (double)v6 && v19 == 1;
          }
          else
          {
            v12 = 0;
          }

          goto LABEL_27;
        }
        goto LABEL_24;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_24:
        v12 = 0;
        goto LABEL_27;
      }
    }
    objc_msgSend((id)objc_opt_class(), "durationFromVideoAtURL:", v13);
    v12 = v21 > (double)v6;
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0D71B20], "durationForManagedAsset:applyVideoAdjustments:", v7, 1);
  if (!v7)
  {
LABEL_23:
    v12 = 0;
    goto LABEL_28;
  }
  v9 = v8;
  v10 = objc_msgSend(v7, "kind");
  v12 = v9 > (double)v6 && v10 == 1;
LABEL_28:

  return v12;
}

- (void)_dequeueTrimmingControl
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  if (-[NSMutableArray count](self->_sourcesToTransform, "count"))
  {
    -[NSMutableArray firstObject](self->_sourcesToTransform, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "controller:willTrimVideoFromSource:", self, v3);

    }
    -[PXVideoTrimQueueController _videoTooLongAlertController](self, "_videoTooLongAlertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("VIDEO_TOO_LONG_OK"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("VIDEO_TOO_LONG_CANCEL"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PXVideoTrimQueueController__dequeueTrimmingControl__block_invoke;
    v14[3] = &unk_1E51458F8;
    v14[4] = self;
    v15 = v3;
    v10 = v3;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v6, 0, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v11);

    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __53__PXVideoTrimQueueController__dequeueTrimmingControl__block_invoke_2;
    v13[3] = &unk_1E5144530;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v7, 1, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v12);

    -[PXVideoTrimQueueController _presentViewController:](self, "_presentViewController:", v5);
  }
}

- (id)_videoTooLongAlertController
{
  void *v2;
  void *v3;
  void *v4;

  PXLocalizedStringFromTable(CFSTR("VIDEO_TOO_LONG_ALERT_TITLE"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("VIDEO_TOO_LONG_PUBLISH_BODY"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_trimVideoSource:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXVideoTrimQueueController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double Seconds;
  id v21;
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
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  PXVideoTrimQueueController *v49;
  uint64_t v50;
  void *v51;
  id v52;
  PXVideoTrimQueueController *v53;
  PXVideoTrimQueueController *v54;
  PXVideoTrimQueueController *v55;
  void *v56;
  SEL v57;
  void *v58;
  void *v59;
  CMTime v60;
  CMTime v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  PXVideoTrimQueueController *v66;
  id v67;
  id v68;
  CMTime time;
  CMTime v70;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "videoInfoKeyForSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoTrimQueueController alternateSourceToUseIfNeededFromSource:](self, "alternateSourceToUseIfNeededFromSource:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v57 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D71B20], "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v7, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForVideoFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathExtension:", v12);
    v13 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "copy");

    objc_msgSend(MEMORY[0x1E0D71B20], "durationForManagedAsset:applyVideoAdjustments:", v7, 1);
    Seconds = v19;

    self = v13;
    if (!v7)
      goto LABEL_27;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "mediaURL");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isFileURL"))
    {
      v53 = self;
      v21 = v5;
      NSTemporaryDirectory();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathComponent:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pathExtension");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathExtension:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v27, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v28, 0);
      memset(&v70, 0, sizeof(v70));
      if (v28)
        objc_msgSend(v28, "duration");
      time = v70;
      Seconds = CMTimeGetSeconds(&time);

      v8 = 0;
      v5 = v21;
      self = v53;
    }
    else
    {
      objc_msgSend(v18, "scheme");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("assets-library"));

      if (v38)
      {
        -[PLPhotoLibrary photoFromAssetURL:](self->_photoLibrary, "photoFromAssetURL:", v18);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D71B20], "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v39, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "pathForVideoFile");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSTemporaryDirectory();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "uuid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringByAppendingPathComponent:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pathExtension");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringByAppendingPathExtension:", v43);
        v55 = self;
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "removeItemAtPath:error:", v44, 0);

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v44, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D71B20], "durationForManagedAsset:applyVideoAdjustments:", v39, 1);
        Seconds = v46;

        self = v55;
      }
      else
      {
        v59 = 0;
        v16 = 0;
        v8 = 0;
        Seconds = 0.0;
      }
    }

    if (!v7)
      goto LABEL_27;
LABEL_23:
    if (Seconds > (double)objc_msgSend(MEMORY[0x1E0D719E0], "maxVideoLengthForPublishing"))
    {
      v56 = v18;
      v47 = v16;
      memset(&v70, 0, sizeof(v70));
      CMTimeMakeWithSeconds(&v70, self->_startTime, 1);
      memset(&time, 0, sizeof(time));
      CMTimeMakeWithSeconds(&time, self->_endTime, 1);
      if (!v59)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v57, self, CFSTR("PXVideoTrimQueueController.m"), 391, CFSTR("Requires a videoAVObjectBuilder"));

      }
      -[NSMutableArray addObject:](self->_trimQueue, "addObject:", v59);
      v58 = (void *)MEMORY[0x1E0D71BD8];
      v48 = *MEMORY[0x1E0C89E98];
      v49 = self;
      v50 = *MEMORY[0x1E0C8A2E0];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __47__PXVideoTrimQueueController__trimVideoSource___block_invoke;
      v62[3] = &unk_1E51276E0;
      v63 = v8;
      v16 = v47;
      v64 = v47;
      v18 = v56;
      v65 = v56;
      v66 = v49;
      v67 = v59;
      v68 = v5;
      v61 = v70;
      v60 = time;
      objc_msgSend(v58, "transcodeVideoWithObjectBuilder:outputURL:startTime:endTime:presetName:outputFileType:metadata:completionHandler:", v67, v64, &v61, &v60, v48, v50, 0, v62);

    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v52 = v5;
      v54 = self;
      NSTemporaryDirectory();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByAppendingPathComponent:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pathExtension");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByAppendingPathExtension:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v35, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v36, 0);
      memset(&v70, 0, sizeof(v70));
      if (v36)
        objc_msgSend(v36, "duration");
      time = v70;
      Seconds = CMTimeGetSeconds(&time);

      v5 = v52;
      self = v54;
    }
    else
    {
      v59 = 0;
      v16 = 0;
      Seconds = 0.0;
    }

    v8 = 0;
  }
  else
  {
    v59 = 0;
    v16 = 0;
    v8 = 0;
    Seconds = 0.0;
  }
  v18 = v6;
  if (v7)
    goto LABEL_23;
LABEL_27:

}

- (void)_sendDidFinish
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "controller:didFinishTrimmingVideoSources:", self, self->_videosSources);

  }
}

- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  NSMutableArray *sourcesToTransform;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PXVideoTrimQueueController *v17;
  id v18;

  sourcesToTransform = self->_sourcesToTransform;
  v6 = a4;
  -[NSMutableArray firstObject](sourcesToTransform, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC5938]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  self->_startTime = v10;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC5930]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  self->_endTime = v12;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PXVideoTrimQueueController_editVideoViewController_didTrimVideoWithOptions___block_invoke;
  v15[3] = &unk_1E51457C8;
  v16 = v8;
  v17 = self;
  v18 = v7;
  v13 = v7;
  v14 = v8;
  -[PXVideoTrimQueueController _dismissViewControllerWithCompletion:](self, "_dismissViewControllerWithCompletion:", v15);

}

- (void)editVideoViewControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PXVideoTrimQueueController_editVideoViewControllerDidCancel___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXVideoTrimQueueController _dismissViewControllerWithCompletion:](self, "_dismissViewControllerWithCompletion:", v3);
}

- (void)cleanupResources
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXVideoTrimQueueController videosSources](self, "videosSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "areVideoSourcesStreamShareSources:", v2))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cleanupResources", (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (PXVideoTrimQueueControllerDelegate)delegate
{
  return (PXVideoTrimQueueControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)videosSources
{
  return self->_videosSources;
}

- (NSDictionary)videosSourcesSharingInfo
{
  return self->_videosSourcesSharingInfo;
}

- (NSDictionary)customExportsInfo
{
  return self->_customExportsInfo;
}

- (NSDictionary)trimmedVideoInfo
{
  return &self->_trimmedVideoInfo->super;
}

- (PLCloudSharedAlbum)album
{
  return self->_album;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_albumName, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setCommentText:(id)a3
{
  objc_storeStrong((id *)&self->_commentText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_customExportsInfo, 0);
  objc_storeStrong((id *)&self->_videosSourcesSharingInfo, 0);
  objc_storeStrong((id *)&self->_videosSources, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_trimmedVideoInfo, 0);
  objc_storeStrong((id *)&self->_trimQueue, 0);
  objc_storeStrong((id *)&self->_sourcesToTransform, 0);
}

void __63__PXVideoTrimQueueController_editVideoViewControllerDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 48) & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 64));
    objc_msgSend(WeakRetained, "controller:didCancelTrimmingVideoSources:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  }
}

void __78__PXVideoTrimQueueController_editVideoViewController_didTrimVideoWithOptions___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__PXVideoTrimQueueController_editVideoViewController_didTrimVideoWithOptions___block_invoke_2;
  v2[3] = &unk_1E5148D08;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "performTransaction:", v2);

}

uint64_t __78__PXVideoTrimQueueController_editVideoViewController_didTrimVideoWithOptions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_trimVideoSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueTrimmingControl");
}

void __47__PXVideoTrimQueueController__trimVideoSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "could not generate trimmed video for %@ to %@ error %@", buf, 0x20u);
    }
  }
  else
  {
    v9 = objc_msgSend(a2, "copy");
    v6 = v9;
    if (*(_QWORD *)(a1 + 48))
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 56) + 40);
      -[NSObject absoluteString](v9, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, *(_QWORD *)(a1 + 48));

    }
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "generated trimmed video of %@ to %@ ", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "removeObject:", *(_QWORD *)(a1 + 64));
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(void **)(v15 + 56);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__PXVideoTrimQueueController__trimVideoSource___block_invoke_179;
  v17[3] = &unk_1E5148D08;
  v17[4] = v15;
  v18 = *(id *)(a1 + 72);
  objc_msgSend(v16, "performTransaction:", v17);

}

uint64_t __47__PXVideoTrimQueueController__trimVideoSource___block_invoke_179(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 48) & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 64));
    objc_msgSend(WeakRetained, "controller:didTrimVideoFromSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    v2 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v2 + 24), "count");
  if (!result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    if (!result)
      return objc_msgSend(*(id *)(a1 + 32), "_sendDidFinish");
  }
  return result;
}

uint64_t __53__PXVideoTrimQueueController__dequeueTrimmingControl__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTrimViewControllerForSource:", *(_QWORD *)(a1 + 40));
}

void __53__PXVideoTrimQueueController__dequeueTrimmingControl__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 48) & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 64));
    objc_msgSend(WeakRetained, "controller:didCancelTrimmingVideoSources:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  }
}

uint64_t __35__PXVideoTrimQueueController_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowVideoTooLongAlertForVideoSource:", v10, (_QWORD)v18))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    return objc_msgSend(*(id *)(a1 + 32), "_sendDidFinish");
  v11 = objc_opt_new();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = objc_opt_new();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 32);
  *(_QWORD *)(v15 + 32) = v14;

  return objc_msgSend(*(id *)(a1 + 32), "_dequeueTrimmingControl");
}

+ (BOOL)areVideoSourcesStreamShareSources:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

+ (id)photoLibraryFromSources:(id)a3 album:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;

      objc_msgSend(v5, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;

      if (v10)
      {
        v14 = v10;
      }
      else
      {
        if (!v13)
        {
          PLUIGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412290;
            v20 = objc_opt_class();
            _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Cannot retrieve photolibrary property from instance of class: %@", (uint8_t *)&v19, 0xCu);

          }
          goto LABEL_18;
        }
        v14 = v13;
      }
      objc_msgSend(v14, "photoLibrary");
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v15;
LABEL_18:

      goto LABEL_19;
    }
  }
  if (v6)
  {
    objc_msgSend(v6, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
LABEL_19:

  return v7;
}

+ (double)durationFromVideoAtURL:(id)a3
{
  void *v3;
  void *v4;
  double Seconds;
  void *v6;
  uint64_t v7;
  CMTime v9[2];

  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  Seconds = 0.0;
  if (v3)
  {
    memset(&v9[1], 0, sizeof(CMTime));
    objc_msgSend(v3, "duration");
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v9[0] = v9[1];
      Seconds = CMTimeGetSeconds(v9);
    }
  }

  return Seconds;
}

+ (id)videoInfoKeyForSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "copy");

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "mediaURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)objc_msgSend(v3, "copy");
  else
    v6 = 0;
LABEL_6:

  return v6;
}

@end
