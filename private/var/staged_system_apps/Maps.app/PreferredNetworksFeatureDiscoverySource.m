@implementation PreferredNetworksFeatureDiscoverySource

- (PreferredNetworksFeatureDiscoverySource)init
{
  PreferredNetworksFeatureDiscoverySource *v2;
  id v3;
  const char *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *isolationQueue;
  GEOObserverHashTable *v9;
  GEOObserverHashTable *observers;
  VGVehicle *candidateVehicle;
  void *v12;
  void *v13;
  PreferredNetworksFeatureDiscoverySource *v14;
  NSObject *v15;
  _QWORD block[4];
  PreferredNetworksFeatureDiscoverySource *v18;
  _QWORD v19[4];
  PreferredNetworksFeatureDiscoverySource *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PreferredNetworksFeatureDiscoverySource;
  v2 = -[PreferredNetworksFeatureDiscoverySource init](&v23, "init");
  if (v2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.maps.featurediscovery.evrouting.isolation.%p"), v2)));
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create(v4, v6);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v7;

    v9 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, &_dispatch_main_q);
    observers = v2->_observers;
    v2->_observers = v9;

    candidateVehicle = v2->_candidateVehicle;
    v2->_candidateVehicle = 0;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v12, "registerObserver:", v2);

    objc_initWeak(&location, v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1004FDD18;
    v19[3] = &unk_1011B9800;
    v14 = v2;
    v20 = v14;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v13, "virtualGarageGetGarageWithReply:", v19);

    v15 = v2->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004FDF04;
    block[3] = &unk_1011AC860;
    v18 = v14;
    dispatch_async(v15, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)showFeature
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004FDF9C;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShowFeature:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_showFeature != a3)
  {
    self->_showFeature = a3;
    v4 = sub_1004FDEC4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      if (self->_showFeature)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Did update availability of preferredNetworks source to %@.", (uint8_t *)&v8, 0xCu);

    }
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
  }
}

