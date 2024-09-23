@implementation PUCommentsTableDataController

- (PUCommentsTableDataController)initWithTableView:(id)a3
{
  id v5;
  PUCommentsTableDataController *v6;
  NSCache *v7;
  NSCache *commentsHeightCache;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUCommentsTableDataController;
  v6 = -[PUCommentsTableDataController init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    commentsHeightCache = v6->_commentsHeightCache;
    v6->_commentsHeightCache = v7;

    objc_storeStrong((id *)&v6->_tableView, a3);
    -[UITableView setDelegate:](v6->_tableView, "setDelegate:", v6);
    -[UITableView setDataSource:](v6->_tableView, "setDataSource:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__fontCacheDidChange_, *MEMORY[0x1E0D71500], 0);

  }
  return v6;
}

- (PUCommentsTableDataController)init
{
  return -[PUCommentsTableDataController initWithTableView:](self, "initWithTableView:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUCommentsTableDataController;
  -[PUCommentsTableDataController dealloc](&v4, sel_dealloc);
}

- (void)setAsset:(id)a3
{
  void *v5;
  void *v6;
  PHAsset *v7;

  v7 = (PHAsset *)a3;
  if (self->_asset != v7)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    -[PUCommentsTableDataController _invalidateCommentsAndLikes](self, "_invalidateCommentsAndLikes");
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset pl_managedAssetFromPhotoLibrary:](v7, "pl_managedAssetFromPhotoLibrary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCommentsTableDataController _setManagedAsset:](self, "_setManagedAsset:", v6);

  }
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_editing != a3)
  {
    v3 = a3;
    self->_editing = a3;
    -[PUCommentsTableDataController _updateFirstResponder](self, "_updateFirstResponder");
    -[PUCommentsTableDataController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commentsTableDataController:didChangeEditing:", self, v3);

  }
}

- (void)setShouldUseCompactCommentSeparators:(BOOL)a3
{
  id v3;

  if (self->_shouldUseCompactCommentSeparators != a3)
  {
    self->_shouldUseCompactCommentSeparators = a3;
    -[PUCommentsTableDataController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (double)minimumHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[PUCommentsTableDataController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[PUCommentsTableDataController _assetOwnerCommentSection](self, "_assetOwnerCommentSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCommentsTableDataController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", v3, v4);
  v6 = v5 + 0.0;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCommentsTableDataController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", v3, v7);
  v9 = v6 + v8;

  return v9;
}

- (void)_updateFirstResponder
{
  void *v3;
  id v4;

  -[PUCommentsTableDataController _currentEntryView](self, "_currentEntryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PUCommentsTableDataController isEditing](self, "isEditing"))
  {
    objc_msgSend(v4, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "becomeFirstResponder");
  }
  else
  {
    objc_msgSend(v4, "clearText");
    objc_msgSend(v4, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resignFirstResponder");
  }

}

- (void)_setManagedAsset:(id)a3
{
  PLManagedAsset *v5;
  PLManagedAsset *managedAsset;
  void *v7;
  void *v8;
  PLManagedAsset *v9;

  v5 = (PLManagedAsset *)a3;
  managedAsset = self->_managedAsset;
  v9 = v5;
  if (managedAsset != v5)
  {
    if (managedAsset)
    {
      objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeCloudCommentsChangeObserver:asset:", self, self->_managedAsset);

    }
    objc_storeStrong((id *)&self->_managedAsset, a3);
    if (self->_managedAsset)
    {
      objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addCloudCommentsChangeObserver:asset:", self, self->_managedAsset);

    }
  }

}

- (void)_invalidateCommentsAndLikes
{
  PHFetchResult *orderedCommentsFetchResult;
  PHFetchResult *orderedLikesFetchResult;

  orderedCommentsFetchResult = self->_orderedCommentsFetchResult;
  self->_orderedCommentsFetchResult = 0;

  orderedLikesFetchResult = self->_orderedLikesFetchResult;
  self->_orderedLikesFetchResult = 0;

}

- (id)_orderedFetchOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PUCommentsTableDataController asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("commentDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  return v4;
}

- (void)_updateOrderedComments
{
  void *v3;
  void *v4;
  PHFetchResult *v5;
  PHFetchResult *orderedCommentsFetchResult;
  id v7;

  if (!self->_orderedCommentsFetchResult)
  {
    v3 = (void *)MEMORY[0x1E0CD13D0];
    -[PUCommentsTableDataController asset](self, "asset");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCommentsTableDataController _orderedFetchOptions](self, "_orderedFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchCommentsForAsset:options:", v7, v4);
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    orderedCommentsFetchResult = self->_orderedCommentsFetchResult;
    self->_orderedCommentsFetchResult = v5;

  }
}

- (void)_updatedOrderedLikes
{
  void *v3;
  void *v4;
  PHFetchResult *v5;
  PHFetchResult *orderedLikesFetchResult;
  id v7;

  if (!self->_orderedLikesFetchResult)
  {
    v3 = (void *)MEMORY[0x1E0CD13D0];
    -[PUCommentsTableDataController asset](self, "asset");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCommentsTableDataController _orderedFetchOptions](self, "_orderedFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchLikesForAsset:options:", v7, v4);
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    orderedLikesFetchResult = self->_orderedLikesFetchResult;
    self->_orderedLikesFetchResult = v5;

  }
}

- (id)_orderedComments
{
  -[PUCommentsTableDataController _updateOrderedComments](self, "_updateOrderedComments");
  return -[PUCommentsTableDataController orderedCommentsFetchResult](self, "orderedCommentsFetchResult");
}

- (id)_orderedLikes
{
  -[PUCommentsTableDataController _updatedOrderedLikes](self, "_updatedOrderedLikes");
  return -[PUCommentsTableDataController orderedLikesFetchResult](self, "orderedLikesFetchResult");
}

- (BOOL)_isAssetOwnerSectionVisible
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[PUCommentsTableDataController _orderedComments](self, "_orderedComments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isCaption") ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (int64_t)_smileCommentSection
{
  return 0;
}

- (int64_t)_assetOwnerCommentSection
{
  if (-[PUCommentsTableDataController _isAssetOwnerSectionVisible](self, "_isAssetOwnerSectionVisible"))
    return 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_postCommentSection
{
  if (-[PUCommentsTableDataController _isAssetOwnerSectionVisible](self, "_isAssetOwnerSectionVisible"))
    return 3;
  else
    return 2;
}

- (int64_t)_textCommentSection
{
  if (-[PUCommentsTableDataController _isAssetOwnerSectionVisible](self, "_isAssetOwnerSectionVisible"))
    return 2;
  else
    return 1;
}

- (id)_currentEntryView
{
  PUPhotoCommentEntryView *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = self->_entryView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "textEntryView");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (PUPhotoCommentEntryView *)v6;
    }
  }

  return v3;
}

- (void)_scrollToComment:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[PUCommentsTableDataController _orderedComments](self, "_orderedComments");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 2, v4);

  }
}

