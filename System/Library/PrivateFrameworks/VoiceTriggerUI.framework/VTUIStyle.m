@implementation VTUIStyle

+ (id)sharedStyle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__VTUIStyle_sharedStyle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStyle_onceToken != -1)
    dispatch_once(&sharedStyle_onceToken, block);
  return (id)sharedStyle__instance;
}

void __24__VTUIStyle_sharedStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedStyle__instance;
  sharedStyle__instance = v0;

}

- (VTUIStyle)init
{
  VTUIStyle *v2;
  uint64_t v3;
  MGWrapper *mgWrapper;
  uint64_t v5;
  UIFontMetrics *bodyMetricsForScaling;
  uint64_t v7;
  NSString *deviceClass;
  BOOL v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  AFSettingsConnection *v14;
  AFSettingsConnection *settingsConnection;
  dispatch_queue_t v16;
  OS_dispatch_queue *settingsQueue;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VTUIStyle;
  v2 = -[VTUIStyle init](&v19, sel_init);
  if (v2)
  {
    +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
    v3 = objc_claimAutoreleasedReturnValue();
    mgWrapper = v2->_mgWrapper;
    v2->_mgWrapper = (MGWrapper *)v3;

    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v5 = objc_claimAutoreleasedReturnValue();
    bodyMetricsForScaling = v2->_bodyMetricsForScaling;
    v2->_bodyMetricsForScaling = (UIFontMetrics *)v5;

    -[MGWrapper deviceClass](v2->_mgWrapper, "deviceClass");
    v7 = objc_claimAutoreleasedReturnValue();
    deviceClass = v2->_deviceClass;
    v2->_deviceClass = (NSString *)v7;

    v9 = -[MGWrapper isDeviceIPad](v2->_mgWrapper, "isDeviceIPad");
    v2->_isIpad = v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v2->_isLargeIpad = v11 >= 1366.0;

    }
    else
    {
      v2->_isLargeIpad = 0;
    }
    v2->_supportsSideButtonActivation = -[MGWrapper supportsSideButtonActivation](v2->_mgWrapper, "supportsSideButtonActivation");
    v2->_isHeySiriAlwaysOn = -[MGWrapper isHeySiriAlwaysOn](v2->_mgWrapper, "isHeySiriAlwaysOn");
    v2->_supportSideButtonActivation = -[MGWrapper supportsSideButtonActivation](v2->_mgWrapper, "supportsSideButtonActivation");
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v2->_needMoreLineSpacing = objc_msgSend(v13, "isEqual:", CFSTR("th"));
    -[VTUIStyle _createStringSuffixesForDevice](v2, "_createStringSuffixesForDevice");
    v14 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v14;

    v16 = dispatch_queue_create("com.apple.siri.voicetrigger.homepod", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v16;

    -[VTUIStyle _prefetchHomePodInfo](v2, "_prefetchHomePodInfo");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VTUIStyle;
  -[VTUIStyle dealloc](&v4, sel_dealloc);
}

- (id)subtitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
}

- (id)footerFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
}

- (id)proxFooterFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
}

- (id)primaryButtonFont
{
  void *v2;
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v4)
    && (v5 = *MEMORY[0x24BEBE060],
        UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x24BEBE060]) == NSOrderedDescending))
  {
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE200], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v9, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)secondaryButtonFont
{
  void *v2;
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v4)
    && (v5 = *MEMORY[0x24BEBE0A0],
        UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x24BEBE0A0]) == NSOrderedDescending))
  {
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1D0], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v9, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)instructionLabelFont
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE238]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v5 = *MEMORY[0x24BEBB5E8];
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pointSize");
  if (v7 > 50.0
    && (-[MGWrapper isPlusIPhone](self->_mgWrapper, "isPlusIPhone")
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26)))
  {
    v8 = 0x4049000000000000;
LABEL_11:
    v10 = *(double *)&v8;
LABEL_12:
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", v10, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
    return v6;
  }
  objc_msgSend(v6, "pointSize");
  if (v9 > 40.0 && -[MGWrapper isSmallIPhone](self->_mgWrapper, "isSmallIPhone"))
  {
    v8 = 0x4044000000000000;
    goto LABEL_11;
  }
  objc_msgSend(v6, "pointSize");
  v10 = 30.0;
  if (v12 > 30.0 && -[MGWrapper isSmallestIPhone](self->_mgWrapper, "isSmallestIPhone"))
    goto LABEL_12;
  return v6;
}

