@implementation APMockAdServerSettings

+ (BOOL)isAdResponseMockedForPlacementType:(int64_t)a3
{
  BOOL v3;
  void *v4;
  void *v5;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseBanner"));
      goto LABEL_8;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseInterstitial"));
      goto LABEL_8;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseAudio"));
      goto LABEL_8;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseVideo"));
      goto LABEL_8;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseNative"));
      goto LABEL_8;
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseSponsorship"));
LABEL_8:
      v3 = v5 != 0;

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)storageWithDefaultValues:(id)a3
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = NSStringFromSelector("latencyInMilliseconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10[0] = v4;
  v11[0] = &off_1002298E8;
  v5 = NSStringFromSelector("mockingEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[1] = v6;
  v11[1] = &off_100229900;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  v8 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", v7);
  return v8;
}

+ (id)adResponseDataForPlacementType:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseBanner"));
      goto LABEL_8;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseInterstitial"));
      goto LABEL_8;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseAudio"));
      goto LABEL_8;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseVideo"));
      goto LABEL_8;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseNative"));
      goto LABEL_8;
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adResponseSponsorship"));
LABEL_8:
      v3 = (void *)v5;

      break;
    default:
      return v3;
  }
  return v3;
}

@end
