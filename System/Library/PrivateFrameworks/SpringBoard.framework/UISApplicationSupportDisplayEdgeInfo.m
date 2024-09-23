@implementation UISApplicationSupportDisplayEdgeInfo

void __81__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_thisDeviceDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sbh_displayEdgeInfoForScreenType:", SBHScreenTypeForCurrentDevice());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
  sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo = v1;

}

void __90__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_floatingApplicationDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "sb_thisDeviceDisplayEdgeInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
  sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo = v2;

  objc_msgSend(*(id *)(a1 + 32), "sb_legacy_roundCornerPadDisplayEdgeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo)
  {
    v22 = v4;
    objc_msgSend(v4, "safeAreaInsetsPortrait");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomInset");
    v7 = v6;

    objc_msgSend((id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo, "safeAreaInsetsPortrait");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomInset");
    v10 = v9;

    v4 = v22;
    if (v7 > v10)
    {
      v11 = objc_msgSend((id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo, "copy");
      v12 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
      sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo = v11;

      objc_msgSend((id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo, "safeAreaInsetsPortrait");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
      v15 = objc_alloc(MEMORY[0x1E0DC5B88]);
      objc_msgSend(v13, "topInset");
      v17 = v16;
      objc_msgSend(v13, "leftInset");
      v19 = v18;
      objc_msgSend(v13, "rightInset");
      v21 = (void *)objc_msgSend(v15, "initWithTop:left:bottom:right:", v17, v19, v7, v20);
      objc_msgSend(v14, "setSafeAreaInsetsPortrait:", v21);

      v4 = v22;
    }
  }

}

void __99__UISApplicationSupportDisplayEdgeInfo_SpringBoardPreAzul__sb_legacy_roundCornerPadDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = SBFIsSAEIncreasedInsetAvailable();
  if (v2)
    v3 = 25.0;
  else
    v3 = 20.0;
  if (v2)
    v4 = 20.0;
  else
    v4 = 15.0;
  v5 = objc_alloc_init(*(Class *)(a1 + 32));
  v6 = (void *)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
  sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo = (uint64_t)v5;

  v7 = (void *)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHomeAffordanceOverlayAllowance:", v8);

  v9 = (void *)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5B88]), "initWithTop:left:bottom:right:", 0.0, 0.0, v3, 0.0);
  objc_msgSend(v9, "setSafeAreaInsetsPortrait:", v10);

}

void __101__UISApplicationSupportDisplayEdgeInfo_SpringBoardPreAzul__sb_legacy_homeButtonDeviceDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sb_legacy_homeButtonDeviceDisplayEdgeInfo_sHomeButtonDeviceDisplayEdgeInfo;
  sb_legacy_homeButtonDeviceDisplayEdgeInfo_sHomeButtonDeviceDisplayEdgeInfo = (uint64_t)v1;

}

@end
