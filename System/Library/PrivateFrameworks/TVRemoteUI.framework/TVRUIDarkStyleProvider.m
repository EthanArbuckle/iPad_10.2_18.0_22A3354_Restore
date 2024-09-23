@implementation TVRUIDarkStyleProvider

- (CGSize)remoteSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (-[TVRUIDarkStyleProvider isPad](self, "isPad"))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bounds");
    v4 = v3;

    v5 = 812.0;
    if (v4 + -54.0 <= 812.0)
      v5 = v4 + -54.0;
    v6 = 375.0;
  }
  else
  {
    v6 = 1.79769313e308;
    v5 = 1.79769313e308;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)primaryTextAndGlyphColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
}

- (id)rootBackgroundView
{
  return objc_alloc_init(MEMORY[0x24BEBDB00]);
}

- (UIEdgeInsets)rootBackgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (-[TVRUIDarkStyleProvider isPhone](self, "isPhone"))
  {
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    v2 = *MEMORY[0x24BEBE158];
    v3 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v4 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v5 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)rootBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[TVRUIDarkStyleProvider _darkTraitCollectionWithLevel:](self, "_darkTraitCollectionWithLevel:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)touchpadBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.149019608, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TVRUIDarkStyleProvider _darkTraitCollectionWithLevel:](self, "_darkTraitCollectionWithLevel:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedColorWithTraitCollection:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (double)touchpadHeight
{
  void *v3;
  double v4;
  double v5;
  double v7;

  if (-[TVRUIDarkStyleProvider isPhone](self, "isPhone"))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    v5 = v4;

    return v5 * 0.6;
  }
  else
  {
    -[TVRUIDarkStyleProvider remoteSize](self, "remoteSize");
    return v7 * 0.68;
  }
}

- (double)touchpadCornerRadius
{
  return 42.0;
}

- (double)touchpadCompressedCornerRadius
{
  return 20.0;
}

- (UIEdgeInsets)touchpadInsets
{
  double v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double v7;
  UIEdgeInsets result;

  if (-[TVRUIDarkStyleProvider hasHomeButton](self, "hasHomeButton")
    && -[TVRUIDarkStyleProvider isPhone](self, "isPhone"))
  {
    v3 = 16.0;
    v4 = 0.0;
    v5 = 12.0;
  }
  else
  {
    v6 = -[TVRUIDarkStyleProvider isPhone](self, "isPhone");
    v3 = 16.0;
    v5 = 22.0;
    if (!v6)
      v5 = 16.0;
    v4 = 0.0;
  }
  v7 = v3;
  result.right = v7;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (double)directionalPadSelectButtonBorderWidth
{
  return 4.0;
}

- (UIEdgeInsets)directionalPadInsetForSmallDevices
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  v3 = 10.0;
  v4 = 10.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)topControlPanelInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 35.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 35.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (double)controlPanelViewHeight
{
  void *v2;
  double v3;
  double v4;

  if (!-[TVRUIDarkStyleProvider isPhone](self, "isPhone"))
    return 227.36;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;

  return v4 * 0.28;
}

- (id)controlPanelBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
}

- (id)controlPanelBackgroundView
{
  return 0;
}

- (UIEdgeInsets)controlPanelInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 14.0;
  v4 = 0.0;
  v5 = 14.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)primaryButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 130.0;
  v3 = 130.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)secondaryButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 84.0;
  v3 = 84.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)primaryButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE250], *MEMORY[0x24BEBB5C8], 1024, *MEMORY[0x24BEBE078], 0);
}

- (UIEdgeInsets)secondaryButtonInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  v3 = 10.0;
  v4 = 10.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)disabledButtonAlpha
{
  return 0.5;
}

- (double)mediaControlsViewHeight
{
  return 64.0;
}

