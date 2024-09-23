@implementation ICImagesAndMoviesScrollView

- (void)commonInitForAttachmentSection:(signed __int16)a3
{
  void *v5;
  id v6;
  id v7;
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
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ICImagesAndMoviesScrollView setBackgroundColor:](self, "setBackgroundColor:", v5);

  v29 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v29, "setScrollDirection:", 1);
  v6 = objc_alloc((Class)UICollectionView);
  -[ICImagesAndMoviesScrollView bounds](self, "bounds");
  v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v29);
  -[ICImagesAndMoviesScrollView setCollectionView:](self, "setCollectionView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v9, "setDataSource:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v10, "setDelegate:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v15, "setClipsToBounds:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICImageCollectionViewCell), CFSTR("Image"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v17, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICMovieCollectionViewCell), CFSTR("Movie"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v18, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICDrawingCollectionViewCell), CFSTR("Drawing"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  -[ICImagesAndMoviesScrollView addSubview:](self, "addSubview:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[ICImagesAndMoviesScrollView setChangesFromFetchedResultsController:](self, "setChangesFromFetchedResultsController:", v20);

  self->_attachmentSection = a3;
  -[ICImagesAndMoviesScrollView recreateFetchedResultsController](self, "recreateFetchedResultsController");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "notesContextRefreshNotification:", ICNotesContextRefreshNotification, 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "accountsDidChange:", ICAccountsDidChangeNotification, 0);
  v22 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "respondToTapGesture:");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v23, "addGestureRecognizer:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICBrowseAttachmentsDragAndDropDelegate sharedInstance](ICBrowseAttachmentsDragAndDropDelegate, "sharedInstance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v25, "setDragDelegate:", v24);

  v26 = objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
  -[ICImagesAndMoviesScrollView setContextInteraction:](self, "setContextInteraction:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView contextInteraction](self, "contextInteraction"));
  objc_msgSend(v27, "addInteraction:", v28);

  -[ICImagesAndMoviesScrollView registerForTraitChanges](self, "registerForTraitChanges");
}

- (id)initForAttachmentSection:(signed __int16)a3
{
  uint64_t v3;
  ICImagesAndMoviesScrollView *v4;
  ICImagesAndMoviesScrollView *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICImagesAndMoviesScrollView;
  v4 = -[ICImagesAndMoviesScrollView init](&v7, "init");
  v5 = v4;
  if (v4)
    -[ICImagesAndMoviesScrollView commonInitForAttachmentSection:](v4, "commonInitForAttachmentSection:", v3);
  return v5;
}

- (ICImagesAndMoviesScrollView)initWithFrame:(CGRect)a3 forAttachmentSection:(signed __int16)a4
{
  uint64_t v4;
  ICImagesAndMoviesScrollView *v5;
  ICImagesAndMoviesScrollView *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ICImagesAndMoviesScrollView;
  v5 = -[ICImagesAndMoviesScrollView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[ICImagesAndMoviesScrollView commonInitForAttachmentSection:](v5, "commonInitForAttachmentSection:", v4);
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, ICNotesContextRefreshNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, ICAccountsDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)ICImagesAndMoviesScrollView;
  -[ICImagesAndMoviesScrollView dealloc](&v4, "dealloc");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICImagesAndMoviesScrollView;
  -[ICImagesAndMoviesScrollView layoutSubviews](&v3, "layoutSubviews");
  -[ICImagesAndMoviesScrollView updateCollectionViewItemSizeAndFrame](self, "updateCollectionViewItemSizeAndFrame");
}

