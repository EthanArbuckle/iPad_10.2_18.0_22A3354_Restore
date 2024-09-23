@implementation _UIBarButtonItemData

- (id)backgroundImageForState:(int64_t)a3
{
  UIImage *v3;

  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 8) != 0)
  {
    v3 = self->_backgroundImage[a3];
  }
  else
  {
    -[_UIBarButtonItemDataFallback backgroundImageForState:style:](self->_fallback, "backgroundImageForState:style:");
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)titleTextAttributesForState:(int64_t)a3
{
  $100B9A493E739CE1FF52F8F532CEF0CE *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;

  v5 = &self->_stateFlags[2 * a3];
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v6 = 0;
    if ((*(_BYTE *)v5 & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    -[_UIBarButtonItemData _fallbackFontForState:](self, "_fallbackFontForState:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)v5 & 2) != 0)
    {
LABEL_3:
      v7 = 0;
      goto LABEL_6;
    }
  }
  -[_UIBarButtonItemData _fallbackColorForState:](self, "_fallbackColorForState:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = self->_titleTextAttributes[a3];
  if (v6 | v7)
  {
    v9 = (void *)-[NSDictionary mutableCopy](v8, "mutableCopy");
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    if (v6)
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v6, *(_QWORD *)off_1E1678D90);
    if (v7)
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v7, *(_QWORD *)off_1E1678D98);
  }
  else
  {
    v12 = v8;
  }

  return v12;
}

- (id)_fallbackFontForState:(int64_t)a3
{
  void *v3;
  NSDictionary *v4;

  if (a3 == 3 && (*(_BYTE *)&self->_stateFlags[2] & 1) != 0)
  {
    v4 = self->_titleTextAttributes[1];
    goto LABEL_7;
  }
  if ((*(_BYTE *)self->_stateFlags & 1) != 0)
  {
    v4 = self->_titleTextAttributes[0];
LABEL_7:
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  -[_UIBarButtonItemDataFallback fontForState:style:](self->_fallback, "fontForState:style:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)_fallbackColorForState:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a3 == 3 && (*(_BYTE *)&self->_stateFlags[2] & 2) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[1], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((*(_BYTE *)self->_stateFlags & 2) == 0)
  {
    -[_UIBarButtonItemDataFallback colorForState:style:](self->_fallback, "colorForState:style:", a3, self->_style);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v5 = (void *)v4;
    return v5;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[0], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)fontForState:(int64_t)a3 style:(int64_t)a4
{
  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 1) != 0)
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[a3], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90, a4);
  else
    -[_UIBarButtonItemData _fallbackFontForState:](self, "_fallbackFontForState:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)colorForState:(int64_t)a3 style:(int64_t)a4
{
  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 2) != 0)
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[a3], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98, a4);
  else
    -[_UIBarButtonItemData _fallbackColorForState:](self, "_fallbackColorForState:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)backgroundImageForState:(int64_t)a3 style:(int64_t)a4
{
  UIImage *v4;

  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 8) != 0)
  {
    v4 = self->_backgroundImage[a3];
  }
  else
  {
    -[_UIBarButtonItemDataFallback backgroundImageForState:style:](self->_fallback, "backgroundImageForState:style:");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3
{
  double horizontal;
  double vertical;
  UIOffset *backgroundImagePositionAdjustment;
  UIOffset result;

  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 0x10) != 0)
  {
    backgroundImagePositionAdjustment = &self->_backgroundImagePositionAdjustment[a3];
LABEL_8:
    horizontal = backgroundImagePositionAdjustment->horizontal;
    vertical = backgroundImagePositionAdjustment->vertical;
    goto LABEL_11;
  }
  if (a3 == 3 && (*(_BYTE *)&self->_stateFlags[2] & 0x10) != 0)
  {
    horizontal = self->_backgroundImagePositionAdjustment[1].horizontal;
    vertical = self->_backgroundImagePositionAdjustment[1].vertical;
    goto LABEL_11;
  }
  if ((*(_BYTE *)self->_stateFlags & 0x10) != 0)
  {
    backgroundImagePositionAdjustment = self->_backgroundImagePositionAdjustment;
    goto LABEL_8;
  }
  -[_UIBarButtonItemDataFallback backgroundImagePositionAdjustmentForState:style:](self->_fallback, "backgroundImagePositionAdjustmentForState:style:");
LABEL_11:
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (id)copyAsBackButtonDataWithIndicatorsAndFallbackFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  id *v6;
  uint64_t v8;

  v4 = (id *)a3;
  if (!v4)
  {
    if ((*(_BYTE *)&self->_dataFlags & 1) != 0)
    {
      v8 = -[_UIBarButtonItemData copy](self, "copy");
    }
    else
    {
      if ((_UIBarButtonItemData *)qword_1ECD7A750 != self && _MergedGlobals_3_20 != (_QWORD)self)
        goto LABEL_2;
      +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id *)v8;
    goto LABEL_13;
  }
LABEL_2:
  -[_UIBarButtonItemData replicate](self, "replicate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id *)v5;
  *(_QWORD *)(v5 + 304) = 0;
  *(_BYTE *)(v5 + 296) |= 1u;
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 256), v4[32]);
    objc_storeStrong(v6 + 28, v4[28]);
    objc_storeStrong(v6 + 29, v4[29]);
  }
LABEL_13:

  return v6;
}

- (UIImage)backIndicatorImage
{
  UIImage *v2;
  UIImage *backIndicatorImage;
  uint64_t v4;
  void *v5;

  if ((*(_BYTE *)&self->_dataFlags & 1) != 0)
  {
    backIndicatorImage = self->_backIndicatorImage;
    if (!backIndicatorImage)
    {
      backIndicatorImage = (UIImage *)backIndicatorImage_indicator;
      if (!backIndicatorImage_indicator)
      {
        if ((_UIBarsUseDynamicType() & 1) != 0)
          +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.backward"));
        else
          +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault"));
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)backIndicatorImage_indicator;
        backIndicatorImage_indicator = v4;

        backIndicatorImage = (UIImage *)backIndicatorImage_indicator;
      }
    }
    v2 = backIndicatorImage;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)standardBackButtonData
{
  void *v2;
  _UIBarButtonItemData *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)qword_1ECD7A758;
  if (!qword_1ECD7A758)
  {
    v3 = -[_UIBarButtonItemData initWithStyle:]([_UIBarButtonItemData alloc], "initWithStyle:", 0);
    v4 = (void *)qword_1ECD7A758;
    qword_1ECD7A758 = (uint64_t)v3;

    v5 = (void *)qword_1ECD7A758;
    *(_BYTE *)(qword_1ECD7A758 + 296) |= 1u;
    v6 = (id)objc_msgSend(v5, "markReadOnly");
    v2 = (void *)qword_1ECD7A758;
  }
  return v2;
}

