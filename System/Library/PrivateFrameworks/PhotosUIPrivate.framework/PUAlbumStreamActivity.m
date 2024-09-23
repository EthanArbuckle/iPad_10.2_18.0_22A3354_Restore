@implementation PUAlbumStreamActivity

- (PUAlbumStreamActivity)init
{
  PUAlbumStreamActivity *v2;
  PUAlbumStreamActivity *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumStreamActivity;
  v2 = -[UIActivity init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isPresentedFromActivityViewController = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.photos.PUAlbumStreamActivity", v4);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BC88];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("PUBLISH_ALBUM_STREAMING_SERVICE"));
}

- (id)_systemImageName
{
  return CFSTR("rectangle.stack.badge.person.crop");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "sharedStreamsEnabledForPhotoLibraryURL:", v5);

  if (v6)
  {
    -[PUAlbumStreamActivity itemSourceController](self, "itemSourceController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isPreparingIndividualItems"))
    {
      objc_msgSend(v7, "assets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = +[PUAlbumStreamActivity canPerformWithAssets:](PUAlbumStreamActivity, "canPerformWithAssets:", v8);

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  id v5;

  -[PUAlbumStreamActivity itemSourceController](self, "itemSourceController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumStreamActivity prepareWithAssets:](self, "prepareWithAssets:", v4);

}

- (void)_prepareWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  UIViewController *v18;
  UIViewController *activityController;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUAlbumStreamActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "assets");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "shouldExcludeCaptionInAllItemSources");
  v10 = 0;
  if (objc_msgSend(v8, "count") == 1 && (v9 & 1) == 0)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchPropertySetsIfNeeded");
    objc_msgSend(v11, "descriptionProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      PLShareSheetGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v13;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Sharing single asset which has a caption. Setting as starting text for posting as a comment: %@", (uint8_t *)&v20, 0xCu);
      }

      v10 = v13;
    }
    else
    {
      v10 = 0;
    }

  }
  objc_msgSend(v6, "shouldExcludeLivenessInAllItemSources");
  objc_msgSend(v6, "shouldExcludeLocationInAllItemSources");
  PXSharedAlbumsDefaultAssetCreationOptions();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D7B948]);
  objc_msgSend(v8, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (UIViewController *)objc_msgSend(v16, "initWithAssets:batchComment:options:", v17, v10, v15);

  -[UIViewController setActionControllerDelegate:](v18, "setActionControllerDelegate:", self);
  activityController = self->_activityController;
  self->_activityController = v18;

}

- (void)prepareWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
  {
    -[PUAlbumStreamActivity _prepareWithAssets:](self, "_prepareWithAssets:", v4);
  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D719A8], "cloudSharingPhotoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "albumListForContentMode:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v6, "albums", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v7);
            if (-[PUAlbumStreamActivity _sharedAlbumAllowsAdding:](self, "_sharedAlbumAllowsAdding:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)))
            {
              v8 = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      v8 = 0;
    }
    -[PUAlbumStreamActivity _createStreamsPickerContainerWithExisting:assets:](self, "_createStreamsPickerContainerWithExisting:assets:", v8, v4);
  }

}

- (id)activityViewController
{
  return self->_activityController;
}