- (FeatureDiscoveryModel)model
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  FeatureDiscoveryModel *v10;
  UIImage *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  FeatureDiscoveryModel *v16;
  NSObject *v17;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;

  v3 = -[PreferredNetworksFeatureDiscoverySource showFeature](self, "showFeature");
  v4 = sub_1004FDEC4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will suggest preferred networks onboarding.", buf, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(-[PreferredNetworksFeatureDiscoverySource _candidateVehicle](self, "_candidateVehicle"));
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Title, Feature Discovery, EV preferred networks]"), CFSTR("localized string not found"), 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Subtitle, Feature Discovery, EV preferred networks]"), CFSTR("localized string not found"), 0));

      objc_initWeak((id *)buf, self);
      v10 = [FeatureDiscoveryModel alloc];
      v11 = sub_100BA0DB8();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Action button, Feature Discovery, EV preferred networks]"), CFSTR("localized string not found"), 0));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1004FE520;
      v32[3] = &unk_1011AD1E8;
      objc_copyWeak(&v34, (id *)buf);
      v15 = v5;
      v33 = v15;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1004FE55C;
      v29[3] = &unk_1011AD1E8;
      objc_copyWeak(&v31, (id *)buf);
      v30 = v15;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1004FE598;
      v27[3] = &unk_1011AD260;
      objc_copyWeak(&v28, (id *)buf);
      LOBYTE(v25) = 0;
      v16 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v10, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v12, v26, v9, v14, v32, 0, v29, v27, v25);
      objc_destroyWeak(&v28);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&v34);

      objc_destroyWeak((id *)buf);
      v17 = v26;
    }
    else
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v36 = "-[PreferredNetworksFeatureDiscoverySource model]";
        v37 = 2080;
        v38 = "PreferredNetworksFeatureDiscoverySource.m";
        v39 = 1024;
        v40 = 123;
        v41 = 2080;
        v42 = "vehicle";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v36 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v24 = sub_1004FDEC4();
      v17 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Tried to suggest preferred networks but did not have a candidate vehicle.", buf, 2u);
      }
      v16 = 0;
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will not suggest preferred networks: it is not available.", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (id)_candidateVehicle
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1004FE678;
  v10 = sub_1004FE688;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004FE690;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_reloadAvailability
{
  int IsEnabled_EVRoutingEnhancements;
  int v4;
  _BOOL4 dismissed;
  VGVehicle *candidateVehicle;
  unsigned int v7;
  int v8;
  int v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  int v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  __CFString *v35;

  if (MapsFeature_IsEnabled_EVRouting(self, a2))
    IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
  else
    IsEnabled_EVRoutingEnhancements = 0;
  v4 = IsEVRoutingSupported();
  dismissed = self->_dismissed;
  candidateVehicle = self->_candidateVehicle;
  if (candidateVehicle)
    v7 = -[PreferredNetworksFeatureDiscoverySource _shouldShowForVehicle:](self, "_shouldShowForVehicle:", self->_candidateVehicle);
  else
    v7 = 0;
  v8 = IsEnabled_EVRoutingEnhancements & v4;
  if (dismissed)
    v8 = 0;
  v9 = v8 & v7;
  -[PreferredNetworksFeatureDiscoverySource setShowFeature:](self, "setShowFeature:", v8 & v7);
  v10 = sub_1004321BC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v9)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    if (IsEnabled_EVRoutingEnhancements)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    if (v4)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v17 = v16;
    if (dismissed)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v19 = v18;
    if (candidateVehicle)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = v20;
    if (v7)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v23 = v22;
    v24 = 138413570;
    v25 = v13;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v17;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v21;
    v34 = 2112;
    v35 = v23;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_reloadAvailability EVRoutingFeatureDiscoverySource isAvailable: %@\n, featureEnabled: %@, currentCountrySupportsEVRouting: %@, wasDismissed: %@, hasCandidateVehicle: %@, belowMaximumViewCount: %@", (uint8_t *)&v24, 0x3Eu);

  }
}

- (void)_dismiss
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004FE92C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didViewModelWithVehicle:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 449, 8, 0);

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004FEA9C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_didSelectModelWithVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 451, 8, 0);

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004FEE30;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowForVehicle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  id v16;
  BOOL v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("_preferredNetworksOnboarding_")));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pairedAppIdentifier"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v7);

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "year"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v10);

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v13);

  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manufacturer"));
  if (v14)
    v15 = v14;
  else
    v15 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v15);

  v16 = objc_msgSend(v4, "copy");
  v17 = sub_100BA0DCC(v16);

  return v17;
}

- (void)_markVehicleAsViewed:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("_preferredNetworksOnboarding_")));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pairedAppIdentifier"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v7);

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "year"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v10);

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v13);

  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manufacturer"));
  if (v14)
    v15 = v14;
  else
    v15 = &stru_1011EB268;
  objc_msgSend(v4, "appendString:", v15);

  v16 = objc_msgSend(v4, "copy");
  sub_100BA106C(v16);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004FF2C4;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (void)_consumeUpdatedGarage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "vehicles"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004FF4AC;
  v16[3] = &unk_1011B87C0;
  v16[4] = self;
  v5 = sub_10039E1FC(v4, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = self->_candidateVehicle;
  v8 = v6;
  if (v8 | v7
    && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    v12 = sub_1004FDEC4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_candidateVehicle, "displayName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "displayName"));
      *(_DWORD *)buf = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "vehicle candidate changed from: %@ to: %@.", buf, 0x16u);

    }
    objc_storeStrong((id *)&self->_candidateVehicle, v6);
    -[PreferredNetworksFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
  }
  else
  {
    v10 = sub_1004FDEC4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "vehicles without networks have not changed.", buf, 2u);
    }

  }
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (BOOL)hasInitialData
{
  return self->hasInitialData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_candidateVehicle, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
