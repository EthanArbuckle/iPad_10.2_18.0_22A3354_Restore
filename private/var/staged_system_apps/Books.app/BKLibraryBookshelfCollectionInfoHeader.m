@implementation BKLibraryBookshelfCollectionInfoHeader

+ (double)_cachedHeight:(id)a3 withDataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  id v23;
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
  void *v35;
  _QWORD v37[4];
  _QWORD v38[4];

  v5 = a3;
  v6 = a4;
  if (qword_1009F50B0 != -1)
    dispatch_once(&qword_1009F50B0, &stru_1008EBEC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionInfoLabelFontAttributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", CFSTR(" "), v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudButtonFontAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", CFSTR(" "), v10));

  objc_msgSend(v7, "collectionInfoHeaderVerticalMargin");
  v13 = v12;
  objc_msgSend(v7, "cloudButtonSpacing");
  v15 = 0;
  if (!v9)
    goto LABEL_7;
  if (!v11)
    goto LABEL_7;
  v16 = v14;
  v37[0] = CFSTR("attributedInfoText");
  v37[1] = CFSTR("attributedCloudText");
  v38[0] = v9;
  v38[1] = v11;
  v37[2] = CFSTR("vertMargin");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
  v38[2] = v17;
  v37[3] = CFSTR("spacing");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
  v38[3] = v18;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 4));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1009F50B8, "objectForKeyedSubscript:", v15));
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v19, "doubleValue");
    v22 = v21;
  }
  else
  {
LABEL_7:
    v20 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v20, "setAttributedText:", v9);
    v23 = objc_alloc_init((Class)IMTouchInsetsButton);
    objc_msgSend(v23, "setContentEdgeInsets:", 0.0, 0.0, 0.0, -1.0);
    objc_msgSend(v23, "setAttributedTitle:forState:", v11, 0);
    objc_msgSend(v5, "frame");
    v25 = v24;
    v27 = v26;
    objc_msgSend(v20, "sizeThatFits:", v24, v26);
    v29 = v28;
    objc_msgSend(v23, "sizeThatFits:", v25, v27);
    v31 = v29 + v30;
    objc_msgSend(v7, "collectionInfoHeaderVerticalMargin");
    v33 = v31 + v32 * 2.0;
    objc_msgSend(v7, "cloudButtonSpacing");
    v22 = ceil(v34 + v33);
    if (v15)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
      objc_msgSend((id)qword_1009F50B8, "setObject:forKeyedSubscript:", v35, v15);

    }
  }

  return v22;
}

+ (void)adjustHeight:(id)a3 withDataSource:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v6 = a4;
  v15 = a3;
  objc_msgSend(v15, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "_cachedHeight:withDataSource:", v15, v6);
  v14 = v13;

  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
}