- (void)setBackground
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor ICBackgroundColor](UIColor, "ICBackgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)respondToTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9));

  if (v15)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexPath:", v15));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
    objc_msgSend(v13, "browseAttachmentsCollectionView:didSelectAttachment:indexPath:", v14, v12, 0);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sections"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = objc_msgSend(v7, "numberOfObjects");
  return (int64_t)v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v7));

  v10 = objc_msgSend(v9, "attachmentType");
  if (v10 == 3)
  {
LABEL_9:
    v11 = CFSTR("Image");
    goto LABEL_10;
  }
  if (v10 == 9)
  {
    v11 = CFSTR("Drawing");
    goto LABEL_10;
  }
  if (v10 != 5)
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10040A274(v9, v12);

    goto LABEL_9;
  }
  v11 = CFSTR("Movie");
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v7));
  objc_msgSend(v13, "setAttachment:", v9);
  objc_msgSend(v13, "setThumbnailLayout:", -[ICImagesAndMoviesScrollView thumbnailLayout](self, "thumbnailLayout"));
  v14 = objc_opt_class(ICBrowseAttachmentsCollectionController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView viewController](self, "viewController"));
  v16 = ICDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v13, "setCollectionController:", v17);

  objc_msgSend(v13, "setScrollView:", self);
  objc_msgSend(v13, "setDelegate:", self);

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  return objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", a4, CFSTR("Padding"), a5);
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  id v9;
  void *v10;

  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a5));
  LOBYTE(a4) = objc_msgSend(v10, "canPerformAction:withSender:", a4, v9);

  return (char)a4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
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
  double v20;
  double v21;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if ((id)-[ICImagesAndMoviesScrollView scrollDirection](self, "scrollDirection") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexPath:", v8));

    objc_msgSend(v10, "intrinsicContentSize");
    v12 = v11;
    v14 = v13;
    -[ICImagesAndMoviesScrollView bounds](self, "bounds");
    v16 = v15;
    v17 = v15;
    if (v12 > 0.0)
    {
      v17 = v15;
      if (v14 > 0.0)
        v17 = ceil(v12 / v14 * v15);
    }

  }
  else
  {
    objc_msgSend(v7, "itemSize");
    v17 = v18;
    v16 = v19;
  }

  v20 = v17;
  v21 = v16;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  void *v29;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_cellAtLocation:", x, y));

  if (v8 && objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___ICNotePreviewingActions))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView ic_viewControllerManager](self, "ic_viewControllerManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previewActionsForViewControllerManager:fromView:", v10, self));

    v12 = objc_opt_class(ICBrowseAttachmentsBaseCell);
    v13 = ICDynamicCast(v12, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v14
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attachment")), v16, v16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView ic_viewControllerManager](self, "ic_viewControllerManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attachment"));
      v29 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPresenter previewViewControllerWithViewControllerManager:attachments:startingAtIndex:delegate:editable:isFromAttachmentBrowser:](ICAttachmentPresenter, "previewViewControllerWithViewControllerManager:attachments:startingAtIndex:delegate:editable:isFromAttachmentBrowser:", v17, v19, 0, 0, 0, 0));

    }
    else
    {
      v20 = 0;
    }
    v26 = v11;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000BB3A0;
    v27[3] = &unk_100553DF0;
    v28 = v20;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000BB3A8;
    v25[3] = &unk_100553E18;
    v22 = v11;
    v23 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v27, v25));

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_cellAtLocation:", v10, v12));
  v14 = ICProtocolCast(&OBJC_PROTOCOL___ICContextMenuInteractionPreviewProviding, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contextMenuInteractionPreview"));
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v13;
  v19 = v18;

  if (v19)
    v20 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v19);
  else
    v20 = 0;

  return v20;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v8, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForItemAtPoint:", v12, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexPath:", v15));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000BB600;
  v20[3] = &unk_100550020;
  v20[4] = self;
  v21 = v17;
  v22 = v15;
  v18 = v15;
  v19 = v17;
  objc_msgSend(v7, "addCompletion:", v20);

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  ICFetchedResultsControllerChange *v15;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v15 = objc_alloc_init(ICFetchedResultsControllerChange);
  -[ICFetchedResultsControllerChange setType:](v15, "setType:", a6);
  -[ICFetchedResultsControllerChange setObject:](v15, "setObject:", v13);

  -[ICFetchedResultsControllerChange setIndexPath:](v15, "setIndexPath:", v12);
  -[ICFetchedResultsControllerChange setTheNewIndexPath:](v15, "setTheNewIndexPath:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView changesFromFetchedResultsController](self, "changesFromFetchedResultsController"));
  objc_msgSend(v14, "addObject:", v15);

}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[ICImagesAndMoviesScrollView setPerformingBatchUpdatesFromFetchedResultsController:](self, "setPerformingBatchUpdatesFromFetchedResultsController:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BB7B8;
  v6[3] = &unk_100550110;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BBA2C;
  v5[3] = &unk_100550BE8;
  objc_msgSend(v4, "performBatchUpdates:completion:", v6, v5);

}

- (void)notesContextRefreshNotification:(id)a3
{
  id v4;

  if (-[ICImagesAndMoviesScrollView performingBatchUpdatesFromFetchedResultsController](self, "performingBatchUpdatesFromFetchedResultsController", a3))
  {
    -[ICImagesAndMoviesScrollView setReloadDataAfterBatchUpdates:](self, "setReloadDataAfterBatchUpdates:", 1);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
    objc_msgSend(v4, "reloadData");

  }
}

