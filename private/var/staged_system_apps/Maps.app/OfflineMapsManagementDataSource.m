@implementation OfflineMapsManagementDataSource

- (OfflineMapsManagementDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  OfflineMapsManagementDataSource *v4;
  OfflineMapsManagementDataSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementDataSource;
  v4 = -[DataSource initWithCollectionView:updateLocation:](&v7, "initWithCollectionView:updateLocation:", a3, a4);
  v5 = v4;
  if (v4)
    -[OfflineMapsManagementDataSource commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  id v3;
  OfflineMapsSuggestionsDataProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id autoupdateFrequencyBucketsListener;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;

  v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  -[OfflineMapsManagementDataSource setSubscriptionManager:](self, "setSubscriptionManager:", v3);

  v4 = -[OfflineMapsSuggestionsDataProvider initWithClientType:callbackQueue:]([OfflineMapsSuggestionsDataProvider alloc], "initWithClientType:callbackQueue:", 2, &_dispatch_main_q);
  -[OfflineMapsManagementDataSource setSuggestionsProvider:](self, "setSuggestionsProvider:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  +[MapsDebugTableRow registerCellsInCollectionView:](MapsDebugTableRow, "registerCellsInCollectionView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v8 = objc_opt_class(TwoLinesCollectionViewInsetGroupedListCell);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v11 = objc_opt_class(OfflineEmptyStateCollectionViewCell);
  v12 = (objc_class *)objc_opt_class(OfflineEmptyStateCollectionViewCell);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v16 = objc_opt_class(SectionHeaderCollectionReusableView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
  objc_msgSend(v15, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v16, UICollectionElementKindSectionHeader, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v19 = objc_opt_class(UserProfileSectionFooterView);
  v20 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v18, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v19, UICollectionElementKindSectionFooter, v22);

  v23 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v25 = sub_10046DA38(self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = objc_msgSend(v23, "initWithCollectionView:cellProvider:", v24, v26);
  -[OfflineMapsManagementDataSource setDiffableDataSource:](self, "setDiffableDataSource:", v27);

  v28 = sub_10046DBB0(self);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v30, "setSupplementaryViewProvider:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  self->_hasSubscriptionsNeedingUpdate = objc_msgSend(v31, "hasSubscriptionsNeedingUpdate");

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  self->_hasInProgressUpdate = objc_msgSend(v32, "hasSubscriptionsBeingUpdated");

  objc_initWeak(&location, self);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100506798;
  v43[3] = &unk_1011AD9D0;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v33, "fetchAllSubscriptionInfosWithCompletion:", v43);

  -[OfflineMapsManagementDataSource _fetchExpiredSubscriptionsAnimated:](self, "_fetchExpiredSubscriptionsAnimated:", 0);
  -[OfflineMapsManagementDataSource _fetchLastUpdatedDateAnimated:](self, "_fetchLastUpdatedDateAnimated:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource suggestionsProvider](self, "suggestionsProvider"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10050680C;
  v41[3] = &unk_1011B07A0;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v34, "offlineSuggestionsForLocation:completion:", v35, v41);

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100506868;
  v39[3] = &unk_1011B98E0;
  objc_copyWeak(&v40, &location);
  v36 = _GEOConfigAddBlockListenerForKey(GeoOfflineConfig_AutomaticUpdatesFrequencyBuckets[0], GeoOfflineConfig_AutomaticUpdatesFrequencyBuckets[1], &_dispatch_main_q, v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  autoupdateFrequencyBucketsListener = self->_autoupdateFrequencyBucketsListener;
  self->_autoupdateFrequencyBucketsListener = v37;

  _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_AutomaticUpdatesEnabled[0], GeoOfflineConfig_AutomaticUpdatesEnabled[1], &_dispatch_main_q, self);
  _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageEnabled[0], GeoOfflineConfig_OptimizeStorageEnabled[1], &_dispatch_main_q, self);

  _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_SyncToWatchEnabled[0], GeoOfflineConfig_SyncToWatchEnabled[1], &_dispatch_main_q, self);
  _GEOConfigAddDelegateListenerForKey(MapsConfig_OfflineOnlyData, off_1014B4C08, &_dispatch_main_q, self);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  GEOConfigRemoveBlockListener(self->_autoupdateFrequencyBucketsListener, a2);
  GEOConfigRemoveDelegateListenerForAllKeys(self, v3);
  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsManagementDataSource;
  -[OfflineMapsManagementDataSource dealloc](&v4, "dealloc");
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementDataSource;
  -[DataSource setActive:](&v7, "setActive:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObserver:", self);
  else
    objc_msgSend(v5, "removeObserver:", self);

}

- (id)sectionForSectionIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource sections](self, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource sections](self, "sections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a3));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)swipeActionsConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  _QWORD v28[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  v7 = objc_opt_class(MapDataSubscriptionInfo);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8 = v6;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100506C20;
    v24[3] = &unk_1011B9930;
    objc_copyWeak(&v26, &location);
    v9 = v8;
    v25 = v9;
    v10 = sub_100A3CEB8(v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100506EB4;
    v21 = &unk_1011B9930;
    objc_copyWeak(&v23, &location);
    v12 = v9;
    v22 = v12;
    v13 = sub_100A3D1D0(&v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v28[0] = v11;
    v28[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2, v18, v19, v20, v21));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v15));

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_updateContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int BOOL;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSUInteger v10;
  OfflineMapsManagementSection *v11;
  void *v12;
  void *v13;
  int v14;
  OfflineMapsManagementSection *v15;
  void *v16;
  void *v17;
  OfflineMapsManagementSection *downloadedAndExpiredSection;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  OfflineMapsManagementSection *v23;
  OfflineMapsManagementSection *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void **v29;
  OfflineMapsManagementSection *v30;
  OfflineMapsManagementSection *actionButtonsSection;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  unint64_t UInteger;
  uint64_t v43;
  OfflineMapsManagementSection *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  OfflineMapsManagementSection *v50;
  OfflineMapsManagementSection *v51;
  void *v52;
  uint64_t v53;
  OfflineMapsManagementSection *forceOfflineSection;
  void *v55;
  void *v56;
  id v57;
  unint64_t updated;
  uint64_t v59;
  OfflineMapsManagementSection *settingsSection;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  unsigned int v67;
  void *v68;
  void **v69;
  void *v70;
  OfflineMapsManagementSection *v71;
  OfflineMapsManagementSection *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  OfflineMapsManagementSection *v82;
  void *v83;
  void *v84;
  _QWORD v85[2];
  uint64_t v86;
  OfflineMapsManagementSection *v87;
  OfflineMapsManagementSection *v88;
  void *v89;
  OfflineMapsManagementSection *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  OfflineMapsManagementSection *v95;
  void *v96;
  void *v97;
  OfflineMapsManagementSection *v98;
  OfflineMapsManagementSection *v99;
  const __CFString *v100;
  OfflineMapsManagementSection *v101;

  v3 = a3;
  v5 = GEOSupportsOfflineMaps(self, a2);
  BOOL = GEOConfigGetBOOL(GeoOfflineConfig_OfflineSupportDeprecated[0], GeoOfflineConfig_OfflineSupportDeprecated[1]);
  v7 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionInfos](self, "subscriptionInfos"));
    v9 = objc_msgSend(v8, "count") != 0;

  }
  else
  {
    v9 = 0;
  }
  v10 = -[NSArray count](self->_expiredSubscriptions, "count");
  if (MapsFeature_IsEnabled_StandaloneWatchOffline()
    && (((v5 | BOOL) ^ 1 | v9) & 1) == 0
    && self->_hasFetchedInitialSubscriptions)
  {
    v11 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 0);
    v101 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v101, 1));
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", v12);

    v100 = CFSTR("EmptyState");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v11);

  }
  if (v10)
    v14 = 1;
  else
    v14 = v9;
  if (v14 == 1)
  {
    if (v9)
    {
      v15 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 1);
      v99 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v99, 1));
      objc_msgSend(v7, "appendSectionsWithIdentifiers:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionInfos](self, "subscriptionInfos"));
      objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, v15);

      objc_storeStrong((id *)&self->_downloadedAndExpiredSection, v15);
      if (!v10)
      {
LABEL_20:

        goto LABEL_21;
      }
      if (v15)
      {
LABEL_18:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _expiredMapsModel](self, "_expiredMapsModel"));
        v97 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v97, 1));
        objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v21, v15);

        v96 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
        objc_msgSend(v7, "reconfigureItemsWithIdentifiers:", v22);

        goto LABEL_20;
      }
    }
    else
    {
      downloadedAndExpiredSection = self->_downloadedAndExpiredSection;
      self->_downloadedAndExpiredSection = 0;

      if (!v10)
      {
        v15 = 0;
        goto LABEL_20;
      }
    }
    v15 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 2);
    v98 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v98, 1));
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", v19);

    goto LABEL_18;
  }