- (BKLibraryBookshelfCollectionInfoHeader)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfCollectionInfoHeader *v3;
  BKLibraryBookshelfCollectionInfoHeader *v4;
  UILabel *v5;
  UILabel *infoLabel;
  IMTouchInsetsButton *v7;
  IMTouchInsetsButton *cloudButton;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BUCoalescingCallBlock *v13;
  BUCoalescingCallBlock *coalescedReloadData;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  v3 = -[BKLibraryBookshelfCollectionInfoHeader initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKLibraryBookshelfCollectionInfoHeader setTag:](v3, "setTag:", 47);
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    infoLabel = v4->_infoLabel;
    v4->_infoLabel = v5;

    -[BKLibraryBookshelfCollectionInfoHeader addSubview:](v4, "addSubview:", v4->_infoLabel);
    v7 = (IMTouchInsetsButton *)objc_alloc_init((Class)IMTouchInsetsButton);
    cloudButton = v4->_cloudButton;
    v4->_cloudButton = v7;

    -[IMTouchInsetsButton setContentEdgeInsets:](v4->_cloudButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, -1.0);
    -[BKLibraryBookshelfCollectionInfoHeader addSubview:](v4, "addSubview:", v4->_cloudButton);
    -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](v4, "updateCloudButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, "networkReachabilityChanged:", CFSTR("kNetworkReachabilityChangedNotification"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, "_mocWillSave:", NSManagedObjectContextWillSaveNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("expectedDate"), CFSTR("isSample"), CFSTR("state"), CFSTR("purchasedAndLocalParent"), CFSTR("seriesContainer"), 0));
    -[BKLibraryBookshelfCollectionInfoHeader setPropertiesOfInterest:](v4, "setPropertiesOfInterest:", v11);

    objc_initWeak(&location, v4);
    v12 = objc_alloc((Class)BUCoalescingCallBlock);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001376C0;
    v16[3] = &unk_1008E8718;
    objc_copyWeak(&v17, &location);
    v13 = (BUCoalescingCallBlock *)objc_msgSend(v12, "initWithNotifyBlock:blockDescription:", v16, CFSTR("BKLibraryBookshelfCollectionInfoHeader"));
    coalescedReloadData = v4->_coalescedReloadData;
    v4->_coalescedReloadData = v13;

    -[BUCoalescingCallBlock setCoalescingDelay:](v4->_coalescedReloadData, "setCoalescingDelay:", 1.0);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UINavigationController *uploadProgressNavigationController;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("sortMode"), off_1009CB438);

  if (-[BKLibraryBookshelfCollectionInfoHeader isObservingPropertyChanges](self, "isObservingPropertyChanges"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uploadAssets"));
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("arrangedObjects"), off_1009CB440);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("uploadStatus"), off_1009CB448);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryImportStatusController sharedController](BKLibraryImportStatusController, "sharedController"));
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("totalImportOperationsProcessed"), off_1009CB450);

  }
  uploadProgressNavigationController = self->_uploadProgressNavigationController;
  if (uploadProgressNavigationController)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController popoverPresentationController](uploadProgressNavigationController, "popoverPresentationController"));
    objc_msgSend(v9, "setDelegate:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader actionHandler](self, "actionHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentationController"));
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  -[BKLibraryBookshelfCollectionInfoHeader dealloc](&v12, "dealloc");
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader window](self, "window"));
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    if (!-[BKLibraryBookshelfCollectionInfoHeader isObservingPropertyChanges](self, "isObservingPropertyChanges"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uploadAssets"));
      objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("arrangedObjects"), 1, off_1009CB440);
      objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("uploadStatus"), 1, off_1009CB448);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryImportStatusController sharedController](BKLibraryImportStatusController, "sharedController"));
      objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("totalImportOperationsProcessed"), 1, off_1009CB450);

      -[BKLibraryBookshelfCollectionInfoHeader setIsObservingPropertyChanges:](self, "setIsObservingPropertyChanges:", 1);
    }
    goto LABEL_10;
  }
  if (v4 || !v5)
  {
    if (v4)
    {
LABEL_10:
      -[BKLibraryBookshelfCollectionInfoHeader updateCounts](self, "updateCounts");
      -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](self, "updateCloudButton");
      -[BKLibraryBookshelfCollectionInfoHeader setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else if (-[BKLibraryBookshelfCollectionInfoHeader isObservingPropertyChanges](self, "isObservingPropertyChanges"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uploadAssets"));
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("arrangedObjects"), off_1009CB440);
    objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("uploadStatus"), off_1009CB448);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryImportStatusController sharedController](BKLibraryImportStatusController, "sharedController"));
    objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("totalImportOperationsProcessed"), off_1009CB450);

    -[BKLibraryBookshelfCollectionInfoHeader setIsObservingPropertyChanges:](self, "setIsObservingPropertyChanges:", 0);
  }
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  -[BKLibraryBookshelfCollectionInfoHeader willMoveToWindow:](&v13, "willMoveToWindow:", v4);

}