- (UIImage)backIndicatorTransitionMaskImage
{
  UIImage *v2;
  UIImage *backIndicatorTransitionMaskImage;
  const __CFString *v4;
  uint64_t v5;
  void *v6;

  if ((*(_BYTE *)&self->_dataFlags & 1) != 0)
  {
    backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
    if (!backIndicatorTransitionMaskImage)
    {
      backIndicatorTransitionMaskImage = (UIImage *)backIndicatorTransitionMaskImage_indicatorMask;
      if (!backIndicatorTransitionMaskImage_indicatorMask)
      {
        if (_UIBarsUseDynamicType())
          v4 = CFSTR("UINavigationBarTitleTransitionBackIndicatorMaskSymbol");
        else
          v4 = CFSTR("UINavigationBarTitleTransitionBackIndicatorMask");
        +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)backIndicatorTransitionMaskImage_indicatorMask;
        backIndicatorTransitionMaskImage_indicatorMask = v5;

        backIndicatorTransitionMaskImage = (UIImage *)backIndicatorTransitionMaskImage_indicatorMask;
      }
    }
    v2 = backIndicatorTransitionMaskImage;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (UIImageSymbolConfiguration)backIndicatorSymbolConfiguration
{
  UIImage *backIndicatorImage;
  void *v4;

  if ((*(_BYTE *)&self->_dataFlags & 1) == 0)
    goto LABEL_6;
  backIndicatorImage = self->_backIndicatorImage;
  if (!backIndicatorImage)
  {
    if (_UIBarsUseDynamicType())
      goto LABEL_4;
LABEL_6:
    v4 = 0;
    return (UIImageSymbolConfiguration *)v4;
  }
  if (!-[UIImage isSymbolImage](backIndicatorImage, "isSymbolImage"))
    goto LABEL_6;
LABEL_4:
  -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_backIndicatorSymbolConfiguration, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIImageSymbolConfiguration *)v4;
}

- (UIImageSymbolConfiguration)backIndicatorTransitionMaskSymbolConfiguration
{
  UIImage *backIndicatorTransitionMaskImage;
  void *v4;

  if ((*(_BYTE *)&self->_dataFlags & 1) == 0)
    goto LABEL_6;
  backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
  if (!backIndicatorTransitionMaskImage)
  {
    if (_UIBarsUseDynamicType())
      goto LABEL_4;
LABEL_6:
    v4 = 0;
    return (UIImageSymbolConfiguration *)v4;
  }
  if (!-[UIImage isSymbolImage](backIndicatorTransitionMaskImage, "isSymbolImage"))
    goto LABEL_6;
LABEL_4:
  -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_backIndicatorSymbolConfiguration, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIImageSymbolConfiguration *)v4;
}