LABEL_21:
  if (v9 || (MapsFeature_IsEnabled_StandaloneWatchOffline() & 1) == 0)
  {
    if (!v5)
    {
      if (GEOConfigGetBOOL(GeoOfflineConfig_OfflineSupportDeprecated[0], GeoOfflineConfig_OfflineSupportDeprecated[1]))
      {
        v30 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 3);
        actionButtonsSection = self->_actionButtonsSection;
        self->_actionButtonsSection = v30;

        v90 = self->_actionButtonsSection;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v90, 1));
        objc_msgSend(v7, "appendSectionsWithIdentifiers:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _downloadNewMapModel](self, "_downloadNewMapModel"));
        v89 = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
        objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v34, self->_actionButtonsSection);

      }
      goto LABEL_46;
    }
    v23 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 3);
    v24 = self->_actionButtonsSection;
    self->_actionButtonsSection = v23;

    v95 = self->_actionButtonsSection;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _downloadNewMapModel](self, "_downloadNewMapModel"));
    v94 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v27, self->_actionButtonsSection);

    if (self->_hasSubscriptionsNeedingUpdate)
    {
      if (self->_hasInProgressUpdate)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _disabledUpdateAllModel](self, "_disabledUpdateAllModel"));
        v93 = v28;
        v29 = &v93;
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _updateAllModel](self, "_updateAllModel"));
        v92 = v28;
        v29 = &v92;
      }
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionInfos](self, "subscriptionInfos"));
      v36 = objc_msgSend(v35, "count");

      if (!v36)
        goto LABEL_35;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _disabledUpdateAllModel](self, "_disabledUpdateAllModel"));
      v91 = v28;
      v29 = &v91;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 1));
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v37, self->_actionButtonsSection);

  }
  else if ((v5 & 1) == 0)
  {
LABEL_46:
    settingsSection = self->_settingsSection;
    self->_settingsSection = 0;

    forceOfflineSection = self->_forceOfflineSection;
    self->_forceOfflineSection = 0;
    goto LABEL_59;
  }
LABEL_35:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource suggestedRegions](self, "suggestedRegions"));
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource suggestedRegions](self, "suggestedRegions"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_geo_filtered:", &stru_1011B9990));

    if (objc_msgSend(v41, "count"))
    {
      UInteger = GEOConfigGetUInteger(MapsConfig_OfflineSuggestedRegionsMaxCount, off_1014B4E38);
      if ((unint64_t)objc_msgSend(v41, "count") > UInteger)
      {
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "subarrayWithRange:", 0, UInteger));

        v41 = (void *)v43;
      }
      v44 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 4);
      v88 = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
      objc_msgSend(v7, "appendSectionsWithIdentifiers:", v45);

      objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v41, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v41, "count")));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringValue"));
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 397, 88, v47);

    }
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionInfos](self, "subscriptionInfos"));
  v49 = objc_msgSend(v48, "count");

  if (!v49)
    goto LABEL_46;
  v50 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 5);
  v51 = self->_settingsSection;
  self->_settingsSection = v50;

  v87 = self->_settingsSection;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", v52);

  v53 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _downloadSettingsModel](self, "_downloadSettingsModel"));
  forceOfflineSection = (OfflineMapsManagementSection *)v53;
  if (v53)
  {
    v86 = v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v55, self->_settingsSection);

  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v57 = objc_msgSend(v56, "totalOfflineDataSize");
  updated = GEOMaximumAutomaticUpdateOfflineDataSize();

  if ((unint64_t)v57 <= updated)
    v59 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _automaticUpdatesModel](self, "_automaticUpdatesModel"));
  else
    v59 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _disabledAutomaticUpdatesModel](self, "_disabledAutomaticUpdatesModel"));
  v61 = (void *)v59;
  v85[0] = v59;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _optimizeStorageModel](self, "_optimizeStorageModel"));
  v85[1] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 2));
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v63, self->_settingsSection);

  if (MapsFeature_IsEnabled_StandaloneWatchOffline())
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "getActivePairedDeviceExcludingAltAccount"));

    if (v65)
    {
      v66 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"));
      v67 = objc_msgSend(v65, "supportsCapability:", v66);

      if (v67)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _syncToWatchModel](self, "_syncToWatchModel"));
        v84 = v68;
        v69 = &v84;
      }
      else
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _disabledSyncToWatchModel](self, "_disabledSyncToWatchModel"));
        v83 = v68;
        v69 = &v83;
      }
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 1));
      objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v70, self->_settingsSection);

    }
  }
  v71 = -[OfflineMapsManagementSection initWithSectionType:]([OfflineMapsManagementSection alloc], "initWithSectionType:", 6);
  v72 = self->_forceOfflineSection;
  self->_forceOfflineSection = v71;

  v82 = self->_forceOfflineSection;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v74, "hasFullyLoadedSubscriptions"))
    v75 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _forceOfflineModel](self, "_forceOfflineModel"));
  else
    v75 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _disabledForceOfflineModel](self, "_disabledForceOfflineModel"));
  v76 = (void *)v75;
  v81 = v75;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v77, self->_forceOfflineSection);