- (void)setActionHandler:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_actionHandler, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader cloudButton](self, "cloudButton"));
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", 0, 0, 64);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "uploadProgressButtonPressed:", 64);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat Width;
  CGFloat v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27.receiver = self;
  v27.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  -[BKLibraryBookshelfCollectionInfoHeader layoutSubviews](&v27, "layoutSubviews");
  -[BKLibraryBookshelfCollectionInfoHeader bounds](self, "bounds");
  v4 = v3;
  v25 = v5;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader infoLabel](self, "infoLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader cloudButton](self, "cloudButton"));
  objc_msgSend(v10, "sizeThatFits:", v7, v9);
  v13 = v12;
  objc_msgSend(v11, "sizeThatFits:", v7, v9);
  v26 = v14;
  v16 = v15;
  if (-[BKLibraryBookshelfCollectionInfoHeader wantsCloudButton](self, "wantsCloudButton"))
  {
    -[BKLibraryBookshelfCollectionInfoHeader cloudButtonSpacing](self, "cloudButtonSpacing");
    v18 = v17;
LABEL_4:
    v22 = v13 + v16 + v18;
    v21 = 1.0;
    goto LABEL_5;
  }
  v19 = -[BKLibraryBookshelfCollectionInfoHeader waitingForCloudButtonHideDelay](self, "waitingForCloudButtonHideDelay");
  -[BKLibraryBookshelfCollectionInfoHeader cloudButtonSpacing](self, "cloudButtonSpacing");
  v18 = v20;
  v21 = 0.0;
  v22 = v13;
  if (v19)
    goto LABEL_4;
LABEL_5:
  v28.origin.x = v4;
  v28.origin.y = v25;
  v28.size.width = v7;
  v28.size.height = v9;
  v23 = floor((CGRectGetHeight(v28) - v22) * 0.5);
  objc_msgSend(v11, "setAlpha:", v21);
  v29.origin.x = v4;
  v29.origin.y = v25;
  v29.size.width = v7;
  v29.size.height = v9;
  objc_msgSend(v10, "setFrame:", v4, v23, CGRectGetWidth(v29), v13);
  v30.origin.x = v4;
  v30.origin.y = v25;
  v30.size.width = v7;
  v30.size.height = v9;
  objc_msgSend(v11, "setFrame:", v4, v18 + v13 + v23, CGRectGetWidth(v30), v16);
  v31.origin.x = v4;
  v31.origin.y = v25;
  v31.size.width = v7;
  v31.size.height = v9;
  Width = CGRectGetWidth(v31);
  objc_msgSend(v11, "setTouchInsets:", 0.0, (Width - v26) * 0.5, 0.0, (Width - v26) * 0.5);

}

- (id)importStatusString
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryImportStatusController sharedController](BKLibraryImportStatusController, "sharedController"));
  v3 = objc_msgSend(v2, "totalImportOperations");
  v4 = objc_msgSend(v2, "completedImportOperations");
  v5 = objc_msgSend(v2, "failedImportOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Importing: %ld of %ld. Failed: %ld"), &stru_10091C438, 0));

  if (v3)
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v4, v3, v5));

  return v3;
}

- (void)updateCloudButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader importStatusString](self, "importStatusString"));
  if (objc_msgSend(v9, "length"))
  {
    v3 = v9;
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(+[BKLibraryUploadStatusViewController titleForUploadButton](BKLibraryUploadStatusViewController, "titleForUploadButton"));

    v3 = (void *)v4;
  }
  v10 = v3;
  if (objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader cloudButton](self, "cloudButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudButtonFontAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v10, v7));
    objc_msgSend(v5, "setAttributedTitle:forState:", v8, 0);

    -[BKLibraryBookshelfCollectionInfoHeader setWantsCloudButton:](self, "setWantsCloudButton:", 1);
    -[BKLibraryBookshelfCollectionInfoHeader setWaitingForCloudButtonHideDelay:](self, "setWaitingForCloudButtonHideDelay:", 0);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedHideCloudStatus", 0);
  }
  else if (-[BKLibraryBookshelfCollectionInfoHeader wantsCloudButton](self, "wantsCloudButton"))
  {
    -[BKLibraryBookshelfCollectionInfoHeader setWantsCloudButton:](self, "setWantsCloudButton:", 0);
    if (!-[BKLibraryBookshelfCollectionInfoHeader waitingForCloudButtonHideDelay](self, "waitingForCloudButtonHideDelay"))
    {
      -[BKLibraryBookshelfCollectionInfoHeader setWaitingForCloudButtonHideDelay:](self, "setWaitingForCloudButtonHideDelay:", 1);
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedHideCloudStatus", 0);
      -[BKLibraryBookshelfCollectionInfoHeader performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_delayedHideCloudStatus", 0, 10.0);
    }
  }

}

