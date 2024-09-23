@implementation UISApplicationSupportDisplayEdgeInfo(SBHScreenTypes)

+ (id)sbh_displayEdgeInfoForScreenType:()SBHScreenTypes
{
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  int v21;
  void *v22;
  void *v23;

  v5 = 27.0;
  v6 = 51.0;
  *(double *)&v7 = 48.0;
  v8 = 38.0;
  v9 = 40.0;
  v10 = 49.0;
  switch(a3)
  {
    case 3uLL:
    case 5uLL:
    case 8uLL:
      v11 = 0x4046000000000000;
      goto LABEL_5;
    case 4uLL:
LABEL_28:
      v5 = 29.0;
      v10 = v8;
      break;
    case 6uLL:
LABEL_29:
      v5 = 30.67;
      v10 = v9;
      break;
    case 7uLL:
      goto LABEL_15;
    case 9uLL:
    case 0xFuLL:
      v11 = 0x4049000000000000;
LABEL_5:
      v7 = v11;
      goto LABEL_10;
    case 0xAuLL:
    case 0x10uLL:
      *(double *)&v7 = 43.0;
      goto LABEL_10;
    case 0xBuLL:
    case 0xDuLL:
    case 0x11uLL:
    case 0x13uLL:
      *(double *)&v7 = 47.0;
      goto LABEL_10;
    case 0xCuLL:
    case 0x12uLL:
      *(double *)&v7 = 39.0;
      goto LABEL_10;
    case 0xEuLL:
    case 0x14uLL:
      *(double *)&v7 = 41.0;
      goto LABEL_10;
    case 0x15uLL:
    case 0x17uLL:
      *(double *)&v7 = 59.0;
      goto LABEL_10;
    case 0x16uLL:
LABEL_30:
      v5 = 27.67;
      goto LABEL_16;
    case 0x18uLL:
LABEL_31:
      v5 = 31.0;
      v10 = v6;
      break;
    case 0x19uLL:
    case 0x1BuLL:
      *(double *)&v7 = 62.0;
LABEL_15:
      v5 = 34.0;
LABEL_16:
      v10 = *(double *)&v7;
      break;
    case 0x1AuLL:
      break;
    case 0x1CuLL:
      v5 = 29.0;
      v10 = 53.0;
      break;
    default:
LABEL_10:
      v8 = *(double *)&v7;
      v9 = *(double *)&v7;
      v6 = *(double *)&v7;
      v10 = *(double *)&v7;
      v5 = 0.0;
      switch(a3)
      {
        case 3uLL:
        case 5uLL:
        case 7uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0xFuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
          goto LABEL_15;
        case 4uLL:
          goto LABEL_28;
        case 6uLL:
          goto LABEL_29;
        case 8uLL:
          v5 = 31.0;
          goto LABEL_16;
        case 0xAuLL:
        case 0x10uLL:
          v5 = 29.0;
          goto LABEL_16;
        case 0xCuLL:
        case 0x12uLL:
          v5 = 28.0;
          goto LABEL_16;
        case 0xEuLL:
        case 0x14uLL:
          v5 = 29.67;
          goto LABEL_16;
        case 0x16uLL:
          goto LABEL_30;
        case 0x18uLL:
          goto LABEL_31;
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
          goto LABEL_17;
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x29uLL:
        case 0x2AuLL:
        case 0x2BuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2EuLL:
        case 0x2FuLL:
          v12 = _os_feature_enabled_impl();
          v6 = 20.0;
          v8 = 25.0;
          if (v12)
            v5 = 25.0;
          else
            v5 = 20.0;
          goto LABEL_16;
        default:
          v10 = *(double *)&v7;
          v5 = 0.0;
          break;
      }
      break;
  }
LABEL_17:
  +[SBHDisplayDomain rootSettings](SBHDisplayDomain, "rootSettings", v6, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "additionalTopSafeAreaInset");
  v15 = v14;

  v16 = objc_alloc_init(a1);
  if ((SBHScreenTypeHasHomeButton(a3) & 1) == 0 && (SBHScreenTypeIsPhone(a3) || SBHScreenTypeIsPad(a3)))
  {
    v17 = v10 + v15;
    if (SBHScreenTypeIsPhone(a3))
    {
      v18 = 0.0;
      if (a3 <= 0x2F)
        v18 = dbl_1D0191390[a3];
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5B88]), "initWithTop:left:bottom:right:", v18, 0.0, 0.0, 0.0);
      objc_msgSend(v16, "setPeripheryInsets:", v19);

      v20 = 21.0;
    }
    else
    {
      v21 = _os_feature_enabled_impl();
      v20 = 15.0;
      if (v21)
        v20 = 20.0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHomeAffordanceOverlayAllowance:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5B88]), "initWithTop:left:bottom:right:", v17, 0.0, v5, 0.0);
    objc_msgSend(v16, "setSafeAreaInsetsPortrait:", v23);

  }
  return v16;
}

+ (id)sb_thisDeviceDisplayEdgeInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__UISApplicationSupportDisplayEdgeInfo_SBHScreenTypes__sb_thisDeviceDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_thisDeviceDisplayEdgeInfo_onceToken != -1)
    dispatch_once(&sb_thisDeviceDisplayEdgeInfo_onceToken, block);
  return (id)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
}

- (void)sb_applyDisplayEdgeInfoToSceneSettings:()SBHScreenTypes
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "safeAreaInsetsPortrait");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");

  objc_msgSend(a1, "peripheryInsets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  objc_msgSend(v4, "setPeripheryInsets:");

  objc_msgSend(a1, "homeAffordanceOverlayAllowance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v4, "setHomeAffordanceOverlayAllowance:");

}

@end