- (void)_createStreamsPickerContainerWithExisting:(BOOL)a3 assets:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  PUPhotoStreamComposeServiceViewController *v18;
  PUPhotoStreamComposeServiceViewController *streamComposeViewController;
  PUPhotoStreamComposeServiceViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  PUPhotoStreamComposeServiceViewController *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PUAlbumStreamActivity itemSourceController](self, "itemSourceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "assets");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;
  objc_initWeak(&location, self);
  v11 = objc_msgSend(v8, "shouldExcludeCaptionInAllItemSources");
  if (objc_msgSend(v10, "count") == 1)
    v12 = v11;
  else
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchPropertySetsIfNeeded");
    objc_msgSend(v14, "descriptionProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      PLShareSheetGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v16;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Sharing single asset which has a caption. Setting as starting text for posting as a comment: %@", buf, 0xCu);
      }

      v13 = v16;
    }
    else
    {
      v13 = 0;
    }

  }
  v18 = -[PUPhotoStreamComposeServiceViewController initWithStartingContentText:]([PUPhotoStreamComposeServiceViewController alloc], "initWithStartingContentText:", v13);
  streamComposeViewController = self->_streamComposeViewController;
  self->_streamComposeViewController = v18;

  -[PUPhotoStreamComposeServiceViewController setDelegate:](self->_streamComposeViewController, "setDelegate:", self);
  -[PXPhotoStreamComposeServiceViewController setAddToExistingWorkflow:](self->_streamComposeViewController, "setAddToExistingWorkflow:", v4);
  -[PUPhotoStreamComposeServiceViewController setAssetsToShare:](self->_streamComposeViewController, "setAssetsToShare:", v10);
  v20 = self->_streamComposeViewController;
  PULocalizedString(CFSTR("STREAM_COMMENT_PLACEHOLDER_TEXT"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController setPlaceholderText:](v20, "setPlaceholderText:", v21);

  -[PUPhotoStreamComposeServiceViewController setModalPresentationStyle:](self->_streamComposeViewController, "setModalPresentationStyle:", 17);
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceLevel:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamComposeServiceViewController presentationController](self->_streamComposeViewController, "presentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOverrideTraitCollection:", v22);

  v24 = self->_streamComposeViewController;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__PUAlbumStreamActivity__createStreamsPickerContainerWithExisting_assets___block_invoke;
  v27[3] = &unk_1E589C608;
  v25 = v10;
  v28 = v25;
  objc_copyWeak(&v30, &location);
  v26 = v6;
  v29 = v26;
  -[PXPhotoStreamComposeServiceViewController setCompletion:](v24, "setCompletion:", v27);
  objc_storeStrong((id *)&self->_activityController, self->_streamComposeViewController);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)_handleDismissWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *WeakRetained;
  uint8_t v8[16];

  v3 = a3;
  if (!a3)
  {
    PLShareSheetGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Sharing to shared albums was cancelled. Cleaning up temporarily exported files", v8, 2u);
    }

    -[PUAlbumStreamActivity _cleanupTemporaryFiles](self, "_cleanupTemporaryFiles");
  }
  if (-[PUAlbumStreamActivity isPresentedFromActivityViewController](self, "isPresentedFromActivityViewController"))
  {
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", v3);
  }
  else
  {
    -[PXActivity actionDelegate](self, "actionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v3)
      {
        WeakRetained = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "activity:didFinishWithSuccess:error:", self, v3, WeakRetained);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_referenceViewController);
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    }

  }
}

- (BOOL)_sharedAlbumAllowsAdding:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "canContributeToCloudSharedAlbum"))
    v4 = objc_msgSend(v3, "canPerformEditOperation:", 4);
  else
    v4 = 0;

  return v4;
}

- (void)_performPresentationOnViewController:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  UIViewController *activityController;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D7B570];
  v8 = a3;
  if (objc_msgSend(v7, "isLemonadeUIEnabled"))
    v9 = 16;
  else
    v9 = 17;
  -[UIViewController setModalPresentationStyle:](self->_activityController, "setModalPresentationStyle:", v9);
  activityController = self->_activityController;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PUAlbumStreamActivity__performPresentationOnViewController_completion___block_invoke;
  v12[3] = &unk_1E58ABAC8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "presentViewController:animated:completion:", activityController, 1, v12);

}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PUAlbumStreamActivity _performPresentationOnViewController:completion:](self, "_performPresentationOnViewController:completion:", a3, a5);
  return 1;
}

- (void)presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a3;
  v8 = a5;
  if (v7)
  {
    objc_storeWeak((id *)&self->_referenceViewController, v7);
    -[PUAlbumStreamActivity _performPresentationOnViewController:completion:](self, "_performPresentationOnViewController:completion:", v7, v8);
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Presenting the activity controller requires either a concrete view controller or adoption of delegate methods for presenting and dismissing.", v10, 2u);
    }

  }
}

- (void)_cleanupTemporaryFiles
{
  void *v3;
  NSURL *exportCopyDirectoryParent;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSURL *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  NSURL *v14;
  id v15;
  uint8_t buf[4];
  NSURL *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  exportCopyDirectoryParent = self->_exportCopyDirectoryParent;
  v15 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", exportCopyDirectoryParent, &v15);
  v6 = v15;

  PLShareSheetGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_exportCopyDirectoryParent;
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      v10 = "Removed existing folder at URL: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 12;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = self->_exportCopyDirectoryParent;
    *(_DWORD *)buf = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v6;
    v10 = "Did not remove folder at URL: %@, error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
    goto LABEL_6;
  }

}

