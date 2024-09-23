@implementation BannerSource

- (BannerSource)init
{
  BannerSource *v2;
  uint64_t v3;
  NSMapTable *presentedByTarget;
  uint64_t v5;
  NSMapTable *inAppSeenGuidanceByTarget;
  uint64_t v7;
  NSMapTable *queuedItemsByTarget;
  NSMutableDictionary *v9;
  NSMutableDictionary *bannerIncrements;
  uint64_t v11;
  BNBannerSource *mainSource;
  void *v13;
  NSMapTable *v14;
  NSMapTable *latestBannerForTarget;
  NSMapTable *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BannerSource;
  v2 = -[BannerSource init](&v21, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    presentedByTarget = v2->_presentedByTarget;
    v2->_presentedByTarget = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    inAppSeenGuidanceByTarget = v2->_inAppSeenGuidanceByTarget;
    v2->_inAppSeenGuidanceByTarget = (NSMapTable *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    queuedItemsByTarget = v2->_queuedItemsByTarget;
    v2->_queuedItemsByTarget = (NSMapTable *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    bannerIncrements = v2->_bannerIncrements;
    v2->_bannerIncrements = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:](BNBannerSource, "bannerSourceForDestination:forRequesterIdentifier:", 0, MapsAppBundleId));
    mainSource = v2->_mainSource;
    v2->_mainSource = (BNBannerSource *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, "mapsApplicationDidTerminate", UIApplicationWillTerminateNotification, 0);

    v14 = objc_opt_new(NSMapTable);
    latestBannerForTarget = v2->_latestBannerForTarget;
    v2->_latestBannerForTarget = v14;

    v16 = v2->_latestBannerForTarget;
    v17 = objc_opt_new(NSMutableDictionary);
    -[NSMapTable setObject:forKey:](v16, "setObject:forKey:", v17, v2->_mainSource);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, "_updateCarPlayBannerSource", UISceneWillConnectNotification, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, "_updateCarPlayBannerSource", UISceneDidDisconnectNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BNBannerSource invalidate](self->_mainSource, "invalidate");
  -[BNBannerSource invalidate](self->_carPlaySource, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BannerSource;
  -[BannerSource dealloc](&v3, "dealloc");
}

- (BNBannerSource)carPlaySource
{
  BNBannerSource *carPlaySource;
  BNBannerSource *v4;
  BNBannerSource *v5;

  carPlaySource = self->_carPlaySource;
  if (!carPlaySource)
  {
    v4 = (BNBannerSource *)objc_claimAutoreleasedReturnValue(+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:](BNBannerSource, "bannerSourceForDestination:forRequesterIdentifier:", 1, MapsAppBundleId));
    v5 = self->_carPlaySource;
    self->_carPlaySource = v4;

    carPlaySource = self->_carPlaySource;
  }
  return carPlaySource;
}

- (void)setCarPlaySource:(id)a3
{
  BNBannerSource *v5;
  BNBannerSource *v6;
  BNBannerSource **p_carPlaySource;
  BNBannerSource *carPlaySource;
  BNBannerSource *v9;

  v5 = (BNBannerSource *)a3;
  carPlaySource = self->_carPlaySource;
  p_carPlaySource = &self->_carPlaySource;
  v6 = carPlaySource;
  if (carPlaySource != v5)
  {
    v9 = v5;
    -[BNBannerSource invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_carPlaySource, a3);
    v5 = v9;
  }

}

- (id)activeCarPlayBannerViewController
{
  void *v2;

  if (self->_carPlaySource)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:"));
  else
    v2 = 0;
  return v2;
}

- (id)activeBannerViewController
{
  return -[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:", self->_mainSource);
}

- (void)reset
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", self->_mainSource));
  objc_msgSend(v3, "removeAllObjects");

  -[NSMapTable removeObjectForKey:](self->_inAppSeenGuidanceByTarget, "removeObjectForKey:", self->_mainSource);
  -[BannerSource cleanUpPhoneBanners](self, "cleanUpPhoneBanners");
  if (self->_carPlaySource)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:"));
    objc_msgSend(v4, "removeAllObjects");

    -[NSMapTable removeObjectForKey:](self->_inAppSeenGuidanceByTarget, "removeObjectForKey:", self->_carPlaySource);
    -[BannerSource cleanUpCarPlayBanners](self, "cleanUpCarPlayBanners");
  }
}

