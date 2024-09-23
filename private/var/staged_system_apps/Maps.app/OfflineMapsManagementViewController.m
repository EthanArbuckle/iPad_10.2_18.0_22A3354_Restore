@implementation OfflineMapsManagementViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsManagementViewController;
  -[ContaineeViewController viewDidLoad](&v4, "viewDidLoad");
  -[OfflineMapsManagementViewController _setupViews](self, "_setupViews");
  -[OfflineMapsManagementViewController _setupConstraints](self, "_setupConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("OfflineMapsUserHasOpenedOfflineManagementScreenKey"));

}

- (void)viewWillAppear:(BOOL)a3
{
  OfflineMapsManagementDataSource *v4;
  void *v5;
  OfflineMapsManagementDataSource *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OfflineMapsManagementViewController;
  -[ContaineeViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = [OfflineMapsManagementDataSource alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  v6 = -[OfflineMapsManagementDataSource initWithCollectionView:updateLocation:](v4, "initWithCollectionView:updateLocation:", v5, 0);
  -[OfflineMapsManagementViewController setOfflineMapsDataSource:](self, "setOfflineMapsDataSource:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v8, "setOfflineDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v9, "setActive:", 1);

  -[OfflineMapsManagementViewController _updateHairlineAlpha:](self, "_updateHairlineAlpha:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v4, "setActive:", 0);

}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ContainerHeaderView *v9;
  double y;
  double width;
  double height;
  ContainerHeaderView *v13;
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
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void **v35;
  uint64_t v36;
  id (*v37)(uint64_t, uint64_t, void *);
  void *v38;
  id v39;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setAllowsSwipeToDismiss:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController view](self, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController view](self, "view"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("OfflineMapsView"));

  v9 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[ContainerHeaderView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[OfflineMapsManagementViewController setTitleHeaderView:](self, "setTitleHeaderView:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v15, "setDelegate:", self);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v16, "setHeaderSize:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v17, "setHairLineAlpha:", 0.0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v19, "setBackgroundColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Offline Maps"), CFSTR("localized string not found"), CFSTR("Offline")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v22, "setTitle:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v23, "addSubview:", v24);

  objc_initWeak(&location, self);
  v25 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v35 = _NSConcreteStackBlock;
  v36 = 3221225472;
  v37 = sub_100B38760;
  v38 = &unk_1011B5F50;
  objc_copyWeak(&v39, &location);
  v26 = objc_msgSend(v25, "initWithSectionProvider:", &v35);
  v27 = objc_alloc((Class)UICollectionView);
  v28 = objc_msgSend(v27, "initWithFrame:collectionViewLayout:", v26, CGRectZero.origin.x, y, width, height, v35, v36, v37, v38);
  -[OfflineMapsManagementViewController setCollectionView:](self, "setCollectionView:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  objc_msgSend(v31, "setBackgroundColor:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  objc_msgSend(v32, "setAccessibilityIdentifier:", CFSTR("OfflineMapsCollectionView"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  objc_msgSend(v33, "addSubview:", v34);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
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

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v44[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v44[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v44[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController titleHeaderView](self, "titleHeaderView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v44[3] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v44[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v44[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v44[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v44[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)handleDismissAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "closeOfflineMapsManagement");

}

- (void)willDismissByGesture
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v2, "closeOfflineMapsManagement");

}

- (void)_updateHairlineAlpha:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView", a3));
  v5 = objc_msgSend(v4, "_maps_shouldShowTopHairline");

  v6 = 0.0;
  if (v5)
    v6 = 1.0;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B39098;
  v8[3] = &unk_1011B22D8;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B390AC;
  v7[3] = &unk_1011B2300;
  +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", 1, v8, v7, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsManagementViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[OfflineMapsManagementViewController _updateHairlineAlpha:](self, "_updateHairlineAlpha:", 1);
}

- (void)dataSourceUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView", a3));
  if (objc_msgSend(v4, "numberOfSections") != (id)1)
  {

    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionForSectionIndex:", 0));
  v7 = objc_msgSend(v6, "sectionType");

  if (v7)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
    v10 = v8;
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController collectionView](self, "collectionView"));
  v10 = v8;
  v9 = 2;
LABEL_6:
  objc_msgSend(v8, "setContentInsetAdjustmentBehavior:", v9);

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  id v14;

  v14 = a4;
  v5 = objc_opt_class(MapDataSubscriptionInfo);
  if ((objc_opt_isKindOfClass(v14, v5) & 1) != 0)
  {
    v6 = v14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
    objc_msgSend(v7, "presentOfflineMapDetailsForSubscriptionInfo:", v6);

  }
  v8 = objc_opt_class(OfflineMapsManagementCellModel);
  if ((objc_opt_isKindOfClass(v14, v8) & 1) != 0)
  {
    v9 = v14;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableRow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionAction"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableRow"));
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionAction"));
      v13[2]();

    }
  }

}

- (void)didSelectDownloadNewMap
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v2, "presentAddNewMapSearchAutocomplete");

}

- (void)didSelectSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "regionName"));

  objc_msgSend(v7, "presentOfflineMapRegionSelectorForRegion:name:", v5, v6);
}

- (void)didSelectRenameSubscriptionInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v8, "presentRenameOfflineMapForSubscriptionInfo:completionHandler:", v7, v6);

}

- (void)didSelectResumeSubscriptionInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v5, "resumeDownloadingForSubscriptionInfo:", v4);

}

- (void)didSelectUpdateAll
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v2, "startUpdatingOfflineSubscriptions");

}

- (void)didSelectExpiredMaps
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v2, "presentExpiredMapsManagement");

}

- (void)didSetSyncToWatch:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v7, "setSyncToWatch:completionHandler:", v4, v6);

}

- (void)showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementViewController delegate](self, "delegate"));
  objc_msgSend(v4, "showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:", a3);

}

- (OfflineMapsManagementActionCoordination)delegate
{
  return (OfflineMapsManagementActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (OfflineMapsManagementDataSource)offlineMapsDataSource
{
  return self->_offlineMapsDataSource;
}

- (void)setOfflineMapsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_offlineMapsDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineMapsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