- (id)instructionPreAndPostfixFont
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE250]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v5 = *MEMORY[0x24BEBB5E8];
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pointSize");
  if (v7 > 50.0
    && (-[MGWrapper isPlusIPhone](self->_mgWrapper, "isPlusIPhone")
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26)))
  {
    v8 = 0x4049000000000000;
LABEL_11:
    v10 = *(double *)&v8;
LABEL_12:
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", v10, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
    return v6;
  }
  objc_msgSend(v6, "pointSize");
  if (v9 > 40.0 && -[MGWrapper isSmallIPhone](self->_mgWrapper, "isSmallIPhone"))
  {
    v8 = 0x4044000000000000;
    goto LABEL_11;
  }
  objc_msgSend(v6, "pointSize");
  v10 = 30.0;
  if (v12 > 30.0 && -[MGWrapper isSmallestIPhone](self->_mgWrapper, "isSmallestIPhone"))
    goto LABEL_12;
  return v6;
}

- (id)proxInstructionPreAndPostfixFont
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE200]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v5 = *MEMORY[0x24BEBB5E8];
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pointSize");
  if (v7 > 50.0
    && (-[MGWrapper isPlusIPhone](self->_mgWrapper, "isPlusIPhone")
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
     || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26)))
  {
    v8 = 0x4049000000000000;
LABEL_11:
    v10 = *(double *)&v8;
LABEL_12:
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", v10, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
    return v6;
  }
  objc_msgSend(v6, "pointSize");
  if (v9 > 40.0 && -[MGWrapper isSmallIPhone](self->_mgWrapper, "isSmallIPhone"))
  {
    v8 = 0x4044000000000000;
    goto LABEL_11;
  }
  objc_msgSend(v6, "pointSize");
  v10 = 30.0;
  if (v12 > 30.0 && -[MGWrapper isSmallestIPhone](self->_mgWrapper, "isSmallestIPhone"))
    goto LABEL_12;
  return v6;
}

- (id)buttonTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
}

- (id)paneBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
}

- (id)homeAppTintColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
}

- (double)PRXtitleTopPadding
{
  return 40.0;
}

- (id)ProxCardKitTitleFontDescriptor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE240]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v2, "symbolicTraits") | 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)PRXheaderFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBB520];
  -[VTUIStyle ProxCardKitTitleFontDescriptor](self, "ProxCardKitTitleFontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 27.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)PRXheaderColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
}

- (id)PRXcancelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBB520];
  -[VTUIStyle ProxCardKitTitleFontDescriptor](self, "ProxCardKitTitleFontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)PRXpageFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE240]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v2, "symbolicTraits") | 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v3, 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEdgeToEdgePhone
{
  BOOL v2;
  void *v3;
  void *v4;
  double v5;

  if (self->_isIpad)
    return 0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayCornerRadius");
  v2 = v5 > 0.0;

  return v2;
}

- (double)PRXdismissButtonEdgeToEdgeMargin
{
  return 32.0;
}

- (double)PRXdismissButtonDefaultMargin
{
  return 24.0;
}

- (double)PRXdismissButtonMargin
{
  double result;

  if (-[VTUIStyle isEdgeToEdgePhone](self, "isEdgeToEdgePhone"))
    -[VTUIStyle PRXdismissButtonEdgeToEdgeMargin](self, "PRXdismissButtonEdgeToEdgeMargin");
  else
    -[VTUIStyle PRXdismissButtonDefaultMargin](self, "PRXdismissButtonDefaultMargin");
  return result;
}

- (double)orbLength
{
  return 198.0;
}

- (double)orbImageLength
{
  return 64.0;
}

- (double)orbImagePadding
{
  return 27.0;
}

- (double)orbOffsetFromTopEnrollment
{
  double result;

  result = -33.0;
  if (self->_isIpad)
    return 12.0;
  return result;
}

- (double)orbImageOffsetFromTopEnrollment
{
  double result;
  _BOOL4 v3;

  if (self->_isIpad)
    return 79.0;
  v3 = -[MGWrapper isDeviceVision](self->_mgWrapper, "isDeviceVision");
  result = 34.0;
  if (v3)
    return 0.0;
  return result;
}

- (double)orbOffsetFromTopTraining
{
  double result;

  result = 130.0;
  if (!self->_isIpad)
    return 40.0;
  return result;
}

- (double)titleOffsetFromOrb
{
  return -41.0;
}

- (double)titleOffsetFromOrbImage
{
  return 26.0;
}

- (double)instructionOffsetFromTopTrainingForGM
{
  return 200.0;
}

- (double)titleBaselineOffsetFromTop
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = 44.0;
  if (v5 <= 320.0)
    v6 = 36.0;
  -[UIFontMetrics scaledValueForValue:](self->_bodyMetricsForScaling, "scaledValueForValue:", v6);
  return result;
}