- (void)_delayedHideCloudStatus
{
  void *v3;

  if (-[BKLibraryBookshelfCollectionInfoHeader waitingForCloudButtonHideDelay](self, "waitingForCloudButtonHideDelay"))
  {
    -[BKLibraryBookshelfCollectionInfoHeader setWaitingForCloudButtonHideDelay:](self, "setWaitingForCloudButtonHideDelay:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader superview](self, "superview"));

    if (v3)
      -[BKLibraryBookshelfCollectionInfoHeader updateAndLayoutCloudButtonAnimated](self, "updateAndLayoutCloudButtonAnimated");
  }
}

- (id)bookTypeStringFromBookType:(signed __int16)a3 count:(unint64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  switch(a3)
  {
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("%lu books");
      break;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("%lu PDFs");
      break;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("%lu audiobooks");
      break;
    case 4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("%lu series");
      break;
    default:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("%lu unknown");
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10091C438, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, a4));
  return v9;
}

- (void)updateCounts
{
  BKLibraryBookshelfCollectionInfoHeader *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  double v47;
  double v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  BKLibraryBookshelfCollectionInfoHeader *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE v81[128];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v2 = self;
  if (-[BKLibraryBookshelfCollectionInfoHeader isSeriesCollection](self, "isSeriesCollection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v79 = 0;
    v80 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](v2, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesID"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uiChildContext"));
    objc_msgSend(v3, "countOfSeriesLibraryAssetsWithSeriesID:total:purchased:context:", v5, &v80, &v79, v6);

    if (v79)
    {
      if (v79 != v80)
      {
        v70 = v3;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v53, 1));

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v80));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v54, 1));

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("You’ve purchased %@ of %@ books in this series."), &stru_10091C438, 0));

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v11, v15));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](v2, "mainHeaderMetrics"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "collectionInfoLabelFontAttributes"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v43, v57));

        objc_msgSend(v58, "size");
        v60 = v59;
        -[BKLibraryBookshelfCollectionInfoHeader bounds](v2, "bounds");
        if (v60 > CGRectGetWidth(v85))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("%@ of %@ Purchased."), &stru_10091C438, 0));

          v63 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v11, v15));
          v43 = (void *)v63;
        }

        v3 = v70;
        goto LABEL_40;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("You’ve purchased all the books in this series."), &stru_10091C438, 0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](v2, "mainHeaderMetrics"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionInfoLabelFontAttributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v8, v10));

      objc_msgSend(v11, "size");
      v13 = v12;
      -[BKLibraryBookshelfCollectionInfoHeader bounds](v2, "bounds");
      if (v13 > CGRectGetWidth(v82))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = v14;
        v16 = CFSTR("All books purchased.");