- (void)resetExcludingJindo
{
  void *v3;
  void *v4;

  if ((SBUIIsSystemApertureEnabled(self) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", self->_mainSource));
    objc_msgSend(v3, "removeAllObjects");

    -[BannerSource cleanUpPhoneBanners](self, "cleanUpPhoneBanners");
  }
  if (self->_carPlaySource)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:"));
    objc_msgSend(v4, "removeAllObjects");

    -[BannerSource cleanUpCarPlayBanners](self, "cleanUpCarPlayBanners");
  }
}

- (void)receivedGuidanceState:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  unsigned int v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  id v65;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  id v80;
  NSObject *v81;
  void *v82;
  unsigned int v83;
  id obj;
  uint64_t v85;
  unsigned int v86;
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[128];
  uint8_t buf[4];
  void *v95;

  v4 = a3;
  v5 = sub_100431C7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
    *(_DWORD *)buf = 138412290;
    v95 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received: %@", buf, 0xCu);

  }
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (objc_msgSend(v4, "showInMainScreen"))
  {
    objc_msgSend(v8, "addObject:", self->_mainSource);
  }
  else
  {
    -[NSMapTable setObject:forKey:](self->_inAppSeenGuidanceByTarget, "setObject:forKey:", v4, self->_mainSource);
    -[BannerSource cleanUpPhoneBanners](self, "cleanUpPhoneBanners");
  }
  if (self->_carPlaySource)
  {
    if (objc_msgSend(v4, "showInCarPlay"))
    {
      objc_msgSend(v8, "addObject:", self->_carPlaySource);
    }
    else
    {
      -[NSMapTable setObject:forKey:](self->_inAppSeenGuidanceByTarget, "setObject:forKey:", v4, self->_carPlaySource);
      -[BannerSource cleanUpCarPlayBanners](self, "cleanUpCarPlayBanners");
    }
  }
  v9 = objc_msgSend(v4, "transportType");
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v8;
  v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v87)
  {
    v85 = *(_QWORD *)v90;
    v88 = v4;
    v86 = v9;
    do
    {
      for (i = 0; i != v87; i = (char *)i + 1)
      {
        if (*(_QWORD *)v90 != v85)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
        v12 = sub_100431C7C();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ - Processing", buf, 0xCu);
        }

        if (v9 > 3 || v9 == 1)
        {
          -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(ManeuverBannerItem), v11, 1);
          -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TrafficAlertBannerItem), v11, 1);
        }
        else
        {
          if (!-[BannerSource updateBannerForGuidanceState:onTarget:type:](self, "updateBannerForGuidanceState:onTarget:type:", v4, v11, 0))
          {
            -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(ManeuverBannerItem), v11, 1);
            if (!-[BannerSource _shouldSuppressNextGuidance:type:target:](self, "_shouldSuppressNextGuidance:type:target:", v4, 0, v11))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", v11));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", &off_10126D678));

              v16 = sub_100431C7C();
              v17 = objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v95 = v15;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "New guidance; removing banner. previousBanner: %@",
                  buf,
                  0xCu);
              }

              if (!v15
                || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bannerView")),
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "item")),
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "guidanceState")),
                    v21 = -[BannerSource _shouldPresentForPreviousGuidance:nextGuidance:type:target:](self, "_shouldPresentForPreviousGuidance:nextGuidance:type:target:", v20, v4, 0, v11), v20, v19, v18, v21))
              {
                v22 = sub_100431C7C();
                v23 = objc_claimAutoreleasedReturnValue(v22);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 0));
                  *(_DWORD *)buf = 138412290;
                  v95 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Enqueue item for this maneuver: %@", buf, 0xCu);

                }
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerItemForType:guidanceState:](self, "_bannerItemForType:guidanceState:", 0, v4));
                -[BannerSource _enqueue:forTarget:](self, "_enqueue:forTarget:", v25, v11);

              }
            }
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trafficIncidentAlert"));

          if (v26)
          {
            v27 = -[BannerSource updateBannerForGuidanceState:onTarget:type:](self, "updateBannerForGuidanceState:onTarget:type:", v4, v11, 1);
            if (-[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", v11))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:", v11));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 1));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "alternateBannerView"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "item"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uniqueId"));
              v33 = objc_msgSend(v29, "isEqual:", v32);

              if ((v33 & 1) == 0)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerItemForType:guidanceState:](self, "_bannerItemForType:guidanceState:", 1, v88));
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerViewForBannerItem:inTarget:](self, "_bannerViewForBannerItem:inTarget:", v34, v11));
                objc_msgSend(v28, "postTemporaryAlternateBannerView:", v35);

              }
              v4 = v88;
            }
            else if ((v27 & 1) == 0)
            {
              v36 = sub_100431C7C();
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "New traffic alert state; removing previous maneuver",
                  buf,
                  2u);
              }

              -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TrafficAlertBannerItem), v11, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", v11));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", &off_10126D690));

              if (!v39)
                goto LABEL_40;
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bannerView"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "item"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "guidanceState"));
              v43 = -[BannerSource _shouldPresentForPreviousGuidance:nextGuidance:type:target:](self, "_shouldPresentForPreviousGuidance:nextGuidance:type:target:", v42, v88, 1, v11);

              v4 = v88;
              if (v43)
              {
LABEL_40:
                v44 = sub_100431C7C();
                v45 = objc_claimAutoreleasedReturnValue(v44);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 1));
                  *(_DWORD *)buf = 138412290;
                  v95 = v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Enqueuing new traffic alert: %@", buf, 0xCu);

                }
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerItemForType:guidanceState:](self, "_bannerItemForType:guidanceState:", 1, v4));
                -[BannerSource _enqueue:forTarget:](self, "_enqueue:forTarget:", v47, v11);

              }
            }
          }
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alightMessage"));
        if (v48)
          v49 = objc_msgSend(v4, "isMapsForegroundOnMainScreen");
        else
          v49 = 0;

        if (-[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", v11) && v9 == 1 && (v49 & 1) == 0)
        {
          if (!-[BannerSource updateBannerForGuidanceState:onTarget:type:](self, "updateBannerForGuidanceState:onTarget:type:", v4, v11, 3))
          {
            -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TransitDestinationBannerItem), v11, 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", v11));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", &off_10126D6A8));

            v52 = sub_100431C7C();
            v53 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v95 = v51;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "New guidance; removing banner. previousBanner: %@",
                buf,
                0xCu);
            }

            if (!v51)
              goto LABEL_55;
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bannerView"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "item"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "guidanceState"));
            v57 = -[BannerSource _shouldPresentForPreviousGuidance:nextGuidance:type:target:](self, "_shouldPresentForPreviousGuidance:nextGuidance:type:target:", v56, v88, 3, v11);

            v4 = v88;
            if (v57)
            {
LABEL_55:
              v58 = sub_100431C7C();
              v59 = objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 3));
                *(_DWORD *)buf = 138412290;
                v95 = v60;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Enqueue item for this maneuver: %@", buf, 0xCu);

              }
              v61 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerItemForType:guidanceState:](self, "_bannerItemForType:guidanceState:", 3, v4));
              -[BannerSource _enqueue:forTarget:](self, "_enqueue:forTarget:", v61, v11);

            }
          }
        }
        else
        {
          -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TransitDestinationBannerItem), v11, 1);
          if (v9 != 1)
            goto LABEL_76;
        }
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alightMessage"));

        if (v62)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerItemForType:guidanceState:](self, "_bannerItemForType:guidanceState:", 2, v4));
          v64 = -[BannerSource _shouldUseAperturePresentationForBannerItem:inTarget:](self, "_shouldUseAperturePresentationForBannerItem:inTarget:", v63, v11);
          v65 = sub_100431C7C();
          v66 = objc_claimAutoreleasedReturnValue(v65);
          v67 = os_log_type_enabled(v66, OS_LOG_TYPE_INFO);
          if (v64)
          {
            if (v67)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "New transit alight message; populating jindo",
                buf,
                2u);
            }

            v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:", v11));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 2));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "alternateBannerView"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "item"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "uniqueId"));
            v73 = objc_msgSend(v69, "isEqual:", v72);

            if ((v73 & 1) == 0)
            {
              v74 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerViewForBannerItem:inTarget:](self, "_bannerViewForBannerItem:inTarget:", v63, v11));
              objc_msgSend(v68, "postTemporaryAlternateBannerView:", v74);

            }
            v4 = v88;