LABEL_59:
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifiers"));
  -[OfflineMapsManagementDataSource setSections:](self, "setSections:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v79, "applySnapshot:animatingDifferences:", v7, v3);

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v80, "dataSourceUpdated:", self);

}

- (void)_fetchLastUpdatedDateAnimated:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionManager](self, "subscriptionManager"));
  v6 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100507AC0;
  v7[3] = &unk_1011B99B8;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  objc_msgSend(v5, "fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:completionHandler:", &_dispatch_main_q, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_fetchExpiredSubscriptionsAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;
  void *v13;

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@*"), CFSTR("com.apple.Maps.offline.")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionManager](self, "subscriptionManager"));
  v13 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100507D54;
  v9[3] = &unk_1011B99E0;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  objc_msgSend(v6, "fetchExpiredSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", v7, &_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_canItemIdentifierBeSelected:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = objc_opt_class(OfflineMapsManagementCellModel);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableRow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionAction"));
    v7 = v6 != 0;

  }
  else
  {
    v8 = objc_opt_class(MapDataSubscriptionInfo);
    v7 = 0;
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "state"));
      v10 = objc_msgSend(v9, "loadState");

      if (v10)
        v7 = 1;
    }
  }

  return v7;
}

- (void)_showPairedDeviceDiskSpaceDialogIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  double Double;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  OfflineMapsManagementDataSource *val;
  uint64_t v28;
  _QWORD v29[4];
  id v30[2];
  id location[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  if ((GEOConfigGetBOOL(MapsConfig_OffinePairedDeviceDiskSpaceAlertEnabled, off_1014B45D8) & 1) != 0)
  {
    val = self;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getActivePairedDeviceExcludingAltAccount"));

    if (v28)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionInfos"));

      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v6)
      {
        v7 = 0;
        v8 = 0;
        v9 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v9)
              objc_enumerationMutation(v5);
            v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pairedDeviceState"));
            if (v12)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pairedDeviceState"));
              v14 = objc_msgSend(v13, "downloadState") == 0;

              if (!v14)
              {
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "state"));
                v16 = objc_msgSend(v15, "downloadedDataSize");

                v7 += (uint64_t)v16;
              }
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "state"));
            v18 = objc_msgSend(v17, "downloadState") == (id)2;

            v8 |= v18;
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v6);

        if ((v8 & 1) != 0)
        {
          Double = GEOConfigGetDouble(GeoOfflineConfig_DownloadAvailableDiskCapacityAdditionalMultiplier[0], GeoOfflineConfig_DownloadAvailableDiskCapacityAdditionalMultiplier[1]);
          objc_initWeak(location, val);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1005082C4;
          v29[3] = &unk_1011B9A08;
          objc_copyWeak(v30, location);
          v30[1] = (id)(v7 + (uint64_t)(Double * (double)v7));
          objc_msgSend(v20, "getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:", v29);

          objc_destroyWeak(v30);
          objc_destroyWeak(location);
LABEL_24:
          v22 = v28;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v25 = sub_100431D5C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "No map is currently downloading, will not calculate paired device low disk space alert", (uint8_t *)location, 2u);
      }

      goto LABEL_24;
    }
    v23 = sub_100431D5C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "No paired device, will not show disk space alert.", (uint8_t *)location, 2u);
    }

    v22 = 0;
  }
  else
  {
    v21 = sub_100431D5C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Maps config has disabled the disk space alert, will not attempt to display.", (uint8_t *)location, 2u);
    }
  }
LABEL_25:

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3.var0 == (_DWORD)MapsConfig_OfflineMapDownloadsAllowCellular && a3.var1 == off_1014B4F48;
  if (v4
    || (a3.var0 == LODWORD(GeoOfflineConfig_AutomaticUpdatesEnabled[0])
      ? (v5 = a3.var1 == (void *)GeoOfflineConfig_AutomaticUpdatesEnabled[1])
      : (v5 = 0),
        v5
     || (a3.var0 == LODWORD(GeoOfflineConfig_OptimizeStorageEnabled[0])
       ? (v6 = a3.var1 == (void *)GeoOfflineConfig_OptimizeStorageEnabled[1])
       : (v6 = 0),
         v6
      || (a3.var0 == LODWORD(GeoOfflineConfig_SyncToWatchEnabled[0])
        ? (v7 = a3.var1 == (void *)GeoOfflineConfig_SyncToWatchEnabled[1])
        : (v7 = 0),
          v7 || (a3.var0 == (_DWORD)MapsConfig_OfflineOnlyData ? (v8 = a3.var1 == off_1014B4C08) : (v8 = 0), v8)))))
  {
    if (self->_settingsSection)
    {
      if (self->_forceOfflineSection)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshot"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifiersInSectionWithIdentifier:", self->_settingsSection));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifiersInSectionWithIdentifier:", self->_forceOfflineSection));
        objc_msgSend(v11, "addObjectsFromArray:", v12);

        objc_msgSend(v14, "reconfigureItemsWithIdentifiers:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
        objc_msgSend(v13, "applySnapshot:animatingDifferences:", v14, 0);

      }
    }
  }
}

- (void)subscriptionInfosDidChange:(id)a3
{
  -[OfflineMapsManagementDataSource setSubscriptionInfos:](self, "setSubscriptionInfos:", a3);
  -[OfflineMapsManagementDataSource _updateUpdateAllModels](self, "_updateUpdateAllModels");
  -[OfflineMapsManagementDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 1);
  -[OfflineMapsManagementDataSource _fetchExpiredSubscriptionsAnimated:](self, "_fetchExpiredSubscriptionsAnimated:", 1);
}

- (void)pairedSubscriptionInfosDidChange:(id)a3
{
  -[OfflineMapsManagementDataSource _showPairedDeviceDiskSpaceDialogIfNeeded](self, "_showPairedDeviceDiskSpaceDialogIfNeeded", a3);
}

- (void)subscriptionsNeedUpdatingDidChange:(BOOL)a3
{
  self->_hasSubscriptionsNeedingUpdate = a3;
  -[OfflineMapsManagementDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 1);
  -[OfflineMapsManagementDataSource _fetchLastUpdatedDateAnimated:](self, "_fetchLastUpdatedDateAnimated:", 1);
}

