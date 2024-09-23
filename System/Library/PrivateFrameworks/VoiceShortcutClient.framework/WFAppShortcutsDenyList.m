@implementation WFAppShortcutsDenyList

+ (BOOL)isAppShortcutDenyListed:(id)a3 inEnvironment:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ShortcutsActions")) & 1) != 0)
  {
    objc_msgSend(v6, "actionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("StartCallTopHitAction"));

    if (v9)
    {
      +[WFDevice currentDevice](WFDevice, "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasCapability:", CFSTR("CellularTelephony"));

      if (!v11)
        goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ShortcutsActions")) & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v6, "actionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("StartFaceTimeAudioCallTopHitAction"));

  if (!v14
    || (+[WFDevice currentDevice](WFDevice, "currentDevice"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isChineseRegionCelluarDevice"),
        v15,
        (v16 & 1) == 0))
  {
LABEL_11:
    if (a4 == 2)
    {
      objc_msgSend(v6, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.ShortcutsActions")) & 1) != 0)
      {
        objc_msgSend(a1, "spotlightBonusSPI");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "actionIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "containsObject:", v20);

        if ((v21 & 1) != 0)
        {
          v17 = 0;
          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    objc_msgSend(a1, "denyList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_msgSend(v26, "unsignedIntegerValue") & a4) != 0;

    goto LABEL_17;
  }
LABEL_9:
  v17 = 1;
LABEL_17:

  return v17;
}

+ (id)denyList
{
  if (denyList_onceToken != -1)
    dispatch_once(&denyList_onceToken, &__block_literal_global_9621);
  return (id)denyList_denyList;
}

void __34__WFAppShortcutsDenyList_denyList__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.mobiletimer");
  v2[1] = CFSTR("com.apple.NanoStopwatch");
  v3[0] = &unk_1E60041E8;
  v3[1] = &unk_1E6004210;
  v2[2] = CFSTR("com.apple.VoiceMemos");
  v2[3] = CFSTR("com.apple.ShortcutsActions");
  v3[2] = &unk_1E6004238;
  v3[3] = &unk_1E6004260;
  v2[4] = CFSTR("com.apple.camera");
  v2[5] = CFSTR("com.apple.reminders");
  v3[4] = &unk_1E6004288;
  v3[5] = &unk_1E60042B0;
  v2[6] = CFSTR("com.apple.SafetyMonitorApp");
  v3[6] = &unk_1E60042D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)denyList_denyList;
  denyList_denyList = v0;

}

+ (id)spotlightBonusSPI
{
  if (spotlightBonusSPI_onceToken != -1)
    dispatch_once(&spotlightBonusSPI_onceToken, &__block_literal_global_84_9613);
  return (id)spotlightBonusSPI_bonusSPI;
}

void __43__WFAppShortcutsDenyList_spotlightBonusSPI__block_invoke()
{
  void *v0;

  v0 = (void *)spotlightBonusSPI_bonusSPI;
  spotlightBonusSPI_bonusSPI = (uint64_t)&unk_1E6004150;

}

@end
