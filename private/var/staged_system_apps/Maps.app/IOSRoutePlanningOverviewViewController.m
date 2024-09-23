@implementation IOSRoutePlanningOverviewViewController

- (IOSRoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3
{
  IOSRoutePlanningOverviewViewController *v3;
  void *v4;
  NSString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IOSRoutePlanningOverviewViewController;
  v3 = -[RoutePlanningOverviewViewController initWithDataCoordinator:](&v8, "initWithDataCoordinator:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v5 = NSStringFromSelector("currentInterruptionKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, v6, 1, &unk_1014D26D0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  NSString *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = NSStringFromSelector("currentInterruptionKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v5, &unk_1014D26D0);

  v6.receiver = self;
  v6.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController dealloc](&v6, "dealloc");
}

- (int64_t)observedRoutePlanningData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSRoutePlanningOverviewViewController;
  return (unint64_t)-[RoutePlanningOverviewViewController observedRoutePlanningData](&v3, "observedRoutePlanningData") | 0x33180;
}

- (void)didResignCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[ContaineeViewController didResignCurrent](&v3, "didResignCurrent");
  self->super._restoreRoutePlanningAfterRouteCreation = 0;
  -[IOSRoutePlanningOverviewViewController setPedestrianARFeatureIntroTeachableMomentTimer:](self, "setPedestrianARFeatureIntroTeachableMomentTimer:", 0);
}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RouteOverviewFieldsView *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController _setupSubviews](&v24, "_setupSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setSelectionFollowsFocus:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_initWeak(&location, self);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1004CF6EC;
  v21 = &unk_1011AD260;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v4, "setLayoutHandler:", &v18);
  -[IOSRoutePlanningOverviewViewController _refreshContentInset](self, "_refreshContentInset", v18, v19, v20, v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    objc_msgSend(v6, "addSubview:", v7);

  }
  v8 = -[RouteOverviewFieldsView initWithDelegate:waypointInfoProvider:]([RouteOverviewFieldsView alloc], "initWithDelegate:waypointInfoProvider:", self, self);
  -[IOSRoutePlanningOverviewViewController setFieldsView:](self, "setFieldsView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Route Planning] Directions Title"), CFSTR("localized string not found"), 0));
  objc_msgSend(v10, "setText:", v12);

  LODWORD(v13) = 1148846080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v10, &stru_1011E79D8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v14, "setTitleView:", v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v15, "setTitleViewInsets:", 16.0, 16.0, 12.0, 16.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v16, "setAccessoryView:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v17, "setAccessoryViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  -[IOSRoutePlanningOverviewViewController _updateFieldsViewSuperviewIfNeeded](self, "_updateFieldsViewSuperviewIfNeeded");
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v57;
  objc_super v58;
  _QWORD v59[4];
  _QWORD v60[3];

  v58.receiver = self;
  v58.super_class = (Class)IOSRoutePlanningOverviewViewController;
  v3 = -[RoutePlanningOverviewViewController _initialConstraints](&v58, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonViewForVisualAlignment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  LODWORD(v10) = 1148829696;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:priority:", v9, 12.0, v10));
  objc_msgSend(v4, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleViewLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:constant:", v16, 8.0));
  v57 = v4;
  objc_msgSend(v4, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "titleViewLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", v22, 12.0));
  objc_msgSend(v4, "addObject:", v23);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v24));
  v60[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  v60[1] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionViewToBottomConstraint](self, "collectionViewToBottomConstraint"));
  v60[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 3));
  objc_msgSend(v57, "addObjectsFromArray:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
  if (v33)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", 38.0));
    v59[0] = v52;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v59[1] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 16.0));
    v59[2] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, 16.0));
    v59[3] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 4));
    objc_msgSend(v57, "addObjectsFromArray:", v43);

  }
  return v57;
}

- (void)_updateFieldsViewSuperviewIfNeeded
{
  void *v3;
  unint64_t v4;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  id v33;
  void *v34;
  void *v35;
  double v36;
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
  _QWORD v55[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = (unint64_t)objc_msgSend(v3, "containerStyle");
  if (v4 > 7 || ((1 << v4) & 0xA3) == 0)
  {
    v7 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    v7 = objc_msgSend(v6, "hasExpandedWaypoints");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  v11 = v10;
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerView"));

    if (v11 != v12)
    {
      -[IOSRoutePlanningOverviewViewController _createStyleSpecificConstraintsIfNeeded](self, "_createStyleSpecificConstraintsIfNeeded");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController collectionViewTopToFieldsViewConstraint](self, "collectionViewTopToFieldsViewConstraint"));
      objc_msgSend(v13, "setActive:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
      objc_msgSend(v9, "setHeaderView:", v14);

      -[RoutePlanningOverviewViewController _setupAdvisoryFooterView](self, "_setupAdvisoryFooterView");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController collectionViewTopToContentViewConstraint](self, "collectionViewTopToContentViewConstraint"));
      objc_msgSend(v15, "setActive:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      objc_msgSend(v16, "contentInset");
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      objc_msgSend(v23, "setContentInset:", 0.0, v18, v20, v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController view](self, "view"));
      objc_msgSend(v24, "setNeedsLayout");

    }
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));

    if (v25 != v26)
    {
      -[IOSRoutePlanningOverviewViewController _createStyleSpecificConstraintsIfNeeded](self, "_createStyleSpecificConstraintsIfNeeded");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController collectionViewTopToContentViewConstraint](self, "collectionViewTopToContentViewConstraint"));
      objc_msgSend(v27, "setActive:", 0);

      objc_msgSend(v9, "setHeaderView:", 0);
      -[RoutePlanningOverviewViewController _setupAdvisoryFooterView](self, "_setupAdvisoryFooterView");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
      objc_msgSend(v28, "addSubview:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
      v32 = v31;
      v54 = v9;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));

      }
      v50 = v33;

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
      if (v35)
        v36 = 10.0;
      else
        v36 = 0.0;

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v33, v36));
      v55[0] = v51;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v38));
      v55[1] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
      v55[2] = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController collectionViewTopToFieldsViewConstraint](self, "collectionViewTopToFieldsViewConstraint"));
      objc_msgSend(v46, "setActive:", 1);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController view](self, "view"));
      objc_msgSend(v47, "setNeedsLayout");

      v9 = v54;
    }
  }

}

- (void)_createStyleSpecificConstraintsIfNeeded
{
  uint64_t v3;
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController collectionViewTopToFieldsViewConstraint](self, "collectionViewTopToFieldsViewConstraint"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController collectionViewTopToContentViewConstraint](self, "collectionViewTopToContentViewConstraint")), v5, v4, !v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 12.0));
    -[IOSRoutePlanningOverviewViewController setCollectionViewTopToFieldsViewConstraint:](self, "setCollectionViewTopToFieldsViewConstraint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = v12;
    if (v12)
    {
      v20 = v12;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    if (v15)
      v16 = 10.0;
    else
      v16 = 0.0;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, v16));
    -[IOSRoutePlanningOverviewViewController setCollectionViewTopToContentViewConstraint:](self, "setCollectionViewTopToContentViewConstraint:", v19);

  }
}

- (double)_cardHeightMinusTableViewHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController _cardHeightMinusTableViewHeight](&v9, "_cardHeightMinusTableViewHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v6, "bounds");
  v7 = v4 + CGRectGetHeight(v10);

  return v7;
}

- (CGRect)_loadingAndErrorViewFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
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
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double Height;
  double v33;
  id *p_errorModeView;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));
  objc_msgSend(v10, "convertRect:fromView:", v21, v13, v15, v17, v19);
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v28, "estimatedHeight");
  v30 = v29;

  v43.origin.x = v23;
  v43.origin.y = v25;
  v43.size.width = v27;
  v43.size.height = v30;
  v31 = CGRectGetMaxY(v43) + 8.0;
  v44.origin.x = v5;
  v44.origin.y = v31;
  v44.size.width = v7;
  v44.size.height = v9;
  Height = CGRectGetHeight(v44);
  v45.origin.x = v5;
  v45.origin.y = v31;
  v45.size.width = v7;
  v45.size.height = v9;
  v33 = Height - CGRectGetMinY(v45);
  p_errorModeView = (id *)&self->super._errorModeView;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView superview](self->super._errorModeView, "superview"));

  if (v35
    || (p_errorModeView = (id *)&self->super._loadingModeView,
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView superview](self->super._loadingModeView, "superview")),
        v36,
        v36))
  {
    objc_msgSend(*p_errorModeView, "fittingHeight");
    v38 = v37;
  }
  else
  {
    v38 = 0.0;
  }
  v46.origin.x = v5;
  v46.origin.y = v31;
  v46.size.width = v7;
  v46.size.height = v33;
  if (v38 <= CGRectGetHeight(v46))
  {
    v47.origin.x = v5;
    v47.origin.y = v31;
    v47.size.width = v7;
    v47.size.height = v33;
    v38 = CGRectGetHeight(v47);
  }
  v39 = v5;
  v40 = v31;
  v41 = v7;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

+ (float)contentViewBottomConstraintPriority
{
  return 999.0;
}

+ (float)contentViewTopConstraintPriority
{
  return 998.0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  BOOL result;

  v5 = -[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip");
  if (a3 == 4 && (v5 & 1) != 0
    || (v6 = -[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip"),
        result = 0,
        a3 == 3)
    && (v6 & 1) == 0)
  {
    -[IOSRoutePlanningOverviewViewController _didTapHeaderView](self, "_didTapHeaderView");
    return 1;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[IOSRoutePlanningOverviewViewController _updateFieldsViewSuperviewIfNeeded](self, "_updateFieldsViewSuperviewIfNeeded");
  -[IOSRoutePlanningOverviewViewController _refreshContentInset](self, "_refreshContentInset");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->super._previousLayoutForTransition = 0;
  self->super._previousStyleForTransition = 0;
  -[RouteOverviewFieldsView reset](self->_fieldsView, "reset");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[IOSRoutePlanningOverviewViewController _refreshContentInset](self, "_refreshContentInset");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[IOSRoutePlanningOverviewViewController viewWillLayoutSubviews](&v9, "viewWillLayoutSubviews");
  if (!self->super._previousLayoutForTransition)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      self->super._previousLayoutForTransition = (unint64_t)objc_msgSend(v6, "containeeLayout");

      if (-[ContainerViewController delaysFirstCardPresentation]_0())
      {
        v7 = self->super._previousLayoutForTransition == 3;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
        objc_msgSend(v8, "setScrollEnabled:", v7);

      }
    }
  }
  if (!self->super._previousStyleForTransition)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      self->super._previousStyleForTransition = (unint64_t)objc_msgSend(v4, "containerStyle");

    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)IOSRoutePlanningOverviewViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController view](self, "view"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004D0864;
  v9[3] = &unk_1011AEDC8;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransitionInView:animation:completion:", v8, &stru_1011B8E60, v9);

}

- (BOOL)_supportsTransportTypePicker
{
  return GEOConfigGetBOOL(MapsConfig_RoutePlanningUseTransportTypeButtons, off_1014B4F88);
}

- (double)_percentCollapsedFullToMedium
{
  void *v2;
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGRect v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController sheetPresentationController](self, "sheetPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_effectiveDetentValues"));
  objc_msgSend(v2, "_currentPresentedViewFrame");
  Height = CGRectGetHeight(v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerView"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;

  v8 = 0.0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 3)
  {
    v9 = Height - v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 2));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v13, "doubleValue");
    v8 = fmax(fmin((v9 - v12) / (v14 - v12), 1.0), 0.0);

  }
  return v8;
}

