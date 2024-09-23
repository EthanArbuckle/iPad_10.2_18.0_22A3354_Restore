@implementation PCStatusConditionsDefaultsSettings

+ (id)storageWithDefaultValues:(id)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  _UNKNOWN **v9;

  v3 = NSStringFromSelector("whitelistingsDisabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = v4;
  v9 = &off_10022A170;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  v6 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", v5);
  return v6;
}

@end
