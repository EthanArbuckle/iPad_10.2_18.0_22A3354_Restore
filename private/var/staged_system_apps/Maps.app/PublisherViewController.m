@implementation PublisherViewController

- (PublisherViewController)initWithPublisherId:(id)a3 numberOfCollections:(unint64_t)a4 withTraits:(id)a5
{
  id v9;
  id v10;
  PublisherViewController *v11;
  PublisherViewController *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PublisherViewController;
  v11 = -[PublisherViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_publisherId, a3);
    v12->_numberOfCollections = a4;
    objc_storeStrong((id *)&v12->_traits, a5);
    v13 = sub_1002A8AA0(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v12, "cardPresentationController"));
    v15 = v14;
    if (v13 == 5)
    {
      objc_msgSend(v14, "setAllowResizeInFloatingStyle:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v12, "cardPresentationController"));
      objc_msgSend(v16, "setDefaultContaineeLayout:", 3);
    }
    else
    {
      objc_msgSend(v14, "setPresentedModally:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v12, "cardPresentationController"));
      objc_msgSend(v16, "setTakesAvailableHeight:", 1);
    }

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  PublisherAPIController *v4;
  void *v5;
  void *v6;
  PublisherAPIController *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PublisherViewController;
  -[ContaineeViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("PublisherView"));

  objc_initWeak(&location, self);
  v4 = [PublisherAPIController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherId](self, "publisherId"));
  objc_copyWeak(&v10, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController traits](self, "traits", _NSConcreteStackBlock, 3221225472, sub_100BA2590, &unk_1011B9C58));
  v7 = -[PublisherAPIController initWithPublisherId:usingOnStateChangeHandler:usingTraits:](v4, "initWithPublisherId:usingOnStateChangeHandler:usingTraits:", v5, &v9, v6);
  -[PublisherViewController setApiController:](self, "setApiController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
  objc_msgSend(v8, "fetchPublisherViewForKeywordFilter:addressFilter:onCompletion:", 0, 0, &stru_1011E7978);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PublisherViewController;
  -[PublisherViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "cardHeight");
  -[PublisherViewController setActualCardHeight:](self, "setActualCardHeight:");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PublisherViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
  objc_msgSend(v4, "cancelFetchingPublisher");

}

- (void)willDismissByGesture
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PublisherViewController;
  -[ContaineeViewController willDismissByGesture](&v4, "willDismissByGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "clearSearch");

}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PublisherViewController;
  -[ContaineeViewController didChangeLayout:](&v11, "didChangeLayout:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));

  if (v4)
  {
    -[PublisherViewController resetCollectionViewLayout](self, "resetCollectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "setContentOffset:", CGPointZero.x, CGPointZero.y);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v6, "maximumRequiredHeight");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController headerHeightConstraint](self, "headerHeightConstraint"));
    objc_msgSend(v9, "setConstant:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v10, "resetLogoHeight");

  }
}

- (GEOPublisher)publisher
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publisherResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisher"));

  return (GEOPublisher *)v4;
}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5;
  double result;
  objc_super v7;

  v5 = sub_1002A8AA0(self);
  if (a3 != 1 || (result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)PublisherViewController;
    -[ContaineeViewController heightForLayout:](&v7, "heightForLayout:", a3);
  }
  return result;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
  objc_msgSend(v5, "cancelFetchingPublisher");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController dataSource](self, "dataSource"));
  objc_msgSend(v6, "dismissedCollections");

  v7.receiver = self;
  v7.super_class = (Class)PublisherViewController;
  -[ContaineeViewController handleDismissAction:](&v7, "handleDismissAction:", v4);

}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v7 = sub_100BA2AD8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = sub_100BA2AD8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DisplayingPublisherView", ", buf, 2u);
  }

  switch(a3)
  {
    case 0:
      if (a4 == 1)
      {
        -[PublisherViewController addLoadingView](self, "addLoadingView");
        -[PublisherViewController addDefaultHeaderView](self, "addDefaultHeaderView");
        -[PublisherViewController activateDefaultHeaderConstraints](self, "activateDefaultHeaderConstraints");
      }
      break;
    case 1:
      if (a4 == 3)
      {
        -[PublisherViewController removeLoadingView](self, "removeLoadingView");
        -[PublisherViewController removeCollectionView](self, "removeCollectionView");
        -[PublisherViewController addErrorView](self, "addErrorView");
      }
      else if (a4 == 2)
      {
        -[PublisherViewController removeLoadingView](self, "removeLoadingView");
        -[PublisherViewController removeDefaultHeaderView](self, "removeDefaultHeaderView");
        -[PublisherViewController addPublisherHeaderView](self, "addPublisherHeaderView");
        -[PublisherViewController addCollectionView](self, "addCollectionView");
        -[PublisherViewController activateConstraints](self, "activateConstraints");
      }
      break;
    case 2:
      if (a4 == 1)
        goto LABEL_14;
      break;
    case 3:
      if (a4 == 1)
      {
        -[PublisherViewController removeErrorView](self, "removeErrorView");
LABEL_14:
        -[PublisherViewController addLoadingView](self, "addLoadingView");
      }
      break;
    default:
      break;
  }
  v13 = sub_100BA2AD8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v9, "DisplayingPublisherView", ", v16, 2u);
  }

}

