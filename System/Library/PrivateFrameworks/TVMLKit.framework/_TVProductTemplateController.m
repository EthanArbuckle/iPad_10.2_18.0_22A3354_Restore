@implementation _TVProductTemplateController

- (void)updateWithViewElement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  IKImageElement *topHeroImageElement;
  IKViewElement *backdropTintElement;
  UIViewController *backdropTintViewController;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  UIViewController *v23;
  uint64_t v24;
  UIViewController *i;
  void *v26;
  void *v27;
  _TVShadowViewElementID *v28;
  _TVShadowViewElementID *v29;
  int v30;
  void *v31;
  UIViewController *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  UIViewController *v42;
  NSIndexPath *lastFocusedIndexPath;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  NSArray *v53;
  NSArray *viewControllers;
  NSArray *v55;
  NSArray *rowSpacingMetricsList;
  double height;
  NSUInteger v59;
  UICollectionView *collectionView;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  IKViewElement **p_templateElement;
  void *v71;
  id *p_backdropTintViewController;
  id *location;
  _TVProductTemplateController *v74;
  id v75;
  id v76;
  id obj;
  void *v78;
  UIViewController *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  CGSize v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  objc_super v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v96.receiver = self;
  v96.super_class = (Class)_TVProductTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v96, sel_updateWithViewElement_, v5);
  objc_storeStrong((id *)&self->_templateElement, a3);
  p_templateElement = &self->_templateElement;
  -[IKViewElement elementName](self->_templateElement, "elementName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sportsProductTemplate = objc_msgSend(v6, "isEqualToString:", CFSTR("productSportsBundleTemplate"));

  objc_msgSend(v5, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "impressionThreshold");
  self->_impressionThreshold = v8;

  v75 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v80 = (void *)-[NSArray mutableCopy](self->_viewControllers, "mutableCopy");
  topHeroImageElement = self->_topHeroImageElement;
  self->_topHeroImageElement = 0;

  backdropTintElement = self->_backdropTintElement;
  location = (id *)&self->_backdropTintElement;
  self->_backdropTintElement = 0;

  backdropTintViewController = self->_backdropTintViewController;
  p_backdropTintViewController = (id *)&self->_backdropTintViewController;
  self->_backdropTintViewController = 0;

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v71 = v5;
  objc_msgSend(v5, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
  if (!v13)
  {
    v79 = 0;
    v15 = 0;
    obj = 0;
    goto LABEL_56;
  }
  v14 = v13;
  v79 = 0;
  v15 = 0;
  obj = 0;
  v16 = *(_QWORD *)v93;
  v74 = self;
  v78 = v12;
  v81 = *(_QWORD *)v93;
  do
  {
    v17 = 0;
    v82 = v14;
    do
    {
      if (*(_QWORD *)v93 != v16)
        objc_enumerationMutation(v12);
      v18 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * v17);
      v19 = objc_msgSend(v18, "tv_elementType");
      switch(v19)
      {
        case 16:
          -[_TVProductTemplateController _configureTopHeroImage:](self, "_configureTopHeroImage:", v18);
          goto LABEL_52;
        case 12:
          if (v15)
            goto LABEL_52;
          v15 = v18;
          objc_msgSend(v15, "autoHighlightIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");

          if (v21)
          {
            if (!obj)
            {
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
              obj = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v15, "resetProperty:", 2);
          }
          break;
        case 4:
          -[_TVProductTemplateController _configureWithBgElement:](self, "_configureWithBgElement:", v18);
          goto LABEL_52;
        default:
          if (v15 != v18)
          {
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v22 = v80;
            v23 = (UIViewController *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
            if (v23)
            {
              v76 = v15;
              v24 = *(_QWORD *)v89;
              while (2)
              {
                for (i = 0; i != v23; i = (UIViewController *)((char *)i + 1))
                {
                  if (*(_QWORD *)v89 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v26, "tv_associatedIKViewElement");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v27);
                  v29 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v18);
                  if (-[_TVShadowViewElementID isEqual:](v28, "isEqual:", v29))
                  {
                    v23 = v26;

                    goto LABEL_28;
                  }

                }
                v23 = (UIViewController *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
                if (v23)
                  continue;
                break;
              }
LABEL_28:
              self = v74;
              v15 = v76;
              v12 = v78;
            }

            v30 = 0;
            goto LABEL_30;
          }
          break;
      }
      v23 = self->_bannerViewController;
      v30 = 1;
LABEL_30:
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_viewControllerFromElement:existingController:", v18, v23);
      v32 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v32)
        goto LABEL_31;
      v38 = v15;
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](v23, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "_viewFromElement:existingView:", v18, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        v32 = 0;
        v15 = v38;
        v12 = v78;
        goto LABEL_48;
      }
      objc_opt_class();
      v42 = (objc_opt_isKindOfClass() & 1) != 0
          ? v23
          : (UIViewController *)objc_alloc_init(MEMORY[0x24BDF6F98]);
      v32 = v42;
      -[UIViewController setView:](v42, "setView:", v41);
      -[UIViewController tv_setAssociatedIKViewElement:](v32, "tv_setAssociatedIKViewElement:", v18);

      v15 = v38;
      v12 = v78;
      if (v32)
      {
LABEL_31:
        if (!v30)
        {
          objc_msgSend(v18, "attributes");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("markBackgroundSegment"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "BOOLValue");

          if (v35)
          {
            objc_storeStrong(location, v18);
            objc_storeStrong(p_backdropTintViewController, v32);
          }
          objc_msgSend(v18, "autoHighlightIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "length");

          if (v37)
          {
            v16 = v81;
            v14 = v82;
            if (!obj)
            {
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v75, "count"), 1);
              obj = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v18, "resetProperty:", 2);
          }
          else
          {
            v16 = v81;
            v14 = v82;
          }
          objc_msgSend(v75, "addObject:", v32);
          if (!v23)
            goto LABEL_51;
LABEL_49:
          if (v23 == v32)
            objc_msgSend(v80, "removeObjectIdenticalTo:", v23);
          goto LABEL_51;
        }
        v32 = v32;

        v79 = v32;
      }
LABEL_48:
      v16 = v81;
      v14 = v82;
      if (v23)
        goto LABEL_49;
LABEL_51:

LABEL_52:
      ++v17;
    }
    while (v17 != v14);
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
  }
  while (v14);