LABEL_31:
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_10091C438, 0));
LABEL_40:

        v8 = v43;
      }
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("You haven’t purchased any books in this series."), &stru_10091C438, 0));

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](v2, "mainHeaderMetrics"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "collectionInfoLabelFontAttributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v8, v40));

      objc_msgSend(v11, "size");
      v42 = v41;
      -[BKLibraryBookshelfCollectionInfoHeader bounds](v2, "bounds");
      if (v42 > CGRectGetWidth(v83))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = v14;
        v16 = CFSTR("No books purchased.");
        goto LABEL_31;
      }
    }

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](v2, "mainHeaderMetrics"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "collectionInfoLabelFontAttributes"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v8, v65));
    -[UILabel setAttributedText:](v2->_infoLabel, "setAttributedText:", v66);

    goto LABEL_42;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR(", "), &stru_10091C438, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader frc](v2, "frc"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sections"));
  v21 = objc_msgSend(v20, "mutableCopy");

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v23)
  {
    v24 = v23;
    v67 = v18;
    v68 = v2;
    v69 = v3;
    v71 = 0;
    v73 = 0;
    v74 = 0;
    v72 = 0;
    v25 = 0;
    v26 = 0;
    v27 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v76 != v27)
          objc_enumerationMutation(v22);
        v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
        v30 = objc_msgSend(v29, "numberOfObjects");
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
        v32 = objc_msgSend(v31, "integerValue");

        switch((unint64_t)v32)
        {
          case 1uLL:
          case 2uLL:
          case 4uLL:
            v25 += (uint64_t)v30;
            break;
          case 3uLL:
            v73 += (uint64_t)v30;
            break;
          case 5uLL:
            v71 += (uint64_t)v30;
            break;
          case 6uLL:
            v72 += (uint64_t)v30;
            break;
          default:
            v74 += (uint64_t)v30;
            break;
        }
        v26 += (uint64_t)v30;
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v24);

    v18 = v67;
    if (v25)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v68, "bookTypeStringFromBookType:count:", 1, v25));
      objc_msgSend(v67, "addObject:", v33);

    }
    v2 = v68;
    if (v71)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v68, "bookTypeStringFromBookType:count:", 4));
      objc_msgSend(v67, "addObject:", v34);

    }
    if (v72)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v68, "bookTypeStringFromBookType:count:", 3));
      objc_msgSend(v67, "addObject:", v35);

    }
    v3 = v69;
    if (v73)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v68, "bookTypeStringFromBookType:count:", 2));
      objc_msgSend(v67, "addObject:", v36);

    }
    if (!v74)
      goto LABEL_34;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v68, "bookTypeStringFromBookType:count:", 0));
    objc_msgSend(v67, "addObject:", v37);
  }
  else
  {
    v26 = 0;
    v37 = v22;
  }

LABEL_34:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", v3));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](v2, "mainHeaderMetrics"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "collectionInfoLabelFontAttributes"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v8, v45));

  objc_msgSend(v46, "size");
  v48 = v47;
  -[BKLibraryBookshelfCollectionInfoHeader bounds](v2, "bounds");
  if (v48 > CGRectGetWidth(v84))
  {
    v49 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v2, "bookTypeStringFromBookType:count:", 1, v26));

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](v2, "mainHeaderMetrics"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "collectionInfoLabelFontAttributes"));
    v52 = objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v49, v51));

    v46 = (void *)v52;
    v8 = (void *)v49;
  }
  -[UILabel setAttributedText:](v2->_infoLabel, "setAttributedText:", v46);

