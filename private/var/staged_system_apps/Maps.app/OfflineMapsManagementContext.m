@implementation OfflineMapsManagementContext

- (OfflineMapsManagementContext)init
{
  OfflineMapsManagementContext *v2;
  OfflineMapsManagementViewController *v3;
  OfflineMapsManagementViewController *offlineMapsManagementViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineMapsManagementContext;
  v2 = -[OfflineMapsManagementContext init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(OfflineMapsManagementViewController);
    offlineMapsManagementViewController = v2->_offlineMapsManagementViewController;
    v2->_offlineMapsManagementViewController = v3;

    -[OfflineMapsManagementViewController setDelegate:](v2->_offlineMapsManagementViewController, "setDelegate:", v2);
  }
  return v2;
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (id)desiredCards
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_offlineMapsManagementViewController)
    objc_msgSend(v3, "addObject:");
  if (self->_expiredMapsManagementViewController)
    objc_msgSend(v4, "addObject:");
  if (self->_searchViewController)
    objc_msgSend(v4, "addObject:");
  if (self->_detailsViewController)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100BFBF8C;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addPreparation:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper", a3, a4));
  objc_msgSend(v4, "startMonitoringPairedDeviceSubscriptionStates");

}

- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper", a3, a4));
  objc_msgSend(v4, "stopMonitoringPairedDeviceSubscriptionStates");

}

- (void)dismiss
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext iosChromeViewController](self, "iosChromeViewController"));
  v4 = objc_msgSend(v3, "isCurrentContext:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext iosChromeViewController](self, "iosChromeViewController"));
  v10 = v5;
  if (v4)
  {
    objc_msgSend(v5, "popContextAnimated:completion:", 1, 0);
    v6 = v10;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contexts"));
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObject:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext iosChromeViewController](self, "iosChromeViewController"));
    objc_msgSend(v9, "setContexts:animated:completion:", v8, 0, 0);

    v6 = v8;
  }

}

- (void)presentExpiredMapsManagement
{
  OfflineMapsManagementExpiredViewController *v3;
  OfflineMapsManagementExpiredViewController *expiredMapsManagementViewController;
  id v5;

  v3 = objc_alloc_init(OfflineMapsManagementExpiredViewController);
  expiredMapsManagementViewController = self->_expiredMapsManagementViewController;
  self->_expiredMapsManagementViewController = v3;

  -[OfflineMapsManagementExpiredViewController setDelegate:](self->_expiredMapsManagementViewController, "setDelegate:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)closeExpiredMapsManagement
{
  OfflineMapsManagementExpiredViewController *expiredMapsManagementViewController;
  id v4;

  expiredMapsManagementViewController = self->_expiredMapsManagementViewController;
  self->_expiredMapsManagementViewController = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)presentAddNewMapSearchAutocomplete
{
  void *v3;
  void *v4;
  OfflineMapsManagementSearchAutocompleteViewController *v5;
  OfflineMapsManagementSearchAutocompleteViewController *searchViewController;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertControllerForAttemptedRegionDownload"));

  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    v5 = objc_alloc_init(OfflineMapsManagementSearchAutocompleteViewController);
    searchViewController = self->_searchViewController;
    self->_searchViewController = v5;

    -[OfflineMapsManagementSearchAutocompleteViewController setDelegate:](self->_searchViewController, "setDelegate:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);
  }

}

- (void)closeAddNewMapSearchAutocomplete
{
  OfflineMapsManagementSearchAutocompleteViewController *searchViewController;
  id v4;

  searchViewController = self->_searchViewController;
  self->_searchViewController = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)presentOfflineMapDetailsForSubscriptionInfo:(id)a3
{
  id v4;
  OfflineMapDetailsViewController *v5;
  OfflineMapDetailsViewController *detailsViewController;
  id v7;

  v4 = a3;
  v5 = -[OfflineMapDetailsViewController initWithSubscriptionInfo:]([OfflineMapDetailsViewController alloc], "initWithSubscriptionInfo:", v4);

  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = v5;

  -[OfflineMapDetailsViewController setDelegate:](self->_detailsViewController, "setDelegate:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)resumeDownloadingForSubscriptionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertControllerForAttemptedRegionDownload"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "_maps_topMostPresentViewController:animated:completion:", v6, 1, 0);
LABEL_9:

    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v9 = objc_msgSend(v8, "cellularBehaviorForDownloadOfSize:forForcedDownload:", -1, 1);

  if (v9 == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v7 = v10;
    v11 = v4;
    v12 = 1;
    goto LABEL_8;
  }
  if (v9 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayName"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100BFC5A4;
    v18[3] = &unk_1011AE8F8;
    v19 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alertControllerForCellularDownloadConfirmationForRegionName:size:actionHandler:", v15, -1, v18));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v17, "_maps_topMostPresentViewController:animated:completion:", v16, 1, 0);

    goto LABEL_10;
  }
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v7 = v10;
    v11 = v4;
    v12 = 0;
LABEL_8:
    objc_msgSend(v10, "resumeDownloadForSubscriptionInfo:mode:", v11, v12);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)restoreExpiredSubscriptions:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  _QWORD block[4];
  void (**v19)(id, _QWORD);
  _QWORD *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[3];
  char v29;
  _BYTE v30[128];

  v15 = a3;
  v16 = (void (**)(id, _QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertControllerForAttemptedRegionDownload"));

  if (v17)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "_maps_topMostPresentViewController:animated:completion:", v17, 1, 0);

    if (v16)
      v16[2](v16, 0);
  }
  else
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 1;
    v8 = dispatch_group_create();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v15;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12);
          dispatch_group_enter(v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100BFC8B0;
          v21[3] = &unk_1011E8F28;
          v23 = v28;
          v22 = v8;
          objc_msgSend(v14, "restoreExpiredSubscription:completionHandler:", v13, v21);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v10);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BFC8C8;
    block[3] = &unk_1011AE540;
    v19 = v16;
    v20 = v28;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v28, 8);
  }

}