- (void)subscriptionsBeingUpdatedDidChange:(BOOL)a3
{
  self->_hasInProgressUpdate = a3;
  -[OfflineMapsManagementDataSource _updateUpdateAllModels](self, "_updateUpdateAllModels");
  -[OfflineMapsManagementDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 1);
}

- (void)hasFullyLoadedSubscriptionsDidChange:(BOOL)a3
{
  -[OfflineMapsManagementDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 1);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
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
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id location;
  _QWORD v63[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = objc_opt_class(MapDataSubscriptionInfo);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v9));

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100508D78;
    v60[3] = &unk_1011AC860;
    v15 = v12;
    v61 = v15;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100508DBC;
    v57[3] = &unk_1011AD1E8;
    objc_copyWeak(&v59, &location);
    v16 = v15;
    v58 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForOfflineMapSubscriptionInfo:cancelDownloadBlock:resumeDownloadBlock:](TwoLinesContentViewModelComposer, "cellModelForOfflineMapSubscriptionInfo:cancelDownloadBlock:resumeDownloadBlock:", v16, v60, v57));
    objc_msgSend(v14, "setViewModel:", v17);

    objc_destroyWeak(&v59);
  }
  else
  {
    v18 = objc_opt_class(OfflineMapsSuggestionModelData);
    if ((objc_opt_isKindOfClass(v10, v18) & 1) != 0)
    {
      v19 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v20, v9));

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100508E0C;
      v53[3] = &unk_1011AFF10;
      objc_copyWeak(&v56, &location);
      v54 = v9;
      v16 = v19;
      v55 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForOfflineMapSuggestion:downloadBlock:](TwoLinesContentViewModelComposer, "cellModelForOfflineMapSuggestion:downloadBlock:", v16, v53));
      objc_msgSend(v14, "setViewModel:", v21);

      objc_destroyWeak(&v56);
    }
    else
    {
      v22 = objc_opt_class(OfflineMapsManagementCellModel);
      if ((objc_opt_isKindOfClass(v10, v22) & 1) != 0)
      {
        v16 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tableRow"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cellForCollectionView:forIndexPath:", v8, v9));

        objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("OfflineMapSettingsCell"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tableRow"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "title"));
        objc_msgSend(v14, "setAccessibilityLabel:", v25);

      }
      else
      {
        v27 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v27) & 1) == 0
          || !objc_msgSend(v10, "isEqualToString:", CFSTR("EmptyState")))
        {
          v14 = 0;
          goto LABEL_8;
        }
        v28 = (objc_class *)objc_opt_class(OfflineEmptyStateCollectionViewCell);
        v29 = NSStringFromClass(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v30, v9));

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MANAGEMENT_EMPTY_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "emptyStateView"));
        objc_msgSend(v33, "setTitle:", v32);

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MANAGEMENT_EMPTY_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "emptyStateView"));
        objc_msgSend(v36, "setSubtitle:", v35);

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.slash")));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "emptyStateView"));
        objc_msgSend(v38, "setImage:", v37);

        v16 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_pillButtonConfigurationWithImage:](UIButtonConfiguration, "_maps_pillButtonConfigurationWithImage:", 1));
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_100508EBC;
        v51[3] = &unk_1011AF8A0;
        objc_copyWeak(&v52, &location);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v51));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v16, v39));

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus")));
        objc_msgSend(v40, "setImage:forState:", v41, 0);

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MANAGEMENT_EMPTY_BUTTON"), CFSTR("localized string not found"), 0));
        objc_msgSend(v40, "setTitle:forState:", v43, 0);

        objc_msgSend(v40, "setAccessibilityIdentifier:", CFSTR("DownloadMap"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "heightAnchor"));
        LODWORD(v44) = 1144766464;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToConstant:priority:", 32.0, v44));
        v63[0] = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "heightAnchor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:", 32.0));
        v63[1] = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 2));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "emptyStateView"));
        objc_msgSend(v49, "setButton:", v40);

        objc_destroyWeak(&v52);
      }
    }
  }

LABEL_8:
  objc_destroyWeak(&location);

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  UserProfileSectionFooterViewModel *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource sectionForSectionIndex:](self, "sectionForSectionIndex:", objc_msgSend(v10, "section")));
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionHeader))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerText"));
    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v13, v10));

      objc_msgSend(v14, "setTitle:", v12);
      objc_msgSend(v14, "setShowsBottomHairline:", 0);
      objc_msgSend(v14, "setFirstNonEmptySection:", objc_msgSend(v10, "section") == objc_msgSend(v8, "_maps_indexOfFirstNonEmptySection"));
LABEL_11:

      goto LABEL_12;
    }

  }
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionFooter))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "footerText"));
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = objc_alloc((Class)NSAttributedString);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "footerText"));
      v12 = objc_msgSend(v17, "initWithString:", v18);

    }
    else
    {
      v12 = 0;
    }
    v19 = -[UserProfileSectionFooterViewModel initWithContentString:]([UserProfileSectionFooterViewModel alloc], "initWithContentString:", v12);
    v20 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionFooter, v22, v10));

    objc_msgSend(v14, "configureWithViewModel:", v19);
    goto LABEL_11;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  LOBYTE(self) = -[OfflineMapsManagementDataSource _canItemIdentifierBeSelected:](self, "_canItemIdentifierBeSelected:", v7);
  return (char)self;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  LOBYTE(self) = -[OfflineMapsManagementDataSource _canItemIdentifierBeSelected:](self, "_canItemIdentifierBeSelected:", v7);
  return (char)self;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v8, "dataSource:itemTapped:", self, v9);

}

- (id)_expiredMapsModel
{
  MapsDebugNavigationTableRow *v3;
  void *v4;
  void *v5;
  void *v6;
  OfflineMapsManagementCellModel *v7;
  OfflineMapsManagementCellModel *expiredMapsModel;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;

  if (!self->_expiredMapsModel)
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc_init(MapsDebugNavigationTableRow);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Expired Maps [row title]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[MapsDebugTableRow setTitle:](v3, "setTitle:", v5);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100509484;
    v12[3] = &unk_1011AD260;
    objc_copyWeak(&v13, &location);
    -[MapsDebugTableRow setSelectionAction:](v3, "setSelectionAction:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v3, "title"));
    -[MapsDebugNavigationTableRow setAccessibilityLabel:](v3, "setAccessibilityLabel:", v6);

    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v3, "setConfigureCollectionViewCellBlock:", &stru_1011B9A48);
    v7 = objc_alloc_init(OfflineMapsManagementCellModel);
    expiredMapsModel = self->_expiredMapsModel;
    self->_expiredMapsModel = v7;

    -[OfflineMapsManagementCellModel setCellType:](self->_expiredMapsModel, "setCellType:", 7);
    -[OfflineMapsManagementCellModel setTableRow:](self->_expiredMapsModel, "setTableRow:", v3);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%ld"), -[NSArray count](self->_expiredSubscriptions, "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_expiredMapsModel, "tableRow"));
  objc_msgSend(v10, "setSubtitle:", v9);

  return self->_expiredMapsModel;
}

