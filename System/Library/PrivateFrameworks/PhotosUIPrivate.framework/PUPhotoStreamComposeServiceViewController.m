@implementation PUPhotoStreamComposeServiceViewController

- (PUPhotoStreamComposeServiceViewController)initWithStartingContentText:(id)a3
{
  id v4;
  PUPhotoStreamComposeServiceViewController *v5;
  uint64_t v6;
  NSString *startingContentText;

  v4 = a3;
  v5 = -[PUPhotoStreamComposeServiceViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    startingContentText = v5->_startingContentText;
    v5->_startingContentText = (NSString *)v6;

  }
  return v5;
}

- (PUPhotoStreamComposeServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUPhotoStreamComposeServiceViewController *v4;
  PUPhotoStreamComposeServiceViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoStreamComposeServiceViewController;
  v4 = -[SLComposeServiceViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SLComposeServiceViewController setHostProxy:](v4, "setHostProxy:", v4);
    -[PXPhotoStreamComposeServiceViewController setAddToExistingWorkflow:](v5, "setAddToExistingWorkflow:", 1);
    -[PXPhotoStreamComposeServiceViewController setShouldAllowAlbumPicking:](v5, "setShouldAllowAlbumPicking:", 1);
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoStreamComposeServiceViewController;
  -[SLComposeServiceViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBuiltinTransitionStyle:", 1);

  -[PUPhotoStreamComposeServiceViewController startingContentText](self, "startingContentText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SLComposeServiceViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoStreamComposeServiceViewController startingContentText](self, "startingContentText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
  -[SLComposeServiceViewController validateContent](self, "validateContent");
  if (!-[PXPhotoStreamComposeServiceViewController addToExistingWorkflow](self, "addToExistingWorkflow"))
    -[PUPhotoStreamComposeServiceViewController _pushTitleController](self, "_pushTitleController");
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[PXPhotoStreamComposeServiceViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
    v7.receiver = self;
    v7.super_class = (Class)PUPhotoStreamComposeServiceViewController;
    -[PXPhotoStreamComposeServiceViewController setDelegate:](&v7, sel_setDelegate_, v4);
  }

}

- (void)setAssetsToShare:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v18;
  uint8_t buf[4];
  PUPhotoStreamComposeServiceViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v7 = 0;
    *(_QWORD *)&v6 = 138412290;
    v18 = v6;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "pl_managedAsset");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v7 > 2)
        {
          v12 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "masterThumbnailFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject imageWithFormat:](v9, "imageWithFormat:", objc_msgSend(v11, "formatID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (-[NSObject isVideo](v9, "isVideo"))
        {
          v13 = objc_alloc(MEMORY[0x1E0CD7530]);
          v14 = (void *)objc_opt_new();
          v15 = objc_msgSend(v13, "initWithVideoData:preview:", v14, v12);
        }
        else
        {
          v16 = objc_alloc(MEMORY[0x1E0CD7528]);
          v14 = (void *)objc_opt_new();
          v15 = objc_msgSend(v16, "initWithJPEGData:preview:", v14, v12);
        }
        v17 = (void *)v15;

        -[SLComposeServiceViewController addAttachment:](self, "addAttachment:", v17);
      }
      else
      {
        PLUIGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v20 = self;
          _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "%@ ignoring asset that is not a PHAsset", buf, 0xCu);
        }
      }

      ++v7;
    }
    while (v5 != v7);
  }
  self->_shouldShowPost = v5 > 0;

}