- (double)textOverlayOffsetFromTop
{
  return 80.0;
}

- (double)subtitle1BaselineOffset
{
  return 15.0;
}

- (double)subtitle2BaselineOffset
{
  double v2;
  double result;

  v2 = 44.0;
  if (!self->_isIpad)
    v2 = 28.0;
  -[UIFontMetrics scaledValueForValue:](self->_bodyMetricsForScaling, "scaledValueForValue:", v2);
  return result;
}

- (double)continueButtonOffset
{
  return 24.0;
}

- (double)imageViewTopOffsetPortrait
{
  double result;
  _BOOL4 v4;

  if (-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 29))
  {
    return 88.0;
  }
  v4 = -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 30);
  result = 64.0;
  if (v4)
    return 88.0;
  return result;
}

- (double)imageViewTopOffsetLandscape
{
  double result;
  _BOOL4 v4;

  if (-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 29))
  {
    return 58.0;
  }
  v4 = -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 30);
  result = 34.0;
  if (v4)
    return 58.0;
  return result;
}

- (double)horizontalTextPadding
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  result = 8.0;
  if (v4 <= 320.0)
    return 0.0;
  return result;
}

- (double)horizontalPaddingPortrait
{
  double result;
  void *v3;
  double v4;
  double v5;

  if (self->_isIpad)
  {
    if (self->_isFloatingWithReducedWidth)
    {
      return 74.0;
    }
    else
    {
      result = 244.0;
      if (!self->_isLargeIpad)
        return 116.0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;

    result = 24.0;
    if (v5 <= 320.0)
      return 16.0;
  }
  return result;
}

- (double)horizontalPaddingLandscape
{
  if (!self->_isIpad)
    return 24.0;
  if (self->_isFloatingWithReducedWidth)
    return 74.0;
  return dbl_229F502F0[!self->_isLargeIpad];
}

- (double)headerTitleLinespacing
{
  double result;

  result = 12.0;
  if (!self->_needMoreLineSpacing)
    return 0.0;
  return result;
}

- (double)primaryButtonHeight
{
  return 50.0;
}

- (double)primaryButtonHorizontalInset
{
  return 24.0;
}

- (double)textOverlayLabelWidth
{
  return 70.0;
}

- (double)minimumImageViewHeight
{
  return 100.0;
}

- (double)statusLabelMinHeight
{
  return 200.0;
}

- (double)statusLabelVerticalOffsetFromCenter
{
  return -50.0;
}

- (double)proxSkipButtonBaselineBottomMargin
{
  return 28.0;
}

- (double)skipButtonBaselineBottomMarginPortrait
{
  double result;
  _BOOL4 v4;

  if (-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26)
    || -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 29))
  {
    return 36.0;
  }
  v4 = -[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 30);
  result = 36.0;
  if (!v4)
    return 24.0;
  return result;
}

- (double)skipButtonBaselineBottomMarginLandscape
{
  double v3;

  v3 = 24.0;
  if (!-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 0)
    && !-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 17)
    && !-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 18)
    && !-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 26))
  {
    if (-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 29))
    {
      return 36.0;
    }
    else if (-[MGWrapper MGIsDeviceOneOfType:](self->_mgWrapper, "MGIsDeviceOneOfType:", 30))
    {
      return 36.0;
    }
    else
    {
      return 24.0;
    }
  }
  return v3;
}