- (void)_prepareToPost:(id)a3 albumName:(id)a4 recipients:(id)a5 comments:(id)a6 assets:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *serialQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PUAlbumStreamActivity__prepareToPost_albumName_recipients_comments_assets___block_invoke;
  block[3] = &unk_1E58A8660;
  objc_copyWeak(&v29, &location);
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_prepareToPostAsync:(id)a3 albumName:(id)a4 recipients:(id)a5 comments:(id)a6 assets:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  NSURL *v15;
  NSURL *exportCopyDirectoryParent;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id buf;
  _QWORD v53[4];
  id v54;
  PUAlbumStreamActivity *v55;
  id v56;
  id v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v41 = a4;
  v39 = a5;
  v38 = a6;
  v12 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D719E0], "customSharedAlbumsExportsOutputDirectoryParent");
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  exportCopyDirectoryParent = self->_exportCopyDirectoryParent;
  self->_exportCopyDirectoryParent = v15;

  PLShareSheetGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Sharing to shared albums. Cleaning up temporarily exported files", (uint8_t *)&buf, 2u);
  }

  -[PUAlbumStreamActivity _cleanupTemporaryFiles](self, "_cleanupTemporaryFiles");
  -[PUAlbumStreamActivity itemSourceController](self, "itemSourceController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = MEMORY[0x1E0C809B0];
  v40 = v12;
  if (v18)
  {
    objc_msgSend(v18, "assetItemSources");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v20;
    v53[1] = 3221225472;
    v53[2] = __82__PUAlbumStreamActivity__prepareToPostAsync_albumName_recipients_comments_assets___block_invoke;
    v53[3] = &unk_1E589C630;
    v22 = v19;
    v54 = v22;
    v55 = self;
    v56 = v13;
    v57 = v14;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v53);

    objc_msgSend(v22, "assets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLShareSheetGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "Code which should be unreachable has been reached", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v12, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v20;
  v27 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "px_orderedAssetsFromAssets:sortDescriptors:", v24, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&buf, self);
  block[0] = v26;
  block[1] = 3221225472;
  block[2] = __82__PUAlbumStreamActivity__prepareToPostAsync_albumName_recipients_comments_assets___block_invoke_171;
  block[3] = &unk_1E589C658;
  objc_copyWeak(&v51, &buf);
  v44 = v42;
  v45 = v41;
  v46 = v39;
  v47 = v38;
  v48 = v30;
  v49 = v14;
  v50 = v13;
  v31 = v13;
  v32 = v14;
  v33 = v30;
  v34 = v38;
  v35 = v39;
  v36 = v41;
  v37 = v42;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&buf);

}

- (void)_trimAssetsToPost:(id)a3 albumName:(id)a4 recipients:(id)a5 comments:(id)a6 assets:(id)a7 assetsSharingInfo:(id)a8 customExportsInfo:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  PXVideoTrimQueueController *v24;
  PXVideoTrimQueueController *trimController;
  id v26;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CD1390], "pl_managedAssetsForAssets:", v18);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D719A8], "cloudSharingPhotoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (PXVideoTrimQueueController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BBE0]), "initWithPhotoLibrary:videoSources:videoSourcesSharingInfo:customExportsInfo:album:", v23, v26, v17, v16, v22);

  trimController = self->_trimController;
  self->_trimController = v24;

  -[PXVideoTrimQueueController setAlbumName:](self->_trimController, "setAlbumName:", v21);
  -[PXVideoTrimQueueController setRecipients:](self->_trimController, "setRecipients:", v20);

  -[PXVideoTrimQueueController setCommentText:](self->_trimController, "setCommentText:", v19);
  -[PXVideoTrimQueueController setDelegate:](self->_trimController, "setDelegate:", self);
  -[PXVideoTrimQueueController start](self->_trimController, "start");

}

- (void)_publishAssets:(id)a3 withSharingInfos:(id)a4 customExportsInfo:(id)a5 andTrimmedVideoPathInfo:(id)a6 comment:(id)a7 toAlbum:(id)a8 isNewAlbum:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(void);

  v24 = (void (**)(void))a10;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("uuid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "publishBatchOfOriginalAssetUUIDs:withBatchCommentText:assetsSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:isNewAlbum:", v21, v23, v20, v19, v18, a9);
  if (v24)
    v24[2]();

}