- (id)__backIndicatorConfigurationForConfig:(uint64_t)a3 withScale:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5)
    {
      v7 = v5;
    }
    else if ((a1[264] & 1) != 0)
    {
      objc_msgSend(a1, "titleTextAttributesForState:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "fontDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v12, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v13, a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "backIndicatorTextStyleForSymbolConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v8, a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)backIndicatorTextStyleForSymbolConfiguration
{
  return (id)-[_UIBarButtonItemDataFallback backIndicatorTextStyleForSymbolConfiguration](self->_fallback, "backIndicatorTextStyleForSymbolConfiguration");
}

+ (id)standardItemDataForStyle:(int64_t)a3
{
  uint64_t *v4;
  id v5;
  uint64_t v6;
  _UIBarButtonItemData *v9;
  id v10;
  id v11;
  void *v13;

  if (a3 && a3 != 7)
  {
    if (a3 == 2)
    {
      v4 = &_MergedGlobals_3_20;
      v5 = (id)_MergedGlobals_3_20;
      if (!_MergedGlobals_3_20)
      {
        v6 = 2;
LABEL_10:
        v9 = -[_UIBarButtonItemData initWithStyle:]([_UIBarButtonItemData alloc], "initWithStyle:", v6);
        v10 = (id)*v4;
        *v4 = (uint64_t)v9;

        v11 = (id)objc_msgSend((id)*v4, "markReadOnly");
        v5 = (id)*v4;
        return v5;
      }
      return v5;
    }
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBarButtonItemData.m"), 134, CFSTR("Unsupported style: %li"), a3);

    }
  }
  v4 = &qword_1ECD7A750;
  v5 = (id)qword_1ECD7A750;
  if (!qword_1ECD7A750)
  {
    v6 = 0;
    goto LABEL_10;
  }
  return v5;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  UIImageSymbolConfiguration *imageSymbolConfiguration;
  void *v4;
  UIImageSymbolConfiguration *v5;
  void *v6;
  UIImageSymbolConfiguration *v7;

  imageSymbolConfiguration = self->_imageSymbolConfiguration;
  if (!imageSymbolConfiguration)
  {
    if ((*(_BYTE *)self->_stateFlags & 1) != 0)
    {
      -[_UIBarButtonItemData titleTextAttributesForState:](self, "titleTextAttributesForState:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v4, 3);
    }
    else
    {
      -[_UIBarButtonItemData textStyleForSymbolConfiguration](self, "textStyleForSymbolConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v4, 3);
    }
    v5 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageSymbolConfiguration;
    self->_imageSymbolConfiguration = v5;

    imageSymbolConfiguration = self->_imageSymbolConfiguration;
  }
  return imageSymbolConfiguration;
}

- (int64_t)style
{
  return self->_style;
}

- (_UIBarButtonItemData)initWithStyle:(int64_t)a3
{
  int64_t v4;
  _UIBarButtonItemData *v5;
  _UIBarButtonItemData *v6;
  uint64_t v7;
  _UIBarButtonItemDataFallback *fallback;
  void *v11;
  objc_super v12;

  if (a3 == 7)
    v4 = 0;
  else
    v4 = a3;
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBarButtonItemData.m"), 165, CFSTR("Unknown or unsupported UIBarButtonItemStyle style %li"), v4);

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIBarButtonItemData;
  v5 = -[_UIBarButtonItemData init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_style = v4;
    +[_UIBarButtonItemDataBaseFallback fallback](_UIBarButtonItemDataBaseFallback, "fallback");
    v7 = objc_claimAutoreleasedReturnValue();
    fallback = v6->_fallback;
    v6->_fallback = (_UIBarButtonItemDataFallback *)v7;

  }
  return v6;
}

- (id)textStyleForSymbolConfiguration
{
  return (id)-[_UIBarButtonItemDataFallback textStyleForSymbolConfiguration](self->_fallback, "textStyleForSymbolConfiguration");
}

- (_UIBarButtonItemData)dataWithNewFallback:(id)a3
{
  id v4;
  id *v5;
  void *v6;

  v4 = a3;
  -[_UIBarAppearanceData writableInstance](self, "writableInstance");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (!v4)
  {
    +[_UIBarButtonItemDataBaseFallback fallback](_UIBarButtonItemDataBaseFallback, "fallback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong(v5 + 32, v6);
  if (!v4)

  return (_UIBarButtonItemData *)v5;
}

- (id)replicate
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_UIBarButtonItemData;
  -[_UIBarAppearanceData replicate](&v22, sel_replicate);
  v3 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v3 + 304) = self->_style;
  *(_QWORD *)(v3 + 296) = *(_QWORD *)&self->_dataFlags;
  objc_storeStrong((id *)(v3 + 256), self->_fallback);
  v4 = -[UIImage copy](self->_backIndicatorImage, "copy");
  v5 = *(void **)(v3 + 224);
  *(_QWORD *)(v3 + 224) = v4;

  v6 = -[UIImage copy](self->_backIndicatorTransitionMaskImage, "copy");
  v7 = *(void **)(v3 + 232);
  *(_QWORD *)(v3 + 232) = v6;

  v8 = -[UIImageSymbolConfiguration copy](self->_imageSymbolConfiguration, "copy");
  v9 = *(void **)(v3 + 208);
  *(_QWORD *)(v3 + 208) = v8;

  v10 = -[UIImageSymbolConfiguration copy](self->_compactImageSymbolConfiguration, "copy");
  v11 = *(void **)(v3 + 216);
  *(_QWORD *)(v3 + 216) = v10;

  v12 = -[UIImageSymbolConfiguration copy](self->_backIndicatorSymbolConfiguration, "copy");
  v13 = *(void **)(v3 + 240);
  *(_QWORD *)(v3 + 240) = v12;

  v14 = -[UIImageSymbolConfiguration copy](self->_compactBackIndicatorSymbolConfiguration, "copy");
  v15 = *(void **)(v3 + 248);
  *(_QWORD *)(v3 + 248) = v14;

  v16 = 0;
  v17 = 0;
  v18 = v3 + 16;
  do
  {
    v19 = -[NSDictionary copy](self->_titleTextAttributes[v17 / 2], "copy");
    v20 = *(void **)(v18 + v17 * 4);
    *(_QWORD *)(v18 + v17 * 4) = v19;

    *(UIOffset *)(v3 + 80 + v16 * 16) = self->_titlePositionAdjustment[v16];
    objc_storeStrong((id *)(v3 + v17 * 4 + 48), self->_backgroundImage[v17 / 2]);
    *(UIOffset *)(v3 + 144 + v16 * 16) = self->_backgroundImagePositionAdjustment[v16];
    *(_QWORD *)(v3 + 264 + v17 * 4) = *(_QWORD *)&self->_stateFlags[v17];
    v17 += 2;
    ++v16;
  }
  while (v17 != 8);
  return (id)v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  _QWORD *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;
  UIImage *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  UIImage *v12;
  _BOOL4 v13;
  void *v14;
  UIImage *v15;
  BOOL v16;
  uint64_t v17;
  int32x2_t v18;
  int32x2_t v19;
  void *v20;
  UIImage *v21;
  BOOL v22;
  _BOOL4 v23;
  void *v24;
  UIImage *v25;
  BOOL v26;
  _BOOL4 v27;
  BOOL v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_UIBarButtonItemData;
  if (!-[_UIBarAppearanceData checkEqualTo:](&v30, sel_checkEqualTo_, v4)
    || self->_style != v4[38]
    || ((*((unsigned __int8 *)v4 + 296) ^ *(_BYTE *)&self->_dataFlags) & 1) != 0)
  {
    goto LABEL_46;
  }
  v5 = (void *)v4[32];
  v6 = self->_fallback;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_45;
    v10 = -[UIImage isEqual:](v6, "isEqual:", v7);

    if (!v10)
      goto LABEL_46;
  }
  v11 = (void *)v4[28];
  v6 = self->_backIndicatorImage;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_45;
    v13 = -[UIImage isEqual:](v6, "isEqual:", v12);

    if (!v13)
      goto LABEL_46;
  }
  v14 = (void *)v4[29];
  v6 = self->_backIndicatorTransitionMaskImage;
  v15 = v14;
  if (v6 != v15)
  {
    v8 = v15;
    if (v6 && v15)
    {
      v16 = -[UIImage isEqual:](v6, "isEqual:", v15);

      if (!v16)
        goto LABEL_46;
      goto LABEL_24;
    }
LABEL_45:

    goto LABEL_46;
  }

LABEL_24:
  v17 = 0;
  while (1)
  {
    v18 = vmovn_s64(vceqq_f64((float64x2_t)self->_titlePositionAdjustment[v17], *(float64x2_t *)&v4[2 * v17 + 10]));
    if ((v18.i32[0] & v18.i32[1] & 1) == 0)
      break;
    v19 = vmovn_s64(vceqq_f64((float64x2_t)self->_backgroundImagePositionAdjustment[v17], *(float64x2_t *)&v4[2 * v17 + 18]));
    if ((v19.i32[0] & v19.i32[1] & 1) == 0)
      break;
    v20 = (void *)v4[v17 + 6];
    v6 = self->_backgroundImage[v17];
    v21 = v20;
    if (v6 == v21)
    {

    }
    else
    {
      v8 = v21;
      if (v6)
        v22 = v21 == 0;
      else
        v22 = 1;
      if (v22)
        goto LABEL_45;
      v23 = -[UIImage isEqual:](v6, "isEqual:", v21);

      if (!v23)
        break;
    }
    v24 = (void *)v4[v17 + 2];
    v6 = self->_titleTextAttributes[v17];
    v25 = v24;
    if (v6 == v25)
    {

    }
    else
    {
      v8 = v25;
      if (v6)
        v26 = v25 == 0;
      else
        v26 = 1;
      if (v26)
        goto LABEL_45;
      v27 = -[UIImage isEqual:](v6, "isEqual:", v25);

      if (!v27)
        break;
    }
    ++v17;
    v28 = 1;
    if (v17 == 4)
      goto LABEL_47;
  }
LABEL_46:
  v28 = 0;
LABEL_47:

  return v28;
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  double horizontal;
  double vertical;
  UIOffset *v6;
  UIOffset result;

  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 4) != 0)
  {
    v6 = &self->_titlePositionAdjustment[a3];
    horizontal = v6->horizontal;
    vertical = v6->vertical;
  }
  else
  {
    -[_UIBarButtonItemDataFallback titlePositionAdjustmentForState:style:](self->_fallback, "titlePositionAdjustmentForState:style:", a3, a3);
  }
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3
{
  double horizontal;
  double vertical;
  UIOffset *titlePositionAdjustment;
  UIOffset result;

  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 4) != 0)
  {
    titlePositionAdjustment = &self->_titlePositionAdjustment[a3];
LABEL_8:
    horizontal = titlePositionAdjustment->horizontal;
    vertical = titlePositionAdjustment->vertical;
    goto LABEL_11;
  }
  if (a3 == 3 && (*(_BYTE *)&self->_stateFlags[2] & 4) != 0)
  {
    horizontal = self->_titlePositionAdjustment[1].horizontal;
    vertical = self->_titlePositionAdjustment[1].vertical;
    goto LABEL_11;
  }
  if ((*(_BYTE *)self->_stateFlags & 4) != 0)
  {
    titlePositionAdjustment = self->_titlePositionAdjustment;
    goto LABEL_8;
  }
  -[_UIBarButtonItemDataFallback titlePositionAdjustmentForState:style:](self->_fallback, "titlePositionAdjustmentForState:style:");