- (id)_downloadNewMapModel
{
  OfflineMapsManagementCellModel *downloadNewMapModel;
  MapsDebugActionTableRow *v4;
  void *v5;
  void *v6;
  void *v7;
  OfflineMapsManagementCellModel *v8;
  OfflineMapsManagementCellModel *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  downloadNewMapModel = self->_downloadNewMapModel;
  if (!downloadNewMapModel)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(MapsDebugActionTableRow);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Download New Map [button title]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[MapsDebugTableRow setTitle:](v4, "setTitle:", v6);

    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_1005096CC;
    v14 = &unk_1011AD260;
    objc_copyWeak(&v15, &location);
    -[MapsDebugActionTableRow setSelectionAction:](v4, "setSelectionAction:", &v11);
    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1011B9A68, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v4, "title"));
    -[MapsDebugActionTableRow setAccessibilityLabel:](v4, "setAccessibilityLabel:", v7);

    v8 = objc_alloc_init(OfflineMapsManagementCellModel);
    v9 = self->_downloadNewMapModel;
    self->_downloadNewMapModel = v8;

    -[OfflineMapsManagementCellModel setCellType:](self->_downloadNewMapModel, "setCellType:", 0);
    -[OfflineMapsManagementCellModel setTableRow:](self->_downloadNewMapModel, "setTableRow:", v4);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
    downloadNewMapModel = self->_downloadNewMapModel;
  }
  return downloadNewMapModel;
}

- (id)_updateAllModel
{
  OfflineMapsManagementCellModel *updateAllModel;
  MapsDebugActionTableRow *v4;
  void *v5;
  void *v6;
  OfflineMapsManagementCellModel *v7;
  OfflineMapsManagementCellModel *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  updateAllModel = self->_updateAllModel;
  if (!updateAllModel)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(MapsDebugActionTableRow);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Update All [button title]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[MapsDebugTableRow setTitle:](v4, "setTitle:", v6);

    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1005098FC;
    v13 = &unk_1011AD260;
    objc_copyWeak(&v14, &location);
    -[MapsDebugActionTableRow setSelectionAction:](v4, "setSelectionAction:", &v10);
    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1011B9A88, v10, v11, v12, v13);
    v7 = objc_alloc_init(OfflineMapsManagementCellModel);
    v8 = self->_updateAllModel;
    self->_updateAllModel = v7;

    -[OfflineMapsManagementCellModel setCellType:](self->_updateAllModel, "setCellType:", 1);
    -[OfflineMapsManagementCellModel setTableRow:](self->_updateAllModel, "setTableRow:", v4);
    -[OfflineMapsManagementDataSource _updateUpdateAllModels](self, "_updateUpdateAllModels");
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
    updateAllModel = self->_updateAllModel;
  }
  return updateAllModel;
}

- (id)_disabledUpdateAllModel
{
  OfflineMapsManagementCellModel *disabledUpdateAllModel;
  MapsDebugActionTableRow *v4;
  void *v5;
  void *v6;
  OfflineMapsManagementCellModel *v7;
  OfflineMapsManagementCellModel *v8;

  disabledUpdateAllModel = self->_disabledUpdateAllModel;
  if (!disabledUpdateAllModel)
  {
    v4 = objc_alloc_init(MapsDebugActionTableRow);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Update All [button title]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[MapsDebugTableRow setTitle:](v4, "setTitle:", v6);

    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1011B9AA8);
    v7 = objc_alloc_init(OfflineMapsManagementCellModel);
    v8 = self->_disabledUpdateAllModel;
    self->_disabledUpdateAllModel = v7;

    -[OfflineMapsManagementCellModel setCellType:](self->_disabledUpdateAllModel, "setCellType:", 1);
    -[OfflineMapsManagementCellModel setTableRow:](self->_disabledUpdateAllModel, "setTableRow:", v4);
    -[OfflineMapsManagementCellModel setEnabled:](self->_disabledUpdateAllModel, "setEnabled:", 0);
    -[OfflineMapsManagementDataSource _updateUpdateAllModels](self, "_updateUpdateAllModels");

    disabledUpdateAllModel = self->_disabledUpdateAllModel;
  }
  return disabledUpdateAllModel;
}

- (void)_updateUpdateAllModels
{
  uint64_t v2;
  int *v4;
  void *v5;
  OfflineMapsManagementCellModel *updateAllModel;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  OfflineMapsManagementCellModel **p_disabledUpdateAllModel;
  OfflineMapsManagementCellModel *disabledUpdateAllModel;
  int v13;
  NSDate *lastUpdatedDate;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSRelativeDateTimeFormatter *dateFormatter;
  NSRelativeDateTimeFormatter *v21;
  NSRelativeDateTimeFormatter *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v4 = &OBJC_IVAR___CuratedCollectionResolver__delegate;
  if (!self->_updateAllModel && !self->_disabledUpdateAllModel)
    return;
  if (self->_hasInProgressUpdate)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Updating footer text"), CFSTR("localized string not found"), CFSTR("Offline")));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource subscriptionInfos](self, "subscriptionInfos"));
    if (objc_msgSend(v5, "count"))
    {
      v2 = 128;
      lastUpdatedDate = self->_lastUpdatedDate;

      if (!lastUpdatedDate)
      {
        v43 = 0;
        goto LABEL_6;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Last updated footer text"), CFSTR("localized string not found"), CFSTR("Offline")));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v16, "timeIntervalSinceDate:", self->_lastUpdatedDate);
      v18 = v17;

      if (v18 >= 0.0 && v18 < 60.0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OFFLINE_LAST_UPDATED_JUST_NOW"), CFSTR("localized string not found"), CFSTR("Offline")));
      }
      else
      {
        dateFormatter = self->_dateFormatter;
        if (!dateFormatter)
        {
          v21 = (NSRelativeDateTimeFormatter *)objc_alloc_init((Class)NSRelativeDateTimeFormatter);
          v22 = self->_dateFormatter;
          self->_dateFormatter = v21;

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
          -[NSRelativeDateTimeFormatter setLocale:](self->_dateFormatter, "setLocale:", v23);

          -[NSRelativeDateTimeFormatter setDateTimeStyle:](self->_dateFormatter, "setDateTimeStyle:", 1);
          -[NSRelativeDateTimeFormatter setFormattingContext:](self->_dateFormatter, "setFormattingContext:", 1);
          dateFormatter = self->_dateFormatter;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSRelativeDateTimeFormatter calendar](dateFormatter, "calendar"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "components:fromDate:toDate:options:", 4124, v25, self->_lastUpdatedDate, 0));

        v27 = objc_claimAutoreleasedReturnValue(-[NSRelativeDateTimeFormatter localizedStringFromDateComponents:](self->_dateFormatter, "localizedStringFromDateComponents:", v26));
      }
      v40 = (void *)v27;

      v43 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v40));
    }
    else
    {
      v43 = 0;
    }
  }