- (id)_imageFromStreamShareSource:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGImage *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  CMTime v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "mediaType");
  if (v4 == 1)
  {
    v8 = (void *)MEMORY[0x1E0C8B3C0];
    objc_msgSend(v3, "mediaURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLAssetWithURL:options:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAppliesPreferredTrackTransform:", 1);
    objc_msgSend(v11, "setMaximumSize:", 360.0, 360.0);
    v12 = (void *)MEMORY[0x1E0D75130];
    CMTimeMake(&v20, 0, 1);
    v19 = 0;
    v13 = (CGImage *)objc_msgSend(v12, "copyCGImageFromImageGenerator:atTime:actualTime:error:", v11, &v20, 0, &v19);
    v14 = v19;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v13);
    }
    else
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "Failed to generate image from stream share source: %@", buf, 0xCu);
      }

      v15 = 0;
    }

  }
  else
  {
    if (v4 == 2)
    {
      v5 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v3, "mediaURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 != 3)
      {
        v15 = 0;
        goto LABEL_14;
      }
      v5 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v3, "videoComplement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imagePath");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v7;
    objc_msgSend(v5, "imageWithContentsOfFile:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v15;
}

- (void)setSourcesToShare:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  __int128 v16;
  uint8_t buf[4];
  PUPhotoStreamComposeServiceViewController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    *(_QWORD *)&v6 = 138412290;
    v16 = v6;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v8 > 2)
        {
          v10 = 0;
        }
        else
        {
          -[PUPhotoStreamComposeServiceViewController _imageFromStreamShareSource:](self, "_imageFromStreamShareSource:", v9);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v9, "mediaType") == 1)
        {
          v11 = objc_alloc(MEMORY[0x1E0CD7530]);
          v12 = (void *)objc_opt_new();
          v13 = objc_msgSend(v11, "initWithVideoData:preview:", v12, v10);
        }
        else
        {
          v14 = objc_alloc(MEMORY[0x1E0CD7528]);
          v12 = (void *)objc_opt_new();
          v13 = objc_msgSend(v14, "initWithJPEGData:preview:", v12, v10);
        }
        v15 = (void *)v13;

        -[SLComposeServiceViewController addAttachment:](self, "addAttachment:", v15);
      }
      else
      {
        PLUIGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          v18 = self;
          _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "%@ ignoring source that is not a PLStreamShareSource", buf, 0xCu);
        }
      }

      ++v8;
    }
    while (v7 != v8);
  }
  self->_shouldShowPost = v4 != 0;

}

- (id)sheetActions
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PUPhotoStreamComposeServiceViewController albumListAction](self, "albumListAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)title
{
  return PULocalizedString(CFSTR("PHOTO_STREAM_NAV_TITLE"));
}

- (id)serviceIconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PhotoStream"));
}