- (void)accountsDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;

  v4 = objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
    v10 = 0;
    v7 = objc_msgSend(v6, "performFetch:", &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
    {
      v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10040A300((uint64_t)self, (uint64_t)v8, v9);

    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)recreateFetchedResultsController
{
  void *v3;
  id v4;
  id v5;
  void *v6;
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
  double v18;
  double v19;
  double v20;
  float v21;
  unint64_t v22;
  double v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
  objc_msgSend(v3, "setDelegate:", 0);

  -[ICImagesAndMoviesScrollView setFetchedResultsController:](self, "setFetchedResultsController:", 0);
  v4 = +[ICAttachment newFetchRequestForAttachments](ICAttachment, "newFetchRequestForAttachments");
  v5 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v30 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("section"), -[ICImagesAndMoviesScrollView attachmentSection](self, "attachmentSection")));
  v29[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("previewImages")));
  v29[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachment predicateForAttachmentBrowserWithContext:](ICAttachment, "predicateForAttachmentBrowserWithContext:", v10));
  v29[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v12));

  if (-[ICImagesAndMoviesScrollView attachmentSection](self, "attachmentSection") == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("sizeWidth"), 50));
    v28[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("sizeHeight"), 50));
    v28[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
    objc_msgSend(v13, "addObjectsFromArray:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));
  objc_msgSend(v4, "setPredicate:", v17);

  -[ICImagesAndMoviesScrollView bounds](self, "bounds");
  if (v18 > 0.0)
  {
    -[ICImagesAndMoviesScrollView bounds](self, "bounds");
    if (v19 > 0.0)
    {
      -[ICImagesAndMoviesScrollView bounds](self, "bounds");
      v21 = v20 * 0.0078125;
      v22 = vcvtps_u32_f32(v21);
      if ((id)-[ICImagesAndMoviesScrollView scrollDirection](self, "scrollDirection") != (id)1)
      {
        -[ICImagesAndMoviesScrollView bounds](self, "bounds");
        v24 = v23 * 0.0078125;
        v22 *= vcvtps_u32_f32(v24);
      }
      objc_msgSend(v4, "setFetchBatchSize:", v22);
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fetchedResultsControllerForFetchRequest:sectionNameKeyPath:", v4, 0));
  -[ICImagesAndMoviesScrollView setFetchedResultsController:](self, "setFetchedResultsController:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
  objc_msgSend(v27, "setDelegate:", self);

}

- (void)updateCollectionViewItemSizeAndFrame
{
  double v3;
  double v4;
  CGFloat Height;
  void *v6;
  double v7;
  void *v8;
  double left;
  double top;
  double bottom;
  double right;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  double *v18;
  double v19;
  id v20;
  CGRect v21;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionViewFlowLayout](self, "collectionViewFlowLayout"));
  -[ICImagesAndMoviesScrollView bounds](self, "bounds");
  if (v3 > 0.0)
  {
    v4 = v3;
    if ((id)-[ICImagesAndMoviesScrollView scrollDirection](self, "scrollDirection") == (id)1)
    {
      -[ICImagesAndMoviesScrollView frame](self, "frame");
      Height = CGRectGetHeight(v21);
      objc_msgSend(v20, "setItemSize:", Height, Height);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView traitCollection](self, "traitCollection"));
      v7 = 4.0;
      if (objc_msgSend(v6, "horizontalSizeClass") != (id)1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView traitCollection](self, "traitCollection"));
        if (objc_msgSend(v8, "verticalSizeClass") == (id)1)
          v7 = 4.0;
        else
          v7 = 12.0;

      }
      objc_msgSend(v20, "setMinimumInteritemSpacing:", v7);
      objc_msgSend(v20, "setMinimumLineSpacing:", 4.0);
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
      v13 = v20;
      goto LABEL_19;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v14, "horizontalSizeClass") == (id)1)
    {

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView traitCollection](self, "traitCollection"));
      v16 = objc_msgSend(v15, "verticalSizeClass");

      if (v16 != (id)1)
      {
        objc_msgSend(v20, "setItemSize:", 128.0, 128.0);
        top = 12.0;
        objc_msgSend(v20, "setMinimumInteritemSpacing:", 12.0);
        objc_msgSend(v20, "setMinimumLineSpacing:", 12.0);
        v13 = v20;
        left = 28.0;
        bottom = 0.0;
        right = 28.0;
LABEL_19:
        objc_msgSend(v13, "setSectionInset:", top, left, bottom, right);
        goto LABEL_20;
      }
    }
    v17 = dword_1005CDB28;
    if (dword_1005CDB28)
    {
      v18 = (double *)&qword_1004519B8;
      while (*(v18 - 2) != v4)
      {
        v18 += 4;
        if (!--v17)
          goto LABEL_16;
      }
      objc_msgSend(v20, "setItemSize:", *(v18 - 1), *(v18 - 1));
      objc_msgSend(v20, "setMinimumInteritemSpacing:", *v18);
      objc_msgSend(v20, "setMinimumLineSpacing:", v18[1]);
      v13 = v20;
      top = 0.0;
      left = 0.0;
      bottom = 0.0;
      right = 0.0;
    }
    else
    {
LABEL_16:
      v19 = floor((v4 + -2.0 + -10.0) / 6.0);
      objc_msgSend(v20, "setItemSize:", v19, v19);
      objc_msgSend(v20, "setMinimumInteritemSpacing:", 2.0);
      objc_msgSend(v20, "setMinimumLineSpacing:", 2.0);
      v13 = v20;
      left = 1.0;
      top = 0.0;
      bottom = 0.0;
      right = 1.0;
    }
    goto LABEL_19;
  }
