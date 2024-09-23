@implementation PhotoCreditViewController

+ (BOOL)useCollectionView
{
  return 1;
}

- (PhotoCreditViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  PhotoCreditViewController *v5;
  PhotoCreditDataSource *v6;
  PreferenceValuesDataSource *dataSource;
  PhotoCreditDataSource *v8;
  void *v9;
  void *v10;
  id v11;
  id completionHandler;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PhotoCreditViewController;
  v5 = -[PhotoCreditViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_alloc_init(PhotoCreditDataSource);
    -[PreferenceValuesDataSource setDelegate:](v6, "setDelegate:", v5);
    -[PhotoCreditDataSource setPhotoCreditChangesDelegate:](v6, "setPhotoCreditChangesDelegate:", v5);
    -[PhotoCreditDataSource setPrivacyDelegate:](v6, "setPrivacyDelegate:", v5);
    dataSource = v5->super._dataSource;
    v5->super._dataSource = &v6->super;
    v8 = v6;

    -[PhotoCreditDataSource loadPreferences](v8, "loadPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v9, "setPresentedModally:", 1);

    -[PhotoCreditViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v10, "setTakesAvailableHeight:", 1);

    v11 = objc_msgSend(v4, "copy");
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = v11;

  }
  return v5;
}

- (PhotoCreditDataSource)photoCreditDataSource
{
  return (PhotoCreditDataSource *)self->super._dataSource;
}

- (void)loadView
{
  MacPhotoCreditView *v3;

  v3 = -[MacPhotoCreditView initWithFrame:]([MacPhotoCreditView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PhotoCreditViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ModalCardHeaderView *v7;
  void *v8;
  ModalCardHeaderView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  ModalCardHeaderView *v65;
  void *v66;
  objc_super v67;
  _QWORD v68[2];
  _QWORD v69[8];

  v67.receiver = self;
  v67.super_class = (Class)PhotoCreditViewController;
  -[PreferencesValuesContaineeViewController viewDidLoad](&v67, "viewDidLoad");
  -[PhotoCreditViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("PhotoCreditConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v7 = [ModalCardHeaderView alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v9 = -[ModalCardHeaderView initWithConfiguration:](v7, "initWithConfiguration:", v8);

  -[ModalCardHeaderView setUseAdaptiveFont:](v9, "setUseAdaptiveFont:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  -[ModalCardHeaderView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomHairline](v9, "bottomHairline"));
  objc_msgSend(v11, "setHidden:", 1);

  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Photo Credit] Photo Credit"), CFSTR("localized string not found"), 0));
  -[ModalCardHeaderView setTitle:](v9, "setTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v9, "leadingButton"));
  v15 = sub_1009A98D8();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v14, "setTitle:forState:", v16, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v9, "leadingButton"));
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "cancelAction:", 64);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v9, "trailingButton"));
  v19 = sub_1009A992C();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v9, "trailingButton"));
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "submitAction:", 64);

  objc_msgSend(v5, "addSubview:", v9);
  objc_storeStrong((id *)&self->_modalHeaderView, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v22, "setEnabled:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v24, "setBackgroundColor:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v26, "setAccessibilityIdentifier:", CFSTR("PhotoCreditCollectionView"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  +[PhotoCreditDataSource registerCellsInCollectionView:](PhotoCreditDataSource, "registerCellsInCollectionView:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "addSubview:", v28);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v9, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
  v69[0] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v9, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v69[1] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v9, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v69[2] = v56;
  v65 = v9;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v9, "bottomAnchor"));
  v66 = v5;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v69[3] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v69[4] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v69[5] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  v69[6] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  v69[7] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  if (sub_1002A8AA0(self) == 5)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:", 400.0));
    v68[0] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", 250.0));
    v68[1] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v42, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v43, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

  v7.receiver = self;
  v7.super_class = (Class)PhotoCreditViewController;
  -[ContaineeViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)setupSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PhotoCreditViewController;
  -[PreferencesValuesContaineeViewController setupSubviews](&v2, "setupSubviews");
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2;
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return sub_1002A8AA0(self) != 5;
}

- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  v3 = 0.0;
  v4 = 16.0;
  v5 = 10.0;
  v6 = 16.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (id)collectionViewLayoutBoundarySupplementaryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditViewController photoCreditDataSource](self, "photoCreditDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "footerHeightForCollectionView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v3, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v7, UICollectionElementKindSectionFooter, 5));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

- (void)cancelAction:(id)a3
{
  id v4;

  v4 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 18, 77, 0);
  -[PhotoCreditViewController closeAction:](self, "closeAction:", v4);

}

- (void)closeAction:(id)a3
{
  id v4;

  v4 = a3;
  if (sub_1002A8AA0(self) == 5)
    -[PhotoCreditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", v4);

}

- (void)submitAction:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditViewController photoCreditDataSource](self, "photoCreditDataSource"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100358364;
  v6[3] = &unk_1011B29A8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "updatePhotoCreditPreferencesWithCompletion:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_presentAlertForError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, a3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OK [Photo Credit alert acceptance button]"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 0, 0));

  objc_msgSend(v7, "addAction:", v6);
  -[PhotoCreditViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);

}

- (void)didTapOnPrivacyText
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.ratingsAndPhotos")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
  objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v16, v7, v9, v11, v13);
  v18 = v17;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v19, "setContentInset:", 0.0, 0.0, v18, 0.0);

}

- (void)keyboardWillHide:(id)a3
{
  double left;
  double bottom;
  double right;
  void *v7;
  id v8;

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v7, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  double v10;

  if (a3 > 5)
  {
    v4 = -1.0;
  }
  else
  {
    if (((1 << a3) & 0x27) != 0)
      return 350.0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "availableHeight");
    v4 = v6;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v8 = objc_msgSend(v7, "containerStyle");

  if (v8 == (id)6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v9, "availableHeight");
    v4 = v10;

  }
  return v4;
}

- (void)updateAppearanceForPhotoCredit:(BOOL)a3 photoCreditNameExists:(BOOL)a4
{
  uint64_t v4;
  id v5;

  v4 = !a3 | a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)photoCreditNameHasBeenFlaggedWithErrorMessage:(id)a3
{
  id v4;

  -[PhotoCreditViewController _presentAlertForError:](self, "_presentAlertForError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v4, "setEnabled:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
}

@end
