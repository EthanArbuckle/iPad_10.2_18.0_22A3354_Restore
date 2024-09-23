@implementation UGCARPPhotoCarouselController

- (UGCARPPhotoCarouselController)initWithDelegate:(id)a3 presentingViewController:(id)a4 maximumNumberOfPhotos:(unint64_t)a5 previouslySubmittedPhotosExist:(BOOL)a6 mapItemCoordinate:(CLLocationCoordinate2D)a7 showPhotoCarousel:(BOOL)a8
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v15;
  id v16;
  UGCARPPhotoCarouselController *v17;
  UGCARPPhotoCarouselController *v18;
  NSMutableArray *v19;
  NSMutableArray *viewModels;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *serialQueue;
  uint64_t v25;
  uint64_t v26;
  OS_dispatch_queue *suggestedPhotosImageDownloadingQueue;
  void *v28;
  objc_super v30;

  longitude = a7.longitude;
  latitude = a7.latitude;
  v15 = a3;
  v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)UGCARPPhotoCarouselController;
  v17 = -[UGCARPPhotoCarouselController init](&v30, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_addPhotosDelegate, v15);
    v18->_centerCoordinate.latitude = latitude;
    v18->_centerCoordinate.longitude = longitude;
    objc_storeWeak((id *)&v18->_presentingViewController, v16);
    v18->_previouslySubmittedPhotosExist = a6;
    v18->_showPhotoCarousel = a8;
    v18->_numberOfLoadingPhotos = 0;
    v18->_maximumNumberOfPhotos = a5;
    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    viewModels = v18->_viewModels;
    v18->_viewModels = v19;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.maps.ARPPhotoCarouselController.SuggestedPhotoFetch", v22);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v23;

    v25 = geo_dispatch_queue_create_with_qos("com.apple.maps.ARPPhotoCarouselController.SuggetedPhotoImageDownloading", 25);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    suggestedPhotosImageDownloadingQueue = v18->_suggestedPhotosImageDownloadingQueue;
    v18->_suggestedPhotosImageDownloadingQueue = (OS_dispatch_queue *)v26;

    -[UGCPhotoCarouselController setPhotoSliderShouldEnablePagingScroll:](v18, "setPhotoSliderShouldEnablePagingScroll:", 1);
    if (v18->_showPhotoCarousel)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
      objc_msgSend(v28, "addObserver:", v18);

    }
    v18->_allowSelection = 1;
  }

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  -[PHCachingImageManager stopCachingImagesForAllAssets](self->_imageManager, "stopCachingImagesForAllAssets");
  v4.receiver = self;
  v4.super_class = (Class)UGCARPPhotoCarouselController;
  -[UGCPhotoCarouselController dealloc](&v4, "dealloc");
}

- (unint64_t)_numberOfSelectedPhotos
{
  id WeakRetained;
  char *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_addPhotosDelegate);
  v4 = (char *)objc_msgSend(WeakRetained, "numberOfSelectedPhotosForAddPhotosController:", self)
     + self->_numberOfLoadingPhotos;

  return (unint64_t)v4;
}

- (void)setupSuggestedPhotosIfNeeded
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_showPhotoCarousel)
  {
    objc_initWeak(&location, self);
    v3 = &_dispatch_main_q;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1007F9300;
    v4[3] = &unk_1011B07A0;
    objc_copyWeak(&v5, &location);
    -[UGCARPPhotoCarouselController fetchSuggestedImageAssetsWithCallbackQueue:completion:](self, "fetchSuggestedImageAssetsWithCallbackQueue:completion:", &_dispatch_main_q, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)fetchSuggestedImageAssetsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PHCachingImageManager *v8;
  PHCachingImageManager *imageManager;
  PHPhotoLibrary *v10;
  PHPhotoLibrary *library;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *serialQueue;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (PHCachingImageManager *)objc_alloc_init((Class)PHCachingImageManager);
  imageManager = self->_imageManager;
  self->_imageManager = v8;

  -[PHCachingImageManager setAllowsCachingHighQualityImages:](self->_imageManager, "setAllowsCachingHighQualityImages:", 0);
  v10 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
  library = self->_library;
  self->_library = v10;

  v12 = objc_alloc_init((Class)PHFetchOptions);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("creationDate <= %@"), v13));
  objc_msgSend(v12, "setPredicate:", v14);

  objc_msgSend(v12, "setFetchLimit:", GEOConfigGetUInteger(MapsConfig_NumberOfPhotoToFetchForSuggestionsInContributionCard, off_1014B4A78));
  v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("creationDate"), 0);
  v25 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  objc_msgSend(v12, "setSortDescriptors:", v16);

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007F95D8;
  block[3] = &unk_1011B4320;
  block[4] = self;
  v22 = v12;
  v23 = v6;
  v24 = v7;
  v18 = v7;
  v19 = v6;
  v20 = v12;
  dispatch_async(serialQueue, block);

}

