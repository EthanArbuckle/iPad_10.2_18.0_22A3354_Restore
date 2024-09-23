@implementation EnvironmentsViewController

- (EnvironmentsViewController)initWithStyle:(int64_t)a3
{
  EnvironmentsViewController *v3;
  EnvironmentsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOEnvironmentsController *v9;
  GEOEnvironmentsController *environmentsController;
  GEOFeaturesController *v11;
  GEOFeaturesController *featuresController;
  EnvironmentsViewController *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EnvironmentsViewController;
  v3 = -[EnvironmentsViewController initWithStyle:](&v15, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    -[EnvironmentsViewController setTitle:](v3, "setTitle:", CFSTR("Environments"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](v4, "tableView"));
    objc_msgSend(v5, "setRowHeight:", UITableViewAutomaticDimension);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](v4, "tableView"));
    objc_msgSend(v6, "setSectionFooterHeight:", UITableViewAutomaticDimension);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](v4, "tableView"));
    objc_msgSend(v7, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4->_showingCustomEnvironments = objc_msgSend(v8, "BOOLForKey:", CFSTR("EnableCustomEnvironmentsInSettings"));

    v9 = (GEOEnvironmentsController *)objc_msgSend(objc_alloc((Class)GEOEnvironmentsController), "initEnablingCustomEnvironments:", v4->_showingCustomEnvironments);
    environmentsController = v4->_environmentsController;
    v4->_environmentsController = v9;

    -[GEOEnvironmentsController setDelegate:](v4->_environmentsController, "setDelegate:", v4);
    v11 = (GEOFeaturesController *)objc_alloc_init((Class)GEOFeaturesController);
    featuresController = v4->_featuresController;
    v4->_featuresController = v11;

    -[GEOFeaturesController setDelegate:](v4->_featuresController, "setDelegate:", v4);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo[0], GeoServicesConfig_ClientAuthFeatureFlagsStateInfo[1], &_dispatch_main_q, v4);
    v13 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  -[GEOEnvironmentsController setDelegate:](self->_environmentsController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EnvironmentsViewController;
  -[EnvironmentsViewController dealloc](&v3, "dealloc");
}

- (void)_done:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EnvironmentsViewController;
  -[EnvironmentsViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  self->_hasAttemptedAuth = 0;
  -[GEOEnvironmentsController reloadEnvironments](self->_environmentsController, "reloadEnvironments");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController presentingViewController](self, "presentingViewController"));
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_done:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setRightBarButtonItem:", 0);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v8, "addTileGroupObserver:queue:", self, &_dispatch_main_q);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EnvironmentsViewController;
  -[EnvironmentsViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v4, "removeTileGroupObserver:", self);

}

- (id)_environmentForIndexPath:(id)a3
{
  GEOEnvironmentsController *environmentsController;
  id v4;
  void *v5;
  id v6;
  void *v7;

  environmentsController = self->_environmentsController;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentsController environmentInfosForSection:](environmentsController, "environmentInfosForSection:", objc_msgSend(v4, "section")));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  return v7;
}

- (id)_featureForIndexPath:(id)a3
{
  GEOFeaturesController *featuresController;
  id v4;
  void *v5;
  id v6;
  void *v7;

  featuresController = self->_featuresController;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOFeaturesController features](featuresController, "features"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  return v7;
}

- (BOOL)_isSectionForEnvironments:(int64_t)a3
{
  if (!a3)
    return 1;
  return a3 == 1 && self->_showingCustomEnvironments;
}

- (void)errorButtonTapped:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "touchesForView:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
  objc_msgSend(v10, "locationInView:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForRowAtPoint:"));

  if (v13)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
    -[EnvironmentsViewController tableView:accessoryButtonTappedForRowWithIndexPath:](self, "tableView:accessoryButtonTappedForRowWithIndexPath:", v12, v13);

  }
}