LABEL_11:
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setBackIndicatorImage:(id)a3 transitionMaskImage:(id)a4
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if ((*(_BYTE *)&self->_dataFlags & 1) != 0)
  {
    -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
    objc_storeStrong((id *)&self->_backIndicatorImage, a3);
    objc_storeStrong((id *)&self->_backIndicatorTransitionMaskImage, a4);
  }

}

- (void)setTitleTextAttributes:(id)a3 forState:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;

  v7 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&self->_stateFlags[2 * a4] = *(_BYTE *)&self->_stateFlags[2 * a4] & 0xFE | (v8 != 0);

  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&self->_stateFlags[2 * a4] = *(_BYTE *)&self->_stateFlags[2 * a4] & 0xFD | (2 * (v9 != 0));

  v10 = (NSDictionary *)objc_msgSend(v7, "copy");
  v11 = self->_titleTextAttributes[a4];
  self->_titleTextAttributes[a4] = v10;

}

- (void).cxx_destruct
{
  uint64_t i;
  NSDictionary **titleTextAttributes;
  uint64_t j;

  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_compactBackIndicatorSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backIndicatorSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backIndicatorTransitionMaskImage, 0);
  objc_storeStrong((id *)&self->_backIndicatorImage, 0);
  objc_storeStrong((id *)&self->_compactImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  for (i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_backgroundImage[i], 0);
  titleTextAttributes = self->_titleTextAttributes;
  for (j = 3; j != -1; --j)
    objc_storeStrong((id *)&titleTextAttributes[j], 0);
}

- (BOOL)isBackButtonData
{
  return *(_BYTE *)&self->_dataFlags & 1;
}

- (_UIBarButtonItemDataFallback)fallback
{
  return self->_fallback;
}

- (void)_decodeTitleTextAttributesFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDictionary **titleTextAttributes;
  uint64_t v10;
  void *v11;
  $100B9A493E739CE1FF52F8F532CEF0CE *stateFlags;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  NSDictionary *v25;
  NSDictionary *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Normal.TitleTextAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", CFSTR("Normal.TitleTextAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  titleTextAttributes = self->_titleTextAttributes;
  objc_storeStrong((id *)self->_titleTextAttributes, v8);
  v10 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  stateFlags = self->_stateFlags;
  *(_BYTE *)self->_stateFlags = *(_BYTE *)self->_stateFlags & 0xFE | (v11 != 0);

  v13 = *(_QWORD *)off_1E1678D98;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)stateFlags = *(_BYTE *)stateFlags & 0xFD | (2 * (v14 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Highlighted.TitleTextAttributes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", CFSTR("Highlighted.TitleTextAttributes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)titleTextAttributes + 1, v16);
  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&stateFlags[2] = *(_BYTE *)&stateFlags[2] & 0xFE | (v17 != 0);

  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&stateFlags[2] = *(_BYTE *)&stateFlags[2] & 0xFD | (2 * (v18 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Disabled.TitleTextAttributes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", CFSTR("Disabled.TitleTextAttributes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)titleTextAttributes + 2, v20);
  objc_msgSend(v20, "objectForKeyedSubscript:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&stateFlags[4] = *(_BYTE *)&stateFlags[4] & 0xFE | (v21 != 0);

  objc_msgSend(v20, "objectForKeyedSubscript:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&stateFlags[4] = *(_BYTE *)&stateFlags[4] & 0xFD | (2 * (v22 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Focused.TitleTextAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v23);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", CFSTR("Focused.TitleTextAttributes"));
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v25 = titleTextAttributes[3];
  titleTextAttributes[3] = v24;
  v26 = v24;

  -[NSDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&stateFlags[6] = *(_BYTE *)&stateFlags[6] & 0xFE | (v27 != 0);

  -[NSDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)&stateFlags[6] = *(_BYTE *)&stateFlags[6] & 0xFD | (2 * (v28 != 0));
}

- (void)_decodeBackgroundImagesFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *backgroundImage;
  $100B9A493E739CE1FF52F8F532CEF0CE *stateFlags;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Normal.BackgroundImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v7, CFSTR("Normal.BackgroundImage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  backgroundImage = (id *)self->_backgroundImage;
  objc_storeStrong((id *)self->_backgroundImage, v9);
  stateFlags = self->_stateFlags;
  *(_BYTE *)self->_stateFlags = *(_BYTE *)self->_stateFlags & 0xF7 | (8 * (v9 != 0));
  v12 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Highlighted.BackgroundImage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v12, CFSTR("Highlighted.BackgroundImage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v14)
    v15 = v14;
  else
    v15 = v9;
  objc_storeStrong(backgroundImage + 1, v15);
  *(_BYTE *)&stateFlags[2] = *(_BYTE *)&stateFlags[2] & 0xF7 | (8 * (v14 != 0));
  v16 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Disabled.BackgroundImage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v16, CFSTR("Disabled.BackgroundImage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v18)
    v19 = v18;
  else
    v19 = v9;
  objc_storeStrong(backgroundImage + 2, v19);
  *(_BYTE *)&stateFlags[4] = *(_BYTE *)&stateFlags[4] & 0xF7 | (8 * (v18 != 0));
  v20 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Focused.BackgroundImage"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v24, "decodeObjectOfClass:forKey:", v20, CFSTR("Focused.BackgroundImage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v22)
    v23 = v22;
  else
    v23 = v15;
  objc_storeStrong(backgroundImage + 3, v23);
  *(_BYTE *)&stateFlags[6] = *(_BYTE *)&stateFlags[6] & 0xF7 | (8 * (v22 != 0));

}

- (void)_decodeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  char v15;
  $100B9A493E739CE1FF52F8F532CEF0CE *stateFlags;
  UIOffset *titlePositionAdjustment;
  __CFString *v18;
  id v19;
  __CFString *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  char v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  double v29;
  double v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  double v34;
  double v35;
  char v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("Normal.TitlePosition");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Normal.TitlePosition"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = v8;
  if (objc_msgSend(v9, "containsValueForKey:", v10))
  {
    objc_msgSend(v9, "decodeUIOffsetForKey:", v10);
    v12 = v11;
    v14 = v13;
    v15 = 4;
  }
  else
  {
    v15 = 0;
    v12 = 0.0;
    v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_BYTE *)self->_stateFlags = *(_BYTE *)self->_stateFlags & 0xFB | v15;
  if (v7)
  {

    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].horizontal = v12;
    self->_titlePositionAdjustment[0].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Highlighted.TitlePosition"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].horizontal = v12;
    self->_titlePositionAdjustment[0].vertical = v14;
    v18 = CFSTR("Highlighted.TitlePosition");
  }
  v19 = v9;
  v20 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", v20))
  {
    objc_msgSend(v19, "decodeUIOffsetForKey:", v20);
    v22 = v21;
    v24 = v23;
    v25 = 4;
  }
  else
  {
    v25 = 0;
    v22 = v12;
    v24 = v14;
  }

  *(_BYTE *)&stateFlags[2] = *(_BYTE *)&stateFlags[2] & 0xFB | v25;
  if (v7)
  {

    titlePositionAdjustment[1].horizontal = v22;
    titlePositionAdjustment[1].vertical = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Disabled.TitlePosition"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment[1].horizontal = v22;
    titlePositionAdjustment[1].vertical = v24;
    v26 = CFSTR("Disabled.TitlePosition");
  }
  v27 = v19;
  v28 = v26;
  if (objc_msgSend(v27, "containsValueForKey:", v28))
  {
    objc_msgSend(v27, "decodeUIOffsetForKey:", v28);
    v12 = v29;
    v14 = v30;
    v31 = 4;
  }
  else
  {
    v31 = 0;
  }

  *(_BYTE *)&stateFlags[4] = *(_BYTE *)&stateFlags[4] & 0xFB | v31;
  if (v7)
  {

    titlePositionAdjustment[2].horizontal = v12;
    titlePositionAdjustment[2].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Focused.TitlePosition"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment[2].horizontal = v12;
    titlePositionAdjustment[2].vertical = v14;
    v32 = CFSTR("Focused.TitlePosition");
  }
  v37 = v27;
  v33 = v32;
  if (objc_msgSend(v37, "containsValueForKey:", v33))
  {
    objc_msgSend(v37, "decodeUIOffsetForKey:", v33);
    v22 = v34;
    v24 = v35;
    v36 = 4;
  }
  else
  {
    v36 = 0;
  }

  *(_BYTE *)&stateFlags[6] = *(_BYTE *)&stateFlags[6] & 0xFB | v36;
  if (v7)

  titlePositionAdjustment[3].horizontal = v22;
  titlePositionAdjustment[3].vertical = v24;

}