LABEL_75:

            goto LABEL_76;
          }
          if (v67)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "New transit alight message; removing previous banner",
              buf,
              2u);
          }

          -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TransitAlightBannerItem), v11, 1);
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", v11));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", &off_10126D6C0));

          if (v68)
          {
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bannerView"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "item"));
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "guidanceState"));
            v79 = -[BannerSource _shouldPresentForPreviousGuidance:nextGuidance:type:target:](self, "_shouldPresentForPreviousGuidance:nextGuidance:type:target:", v78, v88, 2, v11);

            v4 = v88;
            if (!v79)
              goto LABEL_75;
          }
          v80 = sub_100431C7C();
          v81 = objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdForBannerType:", 2));
            *(_DWORD *)buf = 138412290;
            v95 = v82;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Enqueuing new transit alight: %@", buf, 0xCu);

          }
          -[BannerSource _enqueue:forTarget:](self, "_enqueue:forTarget:", v63, v11);
          v83 = -[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", v11);

          if (v83)
          {
            -[BannerSource signalTarget:](self, "signalTarget:", v11);
            goto LABEL_77;
          }
        }
LABEL_76:
        -[BannerSource pokeTarget:](self, "pokeTarget:", v11);
LABEL_77:
        v9 = v86;
      }
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    }
    while (v87);
  }

}

