@implementation PUMailActivity

- (PUMailActivity)init
{
  PUMailActivity *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUMailActivity;
  v2 = -[UIMailActivity init](&v4, sel_init);
  if (v2)
    BYTE3(v2->_strongSelf) = objc_msgSend(getMFMailComposeViewControllerClass(), "_canSendMailInNewScene");
  return v2;
}

- (void)_pu_cleanup
{
  MFMailComposeViewController *mailComposeViewController;
  UIViewController *referenceViewController;
  MFMailComposeViewController *mailComposeController;
  PHAsset *videoAssetBeingTrimmed;

  mailComposeViewController = self->super._mailComposeViewController;
  self->super._mailComposeViewController = 0;

  -[PUMailActivity _cleanupRemaker](self, "_cleanupRemaker");
  -[PUMailActivity _removeTempVideoRemakerFile](self, "_removeTempVideoRemakerFile");
  referenceViewController = self->_referenceViewController;
  self->_referenceViewController = 0;

  -[MFMailComposeViewController setDelegate:](self->_mailComposeController, "setDelegate:", 0);
  mailComposeController = self->_mailComposeController;
  self->_mailComposeController = 0;

  -[PHAsset setMailComposeDelegate:](self->_videoAssetBeingTrimmed, "setMailComposeDelegate:", 0);
  videoAssetBeingTrimmed = self->_videoAssetBeingTrimmed;
  self->_videoAssetBeingTrimmed = 0;

  BYTE4(self->_strongSelf) = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PUMailActivity _pu_cleanup](self, "_pu_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)PUMailActivity;
  -[UIMailActivity dealloc](&v3, sel_dealloc);
}

- (BOOL)_isMailDropEnabled
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableMailDrop");

  if ((v4 & 1) != 0)
    return 0;
  if (!BYTE1(self->_strongSelf))
  {
    BYTE2(self->_strongSelf) = objc_msgSend((id)objc_opt_class(), "isMailDropEnabled");
    BYTE1(self->_strongSelf) = 1;
  }
  return BYTE2(self->_strongSelf) != 0;
}

- (void)_showTrimViewControllerForVideo:(id)a3 maximumTrimDuration:(double)a4 trimButtonTitle:(id)a5
{
  UIViewController *v8;
  MFMailComposeViewController *mailComposeController;
  id v10;
  UIViewController *referenceViewController;
  UIViewController *v12;
  MFMailComposeViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  MFMailComposeViewController *v17;
  MFMailComposeViewController *v18;
  void *v19;
  id v20;

  v8 = (UIViewController *)a3;
  mailComposeController = self->_mailComposeController;
  v10 = a5;
  -[MFMailComposeViewController setDelegate:](mailComposeController, "setDelegate:", 0);
  referenceViewController = self->_referenceViewController;
  self->_referenceViewController = v8;
  v12 = v8;

  -[UIViewController pl_managedAsset](v12, "pl_managedAsset");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (MFMailComposeViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714C8]), "initWithPhoto:trimTitle:", v20, v10);

  -[MFMailComposeViewController setDelegate:](v13, "setDelegate:", self);
  v14 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E0DC4CB8], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DC5928], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DC5870], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewController setImagePickerOptions:](v13, "setImagePickerOptions:", v16);

  v17 = self->_mailComposeController;
  self->_mailComposeController = v13;
  v18 = v13;

  -[MFMailComposeViewController setParentInPopoverException:](self->_mailComposeController, "setParentInPopoverException:", 1);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v18);
  -[MFMailComposeViewController presentViewController:animated:completion:](self->super._mailComposeViewController, "presentViewController:animated:completion:", v19, 1, 0);

}

- (BOOL)_showTrimViewControllerIfNeededForVideoAsset:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "pl_managedAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71B20], "durationForManagedAsset:applyVideoAdjustments:", v5, 1);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D714D0], "maximumDurationForTrimMode:", 2);
  v9 = v8;
  if (v7 > v8)
  {
    PLLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUMailActivity _showTrimViewControllerForVideo:maximumTrimDuration:trimButtonTitle:](self, "_showTrimViewControllerForVideo:maximumTrimDuration:trimButtonTitle:", v4, v10, v9);

  }
  return v7 > v9;
}