- (void)_decodeBackgroundPositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  char v15;
  $100B9A493E739CE1FF52F8F532CEF0CE *stateFlags;
  UIOffset *backgroundImagePositionAdjustment;
  __CFString *v18;
  id v19;
  __CFString *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  char v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  double v29;
  double v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  double v34;
  double v35;
  char v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("Normal.BackgroundImagePosition");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Normal.BackgroundImagePosition"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = v8;
  if (objc_msgSend(v9, "containsValueForKey:", v10))
  {
    objc_msgSend(v9, "decodeUIOffsetForKey:", v10);
    v12 = v11;
    v14 = v13;
    v15 = 16;
  }
  else
  {
    v15 = 0;
    v12 = 0.0;
    v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_BYTE *)self->_stateFlags = *(_BYTE *)self->_stateFlags & 0xEF | v15;
  if (v7)
  {

    backgroundImagePositionAdjustment = self->_backgroundImagePositionAdjustment;
    self->_backgroundImagePositionAdjustment[0].horizontal = v12;
    self->_backgroundImagePositionAdjustment[0].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Highlighted.BackgroundImagePosition"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    backgroundImagePositionAdjustment = self->_backgroundImagePositionAdjustment;
    self->_backgroundImagePositionAdjustment[0].horizontal = v12;
    self->_backgroundImagePositionAdjustment[0].vertical = v14;
    v18 = CFSTR("Highlighted.BackgroundImagePosition");
  }
  v19 = v9;
  v20 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", v20))
  {
    objc_msgSend(v19, "decodeUIOffsetForKey:", v20);
    v22 = v21;
    v24 = v23;
    v25 = 16;
  }
  else
  {
    v25 = 0;
    v22 = v12;
    v24 = v14;
  }

  *(_BYTE *)&stateFlags[2] = *(_BYTE *)&stateFlags[2] & 0xEF | v25;
  if (v7)
  {

    backgroundImagePositionAdjustment[1].horizontal = v22;
    backgroundImagePositionAdjustment[1].vertical = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Disabled.BackgroundImagePosition"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    backgroundImagePositionAdjustment[1].horizontal = v22;
    backgroundImagePositionAdjustment[1].vertical = v24;
    v26 = CFSTR("Disabled.BackgroundImagePosition");
  }
  v27 = v19;
  v28 = v26;
  if (objc_msgSend(v27, "containsValueForKey:", v28))
  {
    objc_msgSend(v27, "decodeUIOffsetForKey:", v28);
    v12 = v29;
    v14 = v30;
    v31 = 16;
  }
  else
  {
    v31 = 0;
  }

  *(_BYTE *)&stateFlags[4] = *(_BYTE *)&stateFlags[4] & 0xEF | v31;
  if (v7)
  {

    backgroundImagePositionAdjustment[2].horizontal = v12;
    backgroundImagePositionAdjustment[2].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Focused.BackgroundImagePosition"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    backgroundImagePositionAdjustment[2].horizontal = v12;
    backgroundImagePositionAdjustment[2].vertical = v14;
    v32 = CFSTR("Focused.BackgroundImagePosition");
  }
  v37 = v27;
  v33 = v32;
  if (objc_msgSend(v37, "containsValueForKey:", v33))
  {
    objc_msgSend(v37, "decodeUIOffsetForKey:", v33);
    v22 = v34;
    v24 = v35;
    v36 = 16;
  }
  else
  {
    v36 = 0;
  }

  *(_BYTE *)&stateFlags[6] = *(_BYTE *)&stateFlags[6] & 0xEF | v36;
  if (v7)

  backgroundImagePositionAdjustment[3].horizontal = v22;
  backgroundImagePositionAdjustment[3].vertical = v24;

}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v26;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("IsBackButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "decodeBoolForKey:", v9);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("DefaultStyle"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend(v7, "decodeBoolForKey:", CFSTR("IsBackButton"));
    v11 = CFSTR("DefaultStyle");
  }
  if (objc_msgSend(v7, "containsValueForKey:", v11))
  {
    if (v10)
      objc_msgSend(a1, "standardBackButtonData");
    else
      objc_msgSend(a1, "standardItemDataForStyle:", objc_msgSend(v7, "decodeIntegerForKey:", v11));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("CustomizedStyle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v12 + 304) = objc_msgSend(v7, "decodeIntegerForKey:", v13);

    }
    else
    {
      *(_QWORD *)(v12 + 304) = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("CustomizedStyle"));
    }
    *(_BYTE *)(v12 + 296) = *(_BYTE *)(v12 + 296) & 0xFE | v10;
    +[_UIBarButtonItemDataBaseFallback fallback](_UIBarButtonItemDataBaseFallback, "fallback");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v12 + 256);
    *(_QWORD *)(v12 + 256) = v14;

    objc_msgSend((id)v12, "_decodeTitleTextAttributesFromCoder:prefix:", v7, v8);
    objc_msgSend((id)v12, "_decodeBackgroundImagesFromCoder:prefix:", v7, v8);
    objc_msgSend((id)v12, "_decodeTitlePositionAdjustmentsFromCoder:prefix:", v7, v8);
    objc_msgSend((id)v12, "_decodeBackgroundPositionAdjustmentsFromCoder:prefix:", v7, v8);
    if (v10)
    {
      v16 = objc_opt_class();
      v17 = CFSTR("BackIndicator");
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("BackIndicator"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "decodeObjectOfClass:forKey:", v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(v12 + 224);
      *(_QWORD *)(v12 + 224) = v18;

      if (v8)
      {

        v20 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("BackIndicatorTransitionMask"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = objc_opt_class();
        v21 = CFSTR("BackIndicatorTransitionMask");
      }
      objc_msgSend(v7, "decodeObjectOfClass:forKey:", v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v12 + 232);
      *(_QWORD *)(v12 + 232) = v22;

      if (v8)
      v24 = *(_QWORD *)(v12 + 232);
      if (*(_QWORD *)(v12 + 224))
      {
        if (v24)
          goto LABEL_22;
      }
      else if (!v24)
      {
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBarButtonItemData.m"), 350, CFSTR("Invalid BackButton Appearance archive - must either contain both a back indicator image and a back indicator transition mask image, or contain neither image"));

    }
  }
LABEL_22:

  return (id)v12;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t style;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIImage *backIndicatorImage;
  void *v18;
  UIImage *backIndicatorTransitionMaskImage;
  void *v20;
  void *v21;
  unint64_t v22;
  double *p_immutable;
  id v24;
  void *v25;
  NSDictionary *v26;
  void *v27;
  $100B9A493E739CE1FF52F8F532CEF0CE *stateFlags;
  char v29;
  UIImage *v30;
  void *v31;
  char v32;
  const __CFString *v33;
  char v34;
  const __CFString *v35;
  uint64_t i;
  __CFString *v37;
  __CFString *v38;
  id v39;
  int v40;
  _OWORD v41[2];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((_UIBarButtonItemData *)qword_1ECD7A750 == self)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("DefaultStyle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
      v12 = 0;
LABEL_11:
      objc_msgSend(v11, "encodeInteger:forKey:", v12, v10);
LABEL_12:

      goto LABEL_53;
    }
    v14 = v6;
    v15 = 0;
LABEL_20:
    objc_msgSend(v14, "encodeInteger:forKey:", v15, CFSTR("DefaultStyle"));
    goto LABEL_53;
  }
  if ((_UIBarButtonItemData *)_MergedGlobals_3_20 == self)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("DefaultStyle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
      v12 = 2;
      goto LABEL_11;
    }
    v14 = v6;
    v15 = 2;
    goto LABEL_20;
  }
  if ((_UIBarButtonItemData *)qword_1ECD7A758 == self)
  {
    if (!v7)
    {
      objc_msgSend(v6, "encodeInteger:forKey:", 0, CFSTR("DefaultStyle"));
      objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("IsBackButton"));
      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("DefaultStyle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeInteger:forKey:", 0, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("IsBackButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeBool:forKey:", 1, v10);
    goto LABEL_12;
  }
  v39 = v7;
  if ((*(_BYTE *)&self->_dataFlags & 1) != 0)
  {
    if (!v7)
    {
      v40 = 1;
      objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("IsBackButton"));
      objc_msgSend(v6, "encodeObject:forKey:", self->_backIndicatorImage, CFSTR("BackIndicator"));
      objc_msgSend(v6, "encodeObject:forKey:", self->_backIndicatorTransitionMaskImage, CFSTR("BackIndicatorTransitionMask"));
      objc_msgSend(v6, "encodeInteger:forKey:", self->_style, CFSTR("CustomizedStyle"));
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("IsBackButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeBool:forKey:", 1, v16);

    backIndicatorImage = self->_backIndicatorImage;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("BackIndicator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", backIndicatorImage, v18);

    backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("BackIndicatorTransitionMask"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", backIndicatorTransitionMaskImage, v20);

    style = self->_style;
    goto LABEL_18;
  }
  style = self->_style;
  if (v7)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("CustomizedStyle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeInteger:forKey:", style, v21);

    v40 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_style, CFSTR("CustomizedStyle"));
  v40 = 1;
LABEL_23:
  v22 = 0;
  p_immutable = (double *)&self->super._immutable;
  v41[0] = xmmword_1E16E0500;
  v41[1] = *(_OWORD *)&off_1E16E0510;
  do
  {
    if (v40)
    {
      v24 = *(id *)((char *)v41 + v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v39, *(_QWORD *)((char *)v41 + v22));
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    v26 = self->_titleTextAttributes[v22 / 8];
    if (v26)
    {
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v24, CFSTR("TitleTextAttributes"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", v26, v27);

      }
      else
      {
        objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", self->_titleTextAttributes[v22 / 8], CFSTR("TitleTextAttributes"));
      }
    }
    stateFlags = self->_stateFlags;
    v29 = (char)self->_stateFlags[v22 / 4];
    if ((v29 & 8) != 0)
    {
      v30 = self->_backgroundImage[v22 / 8];
      if (!v25)
      {
        objc_msgSend(v6, "encodeObject:forKey:", self->_backgroundImage[v22 / 8], CFSTR("BackgroundImage"));
        if ((*(_BYTE *)&stateFlags[v22 / 4] & 4) == 0)
        {
          if ((*(_BYTE *)&stateFlags[v22 / 4] & 0x10) == 0)
            goto LABEL_49;
          goto LABEL_46;
        }
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v25, CFSTR("BackgroundImage"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encodeObject:forKey:", v30, v31);

      v29 = (char)stateFlags[v22 / 4];
    }
    if ((v29 & 4) == 0)
      goto LABEL_43;
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v25, CFSTR("TitlePosition"));
      v32 = 0;
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v33 = v37;
      goto LABEL_41;
    }
LABEL_40:
    v32 = 1;
    v33 = CFSTR("TitlePosition");
LABEL_41:
    objc_msgSend(v6, "encodeUIOffset:forKey:", v33, p_immutable[9], p_immutable[10]);
    if ((v32 & 1) == 0)

LABEL_43:
    if ((*(_BYTE *)&stateFlags[v22 / 4] & 0x10) == 0)
      goto LABEL_49;
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v25, CFSTR("BackgroundImagePosition"));
      v34 = 0;
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v35 = v38;
      goto LABEL_47;
    }
LABEL_46:
    v34 = 1;
    v35 = CFSTR("BackgroundImagePosition");
LABEL_47:
    objc_msgSend(v6, "encodeUIOffset:forKey:", v35, p_immutable[17], p_immutable[18]);
    if ((v34 & 1) == 0)

LABEL_49:
    v22 += 8;
    p_immutable += 2;
  }
  while (v22 != 32);
  for (i = 24; i != -8; i -= 8)

  v8 = v39;