- (void)setupCollectionView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  UICollectionViewDiffableDataSource *diffableDataSource;
  id v8;
  _QWORD *v9;
  void *v10;
  UICollectionViewDiffableDataSource *v11;
  UICollectionViewDiffableDataSource *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t BOOL;
  uint64_t v17;
  id obj;

  obj = a3;
  v4 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v4, "setScrollDirection:", 1);
  objc_msgSend(v4, "setMinimumInteritemSpacing:", 8.0);
  objc_msgSend(v4, "setSectionInset:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(obj, "setCollectionViewLayout:", v4);
  v5 = objc_opt_class(UGCPhotoThumbnailCheckmarkCollectionViewCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoThumbnailCollectionViewCell reuseIdentifier](UGCPhotoThumbnailCheckmarkCollectionViewCell, "reuseIdentifier"));
  objc_msgSend(obj, "registerClass:forCellWithReuseIdentifier:", v5, v6);

  objc_msgSend(obj, "setDelegate:", self);
  objc_msgSend(obj, "setScrollEnabled:", 1);
  objc_storeWeak((id *)&self->_collectionView, obj);
  diffableDataSource = self->_diffableDataSource;
  if (!diffableDataSource)
  {
    v8 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v9 = sub_10046DA38(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (UICollectionViewDiffableDataSource *)objc_msgSend(v8, "initWithCollectionView:cellProvider:", obj, v10);
    v12 = self->_diffableDataSource;
    self->_diffableDataSource = v11;

    diffableDataSource = self->_diffableDataSource;
  }
  v13 = sub_10046DBB0(self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](diffableDataSource, "setSupplementaryViewProvider:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCARPPhotoCarouselController _buildSnapshotFromCurrentState](self, "_buildSnapshotFromCurrentState"));
  if (!MapsFeature_IsEnabled_ARPCommunityID(-[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v15, 0))|| (BOOL = GEOConfigGetBOOL(MapsConfig_ARPCommunityIDShouldRemovePrivacyScreenForRatingOnlyFlows, off_1014B4D88), !(_DWORD)BOOL))
  {
    if (self->_previouslySubmittedPhotosExist)
      goto LABEL_10;
LABEL_9:
    -[UGCARPPhotoCarouselController setupSuggestedPhotosIfNeeded](self, "setupSuggestedPhotosIfNeeded");
    goto LABEL_10;
  }
  if (!self->_previouslySubmittedPhotosExist && MKGetHasUserConsentedToAddingContributions(BOOL, v17) == 1)
    goto LABEL_9;
LABEL_10:

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *suggestedPhotosImageDownloadingQueue;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v25;
  id v26;
  uint64_t v27;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoThumbnailCollectionViewCell reuseIdentifier](UGCPhotoThumbnailCheckmarkCollectionViewCell, "reuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCARPPhotoCarouselController _viewModelForIdentifier:](self, "_viewModelForIdentifier:", v8));
  objc_msgSend(v12, "_setContinuousCornerRadius:", 4.0);
  objc_msgSend(v12, "setClipsToBounds:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_diffableDataSourceIdentifier"));
  objc_msgSend(v12, "setIdentifier:", v14);

  objc_msgSend(v12, "setViewModel:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitCollection"));
  objc_msgSend(v15, "displayScale");
  v17 = v16;

  suggestedPhotosImageDownloadingQueue = self->_suggestedPhotosImageDownloadingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007F9CA0;
  block[3] = &unk_1011B15B0;
  v25 = v13;
  v27 = v17;
  v19 = v12;
  v26 = v19;
  v20 = v13;
  dispatch_async(suggestedPhotosImageDownloadingQueue, block);
  v21 = v26;
  v22 = v19;

  return v22;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4)));
  objc_msgSend(v5, "imageSizeForCell");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
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
  uint64_t v17;
  uint64_t v18;
  NSObject *suggestedPhotosImageDownloadingQueue;
  void *v20;
  char v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  UGCARPPhotoCarouselController *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCARPPhotoCarouselController _viewModelForIdentifier:](self, "_viewModelForIdentifier:", v9));

  if (objc_msgSend(v10, "enabled"))
  {
    if (objc_msgSend(v10, "checked"))
    {
      objc_msgSend(v10, "setChecked:", 0);
      objc_msgSend(v10, "setIsLoading:", 0);
      objc_msgSend(v8, "setViewModel:", v10);
      objc_initWeak(&location, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController delegate](self, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "photoWithMetadata"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "photoMetadata"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientImageUuid"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1007FA14C;
      v32[3] = &unk_1011AC888;
      objc_copyWeak(&v34, &location);
      v33 = v10;
      objc_msgSend(v11, "photoCarouselController:requestsRemovingImageForIdentifier:completion:", self, v14, v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else if ((objc_msgSend(v10, "checked") & 1) == 0)
    {
      if (-[UGCARPPhotoCarouselController _numberOfSelectedPhotos](self, "_numberOfSelectedPhotos") >= self->_maximumNumberOfPhotos)
        goto LABEL_9;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_diffableDataSourceIdentifier"));
      objc_msgSend(v8, "setIdentifier:", v15);

      objc_msgSend(v10, "setChecked:", 1);
      objc_msgSend(v10, "setIsLoading:", 1);
      objc_msgSend(v8, "setViewModel:", v10);
      ++self->_numberOfLoadingPhotos;
      -[UGCARPPhotoCarouselController _updateSelection](self, "_updateSelection");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
      objc_msgSend(v16, "displayScale");
      v18 = v17;

      suggestedPhotosImageDownloadingQueue = self->_suggestedPhotosImageDownloadingQueue;
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_1007FA1CC;
      v26 = &unk_1011B1740;
      v27 = self;
      v28 = v10;
      v31 = v18;
      v29 = v8;
      v30 = v7;
      dispatch_async(suggestedPhotosImageDownloadingQueue, &v23);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController delegate](self, "delegate", v23, v24, v25, v26, v27));
    v21 = objc_opt_respondsToSelector(v20, "photoCarouselControllerDidToggleImage:");

    if ((v21 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController delegate](self, "delegate"));
      objc_msgSend(v22, "photoCarouselControllerDidToggleImage:", self);

    }
  }
LABEL_9:

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(a3, "contentOffset");
  -[UGCARPPhotoCarouselController setLastContentOffset:](self, "setLastContentOffset:");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v6;
  uint64_t v7;

  -[UGCARPPhotoCarouselController lastContentOffset](self, "lastContentOffset", a3, a4.x, a4.y);
  if (v6 - a5->x <= 0.0)
    v7 = 325;
  else
    v7 = 333;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v7, 666, 0);
}