LABEL_42:
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  -[BKLibraryBookshelfCollectionInfoHeader applyLayoutAttributes:](&v37, "applyLayoutAttributes:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader attrs](self, "attrs"));
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    -[BKLibraryBookshelfCollectionInfoHeader setAttrs:](self, "setAttrs:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    -[BKLibraryBookshelfCollectionInfoHeader setIsRTL:](self, "setIsRTL:", objc_msgSend(v8, "userInterfaceLayoutDirection") == (id)1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader infoLabel](self, "infoLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader cloudButton](self, "cloudButton"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader attrs](self, "attrs"));
    v12 = objc_msgSend(v11, "layoutDebugMode");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "colorWithAlphaComponent:", 0.2)));
      v15 = objc_msgSend(v14, "CGColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader layer](self, "layer"));
      objc_msgSend(v16, "setBorderColor:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader layer](self, "layer"));
      objc_msgSend(v17, "setBorderWidth:", 0.5);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorWithAlphaComponent:", 0.2)));
      v20 = objc_msgSend(v19, "CGColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
      objc_msgSend(v21, "setBorderColor:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
      objc_msgSend(v22, "setBorderWidth:", 0.5);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "colorWithAlphaComponent:", 0.2)));
      v25 = objc_msgSend(v24, "CGColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v26, "setBorderColor:", v25);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      v28 = v27;
      v29 = 0.5;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader layer](self, "layer"));
      objc_msgSend(v30, "setBorderWidth:", 0.0);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
      objc_msgSend(v31, "setBorderWidth:", 0.0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      v28 = v27;
      v29 = 0.0;
    }
    objc_msgSend(v27, "setBorderWidth:", v29);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader attrs](self, "attrs"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "mainHeaderMetrics"));

    -[BKLibraryBookshelfCollectionInfoHeader setMainHeaderMetrics:](self, "setMainHeaderMetrics:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader backgroundColor](self, "backgroundColor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "headerBackgroundColor"));

    if (v34 != v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "headerBackgroundColor"));
      -[BKLibraryBookshelfCollectionInfoHeader setBackgroundColor:](self, "setBackgroundColor:", v36);

    }
    objc_msgSend(v10, "setContentHorizontalAlignment:", 0);
    objc_msgSend(v33, "cloudButtonSpacing");
    -[BKLibraryBookshelfCollectionInfoHeader setCloudButtonSpacing:](self, "setCloudButtonSpacing:");
    -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](self, "updateCloudButton");
    -[BKLibraryBookshelfCollectionInfoHeader updateCounts](self, "updateCounts");
    -[BKLibraryBookshelfCollectionInfoHeader _updateMetricsForUploadStatusViewController](self, "_updateMetricsForUploadStatusViewController");

  }
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("sortMode"), off_1009CB438);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
    if (v8)
      objc_msgSend(v6, "removeObserver:name:object:", self, BKLibraryOwnershipDidChangeNotification, v5);
    objc_storeWeak((id *)&self->_dataSource, obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
    -[BKLibraryBookshelfCollectionInfoHeader setIsSeriesCollection:](self, "setIsSeriesCollection:", objc_msgSend(v9, "collectionIsSeries"));

    v10 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[BKLibraryBookshelfCollectionInfoHeader isSeriesCollection](self, "isSeriesCollection");

      if (v12)
        objc_msgSend(v6, "addObserver:selector:name:object:", self, "_ownershipDidChange:", BKLibraryOwnershipDidChangeNotification, v5);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("sortMode"), 0, off_1009CB438);

    -[BKLibraryBookshelfCollectionInfoHeader sortModeDidChange](self, "sortModeDidChange");
  }

}

- (void)_ownershipDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100138F54;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_mocWillSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  id v26;
  BKLibraryBookshelfCollectionInfoHeader *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  if (!-[BKLibraryBookshelfCollectionInfoHeader isSeriesCollection](self, "isSeriesCollection"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader frc](self, "frc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("BKCollectionMember"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updatedObjects"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v12 = v10;
      if (v11)
      {
        v13 = v11;
        v25 = v9;
        v26 = v4;
        v27 = self;
        v14 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entity"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("BKLibraryAsset"));

            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "changedValues"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader propertiesOfInterest](v27, "propertiesOfInterest"));
              v24 = objc_msgSend(v22, "intersectsSet:", v23);

              if (v24)
              {

                v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader coalescedReloadData](v27, "coalescedReloadData"));
                objc_msgSend(v12, "signalWithCompletion:", &stru_1008EBEE0);
                goto LABEL_14;
              }
            }
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v13)
            continue;
          break;
        }
        v12 = v10;
LABEL_14:
        v9 = v25;
        v4 = v26;
      }

    }
  }

}

