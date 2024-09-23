@implementation STUIStatusBarIndicatorRingerSilenceItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D20];
}

- (id)systemImageNameForUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a3;
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showRingerWhenSilenced");

  objc_msgSend(v3, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ringerSilenceEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = CFSTR("bell.fill");
  if (v6)
    v10 = 0;
  v11 = CFSTR("bell.slash.fill");
  if (!v6)
    v11 = 0;
  if (v9)
    return v11;
  else
    return v10;
}

- (int64_t)fontStyle
{
  return 1;
}

@end