- (void)_toggleUseProductionURLs:(id)a3
{
  id v3;
  id v4;

  v3 = objc_msgSend(a3, "isOn");
  GEOConfigSetSyncBOOL(GeoServicesConfig_UseProductionURLs[0], GeoServicesConfig_UseProductionURLs[1], v3);
  _GEOConfigRemoveValueSync(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], GeoServicesConfig_DisableUpdatingActiveTileGroup[1]);
  _GEOConfigRemoveValueSync(GeoServicesConfig_ResourceManifestURL[0], GeoServicesConfig_ResourceManifestURL[1]);
  _GEOConfigRemoveValueSync(GeoServicesConfig_ResourceManifestEnvironment[0], GeoServicesConfig_ResourceManifestEnvironment[1]);
  _GEOConfigRemoveValueSync(GeoServicesConfig_CustomEnvironmentConfiguration[0], GeoServicesConfig_CustomEnvironmentConfiguration[1]);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GEONetworkDefaults sharedNetworkDefaults](GEONetworkDefaults, "sharedNetworkDefaults"));
  objc_msgSend(v4, "updateNetworkDefaults:", 0);

}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v4;
  id v5;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.geoservices"), "stringByAppendingString:", CFSTR(".siri_data_changed"))));
  notify_post((const char *)objc_msgSend(v4, "UTF8String"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (void)mapsAuthTokenRequestDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GEOMapsAuthRequestTypeKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper"));
  objc_msgSend(v7, "removeMapsAuthDidFinishObserver:forRequestType:", self, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", GEOMapsAuthSuccessKey));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    if (!objc_msgSend(v6, "isEqualToString:", GEOMapsAuthACToken))
    {
      if (objc_msgSend(v6, "isEqualToString:", GEOMapsAuthEnvironmentSwitch))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController requestedEnvironment](self, "requestedEnvironment"));
        objc_msgSend(v17, "makeActive");
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", GEOMapsAuthFeatureFlags))
          goto LABEL_25;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
        objc_msgSend(v17, "reloadData");
      }

      goto LABEL_25;
    }
    -[EnvironmentsViewController switchToRequestedEnvironment](self, "switchToRequestedEnvironment");
  }
  else if (objc_msgSend(v6, "isEqualToString:", GEOMapsAuthEnvironmentSwitch))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", GEOMapsAuthFailReasonKey));
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 == (id)4 || self->_hasAttemptedAuth)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", GEOMapsAuthEnvironmentKey));

      switch((unint64_t)v13)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
        case 6uLL:
          v16 = CFSTR("Invalid error");
          break;
        case 0uLL:
          v16 = CFSTR("Authentication failed for an unknown reason");
          break;
        case 1uLL:
          v16 = CFSTR("Invalid Authentication Session (MAT)");
          break;
        case 2uLL:
          v16 = CFSTR("Invalid Authentication Session (MRT)");
          break;
        case 3uLL:
          v16 = CFSTR("You do not have permissions to access this environment");
          break;
        case 4uLL:
          v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You are missing the required group access for %@. You can request access and try again when granted access."), v15);
          goto LABEL_21;
        case 5uLL:
          v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The environment %@ does not have the proper URL(s)"), v15);
LABEL_21:
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v26);
          break;
        default:
          v16 = 0;
          break;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Environment Auth Failed"), v16, 1));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
      objc_msgSend(v27, "addAction:", v28);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100BEB49C;
      v29[3] = &unk_1011AC860;
      v29[4] = self;
      -[EnvironmentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, v29);

    }
    else
    {
      self->_hasAttemptedAuth = 1;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeTileGroup"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController requestedEnvironment](self, "requestedEnvironment"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resourceManifest"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resources"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataSet"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "preferedURLSetFor:", v22));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper"));
      objc_msgSend(v23, "addMapsAuthDidFinishObserver:forRequestType:", self, GEOMapsAuthACToken);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString authProxyURL](v16, "authProxyURL"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nsURL"));
      +[MapsAppleConnectAuthViewController presentAppleConnectAuthControllerFrom:withProxyURL:](MapsAppleConnectAuthViewController, "presentAppleConnectAuthControllerFrom:withProxyURL:", self, v25);

    }
  }
LABEL_25:

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4;

  if (a3.var0 == LODWORD(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo[0])
    && a3.var1 == (void *)GeoServicesConfig_ClientAuthFeatureFlagsStateInfo[1])
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
    objc_msgSend(v4, "reloadData");

  }
}

- (void)environmentsController:(id)a3 didUpdateEnvironmentsSection:(int64_t)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a4));
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 100);

}