- (void)_remakeAndSendVideoAsset:(id)a3 withTrimStartTime:(double)a4 endTime:(double)a5
{
  id v8;
  PLUIEditVideoViewController *v9;
  PLUIEditVideoViewController *editVideoViewController;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];

  v8 = a3;
  -[PLUIEditVideoViewController removeFromSuperview](self->_editVideoViewController, "removeFromSuperview");
  v9 = (PLUIEditVideoViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B0]), "initWithFrame:", 0.0, 0.0, 0.0, 45.0);
  editVideoViewController = self->_editVideoViewController;
  self->_editVideoViewController = v9;

  -[PUMailActivity itemSourceController](self, "itemSourceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "mailActivity:displayVideoRemakerProgressView:", self, self->_editVideoViewController);
  v15 = v8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke;
  v16[3] = &unk_1E58AA448;
  v16[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke_2;
  v14[3] = &unk_1E58A5BF8;
  v14[4] = self;
  v13 = v8;
  -[PUMailActivity remakeVideoAsset:withTrimStartTime:endTime:progressHandler:completionHandler:](self, "remakeVideoAsset:withTrimStartTime:endTime:progressHandler:completionHandler:", v13, v16, v14, a4, a5);

}

- (void)cancelRemaking
{
  if (self->_remakerProgressView)
  {
    -[PUMailActivity _setRemakerWasCancelled:](self, "_setRemakerWasCancelled:", 1);
    -[PLProgressView cancel](self->_remakerProgressView, "cancel");
  }
}

- (void)_transcodeAndSendVideo:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[PUMailActivity _showTrimViewControllerIfNeededForVideoAsset:](self, "_showTrimViewControllerIfNeededForVideoAsset:"))-[PUMailActivity _remakeAndSendVideoAsset:withTrimStartTime:endTime:](self, "_remakeAndSendVideoAsset:withTrimStartTime:endTime:", v4, 0.0, 0.0);

}

- (void)remakeVideoAsset:(id)a3 withTrimStartTime:(double)a4 endTime:(double)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__PUMailActivity_remakeVideoAsset_withTrimStartTime_endTime_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E58A2488;
  v18[4] = self;
  v19 = v12;
  v22 = a4;
  v23 = a5;
  v20 = v14;
  v21 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

- (void)_cleanupRemaker
{
  PLVideoRemaker *videoRemaker;
  PLProgressView *remakerProgressView;

  videoRemaker = self->_videoRemaker;
  self->_videoRemaker = 0;

  remakerProgressView = self->_remakerProgressView;
  self->_remakerProgressView = 0;

}

- (void)_removeTempVideoRemakerFile
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUMailActivity transcodedVideoFilePath](self, "transcodedVideoFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    -[PUMailActivity transcodedVideoFilePath](self, "transcodedVideoFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      PLShareSheetGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "[PUMailActivity] Removing temporary video remake file at URL: %{public}@", buf, 0xCu);
      }

      -[PUMailActivity setTranscodedVideoFilePath:](self, "setTranscodedVideoFilePath:", 0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v10 = objc_msgSend(v9, "removeItemAtURL:error:", v7, &v13);
      v11 = v13;

      if ((v10 & 1) == 0)
      {
        PLShareSheetGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v15 = v7;
          v16 = 2114;
          v17 = v11;
          _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "[PUMailActivity] Failed to clean up temporary video remake file at URL (%{public}@): %{public}@", buf, 0x16u);
        }

      }
    }

  }
}