LABEL_6:
  updateAllModel = self->_updateAllModel;
  if (!updateAllModel
    || (v2 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_updateAllModel, "tableRow")),
        v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "subtitle")),
        v43 == v7))
  {
    v13 = 0;
    p_disabledUpdateAllModel = &self->_disabledUpdateAllModel;
    disabledUpdateAllModel = self->_disabledUpdateAllModel;
    if (!disabledUpdateAllModel)
    {
      v7 = v43;
      v33 = 0;
      goto LABEL_29;
    }
    v7 = v43;
LABEL_22:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](disabledUpdateAllModel, "tableRow"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subtitle"));
    if (v43 == (id)v29)
    {

      v33 = 0;
      if (!v13)
        goto LABEL_29;
    }
    else
    {
      v30 = (void *)v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](*p_disabledUpdateAllModel, "tableRow"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "subtitle"));
      v33 = objc_msgSend(v43, "isEqualToString:", v32) ^ 1;

      v4 = &OBJC_IVAR___CuratedCollectionResolver__delegate;
      if ((v13 & 1) == 0)
      {
LABEL_29:
        if (!updateAllModel)
          goto LABEL_31;
        goto LABEL_30;
      }
    }

    goto LABEL_29;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_updateAllModel, "tableRow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subtitle"));
  v10 = objc_msgSend(v43, "isEqualToString:", v9);
  if ((v10 & 1) != 0)
  {
    p_disabledUpdateAllModel = &self->_disabledUpdateAllModel;
    disabledUpdateAllModel = self->_disabledUpdateAllModel;
    if (disabledUpdateAllModel)
    {
      v41 = v9;
      v42 = v8;
      v13 = 1;
      goto LABEL_22;
    }
  }
  v33 = v10 ^ 1;

LABEL_30:
LABEL_31:
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_updateAllModel, "tableRow"));
  objc_msgSend(v34, "setSubtitle:", v43);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v4[818]), "tableRow"));
  objc_msgSend(v35, "setSubtitle:", v43);

  if (v33 && self->_actionButtonsSection)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "snapshot"));

    if (objc_msgSend(v37, "indexOfSectionIdentifier:", self->_actionButtonsSection) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "itemIdentifiersInSectionWithIdentifier:", self->_actionButtonsSection));
      objc_msgSend(v37, "reconfigureItemsWithIdentifiers:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource diffableDataSource](self, "diffableDataSource"));
      objc_msgSend(v39, "applySnapshot:animatingDifferences:", v37, 1);

    }
  }

}

- (id)_downloadSettingsModel
{
  int *v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int BOOL;
  uint64_t v17;
  void *v18;
  void *v19;
  MapsDebugMenuRow *v20;
  void *v21;
  void *v22;
  void *v23;
  OfflineMapsManagementCellModel *v24;
  OfflineMapsManagementCellModel *downloadSettingsModel;
  _QWORD v27[2];

  v3 = &OBJC_IVAR___CuratedCollectionResolver__delegate;
  if (!self->_hasCreatedDownloadSettingsModel)
  {
    v4 = +[CellularReachability cellularStatus](CellularReachability, "cellularStatus");
    if (!v4)
    {
LABEL_13:
      self->_hasCreatedDownloadSettingsModel = 1;
      return *(id *)((char *)&self->super.super.isa + v3[821]);
    }
    v5 = v4;
    v6 = MGGetBoolAnswer(CFSTR("wapi"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WLAN Only [menu option]"), CFSTR("localized string not found"), CFSTR("Offline")));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("WLAN + Cellular [menu option]");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Wi-Fi Only [menu option]"), CFSTR("localized string not found"), CFSTR("Offline")));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Wi-Fi + Cellular [menu option]");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), CFSTR("Offline")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v9, 0, 0, &stru_1011B9AC8));
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("WifiOnlyAction"));
    objc_msgSend(v14, "setAccessibilityLabel:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v13, 0, 0, &stru_1011B9AE8));
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("WifiAndCellularAction"));
    objc_msgSend(v15, "setAccessibilityLabel:", v13);
    BOOL = GEOConfigGetBOOL(MapsConfig_OfflineMapDownloadsAllowCellular, off_1014B4F48);
    if (v5 == 3 && BOOL)
    {
      objc_msgSend(v15, "setState:", 1);
      v17 = 0;
    }
    else
    {
      objc_msgSend(v14, "setState:", 1);
      if (v5 > 3)
      {
LABEL_12:
        v27[0] = v14;
        v27[1] = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v18));

        v20 = objc_alloc_init(MapsDebugMenuRow);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Downloads [cell title]"), CFSTR("localized string not found"), CFSTR("Offline")));
        -[MapsDebugTableRow setTitle:](v20, "setTitle:", v22);

        -[MapsDebugMenuRow setMenu:](v20, "setMenu:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v20, "title"));
        -[MapsDebugMenuRow setAccessibilityLabel:](v20, "setAccessibilityLabel:", v23);

        -[MapsDebugTableRow setSelectionAction:](v20, "setSelectionAction:", 0);
        -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v20, "setConfigureCollectionViewCellBlock:", &stru_1011B9B08);
        v24 = objc_alloc_init(OfflineMapsManagementCellModel);
        v3 = &OBJC_IVAR___CuratedCollectionResolver__delegate;
        downloadSettingsModel = self->_downloadSettingsModel;
        self->_downloadSettingsModel = v24;

        -[OfflineMapsManagementCellModel setCellType:](self->_downloadSettingsModel, "setCellType:", 2);
        -[OfflineMapsManagementCellModel setTableRow:](self->_downloadSettingsModel, "setTableRow:", v20);

        goto LABEL_13;
      }
      v17 = qword_100E37798[v5 - 1];
    }
    objc_msgSend(v15, "setAttributes:", v17);
    goto LABEL_12;
  }
  return *(id *)((char *)&self->super.super.isa + v3[821]);
}