- (void)environmentsController:(id)a3 didUpdateEnvironmentInfo:(id)a4 inSection:(int64_t)a5
{
  GEOEnvironmentsController *environmentsController;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  environmentsController = self->_environmentsController;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentsController environmentInfosForSection:](environmentsController, "environmentInfosForSection:", a5));
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, a5));
    v14 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v11, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 100);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_showingCustomEnvironments)
    return 3;
  else
    return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  char *v7;
  unsigned int v9;
  char *v10;
  void *v11;

  if (-[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentsController environmentInfosForSection:](self->_environmentsController, "environmentInfosForSection:", a4));
    v7 = (char *)objc_msgSend(v6, "count");
    if (a4)
    {
      v9 = a4 == 1 && self->_showingCustomEnvironments;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      v9 = objc_msgSend(v11, "isInternalInstall");

    }
    v10 = &v7[v9];
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOFeaturesController features](self->_featuresController, "features"));
    v10 = (char *)objc_msgSend(v6, "count");
  }

  return (int64_t)v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 2)
    return CFSTR("If you have questions about features, please contact Maps Feature Delivery (Maps-Feature-Delivery@group.apple.com).");
  else
    return &stru_1011EB268;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BYTE *v9;
  EnvironmentTableViewCell *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
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
  _QWORD v42[4];
  id v43;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_showingCustomEnvironments && objc_msgSend(v7, "section") == (id)1)
  {
    v9 = objc_msgSend(v8, "row");
    if (v9 == (char *)-[EnvironmentsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, 1)- 1)
    {
      v10 = (EnvironmentTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v11, "setText:", CFSTR("Add Environment"));

      v12 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 5));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      objc_msgSend(v12, "setTintColor:", v13);

      objc_msgSend(v12, "setUserInteractionEnabled:", 0);
      -[EnvironmentTableViewCell setAccessoryView:](v10, "setAccessoryView:", v12);
      goto LABEL_20;
    }
  }
  if (!objc_msgSend(v8, "section"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if ((objc_msgSend(v14, "isInternalInstall") & 1) != 0)
    {
      v15 = (char *)objc_msgSend(v8, "row");
      v16 = (char *)-[EnvironmentsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, 0)- 1;

      if (v15 == v16)
      {
        v10 = (EnvironmentTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
        -[EnvironmentTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
        v12 = objc_alloc_init((Class)UILabel);
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v12, "setText:", CFSTR("Use Production URLs"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        objc_msgSend(v17, "addSubview:", v12);

        v18 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        objc_msgSend(v18, "setOn:", GEOConfigGetBOOL(GeoServicesConfig_UseProductionURLs[0], GeoServicesConfig_UseProductionURLs[1]));
        objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "_toggleUseProductionURLs:", 4096);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        objc_msgSend(v19, "addSubview:", v18);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v21 = _NSDictionaryOfVariableBindings(CFSTR("useProductionSwitch, titleLabel"), v18, v12, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[useProductionSwitch]-[titleLabel]"), 0, 0, v22));
        objc_msgSend(v20, "addConstraints:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 5, 0, v25, 17, 1.0, 0.0));
        objc_msgSend(v24, "addConstraint:", v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 10, 0, v28, 10, 1.0, 0.0));
        objc_msgSend(v27, "addConstraint:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 10, 0, v31, 10, 1.0, 0.0));
        objc_msgSend(v30, "addConstraint:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell contentView](v10, "contentView"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 6, -1, v34, 18, 1.0, 0.0));
        objc_msgSend(v33, "addConstraint:", v35);

        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  if (-[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", objc_msgSend(v8, "section")))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController _environmentForIndexPath:](self, "_environmentForIndexPath:", v8));
    if (v12)
    {
      v10 = (EnvironmentTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("EnvironmentCell")));
      if (!v10)
      {
        v10 = -[EnvironmentTableViewCell initWithReuseIdentifier:]([EnvironmentTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("EnvironmentCell"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell errorButton](v10, "errorButton"));
        objc_msgSend(v36, "addTarget:action:forControlEvents:", self, "errorButtonTapped:withEvent:", 64);

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v38, "setText:", v37);

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "releaseName"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell detailTextLabel](v10, "detailTextLabel"));
      objc_msgSend(v40, "setText:", v39);

      -[EnvironmentTableViewCell configureFromEnvironment:](v10, "configureFromEnvironment:", v12);
      goto LABEL_20;
    }
LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController _featureForIndexPath:](self, "_featureForIndexPath:", v8));
  if (!v12)
    goto LABEL_19;
  v10 = (EnvironmentTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("FeatureCell")));
  if (!v10)
    v10 = -[FeatureTableViewCell initWithReuseIdentifier:]([FeatureTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("FeatureCell"));
  -[EnvironmentTableViewCell configureFromFeature:](v10, "configureFromFeature:", v12);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100BEBE0C;
  v42[3] = &unk_1011AC860;
  v43 = v12;
  -[EnvironmentTableViewCell setToggleFeatureBlock:](v10, "setToggleFeatureBlock:", v42);

LABEL_20:
  return v10;
}

- (void)switchToRequestedEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t String;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeTileGroup"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController requestedEnvironment](self, "requestedEnvironment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferedURLSetFor:", v7));

  String = GEOConfigGetString(GeoServicesConfig_MapsAuthUseProxy[0], GeoServicesConfig_MapsAuthUseProxy[1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(String);
  if ((objc_msgSend(v10, "isEqualToString:", GEOMapsAuthUseProxyNever) & 1) == 0
    && ((objc_msgSend(v8, "hasAuthProxyURL") & 1) != 0
     || objc_msgSend(v10, "isEqualToString:", GEOMapsAuthUseProxyAlways)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authProxyURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsURL"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper"));
    objc_msgSend(v13, "addMapsAuthDidFinishObserver:forRequestType:", self, GEOMapsAuthEnvironmentSwitch);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController requestedEnvironment](self, "requestedEnvironment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    objc_msgSend(v13, "doEnvironmentSwitchCheck:authProxyURL:suppressNotification:", v15, v12, 1);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController requestedEnvironment](self, "requestedEnvironment"));
    objc_msgSend(v12, "makeActive");
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  char *v9;
  _BYTE *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if ((objc_msgSend(v7, "isInternalInstall") & 1) != 0)
    {
      v8 = (char *)objc_msgSend(v6, "row");
      v9 = (char *)-[EnvironmentsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v14, 0)- 1;

      if (v8 == v9)
        goto LABEL_13;
    }
    else
    {

    }
  }
  if (self->_showingCustomEnvironments
    && objc_msgSend(v6, "section") == (id)1
    && (v10 = objc_msgSend(v6, "row"),
        v10 == (char *)-[EnvironmentsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v14, 1)- 1))
  {
    -[EnvironmentsViewController _addSimpleEnvironmentFor:atIndexPath:](self, "_addSimpleEnvironmentFor:atIndexPath:", v14, v6);
  }
  else if (-[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", objc_msgSend(v6, "section")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController _environmentForIndexPath:](self, "_environmentForIndexPath:", v6));
    -[EnvironmentsViewController setRequestedEnvironment:](self, "setRequestedEnvironment:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController requestedEnvironment](self, "requestedEnvironment"));
    v13 = objc_msgSend(v12, "state");

    if (v13 == (id)2)
      -[EnvironmentsViewController switchToRequestedEnvironment](self, "switchToRequestedEnvironment");
  }
LABEL_13:

}

- (void)_addSimpleEnvironmentFor:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100BEC250;
  v9[3] = &unk_1011AE420;
  v9[4] = self;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EnvironmentsCreationAlertController alertControllerWithTitle:message:nameSelectionHandler:](EnvironmentsCreationAlertController, "alertControllerWithTitle:message:nameSelectionHandler:", CFSTR("Add Environment"), CFSTR("What's the name of the environment you would like to add?"), v9));
  -[EnvironmentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  unsigned int v5;
  void *v6;
  void *v7;
  EnvironmentInfoViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  v13 = a4;
  v5 = -[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", objc_msgSend(v13, "section"));
  v6 = v13;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController _environmentForIndexPath:](self, "_environmentForIndexPath:", v13));
    if (objc_msgSend(v7, "state") == (id)3)
    {
      v8 = (EnvironmentInfoViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLoadingError"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController description](v8, "description"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error"), v9, 1));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
      objc_msgSend(v10, "addAction:", v11);

      -[EnvironmentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
    }
    else
    {
      if (objc_msgSend(v7, "state") != (id)2)
      {
LABEL_10:

        v6 = v13;
        goto LABEL_11;
      }
      v12 = self->_showingCustomEnvironments && objc_msgSend(v13, "section") == (id)1;
      v8 = -[EnvironmentInfoViewController initWithStyle:environment:editable:]([EnvironmentInfoViewController alloc], "initWithStyle:environment:editable:", 1, v7, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController navigationController](self, "navigationController"));
      objc_msgSend(v10, "pushViewController:animated:", v8, 1);
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_showingCustomEnvironments && objc_msgSend(v7, "section") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentsController environmentInfosForSection:](self->_environmentsController, "environmentInfosForSection:", 1));
    v10 = objc_msgSend(v8, "row");
    v11 = v10 < objc_msgSend(v9, "count");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a4 == 1)
  {
    if (a5)
    {
      v6 = a5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
      objc_msgSend(v7, "beginUpdates");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentsController environmentInfosForSection:](self->_environmentsController, "environmentInfosForSection:", 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      objc_msgSend(v9, "delete");
      -[GEOEnvironmentsController removeCustomEnvironment:](self->_environmentsController, "removeCustomEnvironment:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
      v13 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

      objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 100);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView"));
      objc_msgSend(v12, "endUpdates");

    }
  }
}

- (void)featuresControllerDidReloadFeatureList:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_showingCustomEnvironments)
    v3 = 2;
  else
    v3 = 1;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentsViewController tableView](self, "tableView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v3));
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v4, 100);

}

- (GEOEnvironmentInfo)requestedEnvironment
{
  return self->_requestedEnvironment;
}

- (void)setRequestedEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_requestedEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedEnvironment, 0);
  objc_storeStrong((id *)&self->_featuresController, 0);
  objc_storeStrong((id *)&self->_environmentsController, 0);
}

@end