- (id)educationViewTitleText
{
  void *v2;
  void *v3;

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiLocalizedStringForKey:", CFSTR("ASK_SIRI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)educationViewDetailText
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[MGWrapper supportsSideButtonActivation](self->_mgWrapper, "supportsSideButtonActivation");
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("SIRI_SIDE_BUTTON_ACTIVATION_INSTRUCTIONS");
  else
    v5 = CFSTR("SIRI_HOME_BUTTON_ACTIVATION_INSTRUCTIONS");
  objc_msgSend(v3, "uiLocalizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldPresentEducationView
{
  int v3;

  if (-[MGWrapper isDeviceIPod](self->_mgWrapper, "isDeviceIPod")
    || (v3 = -[MGWrapper isDeviceIPhone](self->_mgWrapper, "isDeviceIPhone")) != 0)
  {
    if (self->_isBuddyOrFollowUp)
      LOBYTE(v3) = _os_feature_enabled_impl() ^ 1;
    else
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)educationAssetNameForTraitCollection:(id)a3
{
  id v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;

  v4 = a3;
  if (-[MGWrapper supportsSideButtonActivation](self->_mgWrapper, "supportsSideButtonActivation"))
  {
    v5 = CFSTR("SiriEducationHomeAffordance");
  }
  else if (-[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", &unk_24F34DD48))
  {
    objc_msgSend(CFSTR("SiriEducationHomeButton"), "stringByAppendingString:", CFSTR("_3x_"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("SiriEducationHomeButton");
  }
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    v6 = CFSTR("Dark");
  else
    v6 = CFSTR("Light");
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (float)educationAssetTopPadding
{
  float v3;
  void *v4;
  float v5;

  if (-[MGWrapper supportsSideButtonActivation](self->_mgWrapper, "supportsSideButtonActivation"))
    v3 = 60.0;
  else
    v3 = 30.0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", &unk_24F34DD60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", &unk_24F34E150);
  if (-[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", v4))
  {
    v5 = 40.0;
  }
  else
  {
    v5 = 20.0;
    if (!-[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", &unk_24F34DD78))
    {
      if (-[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", &unk_24F34DD90))
        v5 = 15.0;
      else
        v5 = v3;
    }
  }

  return v5;
}

- (CGSize)educationAssetSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = -[MGWrapper supportsSideButtonActivation](self->_mgWrapper, "supportsSideButtonActivation");
  if (v3)
    v4 = 263.3;
  else
    v4 = 153.0;
  if (v3)
    v5 = 332.67;
  else
    v5 = 313.33;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", &unk_24F34DDA8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", &unk_24F34E150);
  if (-[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", v6)
    || -[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", &unk_24F34DDC0))
  {
    v7 = 0.9;
  }
  else
  {
    if (!-[MGWrapper MGIsDeviceOneOfTypes:](self->_mgWrapper, "MGIsDeviceOneOfTypes:", &unk_24F34DDD8))
      goto LABEL_11;
    v7 = 0.74;
  }
  v5 = v5 * v7;
  v4 = v4 * v7;
LABEL_11:

  v8 = v4;
  v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)footerTextBaselineFromTop
{
  return 11.0;
}

- (double)footerTextBottomPadding
{
  return 15.0;
}

- (double)paddingFromTop
{
  return 15.0;
}

- (double)continueButtonFromBottom
{
  return 44.0;
}

- (double)continueButtonFromBottomTwoButtons
{
  return 60.0;
}

- (double)finishEnrollmentFromBottom
{
  return 60.0;
}

- (double)footerSkipButtonBaselineFromBottom
{
  return 15.0;
}

- (id)footerLabelFont
{
  double v2;

  v2 = 13.0;
  if (!self->_isIpad)
    v2 = 12.0;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)footerHorizontalPadding
{
  void *v3;
  double v4;
  double v5;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 <= 320.0)
    return 3.5;
  -[VTUIStyle horizontalPadding](self, "horizontalPadding");
  return result;
}

- (id)footerButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_lightSystemFontOfSize:", 17.0);
}

- (id)footerTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
}

- (double)footerButtonMaximumWidth
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  result = 340.0;
  if (v4 <= 320.0)
    return 288.0;
  return result;
}

- (double)laterButtonBaselinePadding
{
  return 36.0;
}

- (double)secondaryButtonBaselinePadding
{
  return 36.0;
}

- (id)proxHeaderFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 30.0, *MEMORY[0x24BEBB5E8]);
}

- (id)proxHeaderColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

- (id)proxPageLabelColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

- (id)proxInstructionFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 28.0, *MEMORY[0x24BEBB5E8]);
}

- (id)proxInstructionColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

- (id)proxSubtitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
}

- (id)proxSubtitleColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

- (id)proxPrimaryButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB600]);
}

- (id)proxCancelFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB600]);
}

- (id)proxPrimaryButtonColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
}

- (double)proxPrimaryButtonHeight
{
  return 50.0;
}

- (double)proxLeading
{
  return 36.0;
}

- (double)proxLeadingLandscape
{
  return 16.0;
}

- (double)proxTrailing
{
  return 36.0;
}

- (double)proxTitleTrailingLandscape
{
  return 46.0;
}

- (double)proxTrailingLandscape
{
  return 16.0;
}

- (double)proxPaddingFromBottom
{
  return 36.0;
}

- (double)proxPaddingSuccessFromBottom
{
  return 28.0;
}

- (double)proxPaddingSuccessFromBottomLandscape
{
  return 16.0;
}

- (double)proxTopPaddingVoiceSelectionOptions
{
  return 16.0;
}

