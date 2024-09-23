@implementation BKEndOfBookCardViewController

- (BKEndOfBookCardViewController)initWithStoreID:(id)a3 resource:(id)a4
{
  id v6;
  id v7;
  BKEndOfBookCardViewController *v8;
  BKEndOfBookCardViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKEndOfBookCardViewController;
  v8 = -[BKEndOfBookCardViewController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[BKEndOfBookCardViewController setStoreID:](v8, "setStoreID:", v6);
    -[BKEndOfBookCardViewController setResource:](v9, "setResource:", v7);
    -[BKEndOfBookCardViewController setDefinesPresentationContext:](v9, "setDefinesPresentationContext:", 1);
    -[BKEndOfBookCardViewController setPreferredContentSize:](v9, "setPreferredContentSize:", 540.0, 746.0);
    -[BKEndOfBookCardViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
  }

  return v9;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  BSUIFeedNavigationController *cardNavigationController;
  id v21;
  UIView *v22;
  void *v23;
  void *v24;
  UIView *closeButton;
  objc_super v26;
  id v27;

  v26.receiver = self;
  v26.super_class = (Class)BKEndOfBookCardViewController;
  -[BKEndOfBookCardViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = objc_alloc((Class)BSUIFeedViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController options](self, "options"));
  v5 = objc_msgSend(v3, "initWithOptions:", v4);

  v6 = objc_msgSend(objc_alloc((Class)BSUIFeedNavigationController), "initWithOptions:", 0);
  v27 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  objc_msgSend(v6, "setViewControllers:", v7);

  -[BKEndOfBookCardViewController addChildViewController:](self, "addChildViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v18, "addSubview:", v19);

  objc_msgSend(v6, "didMoveToParentViewController:", self);
  objc_msgSend(v6, "setDelegate:", self);
  cardNavigationController = self->_cardNavigationController;
  self->_cardNavigationController = (BSUIFeedNavigationController *)v6;
  v21 = v6;

  v22 = (UIView *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController view](self, "view"));
  objc_msgSend(v23, "addSubview:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController view](self, "view"));
  -[BKEndOfBookCardViewController _anchorCloseButton:toView:](self, "_anchorCloseButton:toView:", v22, v24);

  -[UIView addTarget:action:forControlEvents:](v22, "addTarget:action:forControlEvents:", self, "_closeButtonTapped:", 64);
  -[UIView _accessibilitySetSortPriority:](v22, "_accessibilitySetSortPriority:", 999);
  closeButton = self->_closeButton;
  self->_closeButton = v22;

}

- (id)_optionsForUIScene:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[3];
  _QWORD v28[3];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](self, "upSellData"));

  v6 = BCMutableCloudSyncVersions_ptr;
  if (v5)
  {
    v24 = v3;
    v27[0] = BAUpSellLocationKey;
    v7 = BCMutableCloudSyncVersions_ptr;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](self, "upSellData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "location")));
    v28[0] = v9;
    v27[1] = BAUpSellVariantKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](self, "upSellData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "variant")));
    v28[1] = v11;
    v27[2] = BAUpSellVariantVersionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](self, "upSellData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "variantVersion"));
    if (v13)
    {
      v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](self, "upSellData"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "variantVersion"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    }
    v28[2] = v14;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    if (v13)
    {

      v14 = v7;
    }

    v6 = BCMutableCloudSyncVersions_ptr;
    v3 = v24;
  }
  v25[0] = BSUIFeedOptionsKeyContextMenuProvider;
  if (v3)
    v15 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[BKContextMenuProvider sharedProvider](BKContextMenuProvider, "sharedProvider"));
  v16 = (void *)v15;
  v26[0] = v15;
  v26[1] = &__kCFBooleanTrue;
  v25[1] = CFSTR("end-of-book-card");
  v25[2] = CFSTR("storeId");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController storeID](self, "storeID"));
  v26[2] = v17;
  v25[3] = CFSTR("resource");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController resource](self, "resource"));
  v19 = v18;
  if (!v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26[3] = v19;
  v25[4] = CFSTR("upSellData");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController serializeUpSellData](self, "serializeUpSellData"));
  v26[4] = v20;
  v25[5] = CFSTR("rawUpSellData");
  v21 = v5;
  if (!v5)
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[312], "dictionaryWithObjects:forKeys:count:", v26, v25, 6));
  if (!v5)

  if (!v18)
  return v22;
}

- (id)options
{
  return -[BKEndOfBookCardViewController _optionsForUIScene:](self, "_optionsForUIScene:", 0);
}

- (NSDictionary)optionsForUIScene
{
  return (NSDictionary *)-[BKEndOfBookCardViewController _optionsForUIScene:](self, "_optionsForUIScene:", 1);
}