- (void)videoRemakerDidBeginRemaking:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PUMailActivity_videoRemakerDidBeginRemaking___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  if (-[PUMailActivity _remakerWasCancelled](self, "_remakerWasCancelled") || !objc_msgSend(v5, "length"))
  {

    v5 = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PUMailActivity_videoRemakerDidEndRemaking_temporaryPath___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)_composeMailForVideo:(id)a3 trimmedFilePath:(id)a4
{
  id v6;
  PHAsset *v7;
  id v8;
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
  _QWORD v20[5];
  PHAsset *v21;

  v6 = a4;
  v7 = self->_videoAssetBeingTrimmed;
  v8 = a3;
  -[PHAsset setMailComposeDelegate:](v7, "setMailComposeDelegate:", self);
  objc_msgSend(v8, "pl_managedAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pathForVideoFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    objc_msgSend(v11, "stringByDeletingPathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathExtension:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v6;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v10, 1, 0);
  v16 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v10, "pathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "typeWithFilenameExtension:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "preferredMIMEType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset addAttachmentData:mimeType:fileName:](v7, "addAttachmentData:mimeType:fileName:", v15, v19, v12);

  if (BYTE3(self->_strongSelf))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__PUMailActivity__composeMailForVideo_trimmedFilePath___block_invoke;
    v20[3] = &unk_1E58AAE08;
    v20[4] = self;
    v21 = v7;
    -[PHAsset _presentComposeInNewWindowWithCompletion:](v21, "_presentComposeInNewWindowWithCompletion:", v20);

  }
  else
  {
    -[MFMailComposeViewController presentViewController:animated:completion:](self->super._mailComposeViewController, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (BOOL)_momentShareLinkDidFail
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUMailActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "momentSharePublishAttempted"))
  {
    objc_msgSend(v2, "publishedURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUMailActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "preferredPreparationType") == 1)
  {
    v6 = -[PUMailActivity _canPerformWithLink](self, "_canPerformWithLink");
  }
  else
  {
    v6 = -[PUMailActivity _canPerformForIndividualAssetsWithActivityItems:](self, "_canPerformForIndividualAssetsWithActivityItems:", v4);
    objc_msgSend(v5, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "cmmShareSheetBehavior");

      objc_msgSend(v5, "assets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = PXCMMHasSendAndReceiveCapabilities();
        if (v10 == 3)
          v15 = v14;
        else
          v15 = 0;
        v6 |= v15;
      }
      else
      {
        PLSharingGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 138412290;
          v19 = v5;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Mail Activity: Photo library was nil, so returning unable to determine if CMM is enabled. Item source controller: %@", (uint8_t *)&v18, 0xCu);
        }

      }
    }
  }

  return v6;
}

- (BOOL)_canPerformWithLink
{
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_momentShareLinkPrompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PUMailActivity;
  LOBYTE(self) = -[UIMailActivity canPerformWithActivityItems:](&v6, sel_canPerformWithActivityItems_, v4);

  return (char)self;
}

- (BOOL)_canPerformForIndividualAssetsWithActivityItems:(id)a3
{
  unsigned int v4;
  BOOL v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  _OWORD v15[4];
  uint64_t v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PUMailActivity;
  v4 = -[UIMailActivity canPerformWithActivityItems:](&v22, sel_canPerformWithActivityItems_, a3);
  if ((v4 & 1) != 0)
  {
    v5 = -[PUMailActivity _isMailDropEnabled](self, "_isMailDropEnabled");
    -[PUMailActivity itemSourceController](self, "itemSourceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = 0;
      LOBYTE(v8) = 1;
      goto LABEL_12;
    }
  }
  else
  {
    -[PUMailActivity itemSourceController](self, "itemSourceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    *(_OWORD *)buf = 0u;
    v18 = 0u;
    if (v6)
      objc_msgSend(v6, "requestAssetsMediaTypeCount");
    v11 = (void *)objc_opt_class();
    v15[2] = v19;
    v15[3] = v20;
    v16 = v21;
    v15[0] = *(_OWORD *)buf;
    v15[1] = v18;
    v7 = 0;
    v8 = v4 & objc_msgSend(v11, "canPerformActivityWithTotalCount:assetMediaTypeCount:", v10, v15);
    if (*(_QWORD *)&buf[8] == 1 && v10 == 1)
      v7 = (_QWORD)v18 == 0;
  }
  else
  {
    v7 = 0;
    LOBYTE(v8) = 0;
  }
LABEL_12:
  if (objc_msgSend(v6, "shouldShareAsUnmodifiedOriginals"))
  {
    LOBYTE(self->_strongSelf) = 0;
  }
  else
  {
    v12 = objc_msgSend(v6, "preferredExportFormat") != 1 && v7;
    LOBYTE(self->_strongSelf) = v12;
    if (v12)
    {
      PLSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "Share Sheet: Mail Activity: Single video being shared to Mail without Mail Drop; will attempt to re-transcode "
          "to an acceptable attachment size when sharing",
          buf,
          2u);
      }

    }
  }

  return v8;
}