- (double)proxBottomPaddingVoiceSelectionOptions
{
  return 16.0;
}

- (double)proxChooseForMeTopPaddingFromContinueButton
{
  return 8.0;
}

- (double)proxTitleFirstBaselineFromTop
{
  return 56.0;
}

- (double)proxIntroOrbFromTopLandscape
{
  return -43.0;
}

- (double)proxIntroOrbImageFromTopLandscape
{
  return 24.0;
}

- (double)proxIntroTitleFromTop
{
  return 30.0;
}

- (double)proxIntroTitleFromTopLandscape
{
  return 30.0;
}

- (double)proxPaddingFromTop
{
  return 0.0;
}

- (double)proxPaddingIntroSubtitleLandscape
{
  return 12.0;
}

- (double)proxPaddingTrainingTitle
{
  return 0.0;
}

- (double)proxPaddingTrainingTitleLandscape
{
  return -28.0;
}

- (double)proxPaddingDataSharingSubtitle
{
  return 20.0;
}

- (double)proxPaddingIntroSubtitle
{
  return 6.0;
}

- (double)proxPaddingSuccessTitleLandscape
{
  return 170.0;
}

- (double)proxPaddingSuccessSubtitle
{
  return 6.0;
}

- (double)proxPaddingFootnoteButton
{
  return 10.0;
}

- (double)proxPaddingSkipButtonPageLabel
{
  return 24.0;
}

- (double)proxPaddingTryAgainTitleLandscape
{
  return 170.0;
}

- (double)proxViewMaxWidth
{
  return 400.0;
}

- (double)proxViewHeight
{
  return 390.0;
}

- (double)proxViewMaxWidthPhoneLandscape
{
  return 320.0;
}

- (double)proxViewHeightPhoneLandscape
{
  return 370.0;
}

- (id)proxPageFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB610]);
}

- (double)proxStatusLabelMaxHeight
{
  return 200.0;
}

- (double)proxPageFirstBaselineBottom
{
  return 22.0;
}

- (double)proxSiriLogoHeightWidth
{
  return 76.0;
}

- (double)proxSiriLogoHeightWidthSmall
{
  return 54.0;
}

- (double)proxContainerHorizontalVerticalPadding
{
  return 6.0;
}

- (double)proxContainerCornerRadius
{
  void *v2;
  double result;
  void *v4;
  int v5;

  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDeviceIPad"))
  {

    return 13.0;
  }
  else
  {
    +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsSideButtonActivation");

    result = 34.0;
    if (!v5)
      return 13.0;
  }
  return result;
}

- (double)proxViewLanguageOptionsHeight
{
  return 110.0;
}

- (double)proxViewLanguageOptionsHeightPhoneLandscape
{
  return 80.0;
}

- (double)proxSettingsLabelBottomMargin
{
  return 5.0;
}

- (double)proxTrainingInstructionLabelHorizontalOffset
{
  return 5.0;
}

- (double)proxTrainingDismissButtonHorizontalPadding
{
  return -32.0;
}

- (double)proxTrainingDismissButtonVerticalPaddingBottom
{
  return 28.0;
}

- (double)proxTrainingDismissButtonVerticalPaddingTop
{
  return 32.0;
}

- (double)proxTrainingDismissButtonWidthOrHeight
{
  return 24.0;
}

- (double)proxTrainingDismissButtonPhoneLandscapeHorizontalPadding
{
  return 12.0;
}

- (double)proxAboutLinkFirstBaselineFromTop
{
  return 16.0;
}

- (id)proxHSDescription:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v12;

  v4 = a3;
  -[VTUIStyle VTUIDeviceSpecificString:](self, "VTUIDeviceSpecificString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VTUIStyle audioProductID](self, "audioProductID");
  v7 = v6;
  if ((unint64_t)(v6 - 8202) <= 0x1B && ((1 << (v6 - 10)) & 0xC2AB71F) != 0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    goto LABEL_4;
  }
  if ((v6 - 8212) <= 0x10 && ((1 << (v6 - 20)) & 0x116A1) != 0)
  {
    v12 = _os_feature_enabled_impl();
    v8 = (void *)MEMORY[0x24BDD17C8];
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SIRI_AND_%@_PID_%ld"), v4, v7);
      goto LABEL_5;
    }
LABEL_4:
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_PID_%ld"), v4, v7);
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle VTUIDeviceSpecificString:](self, "VTUIDeviceSpecificString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }

  return v5;
}