LABEL_53:

}

- (void)describeInto:(id)a3
{
  id v4;
  int64_t style;
  const __CFString *v6;
  unint64_t v7;
  uint64_t v8;
  $100B9A493E739CE1FF52F8F532CEF0CE *stateFlags;
  char v10;
  void *v11;
  void *v12;
  _UIBarButtonItemDataFallback *fallback;
  _UIBarButtonItemDataFallback *v14;
  uint64_t i;
  uint64_t v16;
  objc_super v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIBarButtonItemData;
  -[_UIBarAppearanceData describeInto:](&v17, sel_describeInto_, v4);
  objc_msgSend(v4, "appendString:", CFSTR(" baseStyle="));
  if ((*(_BYTE *)&self->_dataFlags & 1) == 0)
  {
    style = self->_style;
    if (style == 2)
    {
      v6 = CFSTR("done");
    }
    else
    {
      if (style)
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("unknown(%li)"), self->_style, v16);
        goto LABEL_11;
      }
      v6 = CFSTR("plain");
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "appendString:", CFSTR("backButton"));
  if (!self->_backIndicatorImage)
  {
    v6 = CFSTR(" backIndicator=default mask=default");
LABEL_9:
    objc_msgSend(v4, "appendString:", v6);
    goto LABEL_11;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(" backIndicator=%@ mask=%@"), self->_backIndicatorImage, self->_backIndicatorTransitionMaskImage);
LABEL_11:
  v7 = 0;
  v8 = 1;
  v18[0] = xmmword_1E16E0520;
  v18[1] = *(_OWORD *)&off_1E16E0530;
  do
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@=(titleTextAttributes="), *(_QWORD *)((char *)v18 + v7));
    _UIBADPrettyPrintTextAttributes(v4, self->_titleTextAttributes[v7 / 8]);
    stateFlags = self->_stateFlags;
    v10 = (char)self->_stateFlags[v7 / 4];
    if ((v10 & 4) != 0)
    {
      NSStringFromUIOffset(*(UIOffset *)&self->_backgroundImage[v8 + 3]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", titlePositionAdjustment=%@"), v11);

      v10 = (char)stateFlags[v7 / 4];
    }
    if ((v10 & 8) != 0)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(", backgroundImage=%@"), self->_backgroundImage[v7 / 8]);
      if ((*(_BYTE *)&stateFlags[v7 / 4] & 0x10) != 0)
      {
        NSStringFromUIOffset(*(UIOffset *)((char *)&self->_titlePositionAdjustment[3].vertical + v8 * 8));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(", backgroundImagePositionAdjustment=%@"), v12);

      }
    }
    objc_msgSend(v4, "appendString:", CFSTR(")"));
    v8 += 2;
    v7 += 8;
  }
  while (v8 != 9);
  fallback = self->_fallback;
  +[_UIBarButtonItemDataBaseFallback fallback](_UIBarButtonItemDataBaseFallback, "fallback");
  v14 = (_UIBarButtonItemDataFallback *)objc_claimAutoreleasedReturnValue();

  if (fallback != v14)
    objc_msgSend(v4, "appendFormat:", CFSTR(" basedOn=%p"), self->_fallback);
  for (i = 24; i != -8; i -= 8)

}

