@implementation APInternalCacheSettings

+ (id)storageWithDefaultValues:(id)a3
{
  return objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", &off_10022B208);
}

- (double)diagnosticsIntervalValue
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APInternalCacheSettings diagnosticsInterval](self, "diagnosticsInterval"));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

@end