- (BOOL)proxAccessorySupportsCompactTrigger
{
  int v2;
  int v3;
  void *v4;
  int v5;

  v2 = -[VTUIStyle audioProductID](self, "audioProductID");
  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentLocaleSupportsCompactVoiceTrigger");

    if (v5)
    {
      if ((v2 - 8212) <= 0x10)
        LOBYTE(v3) = (0x116A1u >> (v2 - 20)) & 1;
      else
        LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (double)turnOnSiriImageOffsetFromTop
{
  void *v3;
  double v4;
  double v5;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 <= 668.0)
    return 0.0;
  -[VTUIStyle orbImageOffsetFromTopEnrollment](self, "orbImageOffsetFromTopEnrollment");
  return result;
}

- (id)turnOnSiriContinueButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 18.0);
}

- (double)turnOnSiriContinueButtonWidth
{
  return 250.0;
}

- (double)turnOnSiriContinueButtonHeight
{
  return 50.0;
}

- (double)bottomOfContinueToNotNowFirstBaseline
{
  return 36.0;
}

- (double)turnOnSiriSubtitle1BaselineOffset
{
  double result;

  result = 34.0;
  if (!self->_isIpad)
    return 14.0;
  return result;
}

- (double)turnOnSiriSubtitle2BaselineOffset
{
  double result;

  result = 34.0;
  if (!self->_isIpad)
    return 14.0;
  return result;
}

- (double)turnOnSiriFooterOffset
{
  return 10.0;
}

- (double)continueButtonPaddingTop
{
  return 10.0;
}

- (BOOL)supportsSideButtonActivation
{
  return -[MGWrapper supportsSideButtonActivation](self->_mgWrapper, "supportsSideButtonActivation");
}

- (BOOL)isIpad
{
  return -[MGWrapper isDeviceIPad](self->_mgWrapper, "isDeviceIPad");
}

- (void)_createStringSuffixesForDevice
{
  NSArray *v3;
  id v4;
  int v5;
  _BOOL4 v6;
  const __CFString *v7;
  NSArray *deviceStringSuffixes;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BE09528]);
  objc_msgSend(v4, "spokenLanguageCode");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v9, "hasSuffix:", CFSTR("US"));
  v6 = -[VTUIStyle isHeySiriAlwaysOn](self, "isHeySiriAlwaysOn");
  if (v6)
    -[NSArray addObject:](v3, "addObject:", CFSTR("_AOP"));
  if (!-[NSString isEqualToString:](self->_deviceClass, "isEqualToString:", CFSTR("iPod")))
  {
    if (-[NSString isEqualToString:](self->_deviceClass, "isEqualToString:", CFSTR("iPhone")))
    {
      if (v5)
      {
        -[NSArray addObject:](v3, "addObject:", CFSTR("_IPHONE"));
        if (!v6)
          goto LABEL_23;
      }
      else
      {
        -[NSArray addObject:](v3, "addObject:", CFSTR("_NONUS_IPHONE"));
        -[NSArray addObject:](v3, "addObject:", CFSTR("_IPHONE"));
        if (!v6)
          goto LABEL_23;
        -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", CFSTR("_NONUS_AOP_IPHONE"), 0);
      }
      -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", CFSTR("_AOP_IPHONE"), 0);
      if (!self->_supportSideButtonActivation)
        goto LABEL_23;
      v7 = CFSTR("_AOP_SIDE_BUTTON");
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_deviceClass, "isEqualToString:", CFSTR("iPad")))
        goto LABEL_23;
      if (v5)
      {
        -[NSArray addObject:](v3, "addObject:", CFSTR("_IPAD"));
        if (!v6)
          goto LABEL_23;
      }
      else
      {
        -[NSArray addObject:](v3, "addObject:", CFSTR("_NONUS_IPAD"));
        -[NSArray addObject:](v3, "addObject:", CFSTR("_IPAD"));
        if (!v6)
          goto LABEL_23;
        -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", CFSTR("_NONUS_AOP_IPAD"), 0);
      }
      if (self->_supportSideButtonActivation)
        -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", CFSTR("_AOP_TOP_BUTTON"), 0);
      v7 = CFSTR("_AOP_IPAD");
    }
    -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", v7, 0);
    goto LABEL_23;
  }
  -[NSArray addObject:](v3, "addObject:", CFSTR("_IPOD"));
LABEL_23:
  deviceStringSuffixes = self->_deviceStringSuffixes;
  self->_deviceStringSuffixes = v3;

}

- (double)radarBtnVerticalPadding
{
  return 10.0;
}

- (double)radarBtnHorizontalPadding
{
  return 5.0;
}