- (void)_updateTransitionScrollPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t previousLayoutForTransition;
  void *v8;
  unint64_t previousStyleForTransition;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  double v20;
  double v21;
  __CFString *v22;
  __CFString *v23;
  double v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  double MinY;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  double v46;
  id v47;
  NSObject *v48;
  unsigned int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  unint64_t v61;
  void *v62;
  double v63;
  id v64;
  NSObject *v65;
  double v66;
  double v67;
  __CFString *v68;
  double v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  id v76;
  NSObject *v77;
  id v78;
  __CFString *v79;
  double v80;
  void *v81;
  double v82;
  id v83;
  id v84;
  uint8_t buf[4];
  IOSRoutePlanningOverviewViewController *v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  __CFString *v94;
  __int16 v95;
  __CFString *v96;
  __int16 v97;
  __CFString *v98;
  CGRect v99;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerView"));

  if (v3 == v5)
  {
    self->super._previousStyleForTransition = 0;
    self->super._previousLayoutForTransition = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v84 = objc_msgSend(v6, "containeeLayout");

    previousLayoutForTransition = self->super._previousLayoutForTransition;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v83 = objc_msgSend(v8, "containerStyle");

    previousStyleForTransition = self->super._previousStyleForTransition;
    -[IOSRoutePlanningOverviewViewController _percentCollapsedFullToMedium](self, "_percentCollapsedFullToMedium");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController sheetPresentationController](self, "sheetPresentationController"));
    v14 = objc_msgSend(v13, "_isDragging");
    if ((_DWORD)v14 != -[IOSRoutePlanningOverviewViewController wasSheetDragging](self, "wasSheetDragging")
      || (id)previousLayoutForTransition != v84
      || (id)previousStyleForTransition != v83)
    {
      -[IOSRoutePlanningOverviewViewController setWasSheetDragging:](self, "setWasSheetDragging:", v14);
      v15 = (id)previousLayoutForTransition == v84 ? (char)v14 : 1;
      if ((v15 & 1) != 0 || (id)previousStyleForTransition != v83)
      {
        objc_msgSend(v12, "contentOffset");
        -[IOSRoutePlanningOverviewViewController setContentOffsetWhenDraggingBegan:](self, "setContentOffsetWhenDraggingBegan:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedDetentIdentifier"));
        -[IOSRoutePlanningOverviewViewController setSheetExpandingFromMedium:](self, "setSheetExpandingFromMedium:", objc_msgSend(v17, "isEqualToString:", UISheetPresentationControllerDetentIdentifierLarge) ^ 1);

        v18 = sub_1004CD150();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          -[IOSRoutePlanningOverviewViewController contentOffsetWhenDraggingBegan](self, "contentOffsetWhenDraggingBegan");
          v21 = v20;
          if (-[IOSRoutePlanningOverviewViewController sheetExpandingFromMedium](self, "sheetExpandingFromMedium"))
            v22 = CFSTR("YES");
          else
            v22 = CFSTR("NO");
          *(double *)&v79 = COERCE_DOUBLE(v22);
          if ((_DWORD)v14)
            v23 = CFSTR("YES");
          else
            v23 = CFSTR("NO");
          v81 = v13;
          v24 = COERCE_DOUBLE(v23);
          if ((id)previousLayoutForTransition == v84)
            v25 = CFSTR("NO");
          else
            v25 = CFSTR("YES");
          v26 = v25;
          if ((id)previousStyleForTransition == v83)
            v27 = CFSTR("NO");
          else
            v27 = CFSTR("YES");
          v28 = v27;
          *(_DWORD *)buf = 134350338;
          v86 = self;
          v87 = 2048;
          v88 = v21;
          v89 = 2112;
          v90 = *(double *)&v79;
          v91 = 2112;
          v92 = v24;
          v93 = 2112;
          v94 = v26;
          v95 = 2112;
          v96 = v28;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Recording initial offset %#.1lf, expanding: %@ (dragging: %@, layoutChanged: %@, styleChanged: %@)", buf, 0x3Eu);

          v13 = v81;
        }

      }
    }
    if ((objc_msgSend(v12, "isDragging") & 1) == 0)
    {
      -[RoutePlanningOverviewViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
      MinY = CGRectGetMinY(v99);
      v82 = v11;
      v30 = -(MinY * v11);
      objc_msgSend(v12, "contentInset");
      v32 = v31;
      v80 = v33;
      v35 = v34;
      v37 = v36;
      v38 = v12;
      v39 = vabdd_f64(v30, v32);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "traitCollection"));
      objc_msgSend(v40, "displayScale");
      v41 = 1.0;
      if (v42 >= 1.0)
      {
        v43 = previousStyleForTransition;
        v44 = previousLayoutForTransition;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "traitCollection"));
        objc_msgSend(v45, "displayScale");
        v41 = v46;

        previousLayoutForTransition = v44;
        previousStyleForTransition = v43;
      }

      if (v39 > 1.0 / v41)
      {
        v47 = sub_1004CD150();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349824;
          v86 = self;
          v87 = 2048;
          v88 = v32;
          v89 = 2048;
          v90 = v30;
          v91 = 2048;
          v92 = v82 * 100.0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Updating contentInset.top: %#.1lf -> %#.1lf (percentCollapsed: %3.1lf)", buf, 0x2Au);
        }

        objc_msgSend(v38, "setContentInset:", v30, v80, v35, v37);
      }
      v49 = objc_msgSend(v13, "_isGeneratingAnimations");
      if (((v14 | v49) & 1) != 0
        || (id)previousLayoutForTransition != v84
        || (id)previousStyleForTransition != v83)
      {
        objc_msgSend(v38, "adjustedContentInset");
        v51 = v50 - v30;
        v78 = (id)previousLayoutForTransition;
        if (-[IOSRoutePlanningOverviewViewController sheetExpandingFromMedium](self, "sheetExpandingFromMedium"))
          v52 = -v51;
        else
          -[IOSRoutePlanningOverviewViewController contentOffsetWhenDraggingBegan](self, "contentOffsetWhenDraggingBegan");
        v53 = (1.0 - v82) * v52 - (v51 - MinY) * v82;
        objc_msgSend(v38, "contentOffset");
        v55 = v54;
        v56 = v38;
        v57 = vabdd_f64(v53, v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "traitCollection"));
        objc_msgSend(v58, "displayScale");
        v59 = 1.0;
        if (v60 >= 1.0)
        {
          v61 = previousStyleForTransition;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "traitCollection"));
          objc_msgSend(v62, "displayScale");
          v59 = v63;

          previousStyleForTransition = v61;
        }

        previousLayoutForTransition = (unint64_t)v78;
        if (v57 > 1.0 / v59)
        {
          v64 = sub_1004CD150();
          v65 = objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v56, "contentOffset");
            v67 = v66;
            if ((_DWORD)v14)
              v68 = CFSTR("YES");
            else
              v68 = CFSTR("NO");
            v69 = COERCE_DOUBLE(v68);
            if (v49)
              v70 = CFSTR("YES");
            else
              v70 = CFSTR("NO");
            v71 = v70;
            if (v78 == v84)
              v72 = CFSTR("NO");
            else
              v72 = CFSTR("YES");
            v73 = v72;
            if ((id)previousStyleForTransition == v83)
              v74 = CFSTR("NO");
            else
              v74 = CFSTR("YES");
            v75 = v74;
            *(_DWORD *)buf = 134350594;
            v86 = self;
            v87 = 2048;
            v88 = v67;
            v89 = 2048;
            v90 = v53;
            v91 = 2112;
            v92 = v69;
            v93 = 2112;
            v94 = v71;
            v95 = 2112;
            v96 = v73;
            v97 = 2112;
            v98 = v75;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Updating contentOffset.y:  %#.1lf -> %#.1lf (dragging: %@, generatingAnimations: %@, layoutChanged: %@, styleChanged: %@)", buf, 0x48u);

          }
          objc_msgSend(v56, "setContentOffset:", 0.0, v53);
          previousLayoutForTransition = (unint64_t)v78;
        }
      }
      if ((id)previousLayoutForTransition != v84 || (id)previousStyleForTransition != v83)
      {
        v76 = sub_1004CD150();
        v77 = objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          v86 = self;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "[%{public}p] [Transition] Storing layout/style for next transition", buf, 0xCu);
        }

        self->super._previousLayoutForTransition = (unint64_t)v84;
        self->super._previousStyleForTransition = (unint64_t)v83;
      }
    }

  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  double result;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_2;
    case 2uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController traitCollection](self, "traitCollection"));
      v12 = objc_msgSend(v11, "verticalSizeClass");

      v3 = -1.0;
      if (v12 == (id)1)
        goto LABEL_5;
      -[RoutePlanningOverviewViewController _fittingHeightForMediumLayout](self, "_fittingHeightForMediumLayout");
      break;
    case 3uLL:
    case 4uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v9, "availableHeight");
      v3 = v10;

      goto LABEL_5;
    case 5uLL:
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 136315650;
        v20 = "-[IOSRoutePlanningOverviewViewController heightForLayout:]";
        v21 = 2080;
        v22 = "RoutePlanningOverviewViewController.m";
        v23 = 1024;
        v24 = 2352;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v19, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v19 = 138412290;
          v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

        }
      }
LABEL_2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v5, "bottomSafeOffset");
      v7 = v6;
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v3 = v7 + v8;

      goto LABEL_5;
    default:
