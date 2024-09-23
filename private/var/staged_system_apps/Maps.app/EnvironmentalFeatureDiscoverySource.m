@implementation EnvironmentalFeatureDiscoverySource

- (EnvironmentalFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6;
  EnvironmentalFeatureDiscoverySource *v7;
  EnvironmentalFeatureDiscoverySource *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EnvironmentalFeatureDiscoverySource;
  v7 = -[EnvironmentalFeatureDiscoverySource init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 1;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (FeatureDiscoveryModel)model
{
  FeatureDiscoveryModel *model;
  FeatureDiscoveryModel *v4;
  FeatureDiscoveryModel *v5;

  model = self->_model;
  if (!model)
  {
    v4 = (FeatureDiscoveryModel *)objc_claimAutoreleasedReturnValue(-[EnvironmentalFeatureDiscoverySource _bestModelForCurrentState](self, "_bestModelForCurrentState"));
    v5 = self->_model;
    self->_model = v4;

    model = self->_model;
  }
  return model;
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  self->_transportType = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "currentRoute", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10), "mapItemStorage"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_bestAvailableCountryCode"));
        v13 = objc_msgSend(v12, "isEqual:", CFSTR("FR"));

        if (!v13)
        {
          v14 = 0;
          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  self->_areRoutesImpacted = v14;
  -[EnvironmentalFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
}

- (void)_reloadAvailability
{
  void *v3;
  unsigned __int8 v4;
  int available;
  int areRoutesImpacted;
  FeatureDiscoveryModel *model;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnvironmentalFeatureDiscoverySourceShown"));

  available = self->_available;
  if ((v4 & 1) != 0 || self->_dismissed || self->_transportType != 1)
  {
    areRoutesImpacted = 0;
  }
  else
  {
    areRoutesImpacted = self->_areRoutesImpacted;
    if (self->_areRoutesImpacted)
      areRoutesImpacted = GEOConfigGetBOOL(MapsConfig_EnvironmentalRoutePlanningNoticeDisabled, off_1014B5278) ^ 1;
  }
  self->_available = areRoutesImpacted;
  if (available != areRoutesImpacted)
  {
    if ((areRoutesImpacted & 1) == 0)
    {
      model = self->_model;
      self->_model = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "source:didUpdateAvailability:", self, self->_available);

  }
}

- (id)_bestModelForCurrentState
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
  FeatureDiscoveryModel *v12;
  FeatureDiscoveryModel *v13;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (!self->_available)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 30.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("leaf.circle.fill"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Feature Discovery] Reducing Climate Impact"), CFSTR("localized string not found"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Feature Discovery] Climate Impact Description"), CFSTR("localized string not found"), 0));

  objc_initWeak(&location, self);
  v12 = [FeatureDiscoveryModel alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10065143C;
  v16[3] = &unk_1011AD260;
  objc_copyWeak(&v17, &location);
  LOBYTE(v15) = 1;
  v13 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v12, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v7, v9, v11, 0, 0, 0, 0, v16, v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

- (void)_performActionHandler
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appCoordinator"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baseActionCoordinator"));

  objc_msgSend(v4, "switchRoutePlanningTransportTypeToType:", 3);
}

- (void)_dismiss
{
  self->_dismissed = 1;
  -[EnvironmentalFeatureDiscoverySource _reloadAvailability](self, "_reloadAvailability");
}

- (void)markAsShown
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("EnvironmentalFeatureDiscoverySourceShown"));

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

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
