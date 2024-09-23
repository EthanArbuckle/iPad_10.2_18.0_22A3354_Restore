@implementation UGCPhotoCarouselController

- (NSString)downloadToken
{
  NSString *downloadToken;
  id v4;
  NSString *v5;
  NSString *v6;

  downloadToken = self->_downloadToken;
  if (!downloadToken)
  {
    v4 = +[UGCPhotoDownloadManager generateRandomizedDownloadTokenForClass:](UGCPhotoDownloadManager, "generateRandomizedDownloadTokenForClass:", objc_opt_class(self));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_downloadToken;
    self->_downloadToken = v5;

    downloadToken = self->_downloadToken;
  }
  return downloadToken;
}

- (UGCPhotoCarouselController)initWithDelegate:(id)a3 maximumNumberOfPhotos:(unint64_t)a4
{
  return -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:prefersMenu:](self, "initWithDelegate:maximumNumberOfPhotos:prefersMenu:", a3, a4, 0);
}

- (UGCPhotoCarouselController)initWithDelegate:(id)a3 maximumNumberOfPhotos:(unint64_t)a4 prefersMenu:(BOOL)a5
{
  id v8;
  UGCPhotoCarouselController *v9;
  UGCPhotoCarouselController *v10;
  NSMutableArray *v11;
  NSMutableArray *viewModels;
  uint64_t v13;
  UIColor *cellBackgroundColor;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UGCPhotoCarouselController;
  v9 = -[UGCPhotoCarouselController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_maximumNumberOfPhotos = a4;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    viewModels = v10->_viewModels;
    v10->_viewModels = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    cellBackgroundColor = v10->_cellBackgroundColor;
    v10->_cellBackgroundColor = (UIColor *)v13;

    v10->_prefersMenu = a5;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoDownloadManager sharedDownloadManager](UGCPhotoDownloadManager, "sharedDownloadManager"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_viewModels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController downloadToken](self, "downloadToken"));
        objc_msgSend(v3, "cancelRequestForPhotoInfo:downloadToken:", v9, v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)UGCPhotoCarouselController;
  -[UGCPhotoCarouselController dealloc](&v11, "dealloc");
}

- (void)setMaximumNumberOfPhotos:(unint64_t)a3
{
  if (self->_maximumNumberOfPhotos != a3)
  {
    self->_maximumNumberOfPhotos = a3;
    -[UGCPhotoCarouselController _updateAddButtonState](self, "_updateAddButtonState");
  }
}

- (void)addImage:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  _UGCPhotoCarouselViewModel *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_UGCPhotoCarouselViewModel);
  -[_UGCPhotoCarouselViewModel setImage:](v8, "setImage:", v7);

  -[_UGCPhotoCarouselViewModel setIdentifier:](v8, "setIdentifier:", v6);
  -[UGCPhotoCarouselController _addViewModel:](self, "_addViewModel:", v8);

}

- (void)addImageURL:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  _UGCPhotoCarouselViewModel *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_UGCPhotoCarouselViewModel);
  -[_UGCPhotoCarouselViewModel setImageURL:](v8, "setImageURL:", v7);

  -[_UGCPhotoCarouselViewModel setIdentifier:](v8, "setIdentifier:", v6);
  -[UGCPhotoCarouselController _addViewModel:](self, "_addViewModel:", v8);

}

- (id)visibleImageViewForIdentifier:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController _viewModelForIdentifier:](self, "_viewModelForIdentifier:", a3));
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "visibleCells", 0));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(UGCPhotoCollectionViewCell);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = v10;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_diffableDataSourceIdentifier"));
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if ((v15 & 1) != 0)
            {
              v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));

              goto LABEL_15;
            }

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addViewModel:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_viewModels, "count") < self->_maximumNumberOfPhotos)
  {
    -[NSMutableArray addObject:](self->_viewModels, "addObject:", v5);
    -[UGCPhotoCarouselController _updateAddButtonState](self, "_updateAddButtonState");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController _buildSnapshotFromCurrentState](self, "_buildSnapshotFromCurrentState"));
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v4, 1);
    -[UGCPhotoCarouselController _invokeChangeHandler](self, "_invokeChangeHandler");

  }
}

- (void)_invokeChangeHandler
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController changeHandler](self, "changeHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController changeHandler](self, "changeHandler"));
    v4[2]();

  }
}

- (void)setupCollectionView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  UICollectionViewDiffableDataSource *v12;
  UICollectionViewDiffableDataSource *diffableDataSource;
  id v14;

  v4 = a3;
  v5 = objc_opt_class(UGCPhotoCollectionViewCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoCollectionViewCell reuseIdentifier](UGCPhotoCollectionViewCell, "reuseIdentifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v5, v6);

  v7 = objc_opt_class(UGCAddPhotoCollectionViewCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCAddPhotoCollectionViewCell reuseIdentifier](UGCAddPhotoCollectionViewCell, "reuseIdentifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  objc_msgSend(v4, "setDelegate:", self);
  objc_storeWeak((id *)&self->_collectionView, v4);
  v9 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v10 = sub_10046DA38(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (UICollectionViewDiffableDataSource *)objc_msgSend(v9, "initWithCollectionView:cellProvider:", v4, v11);

  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v12;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController _buildSnapshotFromCurrentState](self, "_buildSnapshotFromCurrentState"));
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v14, 0);

}

- (void)_cellRequestsRemoveImageForIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A1AB64;
  v7[3] = &unk_1011AC888;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(WeakRetained, "photoCarouselController:requestsRemovingImageForIdentifier:completion:", self, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (unint64_t)totalNumberOfItems
{
  return (unint64_t)-[NSMutableArray count](self->_viewModels, "count") + 1;
}

- (void)_removeImageForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_viewModels;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = (unint64_t)v7 + v8;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10), "identifier", (_QWORD)v15));
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v11 = (unint64_t)v10 + v8;
          goto LABEL_12;
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  if (v11 < (unint64_t)-[NSMutableArray count](self->_viewModels, "count"))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_viewModels, "removeObjectAtIndex:", v11);
    -[UGCPhotoCarouselController _updateAddButtonState](self, "_updateAddButtonState");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController _buildSnapshotFromCurrentState](self, "_buildSnapshotFromCurrentState"));
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v14, 1);
    -[UGCPhotoCarouselController _invokeChangeHandler](self, "_invokeChangeHandler");

  }
}

- (void)_updateAddButtonState
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = (unint64_t)-[NSMutableArray count](self->_viewModels, "count") >= self->_maximumNumberOfPhotos;
  WeakRetained = objc_loadWeakRetained((id *)&self->_addCell);
  objc_msgSend(WeakRetained, "setDimmed:", v3);

}

- (id)_viewModelForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_viewModels;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_diffableDataSourceIdentifier", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AddPhotoCellIdentifier")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCAddPhotoCollectionViewCell reuseIdentifier](UGCAddPhotoCollectionViewCell, "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v9));

    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "setPrefersMenu:", self->_prefersMenu);
    v13 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_addCell);

    if (WeakRetained != v13)
      objc_storeWeak((id *)&self->_addCell, v13);
    -[UGCPhotoCarouselController _updateAddButtonState](self, "_updateAddButtonState");

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoCollectionViewCell reuseIdentifier](UGCPhotoCollectionViewCell, "reuseIdentifier"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v9));

    objc_msgSend(v13, "setDelegate:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController _viewModelForIdentifier:](self, "_viewModelForIdentifier:", v8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    objc_msgSend(v13, "setIdentifier:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
      objc_msgSend(v13, "setImage:", v19);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoDownloadManager sharedDownloadManager](UGCPhotoDownloadManager, "sharedDownloadManager"));
      objc_msgSend(v13, "beginAnimatingActivityIndicator");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController downloadToken](self, "downloadToken"));
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_100A1B158;
      v26 = &unk_1011DA420;
      v27 = v13;
      v28 = v16;
      objc_msgSend(v19, "fetchImageForPhotoInfo:downloadToken:completion:", v28, v20, &v23);

    }
  }
  objc_msgSend(v13, "_setContinuousCornerRadius:", 4.0, v23, v24, v25, v26);
  objc_msgSend(v13, "setClipsToBounds:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController cellBackgroundColor](self, "cellBackgroundColor"));
  objc_msgSend(v13, "setBackgroundColor:", v21);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  id v6;
  char v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AddPhotoCellIdentifier")))
  {
    if ((unint64_t)-[NSMutableArray count](self->_viewModels, "count") < self->_maximumNumberOfPhotos)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "photoCarouselControllerRequestsAddingNewPhoto:", self);
LABEL_6:

    }
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector(v6, "photoCarouselController:didSelectImageWithIdentifier:");

    if ((v7 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "photoCarouselController:didSelectImageWithIdentifier:", self, v8);
      goto LABEL_6;
    }
  }

}

- (id)_buildSnapshotFromCurrentState
{
  id v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  const __CFString *v21;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v21 = CFSTR("DefaultCarouselSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  v5 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_viewModels;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "_maps_diffableDataSourceIdentifier", (_QWORD)v16));
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == (id)5)
    objc_msgSend(v5, "addObject:", CFSTR("AddPhotoCellIdentifier"));
  else
    objc_msgSend(v5, "insertObject:atIndex:", CFSTR("AddPhotoCellIdentifier"), 0);
  v14 = objc_msgSend(v5, "copy", (_QWORD)v16);
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, CFSTR("DefaultCarouselSection"));

  return v3;
}

- (UIView)anchoringView
{
  UGCAddPhotoCollectionViewCell **p_addCell;
  id WeakRetained;
  uint8_t v5[16];

  p_addCell = &self->_addCell;
  WeakRetained = objc_loadWeakRetained((id *)&self->_addCell);

  if (WeakRetained)
    return (UIView *)objc_loadWeakRetained((id *)p_addCell);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _addCell != ((void *)0)", v5, 2u);
  }
  return (UIView *)0;
}

- (double)preferredCellHeight
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 90.0;
  if (v3 == (id)5)
    return 48.0;
  return result;
}

- (UIColor)collectionViewBackgroundColor
{
  return +[MapsTheme ugcPhotoCarouselCellBackgroundColor](MapsTheme, "ugcPhotoCarouselCellBackgroundColor");
}

- (void)photoCellDidCancel:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  -[UGCPhotoCarouselController _cellRequestsRemoveImageForIdentifier:](self, "_cellRequestsRemoveImageForIdentifier:", v4);

}

- (void)photoOptionsMenuButtonDidSelectTakePhoto
{
  UGCPhotoCarouselRequestDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:", self, 1);

  }
}

- (void)photoOptionsMenuButtonDidSelectAddFromLibrary
{
  UGCPhotoCarouselRequestDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:", self, 2);

  }
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UGCPhotoCarouselRequestDelegate)delegate
{
  return (UGCPhotoCarouselRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIBarButtonItem)anchoringBarButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_anchoringBarButtonItem);
}

- (BOOL)photoSliderShouldEnablePagingScroll
{
  return self->_photoSliderShouldEnablePagingScroll;
}

- (void)setPhotoSliderShouldEnablePagingScroll:(BOOL)a3
{
  self->_photoSliderShouldEnablePagingScroll = a3;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
}

- (unint64_t)maximumNumberOfPhotos
{
  return self->_maximumNumberOfPhotos;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_anchoringBarButtonItem);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_addCell);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
