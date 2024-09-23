@implementation PXPeopleStripCollectionViewController

- (PXPeopleStripCollectionViewController)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PXPeopleCollectionViewLayout *v9;
  PXPeopleStripCollectionViewController *v10;
  PXPeopleStripCollectionViewController *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleStripCollectionViewController.m"), 90, CFSTR("-initWithAssets:delegate: must have delegate"));

  }
  v9 = objc_alloc_init(PXPeopleCollectionViewLayout);
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleStripCollectionViewController;
  v10 = -[PXPeopleStripCollectionViewController initWithCollectionViewLayout:](&v14, sel_initWithCollectionViewLayout_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_dataSource, v7);
    objc_storeWeak((id *)&v11->_delegate, v8);
    -[UICollectionViewFlowLayout setScrollDirection:](v9, "setScrollDirection:", 1);
    -[PXPeopleStripCollectionViewController contentWidthChanged](v11, "contentWidthChanged");
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPeopleStripCollectionViewController;
  -[PXPeopleStripCollectionViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PXPeopleStripCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PeopleStripFaceCell"));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "_setShouldPrefetchCellsWhenPerformingReloadData:", 1);
  objc_msgSend(v3, "_setIndicatorInsetAdjustmentBehavior:", 1);
  objc_msgSend(v3, "setPrefetchDataSource:", self);
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v3, "setFocusGroupIdentifier:", 0);
  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_initWeak(&location, self);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXPeopleStripCollectionViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E5148D30;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "scheduleMainQueueTask:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)contentWidthChanged
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[PXPeopleStripCollectionViewController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeForItem");
  v4 = v3;
  v6 = v5;
  -[PXPeopleStripCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimumInteritemSpacing");
  *(float *)&v8 = v8;
  objc_msgSend(v7, "setMinimumInteritemSpacing:", floorf(*(float *)&v8));
  objc_msgSend(v10, "minimumLineSpacing");
  *(float *)&v9 = v9;
  objc_msgSend(v7, "setMinimumLineSpacing:", floorf(*(float *)&v9));
  objc_msgSend(v7, "setItemSize:", v4, v6);
  objc_msgSend(v10, "sectionInset");
  objc_msgSend(v7, "setSectionInset:");

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[PXPeopleStripCollectionViewController dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "memberAtIndex:", objc_msgSend(v10, "item"));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleStripCollectionViewController dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfMembers");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PeopleStripFaceCell"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleStripCollectionViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfMembers");
  if (v11 <= objc_msgSend(v7, "item"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleStripCollectionViewController.m"), 167, CFSTR("excess the face collections boundary"));

  }
  objc_msgSend(v10, "memberAtIndex:", objc_msgSend(v7, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleStripCollectionViewController _formattedPeopleForMember:](PXPeopleStripCollectionViewController, "_formattedPeopleForMember:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setBackgroundColor:", v14);
  objc_msgSend(v9, "setPeople:", v13);

  return v9;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  -[PXPeopleStripCollectionViewController collectionViewLayout](self, "collectionViewLayout", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetContentOffsetForProposedContentOffset:", x, y);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (PXPeopleStripCollectionViewControllerDelegate)delegate
{
  return (PXPeopleStripCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXPeopleDataSource)dataSource
{
  return (PXPeopleDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (PXPeopleStripCollectionViewCell)preloadedCell
{
  return self->_preloadedCell;
}

- (void)setPreloadedCell:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedCell, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__PXPeopleStripCollectionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  PXPeopleStripCollectionViewCell *v3;
  id v4;
  PXPeopleStripCollectionViewCell *v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = [PXPeopleStripCollectionViewCell alloc];
    v5 = -[PXPeopleStripCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PXPeopleStripCollectionViewCell layoutIfNeeded](v5, "layoutIfNeeded");
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "setPreloadedCell:", v5);

  }
}

+ (id)_formattedPeopleForMember:(id)a3
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleStripCollectionViewController.m"), 193, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v5, "modelObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v6 = v5;
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "peopleWidgetDisableSocialGroup"))
    goto LABEL_9;
  v8 = objc_msgSend(v6, "count");

  if (v8 >= 2)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
LABEL_10:

  return v6;
}

@end