LABEL_20:

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  uint64_t v8;

  objc_initWeak(&location, self);
  v8 = objc_opt_class(UITraitHorizontalSizeClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BC2AC;
  v5[3] = &unk_100550500;
  objc_copyWeak(&v6, &location);
  v4 = -[ICImagesAndMoviesScrollView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (UICollectionViewFlowLayout)collectionViewFlowLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionViewLayout"));

  return (UICollectionViewFlowLayout *)v3;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  id v4;

  if (self->_attachmentSection != a3)
  {
    self->_attachmentSection = a3;
    -[ICImagesAndMoviesScrollView recreateFetchedResultsController](self, "recreateFetchedResultsController");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setScrollDirection:(int64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionViewFlowLayout](self, "collectionViewFlowLayout"));
  objc_msgSend(v5, "setScrollDirection:", a3);

  -[ICImagesAndMoviesScrollView updateCollectionViewItemSizeAndFrame](self, "updateCollectionViewItemSizeAndFrame");
}

- (int64_t)scrollDirection
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionViewFlowLayout](self, "collectionViewFlowLayout"));
  v3 = objc_msgSend(v2, "scrollDirection");

  return (int64_t)v3;
}

- (unint64_t)thumbnailLayout
{
  void *v4;
  void *v5;
  id v6;

  if (-[ICImagesAndMoviesScrollView scrollDirection](self, "scrollDirection"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v4, "horizontalSizeClass") == (id)1)
  {

    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "verticalSizeClass");

  if (v6 == (id)1)
    return 0;
  return 2;
}

- (NSArray)attachments
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedObjects"));

  return (NSArray *)v3;
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ICImagesAndMoviesScrollView *v9;
  uint64_t v10;
  ICImagesAndMoviesScrollView *v11;
  ICImagesAndMoviesScrollView *v12;
  ICImagesAndMoviesScrollView *v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView fetchedResultsController](self, "fetchedResultsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForObject:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  v9 = (ICImagesAndMoviesScrollView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v7));

  v10 = objc_opt_class(ICImagesAndMoviesBaseCell);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = (ICImagesAndMoviesScrollView *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView thumbnailView](v9, "thumbnailView"));
  }
  else
  {
    if (v9)
      v12 = v9;
    else
      v12 = self;
    v11 = v12;
  }
  v13 = v11;

  return v13;
}

- (BOOL)browseAttachmentsCell:(id)a3 didSelectAttachment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView delegate](self, "delegate"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
    objc_msgSend(v7, "browseAttachmentsCollectionView:didSelectAttachment:indexPath:", v8, v5, 0);

  }
  return v6 != 0;
}

- (void)browseAttachmentsCell:(id)a3 shouldShareAttachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
  objc_msgSend(v9, "browseAttachmentsCollectionView:cell:shouldShareAttachment:", v8, v7, v6);

}

- (void)browseAttachmentsCell:(id)a3 shouldInspectAttachment:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "browseAttachmentsCollectionView:shouldInspectAttachment:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](self, "collectionView"));
    objc_msgSend(v7, "browseAttachmentsCollectionView:shouldInspectAttachment:", v8, v9);

  }
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (ICBrowseAttachmentsCollectionDelegate)delegate
{
  return (ICBrowseAttachmentsCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (NSMutableArray)changesFromFetchedResultsController
{
  return self->_changesFromFetchedResultsController;
}

- (void)setChangesFromFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_changesFromFetchedResultsController, a3);
}

- (BOOL)performingBatchUpdatesFromFetchedResultsController
{
  return self->_performingBatchUpdatesFromFetchedResultsController;
}

- (void)setPerformingBatchUpdatesFromFetchedResultsController:(BOOL)a3
{
  self->_performingBatchUpdatesFromFetchedResultsController = a3;
}

- (BOOL)reloadDataAfterBatchUpdates
{
  return self->_reloadDataAfterBatchUpdates;
}

- (void)setReloadDataAfterBatchUpdates:(BOOL)a3
{
  self->_reloadDataAfterBatchUpdates = a3;
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setContextInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_changesFromFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