LABEL_56:

  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  self->_lastFocusedIndexPath = 0;

  objc_storeStrong((id *)&self->_autoHighlightIndexPath, obj);
  if (objc_msgSend(v80, "count"))
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v44 = v80;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v85 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
          objc_msgSend(v49, "willMoveToParentViewController:", 0);
          objc_msgSend(v49, "view");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "removeFromSuperview");

          objc_msgSend(v49, "removeFromParentViewController");
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      }
      while (v46);
    }

    v51 = 1;
    v52 = v71;
  }
  else
  {
    v52 = v71;
    v51 = objc_msgSend(v71, "updateType") != 1;
  }
  v53 = (NSArray *)objc_msgSend(v75, "copy");
  viewControllers = self->_viewControllers;
  self->_viewControllers = v53;

  v83 = (CGSize)*MEMORY[0x24BDBF148];
  -[_TVProductTemplateController _spacingMetricsForViewControllers:contentSize:](self, "_spacingMetricsForViewControllers:contentSize:", self->_viewControllers, &v83);
  v55 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rowSpacingMetricsList = self->_rowSpacingMetricsList;
  self->_rowSpacingMetricsList = v55;

  if (self->_preloadContentSize.width != v83.width || self->_preloadContentSize.height != v83.height)
  {
    self->_preloadOnLayout = 1;
    self->_preloadContentSize = v83;
  }
  -[_TVProductTemplateController _configureWithBannerElement:](self, "_configureWithBannerElement:", v15);
  objc_storeStrong((id *)&self->_bannerViewController, v79);
  self->_preloadContentSize.height = self->_productBannerHeight + self->_preloadContentSize.height;
  if (-[_TVProductTemplateController _shouldUsePartialScrollingTemplate](self, "_shouldUsePartialScrollingTemplate"))
  {
    height = self->_preloadContentSize.height;
  }
  else
  {
    v59 = -[NSArray count](self->_viewControllers, "count");
    height = self->_preloadContentSize.height;
    if (v59)
      height = height + 70.0 + 89.0;
  }
  self->_preloadContentSize.height = height + 500.0;
  if (-[_TVProductTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    collectionView = self->_collectionView;
    if (v51)
    {
      -[UICollectionView reloadData](collectionView, "reloadData");
    }
    else
    {
      -[UICollectionView collectionViewLayout](collectionView, "collectionViewLayout");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "invalidateLayout");

    }
    objc_msgSend(v52, "updateType");
  }
  v62 = (id)-[_TVProductTemplateController view](self, "view");
  -[UICollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", -[IKViewElement tv_semanticContentAttribute](*p_templateElement, "tv_semanticContentAttribute"));
  -[_TVProductTemplateController _adamIDForElement:](self, "_adamIDForElement:", *p_templateElement);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "initWithActivityType:", CFSTR("com.apple.iTunes.externalMediaContent"));
    objc_msgSend(v64, "setExternalMediaContentIdentifier:", v63);
    -[_TVProductTemplateController setUserActivity:](self, "setUserActivity:", v64);
  }
  else
  {
    -[_TVProductTemplateController _canonicalIDForElement:](self, "_canonicalIDForElement:", *p_templateElement);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "initWithActivityType:", CFSTR("com.apple.UMC.externalMediaContent"));
      objc_msgSend(v65, "setExternalMediaContentIdentifier:", v64);
      -[_TVProductTemplateController setUserActivity:](self, "setUserActivity:", v65);

    }
  }

  -[_TVProductTemplateController _configureBackgroundTintView](self, "_configureBackgroundTintView");
  objc_msgSend(v52, "style");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "tv_backgroundColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "color");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVProductTemplateController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setBackgroundColor:", v68);

}

