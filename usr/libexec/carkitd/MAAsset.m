@implementation MAAsset

+ (id)cr_contentVersionSortedAssetsFromAssets:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_1000B6DE0);
}

+ (id)cr_highestContentVersionAssetInAssets:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cr_contentVersionSortedAssetsFromAssets:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

- (id)cr_contentVersion
{
  return -[MAAsset cr_numberForAttributesKey:](self, "cr_numberForAttributesKey:", ASAttributeContentVersion);
}

- (int64_t)cr_contentVersionCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset cr_contentVersion](self, "cr_contentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cr_contentVersion"));

  if (v5 && v6)
  {
    v7 = (int64_t)objc_msgSend(v5, "compare:", v6);
  }
  else if (v6)
  {
    v7 = -1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)cr_installedAssetsInAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000B75C8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)cr_stringForAttributesKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset attributes](self, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6 && (v7 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (id)cr_numberForAttributesKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset attributes](self, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6 && (v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (id)cr_themeAsset_assetIdentifier
{
  return -[MAAsset cr_stringForAttributesKey:](self, "cr_stringForAttributesKey:", CFSTR("ContentIdentifier"));
}

- (id)cr_themeAsset_iOSContentVersion
{
  __CFString *v2;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MAAsset cr_stringForAttributesKey:](self, "cr_stringForAttributesKey:", CFSTR("iOSContentVersion")));
  if (!v2)
    v2 = CFSTR("0");
  return v2;
}

- (id)cr_themeAsset_accessoryContentVersion
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset cr_numberForAttributesKey:](self, "cr_numberForAttributesKey:", CFSTR("AccessoryContentVersion")));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset cr_numberForAttributesKey:](self, "cr_numberForAttributesKey:", CFSTR("_ContentVersion")));
    v3 = v4;
    if (v4)
      v5 = v4;

  }
  return v3;
}

- (id)cr_themeAsset_minimumSDKVersion
{
  return -[MAAsset cr_stringForAttributesKey:](self, "cr_stringForAttributesKey:", CFSTR("MinimumSDKVersion"));
}

- (id)cr_themeAsset_minimumCompatibilityVersion
{
  return -[MAAsset cr_numberForAttributesKey:](self, "cr_numberForAttributesKey:", CFSTR("MinimumCompatibilityVersion"));
}

- (id)cr_assetVersion
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset cr_themeAsset_assetIdentifier](self, "cr_themeAsset_assetIdentifier"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MAAsset cr_themeAsset_iOSContentVersion](self, "cr_themeAsset_iOSContentVersion"));
    if (!v4)
    {
      v5 = CarThemeAssetsLogging(0);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10006F2B4(v6, v7, v8, v9, v10, v11, v12, v13);

      v4 = CFSTR("0");
    }
    v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[MAAsset cr_themeAsset_accessoryContentVersion](self, "cr_themeAsset_accessoryContentVersion"));
    if (!v14)
    {
      v15 = CarThemeAssetsLogging(0);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10006F284(v16, v17, v18, v19, v20, v21, v22, v23);

      v14 = &off_1000BE7B8;
    }
    v24 = objc_msgSend(objc_alloc((Class)CARThemeAssetVersion), "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", v3, v4, v14);

  }
  else
  {
    v25 = CarThemeAssetsLogging(0);
    v4 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10006F254(v4, v26, v27, v28, v29, v30, v31, v32);
    v24 = 0;
  }

  return v24;
}

+ (id)cr_themeAsset_versionSortedAssetsFromAssets:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_1000B7958);
}

+ (id)cr_themeAsset_highestVersionAssetInAssets:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cr_themeAsset_versionSortedAssetsFromAssets:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

- (int64_t)cr_themeAsset_versionCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset cr_assetVersion](self, "cr_assetVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cr_assetVersion"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

+ (id)cr_themeAsset_filteredAssets:(id)a3 matchingAssetIdentifier:(id)a4 maximumSDKVersion:(id)a5 maximumCompatibilityVersion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = &__NSArray0__struct;
  if (a3 && v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100060860;
    v16[3] = &unk_1000B7980;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    v13 = a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v16));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));

  }
  return v12;
}

@end
