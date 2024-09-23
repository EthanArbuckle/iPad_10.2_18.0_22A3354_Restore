@implementation TransitPayDiscoverySource

- (TransitPayDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6;
  TransitPayDiscoverySource *v7;
  TransitPayDiscoverySource *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  id v13;
  void *v14;
  uint64_t v15;
  MapsSuggestionsInsights *msgInsights;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TransitPayDiscoverySource;
  v7 = -[TransitPayDiscoverySource init](&v18, "init");
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.Maps.RoutePlanning.TransitPay", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    v13 = sub_100B3A5D4();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "oneInsights"));
    msgInsights = v8->_msgInsights;
    v8->_msgInsights = (MapsSuggestionsInsights *)v15;

  }
  return v8;
}

- (BOOL)isAvailable
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayDiscoverySource model](self, "model"));
  v3 = v2 != 0;

  return v3;
}

- (void)setModel:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C59758;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  _QWORD v15[5];
  id v16;
  id buf[2];

  v7 = a4;
  if (self->_transportType != a3
    || (v8 = self->_routeCollection, v9 = (unint64_t)v7, v9 | v8)
    && (v10 = (void *)v9,
        v11 = objc_msgSend((id)v8, "isEqual:", v9),
        v10,
        (id)v8,
        (v11 & 1) == 0))
  {
    self->_transportType = a3;
    objc_storeStrong((id *)&self->_routeCollection, a4);
    v12 = sub_10043253C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (a3 == 3)
    {
      if (v14)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Transport type is Transit. Checking to surface Transit + Pay Tips.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100C59988;
      v15[3] = &unk_1011C1868;
      v15[4] = self;
      objc_copyWeak(&v16, buf);
      -[TransitPayDiscoverySource updateFeatureEligibilityWithCompletion:](self, "updateFeatureEligibilityWithCompletion:", v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v14)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "The transport type is not transit, no point in checking Transit + Pay eligibility.", (uint8_t *)buf, 2u);
      }

      -[TransitPayDiscoverySource _tearDown](self, "_tearDown");
    }
  }

}

- (void)updateFeatureEligibilityWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSString *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSString *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(id, _QWORD);
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;

  v5 = (void (**)(id, _QWORD))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7)
  {
    v8 = sub_10043253C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_opt_class(self);
      v11 = v10;
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@: User is not using an iPhone", buf, 0x16u);

    }
LABEL_9:

    v5[2](v5, 0);
    goto LABEL_10;
  }
  if ((MapsFeature_IsEnabled_TransitPay() & 1) == 0)
  {
    v14 = sub_10043253C();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_opt_class(self);
      v16 = v15;
      v17 = NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@: TransitPay is not active, did you enable it in the debug panel?", buf, 0x16u);

    }
    goto LABEL_9;
  }
  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100C59D5C;
  v19[3] = &unk_1011EA2F0;
  v19[4] = self;
  objc_copyWeak(&v21, (id *)buf);
  v20 = v5;
  -[TransitPayDiscoverySource _fetchInsightsWithCompletion:](self, "_fetchInsightsWithCompletion:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
LABEL_10:

}

- (void)_fetchInsightsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  TransitPayDiscoverySource *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  id location;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C5A0C4;
  block[3] = &unk_1011B0B60;
  objc_copyWeak(&v15, &location);
  v13 = v19;
  v14 = v17;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (id)_modelFromData:(id)a3
{
  id v4;
  FeatureDiscoveryModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  FeatureDiscoveryModel *v12;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  TransitPayDiscoverySource *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  TransitPayDiscoverySource *v21;
  id v22;
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  v5 = [FeatureDiscoveryModel alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionTitle"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100C5A698;
  v19[3] = &unk_1011AFF10;
  objc_copyWeak(&v22, location);
  v10 = v4;
  v20 = v10;
  v21 = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C5AA98;
  v15[3] = &unk_1011AFF10;
  objc_copyWeak(&v18, location);
  v11 = v10;
  v16 = v11;
  v17 = self;
  LOBYTE(v14) = 1;
  v12 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v5, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v6, v7, v8, v9, v19, 0, &stru_1011EA310, v15, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(location);

  return v12;
}

- (id)_suggestionsFromPBSuggestions:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  NSObject *v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138412290;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(NSObject **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((-[NSObject hasPaymentMethodSuggestionDetails](v11, "hasPaymentMethodSuggestionDetails", v18, (_QWORD)v19) & 1) != 0)
        {
          v12 = objc_claimAutoreleasedReturnValue(-[NSObject paymentMethodSuggestionDetails](v11, "paymentMethodSuggestionDetails"));
          if (-[NSObject hasSuggestionTitle](v12, "hasSuggestionTitle")
            && (-[NSObject hasSuggestionBody](v12, "hasSuggestionBody") & 1) != 0)
          {
            v13 = objc_msgSend(objc_alloc((Class)GEOTransitPaymentMethodSuggestion), "initWithSuggestionData:", v11);
            objc_msgSend(v4, "addObject:", v13);
          }
          else
          {
            v15 = sub_10043253C();
            v13 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v18;
              v24 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggestion details are incomplete - either title or body does not exist: %@", buf, 0xCu);
            }
          }

        }
        else
        {
          v14 = sub_10043253C();
          v12 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Suggestion does not have payment method suggestion details (needed for title/subtitle): %@", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  v16 = objc_msgSend(v4, "copy");
  return v16;
}

- (void)_updateAvailability
{
  NSObject *queue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C5AF5C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_tearDown
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  -[TransitPayDiscoverySource setModel:](self, "setModel:", 0);
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C5B8BC;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 1;
}

- (void)performActionSetupViewControllerDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043253C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Top up flow cancelled. Marking action as \"not executed\", v6, 2u);
  }

  -[FeatureDiscoveryModel markActionExecuted:](self->_model, "markActionExecuted:", 0);
}

- (void)paymentSetupViewController:(id)a3 didFinishAddingPaymentPasses:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  TransitPayDiscoverySource *v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = sub_10043253C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Maps Home - Failed to provision transit card: %@", buf, 0xCu);

    }
    -[FeatureDiscoveryModel markActionExecuted:](self->_model, "markActionExecuted:", 0);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100C5BAFC;
    v17 = &unk_1011AD1E8;
    objc_copyWeak(&v19, (id *)buf);
    v18 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v14);
    -[TransitPayDiscoverySource _tearDown](self, "_tearDown", v14, v15, v16, v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (FeatureDiscoverySourceDelegate)delegate
{
  return (FeatureDiscoverySourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return (TransitPayActionDelegate *)objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);
}

- (void)setTransitPayActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitPayActionDelegate, a3);
}

- (TransitPayActionDelegate)actionDelegate
{
  return (TransitPayActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (FeatureDiscoveryModel)model
{
  return self->_model;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
  objc_storeStrong((id *)&self->_routeCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passManager, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_msgInsights, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
