@implementation UISApplicationSupportDisplayEdgeInfo(SpringBoard)

+ (id)sb_displayEdgeInfoForApplication:()SpringBoard
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "_classicMode");
  if (SBApplicationClassicModeWantsSafeAreaInsets(v5))
    objc_msgSend(a1, "sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:", -[SBApplication _screenTypeForClassicMode:]((uint64_t)v4, v5));
  else
    objc_msgSend(a1, "sb_legacy_homeButtonDeviceDisplayEdgeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sb_thisDeviceDisplayEdgeInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_thisDeviceDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_thisDeviceDisplayEdgeInfo_onceToken != -1)
    dispatch_once(&sb_thisDeviceDisplayEdgeInfo_onceToken, block);
  return (id)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
}

+ (id)sb_floatingApplicationDisplayEdgeInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_floatingApplicationDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_floatingApplicationDisplayEdgeInfo_onceToken != -1)
    dispatch_once(&sb_floatingApplicationDisplayEdgeInfo_onceToken, block);
  return (id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
}

+ (id)sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:()SpringBoard
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char HasHomeButton;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  objc_msgSend(a1, "sbh_displayEdgeInfoForScreenType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBHScreenTypeForCurrentDevice();
  if (v6 != a3)
  {
    v7 = v6;
    if (SBHScreenTypeIsPhone())
    {
      HasHomeButton = SBHScreenTypeHasHomeButton();
      if ((unint64_t)(v7 - 29) >= 0xFFFFFFFFFFFFFFF8 && (HasHomeButton & 1) == 0)
      {
        v9 = +[SBApplication _unobscuredScreenTypeForScreenType:]((uint64_t)SBApplication, v7);
        SBHGetScreenSpecification();
        SBHGetScreenSpecification();
        objc_msgSend(a1, "sbh_displayEdgeInfoForScreenType:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeAreaInsetsPortrait");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "topInset");
        v13 = round(0.0 / 0.0 * v12);

        objc_msgSend(v5, "safeAreaInsetsPortrait");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x1E0DC5B88]);
        objc_msgSend(v14, "leftInset");
        v17 = v16;
        objc_msgSend(v14, "bottomInset");
        v19 = v18;
        objc_msgSend(v14, "rightInset");
        v21 = (void *)objc_msgSend(v15, "initWithTop:left:bottom:right:", v13, v17, v19, v20);
        objc_msgSend(v5, "setSafeAreaInsetsPortrait:", v21);

      }
    }
  }
  return v5;
}

- (id)sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:()SpringBoard
{
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  objc_msgSend(a1, "safeAreaInsetsPortrait");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topInset");
  v6 = v5;

  if (v6 >= a2)
  {
    v7 = a1;
  }
  else
  {
    v7 = (id)objc_msgSend(a1, "copy");
    objc_msgSend(v7, "safeAreaInsetsPortrait");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0DC5B88]);
    objc_msgSend(v8, "leftInset");
    v11 = v10;
    objc_msgSend(v8, "bottomInset");
    v13 = v12;
    objc_msgSend(v8, "rightInset");
    v15 = (void *)objc_msgSend(v9, "initWithTop:left:bottom:right:", a2, v11, v13, v14);
    objc_msgSend(v7, "setSafeAreaInsetsPortrait:", v15);

  }
  return v7;
}

- (double)sb_orientedEdgeInsetsForInterfaceOrientation:()SpringBoard traitCollection:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v18;
  void *v19;

  v5 = a4;
  objc_msgSend(a1, "safeAreaInsetsPortrait");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (v10 != *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    || v8 != *MEMORY[0x1E0CEB4B0]
    || v14 != *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    || v12 != *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    if (!objc_msgSend(v5, "userInterfaceIdiom"))
    {
      SBFEdgeInsetsRotateToInterfaceOrientation();
      v8 = v18;
      objc_msgSend(v5, "userInterfaceIdiom");
    }
    objc_msgSend(a1, "homeAffordanceOverlayAllowance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");

  }
  return v8;
}

@end
