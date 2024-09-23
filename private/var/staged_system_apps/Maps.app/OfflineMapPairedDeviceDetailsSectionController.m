@implementation OfflineMapPairedDeviceDetailsSectionController

+ (id)_keyPathsToObserve
{
  return &off_1012737E8;
}

- (OfflineMapPairedDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3 device:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  OfflineMapPairedDeviceDetailsSectionController *v11;
  OfflineMapPairedDeviceDetailsSectionController *v12;
  objc_super v14;

  v7 = a4;
  v8 = NRDevicePropertyName;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", v8));
  v14.receiver = self;
  v14.super_class = (Class)OfflineMapPairedDeviceDetailsSectionController;
  v11 = -[OfflineMapDeviceDetailsSectionController initWithSubscriptionInfo:deviceName:](&v14, "initWithSubscriptionInfo:deviceName:", v9, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v12 = v11;
  }

  return v11;
}

- (id)_subscriptionState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pairedDeviceState"));

  return v3;
}

- (id)_actions
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  FooterContaineeAction *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(id *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapPairedDeviceDetailsSectionController _subscriptionState](self, "_subscriptionState"));
  v5 = v4;
  if (!v4)
  {
    v11 = objc_alloc_init(FooterContaineeAction);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MAP_DETAILS_ADD_TO_WATCH_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[SimpleContaineeAction setTitle:](v11, "setTitle:", v17);

    -[SimpleContaineeAction setStyle:](v11, "setStyle:", 0);
    -[FooterContaineeAction setCellStyle:](v11, "setCellStyle:", 1);
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_10053CC90;
    v26 = &unk_1011BAB10;
    v14 = &v27;
    objc_copyWeak(&v27, &location);
    -[FooterContaineeAction setActionBlock:](v11, "setActionBlock:", &v23);
    -[SimpleContaineeAction setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("DownloadToWatchButton"), v23, v24, v25, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](v11, "title"));
    -[FooterContaineeAction setAccessibilityLabel:](v11, "setAccessibilityLabel:", v18);

    objc_msgSend(v3, "addObject:", v11);
    goto LABEL_12;
  }
  v6 = (char *)objc_msgSend(v4, "loadState");
  if ((unint64_t)(v6 - 1) < 2)
  {
    v11 = objc_alloc_init(FooterContaineeAction);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MAP_DETAILS_DELETE_FROM_WATCH_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[SimpleContaineeAction setTitle:](v11, "setTitle:", v20);

    -[SimpleContaineeAction setStyle:](v11, "setStyle:", 1);
    -[FooterContaineeAction setCellStyle:](v11, "setCellStyle:", 1);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10053CC18;
    v28[3] = &unk_1011BAB10;
    v14 = &v29;
    objc_copyWeak(&v29, &location);
    -[FooterContaineeAction setActionBlock:](v11, "setActionBlock:", v28);
    -[SimpleContaineeAction setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("DeleteFromWatchButton"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](v11, "title"));
    -[FooterContaineeAction setAccessibilityLabel:](v11, "setAccessibilityLabel:", v21);

    objc_msgSend(v3, "addObject:", v11);
    goto LABEL_12;
  }
  if (!v6 || v6 == (char *)3)
  {
    v7 = (unint64_t)objc_msgSend(v5, "downloadState");
    if (v7 <= 5 && ((1 << v7) & 0x39) != 0)
    {
      if (objc_msgSend(v5, "downloadState") != (id)5
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo")),
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", GEOMapDataSubscriptionStateWaitingReasonKey)),
            v10 = objc_msgSend(v9, "unsignedIntegerValue"),
            v9,
            v8,
            (v10 & 8) == 0))
      {
        v11 = objc_alloc_init(FooterContaineeAction);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MAP_DETAILS_DOWNLOAD_NOW_WATCH_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
        -[SimpleContaineeAction setTitle:](v11, "setTitle:", v13);

        -[SimpleContaineeAction setStyle:](v11, "setStyle:", 0);
        -[FooterContaineeAction setCellStyle:](v11, "setCellStyle:", 1);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10053CB84;
        v30[3] = &unk_1011BAB10;
        v14 = &v31;
        objc_copyWeak(&v31, &location);
        -[FooterContaineeAction setActionBlock:](v11, "setActionBlock:", v30);
        -[SimpleContaineeAction setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("DownloadNowWatchButton"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](v11, "title"));
        -[FooterContaineeAction setAccessibilityLabel:](v11, "setAccessibilityLabel:", v15);

        objc_msgSend(v3, "addObject:", v11);
LABEL_12:
        objc_destroyWeak(v14);

      }
    }
  }

  objc_destroyWeak(&location);
  return v3;
}

- (void)_didStopDownload
{
  void *v3;
  id v4;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 483, 112, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceDetailsSectionController actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  objc_msgSend(v4, "offlineMapDetailsActionSectionControllerDidSelectRemoveFromPairedDevice:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
