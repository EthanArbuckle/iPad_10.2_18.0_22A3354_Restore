@implementation NearbyTransitFeatureDiscoveryDataStore

- (NearbyTransitFeatureDiscoveryDataStore)initWithDictionary:(id)a3
{
  id v4;
  NearbyTransitFeatureDiscoveryDataStore *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *defaultsDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NearbyTransitFeatureDiscoveryDataStore;
  v5 = -[NearbyTransitFeatureDiscoveryDataStore init](&v9, "init");
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    defaultsDictionary = v5->_defaultsDictionary;
    v5->_defaultsDictionary = v6;

  }
  return v5;
}

- (NearbyTransitFeatureDiscoveryDataStore)init
{
  void *v3;
  void *v4;
  void *v5;
  NearbyTransitFeatureDiscoveryDataStore *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("__internal__NearbyTransitTipInfoKey")));

  if (v4)
    v5 = v4;
  else
    v5 = &__NSDictionary0__struct;
  v6 = -[NearbyTransitFeatureDiscoveryDataStore initWithDictionary:](self, "initWithDictionary:", v5);

  return v6;
}

- (void)_persistData
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setObject:forKey:", self->_defaultsDictionary, CFSTR("__internal__NearbyTransitTipInfoKey"));

}

- (void)userDismissedTip
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NearbyTransitFeatureDiscoveryDataStore _setUserDismissedTipOnDate:](self, "_setUserDismissedTipOnDate:", v3);

}

- (void)_setUserDismissedTipOnDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[NearbyTransitFeatureDiscoveryDataStore numberOfTimesDismissed](self, "numberOfTimesDismissed")+ 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultsDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("NearbyTransitFeatureDiscoveryDismissedCount"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultsDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("NearbyTransitFeatureDiscoveryLastDimissedDate"));
  -[NearbyTransitFeatureDiscoveryDataStore _persistData](self, "_persistData");
}

- (NSDate)lastDismissedDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_defaultsDictionary, "objectForKeyedSubscript:", CFSTR("NearbyTransitFeatureDiscoveryLastDimissedDate"));
}

- (unint64_t)numberOfTimesDismissed
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_defaultsDictionary, "objectForKeyedSubscript:", CFSTR("NearbyTransitFeatureDiscoveryDismissedCount")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasUserEverAddedFavorite
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_defaultsDictionary, "objectForKeyedSubscript:", CFSTR("NearbyTransitFeatureDiscoveryHasUserEverAddedFavorite")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setUserEverAddedFavorite:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[NearbyTransitFeatureDiscoveryDataStore hasUserEverAddedFavorite](self, "hasUserEverAddedFavorite") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultsDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("NearbyTransitFeatureDiscoveryHasUserEverAddedFavorite"));

    -[NearbyTransitFeatureDiscoveryDataStore _persistData](self, "_persistData");
  }
}

- (NSDate)initialTipDisplayDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_defaultsDictionary, "objectForKeyedSubscript:", CFSTR("NearbyTransitFeatureDiscoveryInitialTipDisplayDate"));
}

- (unint64_t)numberOfSessionsShown
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_defaultsDictionary, "objectForKeyedSubscript:", CFSTR("NearbyTransitFeatureDiscoveryNumberSessionsShown")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (void)incrementSessionsShown
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoveryDataStore initialTipDisplayDate](self, "initialTipDisplayDate"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultsDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("NearbyTransitFeatureDiscoveryInitialTipDisplayDate"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[NearbyTransitFeatureDiscoveryDataStore numberOfSessionsShown](self, "numberOfSessionsShown")+ 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultsDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("NearbyTransitFeatureDiscoveryNumberSessionsShown"));

  -[NearbyTransitFeatureDiscoveryDataStore _persistData](self, "_persistData");
}

- (void)_setInitialTipDisplayDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyTransitFeatureDiscoveryDataStore initialTipDisplayDate](self, "initialTipDisplayDate"));
  if (v5)
  {
    v6 = sub_100431CEC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Setting initial display date even though one exists", v8, 2u);
    }

  }
  if ((objc_msgSend(v4, "isEqualToDate:", v5) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultsDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("NearbyTransitFeatureDiscoveryInitialTipDisplayDate"));
    -[NearbyTransitFeatureDiscoveryDataStore _persistData](self, "_persistData");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDictionary, 0);
}

@end