- (UIEdgeInsets)mediaControlsInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[TVRUIDarkStyleProvider mediaControlsViewHeight](self, "mediaControlsViewHeight");
  v4 = v3;
  -[TVRUIDarkStyleProvider mediaControlsButtonSize](self, "mediaControlsButtonSize");
  v6 = (v4 - v5) * 0.5;
  v7 = 10.0;
  v8 = 10.0;
  v9 = v6;
  result.right = v8;
  result.bottom = v9;
  result.left = v7;
  result.top = v6;
  return result;
}

- (CGSize)mediaControlsButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 64.0;
  v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)captionButtonInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[TVRUIDarkStyleProvider mediaControlsViewHeight](self, "mediaControlsViewHeight");
  v4 = v3;
  -[TVRUIDarkStyleProvider captionButtonSize](self, "captionButtonSize");
  v6 = (v4 - v5) * 0.5;
  v7 = 10.0;
  v8 = 10.0;
  v9 = v6;
  result.right = v8;
  result.bottom = v9;
  result.left = v7;
  result.top = v6;
  return result;
}

- (CGSize)captionButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)symbolImageForButtonPanelNamed:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", a3, *MEMORY[0x24BEBE250], 7, 2, 31.0);
}

- (id)_symbolImageForMediaControlsNamed:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", a3, *MEMORY[0x24BEBE250], 4, 3, 31.0);
}