- (void)_prepareWithMomentShareLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_super v15;
  objc_super v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CD1680], "fetchLocalMomentShareFromShareURL:error:options:", v4, &v17, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (!v7)
    {
      PLSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "pl_redactedShareURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Share Sheet: Mail activity failed to fetch moment share for URL: %{public}@ with error: %@", buf, 0x16u);

      }
    }
    objc_msgSend((id)objc_opt_class(), "_momentShareLinkActivityItemsForURL:momentShare:", v4, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)PUMailActivity;
    -[UIMailActivity prepareWithActivityItems:](&v16, sel_prepareWithActivityItems_, v11);
    objc_msgSend((id)objc_opt_class(), "_momentShareLinkSubjectForMomentShare:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUMailActivity mailComposeViewController](self, "mailComposeViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSubject:", v12);

  }
  else
  {
    PLSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Share Sheet: No Moment Share URL to prepare for Mail activity", buf, 2u);
    }

    v15.receiver = self;
    v15.super_class = (Class)PUMailActivity;
    -[UIMailActivity prepareWithActivityItems:](&v15, sel_prepareWithActivityItems_, MEMORY[0x1E0C9AA60]);
  }

}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PHAsset *v18;
  PHAsset *v19;
  PHAsset *videoAssetBeingTrimmed;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUMailActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "publishedURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUMailActivity _prepareWithMomentShareLink:](self, "_prepareWithMomentShareLink:", v7);

LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[PUMailActivity itemSourceController](self, "itemSourceController", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetItemSources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "asset");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    -[PUMailActivity mailComposeViewController](self, "mailComposeViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPhotoIDs:", v8);

    goto LABEL_11;
  }
  if (!LOBYTE(self->_strongSelf))
  {
    v25.receiver = self;
    v25.super_class = (Class)PUMailActivity;
    -[UIMailActivity prepareWithActivityItems:](&v25, sel_prepareWithActivityItems_, v4);
    goto LABEL_3;
  }
  if ((objc_msgSend(getMFMailComposeViewControllerClass(), "canSendMail") & 1) == 0)
  {
    +[PUMailActivity openEmailAccountPrefs](PUMailActivity, "openEmailAccountPrefs");
    goto LABEL_11;
  }
  v18 = (PHAsset *)objc_alloc_init((Class)getMFMailComposeViewControllerClass());
  if (v18)
  {
    v19 = v18;
    -[PHAsset setMailComposeDelegate:](v18, "setMailComposeDelegate:", self);
    -[PHAsset setMailComposeDelegate:](self->_videoAssetBeingTrimmed, "setMailComposeDelegate:", 0);
    videoAssetBeingTrimmed = self->_videoAssetBeingTrimmed;
    self->_videoAssetBeingTrimmed = v19;

    goto LABEL_3;
  }
LABEL_11:

}