LABEL_5:
      result = v3;
      break;
  }
  return result;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController willChangeLayout:](&v12, "willChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if (v6 && (unint64_t)v6 < a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v9 = v7;
    v10 = 1;
LABEL_7:
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v10, v8, 0);

    return;
  }
  if (a3 && (unint64_t)v6 > a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v11, "collapseWaypointsIfNeeded");

    -[IOSRoutePlanningOverviewViewController _updateFieldsViewSuperviewIfNeeded](self, "_updateFieldsViewSuperviewIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v9 = v7;
    v10 = 2;
    goto LABEL_7;
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[ContaineeViewController didChangeLayout:](&v5, "didChangeLayout:");
  -[IOSRoutePlanningOverviewViewController _updateWaypointsAndRoutesListForCurrentContaineeLayout:](self, "_updateWaypointsAndRoutesListForCurrentContaineeLayout:", a3);
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController willChangeContainerStyle:](&v9, "willChangeContainerStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "stopScrollingAndZooming");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "bottomSafeOffset");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v8, "setBottomSafeOffset:", v7);

}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController didChangeContainerStyle:](&v5, "didChangeContainerStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[IOSRoutePlanningOverviewViewController _updateWaypointsAndRoutesListForCurrentContaineeLayout:](self, "_updateWaypointsAndRoutesListForCurrentContaineeLayout:", objc_msgSend(v4, "containeeLayout"));

}

- (void)_updateWaypointsAndRoutesListForCurrentContaineeLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3 != 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v5, "collapseWaypointsIfNeeded");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));

    if (v7 != v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewLayout"));
      objc_msgSend(v10, "invalidateLayout");

    }
  }
  -[IOSRoutePlanningOverviewViewController _updateFieldsViewSuperviewIfNeeded](self, "_updateFieldsViewSuperviewIfNeeded");
  -[IOSRoutePlanningOverviewViewController _updateTransitionScrollPosition](self, "_updateTransitionScrollPosition");
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    objc_msgSend(v11, "setScrollEnabled:", a3 == 3);

  }
}

- (BOOL)shouldIgnoreTapOnView:(id)a3 headerView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypointListView"));
  v8 = objc_msgSend(v5, "isDescendantOfView:", v7);

  return v8;
}

- (void)_didTapHeaderView
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "stopScrollingAndZooming");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = objc_msgSend(v4, "containeeLayout");

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 5uLL:
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315650;
        v15 = "-[IOSRoutePlanningOverviewViewController _didTapHeaderView]";
        v16 = 2080;
        v17 = "RoutePlanningOverviewViewController.m";
        v18 = 1024;
        v19 = 2444;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v14, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v8 = sub_1004318FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
        goto LABEL_10;
      }
      break;
    case 1uLL:
    case 3uLL:
      v11 = objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      v9 = v11;
      v12 = 2;
      goto LABEL_9;
    case 2uLL:
      v11 = objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      v9 = v11;
      v12 = 3;
LABEL_9:
      -[NSObject wantsLayout:](v11, "wantsLayout:", v12);
LABEL_10:

      break;
    default:
      break;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v13, "captureUserAction:onTarget:eventValue:", 3, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[4];
  id v8;
  id location;

  if (a6 == &unk_1014D26D0)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004D18E4;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IOSRoutePlanningOverviewViewController;
    -[IOSRoutePlanningOverviewViewController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_forceChangeOrigin
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "presentRoutePlanningViewType:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v4, "selectWaypointSearchFieldIndex:exitPlanningIfCancelTapped:", 0, 1);

}

- (void)waypointListView:(id)a3 didSelectWaypoint:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[IOSRoutePlanningOverviewViewController _didSelectWaypoint:atIndex:](self, "_didSelectWaypoint:atIndex:", a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 277, v7, v9);

}

- (void)waypointListViewDidSelectAddStop:(id)a3
{
  id v4;

  -[IOSRoutePlanningOverviewViewController _didSelectWaypoint:atIndex:](self, "_didSelectWaypoint:atIndex:", 0, -1);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 6097, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)waypointListView:(id)a3 didSelectCollapsedWaypoints:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v6, "expandWaypointsIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));

  if (v8 != v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionViewLayout"));
    objc_msgSend(v11, "invalidateLayout");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v12, "wantsLayout:", 3);

  -[IOSRoutePlanningOverviewViewController _updateFieldsViewSuperviewIfNeeded](self, "_updateFieldsViewSuperviewIfNeeded");
  v17 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v13 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v14 = objc_msgSend(v5, "count");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
  objc_msgSend(v17, "captureUserAction:onTarget:eventValue:", 31, v13, v16);

}

- (void)waypointListView:(id)a3 didMoveWaypoint:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 279, v9, v11);

  -[IOSRoutePlanningOverviewViewController _refreshRouteForChangeInWaypointListView:](self, "_refreshRouteForChangeInWaypointListView:", v12);
}

- (void)waypointListView:(id)a3 didDeleteWaypointAtIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 280, v7, v9);

  -[IOSRoutePlanningOverviewViewController _refreshRouteForChangeInWaypointListView:](self, "_refreshRouteForChangeInWaypointListView:", v10);
}

- (void)_didSelectWaypoint:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platformController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "auxiliaryTasksManager"));
  v9 = objc_msgSend(v8, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
  v13 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v13, "cancelNavigationAutoLaunchIfNeccessary");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v10, "presentRoutePlanningViewType:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v11, "selectWaypointSearchFieldIndex:exitPlanningIfCancelTapped:", a4, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController pedestrianARFeatureIntroTeachableMomentTimer](self, "pedestrianARFeatureIntroTeachableMomentTimer"));
  objc_msgSend(v12, "invalidate");

}

- (void)didTapTimingInFieldsView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "auxiliaryTasksManager"));
  v7 = objc_msgSend(v6, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
  v10 = (id)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v10, "cancelNavigationAutoLaunchIfNeccessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v8, "presentRoutePlanningViewType:", 3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController pedestrianARFeatureIntroTeachableMomentTimer](self, "pedestrianARFeatureIntroTeachableMomentTimer"));
  objc_msgSend(v9, "invalidate");

}

- (void)replaceOriginWithCurrentLocation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentDirectionItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v6 = objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v7));
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, v8);

    -[IOSRoutePlanningOverviewViewController _refreshRouteForWaypoints:](self, "_refreshRouteForWaypoints:", v6);
  }
  else
  {
    v9 = sub_10043214C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Couldn't replace currentDirectionItem's origin", v11, 2u);
    }

  }
}

- (void)_refreshRouteForChangeInWaypointListView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 6003, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoints"));
  v6 = objc_msgSend(v7, "copy");
  -[IOSRoutePlanningOverviewViewController _refreshRouteForWaypoints:](self, "_refreshRouteForWaypoints:", v6);

}

