@implementation STUActiveAirPlayRouteProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUActiveAirPlayRouteProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUActiveAirPlayRouteProvider_iOS;
  -[STUActiveAirPlayRouteProvider_iOS dealloc](&v3, "dealloc");
}

- (id)key
{
  return CRKDeviceActiveAirPlayRouteKey;
}

- (id)value
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUActiveAirPlayRouteProvider_iOS activeRouteDictionary](self, "activeRouteDictionary"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (void)beginUpdating
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[STUActiveAirPlayRouteProvider_iOS isObserving](self, "isObserving"))
  {
    -[STUActiveAirPlayRouteProvider_iOS setObserving:](self, "setObserving:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primitives"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "activeAirPlayRouteDidChange:", AVOutputContextOutputDeviceDidChangeNotification, 0);

    -[STUActiveAirPlayRouteProvider_iOS activeAirPlayRouteDidChange:](self, "activeAirPlayRouteDidChange:", 0);
  }
}

- (void)endUpdating
{
  id v3;

  if (-[STUActiveAirPlayRouteProvider_iOS isObserving](self, "isObserving"))
  {
    -[STUActiveAirPlayRouteProvider_iOS setObserving:](self, "setObserving:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, AVOutputContextOutputDeviceDidChangeNotification, 0);

  }
}

- (void)activeAirPlayRouteDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController", a3));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributeForKey:", AVSystemController_PickedRouteAttribute));

  v5 = objc_claimAutoreleasedReturnValue(+[STUAirPlayRouteDictionaryUtilities filteredRouteDescriptionForRelevantKeys:](STUAirPlayRouteDictionaryUtilities, "filteredRouteDescriptionForRelevantKeys:", v10));
  v6 = objc_claimAutoreleasedReturnValue(-[STUActiveAirPlayRouteProvider_iOS activeRouteDictionary](self, "activeRouteDictionary"));
  if (v6 | v5)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUActiveAirPlayRouteProvider_iOS activeRouteDictionary](self, "activeRouteDictionary"));
    v9 = objc_msgSend(v8, "isEqual:", v5);

    if ((v9 & 1) == 0)
      -[STUActiveAirPlayRouteProvider_iOS setActiveRouteDictionary:](self, "setActiveRouteDictionary:", v5);
  }

}

+ (id)keyPathsForValuesAffectingValue
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("activeRouteDictionary"), 0);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (NSDictionary)activeRouteDictionary
{
  return self->_activeRouteDictionary;
}

- (void)setActiveRouteDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_activeRouteDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRouteDictionary, 0);
}

@end