- (BOOL)_isDynamicIslandTarget:(id)a3
{
  BNBannerSource *v4;
  BOOL v5;

  v4 = (BNBannerSource *)a3;
  if (SBUIIsSystemApertureEnabled())
    v5 = self->_mainSource == v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_shouldSuppressNextGuidance:(id)a3 type:(unint64_t)a4 target:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v8 = a3;
  v9 = a5;
  v10 = -[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", v9);
  v11 = 0;
  if (!a4 && (v10 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_inAppSeenGuidanceByTarget, "objectForKey:", v9));
    v13 = v12;
    if (!v12
      || (objc_msgSend(v12, "shouldPresentNextGuidanceUpdate:forType:target:", v8, 0, v9) & 1) != 0
      || objc_msgSend(v9, "destination") == (id)1 && (objc_msgSend(v8, "isAlerting") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v14 = sub_100431C7C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shortDescription"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDescription"));
        v19 = 138412546;
        v20 = v16;
        v21 = 2112;
        v22 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Suppressing alert as it is not significantly different to what was seen in app; seen: %@ vs new: %@",
          (uint8_t *)&v19,
          0x16u);

      }
      v11 = 1;
    }

  }
  return v11;
}

- (BOOL)_shouldPresentForPreviousGuidance:(id)a3 nextGuidance:(id)a4 type:(unint64_t)a5 target:(id)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", v12))
    v13 = 1;
  else
    v13 = objc_msgSend(v10, "shouldPresentNextGuidanceUpdate:forType:target:", v11, a5, v12);

  return v13;
}

- (BOOL)_shouldUseAperturePresentationForBannerItem:(id)a3 inTarget:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;

  v6 = a3;
  if (-[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", a4))
  {
    v7 = objc_opt_class(TransitAlightBannerItem);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guidanceState"));
      v9 = objc_msgSend(v8, "isMapsForegroundOnMainScreen") ^ 1;

    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_bannerViewForBannerItem:(id)a3 inTarget:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  __objc2_class **v10;
  __objc2_class **v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(ManeuverBannerItem);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "destination");
    v10 = off_101197678;
    v11 = off_101196088;
    goto LABEL_5;
  }
  v12 = objc_opt_class(TrafficAlertBannerItem);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "destination");
    v10 = off_101197FD0;
    v11 = off_1011960D0;
LABEL_5:
    if (v9 == (id)1)
      v10 = v11;
    goto LABEL_7;
  }
  v16 = objc_opt_class(TransitAlightBannerItem);
  if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
  {
    v10 = off_101197FE0;
  }
  else
  {
    v17 = objc_opt_class(TransitDestinationBannerItem);
    if ((objc_opt_isKindOfClass(v6, v17) & 1) == 0)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v10 = off_101197FF0;
  }
LABEL_7:
  v13 = (objc_class *)objc_opt_class(*v10);
LABEL_8:
  v14 = objc_msgSend([v13 alloc], "initWithTarget:item:aperturePresentation:", v7, v6, -[BannerSource _shouldUseAperturePresentationForBannerItem:inTarget:](self, "_shouldUseAperturePresentationForBannerItem:inTarget:", v6, v7));

  return v14;
}

- (id)_bannerPresentableForBannerItem:(id)a3 inTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsBannerViewController *v9;
  void *v10;
  MapsBannerViewController *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerViewForBannerItem:inTarget:](self, "_bannerViewForBannerItem:inTarget:", v7, v6));
  v9 = [MapsBannerViewController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource bannerIdForBannerItem:](self, "bannerIdForBannerItem:", v7));

  v11 = -[MapsBannerViewController initWithRequestId:target:bannerView:delegate:aperturePresentation:](v9, "initWithRequestId:target:bannerView:delegate:aperturePresentation:", v10, v6, v8, self, objc_msgSend(v8, "aperturePresentation"));
  return v11;
}

