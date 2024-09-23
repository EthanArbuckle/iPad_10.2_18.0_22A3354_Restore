@implementation CuratedCollectionsListViewController

- (CuratedCollectionsListViewController)initWithCuratedCollections:(id)a3 usingTitle:(id)a4 usingCollectionIds:(id)a5 withTraits:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CuratedCollectionsListViewController *v15;
  CuratedCollectionsListViewController *v16;
  CuratedCollectionsListFetcher *v17;
  CuratedCollectionsListFetcher *guideFetcher;
  void *v19;
  void *v20;
  CuratedCollectionsListAnalyticsManager *v21;
  CuratedCollectionsListAnalyticsManager *analyticsManager;
  void *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CuratedCollectionsListViewController;
  v15 = -[CuratedCollectionsListViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_curatedCollections, a3);
    objc_storeStrong((id *)&v16->_cardTitle, a4);
    objc_storeStrong((id *)&v16->_collectionIds, a5);
    objc_storeStrong((id *)&v16->_traits, a6);
    v17 = -[CuratedCollectionsListFetcher initWithTraits:]([CuratedCollectionsListFetcher alloc], "initWithTraits:", v16->_traits);
    guideFetcher = v16->_guideFetcher;
    v16->_guideFetcher = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v16, "cardPresentationController"));
    objc_msgSend(v19, "setPresentedModally:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v16, "cardPresentationController"));
    objc_msgSend(v20, "setTakesAvailableHeight:", 1);

    v21 = objc_alloc_init(CuratedCollectionsListAnalyticsManager);
    analyticsManager = v16->_analyticsManager;
    v16->_analyticsManager = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v23, "addObserver:", v16);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionsListViewController;
  -[CuratedCollectionsListViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CuratedCollectionsListViewController;
  -[ContaineeViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = sub_100916C90();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v6 = sub_100916C90();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DisplayingCuratedCollectionsListView", ", v12, 2u);
  }

  -[CuratedCollectionsListViewController addHeaderView](self, "addHeaderView");
  -[CuratedCollectionsListViewController addCarouselView](self, "addCarouselView");
  v9 = sub_100916C90();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v5, "DisplayingCuratedCollectionsListView", ", v12, 2u);
  }

}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  objc_msgSend(v5, "dismissedCollections");

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionsListViewController;
  -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", v4);

}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionsListViewController;
  -[ContaineeViewController didChangeLayout:](&v6, "didChangeLayout:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
    objc_msgSend(v5, "resetCollectionsLayout");

  }
}

- (void)displayCollections
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = sub_100916C90();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v6 = sub_100916C90();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DisplayingCarouselCollections", ", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionIds](self, "collectionIds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController guideFetcher](self, "guideFetcher"));
  objc_msgSend(v9, "displayCollectionsUsingBatchIds:usingGuideFetcher:", v10, v11);

  v12 = sub_100916C90();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v5, "DisplayingCarouselCollections", ", v15, 2u);
  }

}

- (void)addHeaderView
{
  ContainerHeaderView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  id v21;

  v3 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CuratedCollectionsListViewController setTitleHeaderView:](self, "setTitleHeaderView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle3, 1024));
    objc_msgSend(v7, "setCustomTitleFont:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v11, "setDelegate:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController cardTitle](self, "cardTitle"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController cardTitle](self, "cardTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v14, "setTitle:", v13);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Curated Guides] Featured In"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController curatedCollections](self, "curatedCollections"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, objc_msgSend(v15, "count")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v17, "setTitle:", v16);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v18, "setHeaderSize:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v19, "setHairLineAlpha:", 0.0);

  v21 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v21, "addSubview:", v20);

}

- (void)addCarouselView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc((Class)MKCollectionsCarouselView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController curatedCollections](self, "curatedCollections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v6 = objc_msgSend(v3, "initCollectionsCarouselViewWithContext:withPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:", 0, v4, v5, self, self, self, 0);
  -[CuratedCollectionsListViewController setCollectionsCarousel:](self, "setCollectionsCarousel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  objc_msgSend(v10, "addSubview:", v11);

  -[CuratedCollectionsListViewController setupConstraints](self, "setupConstraints");
}

- (void)setupConstraints
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
  _QWORD v44[8];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v44[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v44[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v44[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v44[3] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v44[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v44[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController titleHeaderView](self, "titleHeaderView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v44[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v44[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionsListViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009177A8;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionsListViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v3, "scrollViewDidScroll:", a3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionsListViewController;
  -[ContaineeViewController scrollViewWillBeginDragging:](&v3, "scrollViewWillBeginDragging:", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionsListViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v5, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x, a4.y);
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController analyticsManager](self, "analyticsManager"));
  v9 = objc_msgSend(v8, "muid");

  objc_msgSend(v10, "curatedCollectionTappedWithMuid:verticalIndex:isCollectionSaved:", v9, a4, v5);
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListViewController collectionsCarousel](self, "collectionsCarousel", a3));
  objc_msgSend(v3, "refreshCollections");

}

- (NSArray)curatedCollections
{
  return self->_curatedCollections;
}

- (void)setCuratedCollections:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollections, a3);
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIds, a3);
}

- (MKCollectionsCarouselView)collectionsCarousel
{
  return self->_collectionsCarousel;
}

- (void)setCollectionsCarousel:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsCarousel, a3);
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (CuratedCollectionsListAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (CuratedCollectionsListFetcher)guideFetcher
{
  return self->_guideFetcher;
}

- (void)setGuideFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_guideFetcher, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (NSString)cardTitle
{
  return self->_cardTitle;
}

- (void)setCardTitle:(id)a3
{
  objc_storeStrong((id *)&self->_cardTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_guideFetcher, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionsCarousel, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_curatedCollections, 0);
}

@end