- (void)addPublisherHeaderView
{
  void *v3;
  void *v4;
  PublisherAnalyticsManager *v5;
  void *v6;
  void *v7;
  PublisherAnalyticsManager *v8;
  PublisherHeaderView *v9;
  void *v10;
  void *v11;
  PublisherHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisher](self, "publisher"));

    v23 = (id)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisher](self, "publisher"));
    v5 = [PublisherAnalyticsManager alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "publisherAttribution"));
    v8 = -[PublisherAnalyticsManager initWithPublisherId:usingAttribution:](v5, "initWithPublisherId:usingAttribution:", v6, v7);
    -[PublisherViewController setAnalyticsManager:](self, "setAnalyticsManager:", v8);

    v9 = [PublisherHeaderView alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "publisherAttribution"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController analyticsManager](self, "analyticsManager"));
    v12 = -[PublisherHeaderView initWithDelegate:usingPublisherAttribution:usingAnalyticsManager:](v9, "initWithDelegate:usingPublisherAttribution:usingAnalyticsManager:", self, v10, v11);
    -[PublisherViewController setPublisherHeaderView:](self, "setPublisherHeaderView:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    LODWORD(v17) = 1148846080;
    objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    LODWORD(v19) = 1148846080;
    objc_msgSend(v18, "setContentHuggingPriority:forAxis:", 0, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v20, "addSubview:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController analyticsManager](self, "analyticsManager"));
    objc_msgSend(v22, "publisherTrayRevealed");

  }
}

- (void)addCollectionView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  PublisherViewDataSource *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PublisherViewDataSource *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id location;
  _QWORD v46[4];
  id v47;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionResults"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100BA3194;
  v46[3] = &unk_1011C9BF8;
  v6 = v3;
  v47 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v46);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publisherViewIdentifiers"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController dataSource](self, "dataSource"));
    objc_msgSend(v10, "updateCollections:usingBatchIdentifiers:", v6, v8);
  }
  else
  {
    v11 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    -[PublisherViewController setFlowLayout:](self, "setFlowLayout:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController flowLayout](self, "flowLayout"));
    objc_msgSend(v12, "setScrollDirection:", 0);

    v13 = objc_alloc((Class)UICollectionView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController flowLayout](self, "flowLayout"));
    v24 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v23, v16, v18, v20, v22);
    -[PublisherViewController setCollectionView:](self, "setCollectionView:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "publisherViewResultFilters"));

    v26 = [PublisherViewDataSource alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController analyticsManager](self, "analyticsManager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "actionManager"));
    v32 = -[PublisherViewDataSource initWithCollectionView:usingCuratedCollections:usingPlaceCollectionIds:withResultFilters:withAPIController:withCollectionRoutingDelegate:usingAnalyticsManager:usingPublisherActionsManager:](v26, "initWithCollectionView:usingCuratedCollections:usingPlaceCollectionIds:withResultFilters:withAPIController:withCollectionRoutingDelegate:usingAnalyticsManager:usingPublisherActionsManager:", v27, v6, v8, v10, v28, self, v29, v31);
    -[PublisherViewController setDataSource:](self, "setDataSource:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController dataSource](self, "dataSource"));
    objc_msgSend(v33, "setDelegate:", self);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v34, "setBounces:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v35, "setAlwaysBounceVertical:", 1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v38, "setBackgroundColor:", v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v39, "insertSubview:belowSubview:", v40, v41);

  }
  objc_initWeak(&location, self);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController dataSource](self, "dataSource"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100BA31FC;
  v43[3] = &unk_1011AD260;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v42, "displayCollections:", v43);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

- (void)activateConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  _QWORD v47[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  objc_msgSend(v5, "maximumRequiredHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:"));
  -[PublisherViewController setHeaderHeightConstraint:](self, "setHeaderHeightConstraint:", v6);

  v45 = objc_alloc_init((Class)NSMutableArray);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v37));
  v47[0] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v47[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v8));
  v47[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v47[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
  objc_msgSend(v45, "addObjectsFromArray:", v15);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v38));
  v46[0] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v16));
  v46[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v46[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController headerHeightConstraint](self, "headerHeightConstraint"));
  v46[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4));
  objc_msgSend(v45, "addObjectsFromArray:", v24);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);
}