- (id)_symbolImageForMiniPlayerNamed:(id)a3 buttonType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v6 = (void *)MEMORY[0x24BEBD640];
    v7 = *MEMORY[0x24BEBE240];
    v8 = v5;
    v9 = 4;
    v10 = 2;
  }
  else
  {
    if ((unint64_t)(a4 - 9993) > 1)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x24BEBD640];
    v7 = *MEMORY[0x24BEBE210];
    v8 = v5;
    v9 = 7;
    v10 = 3;
  }
  objc_msgSend(v6, "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", v8, v7, v9, v10, 45.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

- (id)_symbolImageForTopControlPanelNamed:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BEBD5F0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = *MEMORY[0x24BEBE250];
  v7 = (void *)objc_msgSend(v5, "initForTextStyle:", *MEMORY[0x24BEBE250]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v6, *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledFontForFont:maximumPointSize:", v8, 31.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v10, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v4, v9, 5, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)iconForButtonType:(int64_t)a3
{
  return -[TVRUIDarkStyleProvider iconForButtonType:buttonLocation:](self, "iconForButtonType:buttonLocation:", a3, 1);
}

- (id)iconForButtonType:(int64_t)a3 buttonLocation:(int64_t)a4
{
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  double v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;

  if (a3 <= 24)
  {
    switch(a3)
    {
      case 2:
        if (+[TVRUIFeatures swapBackPlayPauseButtonsEnabled](TVRUIFeatures, "swapBackPlayPauseButtonsEnabled"))
        {
          v6 = (void *)MEMORY[0x24BEBD640];
          v7 = *MEMORY[0x24BEBE248];
          v8 = CFSTR("chevron.backward");
          v9 = 31.0;
          v10 = 3;
          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:weight:", *MEMORY[0x24BEBE250], *MEMORY[0x24BEBB5C8], *MEMORY[0x24BEBB608]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUIDarkStyleProvider _preferredFontSizeForMenuButton](self, "_preferredFontSizeForMenuButton");
        v20 = (void *)MEMORY[0x24BEBD640];
        v22 = CFSTR("chevron.backward");
        v23 = v14;
        v21 = 4;
        goto LABEL_34;
      case 3:
        objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", CFSTR("tv"), *MEMORY[0x24BEBE250], 5, 3, 31.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BEBD660];
        objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "configurationWithHierarchicalColor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "imageByApplyingSymbolConfiguration:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_35;
      case 4:
        v5 = CFSTR("mic.fill");
        goto LABEL_30;
      case 5:
        if (!+[TVRUIFeatures swapBackPlayPauseButtonsEnabled](TVRUIFeatures, "swapBackPlayPauseButtonsEnabled"))
        {
          v6 = (void *)MEMORY[0x24BEBD640];
          v8 = CFSTR("playpause.fill");
          v9 = 31.0;
          v7 = *MEMORY[0x24BEBE248];
          v10 = 2;
LABEL_37:
          objc_msgSend(v6, "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", v8, v7, 4, v10, v9);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        v19 = *MEMORY[0x24BEBB608];
        objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:weight:", *MEMORY[0x24BEBE248], *MEMORY[0x24BEBB5C8], *MEMORY[0x24BEBB608]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUIDarkStyleProvider _preferredFontSizeForMenuButton](self, "_preferredFontSizeForMenuButton");
        v20 = (void *)MEMORY[0x24BEBD640];
        v21 = (uint64_t)v19;
        v22 = CFSTR("playpause.fill");
        v23 = v14;
LABEL_34:
        objc_msgSend(v20, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v22, v23, v21, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

        break;
      case 6:
        v11 = CFSTR("goforward.10");
        if (a4 != 2)
          goto LABEL_26;
        v24 = 6;
        goto LABEL_24;
      case 7:
        v11 = CFSTR("gobackward.10");
        if (a4 != 2)
          goto LABEL_26;
        v24 = 7;
LABEL_24:
        -[TVRUIDarkStyleProvider _symbolImageForMiniPlayerNamed:buttonType:](self, "_symbolImageForMiniPlayerNamed:buttonType:", v11, v24);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      default:
        goto LABEL_28;
    }
  }
  else
  {
    if (a3 <= 9991)
    {
      switch(a3)
      {
        case 25:
          v5 = CFSTR("info");
          goto LABEL_30;
        case 28:
          v11 = CFSTR("list.bullet");
          goto LABEL_26;
        case 29:
          v12 = CFSTR("speaker.slash");
          break;
        case 30:
          v12 = CFSTR("power");
          break;
        default:
          goto LABEL_28;
      }
      -[TVRUIDarkStyleProvider _symbolImageForTopControlPanelNamed:](self, "_symbolImageForTopControlPanelNamed:", v12, a4);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    switch(a3)
    {
      case 9992:
        v11 = CFSTR("info.circle");
LABEL_26:
        -[TVRUIDarkStyleProvider _symbolImageForMediaControlsNamed:](self, "_symbolImageForMediaControlsNamed:", v11, a4);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 9998:
        v5 = CFSTR("magnifyingglass");
        goto LABEL_30;
      case 9999:
        v5 = CFSTR("keyboard");
LABEL_30:
        -[TVRUIDarkStyleProvider symbolImageForButtonPanelNamed:](self, "symbolImageForButtonPanelNamed:", v5, a4);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v18 = (void *)v13;
        return v18;
    }
LABEL_28:
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
    {
      v5 = CFSTR("speaker.wave.2.fill");
      goto LABEL_30;
    }
    switch(a3)
    {
      case 9993:
        v11 = CFSTR("play.fill");
        v24 = 9993;
        goto LABEL_24;
      case 9994:
        v11 = CFSTR("pause.fill");
        v24 = 9994;
        goto LABEL_24;
      case 9995:
        v11 = CFSTR("forward.fill");
        goto LABEL_26;
      case 9996:
        v11 = CFSTR("backward.fill");
        goto LABEL_26;
      default:
        v18 = 0;
        break;
    }
  }
  return v18;
}

- (id)captionsButtonIcon:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("captions.bubble.fill");
  else
    v3 = CFSTR("captions.bubble");
  -[TVRUIDarkStyleProvider _symbolImageForMediaControlsNamed:](self, "_symbolImageForMediaControlsNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tintColorForHints
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textForButtonType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 24:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("TVRemoteUIExitButtonText");
      break;
    case 23:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("TVRemoteUIBackButtonText");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("TVRemoteUIMenuButtonText");
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chevronImage
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v3 = *MEMORY[0x24BEBE1F0];
  v4 = (void *)objc_msgSend(v2, "initForTextStyle:", *MEMORY[0x24BEBE1F0]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v3, *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:maximumPointSize:", v5, 31.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v7, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", CFSTR("chevron.forward"), v6, 5, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tintColorForChevronImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)checkmarkImage
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v3 = *MEMORY[0x24BEBE1D0];
  v4 = (void *)objc_msgSend(v2, "initForTextStyle:", *MEMORY[0x24BEBE1D0]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v3, *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:maximumPointSize:", v5, 31.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v7, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", CFSTR("checkmark"), v6, 5, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tvRemoteImage
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", CFSTR("appletvremote.gen4.fill"), *MEMORY[0x24BEBE1D0], 4, 2, 31.0);
}

- (id)fontForDeviceTitle
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v3 = *MEMORY[0x24BEBE200];
  v4 = (void *)objc_msgSend(v2, "initForTextStyle:", *MEMORY[0x24BEBE200]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v3, *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:maximumPointSize:", v5, 40.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)deviceTitleHeight
{
  return 44.0;
}

- (double)deviceListRowHeight
{
  return 52.0;
}

- (id)defaultDeviceTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIDefaultDropDownTextGeneric"), &stru_24DE30718, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)separatorView
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[TVRUIDarkStyleProvider cellSeparatorBackgroundColor](self, "cellSeparatorBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

- (id)fontForDeviceListRow
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBE078], 0);
}

- (id)cellBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
}

- (id)cellSeparatorBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray5Color");
}

- (id)textForPairingAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingEnterPasscodeString"), &stru_24DE30718, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textForPairingPasswordAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingEnterPasswordString"), &stru_24DE30718, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textForDeviceLockoutAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingLockoutOkText"), &stru_24DE30718, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)widthForMessagesView
{
  return 281.0;
}

- (id)fontForMessageViewTitle
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBE078], 0);
}

