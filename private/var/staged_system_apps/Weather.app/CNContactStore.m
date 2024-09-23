@implementation CNContactStore

- (id)w_meContact
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;

  v2 = objc_alloc_init((Class)CNContactStore);
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", &__NSArray0__struct, &v9));
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    v7 = os_log_create("com.apple.weather", "LocationsOfInterest");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10096E270(v5, v7);

  }
  return v3;
}

@end