- (id)serializeUpSellData
{
  BKEndOfBookCardViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BKEndOfBookCardViewController *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v2 = self;
  v12[0] = BAUpSellLocationKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](self, "upSellData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAUtilities stringFromUpSellLocation:](BAUtilities, "stringFromUpSellLocation:", objc_msgSend(v3, "location")));
  v13[0] = v4;
  v12[1] = BAUpSellVariantKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](v2, "upSellData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BAUtilities stringFromUpSellVariant:](BAUtilities, "stringFromUpSellVariant:", objc_msgSend(v5, "variant")));
  v13[1] = v6;
  v12[2] = BAUpSellVariantVersionKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](v2, "upSellData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "variantVersion"));
  if (v8)
  {
    v2 = (BKEndOfBookCardViewController *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController upSellData](v2, "upSellData"));
    v9 = (BKEndOfBookCardViewController *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController variantVersion](v2, "variantVersion"));
  }
  else
  {
    v9 = (BKEndOfBookCardViewController *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
  if (v8)
  {

    v9 = v2;
  }

  return v10;
}

- (void)viewWillLayoutSubviews
{
  if ((-[BKEndOfBookCardViewController isBeingPresented](self, "isBeingPresented") & 1) == 0
    && (-[BKEndOfBookCardViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[BKEndOfBookCardViewController updateCardSize](self, "updateCardSize");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v4;

  if (!isPad(self, a2))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)BKEndOfBookCardViewController;
  return -[BKEndOfBookCardViewController supportedInterfaceOrientations](&v4, "supportedInterfaceOrientations");
}

- (BSUIFeedNavigationController)cardNavigationController
{
  -[BKEndOfBookCardViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_cardNavigationController;
}

- (CGSize)cardSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateCardSize
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double CenterNoRounding;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  void *v19;
  __n128 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController view](self, "view"));
  v4 = objc_msgSend(v3, "bounds");
  CenterNoRounding = CGRectGetCenterNoRounding(v4, v5, v6, v7, v8);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "setCenter:", CenterNoRounding, v11);

  v32 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController view](self, "view"));
  objc_msgSend(v19, "bounds");
  v20.n128_u64[0] = v16;
  v23 = CGRectMakeWithOriginSize(v20, v18, v21, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
  objc_msgSend(v31, "setBounds:", v23, v25, v27, v29);

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
  v9.super_class = (Class)BKEndOfBookCardViewController;
  v7 = a4;
  -[BKEndOfBookCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100102264;
  v8[3] = &unk_1008E8308;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)closeCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController delegate](self, "delegate"));
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "endOfBookCardViewControllerDidFinish:", self);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentFeedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v5, "cardStackViewController:parentCardWillDismissWithReason:targetViewController:", 0, 1, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_anchorCloseButton:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 16.0));
  v14[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -16.0));
  v14[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (BCSheetTransitioningCardContent)transitioningCardContent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCSheetTransitioningCardContent));

  }
  else
  {
    v7 = 0;
  }
  return (BCSheetTransitioningCardContent *)v7;
}

- (BOOL)bc_alwaysUseCoverTransitionForCardPresenting
{
  return 1;
}

- (BOOL)bc_canCloseAsset
{
  return 1;
}

- (void)bc_closeToAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController delegate](self, "delegate"));
  objc_msgSend(v8, "endOfBookCardViewControllerWantsToCloseToAsset:cardStackViewController:completion:", self, v7, v6);

}

- (void)bc_closeAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController delegate](self, "delegate"));
  objc_msgSend(v8, "endOfBookCardViewControllerWantsToCloseAsset:cardStackViewController:completion:", self, v7, v6);

}

- (BSUIFeedViewController)currentFeedViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentFeedViewController"));

  return (BSUIFeedViewController *)v3;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController cardNavigationController](self, "cardNavigationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllers"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitionCoordinator"));
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100102738;
    v15[3] = &unk_1008EAE20;
    v15[4] = self;
    v16 = v11 != v7;
    objc_msgSend(v12, "animateAlongsideTransition:completion:", v15, 0);
  }
  else
  {
    if (v11 == v7)
      v13 = 1.0;
    else
      v13 = 0.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardViewController closeButton](self, "closeButton"));
    objc_msgSend(v14, "setAlpha:", v13);

  }
}

- (BAUpSellData)upSellData
{
  return self->_upSellData;
}

- (void)setUpSellData:(id)a3
{
  objc_storeStrong((id *)&self->_upSellData, a3);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BKEndOfBookCardViewControllerDelegate)delegate
{
  return (BKEndOfBookCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)closeButton
{
  return self->_closeButton;
}

- (NSDictionary)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);
  objc_storeStrong((id *)&self->_cardNavigationController, 0);
}

@end