- (void)sortModeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  if (-[BKLibraryBookshelfCollectionInfoHeader isSeriesCollection](self, "isSeriesCollection"))
  {
    -[BKLibraryBookshelfCollectionInfoHeader updateCounts](self, "updateCounts");
    -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](self, "updateCloudButton");
    -[BKLibraryBookshelfCollectionInfoHeader setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader dataSource](self, "dataSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSortMode"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "predicate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader frc](self, "frc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predicate"));
    v9 = objc_msgSend(v5, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = objc_alloc((Class)NSFetchRequest);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entityName"));
      v12 = objc_msgSend(v10, "initWithEntityName:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entityName"));
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("BKLibraryAsset"));

      objc_msgSend(v12, "setPredicate:", v5);
      if (v14)
        v15 = CFSTR("contentType");
      else
        v15 = CFSTR("asset.contentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v15, 1));
      v24 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      objc_msgSend(v12, "setSortDescriptors:", v17);

      v18 = objc_alloc((Class)NSFetchedResultsController);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uiChildContext"));
      v21 = objc_msgSend(v18, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v12, v20, v15, 0);
      -[BKLibraryBookshelfCollectionInfoHeader setFrc:](self, "setFrc:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader frc](self, "frc"));
      objc_msgSend(v22, "performFetch:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader frc](self, "frc"));
      objc_msgSend(v23, "setDelegate:", self);

      -[BKLibraryBookshelfCollectionInfoHeader updateCounts](self, "updateCounts");
      -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](self, "updateCloudButton");
      -[BKLibraryBookshelfCollectionInfoHeader setNeedsLayout](self, "setNeedsLayout");

    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  -[BKLibraryBookshelfCollectionInfoHeader updateCounts](self, "updateCounts", a3);
  -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](self, "updateCloudButton");
  -[BKLibraryBookshelfCollectionInfoHeader setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateAndLayoutCloudButtonAnimated
{
  void *v3;
  _QWORD v4[5];

  -[BKLibraryBookshelfCollectionInfoHeader updateCloudButton](self, "updateCloudButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader cloudButton](self, "cloudButton"));
  objc_msgSend(v3, "layoutIfNeeded");

  -[BKLibraryBookshelfCollectionInfoHeader setNeedsLayout](self, "setNeedsLayout");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100139554;
  v4[3] = &unk_1008E72C0;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  objc_super v14;
  _QWORD block[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1009CB438 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100139730;
    v18[3] = &unk_1008E72C0;
    v18[4] = self;
    v13 = v18;
LABEL_10:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    goto LABEL_11;
  }
  if (off_1009CB440 == a6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100139738;
    v17[3] = &unk_1008E72C0;
    v17[4] = self;
    v13 = v17;
    goto LABEL_10;
  }
  if (off_1009CB448 == a6)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100139740;
    v16[3] = &unk_1008E72C0;
    v16[4] = self;
    v13 = v16;
    goto LABEL_10;
  }
  if (off_1009CB450 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001397B0;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    v13 = block;
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  -[BKLibraryBookshelfCollectionInfoHeader observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_11:

}

- (void)networkReachabilityChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100139810;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateMetricsForUploadStatusViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = objc_opt_class(BKLibraryUploadStatusViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));
  v6 = BUDynamicCast(v3, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  objc_msgSend(v8, "setMainHeaderMetrics:", v7);

}

- (void)uploadProgressButtonPressed:(id)a3
{
  void *v4;
  BKLibraryUploadStatusViewController *v5;
  void *v6;
  BKLibraryUploadStatusNavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v24;
  void *v25;
  void *v26;
  BKLibraryUploadStatusViewController *v27;

  if (-[BKLibraryBookshelfCollectionInfoHeader wantsCloudButton](self, "wantsCloudButton", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));

    if (!v4)
    {
      v5 = [BKLibraryUploadStatusViewController alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
      v27 = -[BKLibraryUploadStatusViewController initWithMetrics:](v5, "initWithMetrics:", v6);

      -[BKLibraryUploadStatusViewController setDelegate:](v27, "setDelegate:", self);
      v7 = -[BKLibraryUploadStatusNavigationController initWithRootViewController:]([BKLibraryUploadStatusNavigationController alloc], "initWithRootViewController:", v27);
      -[BKLibraryBookshelfCollectionInfoHeader setUploadProgressNavigationController:](self, "setUploadProgressNavigationController:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));
      objc_msgSend(v8, "setModalPresentationStyle:", 7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));

      objc_msgSend(v10, "setDelegate:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader cloudButton](self, "cloudButton"));
      objc_msgSend(v10, "setSourceView:", v11);
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v11, "touchInsets");
      objc_msgSend(v10, "setSourceRect:", v13 + v23, v15 + v20, v17 - (v23 + v21), v19 - (v20 + v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader actionHandler](self, "actionHandler"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "presentationController"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));
      objc_msgSend(v25, "presentViewController:animated:completion:", v26, 1, 0);

    }
  }
}

- (void)libraryUploadStatusViewControllerDismissed:(id)a3
{
  -[BKLibraryBookshelfCollectionInfoHeader setUploadProgressNavigationController:](self, "setUploadProgressNavigationController:", 0);
}

- (id)libraryUploadStatusPresentingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader actionHandler](self, "actionHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentationController"));

  return v3;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));

  if (v4 == v5)
  {
    objc_msgSend(v6, "setDelegate:", 0);
    -[BKLibraryBookshelfCollectionInfoHeader setUploadProgressNavigationController:](self, "setUploadProgressNavigationController:", 0);
  }

}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));

  if (v4 == v5)
  {
    v6 = objc_opt_class(BKLibraryUploadStatusViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));
    v9 = BUDynamicCast(v6, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);

    objc_msgSend(v10, "setPresentedInPopover:", 1);
  }
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));

  if (v5 == v6)
  {
    v7 = objc_opt_class(BKLibraryUploadStatusViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionInfoHeader uploadProgressNavigationController](self, "uploadProgressNavigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topViewController"));
    v10 = BUDynamicCast(v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    objc_msgSend(v11, "setPresentedInPopover:", 0);
  }
  return 0;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  id v5;
  id v6;

  if (!a4)
    return 0;
  v4 = a4;
  v5 = objc_msgSend(v4, "horizontalSizeClass");
  v6 = objc_msgSend(v4, "verticalSizeClass");

  if (v6 == (id)1 || v5 == (id)1)
    return 0;
  else
    return 7;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryActionHandler)actionHandler
{
  return (BKLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (BKLibraryLayoutAttributes)attrs
{
  return self->_attrs;
}

- (void)setAttrs:(id)a3
{
  objc_storeStrong((id *)&self->_attrs, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (IMTouchInsetsButton)cloudButton
{
  return self->_cloudButton;
}

- (void)setCloudButton:(id)a3
{
  objc_storeStrong((id *)&self->_cloudButton, a3);
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
  objc_storeStrong((id *)&self->_frc, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)cloudButtonSpacing
{
  return self->_cloudButtonSpacing;
}

- (void)setCloudButtonSpacing:(double)a3
{
  self->_cloudButtonSpacing = a3;
}

- (BOOL)wantsCloudButton
{
  return self->_wantsCloudButton;
}

- (void)setWantsCloudButton:(BOOL)a3
{
  self->_wantsCloudButton = a3;
}

- (BOOL)waitingForCloudButtonHideDelay
{
  return self->_waitingForCloudButtonHideDelay;
}

- (void)setWaitingForCloudButtonHideDelay:(BOOL)a3
{
  self->_waitingForCloudButtonHideDelay = a3;
}

- (BOOL)isSeriesCollection
{
  return self->_isSeriesCollection;
}

- (void)setIsSeriesCollection:(BOOL)a3
{
  self->_isSeriesCollection = a3;
}

- (BOOL)isObservingPropertyChanges
{
  return self->_isObservingPropertyChanges;
}

- (void)setIsObservingPropertyChanges:(BOOL)a3
{
  self->_isObservingPropertyChanges = a3;
}

- (UINavigationController)uploadProgressNavigationController
{
  return self->_uploadProgressNavigationController;
}

- (void)setUploadProgressNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_uploadProgressNavigationController, a3);
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
}

- (NSSet)propertiesOfInterest
{
  return self->_propertiesOfInterest;
}

- (void)setPropertiesOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesOfInterest, a3);
}

- (BUCoalescingCallBlock)coalescedReloadData
{
  return self->_coalescedReloadData;
}

- (void)setCoalescedReloadData:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedReloadData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedReloadData, 0);
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_uploadProgressNavigationController, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_cloudButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
