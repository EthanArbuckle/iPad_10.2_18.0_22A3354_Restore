@implementation _UIStatusBarIndicatorQuietModeAnnounceItem

- (id)indicatorEntryKey
{
  return CFSTR("quietModeEntry");
}

- (id)secondaryIndicatorEntryKey
{
  return CFSTR("announceNotificationsEntry");
}

- (id)systemImageNameForUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quietModeEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEnabled"))
  {
    objc_msgSend(v3, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quietModeEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("moon.fill");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)secondarySystemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "announceNotificationsEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEnabled"))
    v5 = CFSTR("bell.and.waveform.fill");
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