- (id)configurePhotoCreditStringForCollectionViewHeader
{
  void *v3;
  void *v4;
  NSString *photoCreditName;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] Add Photo Credit"), CFSTR("localized string not found"), 0));

  photoCreditName = self->_photoCreditName;
  if (photoCreditName && self->_isPhotoCreditOn)
  {
    v6 = photoCreditName;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] Off"), CFSTR("localized string not found"), 0));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] Photo Credit: (Name)"), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6));

  if (self->_photoCreditNotSetupYet)
    v11 = v4;
  else
    v11 = v10;
  v12 = v11;

  return v12;
}

- (id)collectionViewHeaderTitleForNumberOfSelectedPhotos:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] # of Photos Selected photo carousel header"), CFSTR("localized string not found"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] Add Your Photos collection view header"), CFSTR("localized string not found"), 0));
  }

  return v6;
}

- (id)collectionViewButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] More"), CFSTR("localized string not found"), 0));

  return v3;
}

- (void)fetchPhotoCreditPreferences
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  if (self->_showPhotoCarousel)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1007FAAEC;
    v4[3] = &unk_1011B5260;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    objc_msgSend(v3, "photoAttributionPreferencesWithCompletion:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (id)anchoringView
{
  UGCPhotoCreditSectionHeaderView *headerView;
  UGCPhotoCreditSectionHeaderView *v3;
  uint8_t v5[16];

  headerView = self->_headerView;
  if (headerView)
  {
    v3 = headerView;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _headerView != ((void *)0)", v5, 2u);
  }
  return headerView;
}

- (double)preferredCellHeight
{
  double result;

  +[UGCARPPhotoCarouselViewModel preferredCellHeight](UGCARPPhotoCarouselViewModel, "preferredCellHeight");
  return result;
}

- (id)collectionViewBackgroundColor
{
  return +[MapsTheme ugcPOIEnrichmentEditorBackgroundColor](MapsTheme, "ugcPOIEnrichmentEditorBackgroundColor");
}

- (void)_handleAddFromSuggestionImage:(id)a3 atIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;

  v5 = a3;
  v8 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v8, "addObject:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_addPhotosDelegate);
  v7 = objc_msgSend(v8, "copy");
  objc_msgSend(WeakRetained, "suggestedPhotoController:didSelectPhotosWithMetadata:", self, v7);

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

- (void)_updateSelection
{
  uint64_t v3;

  if (-[UGCARPPhotoCarouselController _numberOfSelectedPhotos](self, "_numberOfSelectedPhotos") < self->_maximumNumberOfPhotos
    && !self->_allowSelection)
  {
    v3 = 1;
    goto LABEL_8;
  }
  if (-[UGCARPPhotoCarouselController _numberOfSelectedPhotos](self, "_numberOfSelectedPhotos") >= self->_maximumNumberOfPhotos
    && self->_allowSelection)
  {
    v3 = 0;
LABEL_8:
    -[UGCARPPhotoCarouselController _enableSelection:](self, "_enableSelection:", v3);
  }
}

- (void)_enableSelection:(BOOL)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_allowSelection != a3)
  {
    self->_allowSelection = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_viewModels;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if (self->_allowSelection)
            v10 = 1;
          else
            v10 = (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "checked", (_QWORD)v11);
          objc_msgSend(v9, "setEnabled:", v10, (_QWORD)v11);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[UGCARPPhotoCarouselController _refreshCollectionViewWithAnimatingDifferences:](self, "_refreshCollectionViewWithAnimatingDifferences:", 1);
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
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  const __CFString *v19;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v19 = CFSTR("DefaultCarouselSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  v5 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_viewModels;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "_maps_diffableDataSourceIdentifier", (_QWORD)v14));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, CFSTR("DefaultCarouselSection"));

  return v3;
}

- (void)_refreshCollectionViewWithAnimatingDifferences:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCARPPhotoCarouselController _buildSnapshotFromCurrentState](self, "_buildSnapshotFromCurrentState"));
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v5, v3);
  -[UGCARPPhotoCarouselController _invokeChangeHandler](self, "_invokeChangeHandler");

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

