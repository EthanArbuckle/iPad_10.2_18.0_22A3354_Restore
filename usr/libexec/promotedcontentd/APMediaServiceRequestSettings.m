@implementation APMediaServiceRequestSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", v3);

  return v4;
}

- (id)campaignNamespaceForPlacement:(unint64_t)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("APMediaServiceRequestSettings.campaignNamespace_%lu"), a3));
  v4 = objc_alloc((Class)NSUserDefaults);
  v5 = objc_msgSend(v4, "initWithSuiteName:", APDefaultsBundleID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));

  return v6;
}

- (BOOL)useAMSBagValue
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestSettings useAMSBag](self, "useAMSBag"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)prettyPrintJsonValue
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestSettings prettyPrintJson](self, "prettyPrintJson"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)mockResponseResultForPlacement:(unint64_t)a3
{
  void *v3;
  APMockedAMSURLResult *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestSettings _readResponseJsonForPlacement:](self, "_readResponseJsonForPlacement:", a3));
  if (v3)
  {
    v4 = objc_alloc_init(APMockedAMSURLResult);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
    -[APMockedAMSURLResult setMockData:](v4, "setMockData:", v5);

    -[APMockedAMSURLResult setMockResponseHeaders:](v4, "setMockResponseHeaders:", &__NSDictionary0__struct);
    -[APMockedAMSURLResult setMockResponseStatusCode:](v4, "setMockResponseStatusCode:", 200);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)ignoreBagKeyCheckValue
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestSettings ignoreBagKeyCheck](self, "ignoreBagKeyCheck"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)disablePlacementParamValue
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestSettings disablePlacementParam](self, "disablePlacementParam"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)_readResponseJsonForPlacement:(unint64_t)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("APMediaServiceRequestSettings.mockResponseJson_%lu"), a3));
  v4 = objc_alloc((Class)NSUserDefaults);
  v5 = objc_msgSend(v4, "initWithSuiteName:", APDefaultsBundleID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));

  return v6;
}

@end