- (void)_refreshRouteForWaypoints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  DirectionItem *v13;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  _UNKNOWN **v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v6 = objc_msgSend(v5, "desiredTransportType");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDirectionItem"));
    v9 = objc_msgSend(v8, "editRequired:", 0);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentDirectionItem"));
      v6 = objc_msgSend(v11, "transportType");

    }
    else
    {
      v6 = 0;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v13 = -[DirectionItem initWithItems:ignoreMapType:transportType:]([DirectionItem alloc], "initWithItems:ignoreMapType:transportType:", v4, objc_msgSend(v12, "isLocationServicesApproved") & objc_msgSend(v12, "isAuthorizedForPreciseLocation"), v6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drivePreferences"));
  -[DirectionItem setDrivePreferences:](v13, "setDrivePreferences:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitPreferences"));
  -[DirectionItem setTransitPreferences:](v13, "setTransitPreferences:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cyclePreferences"));
  -[DirectionItem setCyclePreferences:](v13, "setCyclePreferences:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timing"));
  -[DirectionItem setTiming:](v13, "setTiming:", v21);

  v22 = objc_alloc((Class)NSMutableDictionary);
  v31 = CFSTR("DirectionsSessionInitiatorKey");
  v32 = &off_10126D918;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v24 = objc_msgSend(v22, "initWithDictionary:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "originalHistoryEntryIdentifier"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("DirectionsRouteUUIDKey"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "automaticSharingContacts"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("DirectionsPreviousContactsForTripSharing"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v30 = objc_msgSend(v24, "copy");
  objc_msgSend(v29, "viewController:doDirectionItem:allowToPromptEditing:withUserInfo:", self, v13, 0, v30);

}

- (id)waypointsForFieldsView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directionItemForCurrentSession"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  return v5;
}

- (RoutePlanningTransportTypeRefinementModel)transportTypeRefinement
{
  void *v3;
  RoutePlanningTransportTypeRefinementModel *v4;
  RoutePlanningTransportTypeRefinementModel *transportTypeRefinement;

  if (!self->_transportTypeRefinement)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));

    if (!v3)
    {
      v4 = -[RoutePlanningRefinementModel initWithDelegate:value:]([RoutePlanningTransportTypeRefinementModel alloc], "initWithDelegate:value:", self, &off_10126D8E8);
      transportTypeRefinement = self->_transportTypeRefinement;
      self->_transportTypeRefinement = v4;

    }
  }
  return self->_transportTypeRefinement;
}

- (RoutePlanningPreferenceRefinementModel)preferenceRefinement
{
  RoutePlanningPreferenceRefinementModel *preferenceRefinement;
  RoutePlanningPreferenceRefinementModel *v4;
  RoutePlanningPreferenceRefinementModel *v5;

  preferenceRefinement = self->_preferenceRefinement;
  if (!preferenceRefinement)
  {
    v4 = -[RoutePlanningRefinementModel initWithDelegate:value:]([RoutePlanningPreferenceRefinementModel alloc], "initWithDelegate:value:", self, 0);
    v5 = self->_preferenceRefinement;
    self->_preferenceRefinement = v4;

    preferenceRefinement = self->_preferenceRefinement;
  }
  return preferenceRefinement;
}

- (RoutePlanningTimingRefinementModel)timingRefinement
{
  RoutePlanningTimingRefinementModel *timingRefinement;
  RoutePlanningTimingRefinementModel *v4;
  void *v5;
  void *v6;
  RoutePlanningTimingRefinementModel *v7;
  RoutePlanningTimingRefinementModel *v8;

  timingRefinement = self->_timingRefinement;
  if (!timingRefinement)
  {
    v4 = [RoutePlanningTimingRefinementModel alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timing"));
    v7 = -[RoutePlanningRefinementModel initWithDelegate:value:](v4, "initWithDelegate:value:", self, v6);
    v8 = self->_timingRefinement;
    self->_timingRefinement = v7;

    timingRefinement = self->_timingRefinement;
  }
  return timingRefinement;
}

- (RoutePlanningVehicleRefinementModel)vehicleRefinement
{
  RoutePlanningVehicleRefinementModel *vehicleRefinement;
  RoutePlanningVehicleRefinementModel *v4;
  void *v5;
  void *v6;
  RoutePlanningVehicleRefinementModel *v7;
  RoutePlanningVehicleRefinementModel *v8;

  vehicleRefinement = self->_vehicleRefinement;
  if (!vehicleRefinement)
  {
    v4 = [RoutePlanningVehicleRefinementModel alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "virtualGarage"));
    v7 = -[RoutePlanningVehicleRefinementModel initWithDelegate:value:](v4, "initWithDelegate:value:", self, v6);
    v8 = self->_vehicleRefinement;
    self->_vehicleRefinement = v7;

    vehicleRefinement = self->_vehicleRefinement;
  }
  return vehicleRefinement;
}

- (RoutePlanningPreferredNetworksRefinementModel)preferredNetworksRefinement
{
  RoutePlanningPreferredNetworksRefinementModel *preferredNetworksRefinement;
  RoutePlanningPreferredNetworksRefinementModel *v4;
  void *v5;
  void *v6;
  void *v7;
  RoutePlanningPreferredNetworksRefinementModel *v8;
  RoutePlanningPreferredNetworksRefinementModel *v9;

  preferredNetworksRefinement = self->_preferredNetworksRefinement;
  if (!preferredNetworksRefinement)
  {
    v4 = [RoutePlanningPreferredNetworksRefinementModel alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "virtualGarage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedVehicle"));
    v8 = -[RoutePlanningPreferredNetworksRefinementModel initWithDelegate:value:](v4, "initWithDelegate:value:", self, v7);
    v9 = self->_preferredNetworksRefinement;
    self->_preferredNetworksRefinement = v8;

    preferredNetworksRefinement = self->_preferredNetworksRefinement;
  }
  return preferredNetworksRefinement;
}