- (id)activityViewController
{
  objc_super v4;

  if (-[PUMailActivity _momentShareLinkDidFail](self, "_momentShareLinkDidFail"))
    return 0;
  if (LOBYTE(self->_strongSelf))
    return self->_videoAssetBeingTrimmed;
  v4.receiver = self;
  v4.super_class = (Class)PUMailActivity;
  -[UIMailActivity activityViewController](&v4, sel_activityViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mailComposeViewController
{
  objc_super v4;

  if (-[PUMailActivity _momentShareLinkDidFail](self, "_momentShareLinkDidFail") || LOBYTE(self->_strongSelf))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PUMailActivity;
  -[UIMailActivity mailComposeViewController](&v4, sel_mailComposeViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v20;
  uint8_t v21[16];
  objc_super v22;

  v6 = a4;
  v10 = a3;
  v11 = a5;
  if (LOBYTE(self->_strongSelf))
  {
    if ((objc_msgSend(getMFMailComposeViewControllerClass(), "canSendMail") & 1) != 0)
    {
      objc_storeStrong((id *)&self->super._mailComposeViewController, a3);
      PLSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "Share Sheet: Mail Activity: Trimming and/or re-transcode single video to an acceptable attachment size...", v21, 2u);
      }

      -[PUMailActivity itemSourceController](self, "itemSourceController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count") == 1)
      {
        objc_msgSend(v14, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isVideo"))
        {
          objc_msgSend(v14, "lastObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v16, "pl_managedAsset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMailActivity.m"), 685, CFSTR("expect single video"));

      }
      -[PUMailActivity _transcodeAndSendVideo:](self, "_transcodeAndSendVideo:", v16);

      v17 = 1;
    }
    else
    {
      +[PUMailActivity openEmailAccountPrefs](PUMailActivity, "openEmailAccountPrefs");
      v17 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)PUMailActivity;
    v17 = -[UIMailActivity _presentActivityOnViewController:animated:completion:](&v22, sel__presentActivityOnViewController_animated_completion_, v10, v6, v11);
  }

  return v17;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6;
  objc_super v8;

  if (BYTE4(self->_strongSelf))
  {
    v6 = 1;
    -[PHAsset dismissViewControllerAnimated:completion:](self->_videoAssetBeingTrimmed, "dismissViewControllerAnimated:completion:", 1, a5);
    BYTE4(self->_strongSelf) = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUMailActivity;
    return -[UIMailActivity _dismissActivityFromViewController:animated:completion:](&v8, sel__dismissActivityFromViewController_animated_completion_, a3, a4, a5);
  }
  return v6;
}

- (void)performActivity
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (-[PUMailActivity _momentShareLinkDidFail](self, "_momentShareLinkDidFail"))
  {
    PLSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_ERROR, "Share Sheet: Immediately failing Mail activity for missing Moment Share URL", buf, 2u);
    }

    -[PUMailActivity activityDidFinish:](self, "activityDidFinish:", 0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PUMailActivity;
    -[UIActivity performActivity](&v4, sel_performActivity);
  }
}

- (void)activityDidFinish:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUMailActivity;
  -[UIActivity activityDidFinish:](&v4, sel_activityDidFinish_, a3);
  -[PUMailActivity _pu_cleanup](self, "_pu_cleanup");
}

- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  MFMailComposeViewController *mailComposeViewController;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v13[5];

  mailComposeViewController = self->super._mailComposeViewController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PUMailActivity_editVideoViewController_didTrimVideoWithOptions___block_invoke;
  v13[3] = &unk_1E58ABD10;
  v13[4] = self;
  v6 = a4;
  -[MFMailComposeViewController dismissViewControllerAnimated:completion:](mailComposeViewController, "dismissViewControllerAnimated:completion:", 1, v13);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC5938]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC5930]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  -[PUMailActivity _remakeAndSendVideoAsset:withTrimStartTime:endTime:](self, "_remakeAndSendVideoAsset:withTrimStartTime:endTime:", self->_referenceViewController, v9, v12);
}

- (void)editVideoViewControllerDidCancel:(id)a3
{
  MFMailComposeViewController *mailComposeViewController;
  _QWORD v4[5];

  mailComposeViewController = self->super._mailComposeViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PUMailActivity_editVideoViewControllerDidCancel___block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  -[MFMailComposeViewController dismissViewControllerAnimated:completion:](mailComposeViewController, "dismissViewControllerAnimated:completion:", 1, v4);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PUMailActivity activityDidFinish:](self, "activityDidFinish:", (unint64_t)(a4 - 1) < 2);
}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_shouldTranscodeSingleVideo);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_shouldTranscodeSingleVideo, a3);
}

- (BOOL)_remakerWasCancelled
{
  return BYTE5(self->_strongSelf);
}

