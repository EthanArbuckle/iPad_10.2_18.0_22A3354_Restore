@implementation CollectionsFilterCarouselView

- (CollectionsFilterCarouselView)initWithFrame:(CGRect)a3
{
  CollectionsFilterCarouselView *v3;
  CollectionsFilterCarouselView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CollectionsFilterCarouselView;
  v3 = -[CollectionsFilterCarouselView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CollectionsFilterCarouselView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[CollectionsFilterCarouselView setupSubviews](v4, "setupSubviews");
    -[CollectionsFilterCarouselView configureCarouselFilterView](v4, "configureCarouselFilterView");
  }
  return v4;
}

- (void)configureWithContext:(int64_t)a3 withRoutingDelegate:(id)a4 withAllCollectionsResultFilters:(id)a5 withSelectedFilterIndex:(id)a6
{
  id v9;
  id v10;

  self->_context = a3;
  v10 = a6;
  v9 = a5;
  -[CollectionsFilterCarouselView setAllCollectionsRoutingDelegate:](self, "setAllCollectionsRoutingDelegate:", a4);
  -[CollectionsFilterCarouselView setAllCollectionsResultFilter:](self, "setAllCollectionsResultFilter:", v9);

  -[CollectionsFilterCarouselView configureFiltersCarouselMetadata:](self, "configureFiltersCarouselMetadata:", self->_context);
  -[CollectionsFilterCarouselView setUpCarouselDependenciesUsingSelectedFilterIndexPath:](self, "setUpCarouselDependenciesUsingSelectedFilterIndexPath:", v10);

}

- (void)configureWithContext:(int64_t)a3 withRoutingDelegate:(id)a4 withPublishersResultFilters:(id)a5 withSelectedFilterIndex:(id)a6
{
  id v9;
  id v10;

  self->_context = a3;
  v10 = a6;
  v9 = a5;
  -[CollectionsFilterCarouselView setRoutingDelegate:](self, "setRoutingDelegate:", a4);
  -[CollectionsFilterCarouselView setResultFilters:](self, "setResultFilters:", v9);

  -[CollectionsFilterCarouselView configureFiltersCarouselMetadata:](self, "configureFiltersCarouselMetadata:", self->_context);
  -[CollectionsFilterCarouselView setUpCarouselDependenciesUsingSelectedFilterIndexPath:](self, "setUpCarouselDependenciesUsingSelectedFilterIndexPath:", v10);

}

- (void)configureWithContext:(int64_t)a3 routingDelegate:(id)a4 guidesHomeFilters:(id)a5 selectedFilterIndex:(id)a6
{
  NSArray *v10;
  NSArray *guidesHomeResultFilter;
  id v12;

  v10 = (NSArray *)a5;
  self->_context = a3;
  v12 = a6;
  objc_storeWeak((id *)&self->_guidesHomeRoutingDelegate, a4);
  guidesHomeResultFilter = self->_guidesHomeResultFilter;
  self->_guidesHomeResultFilter = v10;

  -[CollectionsFilterCarouselView configureFiltersCarouselMetadata:](self, "configureFiltersCarouselMetadata:", self->_context);
  -[CollectionsFilterCarouselView setUpCarouselDependenciesUsingSelectedFilterIndexPath:](self, "setUpCarouselDependenciesUsingSelectedFilterIndexPath:", v12);

}

- (void)displayFilters
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10038EA58;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(v3, "getFilters:", v4);

}

+ (double)defaultHeightForDisplayStyle:(int64_t)a3 inContext:(int64_t)a4
{
  CollectionsFilterSizeController *v4;
  double v5;
  double v6;

  v4 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", a3, a4);
  -[CollectionsFilterSizeController defaultHeight](v4, "defaultHeight");
  v6 = v5;

  return v6;
}

- (void)scrollToSelectedFilter
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
  objc_msgSend(v2, "scrollToSelectedFilter");

}

- (void)setupSubviews
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  -[CollectionsFilterCarouselView setFlowLayout:](self, "setFlowLayout:", v3);

  v4 = objc_alloc((Class)UICollectionView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView flowLayout](self, "flowLayout"));
  v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CollectionsFilterCarouselView setCollectionView:](self, "setCollectionView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("CollectionsFilterCarouselCollectionView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v10, "setAllowsSelection:", 1);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v11, "setAllowsMultipleSelection:", 0);

}

- (void)setUpCarouselDependenciesUsingSelectedFilterIndexPath:(id)a3
{
  int64_t context;
  CollectionsFilterLogicController *v5;
  void *v6;
  void *v7;
  CollectionsFilterLogicController *v8;
  CollectionsFilterLogicController *v9;
  CollectionsFilterLogicController *v10;
  CollectionsFilterLogicController *v11;
  CollectionsFilterSizeController *v12;
  id v13;

  v13 = a3;
  context = self->_context;
  switch(context)
  {
    case 2:
      v9 = [CollectionsFilterLogicController alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView guidesHomeResultFilter](self, "guidesHomeResultFilter"));
      v8 = -[CollectionsFilterLogicController initWithCollectionView:withGuidesHomeResultFilters:withSelectedFilterIndexPath:](v9, "initWithCollectionView:withGuidesHomeResultFilters:withSelectedFilterIndexPath:", v6, v7, v13);
      goto LABEL_7;
    case 1:
      v10 = [CollectionsFilterLogicController alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView allCollectionsResultFilter](self, "allCollectionsResultFilter"));
      v8 = -[CollectionsFilterLogicController initWithCollectionView:withAllCollectionsResultFilters:withSelectedFilterIndexPath:](v10, "initWithCollectionView:withAllCollectionsResultFilters:withSelectedFilterIndexPath:", v6, v7, v13);
      goto LABEL_7;
    case 0:
      v5 = [CollectionsFilterLogicController alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView resultFilters](self, "resultFilters"));
      v8 = -[CollectionsFilterLogicController initWithCollectionView:withResultFilters:withSelectedFilterIndexPath:](v5, "initWithCollectionView:withResultFilters:withSelectedFilterIndexPath:", v6, v7, v13);