- (RoutePlanningEbikeRefinementModel)ebikeRefinement
{
  RoutePlanningEbikeRefinementModel *ebikeRefinement;
  RoutePlanningEbikeRefinementModel *v4;
  void *v5;
  void *v6;
  RoutePlanningEbikeRefinementModel *v7;
  RoutePlanningEbikeRefinementModel *v8;

  ebikeRefinement = self->_ebikeRefinement;
  if (!ebikeRefinement)
  {
    v4 = [RoutePlanningEbikeRefinementModel alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cyclePreferences"));
    v7 = -[RoutePlanningRefinementModel initWithDelegate:value:](v4, "initWithDelegate:value:", self, v6);
    v8 = self->_ebikeRefinement;
    self->_ebikeRefinement = v7;

    ebikeRefinement = self->_ebikeRefinement;
  }
  return ebikeRefinement;
}

- (id)currentRefinementsForFieldsView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int BOOL;
  int v20;
  int v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  NSSet *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v78;
  int v79;
  int IsEnabled_EVRoutingEnhancements;
  _QWORD v81[4];
  NSMutableArray *v82;
  IOSRoutePlanningOverviewViewController *v83;
  id v84;
  id v85;
  void *v86;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSession"));

  v7 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = objc_msgSend(v9, "currentTransportType");
    v11 = objc_msgSend(v9, "navigationType") == (id)2;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v10 = objc_msgSend(v12, "transportType");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRoute"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "origin"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentRoute"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "origin"));
      v11 = objc_msgSend(v18, "isCurrentLocation") ^ 1;

    }
    else
    {
      v11 = 0;
    }

  }
  BOOL = GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingEnableAllowListing[0], VirtualGarageConfig_EVRoutingEnableAllowListing[1]);
  v20 = GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingAllowSteppingRoutes[0], VirtualGarageConfig_EVRoutingAllowSteppingRoutes[1]) | BOOL ^ 1;
  if (v11)
    v21 = v20;
  else
    v21 = 1;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController transportTypeRefinement](self, "transportTypeRefinement"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  objc_msgSend(v22, "setValue:", v23);

  if (v10)
  {
    v24 = objc_opt_new(NSMutableArray);
    v25 = v24;
    if (v22)
      -[NSMutableArray addObject:](v24, "addObject:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "timing"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController timingRefinement](self, "timingRefinement"));
    objc_msgSend(v28, "setValue:", v27);

    if (MapsFeature_IsEnabled_Maps357RoutePlanning())
      v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, &off_10126D900, 0);
    else
      v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, 0, v78);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    v32 = objc_msgSend(v30, "containsObject:", v31);

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController timingRefinement](self, "timingRefinement"));
      -[NSMutableArray addObject:](v25, "addObject:", v33);

    }
    switch((unint64_t)v10)
    {
      case 1uLL:
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "drivePreferences"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        objc_msgSend(v36, "setValue:", v35);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        -[NSMutableArray addObject:](v25, "addObject:", v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "virtualGarage"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "vehicles"));
        v79 = v21;
        if (objc_msgSend(v40, "count"))
          v41 = v21;
        else
          v41 = 0;

        if (v41 == 1)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "virtualGarage"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController vehicleRefinement](self, "vehicleRefinement"));
          objc_msgSend(v44, "setValue:", v43);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController vehicleRefinement](self, "vehicleRefinement"));
          -[NSMutableArray addObject:](v25, "addObject:", v45);

        }
        IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController vehicleRefinement](self, "vehicleRefinement"));
        v47 = objc_msgSend(v46, "isOverridingToNoSelection");

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "virtualGarage"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "selectedVehicle"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "preferredChargingNetworks"));
        v52 = objc_msgSend(v51, "count");

        if (IsEnabled_EVRoutingEnhancements && (v47 & 1) == 0 && v52 && ((v79 ^ 1) & 1) == 0)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "virtualGarage"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "selectedVehicle"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferredNetworksRefinement](self, "preferredNetworksRefinement"));
          objc_msgSend(v56, "setValue:", v55);

          v57 = objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferredNetworksRefinement](self, "preferredNetworksRefinement"));
          goto LABEL_42;
        }
        break;
      case 2uLL:
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "walkPreferences"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        objc_msgSend(v60, "setValue:", v59);

        v57 = objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        goto LABEL_42;
      case 3uLL:
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "transitPreferences"));

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        objc_msgSend(v63, "setValue:", v62);

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        -[NSMutableArray addObject:](v25, "addObject:", v64);

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "displayHints"));

        v67 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningDisplayHintsRefinementModel requirementFieldsForDisplayHints:](RoutePlanningDisplayHintsRefinementModel, "requirementFieldsForDisplayHints:", v66));
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_1004D2E90;
        v81[3] = &unk_1011B8E88;
        v82 = v25;
        v83 = self;
        v84 = v62;
        v85 = v66;
        v68 = v66;
        v69 = v62;
        objc_msgSend(v67, "enumerateIndexesUsingBlock:", v81);

        goto LABEL_43;
      case 4uLL:
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
        objc_msgSend(v67, "setValue:", 0);
        goto LABEL_43;
      case 5uLL:
        if (sub_1003C7758())
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "cyclePreferences"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
          objc_msgSend(v72, "setValue:", v71);

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
          -[NSMutableArray addObject:](v25, "addObject:", v73);

        }
        if (!sub_1003C76E0())
          break;
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "cyclePreferences"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController ebikeRefinement](self, "ebikeRefinement"));
        objc_msgSend(v76, "setValue:", v75);

        v57 = objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController ebikeRefinement](self, "ebikeRefinement"));
LABEL_42:
        v67 = (void *)v57;
        -[NSMutableArray addObject:](v25, "addObject:", v57);
LABEL_43:

        break;
      default:
        break;
    }
  }
  else if (v22)
  {
    v86 = v22;
    v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
  }
  else
  {
    v25 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v25;
}

- (int64_t)transportTypeForFieldsView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", a3));
  v4 = objc_msgSend(v3, "transportType");

  return (int64_t)v4;
}

- (void)pressedRefinementModel:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a3, "menuPressUsageAction");
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v5, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  }
}