- (void)loadView
{
  id v3;
  void *v4;
  _TVCollectionViewFlowLayout *v5;
  _TVStackCollectionView *v6;
  void *v7;
  UICollectionView *v8;
  void *v9;
  void *v10;
  UICollectionView *collectionView;
  UICollectionView *v12;
  id v13;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v13 = (id)objc_msgSend(v3, "initWithFrame:");

  -[_TVProductTemplateController setView:](self, "setView:", v13);
  v5 = objc_alloc_init(_TVCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v5, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v5, "setMinimumInteritemSpacing:", 0.0);
  v6 = [_TVStackCollectionView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = -[_TVStackCollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[UICollectionView setDelegate:](v8, "setDelegate:", self);
  -[UICollectionView setDataSource:](v8, "setDataSource:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TVProductCellIdentifier"));
  -[UICollectionView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v8, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x24BDF7630], CFSTR("TVProductHeaderCellIdentifier"));
  -[UICollectionView setShowsVerticalScrollIndicator:](v8, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v8, "setBackgroundColor:", v10);

  -[UICollectionView setAlwaysBounceVertical:](v8, "setAlwaysBounceVertical:", 1);
  -[UICollectionView _setContentInsetAdjustmentBehavior:](v8, "_setContentInsetAdjustmentBehavior:", 0);
  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v12 = v8;

  objc_msgSend(v13, "addSubview:", self->_collectionView);
}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVProductTemplateController;
  -[_TVBgImageLoadingViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_bgImageElement && !self->_fadedIn)
  {
    self->_fadedIn = 1;
    v4 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46___TVProductTemplateController_viewDidAppear___block_invoke;
    block[3] = &unk_24EB85440;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    -[_TVProductTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateImpressions, 0, 0.7);
  }
  else
  {
    -[_TVProductTemplateController _updateImpressions](self, "_updateImpressions");
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[CALayer setFilters:](self->_bgBlurSublayer, "setFilters:", 0, a4);
  -[CALayer removeAnimationForKey:](self->_bgBlurSublayer, "removeAnimationForKey:", CFSTR("blurRadiusAnimation"));
  -[CALayer removeFromSuperlayer](self->_bgBlurSublayer, "removeFromSuperlayer");
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  void *v5;
  id v6;
  void *v7;
  CALayer *v8;
  CALayer *bgBlurSublayer;
  CALayer *v10;
  void *v11;
  CALayer *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];
  CGRect v18;

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)_TVProductTemplateController;
  -[_TVBgImageLoadingViewController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  if (self->_autoHighlightIndexPath)
  {
    v4 = *MEMORY[0x24BDBEFB0];
    -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v4, CGRectGetMinY(v18));
    -[_TVProductTemplateController scrollViewDidScroll:](self, "scrollViewDidScroll:", self->_collectionView);

  }
  if (self->_bgImageElement && !self->_fadedIn && !self->_bgBlurSublayer)
  {
    v6 = objc_alloc(MEMORY[0x24BDE56B0]);
    v7 = (void *)objc_msgSend(v6, "initWithType:", *MEMORY[0x24BDE5A78]);
    objc_msgSend(v7, "setValue:forKey:", &unk_24EBCD548, CFSTR("inputRadius"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
    objc_msgSend(v7, "setValue:forKey:", &unk_24EBCCBE0, CFSTR("inputHardEdges"));
    objc_msgSend(v7, "setName:", CFSTR("blurFilter"));
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v8 = (CALayer *)objc_claimAutoreleasedReturnValue();
    bgBlurSublayer = self->_bgBlurSublayer;
    self->_bgBlurSublayer = v8;

    -[CALayer setContents:](self->_bgBlurSublayer, "setContents:", -[UIImage CGImage](self->_bgImage, "CGImage"));
    v10 = self->_bgBlurSublayer;
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setFilters:](v10, "setFilters:", v11);

    v12 = self->_bgBlurSublayer;
    -[UIImageView layer](self->_bgImageView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    -[CALayer setFrame:](v12, "setFrame:");

    -[UIImageView layer](self->_bgImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", self->_bgBlurSublayer);

  }
  -[_TVProductTemplateController userActivity](self, "userActivity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "becomeCurrent");

}

- (void)configureAppearanceTransition
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  UIImageView *topHeroImageView;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UICollectionView *collectionView;
  void *v27;
  void *v28;
  objc_super v29;
  id location[2];
  _QWORD v31[4];
  id v32;
  id v33;
  char v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  id v38;
  char v39;
  BOOL v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v3 = self->_topHeroImageVisible
    && -[_TVProductTemplateController _shouldShowTopHeroImage](self, "_shouldShowTopHeroImage");
  -[_TVProductTemplateController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVProductTemplateController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_TVProductTemplateController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "templateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", self);

  }
  else
  {
    v11 = 0;
  }

  -[_TVProductTemplateController transitionCoordinator](self, "transitionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (topHeroImageView = self->_topHeroImageView, v12, topHeroImageView))
  {
    self->_lightStatusBar = v3;
    objc_initWeak(location, self);
    -[_TVProductTemplateController transitionCoordinator](self, "transitionCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __61___TVProductTemplateController_configureAppearanceTransition__block_invoke;
    v36[3] = &unk_24EB86578;
    v39 = v11;
    objc_copyWeak(&v38, location);
    v40 = v3;
    v16 = v5;
    v37 = v16;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __61___TVProductTemplateController_configureAppearanceTransition__block_invoke_2;
    v31[3] = &unk_24EB86578;
    v34 = v11;
    objc_copyWeak(&v33, location);
    v35 = v3;
    v32 = v16;
    objc_msgSend(v14, "animateAlongsideTransition:completion:", v36, v31);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v38);
    objc_destroyWeak(location);
  }
  else if (self->_topHeroImageView)
  {
    if (v11)
    {
      -[_TVProductTemplateController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationBar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    if (v3)
      v19 = 0.0;
    else
      v19 = 1.0;
    objc_msgSend(v18, "_setBackgroundOpacity:", v19);
    objc_msgSend(v18, "_setTitleOpacity:", v19);
    if (v3)
    {
      objc_msgSend(v5, "setTitle:", 0);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    }
    else
    {
      -[_TVProductTemplateController navigationItem](self, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v21);

      objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v22);

    self->_lightStatusBar = v3;
    -[_TVProductTemplateController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    if (self->_sportsProductTemplate)
    {
      if (-[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone"))
      {
        -[UICollectionView visibleSupplementaryViewsOfKind:](self->_collectionView, "visibleSupplementaryViewsOfKind:", *MEMORY[0x24BDF7630]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](self->_bannerViewController, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSubview:", v25);

        -[_TVProductTemplateController _updateTopHeroImageOverlay](self, "_updateTopHeroImageOverlay");
      }
      collectionView = self->_collectionView;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v27;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView reloadItemsAtIndexPaths:](collectionView, "reloadItemsAtIndexPaths:", v28);

      *(_OWORD *)location = *MEMORY[0x24BDBEFB0];
      -[_TVProductTemplateController scrollViewWillEndDragging:withVelocity:targetContentOffset:](self, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", self->_collectionView, location, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", *(double *)location, *(double *)&location[1]);
    }

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)_TVProductTemplateController;
    -[_TVBgImageLoadingViewController configureAppearanceTransition](&v29, sel_configureAppearanceTransition);
  }

}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVProductTemplateController;
  -[_TVProductTemplateController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[_TVProductTemplateController userActivity](self, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignCurrent");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVProductTemplateController;
  -[_TVBgImageLoadingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_TVProductTemplateController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Height;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double Width;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  CGFloat v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  UIImageView *topHeroGradientView;
  uint64_t v50;
  uint64_t v51;
  CGFloat v52;
  double MaxY;
  void *v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  UIImageView *v59;
  UIImageView *topHeroImageView;
  uint64_t v61;
  uint64_t v62;
  CGFloat rect;
  objc_super v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v64.receiver = self;
  v64.super_class = (Class)_TVProductTemplateController;
  -[_TVBgImageLoadingViewController viewDidLayoutSubviews](&v64, sel_viewDidLayoutSubviews);
  if (self->_preloadContentSize.width > 0.0 && self->_preloadContentSize.height > 0.0)
  {
    if (self->_preloadOnLayout)
    {
      self->_preloadOnLayout = 0;
      -[UICollectionView _ensureViewsAreLoadedInRect:](self->_collectionView, "_ensureViewsAreLoadedInRect:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    }
    -[_TVProductTemplateController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v65.origin.x = v5;
    v65.origin.y = v7;
    v65.size.width = v9;
    v65.size.height = v11;
    Height = CGRectGetHeight(v65);
    v13 = Height - self->_productBannerHeight;
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    v15 = fmin(v13 + v14, Height);
    v16 = Height - v15;
    v66.origin.x = v5;
    v66.origin.y = v7;
    v66.size.width = v9;
    v66.size.height = v11;
    -[UIView setFrame:](self->_backdropView, "setFrame:", 0.0, v16, CGRectGetWidth(v66), v15);
    -[UIImageView image](self->_vignetteView, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    v21 = v20;

    -[UIImageView setFrame:](self->_vignetteView, "setFrame:", 0.0, v16 - v21, v19, v21);
  }
  -[IKViewElement style](self->_templateElement, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tv_margin");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  if (!self->_topHeroImageView)
  {
    topHeroImageView = 0;
LABEL_18:
    -[UIImageView setHidden:](topHeroImageView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_topHeroGradientView, "setHidden:", 1);
    -[UIView setHidden:](self->_topHeroSeparatorView, "setHidden:", 1);
    -[UICollectionView _setContentInsetAdjustmentBehavior:](self->_collectionView, "_setContentInsetAdjustmentBehavior:", 0);
    goto LABEL_21;
  }
  if (!-[_TVProductTemplateController _shouldShowTopHeroImage](self, "_shouldShowTopHeroImage"))
  {
    topHeroImageView = self->_topHeroImageView;
    goto LABEL_18;
  }
  -[UICollectionView _setContentInsetAdjustmentBehavior:](self->_collectionView, "_setContentInsetAdjustmentBehavior:", 2);
  -[_TVProductTemplateController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaInsets");
  v33 = v32;

  if ((-[UICollectionView isDragging](self->_collectionView, "isDragging") & 1) == 0
    && (-[UICollectionView isDecelerating](self->_collectionView, "isDecelerating") & 1) == 0)
  {
    -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
    v35 = v34;
    rect = v34;
    -[_TVProductTemplateController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    Width = CGRectGetWidth(v67);

    -[UIImageView setFrame:](self->_topHeroImageView, "setFrame:", 0.0, 0.0, Width, v35);
    -[UIImageView frame](self->_topHeroGradientView, "frame");
    v61 = v39;
    v62 = v38;
    -[_TVProductTemplateController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    v41 = CGRectGetWidth(v68);

    -[UIImageView image](self->_topHeroGradientView, "image");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "size");
    v44 = v43;

    -[_TVProductTemplateController view](self, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "safeAreaInsets");
    v47 = v46 + 30.0;

    if (v44 >= v47)
      v48 = v44;
    else
      v48 = v47;
    topHeroGradientView = self->_topHeroGradientView;
    v51 = v61;
    v50 = v62;
    v52 = v41;
    v69 = CGRectIntegral(*(CGRect *)(&v48 - 3));
    -[UIImageView setFrame:](topHeroGradientView, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    v70.origin.x = 0.0;
    v70.origin.y = 0.0;
    v70.size.width = Width;
    v70.size.height = rect;
    MaxY = CGRectGetMaxY(v70);
    -[_TVProductTemplateController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    v55 = CGRectGetWidth(v71);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "scale");
    v58 = 1.0 / v57;

    -[UIView setFrame:](self->_topHeroSeparatorView, "setFrame:", 0.0, MaxY, v55, v58);
  }
  -[UIImageView setHidden:](self->_topHeroImageView, "setHidden:", 0);
  v59 = self->_topHeroGradientView;
  if (self->_sportsProductTemplate)
  {
    -[UIImageView setHidden:](v59, "setHidden:", 1);
    -[_TVProductTemplateController _updateTopHeroImageOverlay](self, "_updateTopHeroImageOverlay");
  }
  else
  {
    -[UIImageView setHidden:](v59, "setHidden:", 0);
  }
  v28 = v28 + v33;
  -[UIView setHidden:](self->_topHeroSeparatorView, "setHidden:", 0);
  v24 = 0.0;
LABEL_21:
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v24, v26, v28, v30);
}

- (int64_t)_overrideLargeTitleDisplayMode
{
  objc_super v3;

  if (self->_topHeroImageView)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)_TVProductTemplateController;
  return -[_TVBgImageLoadingViewController _overrideLargeTitleDisplayMode](&v3, sel__overrideLargeTitleDisplayMode);
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
  v9.super_class = (Class)_TVProductTemplateController;
  v7 = a4;
  -[_TVProductTemplateController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83___TVProductTemplateController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24EB85720;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  UIViewController *v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;

  v5 = a4;
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVProductCellIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v5, "item");
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v7);
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    v21 = *MEMORY[0x24BDF7718];
    v22 = v9;
    -[_TVProductTemplateController _cellMarginForIndex:partialMargins:](self, "_cellMarginForIndex:partialMargins:", v7, &v21);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v6, "setPartialMargins:", v21, v22);
    objc_msgSend(v6, "setMargins:", v11, v13, v15, v17);
    if (!v7)
      objc_msgSend(v6, "enableWithMargins:", v11, v13, v15, v17);
  }
  else
  {
    v8 = self->_bannerViewController;
    -[_TVProductCollectionViewCell setViewController:](self->_bannerCell, "setViewController:", 0);
    objc_storeStrong((id *)&self->_bannerCell, v6);
  }
  if (-[_TVProductTemplateController _sportsLandscapePhoneIsOverlaySection:](self, "_sportsLandscapePhoneIsOverlaySection:", v5))
  {
    objc_msgSend(v6, "setViewController:", 0);
  }
  else
  {
    objc_msgSend(v6, "setViewController:", v8);
    objc_msgSend(v6, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v8, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

  }
  return v6;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  UICollectionView *collectionView;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  collectionView = self->_collectionView;
  v7 = *MEMORY[0x24BDF7630];
  v8 = a5;
  -[UICollectionView dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v7, CFSTR("TVProductHeaderCellIdentifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_topHeroImageView);
  objc_msgSend(v9, "addSubview:", self->_topHeroSeparatorView);
  LODWORD(v7) = -[_TVProductTemplateController _sportsLandscapePhoneIsOverlaySection:](self, "_sportsLandscapePhoneIsOverlaySection:", v8);

  if ((_DWORD)v7)
  {
    -[UIViewController view](self->_bannerViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[_TVProductTemplateController _updateTopHeroImageOverlay](self, "_updateTopHeroImageOverlay");
  }
  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return -[NSArray count](self->_viewControllers, "count", a3);
  else
    return self->_bannerViewController != 0;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  NSIndexPath *autoHighlightIndexPath;

  autoHighlightIndexPath = self->_autoHighlightIndexPath;
  if (!autoHighlightIndexPath)
    autoHighlightIndexPath = self->_lastFocusedIndexPath;
  return autoHighlightIndexPath;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  NSIndexPath *autoHighlightIndexPath;

  autoHighlightIndexPath = self->_autoHighlightIndexPath;
  self->_autoHighlightIndexPath = 0;

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  UIViewController *v6;
  void *v7;
  char v8;
  UIViewController *v9;

  objc_msgSend(a4, "viewController", a3);
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    -[_TVProductTemplateController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v9);

    v6 = v9;
    if ((v8 & 1) == 0)
    {
      -[_TVProductTemplateController addChildViewController:](self, "addChildViewController:", v9);
      -[UIViewController didMoveToParentViewController:](v9, "didMoveToParentViewController:", self);
      v6 = v9;
      if (v9 == self->_backdropTintViewController)
      {
        -[_TVProductTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
        v6 = v9;
      }
    }
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_TVProductTemplateController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0)
    {
      objc_msgSend(v6, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDescendantOfView:", v10);

      if (v9)
      {
        objc_msgSend(v6, "willMoveToParentViewController:", 0);
        objc_msgSend(v6, "removeFromParentViewController");
      }
    }
    else
    {

    }
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double *v9;
  UIViewController *v10;
  UIViewController *v11;
  double v12;
  double v13;
  void *v14;
  double Width;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;
  CGRect v24;

  v7 = a3;
  v8 = a5;
  v9 = (double *)MEMORY[0x24BDBF148];
  if (objc_msgSend(v8, "section"))
  {
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", objc_msgSend(v8, "item"));
    v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self->_bannerViewController;
  }
  v11 = v10;
  v12 = *v9;
  v13 = v9[1];
  if (v10)
  {
    -[UIViewController view](v10, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v24);
    v16 = Width;
    if (v14)
    {
      objc_msgSend(v14, "tv_sizeThatFits:", Width, 0.0);
      v12 = v17;
      v13 = v18;
    }
    if (!-[_TVProductTemplateController _shouldUsePartialScrollingTemplate](self, "_shouldUsePartialScrollingTemplate")
      && objc_msgSend(v8, "section") == 1
      && !objc_msgSend(v8, "item"))
    {
      v13 = v13 + 70.0 + 89.0;
    }
    if (objc_msgSend(v8, "section") == 1)
    {
      -[_TVProductTemplateController _cellMarginForIndex:partialMargins:](self, "_cellMarginForIndex:partialMargins:", objc_msgSend(v8, "item"), 0);
      v13 = v13 + v19 + v20;
    }
    if (-[_TVProductTemplateController _sportsLandscapePhoneIsOverlaySection:](self, "_sportsLandscapePhoneIsOverlaySection:", v8))
    {
      v13 = 1.0;
      v12 = v16;
    }

  }
  v21 = v12;
  v22 = v13;
  result.height = v22;
  result.width = v21;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  if (a5)
  {
    v5 = *MEMORY[0x24BDF7718];
    v6 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v7 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v8 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  else
  {
    -[IKViewElement style](self->_productBannerElement, "style", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tv_margin");
    v5 = v10;
    v6 = v11;
    v7 = v12;
    v8 = v13;

  }
  v14 = v5;
  v15 = v6;
  v16 = v7;
  v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_topHeroImageViewSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[IKImageElement tv_imageScaleToSize](self->_topHeroImageElement, "tv_imageScaleToSize");
  v4 = v3;
  v6 = v5;
  if (-[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone"))
  {
    -[_TVProductTemplateController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    -[_TVProductTemplateController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v6 = v9 - v11;

  }
  v12 = v4;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v6;
  double v7;
  CGSize result;

  if (a5 || !-[_TVProductTemplateController _shouldShowTopHeroImage](self, "_shouldShowTopHeroImage", a3, a4))
  {
    v6 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double y;
  BOOL v16;
  BOOL v17;
  id v18;

  v7 = a3;
  if (self->_topHeroImageView)
  {
    v18 = v7;
    v8 = -[_TVProductTemplateController _shouldShowTopHeroImage](self, "_shouldShowTopHeroImage");
    v7 = v18;
    if (v8)
    {
      -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
      v10 = v9;
      -[_TVProductTemplateController _largeTitleHeight](self, "_largeTitleHeight");
      v12 = v10 + v11;
      -[UICollectionView safeAreaInsets](self->_collectionView, "safeAreaInsets");
      v7 = v18;
      v14 = v12 - v13;
      y = a5->y;
      v16 = y >= v10 * 0.5 && y < v14;
      if (v16 || ((v14 = 0.0, y >= 0.0) ? (v17 = y < v10 * 0.5) : (v17 = 0), v17))
        a5->y = v14;
    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  -[_TVProductTemplateController _updateImpressions](self, "_updateImpressions");
  if (self->_impressionThreshold > 0.0)
    -[NSArray enumerateObjectsUsingBlock:](self->_viewControllers, "enumerateObjectsUsingBlock:", &__block_literal_global_24);
  -[_TVProductTemplateController _updateTopHeroImageVisibility:](self, "_updateTopHeroImageVisibility:", v4);
  -[_TVProductTemplateController _updateBackgroundTintViewEffects](self, "_updateBackgroundTintViewEffects");

}

- (double)_largeTitleHeight
{
  UICollectionView *collectionView;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  UICollectionView *v16;
  double MaxY;
  double v18;
  BOOL v19;
  double result;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;

  v28 = *MEMORY[0x24BDAC8D0];
  if (self->_largeTitleHeight <= 0.0)
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "components");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
        {
          v11 = v10;
          v21 = v8;
          v22 = v5;
          v6 = 0;
          v12 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (self->_sportsProductTemplate)
              {
                if (!v6)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v6 = v14;
                  else
                    v6 = 0;
                }
                NSClassFromString(CFSTR("WLKUIProductSportsGridView"));
              }
              else
              {
                objc_opt_class();
              }
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = v14;

                v6 = v15;
                goto LABEL_21;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v11)
              continue;
            break;
          }
LABEL_21:

          if (v6)
          {
            v16 = self->_collectionView;
            objc_msgSend(v6, "bounds");
            -[UICollectionView convertRect:fromView:](v16, "convertRect:fromView:", v6);
            MaxY = CGRectGetMaxY(v29);
            -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
            self->_largeTitleHeight = MaxY - v18 + 10.0;
          }
          v5 = v22;
          goto LABEL_26;
        }

      }
      v6 = 0;
    }
LABEL_26:

  }
  v19 = -[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone");
  result = 10.0;
  if (!v19)
  {
    result = self->_largeTitleHeight;
    if (result == 0.0)
      return 54.0;
  }
  return result;
}

- (void)_updateTopHeroImageOverlay
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double MaxX;
  CGFloat v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (-[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone"))
  {
    -[UIViewController view](self->_bannerViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");

    -[UIViewController view](self->_bannerViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVProductTemplateController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "sizeThatFits:", v6, 0.0);

    -[_TVProductTemplateController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");

    -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
    UIRectCenteredYInRect();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[_TVProductTemplateController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    MaxX = CGRectGetMaxX(v20);
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    v18 = MaxX - CGRectGetWidth(v21);

    -[UIViewController view](self->_bannerViewController, "view");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v22.origin.x = v18;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    v23 = CGRectIntegral(v22);
    objc_msgSend(v19, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);

  }
}

- (void)_updateTopHeroImageVisibility:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 IsReduceMotionEnabled;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  double x;
  CGFloat v24;
  CGFloat v25;
  double height;
  double MaxY;
  double v28;
  void *v29;
  double v30;
  double v31;
  int v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  id *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[_TVProductTemplateController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
  v9 = v8;
  v11 = v10;
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (v5 <= 0.0 && !-[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone"))
  {
    -[_TVProductTemplateController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v88.origin.x = v15;
    v88.origin.y = v17;
    v88.size.width = v19;
    v80 = v21;
    v88.size.height = v21;
    Width = CGRectGetWidth(v88);
    x = 0.0;
    v79 = v19;
    if (IsReduceMotionEnabled)
    {
      v24 = v17;
      v25 = v15;
      height = v11;
    }
    else
    {
      UIRectCenteredXInRect();
      v90 = CGRectInset(v89, v5 * 0.45, v5 * 0.45);
      x = v90.origin.x;
      Width = v90.size.width;
      v24 = v17;
      v25 = v15;
      height = v90.size.height;
    }
    -[UIImageView setFrame:](self->_topHeroImageView, "setFrame:", x, v5, Width, height);
    v91.origin.x = x;
    v91.origin.y = v5;
    v91.size.width = Width;
    v91.size.height = height;
    MaxY = CGRectGetMaxY(v91);
    v92.origin.x = v25;
    v92.origin.y = v24;
    v92.size.width = v79;
    v92.size.height = v80;
    v28 = CGRectGetWidth(v92);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scale");
    v31 = 1.0 / v30;

    -[UIView setFrame:](self->_topHeroSeparatorView, "setFrame:", 0.0, MaxY, v28, v31);
  }
  v32 = v5 > v11 || IsReduceMotionEnabled;
  if (v32 != 1)
    -[UIImageView _setContentRectInPixels:forContentSize:](self->_topHeroImageView, "_setContentRectInPixels:forContentSize:", 0.0, fmin(v5 * -0.28, 0.0), v9, v11, v9, v11);
  if (self->_topHeroImageView)
  {
    v33 = -[_TVProductTemplateController _shouldShowTopHeroImage](self, "_shouldShowTopHeroImage");
    -[UICollectionView safeAreaInsets](self->_collectionView, "safeAreaInsets");
    v35 = v11 - v34;
    -[_TVProductTemplateController _largeTitleHeight](self, "_largeTitleHeight");
    v37 = v36;
    if (v5 - v35 >= 0.0)
      v38 = v5 - v35;
    else
      v38 = 0.0;
    if (v33)
    {
      v39 = fmin(v38 / (v36 * 0.5), 1.0);
      -[UIImageView setAlpha:](self->_topHeroGradientView, "setAlpha:", 1.0 - v39);
      objc_msgSend(v7, "_setBackgroundOpacity:", v39);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "blendWithColor:percentage:", v41, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTintColor:", v42);

      v43 = -[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone");
      if (v5 <= 0.0 && v43)
      {
        -[_TVProductTemplateController view](self, "view");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "safeAreaInsets");
        v46 = v5 + v45;

        if (v46 < 0.0)
          v46 = 0.0;
        -[_TVProductTemplateController view](self, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "safeAreaInsets");
        v49 = v46 / (v48 * 0.5);

        objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "blendWithColor:percentage:", v51, fmin(v49, 1.0));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTintColor:", v52);

      }
      self->_lightStatusBar = v39 <= 0.3;
      -[_TVProductTemplateController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    }
    -[_TVProductTemplateController navigationItem](self, "navigationItem");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "title");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVProductTemplateController parentViewController](self, "parentViewController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "navigationItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (fmin(v38 / v37, 1.0) >= 1.0)
    {
      if (!self->_topHeroImageVisible)
        goto LABEL_34;
      if (!v7)
        goto LABEL_34;
      self->_topHeroImageVisible = 0;
      if (!v33)
        goto LABEL_34;
      v60 = (void *)MEMORY[0x24BDF6F90];
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke;
      v84[3] = &unk_24EB865E0;
      v58 = &v85;
      v85 = v7;
      v59 = &v86;
      v86 = v56;
      v87 = v54;
      objc_msgSend(v60, "animateWithDuration:delay:options:animations:completion:", 7, v84, 0, 0.15, 0.0);

    }
    else
    {
      if (v38 / v37 >= 1.0)
        goto LABEL_34;
      if (self->_topHeroImageVisible)
        goto LABEL_34;
      if (!v7)
        goto LABEL_34;
      self->_topHeroImageVisible = 1;
      if (!v33)
        goto LABEL_34;
      v57 = (void *)MEMORY[0x24BDF6F90];
      v81[0] = MEMORY[0x24BDAC760];
      v81[1] = 3221225472;
      v81[2] = __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke_2;
      v81[3] = &unk_24EB848C0;
      v58 = &v82;
      v82 = v7;
      v59 = &v83;
      v83 = v56;
      objc_msgSend(v57, "animateWithDuration:delay:options:animations:completion:", 7, v81, 0, 0.15, 0.0);
    }

LABEL_34:
    v61 = v37 + v35;
    -[UICollectionView frame](self->_collectionView, "frame");
    v62 = v37 + v35 + CGRectGetHeight(v93);
    -[UICollectionView contentSize](self->_collectionView, "contentSize");
    if (v62 > v63)
    {
      -[UICollectionView contentInset](self->_collectionView, "contentInset");
      v65 = v64;
      v67 = v66;
      v69 = v68;
      -[_TVProductTemplateController view](self, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "safeAreaInsets");
      v72 = v71;
      -[IKViewElement style](self->_templateElement, "style");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "tv_margin");
      v75 = v72 + v74;

      -[UICollectionView frame](self->_collectionView, "frame");
      v76 = v61 + CGRectGetHeight(v94);
      -[UICollectionView contentSize](self->_collectionView, "contentSize");
      if (v75 >= v76 - v77)
        v78 = v75;
      else
        v78 = v76 - v77;
      -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v65, v67, v78, v69);
    }

  }
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  int64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVProductTemplateController;
  result = -[_TVBgImageLoadingViewController preferredStatusBarStyle](&v4, sel_preferredStatusBarStyle);
  if (self->_topHeroImageView)
    return self->_lightStatusBar;
  return result;
}

- (void)_updateImpressions
{
  -[_TVProductTemplateController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
  if (self->_impressionThreshold > 0.0)
    -[_TVProductTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
}

- (void)_cancelImpressionsUpdate
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__recordImpressionsForVisibleView, 0);
}

- (void)_recordImpressionsForVisibleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_TVProductTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IKViewElement appDocument](self->_templateElement, "appDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVProductTemplateController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v6, "recordImpressionsForViewElements:", v5);

  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IKViewElement appDocument](self->_templateElement, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_TVProductTemplateController isViewLoaded](self, "isViewLoaded"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v24 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v14, "viewController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObjectsFromArray:", v16);

            objc_msgSend(v14, "titleView");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              v19 = objc_msgSend(v14, "isShowingTitleView");

              if (v19)
              {
                objc_msgSend(v14, "titleView");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "tv_impressionableElementsForDocument:", v4);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObjectsFromArray:", v21);

              }
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v11);
      }

      v7 = v24;
    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_collectionView)
  {
    v4[0] = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

- (id)_adamIDForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tv_stringForKey:", CFSTR("data-siri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = v5;
    v17 = v3;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") == 2)
          {
            objc_msgSend(v12, "objectAtIndex:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqualToString:", CFSTR("adamid")))
            {
              objc_msgSend(v12, "objectAtIndex:", 1);
              v14 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v14;
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v5 = v16;
    v3 = v17;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_canonicalIDForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tv_stringForKey:", CFSTR("data-siri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = v5;
    v17 = v3;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") == 2)
          {
            objc_msgSend(v12, "objectAtIndex:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqualToString:", CFSTR("canonicalId")))
            {
              objc_msgSend(v12, "objectAtIndex:", 1);
              v14 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v14;
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v5 = v16;
    v3 = v17;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_yOffsetForView:(id)a3 withScrollView:(id)a4 targetYOffset:(double)a5
{
  id v8;
  id v9;
  UICollectionView *collectionView;
  void *v11;
  void *v12;
  UICollectionView *v13;
  void *v14;
  uint64_t v15;
  UICollectionView *v16;
  void *v17;
  double productBannerHeight;
  uint64_t v19;
  UICollectionView *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  double MinY;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  int v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (self->_bannerViewController && -[NSArray count](self->_viewControllers, "count"))
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](v13, "cellForItemAtIndexPath:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 1, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](v16, "cellForItemAtIndexPath:", v17);
    v64 = objc_claimAutoreleasedReturnValue();

    productBannerHeight = self->_productBannerHeight;
    v19 = -[_TVProductTemplateController _lastFocusableCellIndex](self, "_lastFocusableCellIndex");
    if (v19 < 1)
    {
      v22 = 0;
    }
    else
    {
      v20 = self->_collectionView;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](v20, "cellForItemAtIndexPath:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v25 = v19 > 0 && self->_isPartialScrollingTemplate;
    -[IKViewElement attributes](self->_templateElement, "attributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("partialScrollingEnabled"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      v28 = 0;
    else
      v28 = v25;
    if (v27 && v25)
    {
      -[IKViewElement attributes](self->_templateElement, "attributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", CFSTR("partialScrollingEnabled"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v30, "BOOLValue");

    }
    if (objc_msgSend(v8, "isDescendantOfView:", v12))
    {
      v31 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v12, "frame");
      MinY = CGRectGetMinY(v76);
      v33 = v31;
      goto LABEL_21;
    }
    v35 = (void *)v15;
    if (v22 && objc_msgSend(v8, "isDescendantOfView:", v22))
    {
      objc_msgSend(v9, "contentInset");
      v37 = v36;
      objc_msgSend(v22, "frame");
      v38 = CGRectGetMinY(v77);
      objc_msgSend(v9, "contentSize");
      v40 = v39;
      objc_msgSend(v9, "frame");
      v41 = v37 + v40 - CGRectGetHeight(v78);
      if (v38 < v41)
        v41 = v38;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      if (v42 < productBannerHeight)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", productBannerHeight);
        v43 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v43;
      }
      v34 = (void *)v64;
      goto LABEL_49;
    }
    if (productBannerHeight > a5)
      v44 = v28;
    else
      v44 = 0;
    v34 = (void *)v64;
    if (v44 != 1)
      goto LABEL_47;
    if (objc_msgSend(v8, "isDescendantOfView:", v15))
    {
      objc_msgSend(v9, "contentOffset");
      v46 = v45;
      objc_msgSend(v12, "frame");
      if (v46 < CGRectGetHeight(v79) * 0.5)
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        -[IKViewElement children](self->_templateElement, "children");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        if (!v48)
        {
LABEL_44:

LABEL_63:
          v23 = 0;
          goto LABEL_22;
        }
        v49 = v48;
        v50 = *(_QWORD *)v70;
LABEL_38:
        v51 = 0;
        while (1)
        {
          if (*(_QWORD *)v70 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v51);
          if (objc_msgSend(v52, "tv_elementType") == 12)
            break;
          if (v49 == ++v51)
          {
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
            if (v49)
              goto LABEL_38;
            goto LABEL_44;
          }
        }
        v63 = v47;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v52, "children");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (!v55)
        {
LABEL_60:

          goto LABEL_63;
        }
        v56 = v55;
        v57 = *(_QWORD *)v66;
LABEL_54:
        v58 = 0;
        while (1)
        {
          if (*(_QWORD *)v66 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v58);
          if (objc_msgSend(v59, "tv_elementType") == 54)
            break;
          if (v56 == ++v58)
          {
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            if (v56)
              goto LABEL_54;
            goto LABEL_60;
          }
        }
        objc_msgSend(v59, "style");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "tv_margin");
        v62 = v61 + 144.0;

        if (v62 == 0.0)
          goto LABEL_63;
        v33 = (void *)MEMORY[0x24BDD16E0];
        MinY = v62;
LABEL_21:
        objc_msgSend(v33, "numberWithDouble:", MinY);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v34 = (void *)v64;
        v35 = (void *)v15;
LABEL_49:

        goto LABEL_50;
      }
    }
    if (!objc_msgSend(v8, "isDescendantOfView:", v64))
    {
LABEL_47:
      if (productBannerHeight <= a5 && !objc_msgSend(v8, "isDescendantOfView:", v15))
      {
        v23 = 0;
        goto LABEL_49;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", productBannerHeight);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  v23 = 0;
LABEL_50:

  return v23;
}

- (unint64_t)_lastFocusableCellIndex
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_viewControllers, "count") < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSArray reverseObjectEnumerator](self->_viewControllers, "reverseObjectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "tv_associatedIKViewElement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "tv_elementType") != 52 && objc_msgSend(v9, "tv_elementType") != 38)
        {
          v10 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:", v8);

          goto LABEL_14;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v10;
}

- (id)_relatedSectionHeaderView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (-[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();

    v5 = 0;
    if ((v7 & 1) != 0)
    {
      -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shelfViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v5, "collectionWrappingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_configureTopHeroImage:(id)a3
{
  id v5;
  BOOL v6;
  void *v7;
  UIImageView *v8;
  UIImageView *topHeroImageView;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *topHeroGradientView;
  UIImageView *v17;
  double v18;
  void *v19;
  UIView *v20;
  UIView *topHeroSeparatorView;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v5 = a3;
  if (!self->_topHeroImageElement)
  {
    v26 = v5;
    v6 = objc_msgSend(v5, "tv_elementType") == 16;
    v5 = v26;
    if (v6)
    {
      v6 = objc_msgSend(v26, "tv_imageType") == 3;
      v5 = v26;
      if (v6)
      {
        objc_storeStrong((id *)&self->_topHeroImageElement, a3);
        +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_viewFromElement:existingView:", v26, self->_topHeroImageView);
        v8 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        topHeroImageView = self->_topHeroImageView;
        self->_topHeroImageView = v8;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[UIImageView _loadImage](self->_topHeroImageView, "_loadImage");
        -[UIImageView setContentMode:](self->_topHeroImageView, "setContentMode:", 2);
        self->_topHeroImageVisible = 1;
        -[UIImageView sizeToFit](self->_topHeroImageView, "sizeToFit");
        v10 = (void *)MEMORY[0x24BDF6AC8];
        +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("content-gradient-uber"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!self->_topHeroGradientView)
        {
          v13 = objc_alloc(MEMORY[0x24BDF6AE8]);
          objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
          topHeroGradientView = self->_topHeroGradientView;
          self->_topHeroGradientView = v15;

          v17 = self->_topHeroGradientView;
          objc_msgSend(v12, "size");
          -[UIImageView setFrame:](v17, "setFrame:", 0.0, 0.0, 1.0, v18);
          -[_TVProductTemplateController view](self, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addSubview:", self->_topHeroGradientView);

        }
        if (!self->_topHeroSeparatorView)
        {
          v20 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
          topHeroSeparatorView = self->_topHeroSeparatorView;
          self->_topHeroSeparatorView = v20;

          v22 = self->_topHeroSeparatorView;
          objc_msgSend(MEMORY[0x24BDF6950], "systemMidGrayColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

        }
        -[_TVProductTemplateController navigationItem](self, "navigationItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setLargeTitleDisplayMode:", 2);

        self->_lightStatusBar = 1;
        -[_TVProductTemplateController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
        -[_TVProductTemplateController view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setNeedsLayout");

        -[_TVProductTemplateController _updateTopHeroImageVisibility:](self, "_updateTopHeroImageVisibility:", self->_collectionView);
        v5 = v26;
      }
    }
  }

}

- (void)_configureWithBgElement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  IKImageElement **p_bgImageElement;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        p_bgImageElement = &self->_bgImageElement;
        if (self->_bgImageElement
          || objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "tv_elementType") != 16
          || objc_msgSend(v9, "tv_imageType"))
        {
          p_bgImageElement = &self->_heroImageElement;
          if (self->_heroImageElement
            || objc_msgSend(v9, "tv_elementType") != 16
            || objc_msgSend(v9, "tv_imageType") != 3)
          {
            if (objc_msgSend(v9, "tv_elementType") != 3)
              goto LABEL_15;
            p_bgImageElement = &self->_bgAudioElement;
          }
        }
        objc_storeStrong((id *)p_bgImageElement, v9);
LABEL_15:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_configureWithBannerElement:(id)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_productBannerElement, a3);
  -[IKViewElement style](self->_productBannerElement, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tv_height");
  self->_productBannerHeight = v7;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = v5;
  objc_msgSend(v5, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    v28 = v8;
    v29 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "tv_elementType");
        if (v14 > 23)
        {
          if (v14 == 24)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v13, "children");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v31;
              while (2)
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v31 != v22)
                    objc_enumerationMutation(v17);
                  if (!self->_heroImageElement)
                  {
                    v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                    if (objc_msgSend(v24, "tv_elementType") == 16 && objc_msgSend(v24, "tv_imageType") == 3)
                    {
                      objc_storeStrong((id *)&self->_heroImageElement, v24);
                      goto LABEL_30;
                    }
                  }
                }
                v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                if (v21)
                  continue;
                break;
              }
LABEL_30:
              v8 = v28;
              v11 = v29;
            }
          }
          else
          {
            if (v14 != 54)
              continue;
            objc_msgSend(v13, "children");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "style");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "tv_position") == 2)
            {

              goto LABEL_32;
            }
            objc_msgSend(v17, "style");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "tv_position");

            v11 = v29;
            if (v26 == 3)
LABEL_32:
              objc_storeStrong((id *)&self->_titleElement, v17);
          }
LABEL_33:

          continue;
        }
        if (v14 != 16)
        {
          if (v14 != 19)
            continue;
          v15 = 1128;
LABEL_10:
          v16 = v13;
          v17 = *(Class *)((char *)&self->super.super.super.super.isa + v15);
          *(Class *)((char *)&self->super.super.super.super.isa + v15) = v16;
          goto LABEL_33;
        }
        v15 = 1032;
        if (!self->_heroImageElement && objc_msgSend(v13, "tv_imageType") == 3)
          goto LABEL_10;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v10);
  }

}

- (int64_t)_blurEffectStyle
{
  return 0x8000000000000000;
}

- (CGSize)_backgroundImageProxySize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  if (self->_bgImageElement)
  {
    -[IKImageElement tv_imageScaleToSize](self->_bgImageElement, "tv_imageScaleToSize");
  }
  else if (self->_topHeroImageElement)
  {
    -[_TVProductTemplateController _topHeroImageViewSize](self, "_topHeroImageViewSize");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_TVProductTemplateController;
    -[_TVBgImageLoadingViewController _backgroundImageProxySize](&v4, sel__backgroundImageProxySize);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_backgroundImageProxy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  _TVUberBlurImageDecorator *v18;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_graphicsQuality");

  if (v4 == 10)
  {
    v5 = 0;
  }
  else
  {
    -[IKViewElement attributes](self->_templateElement, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundBlurDisabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "BOOLValue");
    if (self->_bgImageElement)
    {
      -[IKViewElement appDocument](self->_templateElement, "appDocument");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_adjustedWindowSize");
      v10 = v9;
      v12 = v11;

      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setImageSize:", v10, v12);
      v14 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v13, self->_bgImageElement);
      -[IKImageElement tv_imageProxyWithLayout:](self->_bgImageElement, "tv_imageProxyWithLayout:", v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKImageElement style](self->_bgImageElement, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tv_imageTreatment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("uber"));

      if (v17)
      {
        v18 = objc_alloc_init(_TVUberBlurImageDecorator);
        -[_TVUberBlurImageDecorator setBlurType:](v18, "setBlurType:", self->_infoListElement == 0);
        -[_TVUberBlurImageDecorator setBlurStyle:](v18, "setBlurStyle:", +[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", self->_templateElement) != 2);
        objc_msgSend(v5, "setDecorator:", v18);

      }
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_heroImageElement != 0;
}

- (BOOL)_isBackdropNeeded
{
  return 1;
}

- (id)_spacingMetricsForViewControllers:(id)a3 contentSize:(CGSize *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  CGSize *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[IKViewElement appDocument](self->_templateElement, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_adjustedWindowSize");
  v9 = v8;

  v29 = 0;
  v30 = (CGSize *)&v29;
  v31 = 0x3010000000;
  v32 = &unk_222E82B8D;
  v33 = v9;
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78___TVProductTemplateController__spacingMetricsForViewControllers_contentSize___block_invoke;
  v25[3] = &unk_24EB86608;
  v28 = v9;
  v27 = &v29;
  v11 = v10;
  v26 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v12 = 0;
  }
  else
  {
    +[TVMLUtilities rowSpacingMetricsForRowMetrics:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v17)
        {
          objc_msgSend(v17, "tv_rowMetricsValue");
          v18 = *((double *)&v20 + 1);
        }
        else
        {
          v18 = 0.0;
          v20 = 0u;
        }
        v30[2].height = v18 + v30[2].height;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    }
    while (v14);
  }

  if (a4)
    *a4 = v30[2];

  _Block_object_dispose(&v29, 8);
  return v13;
}

- (UIEdgeInsets)_cellMarginForIndex:(int64_t)a3 partialMargins:(UIEdgeInsets *)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UIEdgeInsets result;

  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_associatedIKViewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_margin");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = *(double *)(MEMORY[0x24BDF7718] + 16);
  if (a3)
  {
    v11 = *MEMORY[0x24BDF7718];
    if (-[NSArray count](self->_viewControllers, "count") - 1 == a3)
      v18 = v15;
  }
  else if (-[_TVProductTemplateController _shouldUsePartialScrollingTemplate](self, "_shouldUsePartialScrollingTemplate"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "headerElement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v11 = 0.0;
        if (a4)
        {
          a4->left = v13;
          a4->bottom = v18;
          a4->right = v17;
          a4->top = 0.0;
        }
      }
    }
  }
  if (-[NSArray count](self->_viewControllers, "count") - 1 > a3)
  {
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", a3 + 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tv_associatedIKViewElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tv_margin");
    v24 = v23;

    if (v15 > 0.0 || v24 > 0.0)
    {
      v18 = fmax(v15, v24);
    }
    else
    {
      -[NSArray objectAtIndex:](self->_rowSpacingMetricsList, "objectAtIndex:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "tv_rowMetricsValue");
        v18 = v31;
      }
      else
      {
        v18 = 0.0;
      }

    }
  }

  v27 = v11;
  v28 = v13;
  v29 = v18;
  v30 = v17;
  result.right = v30;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

- (BOOL)_shouldUsePartialScrollingTemplate
{
  return self->_isPartialScrollingTemplate || self->_titleElement == 0;
}

- (BOOL)_shouldShowTopHeroImage
{
  void *v3;
  BOOL v4;

  -[_TVProductTemplateController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass") != 1 || self->_sportsProductTemplate;

  return v4;
}

- (BOOL)_sportsLandscapePhone
{
  void *v2;
  BOOL v3;

  if (!self->_sportsProductTemplate
    || (unint64_t)(objc_msgSend((id)*MEMORY[0x24BDF74F8], "interfaceOrientation") - 3) > 1)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (BOOL)_sportsLandscapePhoneIsOverlaySection:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[_TVProductTemplateController _sportsLandscapePhone](self, "_sportsLandscapePhone"))
    v5 = objc_msgSend(v4, "section") == 0;
  else
    v5 = 0;

  return v5;
}

- (void)_configureBackgroundTintView
{
  id v3;
  UIView *v4;
  UIView *backdropTintView;
  UIView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  if (-[NSArray count](self->_viewControllers, "count"))
  {
    if (self->_backdropTintViewController)
    {
      if (self->_backdropTintView)
      {
        -[_TVProductTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
      }
      else
      {
        v3 = objc_alloc(MEMORY[0x24BDF6F90]);
        v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        backdropTintView = self->_backdropTintView;
        self->_backdropTintView = v4;

        -[UIView setAutoresizingMask:](self->_backdropTintView, "setAutoresizingMask:", 50);
        -[UIView setUserInteractionEnabled:](self->_backdropTintView, "setUserInteractionEnabled:", 0);
        -[UICollectionView insertSubview:atIndex:](self->_collectionView, "insertSubview:atIndex:", self->_backdropTintView, 0);
      }
      v6 = self->_backdropTintView;
      -[IKViewElement style](self->_backdropTintElement, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tv_backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "color");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v9 = (uint64_t)v10;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (id)v9;
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    }
    else
    {
      -[_TVProductTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
    }
  }
}

- (void)_updateBackgroundTintView
{
  NSUInteger v3;
  UIViewController *backdropTintViewController;
  UIView *backdropTintView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;

  if (self->_backdropTintViewController)
  {
    v3 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIView removeFromSuperview](self->_backdropTintView, "removeFromSuperview");
      backdropTintViewController = self->_backdropTintViewController;
      self->_backdropTintViewController = 0;

      backdropTintView = self->_backdropTintView;
      self->_backdropTintView = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v3, 1);
      v14 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView frame](self->_collectionView, "frame");
      v7 = v6;
      v9 = v8;
      -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_collectionView, "layoutAttributesForItemAtIndexPath:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      -[_TVProductTemplateController _maxContentSize](self, "_maxContentSize");
      -[UIView setFrame:](self->_backdropTintView, "setFrame:", v7, v12, v9, fmax(v13 - v12, 0.0));
      -[UICollectionView sendSubviewToBack:](self->_collectionView, "sendSubviewToBack:", self->_backdropTintView);
      -[_TVProductTemplateController _updateBackgroundTintViewEffects](self, "_updateBackgroundTintViewEffects");

      backdropTintView = v14;
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_backdropTintView, "removeFromSuperview");
    backdropTintView = self->_backdropTintView;
    self->_backdropTintView = 0;
  }

}

- (void)_updateBackgroundTintViewEffects
{
  UIView *backdropTintView;
  double v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  double v21;

  backdropTintView = self->_backdropTintView;
  if (backdropTintView)
  {
    -[UIView frame](backdropTintView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[_TVProductTemplateController _maxContentSize](self, "_maxContentSize");
    v11 = v10;
    -[UIView frame](self->_backdropTintView, "frame");
    v13 = fmax(v11 - v12, 0.0);
    if (v13 > 0.0)
    {
      -[UICollectionView contentSize](self->_collectionView, "contentSize");
      v15 = v14;
      -[UICollectionView bounds](self->_collectionView, "bounds");
      v17 = v15 - v16;
      -[UICollectionView contentInset](self->_collectionView, "contentInset");
      v19 = v17 - v18;
      -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
      if (v20 > v19)
      {
        -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
        v13 = v13 + v21 - v19;
      }
    }
    -[UIView setFrame:](self->_backdropTintView, "setFrame:", v5, v7, v9, v13);
  }
}

- (CGSize)_maxContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[UICollectionView contentSize](self->_collectionView, "contentSize");
  v4 = v3;
  -[_TVProductTemplateController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 < v7)
    v4 = v7;
  -[UICollectionView contentSize](self->_collectionView, "contentSize");
  v9 = v8;
  -[_TVProductTemplateController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  if (v9 >= v12)
    v13 = v9;
  else
    v13 = v12;
  v14 = v4;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerCell, 0);
  objc_storeStrong((id *)&self->_topHeroImageElement, 0);
  objc_storeStrong((id *)&self->_topHeroGradientView, 0);
  objc_storeStrong((id *)&self->_topHeroSeparatorView, 0);
  objc_storeStrong((id *)&self->_topHeroImageView, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_autoHighlightIndexPath, 0);
  objc_storeStrong((id *)&self->_rowSpacingMetricsList, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleElement, 0);
  objc_storeStrong((id *)&self->_infoListElement, 0);
  objc_storeStrong((id *)&self->_productBannerElement, 0);
  objc_storeStrong((id *)&self->_bgAudioElement, 0);
  objc_storeStrong((id *)&self->_tvVignetteView, 0);
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_backdropTintViewController, 0);
  objc_storeStrong((id *)&self->_backdropTintView, 0);
  objc_storeStrong((id *)&self->_backdropTintElement, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_bgBlurSublayer, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_bgImage, 0);
  objc_storeStrong((id *)&self->_heroImageElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end