LABEL_7:
      v11 = v8;
      -[CollectionsFilterCarouselView setLogicController:](self, "setLogicController:", v8);

      v12 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", 0, context);
      -[CollectionsFilterCarouselView setSizeController:](self, "setSizeController:", v12);

      break;
  }

}

- (void)configureFiltersCarouselMetadata:(int64_t)a3
{
  id v3;

  if ((unint64_t)a3 <= 2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView flowLayout](self, "flowLayout"));
    objc_msgSend(v3, "setScrollDirection:", 1);

  }
}

- (void)configureCarouselFilterView
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  -[CollectionsFilterCarouselView addSubview:](self, "addSubview:", v7);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView leadingAnchor](self, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v25[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView trailingAnchor](self, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v25[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView topAnchor](self, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v25[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView collectionView](self, "collectionView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView bottomAnchor](self, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v25[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  int64_t context;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedFilterIndexPath"));

  v7 = v20;
  context = self->_context;
  if (v6 == v20)
  {
    if (context == 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView guidesHomeRoutingDelegate](self, "guidesHomeRoutingDelegate"));
      objc_msgSend(v10, "didRouteToConceptFilter:atIndexPath:", 0, 0);
      goto LABEL_17;
    }
  }
  else
  {
    if (context == 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "routeToSelectedAllCollectionsFilterAtIndexPath:", v20));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allCollectionsAddressFilter"));
      if (v15)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView allCollectionsRoutingDelegate](self, "allCollectionsRoutingDelegate"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allCollectionsAddressFilter"));
        goto LABEL_10;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allCollectionsKeywordFilter"));

      if (v19)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView allCollectionsRoutingDelegate](self, "allCollectionsRoutingDelegate"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allCollectionsKeywordFilter"));
        goto LABEL_15;
      }
LABEL_17:

      v7 = v20;
      goto LABEL_18;
    }
    if (!context)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeToSelectedFilterAtIndexPath:", v20));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressFilter"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView routingDelegate](self, "routingDelegate"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressFilter"));
LABEL_10:
        v16 = (void *)v13;
        objc_msgSend(v12, "didRouteToAddressFilter:atIndexPath:", v13, v20);
LABEL_16:

        goto LABEL_17;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keywordFilter"));

      if (v17)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView routingDelegate](self, "routingDelegate"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keywordFilter"));
LABEL_15:
        v16 = (void *)v18;
        objc_msgSend(v12, "didRouteToKeywordFilter:atIndexPath:", v18, v20);
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
LABEL_18:

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView sizeController](self, "sizeController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filterAtIndexPath:", v6));

  objc_msgSend(v7, "sizeForFilter:", v9);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView sizeController](self, "sizeController", a3, a4));
  objc_msgSend(v6, "insetForFilterAtIndex:", a5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  char IsEnabled_Maps269;
  void *v8;
  void *v9;
  double v10;
  double v11;

  IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269(self, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView sizeController](self, "sizeController"));
  v9 = v8;
  if ((IsEnabled_Maps269 & 1) != 0)
    objc_msgSend(v8, "minimumInterItemSpacingForSectionAtIndex:", a5);
  else
    objc_msgSend(v8, "minimumLineSpacingForSectionAtIndex:", a5);
  v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  void *v6;
  double v7;
  double v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView sizeController](self, "sizeController", a3, a4));
  objc_msgSend(v6, "minimumInterItemSpacingForSectionAtIndex:", a5);
  v8 = v7;

  return v8;
}

- (id)titleForFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCarouselView logicController](self, "logicController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filterAtIndexPath:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filterTitle"));
  return v7;
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

- (CollectionsFilterSizeProvider)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
}

- (CollectionsFilterFetcher)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_logicController, a3);
}

- (CollectionsFilterRoutingDelegate)routingDelegate
{
  return (CollectionsFilterRoutingDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void)setRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routingDelegate, a3);
}

- (NSArray)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(id)a3
{
  objc_storeStrong((id *)&self->_resultFilters, a3);
}

- (AllCollectinsFilterRoutingDelegate)allCollectionsRoutingDelegate
{
  return (AllCollectinsFilterRoutingDelegate *)objc_loadWeakRetained((id *)&self->_allCollectionsRoutingDelegate);
}

- (void)setAllCollectionsRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_allCollectionsRoutingDelegate, a3);
}

- (NSArray)allCollectionsResultFilter
{
  return self->_allCollectionsResultFilter;
}

- (void)setAllCollectionsResultFilter:(id)a3
{
  objc_storeStrong((id *)&self->_allCollectionsResultFilter, a3);
}

- (GuidesHomeFilterRoutingDelegate)guidesHomeRoutingDelegate
{
  return (GuidesHomeFilterRoutingDelegate *)objc_loadWeakRetained((id *)&self->_guidesHomeRoutingDelegate);
}

- (void)setGuidesHomeRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_guidesHomeRoutingDelegate, a3);
}

- (NSArray)guidesHomeResultFilter
{
  return self->_guidesHomeResultFilter;
}

- (void)setGuidesHomeResultFilter:(id)a3
{
  objc_storeStrong((id *)&self->_guidesHomeResultFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidesHomeResultFilter, 0);
  objc_destroyWeak((id *)&self->_guidesHomeRoutingDelegate);
  objc_storeStrong((id *)&self->_allCollectionsResultFilter, 0);
  objc_destroyWeak((id *)&self->_allCollectionsRoutingDelegate);
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_logicController, 0);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