- (id)_createAutomaticUpdatesModel:(BOOL)a3
{
  _BOOL8 v3;
  MapsDebugSwitchTableRow *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  OfflineMapsManagementCellModel *v10;
  _QWORD v12[4];
  BOOL v13;
  _QWORD v14[4];
  BOOL v15;

  v3 = a3;
  v4 = objc_alloc_init(MapsDebugSwitchTableRow);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Automatic Updates [cell title]"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[MapsDebugTableRow setTitle:](v4, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Automatic Updates [cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[MapsDebugTableRow setSubtitle:](v4, "setSubtitle:", v8);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10050A708;
  v14[3] = &unk_1011B9B28;
  v15 = v3;
  -[MapsDebugSwitchTableRow setGet:](v4, "setGet:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10050A728;
  v12[3] = &unk_1011B9B48;
  v13 = v3;
  -[MapsDebugSwitchTableRow setSet:](v4, "setSet:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v4, "title"));
  -[MapsDebugSwitchTableRow setAccessibilityLabel:](v4, "setAccessibilityLabel:", v9);

  -[MapsDebugSwitchTableRow setEnabled:](v4, "setEnabled:", v3);
  -[MapsDebugTableRow setSelectionAction:](v4, "setSelectionAction:", 0);
  -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1011B9B68);
  v10 = objc_alloc_init(OfflineMapsManagementCellModel);
  -[OfflineMapsManagementCellModel setCellType:](v10, "setCellType:", 3);
  -[OfflineMapsManagementCellModel setTableRow:](v10, "setTableRow:", v4);

  return v10;
}

- (id)_automaticUpdatesModel
{
  OfflineMapsManagementCellModel *automaticUpdatesModel;
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;

  automaticUpdatesModel = self->_automaticUpdatesModel;
  if (!automaticUpdatesModel)
  {
    v4 = (OfflineMapsManagementCellModel *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _createAutomaticUpdatesModel:](self, "_createAutomaticUpdatesModel:", 1));
    v5 = self->_automaticUpdatesModel;
    self->_automaticUpdatesModel = v4;

    automaticUpdatesModel = self->_automaticUpdatesModel;
  }
  return automaticUpdatesModel;
}

- (id)_disabledAutomaticUpdatesModel
{
  OfflineMapsManagementCellModel *disabledAutomaticUpdatesModel;
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;

  disabledAutomaticUpdatesModel = self->_disabledAutomaticUpdatesModel;
  if (!disabledAutomaticUpdatesModel)
  {
    v4 = (OfflineMapsManagementCellModel *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _createAutomaticUpdatesModel:](self, "_createAutomaticUpdatesModel:", 0));
    v5 = self->_disabledAutomaticUpdatesModel;
    self->_disabledAutomaticUpdatesModel = v4;

    -[OfflineMapsManagementDataSource _updateAutoUpdateRowSubtitle](self, "_updateAutoUpdateRowSubtitle");
    disabledAutomaticUpdatesModel = self->_disabledAutomaticUpdatesModel;
  }
  return disabledAutomaticUpdatesModel;
}

- (void)_updateAutoUpdateRowSubtitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_disabledAutomaticUpdatesModel)
  {
    v9 = objc_alloc_init((Class)NSByteCountFormatter);
    v3 = objc_msgSend(v9, "stringFromByteCount:", GEOMaximumAutomaticUpdateOfflineDataSize());
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Automatic Updates [disabled cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_disabledAutomaticUpdatesModel, "tableRow"));
    objc_msgSend(v8, "setSubtitle:", v7);

  }
}

- (id)_optimizeStorageModel
{
  OfflineMapsManagementCellModel *optimizeStorageModel;
  MapsDebugSwitchTableRow *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  OfflineMapsManagementCellModel *v10;
  OfflineMapsManagementCellModel *v11;

  optimizeStorageModel = self->_optimizeStorageModel;
  if (!optimizeStorageModel)
  {
    v4 = objc_alloc_init(MapsDebugSwitchTableRow);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Optimize Storage [cell title]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[MapsDebugTableRow setTitle:](v4, "setTitle:", v6);

    -[MapsDebugSwitchTableRow setGet:](v4, "setGet:", &stru_1011B9B88);
    -[MapsDebugSwitchTableRow setSet:](v4, "setSet:", &stru_1011B9BA8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v4, "title"));
    -[MapsDebugSwitchTableRow setAccessibilityLabel:](v4, "setAccessibilityLabel:", v7);

    -[MapsDebugTableRow setSelectionAction:](v4, "setSelectionAction:", 0);
    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1011B9BC8);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Optimize Storage [cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[MapsDebugTableRow setSubtitle:](v4, "setSubtitle:", v9);

    v10 = objc_alloc_init(OfflineMapsManagementCellModel);
    v11 = self->_optimizeStorageModel;
    self->_optimizeStorageModel = v10;

    -[OfflineMapsManagementCellModel setCellType:](self->_optimizeStorageModel, "setCellType:", 4);
    -[OfflineMapsManagementCellModel setTableRow:](self->_optimizeStorageModel, "setTableRow:", v4);

    optimizeStorageModel = self->_optimizeStorageModel;
  }
  return optimizeStorageModel;
}