- (void)addDefaultHeaderView
{
  void *v3;
  ContainerHeaderView *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));

  if (!v3)
  {
    v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[PublisherViewController setDefaultHeaderView:](self, "setDefaultHeaderView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
    objc_msgSend(v8, "setDelegate:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
    objc_msgSend(v9, "setHairLineAlpha:", 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
    objc_msgSend(v10, "setHeaderSize:", 1);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
    objc_msgSend(v12, "addSubview:", v11);

  }
}

- (void)activateDefaultHeaderConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController defaultHeaderView](self, "defaultHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)removeDefaultHeaderView
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v3, "removeFromSuperview");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v25[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v25[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  if (v5)
    v6 = objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v7 = (void *)v6;
  v20 = (void *)v6;

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v25[0] = v21;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v8));
  v25[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v25[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v25[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)addLoadingView
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100BA4084;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController loadingView](self, "loadingView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController loadingView](self, "loadingView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[PublisherViewController setLoadingView:](self, "setLoadingView:", 0);
  }
}

- (void)addErrorView
{
  void *v3;
  void *v4;
  ErrorModeView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController dataSource](self, "dataSource"));
    objc_msgSend(v4, "clearPublisherData");

    v5 = objc_alloc_init(ErrorModeView);
    -[PublisherViewController setErrorView:](self, "setErrorView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController apiController](self, "apiController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisherResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publisher"));
    LODWORD(v5) = objc_msgSend(v8, "isSuppressed");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if ((_DWORD)v5)
      v11 = CFSTR("[Brooklyn] Error Mode featue unavailable");
    else
      v11 = CFSTR("[Brooklyn] Error Mode title");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("localized string not found"), 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Error Mode message"), CFSTR("localized string not found"), 0));

    v17 = MKCurrentNetworkConnectionFailureDiagnosis(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));
    v19 = v18;
    if (v17)
    {
      objc_msgSend(v18, "setTitle:andMessage:", v12, v14);

      objc_initWeak(&location, self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Try Again [Brooklyn]"), CFSTR("localized string not found"), 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
      v30 = _NSConcreteStackBlock;
      v31 = 3221225472;
      v32 = sub_100BA4570;
      v33 = &unk_1011B4EB8;
      objc_copyWeak(&v34, &location);
      objc_msgSend(v20, "setButtonTitle:glyphName:backgroundColor:handler:", v22, CFSTR("arrow.clockwise"), v23, &v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead));
      objc_msgSend(v19, "setTitleLabelFont:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));
      objc_msgSend(v25, "setTitle:andMessage:", v12, 0);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView", v30, v31, v32, v33));
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));
    objc_msgSend(v27, "addSubview:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));
    -[PublisherViewController activateConstraintsForViewPinnedBelowHeader:](self, "activateConstraintsForViewPinnedBelowHeader:", v29);

  }
}

- (void)removeErrorView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController errorView](self, "errorView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[PublisherViewController setErrorView:](self, "setErrorView:", 0);
  }
}