- (id)fontForMessageViewDescription
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1F0], *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
}

- (id)fontForSpinnerTitle
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1F0], *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
}

- (id)textColorForSpinnerTitle
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.3);
}

- (id)colorForSpinner
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.3);
}

- (id)devicePickerIconForDeviceModel:(id)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB4130]) & 1) != 0)
  {
    v4 = CFSTR("tv");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB4128]) & 1) != 0)
  {
    v4 = CFSTR("mediastick");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB4120]))
  {
    v4 = CFSTR("tv.and.mediabox");
  }
  else
  {
    v4 = CFSTR("appletv.fill");
  }
  v5 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v6 = *MEMORY[0x24BEBE1D0];
  v7 = (void *)objc_msgSend(v5, "initForTextStyle:", *MEMORY[0x24BEBE1D0]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:", v6, *MEMORY[0x24BEBE078]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledFontForFont:maximumPointSize:", v8, 31.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v10, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v4, v9, 5, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationPreferringMonochrome");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageByApplyingSymbolConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)iconForDeviceModel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB4130]))
  {
    -[TVRUIDarkStyleProvider genericTVIcon](self, "genericTVIcon");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB4128]))
  {
    -[TVRUIDarkStyleProvider airplayStickIcon](self, "airplayStickIcon");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB4120]))
      -[TVRUIDarkStyleProvider airplaySetTopBoxIcon](self, "airplaySetTopBoxIcon");
    else
      -[TVRUIDarkStyleProvider appleTVIcon](self, "appleTVIcon");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)appleTVIcon
{
  void *v2;
  void *v3;
  void *v4;

  -[TVRUIDarkStyleProvider fontForDeviceTitle](self, "fontForDeviceTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", CFSTR("appletv.fill"), v2, 4, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)genericTVIcon
{
  return -[TVRUIDarkStyleProvider _imageWithName:](self, "_imageWithName:", CFSTR("IconGenericTV"));
}

- (id)airplayStickIcon
{
  return -[TVRUIDarkStyleProvider _imageWithName:](self, "_imageWithName:", CFSTR("IconAirplayStick"));
}

- (id)airplaySetTopBoxIcon
{
  return -[TVRUIDarkStyleProvider _imageWithName:](self, "_imageWithName:", CFSTR("IconAirplaySetTopBox"));
}

- (id)fontForWiFiButton
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB5C0], 1024, *MEMORY[0x24BEBE078], 0);
}