- (void)_setRemakerWasCancelled:(BOOL)a3
{
  BYTE5(self->_strongSelf) = a3;
}

- (NSString)transcodedVideoFilePath
{
  return (NSString *)self->_itemSourceController;
}

- (void)setTranscodedVideoFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSourceController, 0);
  objc_destroyWeak((id *)&self->_shouldTranscodeSingleVideo);
  objc_storeStrong(&self->_remakerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_videoRemaker, 0);
  objc_storeStrong((id *)&self->_remakerProgressView, 0);
  objc_storeStrong((id *)&self->_editVideoViewController, 0);
  objc_storeStrong((id *)&self->_mailComposeController, 0);
  objc_storeStrong((id *)&self->_videoAssetBeingTrimmed, 0);
  objc_storeStrong((id *)&self->_referenceViewController, 0);
  objc_storeStrong((id *)&self->super._mailComposeViewController, 0);
}

uint64_t __51__PUMailActivity_editVideoViewControllerDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 200);
  *(_QWORD *)(v2 + 200) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

void __66__PUMailActivity_editVideoViewController_didTrimVideoWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 200);
  *(_QWORD *)(v2 + 200) = 0;

}

uint64_t __55__PUMailActivity__composeMailForVideo_trimmedFilePath___block_invoke(uint64_t result, char a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if ((a2 & 1) == 0)
  {
    v2 = result;
    PLSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_ERROR, "Share Sheet: Failed to present mail compose in new window. Presenting modally instead.", v4, 2u);
    }

    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 176), "presentViewController:animated:completion:", *(_QWORD *)(v2 + 40), 1, 0);
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 244) = 1;
  }
  return result;
}

void __59__PUMailActivity_videoRemakerDidEndRemaking_temporaryPath___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[PUPhotoSharingManager sharedInstance](PUPhotoSharingManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemaking:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setTranscodedVideoFilePath:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[28];
  if (v4)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(v3[28], *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v3, "_cleanupRemaker");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = 0;

}

void __47__PUMailActivity_videoRemakerDidBeginRemaking___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(a1 + 32));
  +[PUPhotoSharingManager sharedInstance](PUPhotoSharingManager, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRemaking:", 1);

}

void __95__PUMailActivity_remakeVideoAsset_withTrimStartTime_endTime_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupRemaker");
  objc_msgSend(*(id *)(a1 + 32), "_setRemakerWasCancelled:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_removeTempVideoRemakerFile");
  v2 = _Block_copy(*(const void **)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 224);
  *(_QWORD *)(v3 + 224) = v2;

  objc_msgSend(*(id *)(a1 + 40), "pl_managedAsset");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D714D0]), "initWithManagedAsset:applyVideoAdjustments:", v10, 1);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setDelegate:");
  if (*(double *)(a1 + 64) > 0.0 || *(double *)(a1 + 72) > 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setTrimStartTime:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setTrimEndTime:", *(double *)(a1 + 72));
  }
  objc_msgSend(*(id *)(a1 + 40), "descriptionProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setCustomAccessibilityLabel:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setMode:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setProgressHandler:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setShouldExportToPhotoDataDirectory:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "remake");

}

uint64_t __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setPercentComplete:", a2);
}

void __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeFromSuperview");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 208);
  *(_QWORD *)(v3 + 208) = 0;

  v5 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v5, "_composeMailForVideo:trimmedFilePath:", *(_QWORD *)(a1 + 40), v6);
  else
    objc_msgSend(v5, "activityDidFinish:", 0);

}

+ (id)_momentShareLinkPrompt
{
  return (id)PXLocalizedString();
}