- (int64_t)hashInto:(int64_t)a3
{
  char *v4;
  NSDictionary *v5;
  int64_t style;
  char *v7;
  int64_t v8;
  int64_t v9;
  UIImage *backIndicatorImage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIBarButtonItemData;
  v4 = -[_UIBarAppearanceData hashInto:](&v12, sel_hashInto_, a3);
  v5 = self->_titleTextAttributes[0];
  if (v5)
    style = -[NSDictionary hash](v5, "hash");
  else
    style = self->_style;
  v7 = &v4[style];
  if ((*(_BYTE *)self->_stateFlags & 8) != 0)
    v8 = -[UIImage hash](self->_backgroundImage[0], "hash");
  else
    v8 = self->_style;
  v9 = (v8 << 8) + ((_QWORD)v7 << 16);
  backIndicatorImage = self->_backIndicatorImage;
  if (backIndicatorImage)
    return -[UIImage hash](backIndicatorImage, "hash") | (unint64_t)v9;
  return v9;
}

- (void)setTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical;
  CGFloat horizontal;
  UIOffset *v8;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = &self->_titlePositionAdjustment[a4];
  v8->horizontal = horizontal;
  v8->vertical = vertical;
  *(_BYTE *)&self->_stateFlags[2 * a4] |= 4u;
}

- (void)setBackgroundImage:(id)a3 forState:(int64_t)a4
{
  UIImage *v7;
  UIImage *v8;

  v7 = (UIImage *)a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = self->_backgroundImage[a4];
  self->_backgroundImage[a4] = v7;

  *(_BYTE *)&self->_stateFlags[2 * a4] = *(_BYTE *)&self->_stateFlags[2 * a4] & 0xF7 | (8 * (v7 != 0));
}

- (void)setBackgroundImagePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical;
  CGFloat horizontal;
  UIOffset *v8;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = &self->_backgroundImagePositionAdjustment[a4];
  v8->horizontal = horizontal;
  v8->vertical = vertical;
  *(_BYTE *)&self->_stateFlags[2 * a4] |= 0x10u;
}

- (UIImageSymbolConfiguration)compactImageSymbolConfiguration
{
  UIImageSymbolConfiguration *compactImageSymbolConfiguration;
  void *v4;
  UIImageSymbolConfiguration *v5;
  void *v6;
  UIImageSymbolConfiguration *v7;

  compactImageSymbolConfiguration = self->_compactImageSymbolConfiguration;
  if (!compactImageSymbolConfiguration)
  {
    if ((*(_BYTE *)self->_stateFlags & 1) != 0)
    {
      -[_UIBarButtonItemData titleTextAttributesForState:](self, "titleTextAttributesForState:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v4, 2);
    }
    else
    {
      -[_UIBarButtonItemData textStyleForSymbolConfiguration](self, "textStyleForSymbolConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v4, 2);
    }
    v5 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v7 = self->_compactImageSymbolConfiguration;
    self->_compactImageSymbolConfiguration = v5;

    compactImageSymbolConfiguration = self->_compactImageSymbolConfiguration;
  }
  return compactImageSymbolConfiguration;
}

- (void)resetBackIndicatorImages
{
  UIImage *backIndicatorImage;
  UIImage *backIndicatorTransitionMaskImage;

  backIndicatorImage = self->_backIndicatorImage;
  self->_backIndicatorImage = 0;

  backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
  self->_backIndicatorTransitionMaskImage = 0;

}

- (UIImage)compactBackIndicatorImage
{
  UIImage *v2;
  UIImage *backIndicatorImage;
  uint64_t v4;
  void *v5;

  if ((*(_BYTE *)&self->_dataFlags & 1) != 0)
  {
    backIndicatorImage = self->_backIndicatorImage;
    if (!backIndicatorImage)
    {
      backIndicatorImage = (UIImage *)compactBackIndicatorImage_indicator;
      if (!compactBackIndicatorImage_indicator)
      {
        if ((_UIBarsUseDynamicType() & 1) != 0)
          +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.backward"));
        else
          +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorLandscape"));
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)compactBackIndicatorImage_indicator;
        compactBackIndicatorImage_indicator = v4;

        backIndicatorImage = (UIImage *)compactBackIndicatorImage_indicator;
      }
    }
    v2 = backIndicatorImage;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (UIImageSymbolConfiguration)compactBackIndicatorSymbolConfiguration
{
  UIImage *backIndicatorImage;
  void *v4;

  if ((*(_BYTE *)&self->_dataFlags & 1) == 0)
    goto LABEL_6;
  backIndicatorImage = self->_backIndicatorImage;
  if (!backIndicatorImage)
  {
    if (_UIBarsUseDynamicType())
      goto LABEL_4;
LABEL_6:
    v4 = 0;
    return (UIImageSymbolConfiguration *)v4;
  }
  if (!-[UIImage isSymbolImage](backIndicatorImage, "isSymbolImage"))
    goto LABEL_6;
LABEL_4:
  -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_compactBackIndicatorSymbolConfiguration, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIImageSymbolConfiguration *)v4;
}

- (UIImageSymbolConfiguration)compactBackIndicatorTransitionMaskSymbolConfiguration
{
  UIImage *backIndicatorTransitionMaskImage;
  void *v4;

  if ((*(_BYTE *)&self->_dataFlags & 1) == 0)
    goto LABEL_6;
  backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
  if (!backIndicatorTransitionMaskImage)
  {
    if (_UIBarsUseDynamicType())
      goto LABEL_4;
LABEL_6:
    v4 = 0;
    return (UIImageSymbolConfiguration *)v4;
  }
  if (!-[UIImage isSymbolImage](backIndicatorTransitionMaskImage, "isSymbolImage"))
    goto LABEL_6;
LABEL_4:
  -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_compactBackIndicatorSymbolConfiguration, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIImageSymbolConfiguration *)v4;
}

- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  double horizontal;
  double vertical;
  UIOffset *v6;
  UIOffset result;

  if ((*(_BYTE *)&self->_stateFlags[2 * a3] & 0x10) != 0)
  {
    v6 = &self->_backgroundImagePositionAdjustment[a3];
    horizontal = v6->horizontal;
    vertical = v6->vertical;
  }
  else
  {
    -[_UIBarButtonItemDataFallback backgroundImagePositionAdjustmentForState:style:](self->_fallback, "backgroundImagePositionAdjustmentForState:style:");
  }
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

@end