- (void)selectedRefinementModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "buttonPressUsageAction");
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v5, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platformController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "auxiliaryTasksManager"));
  v10 = objc_msgSend(v9, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v11, "cancelNavigationAutoLaunchIfNeccessary");
  v12 = objc_opt_class(RoutePlanningTimingRefinementModel);
  if ((objc_opt_isKindOfClass(v16, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    -[IOSRoutePlanningOverviewViewController didTapTimingInFieldsView:](self, "didTapTimingInFieldsView:", v13);

  }
  else
  {
    v14 = objc_opt_class(RoutePlanningPreferenceRefinementModel);
    if ((objc_opt_isKindOfClass(v16, v14) & 1) != 0)
    {
      -[RoutePlanningOverviewViewController _presentRouteOptions](self, "_presentRouteOptions");
    }
    else
    {
      v15 = objc_opt_class(RoutePlanningEbikeRefinementModel);
      if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
        -[RoutePlanningOverviewViewController _presentEbikeOptions](self, "_presentEbikeOptions");
    }
  }

}

- (void)updatedRefinementModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v4 = objc_msgSend(v22, "lastUpdateUsageAction");
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v5, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platformController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "auxiliaryTasksManager"));
  v10 = objc_msgSend(v9, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v11, "cancelNavigationAutoLaunchIfNeccessary");
  v12 = objc_opt_class(RoutePlanningTransportTypeRefinementModel);
  if ((objc_opt_isKindOfClass(v22, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
    -[RoutePlanningOverviewViewController _updateToTransportType:](self, "_updateToTransportType:", objc_msgSend(v13, "integerValue"));
LABEL_12:

    goto LABEL_13;
  }
  v14 = objc_opt_class(RoutePlanningVehicleRefinementModel);
  if ((objc_opt_isKindOfClass(v22, v14) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectedVehicle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v15, "virtualGarageSelectVehicle:", v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v16, "setNeedsUpdateRefinements");
LABEL_11:

    goto LABEL_12;
  }
  v17 = objc_opt_class(RoutePlanningDisplayHintsRefinementModel);
  if ((objc_opt_isKindOfClass(v22, v17) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v16, "updateTransitPreferences:", v13);
    goto LABEL_11;
  }
  v18 = objc_opt_class(RoutePlanningPreferredNetworksRefinementModel);
  if ((objc_opt_isKindOfClass(v22, v18) & 1) != 0)
  {
    v19 = objc_msgSend(v22, "shouldUsePreferredNetworks");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "virtualGarage"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectedVehicle"));
    objc_msgSend(v13, "virtualGarageSetShouldUsePreferredNetworks:forVehicle:", v19, v21);

    goto LABEL_11;
  }
LABEL_13:

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRequestState:(int64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateRequestState:](&v6, "routePlanningDataCoordinator:didUpdateRequestState:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v5, "setNeedsUpdateRefinements");

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOSRoutePlanningOverviewViewController;
  v6 = a4;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateResolvedWaypointSet:](&v9, "routePlanningDataCoordinator:didUpdateResolvedWaypointSet:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", v9.receiver, v9.super_class));
  objc_msgSend(v7, "routePlanningUpdatedWaypoints:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v8, "setNeedsUpdateRefinements");

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateOriginName:destinationName:](&v7, "routePlanningDataCoordinator:didUpdateOriginName:destinationName:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v6, "setNeedsUpdateWaypointsList");

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateTransportType:](&v10, "routePlanningDataCoordinator:didUpdateTransportType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v5, "updateRefinements");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v6, "updateWaypointsList");

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004D3580;
  v7[3] = &unk_1011AD260;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSRoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController routePlanningDataCoordinator:didUpdateRouteCollection:](&v10, "routePlanningDataCoordinator:didUpdateRouteCollection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v5, "setNeedsUpdateWaypointsList");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v6, "setNeedsUpdateRefinements");

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004D3688;
  v7[3] = &unk_1011AD260;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateVirtualGarage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  if (-[RoutePlanningOverviewViewController shouldRefreshRoutePlanningWithCurrentGarage:previousGarage:](self, "shouldRefreshRoutePlanningWithCurrentGarage:previousGarage:", a4, self->super._virtualGarageAtLastRouteRequest))
  {
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Redrawing refinements for updated virtual garage", v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v7, "setNeedsUpdateRefinements");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v8, "setNeedsUpdateWaypointsList");

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateDrivePreferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = sub_10043214C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(v5);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v15, "setNeedsUpdateRefinements");

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateWalkPreferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = sub_10043214C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(v5);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v15, "setNeedsUpdateRefinements");

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransitPreferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = sub_10043214C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(v5);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v15, "setNeedsUpdateRefinements");

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateCyclePreferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController preferenceRefinement](self, "preferenceRefinement"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = sub_10043214C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(v5);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Redrawing refinements for updated %@: %@", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
    objc_msgSend(v15, "setNeedsUpdateRefinements");

  }
}

- (void)_refreshTimingDisplay
{
  NSSet *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;

  if (MapsFeature_IsEnabled_Maps357RoutePlanning(self, a2))
    v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, &off_10126D900, 0);
  else
    v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, 0, v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "transportType")));
  v7 = objc_msgSend(v4, "containsObject:", v6);
  if ((_DWORD)v7)
  {

LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timing"));

    goto LABEL_12;
  }
  if (MapsFeature_IsEnabled_Maps357RoutePlanning(v7, v8))
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, &off_10126D900, 0);
  else
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126D930, 0, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "desiredTransportType")));
  v13 = objc_msgSend(v10, "containsObject:", v12);

  if (v13)
    goto LABEL_10;
  v15 = 0;
LABEL_12:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController fieldsView](self, "fieldsView"));
  objc_msgSend(v16, "setNeedsUpdateRefinements");

  v17 = sub_10043214C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Updating timing to: %@", buf, 0xCu);
  }

}

- (void)_refreshContentInset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[IOSRoutePlanningOverviewViewController _extraBottomPadding](self, "_extraBottomPadding");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  if (objc_msgSend(v12, "transportType") == (id)4)
    v11 = 0.0;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "setContentInset:", v5, v7, v11, v9);

}

- (double)_extraBottomPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController view](self, "view"));
  objc_msgSend(v2, "safeAreaInsets");
  if (v3 <= 0.0)
    v4 = 16.0;
  else
    v4 = 0.0;

  return v4;
}

- (PedestrianARSessionStateManager)pedestrianARSessionStateManager
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pedestrianARSessionStateManager"));

  return (PedestrianARSessionStateManager *)v4;
}

- (BOOL)_shouldShowPedestrianARTeachableMomentCard
{
  void *v3;
  void *v4;
  char *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  const char *v22;
  BOOL v23;
  id v24;
  void *v25;
  unint64_t v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  _BOOL4 v31;
  int v33;
  const __CFString *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController pedestrianARSessionStateManager](self, "pedestrianARSessionStateManager"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v5 = (char *)objc_msgSend(v4, "currentInterruptionKind");

    if (v5)
    {
      v6 = sub_10043214C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)(v5 - 2) > 0x15)
          v8 = CFSTR("kMapsInterruptionDirectionsSafetyWarning");
        else
          v8 = *(&off_1011B8F58 + (_QWORD)(v5 - 2));
        v33 = 138412290;
        v34 = v8;
        v10 = "Not showing Pedestrian AR teachable moment card because there is currently an interruption present: %@";
        v11 = v7;
        v12 = 12;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "platformController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentSession"));

    v16 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      v17 = v15;
    else
      v17 = 0;
    v7 = v17;

    if (v7)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject configuration](v7, "configuration"));
      v19 = objc_msgSend(v18, "shouldAutoLaunchNavigation");

      if (v19)
      {
        v20 = sub_10043214C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          v22 = "Not showing Pedestrian AR teachable moment card because route planning is going to auto launch into nav";
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v33, 2u);
        }
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        v26 = (unint64_t)objc_msgSend(v25, "containerStyle");

        if ((v26 & 0xFFFFFFFFFFFFFFFDLL) == 4)
        {
          v27 = sub_10043214C();
          v21 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(v33) = 0;
            v22 = "Not showing Pedestrian AR teachable moment card because the phone is in landscape";
            goto LABEL_29;
          }
        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController pedestrianARSessionStateManager](self, "pedestrianARSessionStateManager"));
          v29 = objc_msgSend(v28, "shouldShowPedestrianAR");

          v30 = sub_10043214C();
          v21 = objc_claimAutoreleasedReturnValue(v30);
          v31 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if ((v29 & 1) != 0)
          {
            if (v31)
            {
              LOWORD(v33) = 0;
              v23 = 1;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Can show Pedestrian AR teachable moment card", (uint8_t *)&v33, 2u);
            }
            else
            {
              v23 = 1;
            }
            goto LABEL_31;
          }
          if (v31)
          {
            LOWORD(v33) = 0;
            v22 = "Not showing the Pedestrian AR teachable moment card because the feature is not available right now";
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      v24 = sub_10043214C();
      v21 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        v22 = "Not showing Pedestrian AR teachable moment card because we are no longer in route planning";
        goto LABEL_29;
      }
    }
    v23 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v9 = sub_10043214C();
  v7 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v33) = 0;
    v10 = "Not showing Pedestrian AR teachable moment card because the feature is not enabled";
    v11 = v7;
    v12 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v33, v12);
  }