- (id)VTUIDeviceSpecificString:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_deviceStringSuffixes;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "addObject:", v4);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v23;
LABEL_11:
      v17 = 0;
      v18 = v15;
      while (1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper", (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "uiLocalizedStringForKey:", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v15, "isEqualToString:", v19))
          break;
        ++v17;
        v18 = v15;
        if (v14 == v17)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v14)
            goto LABEL_11;
          break;
        }
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)VTUIDeviceSpecificAudioHintFileName:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    if (-[NSArray containsObject:](self->_deviceStringSuffixes, "containsObject:", CFSTR("_IPHONE")))
    {
      v5 = CFSTR("_IPHONE");
    }
    else if (-[NSArray containsObject:](self->_deviceStringSuffixes, "containsObject:", CFSTR("_IPAD")))
    {
      v5 = CFSTR("_IPAD");
    }
    else
    {
      if (!-[NSArray containsObject:](self->_deviceStringSuffixes, "containsObject:", CFSTR("_IPOD")))
      {
        v7 = v4;
        goto LABEL_10;
      }
      v5 = CFSTR("_IPOD");
    }
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v6 = v7;
    goto LABEL_11;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (BOOL)isSmallestOnboardingDeviceInBuddy
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  return v5 <= 568.0 && self->_isBuddyOrFollowUp;
}

- (id)smallestDeviceOnboardingAsset
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("SiriOnboarding"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isGreenTeaCapableDevice
{
  if (isGreenTeaCapableDevice___greenTeaCapabilityToken != -1)
    dispatch_once(&isGreenTeaCapableDevice___greenTeaCapabilityToken, &__block_literal_global_4);
  return (isGreenTeaCapableDevice___greenTea | CFPreferencesGetAppBooleanValue(CFSTR("fakeGreenTea"), CFSTR("com.apple.VoiceTriggerUI.cn"), 0)) != 0;
}

uint64_t __36__VTUIStyle_isGreenTeaCapableDevice__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isGreenTeaCapableDevice___greenTea = result;
  return result;
}

- (id)dynamicColorWithLightColor:(id)a3 darkColor:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BEBDAB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  v15[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "_dynamicColorWithColorsByTraitCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)shouldSetupForMultipleTriggerPhrases
{
  int v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    if (-[VTUIStyle currentLocaleSupportsCompactVoiceTrigger](self, "currentLocaleSupportsCompactVoiceTrigger"))
      v3 = AFDeviceSupportsANE();
    else
      v3 = 0;
    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, 0);

    if (v5 != 1)
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v6 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Should NOT");
    if (v3)
      v7 = CFSTR("Should");
    v9 = 136315394;
    v10 = "-[VTUIStyle shouldSetupForMultipleTriggerPhrases]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s %@ set up for multiple triggers", (uint8_t *)&v9, 0x16u);
  }
  return v3;
}

- (BOOL)shouldShowVoiceTriggerConfirmationInBuddy
{
  void *v2;
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  int AppBooleanValue;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  v4 = CFSTR("not needed");
  v5 = &stru_24F340078;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isVoiceTriggerRepromptRequired");

    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("forceNeedsConfirmation"), CFSTR("com.apple.VoiceTriggerUI.vtconf"), 0);
    if (v7)
      v4 = CFSTR("needed");
    if (AppBooleanValue)
      v9 = 1;
    else
      v9 = v7;
    if (AppBooleanValue)
      v5 = CFSTR("(forced)");
  }
  else
  {
    v9 = 0;
  }
  v10 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[VTUIStyle shouldShowVoiceTriggerConfirmationInBuddy]";
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_229EF7000, v10, OS_LOG_TYPE_DEFAULT, "%s VT confirmation is %@ %@", (uint8_t *)&v15, 0x20u);
  }
  v11 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("Will not show");
    if (v9)
      v12 = CFSTR("Will show");
    v15 = 136315650;
    v16 = "-[VTUIStyle shouldShowVoiceTriggerConfirmationInBuddy]";
    v17 = 2112;
    v18 = v12;
    if (v3)
      v13 = CFSTR("enabled");
    else
      v13 = CFSTR("not enabled");
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ VT confirmation - voice trigger is %@", (uint8_t *)&v15, 0x20u);
  }
  return v9;
}

- (BOOL)supportsSiriConversationsAndBargeIn
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE282E0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFlexibleFollowupsSupported");

  return v3;
}