- (void)_publishAssets:(id)a3 withSharingInfos:(id)a4 customExportsInfo:(id)a5 andTrimmedVideoPathInfo:(id)a6 comment:(id)a7 invitationRecipients:(id)a8 wantsPublicWebsite:(BOOL)a9 toAlbum:(id)a10 orCreateWithName:(id)a11 completion:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a12;
  if (v22)
  {
    PXSharedAlbumsRecordRecentInvitationRecipients();
    LOBYTE(v24) = 0;
    -[PUAlbumStreamActivity _publishAssets:withSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:comment:toAlbum:isNewAlbum:completion:](self, "_publishAssets:withSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:comment:toAlbum:isNewAlbum:completion:", v17, v18, v19, v20, v21, v22, v24, v23);
  }
  else
  {
    v25 = v17;
    v26 = v18;
    v27 = v19;
    v28 = v20;
    v29 = v21;
    v30 = v23;
    PXSharedAlbumsCreateNewAlbum();

  }
}

- (void)controller:(id)a3 presentViewController:(id)a4
{
  -[UIViewController presentViewController:animated:completion:](self->_activityController, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)controller:(id)a3 dismissViewControllerWithCompletion:(id)a4
{
  -[UIViewController dismissViewControllerAnimated:completion:](self->_activityController, "dismissViewControllerAnimated:completion:", 1, a4);
}

- (void)controller:(id)a3 didFinishTrimmingVideoSources:(id)a4
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
  PXVideoTrimQueueController *trimController;
  uint64_t v15;

  v5 = a3;
  -[PUAlbumStreamActivity _handleDismissWithSuccess:](self, "_handleDismissWithSuccess:", 1);
  objc_msgSend(v5, "videosSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videosSourcesSharingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customExportsInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trimmedVideoInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commentText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "album");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = 0;
  -[PUAlbumStreamActivity _publishAssets:withSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:comment:invitationRecipients:wantsPublicWebsite:toAlbum:orCreateWithName:completion:](self, "_publishAssets:withSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:comment:invitationRecipients:wantsPublicWebsite:toAlbum:orCreateWithName:completion:", v6, v7, v8, v9, v10, v11, v15, v12, v13, 0);

  trimController = self->_trimController;
  self->_trimController = 0;

}

- (void)controller:(id)a3 didCancelTrimmingVideoSources:(id)a4
{
  PXVideoTrimQueueController *trimController;

  trimController = self->_trimController;
  self->_trimController = 0;

  -[PUAlbumStreamActivity _handleDismissWithSuccess:](self, "_handleDismissWithSuccess:", 0);
}

- (void)photoStreamComposeServiceDidCancel:(id)a3
{
  -[PUAlbumStreamActivity _handleDismissWithSuccess:](self, "_handleDismissWithSuccess:", 0);
}

- (void)sharedAlbumActionControllerDidFinish:(id)a3
{
  -[PUAlbumStreamActivity _handleDismissWithSuccess:](self, "_handleDismissWithSuccess:", 1);
}

- (void)sharedAlbumActionControllerDidCancel:(id)a3
{
  -[PUAlbumStreamActivity _handleDismissWithSuccess:](self, "_handleDismissWithSuccess:", 0);
}

- (id)itemSourceController
{
  return objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (BOOL)isPresentedFromActivityViewController
{
  return self->_isPresentedFromActivityViewController;
}

- (void)setPresentedFromActivityViewController:(BOOL)a3
{
  self->_isPresentedFromActivityViewController = a3;
}

- (PLUserEditableAlbumProtocol)destinationSharedAlbum
{
  return self->_destinationSharedAlbum;
}

- (void)setDestinationSharedAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_destinationSharedAlbum, a3);
}

- (BOOL)destinationSharedAlbumWasCreated
{
  return self->_destinationSharedAlbumWasCreated;
}

- (void)setDestinationSharedAlbumWasCreated:(BOOL)a3
{
  self->_destinationSharedAlbumWasCreated = a3;
}

- (UIViewController)referenceViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_referenceViewController);
}

- (void)setReferenceViewController:(id)a3
{
  objc_storeWeak((id *)&self->_referenceViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_referenceViewController);
  objc_storeStrong((id *)&self->_destinationSharedAlbum, 0);
  objc_destroyWeak((id *)&self->_itemSourceController);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_exportCopyDirectoryParent, 0);
  objc_storeStrong((id *)&self->_trimController, 0);
  objc_storeStrong((id *)&self->_activityController, 0);
  objc_storeStrong((id *)&self->_presenterViewController, 0);
  objc_storeStrong((id *)&self->_streamComposeViewController, 0);
}