- (double)_heightForComment:(id)a3 forWidth:(double)a4 forInterfaceOrientation:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  NSCache *commentsHeightCache;
  void *v20;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%f%d"), v11, *(_QWORD *)&a4, (unint64_t)(a5 - 3) < 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache objectForKey:](self->_commentsHeightCache, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      v16 = v15;
    }
    else
    {
      -[PUCommentsTableDataController asset](self, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPhotoCommentCell heightForComment:ofAsset:forWidth:forInterfaceOrientation:](PUPhotoCommentCell, "heightForComment:ofAsset:forWidth:forInterfaceOrientation:", v9, v17, a5, a4);
      v16 = v18;

      commentsHeightCache = self->_commentsHeightCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](commentsHeightCache, "setObject:forKey:", v20, v12);

    }
  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

- (id)_commentText
{
  void *v2;
  void *v3;

  -[PUCommentsTableDataController _currentEntryView](self, "_currentEntryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimmedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canPostCommentWithText:(id)a3 localizedFailureDescription:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v6 = objc_msgSend(a3, "length");
  if (v6 <= objc_msgSend(MEMORY[0x1E0D719E0], "maxCharactersPerComment"))
  {
    if (v6)
    {
      -[PUCommentsTableDataController managedAsset](self, "managedAsset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "totalCommentsCount");

      if (v10 < objc_msgSend(MEMORY[0x1E0D719E0], "maxCommentsPerAsset"))
      {
        v8 = 0;
        v11 = 1;
        if (!a4)
          goto LABEL_11;
        goto LABEL_10;
      }
      PLLocalizedFrameworkString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    PULocalizedString(CFSTR("TOO_MANY_CHARS_IN_COMMENT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedStringWithValidatedFormat(v7, CFSTR("%ld"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v8);
LABEL_11:

  return v11;
}

- (void)_postCommentWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PUCommentsTableDataController *v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  -[PUCommentsTableDataController asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__21090;
  v18[4] = __Block_byref_object_dispose__21091;
  v19 = 0;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__PUCommentsTableDataController__postCommentWithText___block_invoke;
  v14[3] = &unk_1E58AAD18;
  v15 = v5;
  v8 = v4;
  v16 = v8;
  v17 = v18;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __54__PUCommentsTableDataController__postCommentWithText___block_invoke_156;
  v10[3] = &unk_1E58A0F98;
  v9 = v15;
  v11 = v9;
  v12 = self;
  v13 = v18;
  objc_msgSend(v6, "performChanges:completionHandler:", v14, v10);

  _Block_object_dispose(v18, 8);
}

- (void)_fontCacheDidChange:(id)a3
{
  -[NSCache removeAllObjects](self->_commentsHeightCache, "removeAllObjects", a3);
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_setIsPostingComment:(BOOL)a3 postButton:(id)a4
{
  self->_isPostingComment = a3;
  objc_msgSend(a4, "setEnabled:", !a3);
}

- (void)_validateAndPostComment:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (!self->_isPostingComment)
  {
    -[PUCommentsTableDataController _setIsPostingComment:postButton:](self, "_setIsPostingComment:postButton:", 1, v4);
    if (-[PUCommentsTableDataController isEditing](self, "isEditing"))
    {
      -[PUCommentsTableDataController _commentText](self, "_commentText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v6 = -[PUCommentsTableDataController _canPostCommentWithText:localizedFailureDescription:](self, "_canPostCommentWithText:localizedFailureDescription:", v5, &v15);
      v7 = v15;
      v8 = v7;
      if (v6)
      {
        -[PUCommentsTableDataController _postCommentWithText:](self, "_postCommentWithText:", v5);
      }
      else if (v7)
      {
        PLLocalizedFrameworkString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v8, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0DC3448];
        PULocalizedString(CFSTR("OK"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v13);

        -[PUCommentsTableDataController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "commentsTableDataController:presentViewController:", self, v10);

      }
      -[PUCommentsTableDataController _setIsPostingComment:postButton:](self, "_setIsPostingComment:postButton:", 0, v4);

    }
    else
    {
      -[PUCommentsTableDataController _setIsPostingComment:postButton:](self, "_setIsPostingComment:postButton:", 0, v4);
    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection", a3) + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v7;
  int64_t v8;

  if (-[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection", a3) == a4
    || -[PUCommentsTableDataController _assetOwnerCommentSection](self, "_assetOwnerCommentSection") == a4)
  {
    return 1;
  }
  if (-[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection") != a4)
    return -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection") == a4;
  -[PUCommentsTableDataController managedAsset](self, "managedAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cloudCommentsCount");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PUPhotoSmilesCommentCell *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  -[PUCommentsTableDataController asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCommentsTableDataController managedAsset](self, "managedAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "section");
  if (v11 == -[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PLPhotoSmilesCommentCell"));
    v12 = (PUPhotoSmilesCommentCell *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = -[PUPhotoSmilesCommentCell initWithStyle:reuseIdentifier:]([PUPhotoSmilesCommentCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PLPhotoSmilesCommentCell"));
    -[PUCommentsTableDataController _orderedLikes](self, "_orderedLikes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoSmilesCommentCell setUserLikes:](v12, "setUserLikes:", v13);

    if ((objc_msgSend(v9, "isVideo") & 1) != 0 || (objc_msgSend(v9, "isStreamedVideo") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend(v9, "isAudio");
    -[PUPhotoSmilesCommentCell setIsVideo:](v12, "setIsVideo:", v14);
    -[PUPhotoSmilesCommentCell setUsesCompactSeparators:](v12, "setUsesCompactSeparators:", -[PUCommentsTableDataController shouldUseCompactCommentSeparators](self, "shouldUseCompactCommentSeparators"));
  }
  else if (v11 == -[PUCommentsTableDataController _assetOwnerCommentSection](self, "_assetOwnerCommentSection"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PLPhotoOwnerCommentCell"));
    v12 = (PUPhotoSmilesCommentCell *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = -[PUPhotoOwnerCommentCell initWithStyle:reuseIdentifier:]([PUPhotoOwnerCommentCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PLPhotoOwnerCommentCell"));
    -[PUPhotoSmilesCommentCell setUsesCompactSeparators:](v12, "setUsesCompactSeparators:", -[PUCommentsTableDataController shouldUseCompactCommentSeparators](self, "shouldUseCompactCommentSeparators"));
    -[PUPhotoSmilesCommentCell updateContentFromAsset:](v12, "updateContentFromAsset:", v10);
  }
  else if (v11 == -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("CommentsTableViewCell"));
    v12 = (PUPhotoSmilesCommentCell *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = -[PUPhotoCommentCell initWithStyle:reuseIdentifier:]([PUPhotoCommentCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("CommentsTableViewCell"));
    -[PUPhotoSmilesCommentCell setUsesCompactSeparators:](v12, "setUsesCompactSeparators:", -[PUCommentsTableDataController shouldUseCompactCommentSeparators](self, "shouldUseCompactCommentSeparators"));
    -[PUCommentsTableDataController asset](self, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoSmilesCommentCell setAsset:](v12, "setAsset:", v15);

    -[PUCommentsTableDataController _orderedComments](self, "_orderedComments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "row"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoSmilesCommentCell setComment:](v12, "setComment:", v17);

  }
  else
  {
    if (v11 != -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCommentsTableDataController.m"), 404, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PLPhotoPostCommentCell"));
    v12 = (PUPhotoSmilesCommentCell *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = -[PUPhotoPostCommentTextEntryCell initWithStyle:reuseIdentifier:]([PUPhotoPostCommentTextEntryCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PLPhotoPostCommentCell"));
      -[PUPhotoSmilesCommentCell textEntryView](v12, "textEntryView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", self);

      -[PUPhotoSmilesCommentCell textEntryView](v12, "textEntryView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__validateAndPostComment_, 64);
    }
  }

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "statusBarOrientation");

  -[UITableView frame](self->_tableView, "frame");
  v9 = v8;
  -[PUCommentsTableDataController asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCommentsTableDataController managedAsset](self, "managedAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "section");
  if (v12 != -[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection"))
  {
    if (v12 == -[PUCommentsTableDataController _assetOwnerCommentSection](self, "_assetOwnerCommentSection"))
    {
      +[PUPhotoOwnerCommentCell heightOfOwnerCellWithAsset:forWidth:forInterfaceOrientation:](PUPhotoOwnerCommentCell, "heightOfOwnerCellWithAsset:forWidth:forInterfaceOrientation:", v11, v7, v9);
    }
    else
    {
      if (v12 == -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection"))
      {
        -[PUCommentsTableDataController _orderedComments](self, "_orderedComments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v5, "row"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUCommentsTableDataController _heightForComment:forWidth:forInterfaceOrientation:](self, "_heightForComment:forWidth:forInterfaceOrientation:", v16, v7, v9);
        v18 = v17;

        goto LABEL_14;
      }
      v18 = 0.0;
      if (v12 != -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection"))
        goto LABEL_14;
      +[PUPhotoPostCommentTextEntryCell heightForWidth:](PUPhotoPostCommentTextEntryCell, "heightForWidth:", v9);
    }
    v18 = v14;
    goto LABEL_14;
  }
  if ((objc_msgSend(v10, "isVideo") & 1) != 0 || (objc_msgSend(v10, "isStreamedVideo") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v10, "isAudio");
  -[PUCommentsTableDataController _orderedLikes](self, "_orderedLikes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoSmilesCommentCell heightOfSmileCellWithComments:forWidth:isVideo:forInterfaceOrientation:](PUPhotoSmilesCommentCell, "heightOfSmileCellWithComments:forWidth:isVideo:forInterfaceOrientation:", v19, v13, v7, v9);
  v18 = v20;

LABEL_14:
  return v18;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  char isKindOfClass;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a4;
  -[PUCommentsTableDataController managedAsset](self, "managedAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "totalCommentsCount"))
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __77__PUCommentsTableDataController_tableView_willDisplayCell_forRowAtIndexPath___block_invoke;
      v9[3] = &unk_1E58AB2F8;
      objc_copyWeak(&v10, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "section", a3);
  return v5 != -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection");
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v8;

  v8 = objc_msgSend(a5, "section", a3);
  return v8 == -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection") && sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = objc_msgSend(v13, "section");
  if (v8 == -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection") && sel_copy_ == a4)
  {
    -[PUCommentsTableDataController _orderedComments](self, "_orderedComments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v13, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "commentText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setString:", v11);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  if (-[PUCommentsTableDataController isEditing](self, "isEditing"))
    goto LABEL_5;
  v6 = objc_msgSend(v5, "section");
  if (v6 != -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection"))
    goto LABEL_5;
  -[PUCommentsTableDataController _orderedComments](self, "_orderedComments");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "objectAtIndex:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "canBeDeletedByUser");
  if ((v7 & 1) != 0)
    v9 = 1;
  else
LABEL_5:
    v9 = 0;

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUCommentsTableDataController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commentsTableDataController:tableViewDidScroll:", self, v4);

}

- (void)photoCommentEntryViewWillBeginEditing:(id)a3
{
  -[PUCommentsTableDataController setEditing:](self, "setEditing:", 1);
}

- (BOOL)photoCommentEntryViewShouldEndEditing:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[PUCommentsTableDataController isEditing](self, "isEditing", a3))
    return 1;
  -[PUCommentsTableDataController _commentText](self, "_commentText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (-[PUCommentsTableDataController _canPostCommentWithText:localizedFailureDescription:](self, "_canPostCommentWithText:localizedFailureDescription:", v4, 0))
    {
      -[PUCommentsTableDataController justInsertedCommentUUID](self, "justInsertedCommentUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)photoCommentEntryViewDidEndEditing:(id)a3
{
  -[PUCommentsTableDataController setEditing:](self, "setEditing:", 0);
  if (self->_hasPendingChanges)
    -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)cloudCommentsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSInteger v13;
  int64_t v14;
  uint64_t v15;
  char v16;
  uint64_t (**v17)(_QWORD);
  uint64_t (**v18)(_QWORD);
  int v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  UITableView *tableView;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  UITableView *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  PUCommentsTableDataController *v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  PUCommentsTableDataController *v39;
  _QWORD aBlock[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  v4 = a3;
  if (-[PUCommentsTableDataController isEditing](self, "isEditing")
    && (-[PUCommentsTableDataController justInsertedCommentUUID](self, "justInsertedCommentUUID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_hasPendingChanges = 1;
  }
  else
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCommentsTableDataController managedAsset](self, "managedAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      self->_hasPendingChanges = 0;
      -[PUCommentsTableDataController _invalidateCommentsAndLikes](self, "_invalidateCommentsAndLikes");
      v9 = objc_msgSend(v4, "shouldReload");
      objc_msgSend(v4, "deletedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertedIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      -[PUCommentsTableDataController justInsertedCommentUUID](self, "justInsertedCommentUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v42 = &v41;
      v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__21090;
      v45 = __Block_byref_object_dispose__21091;
      v46 = 0;
      v13 = -[UITableView numberOfSections](self->_tableView, "numberOfSections");
      v14 = -[PUCommentsTableDataController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", self->_tableView);
      v15 = MEMORY[0x1E0C809B0];
      if (v13 == v14)
        v16 = v9;
      else
        v16 = 1;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke;
      aBlock[3] = &unk_1E58AB498;
      aBlock[4] = self;
      v17 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
      v18 = v17;
      if ((v16 & 1) != 0)
      {
        v19 = v17[2](v17);
        -[UITableView reloadData](self->_tableView, "reloadData");
      }
      else if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
      {
        -[UITableView beginUpdates](self->_tableView, "beginUpdates");
        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v37[0] = v15;
          v37[1] = 3221225472;
          v37[2] = __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_2;
          v37[3] = &unk_1E58A7D80;
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v38 = v20;
          v39 = self;
          objc_msgSend(v10, "enumerateIndexesUsingBlock:", v37);
          -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](self->_tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v20, 0);

        }
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v31[0] = v15;
          v31[1] = 3221225472;
          v31[2] = __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_3;
          v31[3] = &unk_1E589DD70;
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v32 = v21;
          v33 = self;
          v34 = v12;
          v35 = &v47;
          v36 = &v41;
          objc_msgSend(v11, "enumerateIndexesUsingBlock:", v31);
          if (*((_BYTE *)v48 + 24))
          {
            -[PUCommentsTableDataController setEditing:](self, "setEditing:", 0);
            v19 = 1;
          }
          else
          {
            v19 = v18[2](v18);
          }
          if (*((_BYTE *)v48 + 24))
          {
            v22 = 5;
          }
          else if ((unint64_t)objc_msgSend(v11, "count") >= 0x15)
          {
            v22 = 5;
          }
          else
          {
            v22 = 100;
          }
          -[UITableView insertRowsAtIndexPaths:withRowAnimation:](self->_tableView, "insertRowsAtIndexPaths:withRowAnimation:", v21, v22);

        }
        else
        {
          v19 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        tableView = self->_tableView;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v25, 5);

        -[UITableView endUpdates](self->_tableView, "endUpdates");
      }
      else
      {
        -[UITableView beginUpdates](self->_tableView, "beginUpdates");
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = self->_tableView;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v29, "reloadRowsAtIndexPaths:withRowAnimation:", v30, 5);

        -[UITableView endUpdates](self->_tableView, "endUpdates");
        v19 = 0;
      }
      if (*((_BYTE *)v48 + 24))
      {
        v26 = v42[5];
        if (v26)
          -[PUCommentsTableDataController _scrollToComment:animated:](self, "_scrollToComment:animated:", v26, 0);
      }
      if (v19)
        -[UITableView px_scrollToEdge:animated:](self->_tableView, "px_scrollToEdge:animated:", 3, 1);
      -[PUCommentsTableDataController justInsertedCommentUUID](self, "justInsertedCommentUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        -[PUCommentsTableDataController setJustInsertedCommentUUID:](self, "setJustInsertedCommentUUID:", 0);

      _Block_object_dispose(&v41, 8);
      _Block_object_dispose(&v47, 8);

    }
  }

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)shouldUseCompactCommentSeparators
{
  return self->_shouldUseCompactCommentSeparators;
}

- (PUCommentsTableDataControllerDelegate)delegate
{
  return (PUCommentsTableDataControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PLManagedAsset)managedAsset
{
  return self->_managedAsset;
}

- (void)setManagedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_managedAsset, a3);
}

- (NSString)justInsertedCommentUUID
{
  return self->_justInsertedCommentUUID;
}

- (void)setJustInsertedCommentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_justInsertedCommentUUID, a3);
}

- (PHFetchResult)orderedCommentsFetchResult
{
  return self->_orderedCommentsFetchResult;
}

- (void)setOrderedCommentsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_orderedCommentsFetchResult, a3);
}

- (PHFetchResult)orderedLikesFetchResult
{
  return self->_orderedLikesFetchResult;
}

- (void)setOrderedLikesFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_orderedLikesFetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedLikesFetchResult, 0);
  objc_storeStrong((id *)&self->_orderedCommentsFetchResult, 0);
  objc_storeStrong((id *)&self->_justInsertedCommentUUID, 0);
  objc_storeStrong((id *)&self->_managedAsset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_entryView, 0);
  objc_storeStrong((id *)&self->_commentsHeightCache, 0);
}

uint64_t __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "px_isScrolledAtEdge:tolerance:", 3, 10.0);
}

void __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, objc_msgSend(*(id *)(a1 + 40), "_textCommentSection"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, objc_msgSend(*(id *)(a1 + 40), "_textCommentSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  if (*(_QWORD *)(a1 + 48) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_orderedComments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a2);
    obj = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(obj, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 48));

    if ((_DWORD)v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), obj);
    }

  }
}

void __77__PUCommentsTableDataController_tableView_willDisplayCell_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFirstResponder");

}

void __54__PUCommentsTableDataController__postCommentWithText___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLSharedAlbumsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Posting comment to shared asset %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CD13D8], "creationRequestForAssetCommentWithText:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderForCreatedAssetComment");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addComments:", v9);

}

void __54__PUCommentsTableDataController__postCommentWithText___block_invoke_156(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint32_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    PLSharedAlbumsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v7;
      v8 = "Succesfully posted comment to shared asset %{public}@";
      v9 = v6;
      v10 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      v12 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    PLSharedAlbumsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v7;
        v16 = 2112;
        v17 = v5;
        v8 = "Failed to post comment to shared asset %{public}@, with error: %@";
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        v12 = 22;
LABEL_10:
        _os_log_impl(&dword_1AAB61000, v9, v10, v8, (uint8_t *)&v14, v12);

      }
    }
    else if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v7;
      v8 = "Failed to post comment to shared asset %{public}@";
      v9 = v6;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setJustInsertedCommentUUID:", v13);

}

@end