- (id)bannerIdForBannerItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  void *v9;
  char *v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uniqueId"));
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bannerIncrements, "objectForKeyedSubscript:", v4));
  v6 = (void *)v5;
  v7 = &off_10126D6D8;
  if (v5)
    v7 = (_UNKNOWN **)v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v4, v8));
  v10 = (char *)objc_msgSend(v8, "unsignedIntegerValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10 + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bannerIncrements, "setObject:forKeyedSubscript:", v11, v4);

  return v9;
}

- (void)pokeTarget:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:"));

  if (!v4)
    -[BannerSource signalTarget:](self, "signalTarget:", v5);

}

- (void)signalTarget:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_queuedItemsByTarget, "objectForKey:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popItem"));
  if (v5)
    -[BannerSource presentBannerItem:onTarget:](self, "presentBannerItem:onTarget:", v5, v6);

}

- (void)presentBannerItem:(id)a3 onTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource _bannerPresentableForBannerItem:inTarget:](self, "_bannerPresentableForBannerItem:inTarget:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerView"));
  v10 = objc_msgSend(v9, "aperturePresentation");

  if (v10)
  {
    v34 = kSBUIPresentableSystemApertureSupportingUserInfoKey;
    v35 = &__kCFBooleanTrue;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  }
  else
  {
    v11 = &__NSDictionary0__struct;
  }
  v12 = sub_100431C7C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    *(_DWORD *)buf = 138412290;
    v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Registering banner %@", buf, 0xCu);

  }
  v27 = 0;
  v15 = objc_msgSend(v7, "postPresentable:options:userInfo:error:", v8, 1, v11, &v27);
  v16 = v27;
  v17 = sub_100431C7C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      v20 = "Presenting next banner: %@ (%@)";
      v21 = v19;
      v22 = OS_LOG_TYPE_INFO;
      v23 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v6;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v7;
    v20 = "Failed to add new banner: %@ error: %@ (%@)";
    v21 = v19;
    v22 = OS_LOG_TYPE_ERROR;
    v23 = 32;
    goto LABEL_11;
  }

  -[NSMapTable setObject:forKey:](self->_presentedByTarget, "setObject:forKey:", v8, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:", v7));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "bannerType")));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v26);

}

- (void)_cleanUpType:(Class)a3 onTarget:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  NSMapTable *queuedItemsByTarget;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a5;
  queuedItemsByTarget = self->_queuedItemsByTarget;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](queuedItemsByTarget, "objectForKey:", v9));
  objc_msgSend(v10, "removeItemsOfType:", objc_opt_class(a3));

  v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bannerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
  v13 = objc_opt_class(a3);
  LOBYTE(a3) = objc_opt_isKindOfClass(v12, v13);

  if ((a3 & 1) != 0)
    -[BannerSource _revokeBanner:animated:](self, "_revokeBanner:animated:", v14, v5);

}

- (void)_revokeBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v4 = a4;
  v6 = a3;
  v7 = sub_100431C7C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "target"));
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Revoking specific banner: %@ on target: %@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "target"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestIdentifier"));
  v16 = 0;
  v12 = objc_msgSend(v10, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v11, CFSTR("Dismissed"), v4, &__NSDictionary0__struct, &v16);
  v13 = v16;

  if (v13)
  {
    v14 = sub_100431C7C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error: %@ revoking specific banner: %@", buf, 0x16u);
    }

    if (objc_msgSend(v13, "code") == (id)3)
      -[BannerSource presentableDidDisappearAsBanner:withReason:](self, "presentableDidDisappearAsBanner:withReason:", v6, CFSTR("MapsRevocationReasonErrorRecovery"));
  }

}

- (void)_enqueue:(id)a3 forTarget:(id)a4
{
  NSMapTable *queuedItemsByTarget;
  id v7;
  id v8;
  void *v9;
  void *v10;
  BannerItemQueue *v11;
  BannerItemQueue *v12;

  queuedItemsByTarget = self->_queuedItemsByTarget;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](queuedItemsByTarget, "objectForKey:", v7));
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_opt_new(BannerItemQueue);
  v12 = v11;

  -[BannerItemQueue addItem:](v12, "addItem:", v8);
  -[NSMapTable setObject:forKey:](self->_queuedItemsByTarget, "setObject:forKey:", v12, v7);

}