void __183__PUAlbumStreamActivity__publishAssets_withSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_comment_invitationRecipients_wantsPublicWebsite_toAlbum_orCreateWithName_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = a2;
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a1[8];
  v9 = a1[9];
  v10 = a1[10];
  v3 = v4;
  px_dispatch_on_main_queue();

}

void __183__PUAlbumStreamActivity__publishAssets_withSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_comment_invitationRecipients_wantsPublicWebsite_toAlbum_orCreateWithName_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "pl_assetContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 96);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, CFSTR("PUAlbumStreamActivity.m"), 408, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[sharedAlbum pl_assetContainer]"), v7);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 96);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PUAlbumStreamActivity.m"), 408, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[sharedAlbum pl_assetContainer]"), v7, v11);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(*(id *)(a1 + 40), "setDestinationSharedAlbum:", v13);
  objc_msgSend(*(id *)(a1 + 40), "setDestinationSharedAlbumWasCreated:", 1);
  LOBYTE(v12) = 1;
  objc_msgSend(*(id *)(a1 + 40), "_publishAssets:withSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:comment:toAlbum:isNewAlbum:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v2, v12, *(_QWORD *)(a1 + 88));

}

void __82__PUAlbumStreamActivity__prepareToPostAsync_albumName_recipients_comments_assets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "sharingPreferences") & 1) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useStillImageOnly"));
  if ((objc_msgSend(v9, "sharingPreferences") & 0x100) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("excludeLocation"));
  objc_msgSend(v9, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewController:itemForActivityType:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D719E0], "processExportedFileURL:assetUUID:customExportsInfo:", v8, v5, *(_QWORD *)(a1 + 48))&& objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v3, v5);
  }

}

void __82__PUAlbumStreamActivity__prepareToPostAsync_albumName_recipients_comments_assets___block_invoke_171(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_trimAssetsToPost:albumName:recipients:comments:assets:assetsSharingInfo:customExportsInfo:", v2, v3, v4, v5, v6, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

void __77__PUAlbumStreamActivity__prepareToPost_albumName_recipients_comments_assets___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_prepareToPostAsync:albumName:recipients:comments:assets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __73__PUAlbumStreamActivity__performPresentationOnViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__PUAlbumStreamActivity__createStreamsPickerContainerWithExisting_assets___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id WeakRetained;
  id v20;
  id v21[2];

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6)
  {
    v15 = objc_msgSend(v11, "assetsCount");
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    v17 = objc_msgSend(MEMORY[0x1E0D719E0], "maxAssetsPerStream");
    if (v16 + v15 <= v17)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "_prepareToPost:albumName:recipients:comments:assets:", v11, v12, v13, v14, *(_QWORD *)(a1 + 40));

    }
    else
    {
      v18 = (void *)v17;
      v20 = v11;
      v21[1] = v18;
      objc_copyWeak(v21, (id *)(a1 + 48));
      px_dispatch_on_main_queue();
      objc_destroyWeak(v21);

    }
  }

}

void __74__PUAlbumStreamActivity__createStreamsPickerContainerWithExisting_assets___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  PLServicesLocalizedFrameworkString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLServicesLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  PULocalizedStringWithValidatedFormat(v5, CFSTR("%lu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  PLLocalizedFrameworkString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__PUAlbumStreamActivity__createStreamsPickerContainerWithExisting_assets___block_invoke_3;
  v15[3] = &unk_1E58AA850;
  a1 += 40;
  objc_copyWeak(&v16, (id *)a1);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  WeakRetained = objc_loadWeakRetained((id *)a1);
  objc_msgSend(WeakRetained, "itemSourceController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "px_presentOverTopmostPresentedViewController:animated:completion:", v7, 1, 0);

  objc_destroyWeak(&v16);
}

void __74__PUAlbumStreamActivity__createStreamsPickerContainerWithExisting_assets___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDismissWithSuccess:", 0);

}

+ (BOOL)canPerformWithAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v5 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "sharedStreamsEnabledForPhotoLibraryURL:", v4);

  if ((_DWORD)v5)
  {
    v5 = (void *)objc_msgSend(v3, "count");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "playbackStyle", (_QWORD)v12))
          {

            LOBYTE(v5) = 0;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }

    if (v5)
      LOBYTE(v5) = (unint64_t)v5 <= objc_msgSend(MEMORY[0x1E0D719E0], "maxAssetsPerStream");
  }
LABEL_13:

  return (char)v5;
}

+ (int64_t)activityCategory
{
  return 0;
}

@end