+ (id)_momentShareLinkSubjectForMomentShare:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (!v3 || (PXCMMTitleAndSubtitleForAssetCollection(), v4 = 0, 0, !v4))
  {
    PXLocalizedString();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)_momentShareLinkTitleForMomentShare:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  PXCMMTitleAndSubtitleForAssetCollection();
  v3 = 0;
  v4 = 0;
  if (objc_msgSend(v3, "length"))
  {
    if (v4)
    {
      PXLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PUStringWithValidatedFormat();
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v3;
    }
    PXScaledValueForTextStyleWithSymbolicTraits();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DC1138];
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_expirationStringForMomentShare:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "expiryDate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "expiryDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXCMMStringForExpiryDate();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PXScaledValueForTextStyleWithSymbolicTraits();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DC1138];
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_momentShareLinkActivityItemsForURL:(id)a3 momentShare:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUMailActivity.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_momentShareLinkPrompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("\n"));
  v11 = objc_claimAutoreleasedReturnValue();

  PXScaledValueForTextStyleWithSymbolicTraits();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
  v12 = objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0DC1138];
  v30[0] = v12;
  v25 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v11;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v13);
  objc_msgSend(v9, "addObject:", v14);
  v15 = v8;
  objc_msgSend((id)objc_opt_class(), "_momentShareLinkTitleForMomentShare:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v9, "addObject:", v16);
  v27 = *MEMORY[0x1E0DC1160];
  v28 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v7, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v17);

  objc_msgSend(v9, "addObject:", v20);
  objc_msgSend((id)objc_opt_class(), "_expirationStringForMomentShare:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E58AD278);
    objc_msgSend(v9, "addObject:", v22);
    objc_msgSend(v9, "addObject:", v21);

  }
  return v9;
}

+ (BOOL)isMailDropEnabled
{
  void *v2;
  char v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableMailDrop");

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedPrimaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v4 = objc_msgSend(v6, "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)canPerformActivityWithTotalCount:(unint64_t)a3 assetMediaTypeCount:(PXAssetMediaTypeCount *)a4
{
  unint64_t var0;
  unint64_t var1;
  void *v7;
  unint64_t v8;
  BOOL v9;
  BOOL v11;
  BOOL v12;

  var0 = a4->var0;
  var1 = a4->var1;
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxMailPhotoLimit");

  if (v8)
    v9 = var0 > v8;
  else
    v9 = 0;
  v11 = !v9 && var1 < 2;
  if (var0)
    v12 = var1 == 0;
  else
    v12 = 1;
  return v12 && var1 + var0 >= a3 && v11;
}

+ (BOOL)canPerformActivityAsIndividualItemsInSourceController:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _OWORD v10[4];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v4 = a3;
  if ((objc_msgSend(a1, "isMailDropEnabled") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v16 = 0;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      if (v4)
        objc_msgSend(v4, "requestAssetsMediaTypeCount");
      v8 = (void *)objc_opt_class();
      v10[2] = v14;
      v10[3] = v15;
      v11 = v16;
      v10[0] = v12;
      v10[1] = v13;
      v5 = objc_msgSend(v8, "canPerformActivityWithTotalCount:assetMediaTypeCount:", v7, v10);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)allowedToModifyEmailAccounts
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v19 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
    v14 = &unk_1E58AAEB0;
    v15 = &v16;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v11);
    v2 = (void *)v17[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v3, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = (uint64_t)&v11;
  v13 = 0x2020000000;
  v5 = (_QWORD *)getMCFeatureAccountModificationAllowedSymbolLoc_ptr;
  v14 = (void *)getMCFeatureAccountModificationAllowedSymbolLoc_ptr;
  if (!getMCFeatureAccountModificationAllowedSymbolLoc_ptr)
  {
    v6 = ManagedConfigurationLibrary();
    v5 = dlsym(v6, "MCFeatureAccountModificationAllowed");
    *(_QWORD *)(v12 + 24) = v5;
    getMCFeatureAccountModificationAllowedSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *v5) != 2;

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCFeatureAccountModificationAllowed(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PUMailActivity.m"), 63, CFSTR("%s"), dlerror(), v11);

    __break(1u);
  }
  return result;
}

+ (void)openEmailAccountPrefs
{
  id v2;

  if (!objc_msgSend(a1, "allowedToModifyEmailAccounts"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempted to access restricted account settings"), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  objc_msgSend(MEMORY[0x1E0D7BAD8], "navigateToDestination:completion:", 8, 0);
}

@end