- (id)_bannerItemForType:(unint64_t)a3 guidanceState:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (a3 > 3)
    v6 = 0;
  else
    v6 = objc_msgSend(objc_alloc(*off_1011B83C0[a3]), "initWithGuidanceState:", v5);

  return v6;
}

- (BOOL)updateBannerForGuidanceState:(id)a3 onTarget:(id)a4 type:(unint64_t)a5
{
  id v8;
  NSMapTable *presentedByTarget;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned int v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  BOOL v20;

  v8 = a3;
  presentedByTarget = self->_presentedByTarget;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](presentedByTarget, "objectForKey:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bannerView"));
  v13 = objc_msgSend(v12, "aperturePresentation");
  v14 = -[BannerSource _isDynamicIslandTarget:](self, "_isDynamicIslandTarget:", v10);

  if (v12)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (!v15 && (v13 & 1) != 0
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIdForBannerType:", a5)),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "item")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueId")),
        v19 = objc_msgSend(v16, "isEqual:", v18),
        v18,
        v17,
        v16,
        v19))
  {
    objc_msgSend(v11, "updateFromGuidanceState:", v8);
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)mapsApplicationDidTerminate
{
  -[BannerSource cleanUpPhoneBanners](self, "cleanUpPhoneBanners");
  if (self->_carPlaySource)
    -[BannerSource cleanUpCarPlayBanners](self, "cleanUpCarPlayBanners");
}

- (void)cleanUpPhoneBanners
{
  id v3;

  -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(ManeuverBannerItem), self->_mainSource, 1);
  v3 = -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TrafficAlertBannerItem), self->_mainSource, 1);
  if (SBUIIsSystemApertureEnabled(v3))
    -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TransitDestinationBannerItem), self->_mainSource, 1);
}

- (void)cleanUpCarPlayBanners
{
  -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(ManeuverBannerItem), self->_carPlaySource, 1);
  -[BannerSource _cleanUpType:onTarget:animated:](self, "_cleanUpType:onTarget:animated:", objc_opt_class(TrafficAlertBannerItem), self->_carPlaySource, 1);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSMapTable *presentedByTarget;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSMapTable *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  presentedByTarget = self->_presentedByTarget;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "target"));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](presentedByTarget, "objectForKey:", v9));

  v11 = sub_100431C7C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10 == v6)
  {
    if (v13)
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Finished presenting banner: %@ reason: %@", (uint8_t *)&v16, 0x16u);
    }

    v14 = self->_presentedByTarget;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "target"));
    -[NSMapTable removeObjectForKey:](v14, "removeObjectForKey:", v12);
  }
  else if (v13)
  {
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "BannerKit revoked banner: %@ reason: %@", (uint8_t *)&v16, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "target"));
  -[BannerSource signalTarget:](self, "signalTarget:", v15);

}

- (void)_updateCarPlayBannerSource
{
  unsigned int v3;
  BNBannerSource *carPlaySource;
  id v5;
  NSObject *v6;
  NSMapTable *latestBannerForTarget;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay);
  carPlaySource = self->_carPlaySource;
  if (v3)
  {
    if (!carPlaySource)
    {
      v5 = sub_100431C7C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlay connected, we can show banners there now", buf, 2u);
      }

      latestBannerForTarget = self->_latestBannerForTarget;
      v8 = objc_opt_new(NSMutableDictionary);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BannerSource carPlaySource](self, "carPlaySource"));
      -[NSMapTable setObject:forKey:](latestBannerForTarget, "setObject:forKey:", v8, v9);

    }
  }
  else if (carPlaySource)
  {
    v10 = sub_100431C7C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CarPlay disconnected, tear down all banner support", v12, 2u);
    }

    -[NSMapTable removeObjectForKey:](self->_latestBannerForTarget, "removeObjectForKey:", self->_carPlaySource);
    -[BannerSource cleanUpCarPlayBanners](self, "cleanUpCarPlayBanners");
    -[BannerSource setCarPlaySource:](self, "setCarPlaySource:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlaySource, 0);
  objc_storeStrong((id *)&self->_mainSource, 0);
  objc_storeStrong((id *)&self->_bannerIncrements, 0);
  objc_storeStrong((id *)&self->_queuedItemsByTarget, 0);
  objc_storeStrong((id *)&self->_inAppSeenGuidanceByTarget, 0);
  objc_storeStrong((id *)&self->_presentedByTarget, 0);
  objc_storeStrong((id *)&self->_latestBannerForTarget, 0);
}

@end