- (BOOL)shouldPresentDisclosureForCompactVoiceTrigger
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && -[VTUIStyle currentLocaleSupportsCompactVoiceTrigger](self, "currentLocaleSupportsCompactVoiceTrigger"))
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "assistantIsEnabled");

    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "voiceTriggerEnabled");

    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v9);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasPresentedCompactVoiceTriggerDisclosure");

    v13 = 0;
    if (self->_isBuddyOrFollowUp && v4 && v6 && v10 && (v12 & 1) == 0)
      v13 = AFDeviceSupportsANE();
  }
  else
  {
    v13 = 0;
  }
  v14 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("should NOT present");
    if (v13)
      v15 = CFSTR("should present");
    v17 = 136315394;
    v18 = "-[VTUIStyle shouldPresentDisclosureForCompactVoiceTrigger]";
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s Compact trigger disclosure check: %@", (uint8_t *)&v17, 0x16u);
  }
  return v13;
}

- (BOOL)currentLocaleSupportsCompactVoiceTrigger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCompactVoiceTriggerAvailableForLanguageCode:", v3);

  return v6;
}

- (void)_prefetchHomePodInfo
{
  NSObject *v3;
  NSObject *settingsQueue;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VTUIStyle _prefetchHomePodInfo]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetch of HomePod Info", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    settingsQueue = self->_settingsQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__VTUIStyle__prefetchHomePodInfo__block_invoke;
    block[3] = &unk_24F33DA00;
    objc_copyWeak(&v6, (id *)buf);
    dispatch_async(settingsQueue, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __33__VTUIStyle__prefetchHomePodInfo__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 6);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2;
    v5[3] = &unk_24F33E320;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "isJustSiriEnabledInTheHome:", v5);
    objc_destroyWeak(&v6);
  }

}

void __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  _BYTE *WeakRetained;
  _BYTE *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5)
  {
    v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR))
      __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2_cold_1((uint64_t)v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("not enabled");
        if (a3)
          v10 = CFSTR("enabled");
        v11 = 136315394;
        v12 = "-[VTUIStyle _prefetchHomePodInfo]_block_invoke";
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Fetch of HomePod compact trigger enablement completed with result: %@", (uint8_t *)&v11, 0x16u);
      }
      v8[69] = a3;

    }
  }

}

- (int64_t)enrollmentMode
{
  return self->_enrollmentMode;
}

- (void)setEnrollmentMode:(int64_t)a3
{
  self->_enrollmentMode = a3;
}

- (BOOL)isBuddyOrFollowUp
{
  return self->_isBuddyOrFollowUp;
}

- (void)setIsBuddyOrFollowUp:(BOOL)a3
{
  self->_isBuddyOrFollowUp = a3;
}

- (BOOL)isHeySiriAlwaysOn
{
  return self->_isHeySiriAlwaysOn;
}

- (void)setIsHeySiriAlwaysOn:(BOOL)a3
{
  self->_isHeySiriAlwaysOn = a3;
}

- (BOOL)bluetoothDeviceSupportsHeySiri
{
  return self->_bluetoothDeviceSupportsHeySiri;
}

- (void)setBluetoothDeviceSupportsHeySiri:(BOOL)a3
{
  self->_bluetoothDeviceSupportsHeySiri = a3;
}

- (BOOL)supportSideButtonActivation
{
  return self->_supportSideButtonActivation;
}

- (void)setSupportSideButtonActivation:(BOOL)a3
{
  self->_supportSideButtonActivation = a3;
}

- (BOOL)isFloatingWithReducedWidth
{
  return self->_isFloatingWithReducedWidth;
}

- (void)setIsFloatingWithReducedWidth:(BOOL)a3
{
  self->_isFloatingWithReducedWidth = a3;
}

- (BOOL)shouldIncludeHomePodInCompactTriggerDisclosure
{
  return self->_shouldIncludeHomePodInCompactTriggerDisclosure;
}

- (void)setShouldIncludeHomePodInCompactTriggerDisclosure:(BOOL)a3
{
  self->_shouldIncludeHomePodInCompactTriggerDisclosure = a3;
}

- (int64_t)audioProductID
{
  return self->_audioProductID;
}

- (void)setAudioProductID:(int64_t)a3
{
  self->_audioProductID = a3;
}

- (NSString)audioAccessoryName
{
  return self->_audioAccessoryName;
}

- (void)setAudioAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_audioAccessoryName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryName, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_mgWrapper, 0);
  objc_storeStrong((id *)&self->_bodyMetricsForScaling, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceStringSuffixes, 0);
}

void __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[VTUIStyle _prefetchHomePodInfo]_block_invoke_2";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_229EF7000, a2, OS_LOG_TYPE_ERROR, "%s Fetch of HomePod compact trigger enablement failed with error:%@", (uint8_t *)&v2, 0x16u);
}

@end