LABEL_18:
  v23 = 0;
LABEL_32:

  return v23;
}

- (void)_showPedestrianARFeatureIntroTeachableMomentCardIfNecessary
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  double Double;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  double v20;

  if (!-[IOSRoutePlanningOverviewViewController _shouldShowPedestrianARTeachableMomentCard](self, "_shouldShowPedestrianARTeachableMomentCard"))
  {
    v6 = sub_10043214C();
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not showing Pedestrian AR feature intro teachable moment card because we should not show any teachable moment cards right now", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!+[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment](PedestrianARFeatureIntroTeachableMomentContaineeViewController, "shouldShowTeachableMoment"))
  {
    v7 = sub_10043214C();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not showing Pedestrian AR feature intro teachable moment card because it is not eligible to be shown", buf, 2u);
    }
    goto LABEL_12;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSRoutePlanningOverviewViewController pedestrianARFeatureIntroTeachableMomentTimer](self, "pedestrianARFeatureIntroTeachableMomentTimer"));

  if (v3)
  {
    v4 = sub_10043214C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not showing the Pedestrian AR feature intro teachable moment card because the presentation timer has already been created", buf, 2u);
    }
LABEL_12:

    return;
  }
  Double = GEOConfigGetDouble(MapsConfig_PedestrianARFeatureIntroTeachableMomentCardDelay, off_1014B4278);
  objc_initWeak(&location, self);
  v9 = sub_10043214C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = Double;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting feature intro teachable moment card with delay: %f", buf, 0xCu);
  }

  v11 = &_dispatch_main_q;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1004D4594;
  v16 = &unk_1011AE190;
  objc_copyWeak(&v17, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v13, Double));
  -[IOSRoutePlanningOverviewViewController setPedestrianARFeatureIntroTeachableMomentTimer:](self, "setPedestrianARFeatureIntroTeachableMomentTimer:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_showPedestrianARRaiseToEnterTeachableMomentCardIfNecessary
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  _BOOL4 v18;
  id v19;
  uint8_t v20[16];
  __int16 v21;
  __int16 v22;
  __int16 v23;
  uint8_t buf[2];

  if (-[IOSRoutePlanningOverviewViewController _shouldShowPedestrianARTeachableMomentCard](self, "_shouldShowPedestrianARTeachableMomentCard"))
  {
    if (+[PedestrianARRaiseToEnterTeachableMomentContaineeViewController hasShownTeachableMoment](PedestrianARRaiseToEnterTeachableMomentContaineeViewController, "hasShownTeachableMoment"))
    {
      v3 = sub_10043214C();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v23 = 0;
        v5 = "Not showing Pedestrian AR raise to enter teachable moment card because it has already been shown before";
        v6 = (uint8_t *)&v23;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeCollection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRoute"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueRouteID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v14 = objc_msgSend(v8, "hasAREverLocalizedForRoute:", v13);

      if ((v14 & 1) == 0)
      {
        v19 = sub_10043214C();
        v4 = objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          goto LABEL_8;
        v22 = 0;
        v5 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't localized on the current route yet";
        v6 = (uint8_t *)&v22;
        goto LABEL_7;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
      v16 = objc_msgSend(v15, "hasARElementRendered");

      v17 = sub_10043214C();
      v4 = objc_claimAutoreleasedReturnValue(v17);
      v18 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
      if ((v16 & 1) == 0)
      {
        if (!v18)
          goto LABEL_8;
        v21 = 0;
        v5 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't seen an AR element yet";
        v6 = (uint8_t *)&v21;
        goto LABEL_7;
      }
      if (v18)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Showing the Pedestrian AR raise to enter teachable moment card", v20, 2u);
      }

      v4 = objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      -[NSObject showPedestrianARRaiseToEnterTeachableMomentCard](v4, "showPedestrianARRaiseToEnterTeachableMomentCard");
    }
  }
  else
  {
    v7 = sub_10043214C();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Not showing Pedestrian AR raise to enter teachable moment card because we should not show any teachable momen"
           "t cards right now";
      v6 = buf;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)wasSheetDragging
{
  return self->_wasSheetDragging;
}

- (void)setWasSheetDragging:(BOOL)a3
{
  self->_wasSheetDragging = a3;
}

- (BOOL)sheetExpandingFromMedium
{
  return self->_sheetExpandingFromMedium;
}

- (void)setSheetExpandingFromMedium:(BOOL)a3
{
  self->_sheetExpandingFromMedium = a3;
}

- (double)contentOffsetWhenDraggingBegan
{
  return self->_contentOffsetWhenDraggingBegan;
}

- (void)setContentOffsetWhenDraggingBegan:(double)a3
{
  self->_contentOffsetWhenDraggingBegan = a3;
}

- (void)setTransportTypeRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_transportTypeRefinement, a3);
}

- (void)setPreferenceRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceRefinement, a3);
}

- (void)setTimingRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_timingRefinement, a3);
}

- (void)setVehicleRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleRefinement, a3);
}

- (void)setPreferredNetworksRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_preferredNetworksRefinement, a3);
}

- (void)setEbikeRefinement:(id)a3
{
  objc_storeStrong((id *)&self->_ebikeRefinement, a3);
}

- (GCDTimer)pedestrianARFeatureIntroTeachableMomentTimer
{
  return self->_pedestrianARFeatureIntroTeachableMomentTimer;
}

- (void)setPedestrianARFeatureIntroTeachableMomentTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pedestrianARFeatureIntroTeachableMomentTimer, a3);
}

- (RouteOverviewFieldsView)fieldsView
{
  return self->_fieldsView;
}

- (void)setFieldsView:(id)a3
{
  objc_storeStrong((id *)&self->_fieldsView, a3);
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, a3);
}

- (NSLayoutConstraint)collectionViewTopToFieldsViewConstraint
{
  return self->_collectionViewTopToFieldsViewConstraint;
}

- (void)setCollectionViewTopToFieldsViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewTopToFieldsViewConstraint, a3);
}

- (NSLayoutConstraint)collectionViewTopToContentViewConstraint
{
  return self->_collectionViewTopToContentViewConstraint;
}

- (void)setCollectionViewTopToContentViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewTopToContentViewConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewTopToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewTopToFieldsViewConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_fieldsView, 0);
  objc_storeStrong((id *)&self->_pedestrianARFeatureIntroTeachableMomentTimer, 0);
  objc_storeStrong((id *)&self->_ebikeRefinement, 0);
  objc_storeStrong((id *)&self->_preferredNetworksRefinement, 0);
  objc_storeStrong((id *)&self->_vehicleRefinement, 0);
  objc_storeStrong((id *)&self->_timingRefinement, 0);
  objc_storeStrong((id *)&self->_preferenceRefinement, 0);
  objc_storeStrong((id *)&self->_transportTypeRefinement, 0);
}

@end