- (id)_createSyncToWatchModel:(BOOL)a3
{
  _BOOL8 v3;
  OfflineMapsManagementCellModel *v5;
  MapsDebugSwitchTableRow *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;
  BOOL v17;
  id from;
  id location;
  _QWORD v20[4];
  BOOL v21;

  v3 = a3;
  v5 = objc_alloc_init(OfflineMapsManagementCellModel);
  -[OfflineMapsManagementCellModel setCellType:](v5, "setCellType:", 5);
  v6 = objc_alloc_init(MapsDebugSwitchTableRow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Sync with Watch [cell title]"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[MapsDebugTableRow setTitle:](v6, "setTitle:", v8);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10050AF58;
  v20[3] = &unk_1011B9B28;
  v21 = v3;
  -[MapsDebugSwitchTableRow setGet:](v6, "setGet:", v20);
  objc_initWeak(&location, v5);
  objc_initWeak(&from, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10050AF78;
  v14 = &unk_1011B9BF0;
  v17 = v3;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(&v16, &location);
  -[MapsDebugSwitchTableRow setSet:](v6, "setSet:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v6, "title", v11, v12, v13, v14));
  -[MapsDebugSwitchTableRow setAccessibilityLabel:](v6, "setAccessibilityLabel:", v9);

  -[MapsDebugSwitchTableRow setEnabled:](v6, "setEnabled:", v3);
  -[MapsDebugTableRow setSelectionAction:](v6, "setSelectionAction:", 0);
  -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v6, "setConfigureCollectionViewCellBlock:", &stru_1011B9C10);
  -[OfflineMapsManagementCellModel setTableRow:](v5, "setTableRow:", v6);
  -[OfflineMapsManagementCellModel setEnabled:](v5, "setEnabled:", v3);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_syncToWatchModel
{
  OfflineMapsManagementCellModel *syncToWatchModel;
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;

  syncToWatchModel = self->_syncToWatchModel;
  if (!syncToWatchModel)
  {
    v4 = (OfflineMapsManagementCellModel *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _createSyncToWatchModel:](self, "_createSyncToWatchModel:", 1));
    v5 = self->_syncToWatchModel;
    self->_syncToWatchModel = v4;

    -[OfflineMapsManagementDataSource _updateSyncToWatchModel](self, "_updateSyncToWatchModel");
    syncToWatchModel = self->_syncToWatchModel;
  }
  return syncToWatchModel;
}

- (id)_disabledSyncToWatchModel
{
  OfflineMapsManagementCellModel *disabledSyncToWatchModel;
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;

  disabledSyncToWatchModel = self->_disabledSyncToWatchModel;
  if (!disabledSyncToWatchModel)
  {
    v4 = (OfflineMapsManagementCellModel *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _createSyncToWatchModel:](self, "_createSyncToWatchModel:", 0));
    v5 = self->_disabledSyncToWatchModel;
    self->_disabledSyncToWatchModel = v4;

    disabledSyncToWatchModel = self->_disabledSyncToWatchModel;
  }
  return disabledSyncToWatchModel;
}

- (void)_updateSyncToWatchModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getActivePairedDeviceExcludingAltAccount"));

  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyName));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Sync with Watch [cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_syncToWatchModel, "tableRow"));
    objc_msgSend(v8, "setSubtitle:", v7);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel tableRow](self->_syncToWatchModel, "tableRow"));
    objc_msgSend(v4, "setSubtitle:", 0);
  }

}

- (id)_createForceOfflineModel:(BOOL)a3
{
  _BOOL8 v3;
  MapsDebugSwitchTableRow *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  OfflineMapsManagementCellModel *v10;
  _QWORD v12[4];
  BOOL v13;
  _QWORD v14[4];
  BOOL v15;

  v3 = a3;
  v4 = objc_alloc_init(MapsDebugSwitchTableRow);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Only Use Offline Maps [cell title]"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[MapsDebugTableRow setTitle:](v4, "setTitle:", v6);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10050B638;
  v14[3] = &unk_1011B9B28;
  v15 = v3;
  -[MapsDebugSwitchTableRow setGet:](v4, "setGet:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10050B658;
  v12[3] = &unk_1011B9B48;
  v13 = v3;
  -[MapsDebugSwitchTableRow setSet:](v4, "setSet:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](v4, "title"));
  -[MapsDebugSwitchTableRow setAccessibilityLabel:](v4, "setAccessibilityLabel:", v7);

  -[MapsDebugSwitchTableRow setEnabled:](v4, "setEnabled:", v3);
  -[MapsDebugTableRow setSelectionAction:](v4, "setSelectionAction:", 0);
  -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1011B9C30);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Force offline footer text"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[MapsDebugTableRow setSubtitle:](v4, "setSubtitle:", v9);

  v10 = objc_alloc_init(OfflineMapsManagementCellModel);
  -[OfflineMapsManagementCellModel setCellType:](v10, "setCellType:", 6);
  -[OfflineMapsManagementCellModel setTableRow:](v10, "setTableRow:", v4);
  -[OfflineMapsManagementCellModel setEnabled:](v10, "setEnabled:", v3);

  return v10;
}

- (id)_forceOfflineModel
{
  OfflineMapsManagementCellModel *forceOfflineModel;
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;

  forceOfflineModel = self->_forceOfflineModel;
  if (!forceOfflineModel)
  {
    v4 = (OfflineMapsManagementCellModel *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _createForceOfflineModel:](self, "_createForceOfflineModel:", 1));
    v5 = self->_forceOfflineModel;
    self->_forceOfflineModel = v4;

    forceOfflineModel = self->_forceOfflineModel;
  }
  return forceOfflineModel;
}

- (id)_disabledForceOfflineModel
{
  OfflineMapsManagementCellModel *disabledForceOfflineModel;
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;

  disabledForceOfflineModel = self->_disabledForceOfflineModel;
  if (!disabledForceOfflineModel)
  {
    v4 = (OfflineMapsManagementCellModel *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementDataSource _createForceOfflineModel:](self, "_createForceOfflineModel:", 0));
    v5 = self->_disabledForceOfflineModel;
    self->_disabledForceOfflineModel = v4;

    disabledForceOfflineModel = self->_disabledForceOfflineModel;
  }
  return disabledForceOfflineModel;
}

- (OfflineMapsManagementDataSourceDelegate)offlineDelegate
{
  return (OfflineMapsManagementDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_offlineDelegate);
}

- (void)setOfflineDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_offlineDelegate, a3);
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (OfflineMapsSuggestionsDataProvider)suggestionsProvider
{
  return self->_suggestionsProvider;
}

- (void)setSuggestionsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsProvider, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (NSArray)subscriptionInfos
{
  return self->_subscriptionInfos;
}

- (void)setSubscriptionInfos:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfos, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)suggestedRegions
{
  return self->_suggestedRegions;
}

- (void)setSuggestedRegions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedRegions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRegions, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsProvider, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_destroyWeak((id *)&self->_offlineDelegate);
  objc_storeStrong(&self->_autoupdateFrequencyBucketsListener, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_disabledForceOfflineModel, 0);
  objc_storeStrong((id *)&self->_forceOfflineModel, 0);
  objc_storeStrong((id *)&self->_disabledSyncToWatchModel, 0);
  objc_storeStrong((id *)&self->_syncToWatchModel, 0);
  objc_storeStrong((id *)&self->_optimizeStorageModel, 0);
  objc_storeStrong((id *)&self->_disabledAutomaticUpdatesModel, 0);
  objc_storeStrong((id *)&self->_automaticUpdatesModel, 0);
  objc_storeStrong((id *)&self->_downloadSettingsModel, 0);
  objc_storeStrong((id *)&self->_disabledUpdateAllModel, 0);
  objc_storeStrong((id *)&self->_updateAllModel, 0);
  objc_storeStrong((id *)&self->_downloadNewMapModel, 0);
  objc_storeStrong((id *)&self->_expiredMapsModel, 0);
  objc_storeStrong((id *)&self->_forceOfflineSection, 0);
  objc_storeStrong((id *)&self->_settingsSection, 0);
  objc_storeStrong((id *)&self->_actionButtonsSection, 0);
  objc_storeStrong((id *)&self->_downloadedAndExpiredSection, 0);
  objc_storeStrong((id *)&self->_expiredSubscriptions, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end