- (id)_viewModelForPhotoWithMetadata:(id)a3
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "photoWithMetadata", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqual:", v4);

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

- (void)addPhotoWithMetadata:(id)a3 forIdentifier:(id)a4
{
  id v6;
  UGCARPPhotoCarouselViewModel *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!self->_photoCreditFetchStatus)
  {
    self->_photoCreditFetchStatus = 1;
    -[UGCARPPhotoCarouselController fetchPhotoCreditPreferences](self, "fetchPhotoCreditPreferences");
  }
  v7 = (UGCARPPhotoCarouselViewModel *)objc_claimAutoreleasedReturnValue(-[UGCARPPhotoCarouselController _viewModelForPhotoWithMetadata:](self, "_viewModelForPhotoWithMetadata:", v8));
  if (!v7)
  {
    v7 = -[UGCARPPhotoCarouselViewModel initWithImageManager:]([UGCARPPhotoCarouselViewModel alloc], "initWithImageManager:", self->_imageManager);
    -[UGCARPPhotoCarouselViewModel setPhotoWithMetadata:](v7, "setPhotoWithMetadata:", v8);
    -[UGCARPPhotoCarouselViewModel setIdentifier:](v7, "setIdentifier:", v6);
    -[UGCARPPhotoCarouselViewModel setChecked:](v7, "setChecked:", 1);
    -[NSMutableArray insertObject:atIndex:](self->_viewModels, "insertObject:atIndex:", v7, 0);
  }
  -[UGCARPPhotoCarouselController _updateSelection](self, "_updateSelection");
  -[UGCARPPhotoCarouselController _refreshCollectionViewWithAnimatingDifferences:](self, "_refreshCollectionViewWithAnimatingDifferences:", 1);

}

- (double)lastContentOffset
{
  return self->_lastContentOffset;
}

- (void)setLastContentOffset:(double)a3
{
  self->_lastContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPhotosImageDownloadingQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_photoCreditName, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_addPhotosDelegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