- (double)deviceSafeAreaInsetTop
{
  _BOOL4 v2;
  double result;

  v2 = -[TVRUIDarkStyleProvider isPad](self, "isPad");
  result = 53.0;
  if (v2)
    return 12.0;
  return result;
}

- (double)deviceSafeAreaInsetBottom
{
  BOOL v3;
  double result;
  _BOOL4 v5;

  v3 = -[TVRUIDarkStyleProvider hasHomeButton](self, "hasHomeButton");
  result = 0.0;
  if (!v3)
  {
    v5 = -[TVRUIDarkStyleProvider isPad](self, "isPad", 0.0);
    result = 34.0;
    if (v5)
      return 0.0;
  }
  return result;
}

- (double)topButtonPanelHeight
{
  return 44.0;
}

- (double)topButtonPanelPadding
{
  BOOL v3;
  double result;
  _BOOL4 v5;

  v3 = -[TVRUIDarkStyleProvider hasHomeButton](self, "hasHomeButton");
  result = 4.0;
  if (!v3)
  {
    v5 = -[TVRUIDarkStyleProvider isPad](self, "isPad", 4.0);
    result = 44.0;
    if (v5)
      return 4.0;
  }
  return result;
}

- (id)pagingButtonFont
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v3 = *MEMORY[0x24BEBE218];
  v4 = (void *)objc_msgSend(v2, "initForTextStyle:", *MEMORY[0x24BEBE218]);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v3, *MEMORY[0x24BEBB5C8], 1024, *MEMORY[0x24BEBE078], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:maximumPointSize:", v5, 38.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)maxPagingTitleLength
{
  return 4;
}

- (id)pagingButtonBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[TVRUIDarkStyleProvider _darkTraitCollectionWithLevel:](self, "_darkTraitCollectionWithLevel:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSmallDevice
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  if (v4 <= 667.0)
  {
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[TVRUIDarkStyleProvider isSmallDevice]";
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s returned YES", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 <= 667.0;
}

- (BOOL)isPhone
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (BOOL)isPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (id)inactiveMediaTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
}

- (id)inactiveMediaControlTintColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
}

- (double)inactiveMediaImageViewAlpha
{
  return 0.55;
}

- (BOOL)hasHomeButton
{
  if (hasHomeButton_onceToken_0 != -1)
    dispatch_once(&hasHomeButton_onceToken_0, &__block_literal_global_15);
  return hasHomeButton_hasHomeButton_0;
}

uint64_t __39__TVRUIDarkStyleProvider_hasHomeButton__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  hasHomeButton_hasHomeButton_0 = (_DWORD)result != 2;
  return result;
}

- (id)_darkTraitCollectionWithLevel:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__TVRUIDarkStyleProvider__darkTraitCollectionWithLevel___block_invoke;
  v4[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v4[4] = a3;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithTraits:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56__TVRUIDarkStyleProvider__darkTraitCollectionWithLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setUserInterfaceLevel:", v2);
  objc_msgSend(v3, "setUserInterfaceStyle:", 2);

}

- (id)_imageWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)_preferredFontSizeForMenuButton
{
  double result;
  void *v4;
  int v5;

  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE0D8]) & 1) != 0)
    return 42.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE0A8]) & 1) != 0)
    return 36.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE0D0]) & 1) != 0)
    return 38.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE0C0]) & 1) != 0)
    return 40.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE0B8]) & 1) != 0)
    return 42.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE0A0]) & 1) != 0)
    return 45.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE098]) & 1) != 0)
    return 48.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE090]) & 1) != 0)
    return 51.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE078]) & 1) != 0)
    return 54.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE070]) & 1) != 0)
    return 57.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE068]) & 1) != 0)
    return 60.0;
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE060]) & 1) != 0)
    return 63.0;
  v4 = (void *)*MEMORY[0x24BEBE058];
  if ((_TVRUIIsCategory((void *)*MEMORY[0x24BEBE058]) & 1) != 0)
    return 66.0;
  v5 = _TVRUIIsCategory(v4);
  result = 42.0;
  if (v5)
    return 70.0;
  return result;
}

@end