- (id)albumListAction
{
  void *v3;
  void *v4;
  id *p_selectedAlbum;
  PLAlbumProtocol *selectedAlbum;
  NSArray *v7;
  NSArray *actions;
  PLAlbumContainer *v9;
  PLAlbumContainer *albumList;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 inCreateNewAlbum;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD aBlock[5];
  id v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("PUPhotoStreamsAlbumSelectedGuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  p_selectedAlbum = (id *)&self->_selectedAlbum;
  selectedAlbum = self->_selectedAlbum;
  self->_selectedAlbum = 0;

  v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  actions = self->_actions;
  self->_actions = v7;

  +[PUPhotoStreamAlbumsTableViewController albumListForContentMode:](PUPhotoStreamAlbumsTableViewController, "albumListForContentMode:", 1);
  v9 = (PLAlbumContainer *)objc_claimAutoreleasedReturnValue();
  albumList = self->_albumList;
  self->_albumList = v9;

  -[PLAlbumContainer containers](self->_albumList, "containers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v31, "objectAtIndex:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *p_selectedAlbum;
    *p_selectedAlbum = (id)v11;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[PLAlbumContainer containers](self->_albumList, "containers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v17, "cloudGUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v4);

          if (v19)
          {
            objc_storeStrong((id *)&self->_selectedAlbum, v17);
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  inCreateNewAlbum = self->_inCreateNewAlbum;
  if (self->_inCreateNewAlbum)
  {
    -[PXPhotoStreamComposeServiceViewController albumTitle](self, "albumTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[PXPhotoStreamComposeServiceViewController albumTitle](self, "albumTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
  }
  if (-[PXPhotoStreamComposeServiceViewController addToExistingWorkflow](self, "addToExistingWorkflow")
    && !-[PXPhotoStreamComposeServiceViewController shouldAllowAlbumPicking](self, "shouldAllowAlbumPicking"))
  {
    -[PXPhotoStreamComposeServiceViewController albumTitle](self, "albumTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[PXPhotoStreamComposeServiceViewController albumTitle](self, "albumTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

      if (!inCreateNewAlbum)
        goto LABEL_28;
      goto LABEL_26;
    }
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(*p_selectedAlbum, "localizedTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = 0;
    goto LABEL_25;
  }
  if (inCreateNewAlbum)
  {
LABEL_26:
    v21 = 0;
    goto LABEL_27;
  }
LABEL_28:
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PUPhotoStreamComposeServiceViewController_albumListAction__block_invoke;
  aBlock[3] = &unk_1E58AB210;
  objc_copyWeak(&v33, &location);
  aBlock[4] = self;
  v25 = _Block_copy(aBlock);
  if (-[PXPhotoStreamComposeServiceViewController shouldAllowAlbumPicking](self, "shouldAllowAlbumPicking"))
    v26 = !self->_inCreateNewAlbum;
  else
    v26 = 0;
  v27 = objc_alloc_init(MEMORY[0x1E0CD7520]);
  PULocalizedString(CFSTR("PHOTO_STREAM_STREAMS"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTitle:", v28);

  objc_msgSend(v27, "setValue:", v22);
  if (v26)
    v29 = v25;
  else
    v29 = 0;
  objc_msgSend(v27, "setTapHandler:", v29);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v27;
}

- (void)controller:(id)a3 didSelectAlbum:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PLAlbumProtocol *selectedAlbum;
  id v9;
  dispatch_time_t v10;
  _QWORD block[5];

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("PUPhotoStreamsAlbumSelectedGuid"));

  selectedAlbum = self->_selectedAlbum;
  self->_selectedAlbum = (PLAlbumProtocol *)v5;
  v9 = v5;

  v10 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PUPhotoStreamComposeServiceViewController_controller_didSelectAlbum___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

}

- (void)titleController:(id)a3 didSetTitle:(id)a4
{
  __CFString *v5;
  void *v6;
  PUCloudSharedCreateAlbumViewController *v7;

  -[PXPhotoStreamComposeServiceViewController setAlbumTitle:](self, "setAlbumTitle:", a4);
  self->_inCreateNewAlbum = 1;
  v7 = objc_alloc_init(PUCloudSharedCreateAlbumViewController);
  -[PUCloudSharedCreateAlbumViewController setDelegate:](v7, "setDelegate:", self);
  if (-[PXPhotoStreamComposeServiceViewController addToExistingWorkflow](self, "addToExistingWorkflow"))
    v5 = CFSTR("STREAM_NEXT_SHEET_BUTTON");
  else
    v5 = CFSTR("STREAM_CREATE_SHEET_BUTTON");
  PULocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCloudSharedCreateAlbumViewController setNextButtonTitle:](v7, "setNextButtonTitle:", v6);
  -[SLComposeServiceViewController reloadSheetActions](self, "reloadSheetActions");
  -[SLComposeServiceViewController pushActionViewController:](self, "pushActionViewController:", v7);

}

- (void)albumStreamingCreateViewController:(id)a3 didSucceed:(BOOL)a4
{
  NSArray *v5;
  NSArray *recipients;
  id v7;
  id v8;

  if (a4)
  {
    objc_msgSend(a3, "recipients");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    recipients = self->_recipients;
    self->_recipients = v5;

    if (self->_shouldShowPost)
    {
      -[SLComposeServiceViewController navigationController](self, "navigationController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v8, "popToRootViewControllerAnimated:", 1);

    }
    else
    {
      -[SLComposeServiceViewController send](self, "send");
    }
  }
  else
  {
    -[SLComposeServiceViewController cancel](self, "cancel", a3);
  }
}

- (void)userDidCancel
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  char delegateFlags;
  id v7;

  -[PXPhotoStreamComposeServiceViewController completion](self, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPhotoStreamComposeServiceViewController completion](self, "completion");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, 0, 0, 0, 0);

  }
  -[PXPhotoStreamComposeServiceViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    delegateFlags = (char)self->_delegateFlags;

    if ((delegateFlags & 2) != 0)
    {
      -[PXPhotoStreamComposeServiceViewController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoStreamComposeServiceDidCancel:", self);

    }
  }
}

- (void)userDidPost
{
  void *v3;
  void *v4;
  PLAlbumProtocol *selectedAlbum;
  PLAlbumProtocol *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *recipients;
  void *v9;
  void *v10;
  char delegateFlags;
  void *v12;
  id v13;

  -[PXPhotoStreamComposeServiceViewController completion](self, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_inCreateNewAlbum)
      -[PXPhotoStreamComposeServiceViewController albumTitle](self, "albumTitle");
    else
      -[PLAlbumProtocol localizedTitle](self->_selectedAlbum, "localizedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_inCreateNewAlbum)
      selectedAlbum = 0;
    else
      selectedAlbum = self->_selectedAlbum;
    v6 = selectedAlbum;
    -[PXPhotoStreamComposeServiceViewController completion](self, "completion");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    recipients = self->_recipients;
    -[SLComposeServiceViewController text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PLAlbumProtocol *, void *, NSArray *, void *, uint64_t))v7)[2](v7, v6, v4, recipients, v9, 1);

  }
  -[PXPhotoStreamComposeServiceViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    delegateFlags = (char)self->_delegateFlags;

    if ((delegateFlags & 1) != 0)
    {
      -[PXPhotoStreamComposeServiceViewController delegate](self, "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[SLComposeServiceViewController text](self, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "photoStreamComposeService:didPostComment:", self, v12);

    }
  }
}

- (void)_pushTitleController
{
  PUPhotoStreamCreateTitleViewController *v3;

  v3 = objc_alloc_init(PUPhotoStreamCreateTitleViewController);
  -[PUPhotoStreamCreateTitleViewController setTitleDelegate:](v3, "setTitleDelegate:", self);
  -[SLComposeServiceViewController pushActionViewController:](self, "pushActionViewController:", v3);

}

- (BOOL)isContentValid
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = objc_msgSend(MEMORY[0x1E0D719E0], "maxCharactersPerComment");
  -[SLComposeServiceViewController contentText](self, "contentText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") >= v3)
  {

    v6 = 0;
    goto LABEL_5;
  }
  -[SLComposeServiceViewController contentText](self, "contentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 - objc_msgSend(v5, "length");

  if (v6 <= 19)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeServiceViewController setCharactersRemaining:](self, "setCharactersRemaining:", v7);

    goto LABEL_6;
  }
  -[SLComposeServiceViewController setCharactersRemaining:](self, "setCharactersRemaining:", 0);
LABEL_6:
  -[SLComposeServiceViewController contentText](self, "contentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") <= v3;

  return v9;
}

- (NSString)startingContentText
{
  return self->_startingContentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingContentText, 0);
  objc_storeStrong((id *)&self->_itemCountString, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_selectedAlbum, 0);
}

uint64_t __71__PUPhotoStreamComposeServiceViewController_controller_didSelectAlbum___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "reloadSheetActions");
}

void __60__PUPhotoStreamComposeServiceViewController_albumListAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  PUPhotoStreamAlbumsTableViewController *v8;

  v8 = objc_alloc_init(PUPhotoStreamAlbumsTableViewController);
  -[PUPhotoStreamAlbumsTableViewController navigationItem](v8, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("ADD_TO_PHOTO_STREAM"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[PUPhotoStreamAlbumsTableViewController setPickerDelegate:](v8, "setPickerDelegate:", WeakRetained);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "cloudGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumsTableViewController addSelectedCloudGuid:](v8, "addSelectedCloudGuid:", v6);

  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "pushActionViewController:", v8);

}

@end