- (void)removeCollectionView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[PublisherViewController setCollectionView:](self, "setCollectionView:", 0);
    -[PublisherViewController setDataSource:](self, "setDataSource:", 0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PublisherViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v16, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController traitCollection](self, "traitCollection", v16.receiver, v16.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewLayout"));
    objc_msgSend(v10, "invalidateLayout");

    v11 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    -[PublisherViewController setFlowLayout:](self, "setFlowLayout:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController flowLayout](self, "flowLayout"));
    objc_msgSend(v12, "setScrollDirection:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController flowLayout](self, "flowLayout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v14, "setCollectionViewLayout:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
    objc_msgSend(v15, "reloadData");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PublisherViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100BA48FC;
  v9[3] = &unk_1011AEDC8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BA4904;
  v8[3] = &unk_1011AEDC8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  void *v7;
  void *v8;
  objc_super v9;

  y = a4.y;
  v9.receiver = self;
  v9.super_class = (Class)PublisherViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController analyticsManager](self, "analyticsManager"));
  v8 = v7;
  if (y > 0.0)
    objc_msgSend(v7, "publisherCollectionsScrolledDown");
  else
    objc_msgSend(v7, "publisherCollectionsScrolledUp");

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  objc_super v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "cardHeight");
  v7 = v6;
  -[PublisherViewController actualCardHeight](self, "actualCardHeight");
  v9 = v8;

  if (v7 >= v9)
  {
    objc_msgSend(v4, "contentOffset");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController headerHeightConstraint](self, "headerHeightConstraint"));
    objc_msgSend(v12, "constant");
    v14 = v13 - v11;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v15, "maximumRequiredHeight");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    objc_msgSend(v18, "minimumRequiredHeight");
    v20 = v19;

    if (v14 <= v17)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
      objc_msgSend(v22, "headerHeightChangedWithNewYOffset:", v11);

      if (v14 >= v20)
      {
        objc_msgSend(v4, "contentOffset");
        objc_msgSend(v4, "setContentOffset:");
        v20 = v14;
      }
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
      objc_msgSend(v21, "headerHeightChangedWithNewYOffset:", v11);

      v26.receiver = self;
      v26.super_class = (Class)PublisherViewController;
      -[ContaineeViewController scrollViewDidScroll:](&v26, "scrollViewDidScroll:", v4);
      v20 = v17;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController headerHeightConstraint](self, "headerHeightConstraint"));
    objc_msgSend(v23, "setConstant:", v20);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisherHeaderView](self, "publisherHeaderView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController headerHeightConstraint](self, "headerHeightConstraint"));
    objc_msgSend(v25, "constant");
    objc_msgSend(v24, "adjustLogoImageViewTopConstraint:");

  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)PublisherViewController;
    -[ContaineeViewController scrollViewDidScroll:](&v27, "scrollViewDidScroll:", v4);
  }

}

- (void)resetCollectionViewLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v4, "invalidateLayout");

  v5 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  -[PublisherViewController setFlowLayout:](self, "setFlowLayout:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController flowLayout](self, "flowLayout"));
  objc_msgSend(v6, "setScrollDirection:", 0);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PublisherViewController flowLayout](self, "flowLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setCollectionViewLayout:", v8);

}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

}

- (void)didSelectAllGuidesMenuItem
{
  id v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v3, "viewControllerShowAllCollections");

  }
}

- (void)didSelectShareFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisher](self, "publisher"));
  objc_msgSend(v5, "sharePublisher:sourceView:completion:", v6, v4, 0);

}

- (void)didSelectWebsiteItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisher](self, "publisher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisherAttribution"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "websiteURL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:openURL:", self, v6);

}

- (void)didSelectAppItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = objc_alloc_init((Class)NSNumberFormatter);
  objc_msgSend(v11, "setNumberStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewController publisher](self, "publisher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisherAttribution"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationAdamId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "numberFromString:", v5));

  v7 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v6, "longLongValue"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationState"));
  LODWORD(v5) = objc_msgSend(v8, "isInstalled");

  if ((_DWORD)v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    objc_msgSend(v9, "openApplicationWithBundleID:", v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v9, "viewController:displayStoreViewControllerForAppWithiTunesIdentifier:clientIdentifier:", self, v6, 0);
  }

}

- (MKMapItemIdentifier)publisherId
{
  return self->_publisherId;
}

- (void)setPublisherId:(id)a3
{
  objc_storeStrong((id *)&self->_publisherId, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (unint64_t)numberOfCollections
{
  return self->_numberOfCollections;
}

- (void)setNumberOfCollections:(unint64_t)a3
{
  self->_numberOfCollections = a3;
}

- (double)actualCardHeight
{
  return self->_actualCardHeight;
}

- (void)setActualCardHeight:(double)a3
{
  self->_actualCardHeight = a3;
}

- (PublisherHeaderView)publisherHeaderView
{
  return self->_publisherHeaderView;
}

- (void)setPublisherHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherHeaderView, a3);
}

- (ContainerHeaderView)defaultHeaderView
{
  return self->_defaultHeaderView;
}

- (void)setDefaultHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultHeaderView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (PublisherAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (PublisherViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_defaultHeaderView, 0);
  objc_storeStrong((id *)&self->_publisherHeaderView, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_publisherId, 0);
}

@end