- (void)startUpdatingOfflineSubscriptions
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BFC960;
  v4[3] = &unk_1011AE168;
  v4[4] = self;
  objc_msgSend(v3, "fetchAllSubscriptionInfosWithCompletion:", v4);

}

- (void)closeOfflineMapDetails
{
  OfflineMapDetailsViewController *detailsViewController;
  id v4;

  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)presentRenameOfflineMapForSubscriptionInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100BFCF90;
  v16[3] = &unk_1011AFAB0;
  v17 = v6;
  v18 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100BFD13C;
  v14[3] = &unk_1011ADA00;
  v15 = v18;
  v10 = v18;
  v11 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext renameOfflineMapControllerForDefaultText:saveHandler:cancelHandler:](self, "renameOfflineMapControllerForDefaultText:saveHandler:cancelHandler:", v9, v16, v14));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v13, "_maps_topMostPresentViewController:animated:completion:", v12, 1, 0);

}

- (id)renameOfflineMapControllerForDefaultText:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
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
  id v20;
  void *v21;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v7 = a3;
  v23 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Rename Map alert title"), CFSTR("localized string not found"), CFSTR("Offline")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v25, 0, 1));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100BFD400;
  v31[3] = &unk_1011C8DE8;
  v32 = v7;
  v24 = v7;
  objc_msgSend(v10, "addTextFieldWithConfigurationHandler:", v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textFields"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Cancel - Rename Map alert button"), CFSTR("localized string not found"), CFSTR("Offline")));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100BFD45C;
  v29[3] = &unk_1011AD960;
  v30 = v8;
  v15 = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, v29));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Save - Rename Map alert button"), CFSTR("localized string not found"), CFSTR("Offline")));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100BFD470;
  v26[3] = &unk_1011AF938;
  v27 = v12;
  v28 = v23;
  v19 = v12;
  v20 = v23;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v26));

  objc_msgSend(v10, "addAction:", v16);
  objc_msgSend(v10, "addAction:", v21);
  objc_msgSend(v10, "setPreferredAction:", v21);

  return v10;
}

- (void)presentOfflineMapRegionSelectorForRegion:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  OfflineRegionSelectorContext *v9;
  OfflineRegionSelectorContext *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertControllerForAttemptedRegionDownload"));

  v9 = (OfflineRegionSelectorContext *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  v10 = v9;
  if (v8)
  {
    -[OfflineRegionSelectorContext _maps_topMostPresentViewController:animated:completion:](v9, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);
LABEL_5:

    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext topContext](v9, "topContext"));
  v12 = objc_opt_class(OfflineRegionSelectorContext);
  isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  if ((isKindOfClass & 1) == 0)
  {
    v10 = -[OfflineRegionSelectorContext initWithRegion:name:]([OfflineRegionSelectorContext alloc], "initWithRegion:name:", v15, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v14, "pushContext:animated:completion:", v10, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)presentOfflineMapRegionSelectorForSubscriptionInfo:(id)a3
{
  void *v4;
  void *v5;
  OfflineRegionSelectorContext *v6;
  OfflineRegionSelectorContext *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertControllerForAttemptedRegionDownload"));

  v6 = (OfflineRegionSelectorContext *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  v7 = v6;
  if (v5)
  {
    -[OfflineRegionSelectorContext _maps_topMostPresentViewController:animated:completion:](v6, "_maps_topMostPresentViewController:animated:completion:", v5, 1, 0);
LABEL_5:

    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorContext topContext](v6, "topContext"));
  v9 = objc_opt_class(OfflineRegionSelectorContext);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0)
  {
    v7 = -[OfflineRegionSelectorContext initWithSubscriptionInfo:]([OfflineRegionSelectorContext alloc], "initWithSubscriptionInfo:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v11, "pushContext:animated:completion:", v7, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)setSyncToWatch:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  void *v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, int, char);
  void *v14;
  void (**v15)(id, uint64_t);
  char v16;

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (v4)
  {
    GEOConfigSetBOOL(GeoOfflineConfig_SyncToWatchEnabled[0], GeoOfflineConfig_SyncToWatchEnabled[1], 1);
    v6[2](v6, 1);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100BFD880;
    v14 = &unk_1011E8F98;
    v8 = v6;
    v15 = v8;
    v16 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertControllerForDisableSyncToWatchWithActionHandler:", &v11));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController", v11, v12, v13, v14));
      objc_msgSend(v10, "_maps_topMostPresentViewController:animated:completion:", v9, 1, 0);

    }
    else
    {
      GEOConfigSetBOOL(GeoOfflineConfig_SyncToWatchEnabled[0], GeoOfflineConfig_SyncToWatchEnabled[1], 0);
      v8[2](v8, 1);
    }

  }
}

- (void)showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertControllerForInsufficientDiskSpaceOnPairedDeviceForDownloadSize:", a3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_expiredMapsManagementViewController, 0);
  objc_storeStrong((id *)&self->_offlineMapsManagementViewController, 0);
}

@end
