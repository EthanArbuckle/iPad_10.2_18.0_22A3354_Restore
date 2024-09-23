@implementation TFLaunchScreenBuilder

+ (id)buildLaunchScreenWithAppName:(id)a3 shortVersionString:(id)a4 bundleVersionString:(id)a5 expirationDate:(id)a6 iconUrlTemplate:(id)a7 testerNotes:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  TFLaunchScreen *v17;

  v14 = a8;
  objc_msgSend(a1, "_lockupWithAppName:shortVersionString:bundleVersionString:expirationDate:iconUrlTemplate:", a3, a4, a5, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("https://developer.apple.com/go/?id=testflight-screenshot"));
  v17 = -[TFLaunchScreen initWithLockup:testerNotes:howToScreenshotSupportUrl:]([TFLaunchScreen alloc], "initWithLockup:testerNotes:howToScreenshotSupportUrl:", v15, v14, v16);

  return v17;
}

+ (id)buildLaunchScreenFromBetaAppLaunchInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;
  void *v23;
  void *v24;

  v3 = a3;
  objc_msgSend(v3, "displayNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLocale preferredLocalizedDisplayNameFromDisplayNames:](TFLocale, "preferredLocalizedDisplayNameFromDisplayNames:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "displayNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLocale");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedTestNotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6;
  +[TFLocale preferredLocaleKeyFromAvailableKeys:primaryLocaleKey:](TFLocale, "preferredLocaleKeyFromAvailableKeys:primaryLocaleKey:", v8, v6);
  v9 = objc_claimAutoreleasedReturnValue();

  v20 = v9;
  if (v9)
  {
    objc_msgSend(v3, "localizedTestNotes", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v3, "version", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shortVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconURLTemplate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildLaunchScreenWithAppName:shortVersionString:bundleVersionString:expirationDate:iconUrlTemplate:testerNotes:", v24, v13, v15, v16, v17, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_lockupWithAppName:(id)a3 shortVersionString:(id)a4 bundleVersionString:(id)a5 expirationDate:(id)a6 iconUrlTemplate:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TFIconArtwork *v28;
  id v29;
  TFAppLockup *v30;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = a5;
  v16 = a4;
  TFLocalizedString(CFSTR("LOCKUP_SUBTITLE_VERSION_PREFIX"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v17, v16, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceNow");
  if (v19 >= 0.0)
  {
    objc_msgSend(v12, "tf_timeFromNow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "day") < 1)
    {
      TFLocalizedString(CFSTR("LOCKUP_SUBTITLE_EXPIRATION_TODAY"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_msgSend(v21, "minute");
      if (objc_msgSend(v21, "hour") + v22 >= 1)
        objc_msgSend(v21, "setDay:", objc_msgSend(v21, "day") + 1);
      TFLocalizedString(CFSTR("LOCKUP_SUBTITLE_EXPIRATION_IN_X"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDD17C8];
      TFLocalizedString(CFSTR("NUMBER_OF_DAYS"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v25, objc_msgSend(v21, "day"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v23, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    TFLocalizedString(CFSTR("LOCKUP_SUBTITLE_EXPIRATION_EXPIRED"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  objc_msgSend(v27, "addObject:", v18);
  if (v20)
    objc_msgSend(v27, "addObject:", v20);
  if (v13)
    v28 = -[TFIconArtwork initWithUrlTemplate:]([TFIconArtwork alloc], "initWithUrlTemplate:", v13);
  else
    v28 = 0;
  v29 = v11;
  v30 = -[TFAppLockup initWithTitle:subtitles:iconArtwork:]([TFAppLockup alloc], "initWithTitle:subtitles:iconArtwork:", v29, v27, v28);

  return v30;
}

@end
