@implementation UIButton

- (double)_baselineOffsetFromNearestEdgeForLayoutAttribute:(int64_t)a3
{
  double v5;
  double v6;
  __int16 buttonVisualProviderFlags;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIButton;
  -[UIView _baselineOffsetFromNearestEdgeForLayoutAttribute:](&v12, sel__baselineOffsetFromNearestEdgeForLayoutAttribute_);
  v6 = v5;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((a3 - 11) > 1 || (buttonVisualProviderFlags & 4) == 0)
      return v6;
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || (*(_WORD *)&self->_buttonVisualProviderFlags & 4) == 0)
      goto LABEL_12;

    if ((a3 - 11) > 1)
      return v6;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVendsBaselineInformationToAutoLayout:", 1);

  if (a3 == 11)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreviousLastBaselineOffsetForAttributeLowering:", v6);
    goto LABEL_12;
  }
  if (a3 == 12)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreviousFirstBaselineOffsetForAttributeLowering:", v6);
LABEL_12:

  }
  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIButton _setHighlighted:animated:](self, "_setHighlighted:animated:", a3, (*(_QWORD *)&self->_buttonFlags >> 26) & 1);
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  *(_QWORD *)&self->_buttonFlags &= ~0x4000000uLL;
  if (-[UIControl isHighlighted](self, "isHighlighted") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIButton;
    -[UIControl setHighlighted:](&v8, sel_setHighlighted_, v5);
    -[UIButton _visualProvider](self, "_visualProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:animated:", v5, v4);

  }
}

- (CGPoint)pressFeedbackPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UIButton imageForState:](self, "imageForState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:");
  if (v3)
    -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:");
  v8 = v4 + v6 * 0.5;
  v9 = v5 + v7 * 0.5;
  result.y = v9;
  result.x = v8;
  return result;
}

- (UIImage)imageForState:(UIControlState)state
{
  return (UIImage *)-[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self, "_imageForState:applyingConfiguration:usesImageForNormalState:", state, 0, 0);
}

- (id)_attributedTitleForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _attributedTitleForState:adjustedToTraitCollection:](self, "_attributedTitleForState:adjustedToTraitCollection:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_attributedTitleForState:(unint64_t)a3 adjustedToTraitCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a4;
  -[UIButton _contentForState:](self, "_contentForState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedTitle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;

  }
  else
  {
    -[UIButton _contentForState:](self, "_contentForState:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_11;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "adjustsFontForContentSizeCategory"))
  {
LABEL_10:

    goto LABEL_11;
  }
  v12 = -[UIButton _shouldAdjustToTraitCollection](self, "_shouldAdjustToTraitCollection");

  if (v12)
  {
    objc_msgSend(v9, "_ui_attributedStringAdjustedToTraitCollection:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v13;
    if (v13)
      v14 = (void *)v13;
    else
      v14 = v9;
    v15 = v14;

    v9 = v15;
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (id)_titleForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIButton _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIButton _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_backgroundForState:(unint64_t)a3 usesBackgroundForNormalState:(BOOL *)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  uint64_t v12;

  -[UIButton _contentForState:](self, "_contentForState:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[UIButton _contentForState:](self, "_contentForState:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "background");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[UIButton _defaultBackgroundImageForType:andState:](UIButton, "_defaultBackgroundImageForType:andState:", (*(_QWORD *)&self->_buttonFlags >> 6), a3);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v8 = (void *)v12;
        goto LABEL_2;
      }
      +[UIButton _defaultBackgroundImageForType:andState:](UIButton, "_defaultBackgroundImageForType:andState:", (*(_QWORD *)&self->_buttonFlags >> 6), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = 1;
    if (!a4)
      return v8;
    goto LABEL_3;
  }
LABEL_2:
  v9 = 0;
  if (a4)
LABEL_3:
    *a4 = v9;
  return v8;
}

+ (id)_defaultBackgroundImageForType:(int64_t)a3 andState:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "_defaultBackgroundImageNameForType:andState:compact:", a3, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_defaultBackgroundImageColorForType:andState:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "imageWithTintColor:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_defaultBackgroundImageNameForType:(int64_t)a3 andState:(unint64_t)a4 compact:(BOOL)a5
{
  __CFString *v5;

  if (a3 != 7)
    return 0;
  v5 = CFSTR("UICloseButtonBackground");
  if (a5)
    v5 = CFSTR("UICloseButtonBackgroundCompact");
  return v5;
}

- (id)_imageForState:(unint64_t)a3 applyingConfiguration:(BOOL)a4 usesImageForNormalState:(BOOL *)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;

  v6 = a4;
  -[UIButton _contentForState:](self, "_contentForState:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_2:
    v11 = 0;
    if (!v6)
      goto LABEL_9;
    goto LABEL_6;
  }
  -[UIButton _contentForState:](self, "_contentForState:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[UIButton _preferredConfigurationForState:](self, "_preferredConfigurationForState:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _defaultImageForState:withConfiguration:](self, "_defaultImageForState:withConfiguration:", a3, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_2;
    -[UIButton _preferredConfigurationForState:](self, "_preferredConfigurationForState:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _defaultImageForState:withConfiguration:](self, "_defaultImageForState:withConfiguration:", 0, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = 1;
  if (!v6)
    goto LABEL_9;
LABEL_6:
  if (objc_msgSend(v10, "_isSymbolImage"))
  {
    -[UIButton _preferredConfigurationForState:](self, "_preferredConfigurationForState:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v10, "symbolConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configurationByApplyingConfiguration:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "imageWithConfiguration:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v17;
    }
  }
LABEL_9:
  if (a5)
    *a5 = v11;
  return v10;
}

- (id)_preferredConfigurationForState:(unint64_t)a3 includeDefault:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a4;
  -[UIButton _contentForState:](self, "_contentForState:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredSymbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[UIButton _contentForState:](self, "_contentForState:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && !v8)
    {
      v12 = (*(_QWORD *)&self->_buttonFlags >> 6);
      -[UIView traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIButton _defaultSymbolConfigurationForType:andState:compact:idiom:](UIButton, "_defaultSymbolConfigurationForType:andState:compact:idiom:", v12, a3, 0, objc_msgSend(v13, "userInterfaceIdiom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v14 = (*(_QWORD *)&self->_buttonFlags >> 6);
        -[UIView traitCollection](self, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIButton _defaultSymbolConfigurationForType:andState:compact:idiom:](UIButton, "_defaultSymbolConfigurationForType:andState:compact:idiom:", v14, 0, 0, objc_msgSend(v15, "userInterfaceIdiom"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v9 = v8;

  return v9;
}

- (id)_contentForState:(unint64_t)a3
{
  void *contentLookup;
  void *v4;

  contentLookup = self->_contentLookup;
  if (contentLookup)
  {
    if ((~(_BYTE)a3 & 3) == 0)
      a3 &= ~2uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(contentLookup, "objectForKeyedSubscript:", v4);
    contentLookup = (void *)objc_claimAutoreleasedReturnValue();

  }
  return contentLookup;
}

- (id)_preferredConfigurationForState:(unint64_t)a3
{
  return -[UIButton _preferredConfigurationForState:includeDefault:](self, "_preferredConfigurationForState:includeDefault:", a3, 1);
}

+ (id)_defaultImageForType:(int64_t)a3 andState:(unint64_t)a4 withConfiguration:(id)a5
{
  id v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  int64_t v13;
  __CFString *v14;
  void *v15;

  v8 = a5;
  objc_msgSend(a1, "_defaultImageNameForType:andState:", a3, a4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  switch(a3)
  {
    case 'v':
      v11 = CFSTR("exclamationmark.circle");
      v12 = CFSTR("UIAccessoryButtonExclamationMark");
      goto LABEL_13;
    case 'w':
      v11 = CFSTR("questionmark.circle");
      v12 = CFSTR("UIAccessoryButtonQuestionMark");
      goto LABEL_13;
    case 'x':
      v11 = CFSTR("checkmark.circle");
      v12 = CFSTR("UIAccessoryButtonCheckmark");
      goto LABEL_13;
    case 'y':
      v11 = CFSTR("minus.circle");
      v12 = CFSTR("UIAccessoryButtonMinus");
      goto LABEL_13;
    case 'z':
      v11 = CFSTR("xmark.circle");
      v12 = CFSTR("UIAccessoryButtonX");
      goto LABEL_13;
    case '{':
      v12 = 0;
      v11 = CFSTR("chevron.forward.circle");
LABEL_13:

      v10 = v11;
      goto LABEL_14;
    default:
      v13 = a3 - 2;
      v11 = CFSTR("info.circle");
      v12 = CFSTR("UIAccessoryButtonInfo");
      switch(v13)
      {
        case 0:
          goto LABEL_13;
        case 1:
        case 2:
          if (!a4)
            goto LABEL_13;
          break;
        case 3:
          v11 = CFSTR("plus.circle");
          v12 = CFSTR("UIAccessoryButtonPlus");
          goto LABEL_13;
        default:
          break;
      }
      v12 = 0;
      v14 = 0;
      v15 = 0;
      if (!v9)
        goto LABEL_15;
LABEL_14:
      +[UIImage _systemImageNamed:fallback:withConfiguration:](UIImage, "_systemImageNamed:fallback:withConfiguration:", v10, v12, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (__CFString *)v10;
LABEL_15:

      return v15;
  }
}

+ (id)_defaultImageNameForType:(int64_t)a3 andState:(unint64_t)a4
{
  if (a3 == 7)
    return CFSTR("xmark");
  else
    return 0;
}

- (id)_defaultImageForState:(unint64_t)a3 withConfiguration:(id)a4
{
  return +[UIButton _defaultImageForType:andState:withConfiguration:](UIButton, "_defaultImageForType:andState:withConfiguration:", (*(_QWORD *)&self->_buttonFlags >> 6), a3, a4);
}

+ (id)_defaultSymbolConfigurationForType:(int64_t)a3 andState:(unint64_t)a4 compact:(BOOL)a5 idiom:(int64_t)a6
{
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;

  if (a3 != 7)
  {
    if (!a3)
    {
      +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 2, a4, a5, a6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v7 = CFSTR("UICTFontTextStyleBody");
    v8 = 3;
LABEL_7:
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v7, v8, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a6 == 6)
  {
    v7 = CFSTR("UICTFontTextStyleTitle3");
    v8 = 2;
    goto LABEL_7;
  }
  v9 = 15.0;
  if (a6 == 5)
    v9 = 12.0;
  if (a5)
    v10 = 1;
  else
    v10 = 2;
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, v10, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (BOOL)_hasDrawingStyle
{
  NSMutableDictionary *contentLookup;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  contentLookup = self->_contentLookup;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__UIButton__hasDrawingStyle__block_invoke;
  v8[3] = &unk_1E16C2D98;
  v8[4] = &v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contentLookup, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (!*((_BYTE *)v10 + 24) && -[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
  {
    -[UIButton _contentForState:](self, "_contentForState:", -[UIControl state](self, "state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      *((_BYTE *)v10 + 24) = 1;

  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (BOOL)_buttonTypeIsSystemProvided:(int64_t)a3
{
  BOOL result;

  result = objc_msgSend(a1, "_buttonTypeIsiOSSystemProvided:");
  if (a3 == 9999)
    return 1;
  return result;
}

- (BOOL)_isCarPlaySystemTypeButton
{
  BOOL v3;

  v3 = -[UIButton _isiOSSystemProvidedButton](self, "_isiOSSystemProvidedButton")
    || -[UIButton buttonType](self, "buttonType") == 123;
  return -[UIButton _isInCarPlay](self, "_isInCarPlay") && v3;
}

+ (BOOL)_buttonTypeIsiOSSystemProvided:(int64_t)a3
{
  return (unint64_t)(a3 - 124) < 3 || a3 == 1;
}

- (BOOL)_isInCarPlay
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (UIButtonType)buttonType
{
  return (unint64_t)(*(_QWORD *)&self->_buttonFlags >> 6);
}

- (BOOL)_isModernButton
{
  return (objc_msgSend((id)objc_opt_class(), "_buttonTypeIsModernUI:", -[UIButton _buttonType](self, "_buttonType")) & 1) != 0
      || -[UIButton _hasDrawingStyle](self, "_hasDrawingStyle");
}

- (BOOL)_isiOSSystemProvidedButton
{
  return objc_msgSend((id)objc_opt_class(), "_buttonTypeIsiOSSystemProvided:", -[UIButton _buttonType](self, "_buttonType"));
}

- (int64_t)_buttonType
{
  return (*(_QWORD *)&self->_buttonFlags >> 6);
}

+ (BOOL)_buttonTypeIsModernUI:(int64_t)a3
{
  return (objc_msgSend(a1, "_buttonTypeIsSystemProvided:") & 1) != 0
      || a3 == 7
      || a3 == 113
      || UIButtonTypeIsModernCircleButton(a3);
}

+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5 baseAlpha:(double)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  double v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v7 = a5;
  v8 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle") == 2;

  v14 = dbl_186679260[v13];
  v26 = 0u;
  v27 = 0u;
  if (v8)
    v15 = v14;
  else
    v15 = 1.0;
  v24 = 0uLL;
  v25 = 0uLL;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = v15 * a6;
    v20 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "alpha");
        if (v19 != v22)
        {

          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __68__UIButton__setVisuallyHighlighted_forViews_initialPress_baseAlpha___block_invoke;
          v23[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
          *(double *)&v23[4] = v19;
          objc_msgSend(a1, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v8, v16, v7, v23);
          goto LABEL_14;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
        continue;
      break;
    }
  }

LABEL_14:
}

+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5
{
  objc_msgSend(a1, "_setVisuallyHighlighted:forViews:initialPress:baseAlpha:", a3, a4, a5, 1.0);
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIButton;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorDidChange");

}

- (uint64_t)_setContentValue:(void *)a3 forField:(uint64_t)a4 state:
{
  id v7;
  id v8;
  UIButtonContent *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(a1, "_contentForState:", a4);
    v9 = (UIButtonContent *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(UIButtonContent);
      objc_msgSend(a1, "_setContent:forState:", v9, a4);
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("attributedTitle")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[_NSAttributedStringIntentResolver attributedStringByResolvingString:](_UIAttributedStringIntentResolver, "attributedStringByResolvingString:", v7);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v10;
      }
    }
    -[UIButtonContent valueForKey:](v9, "valueForKey:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == v7)
    {
      v14 = 0;
    }
    else
    {
      v13 = objc_msgSend(v11, "isEqual:", v7);
      v14 = v13 ^ 1u;
      if ((~a1[13] & 0x420000000000000) == 0 && (v13 & 1) == 0)
        objc_msgSend(a1, "invalidateIntrinsicContentSize");
    }
    -[UIButtonContent setValue:forKey:](v9, "setValue:forKey:", v7, v8);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("title")))
      -[UIButtonContent updateVariableLengthStringForView:](v9, "updateVariableLengthStringForView:", a1);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("titleColor")))
      a1[78] |= 0x80000000uLL;
    if (!v7 && -[UIButtonContent isEmpty](v9, "isEmpty"))
      objc_msgSend(a1, "_setContent:forState:", 0, a4);
    if ((_DWORD)v14)
    {
      if (v7)
        v15 = v12 == 0;
      else
        v15 = 1;
      v16 = v15;
      if (!a4
        && v16
        && objc_msgSend(v8, "isEqualToString:", CFSTR("background"))
        && objc_msgSend(a1, "_wantsAccessibilityUnderline"))
      {
        objc_msgSend(a1, "_titleView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", v7 == 0);

      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *contentLookup;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  contentLookup = self->_contentLookup;
  if (!contentLookup)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_contentLookup;
    self->_contentLookup = v7;

    contentLookup = self->_contentLookup;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](contentLookup, "setObject:forKeyedSubscript:", v10, v9);

}

- (BOOL)_wantsAccessibilityUnderline
{
  return (*((_BYTE *)&self->_buttonFlags + 3) & 0x20) == 0;
}

void __28__UIButton__hasDrawingStyle__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a3, "drawingStroke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (fabs(v8) >= 2.22044605e-16)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return *((_BYTE *)&self->_buttonFlags + 4) & 1;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  char v7;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasMultilineText");

      return v7;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
  }
  return 0;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSizeInvalidatedForChildView:", v4);

}

- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  char v7;
  objc_super v9;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "vendsBaselineInformationToAutoLayout");

      return v7;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  return -[UIView _wantsBaselineUpdatingFollowingConstraintsPass](&v9, sel__wantsBaselineUpdatingFollowingConstraintsPass);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  __int16 v13;
  void *v14;
  __int16 v15;
  __int16 buttonVisualProviderFlags;
  void *v17;
  __int16 v18;
  void *v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v20.receiver = self;
  v20.super_class = (Class)UIButton;
  -[UIView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    goto LABEL_5;
  if ((~*(_QWORD *)&self->super.super._viewFlags & 0x220000000000000) != 0)
    return;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) == 0)
      return;
LABEL_5:
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
    v13 = (__int16)self->_buttonVisualProviderFlags;
    if ((v13 & 1) != 0)
    {
      if ((v13 & 4) == 0)
        return;
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        return;
      v15 = (__int16)self->_buttonVisualProviderFlags;

      if ((v15 & 4) == 0)
        return;
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "invalidateLayoutData");

    return;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (__int16)self->_buttonVisualProviderFlags;

    if ((v18 & 4) != 0)
      goto LABEL_5;
  }
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConstraints");

  v4.receiver = self;
  v4.super_class = (Class)UIButton;
  -[UIView updateConstraints](&v4, sel_updateConstraints);
}

- (BOOL)_unconditionallyWantsSetBoundsFromISEngineLayout
{
  void *v2;
  __int16 buttonVisualProviderFlags;
  BOOL v5;
  objc_super v7;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
      return 1;
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 && (*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
    {
      v5 = 1;
LABEL_7:

      return v5;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UIButton;
  v5 = -[UIView _unconditionallyWantsSetBoundsFromISEngineLayout](&v7, sel__unconditionallyWantsSetBoundsFromISEngineLayout);
  if ((buttonVisualProviderFlags & 1) == 0)
    goto LABEL_7;
  return v5;
}

- (void)_alignmentRectInsetsHaveChangedForChildImageView:(id)a3
{
  __int16 buttonVisualProviderFlags;
  void *v5;
  __int16 v6;
  void *v7;
  id v8;

  v8 = a3;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) == 0)
      goto LABEL_7;
LABEL_6:
    -[UIButton _visualProvider](self, "_visualProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alignmentRectInsetsHaveChangedForChildImageView:", v8);

    goto LABEL_7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (__int16)self->_buttonVisualProviderFlags;

    if ((v6 & 4) != 0)
      goto LABEL_6;
  }
LABEL_7:

}

uint64_t __117__UIButton_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
}

- (void)_setActiveSizeToFitLayoutEngine:(id)a3
{
  objc_storeWeak((id *)&self->_activeSizeToFitLayoutEngine, a3);
}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForFirstBaselineLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    -[UIView viewForFirstBaselineLayout](&v9, sel_viewForFirstBaselineLayout);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)_hasBaseline
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  char v7;
  objc_super v9;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasBaseline");

      return v7;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  return -[UIView _hasBaseline](&v9, sel__hasBaseline);
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLastBaselineLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    -[UIView viewForLastBaselineLayout](&v9, sel_viewForLastBaselineLayout);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIButton;
  v3 = -[UIView _viewForLoweringBaselineLayoutAttribute:](&v5, sel__viewForLoweringBaselineLayoutAttribute_, *(_QWORD *)&a3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  __int16 buttonVisualProviderFlags;
  void *v10;
  __int16 v11;
  void *v13;
  char v14;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
      goto LABEL_4;
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)UIButton;
    return -[UIView _shouldInvalidateBaselineConstraintsForSize:oldSize:](&v15, sel__shouldInvalidateBaselineConstraintsForSize_oldSize_, v7, v6, width, height);
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_9;
  v11 = (__int16)self->_buttonVisualProviderFlags;

  if ((v11 & 4) == 0)
    goto LABEL_9;
LABEL_4:
  if ((*(_QWORD *)&self->super.super._viewFlags & 0x200000000000000) != 0 || v7 == width && v6 == height)
    return 0;
  -[UIButton _visualProvider](self, "_visualProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "vendsBaselineInformationToAutoLayout");

  return v14;
}

- (id)_titleView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleViewCreateIfNeeded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_likelyToHaveTitle
{
  char v3;
  void *v4;
  void *v5;

  if (!-[UIButton _canHaveTitle](self, "_canHaveTitle"))
    return 0;
  if ((*(_WORD *)&self->_buttonFlags & 0x3FC0) != 0)
    return 1;
  -[UIButton backgroundImageForState:](self, "backgroundImageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = objc_msgSend(v4, "_isResizable");
  else
    v3 = 1;

  return v3;
}

- (void)_setInternalTitlePaddingInsets:(UIEdgeInsets)a3
{
  self->_internalTitlePaddingInsets = a3;
}

- (BOOL)_canHaveTitle
{
  return ((*(_QWORD *)&self->_buttonFlags >> 6) & 0xFEuLL) - 6 < 0xFFFFFFFFFFFFFFFCLL;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSubviews");

  if ((*(_QWORD *)&self->super.super._viewFlags & 0x800000000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIButton;
    -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  }
}

- (id)_imageView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageViewCreateIfNeeded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alignmentRectInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentRectForBounds:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (UIButtonVisualProvider)_visualProvider
{
  UIButtonVisualProvider *visualProvider;

  visualProvider = self->_visualProvider;
  if (!visualProvider)
  {
    -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
    visualProvider = self->_visualProvider;
  }
  return visualProvider;
}

- (UIImage)backgroundImageForState:(UIControlState)state
{
  return (UIImage *)-[UIButton _backgroundForState:usesBackgroundForNormalState:](self, "_backgroundForState:usesBackgroundForNormalState:", state, 0);
}

- (UIEdgeInsets)_combinedContentPaddingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_internalTitlePaddingInsets.top;
  left = self->_internalTitlePaddingInsets.left;
  bottom = self->_internalTitlePaddingInsets.bottom;
  right = self->_internalTitlePaddingInsets.right;
  if (left == 0.0 && top == 0.0 && right == 0.0 && bottom == 0.0)
    -[UIButton contentEdgeInsets](self, "contentEdgeInsets");
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_refreshVisualProvider
{
  id v3;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton _refreshVisualProviderForTraitCollection:](self, "_refreshVisualProviderForTraitCollection:", v3);

}

- (void)_refreshVisualProviderForTraitCollection:(id)a3
{
  -[UIButton _refreshVisualProviderForTraitCollection:populatingAPIProperties:](self, "_refreshVisualProviderForTraitCollection:populatingAPIProperties:", a3, 1);
}

- (void)_refreshVisualProviderForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4
{
  void *v5;
  void *v6;

  -[UIButton visualProviderClassForTraitCollection:](self, "visualProviderClassForTraitCollection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[UIButton _setVisualProvider:](self, "_setVisualProvider:", v5);
    v5 = v6;
  }

}

- (id)visualProviderClassForTraitCollection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = objc_msgSend(a3, "userInterfaceIdiom");
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "_visualProviderClass");
  if (v5)
    goto LABEL_3;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "_visualProviderClassForIdiom:", v4);
  if (v5)
    goto LABEL_3;
  v11 = (void *)__UIButtonIdiomsToVisualProviderClasses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v5 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E1A97560);
    v14 = objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E1A97578);
    if (self->_configuration || self->_configurationUpdateHandler)
    {
      if (!v5)
        v5 = (void *)v14;
      if (v5)
      {
LABEL_17:

        goto LABEL_3;
      }
    }
    else
    {
      if (v14)
        v5 = (void *)v14;
      if (v5)
        goto LABEL_17;
    }
    objc_msgSend(v13, "objectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v15, "nextObject");

    if (v5)
      goto LABEL_3;
  }
  if (v4 != 2 && v4 != 8 || (v5 = (void *)objc_opt_class()) == 0)
    v5 = (void *)objc_opt_class();
LABEL_3:
  if (self->_visualProvider
    && v5 == (void *)objc_opt_class()
    && !objc_msgSend(v5, "requiresNewVisualProviderForChanges"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "visualProviderForButton:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[UIButtonLegacyVisualProvider visualProviderForButton:](UIButtonLegacyVisualProvider, "visualProviderForButton:", self);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  return v9;
}

+ (Class)_visualProviderClass
{
  return 0;
}

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return 0;
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  if (UIButtonTypeIsModernCircleButton((*(_QWORD *)&self->_buttonFlags >> 6)))
  {
    -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:", x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = contentRect.size.height;
  width = contentRect.size.width;
  y = contentRect.origin.y;
  x = contentRect.origin.x;
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageRectForContentRect:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return (unint64_t)(-[UIButton _buttonType](self, "_buttonType") - 2) < 4;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return (unint64_t)(-[UIButton _buttonType](self, "_buttonType") - 2) < 4;
}

- (CGSize)intrinsicContentSize
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
LABEL_6:
    v13.receiver = self;
    v13.super_class = (Class)UIButton;
    -[UIView intrinsicContentSize](&v13, sel_intrinsicContentSize);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 4) == 0)
    goto LABEL_6;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
LABEL_7:
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)_imageContentMode
{
  return self->__imageContentMode;
}

- (id)_lazyTitleViewFontIsDefaultForIdiom:(BOOL *)a3
{
  if (a3)
    *a3 = self->_lazyTitleViewFontIsDefaultForIdiom;
  return self->_lazyTitleViewFont;
}

- (BOOL)_isSystemProvidedButton
{
  return objc_msgSend((id)objc_opt_class(), "_buttonTypeIsSystemProvided:", -[UIButton _buttonType](self, "_buttonType"));
}

- (BOOL)adjustsImageWhenHighlighted
{
  return (*(_BYTE *)&self->_buttonFlags >> 1) & 1;
}

- (BOOL)adjustsImageWhenDisabled
{
  return (*(_BYTE *)&self->_buttonFlags >> 2) & 1;
}

- (BOOL)showsTouchWhenHighlighted
{
  return (*(_BYTE *)&self->_buttonFlags >> 5) & 1;
}

- (void)_setTitleFrozen:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (CGSize)_roundSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = ceil(a3.width);
  v4 = ceil(a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_effectiveSizeForImage:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = _UIAccessibilityContentSizeCategorySizeForImage(a3, self);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)imageEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageEdgeInsets.top;
  left = self->_imageEdgeInsets.left;
  bottom = self->_imageEdgeInsets.bottom;
  right = self->_imageEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)titleEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleEdgeInsets.top;
  left = self->_titleEdgeInsets.left;
  bottom = self->_titleEdgeInsets.bottom;
  right = self->_titleEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  _QWORD *v5;
  void *v6;
  __int16 buttonVisualProviderFlags;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  v5 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollectionDidChange:", v5);

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0)
    {
LABEL_12:
      v8 = 0;
      goto LABEL_18;
    }
LABEL_6:
    -[UIButton _visualProvider](self, "_visualProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "adjustsFontForContentSizeCategory")
      || (-[UIView traitCollection](self, "traitCollection"),
          (v10 = (_QWORD *)objc_claimAutoreleasedReturnValue()) == 0))
    {

      v8 = 0;
      if ((buttonVisualProviderFlags & 1) != 0)
        goto LABEL_18;
      goto LABEL_17;
    }
    if (v5)
    {
      v11 = v10[13];
      v12 = v5[13];

      if ((buttonVisualProviderFlags & 1) == 0)
      if (v11 == v12)
        goto LABEL_12;
    }
    else
    {

      if ((buttonVisualProviderFlags & 1) == 0)
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) != 0)
    goto LABEL_6;
  v8 = 0;
LABEL_17:

LABEL_18:
  v13 = (__int16)self->_buttonVisualProviderFlags;
  LOBYTE(v14) = v13;
  if ((v13 & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_28:

      goto LABEL_29;
    }
    v14 = (__int16)self->_buttonVisualProviderFlags;
  }
  if ((v14 & 0x20) == 0 || !-[UIButton _fontIsDefaultForIdiom](self, "_fontIsDefaultForIdiom"))
  {
    if ((v13 & 1) != 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  -[UIView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");
  v17 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v13 & 1) == 0)
  if (v16 != v17)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "font");
    v18 = objc_claimAutoreleasedReturnValue();

    -[UIButton _setDefaultFontForIdiom](self, "_setDefaultFontForIdiom");
    v8 = (void *)v18;
  }
LABEL_29:
  if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
    -[UIButton _applyCarPlaySystemButtonCustomizations](self, "_applyCarPlaySystemButtonCustomizations");
  v27.receiver = self;
  v27.super_class = (Class)UIButton;
  -[UIView traitCollectionDidChange:](&v27, sel_traitCollectionDidChange_, v5);
  if (v8)
  {
    v19 = (__int16)self->_buttonVisualProviderFlags;
    if ((v19 & 1) != 0)
    {
      if ((v19 & 0x20) == 0)
        goto LABEL_41;
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v20;
      if (!v20 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0)
      {

        goto LABEL_41;
      }
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v8, "isEqual:", v22);

    if ((v19 & 1) != 0)
    {
      if (v23)
        goto LABEL_41;
    }
    else
    {

      if ((v23 & 1) != 0)
        goto LABEL_41;
    }
LABEL_47:
    -[UIView _invalidateIntrinsicContentSizeNeedingLayout:](self, "_invalidateIntrinsicContentSizeNeedingLayout:", 1);
    goto LABEL_48;
  }
LABEL_41:
  if (-[UIButton adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (v5)
      {
        v25 = v24[13];
        v26 = v5[13];

        if (v25 == v26)
          goto LABEL_48;
      }
      else
      {

      }
      goto LABEL_47;
    }
  }
LABEL_48:

}

- (BOOL)_hasImageForProperty:(id)a3
{
  id v4;
  NSMutableDictionary *contentLookup;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  contentLookup = self->_contentLookup;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__UIButton__hasImageForProperty___block_invoke;
  v8[3] = &unk_1E16C2D70;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contentLookup, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(contentLookup) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)contentLookup;
}

- (BOOL)_fontIsDefaultForIdiom
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  int v7;
  void *v9;
  char v10;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0)
        goto LABEL_4;
    }
    return 1;
  }
  if ((buttonVisualProviderFlags & 0x20) == 0)
    return 1;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deferToLazyTitleFont");

  if (v7)
    return self->_lazyTitleViewFontIsDefaultForIdiom;
  -[UIButton _visualProvider](self, "_visualProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fontIsDefaultForIdiom");

  return v10;
}

- (id)_font
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  UIFont *v7;
  void *v8;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  v5 = (__int16)self->_buttonVisualProviderFlags;

  if ((v5 & 0x20) == 0)
    goto LABEL_7;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "deferToLazyTitleFont"))
  {
    v7 = self->_lazyTitleViewFont;
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v7 = (UIFont *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)_lineBreakMode
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  int64_t v7;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "lineBreakMode");

      return v7;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0)
        goto LABEL_4;
    }
  }
  return 5;
}

- (void)_markAndLayoutAsNeededForField:(uint64_t)a3 state:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      if (objc_msgSend(a1, "state") == a3
        || !a3
        && (objc_msgSend(a1, "_contentForState:", objc_msgSend(a1, "state")),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "valueForKey:", v8),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v6,
            !v7))
      {
        objc_msgSend(a1, "_invalidateForPropertyChange");
      }
    }
    else
    {
      objc_msgSend(a1, "setNeedsLayout");
      if (objc_msgSend(a1, "state") == a3)
      {
        objc_msgSend(a1, "window");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          objc_msgSend(a1, "layoutBelowIfNeeded");
      }
    }
  }

}

- (void)_invalidateForPropertyChange
{
  -[UIControl _invalidatePointerInteraction](self, "_invalidatePointerInteraction");
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
  *(_QWORD *)&self->_buttonFlags |= 0x40000000uLL;
}

- (void)setNeedsLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIButton;
  -[UIView setNeedsLayout](&v4, sel_setNeedsLayout);
  if (dyld_program_sdk_at_least())
  {
    -[UIView _is_setNeedsLayout](self, "_is_setNeedsLayout");
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)configuration forImageInState:(UIControlState)state
{
  UIImageSymbolConfiguration *v6;
  int v7;
  void *v8;

  v6 = configuration;
  v7 = -[UIButton _setContentValue:forField:state:](self, v6, CFSTR("preferredSymbolConfiguration"), state);
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredSymbolConfiguration:forImageInState:", v6, state);

  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  if (v7)
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("preferredSymbolConfiguration"), state);
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state
{
  NSAttributedString *v6;
  int v7;
  void *v8;

  v6 = title;
  v7 = -[UIButton _setContentValue:forField:state:](self, v6, CFSTR("attributedTitle"), state);
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedTitle:forState:", v6, state);

  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  if (v7)
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("attributedTitle"), state);
}

- (void)_setVisualProvider:(id)a3
{
  UIButtonVisualProvider **p_visualProvider;
  __int16 buttonVisualProviderFlags;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  char v12;
  __int16 v13;
  __int16 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  p_visualProvider = &self->_visualProvider;
  v20 = a3;
  -[UIButtonVisualProvider cleanupForVisualProvider:](*p_visualProvider, "cleanupForVisualProvider:");
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 2) != 0)
  {
    -[UIButtonVisualProvider setButton:](*p_visualProvider, "setButton:", 0);
    buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  }
  *(_WORD *)&self->_buttonVisualProviderFlags = buttonVisualProviderFlags | 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 2;
  else
    v7 = 0;
  *(_WORD *)&self->_buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFFD | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_WORD *)&self->_buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFFB | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 8;
  else
    v9 = 0;
  *(_WORD *)&self->_buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFF7 | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 16;
  else
    v10 = 0;
  *(_WORD *)&self->_buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFEF | v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 32;
  else
    v11 = 0;
  *(_WORD *)&self->_buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFDF | v11;
  v12 = objc_opt_respondsToSelector();
  v13 = (__int16)self->_buttonVisualProviderFlags;
  if ((v12 & 1) != 0)
    v14 = 64;
  else
    v14 = 0;
  *(_WORD *)&self->_buttonVisualProviderFlags = v13 & 0xFFBF | v14;
  if ((v13 & 2) != 0)
    objc_msgSend(v20, "setButton:", self);
  objc_storeStrong((id *)&self->_visualProvider, a3);
  -[UIButton titleForState:](self, "titleForState:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:forState:", v15, 0);

  -[UIButton attributedTitleForState:](self, "attributedTitleForState:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAttributedTitle:forState:", v16, 0);

  -[UIButton imageForState:](self, "imageForState:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:forState:", v17, 0);

  objc_msgSend(v20, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
  objc_msgSend(v20, "setSelected:", -[UIControl isSelected](self, "isSelected"));
  if ((*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
  {
    if (self->_configuration)
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "automaticallyUpdateConfigurationIfNecessary:", self->_configuration);
      objc_msgSend(v18, "applyConfiguration");

    }
    else
    {
      -[UIButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    }
  }
  objc_msgSend(v20, "setContextMenuIsPrimary:", -[UIControl showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction"));
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIButton menu](self, "menu");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMenu:", v19);

}

- (NSAttributedString)attributedTitleForState:(UIControlState)state
{
  return (NSAttributedString *)-[UIButton _attributedTitleForState:adjustedToTraitCollection:](self, "_attributedTitleForState:adjustedToTraitCollection:", state, 0);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)_shouldHaveFloatingAppearance
{
  return 0;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
  UIImage *v6;
  int v7;
  void *v8;

  v6 = image;
  v7 = -[UIButton _setContentValue:forField:state:](self, v6, CFSTR("image"), state);
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v6, state);

  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  if (v7)
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("image"), state);
}

- (void)setBackgroundImage:(id)a3 forStates:(unint64_t)a4
{
  -[UIButton _setBackground:forStates:](self, "_setBackground:forStates:", a3, a4);
  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)autosizesToFit
{
  return (*(_BYTE *)&self->_buttonFlags >> 3) & 1;
}

- (void)_setBackground:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("background"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

}

- (id)_backgroundView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundViewCreateIfNeeded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIButton)initWithFrame:(CGRect)frame
{
  double height;
  double width;
  double y;
  double x;
  UIButton *v8;
  UIButton *v9;
  double v10;
  uint64_t v11;
  UIFont *lazyTitleViewFont;
  void *v15;
  objc_super v16;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  if (self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 1057, CFSTR("unsafe to initWithFrame: already initialized UIButton. Use setFrame: instead %@"), self);

  }
  v16.receiver = self;
  v16.super_class = (Class)UIButton;
  v8 = -[UIControl initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)&v8->_contentEdgeInsets.top = 0u;
    *(_OWORD *)&v8->_contentEdgeInsets.bottom = 0u;
    *(_OWORD *)&v8->_titleEdgeInsets.top = 0u;
    *(_OWORD *)&v8->_titleEdgeInsets.bottom = 0u;
    *(_OWORD *)&v8->_imageEdgeInsets.top = 0u;
    *(_OWORD *)&v8->_imageEdgeInsets.bottom = 0u;
    -[UIView setOpaque:](v8, "setOpaque:", 0);
    *(_QWORD *)&v9->_buttonFlags |= 6uLL;
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:", v10 + 1.0);
    v11 = objc_claimAutoreleasedReturnValue();
    lazyTitleViewFont = v9->_lazyTitleViewFont;
    v9->_lazyTitleViewFont = (UIFont *)v11;

    v9->_initialized = 1;
    _UIButtonCommonInit(v9);
  }
  return v9;
}

- (void)setSelectionInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_selectionInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__plainButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectionInteraction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_pointerStyleProvider, 0);
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_storeStrong(&self->_menuProvider, 0);
  objc_destroyWeak((id *)&self->_activeSizeToFitLayoutEngine);
  objc_storeStrong((id *)&self->_lazyTitleViewFont, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentLookup, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  v4 = a3;
  -[UIControl _willMoveToWindow:](&v6, sel__willMoveToWindow_, v4);
  -[UIButton _visualProvider](self, "_visualProvider", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willMoveToWindow:", v4);

}

- (void)_titleViewLabelMetricsChanged
{
  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[UIControl isEnabled](self, "isEnabled") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButton;
    -[UIControl setEnabled:](&v7, sel_setEnabled_, v3);
    -[UIButton _visualProvider](self, "_visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    -[UIButton setNeedsLayout](self, "setNeedsLayout");
    -[UIButton selectionInteraction](self, "selectionInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v3);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[UIControl isSelected](self, "isSelected") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButton;
    -[UIControl setSelected:](&v6, sel_setSelected_, v3);
    -[UIButton _visualProvider](self, "_visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", v3);

    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (_UISelectionInteraction)selectionInteraction
{
  return self->_selectionInteraction;
}

- (UILabel)titleLabel
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleViewCreateIfNeeded:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIButton;
  -[UIView setTintColor:](&v3, sel_setTintColor_, tintColor);
}

- (id)_shadowColorForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIButton _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shadowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIButton _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shadowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baselineOffsetsAtSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = contentRect.size.height;
  width = contentRect.size.width;
  y = contentRect.origin.y;
  x = contentRect.origin.x;
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleRectForContentRect:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_imageViewIfNeeded
{
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  return -[UIButton _imageView](self, "_imageView");
}

- (id)_imageColorForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[UIButton _contentForState:](self, "_contentForState:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UIButton _contentForState:](self, "_contentForState:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[UIButton _defaultImageColorForState:button:](UIButton, "_defaultImageColorForState:button:", a3, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[UIButton _defaultImageColorForState:button:](UIButton, "_defaultImageColorForState:button:", 0, self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v6;
}

+ (id)_defaultImageColorForState:(unint64_t)a3 button:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  if (objc_msgSend(v6, "_isInCarPlay"))
  {
    objc_msgSend(v6, "_externalImageColorForState:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v6, "_isModernButton") && (objc_msgSend(v6, "isEnabled") & 1) == 0)
  {
    objc_msgSend(v6, "_disabledColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (!v7)
  {
    v9 = objc_msgSend(v6, "buttonType");
    objc_msgSend(v6, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_defaultImageColorForType:andState:idiom:", v9, a3, objc_msgSend(v10, "userInterfaceIdiom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_defaultImageColorForType:(int64_t)a3 andState:(unint64_t)a4 idiom:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a3 != 7)
    return 0;
  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor", 7, a4, a5, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
  if (-[UIButton _setContentValue:forField:state:](self, color, CFSTR("titleColor"), state))
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("titleColor"), state);
}

- (void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
{
  if (self->_contentEdgeInsets.left != contentEdgeInsets.left
    || self->_contentEdgeInsets.top != contentEdgeInsets.top
    || self->_contentEdgeInsets.right != contentEdgeInsets.right
    || self->_contentEdgeInsets.bottom != contentEdgeInsets.bottom)
  {
    self->_contentEdgeInsets = contentEdgeInsets;
    if (contentEdgeInsets.left != 0.0
      || contentEdgeInsets.top != 0.0
      || contentEdgeInsets.right != 0.0
      || contentEdgeInsets.bottom != 0.0)
    {
      *(_OWORD *)&self->_internalTitlePaddingInsets.top = 0u;
      *(_OWORD *)&self->_internalTitlePaddingInsets.bottom = 0u;
    }
    if (-[UIButton autosizesToFit](self, "autosizesToFit"))
      -[UIView sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UIButton;
  v8 = a4;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v10, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, v8, v5);
  -[UIButton _visualProvider](self, "_visualProvider", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didChangeFromIdiom:onScreen:traverseHierarchy:", a3, v8, v5);

}

- (UIColor)titleColorForState:(UIControlState)state
{
  return (UIColor *)-[UIButton _titleColorForState:suppressTintColorFollowing:](self, "_titleColorForState:suppressTintColorFollowing:", state, 0);
}

- (UIImage)currentImage
{
  return -[UIButton imageForState:](self, "imageForState:", -[UIControl state](self, "state"));
}

+ (id)_defaultBackgroundImageColorForType:(int64_t)a3 andState:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a3 != 7)
    return 0;
  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor", 7, a4, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIImageView)imageView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageViewCreateIfNeeded:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  __int16 buttonVisualProviderFlags;
  void *v11;
  __int16 v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (__int16)self->_buttonVisualProviderFlags;

      if ((v12 & 4) != 0)
        goto LABEL_4;
    }
LABEL_6:
    v24.receiver = self;
    v24.super_class = (Class)UIButton;
    *(float *)&v22 = a4;
    *(float *)&v23 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v24, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v22, v23);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 4) == 0)
    goto LABEL_6;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
LABEL_7:
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicSizeWithinSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)_baselineOffsetFromBottom
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  double v6;
  double v7;
  double v8;
  double result;
  objc_super v10;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      -[UIView bounds](self, "bounds");
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", v6, v7);
      return v8;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UIButton;
  -[UIView _baselineOffsetFromBottom](&v10, sel__baselineOffsetFromBottom);
  return result;
}

- (UIImage)currentBackgroundImage
{
  return -[UIButton backgroundImageForState:](self, "backgroundImageForState:", -[UIControl state](self, "state"));
}

void __40__UIButton__didMoveFromWindow_toWindow___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = objc_msgSend(a2, "unsignedIntValue");
  v9 = objc_msgSend(*(id *)(a1 + 32), "state");
  v10 = objc_msgSend(v7, "updateVariableLengthStringForView:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    if (v9 == v8
      || !v8
      && (objc_msgSend(*(id *)(a1 + 32), "_contentForState:", v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "title"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (_UIButtonConfigurationShim)_currentConfiguration
{
  return self->_configuration;
}

- (UIButtonConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (_UIButtonConfigurationState)_configurationState
{
  _UIButtonConfigurationState *v3;
  void *v4;
  _UIButtonConfigurationState *v5;
  UIControlState v6;

  v3 = [_UIButtonConfigurationState alloc];
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIViewConfigurationState initWithTraitCollection:](v3, "initWithTraitCollection:", v4);

  v6 = -[UIControl state](self, "state");
  -[UIViewConfigurationState setDisabled:](v5, "setDisabled:", (v6 >> 1) & 1);
  -[UIViewConfigurationState setHighlighted:](v5, "setHighlighted:", v6 & 1);
  -[UIViewConfigurationState setSelected:](v5, "setSelected:", (v6 >> 2) & 1);
  -[UIViewConfigurationState setFocused:](v5, "setFocused:", (v6 >> 3) & 1);
  return v5;
}

- (id)_titleColorForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[UIButton _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 6)
    {
      -[UIButton _contentForState:](self, "_contentForState:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)_titleColorForState:(unint64_t)a3 suppressTintColorFollowing:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  char v12;

  -[UIButton _contentForState:](self, "_contentForState:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || (-[UIButton _contentForState:](self, "_contentForState:", 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "titleColor"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    v10 = 1;
    if (a4)
LABEL_4:
      *a4 = v10;
  }
  else
  {
    v12 = 0;
    +[UIButton _defaultTitleColorForState:button:isTintColor:](UIButton, "_defaultTitleColorForState:button:isTintColor:", a3, self, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[UIButton _defaultTitleColorForState:button:isTintColor:](UIButton, "_defaultTitleColorForState:button:isTintColor:", 0, self, &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v12 == 0;
    if (a4)
      goto LABEL_4;
  }
  return v8;
}

+ (id)_defaultTitleColorForState:(unint64_t)a3 button:(id)a4 isTintColor:(BOOL *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  char v13;

  v7 = a4;
  v13 = 0;
  if (objc_msgSend(v7, "_isInCarPlay"))
  {
    objc_msgSend(v7, "_externalTitleColorForState:isTintColor:", a3, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "_isModernButton"))
  {
    if ((objc_msgSend(v7, "_isModernButton") & 1) == 0)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
        goto LABEL_11;
      v10 = 0;
      goto LABEL_10;
    }
    v8 = 0;
    if (!a5)
      goto LABEL_11;
LABEL_9:
    v10 = v13;
LABEL_10:
    *a5 = v10;
    goto LABEL_11;
  }
  objc_msgSend(v7, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (v8)
  {
LABEL_6:
    if ((a3 & 2) != 0)
    {
      +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v8 = (void *)v9;
    }
  }
LABEL_8:
  if (a5)
    goto LABEL_9;
LABEL_11:
  v11 = v8;

  return v11;
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[UIControl contentHorizontalAlignment](self, "contentHorizontalAlignment") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButton;
    -[UIControl setContentHorizontalAlignment:](&v6, sel_setContentHorizontalAlignment_, a3);
    -[UIButton _visualProvider](self, "_visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentHorizontalAlignment:", a3);

  }
}

- (void)setNeedsUpdateConfiguration
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  id v7;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) == 0)
      return;
    goto LABEL_6;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (__int16)self->_buttonVisualProviderFlags;

    if ((v5 & 4) != 0)
    {
LABEL_6:
      -[UIButton _visualProvider](self, "_visualProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNeedsUpdateConfiguration");

      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        -[UIButton _visualProvider](self, "_visualProvider");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateConfigurationIfNecessary");

      }
    }
  }
}

+ (UIButton)buttonWithType:(UIButtonType)buttonType primaryAction:(UIAction *)primaryAction
{
  UIAction *v6;
  void *v7;
  void *v8;

  v6 = primaryAction;
  objc_msgSend(a1, "buttonWithType:", buttonType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "_commonInitForPrimaryAction:", v6);

  return (UIButton *)v8;
}

+ (UIButton)systemButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
  UIImage *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = image;
  v9 = target;
  objc_msgSend(a1, "buttonWithType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setImage:forState:", v8, 0);
  if (action)
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v9, action, 64);
  objc_msgSend(v11, "sizeToFit");

  return (UIButton *)v11;
}

- (void)setPointerStyleProvider:(UIButtonPointerStyleProvider)pointerStyleProvider
{
  void *v4;
  id v5;

  if (self->_pointerStyleProvider != pointerStyleProvider)
  {
    v4 = (void *)objc_msgSend(pointerStyleProvider, "copy");
    v5 = self->_pointerStyleProvider;
    self->_pointerStyleProvider = v4;

    if (self->_pointerStyleProvider)
      -[UIControl setPointerInteractionEnabled:](self, "setPointerInteractionEnabled:", 1);
    -[UIControl _invalidatePointerInteraction](self, "_invalidatePointerInteraction");
  }
}

+ (UIButton)buttonWithConfiguration:(UIButtonConfiguration *)configuration primaryAction:(UIAction *)primaryAction
{
  UIAction *v6;
  UIButtonConfiguration *v7;
  void *v8;

  v6 = primaryAction;
  v7 = configuration;
  objc_msgSend(a1, "buttonWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v7);

  if (v6)
    objc_msgSend(v8, "_commonInitForPrimaryAction:", v6);

  return (UIButton *)v8;
}

+ (UIButton)buttonWithType:(UIButtonType)buttonType
{
  void *v6;
  void *v7;
  void *v8;
  double *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UIButtonType v19;
  UIPopoverButton *v20;
  UIButton *p_super;
  __objc2_class *v22;
  UINavigationButton *v23;
  uint64_t v24;
  void *v25;
  UIRoundedRectButton *v26;
  void *v27;

  +[UITraitCollection _fallbackTraitCollection]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultSymbolConfigurationForType:andState:compact:idiom:", buttonType, 0, 0, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultImageForType:andState:withConfiguration:", buttonType, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double *)MEMORY[0x1E0C9D648];
  if (v8)
  {
    objc_msgSend(v8, "size");
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale(v10);
    v12 = v11;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale(v13);
    v15 = v14;

  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v17 = *v9;
  v16 = v9[1];
  v18 = objc_msgSend(a1, "_buttonTypeIsModernUI:", buttonType);
  if ((_DWORD)v18)
    v19 = UIButtonTypeCustom;
  else
    v19 = buttonType;
  switch(v19)
  {
    case 'd':
      v23 = [UINavigationButton alloc];
      v24 = 0;
      goto LABEL_17;
    case 'e':
      v23 = [UINavigationButton alloc];
      v24 = 1;
      goto LABEL_17;
    case 'f':
      v23 = [UINavigationButton alloc];
      v24 = 2;
LABEL_17:
      p_super = -[UINavigationButton initWithTitle:style:](v23, "initWithTitle:style:", 0, v24);
      -[UIButton setAutosizesToFit:](p_super, "setAutosizesToFit:", 1);
      goto LABEL_23;
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'o':
    case 'p':
    case 't':
    case 'u':
LABEL_13:
      v22 = (__objc2_class *)a1;
      goto LABEL_21;
    case 'n':
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIButton.m"), 877, CFSTR("UIButtonTypeTextured has never worked properly under ModernUI, replace your usage"));

      p_super = 0;
      goto LABEL_23;
    case 'q':
      v26 = [UIRoundedRectButton alloc];
      +[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      p_super = -[UIRoundedRectButton initWithFrame:fillColor:](v26, "initWithFrame:fillColor:", v27, v17, v16, v12, v15);

      goto LABEL_23;
    case 'r':
    case 's':
      v20 = -[UIPopoverButton initWithFrame:buttonType:]([UIPopoverButton alloc], "initWithFrame:buttonType:", buttonType, v17, v16, v12, v15);
      goto LABEL_22;
    default:
      switch(v19)
      {
        case UIButtonTypeSystem:
          goto LABEL_12;
        case UIButtonTypeDetailDisclosure:
        case UIButtonTypeInfoLight:
        case UIButtonTypeInfoDark:
          p_super = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v17, v16, v12, v15);
          -[UIButton setShowsTouchWhenHighlighted:](p_super, "setShowsTouchWhenHighlighted:", v18);
          goto LABEL_23;
        case UIButtonTypeContactAdd:
          v22 = UIButton;
          break;
        default:
          if (v19 != 9999)
            goto LABEL_13;
LABEL_12:
          v22 = UIRoundedRectButton;
          break;
      }
LABEL_21:
      v20 = (UIPopoverButton *)objc_msgSend([v22 alloc], "initWithFrame:", v17, v16, v12, v15);
LABEL_22:
      p_super = &v20->super;
LABEL_23:
      if (buttonType == 124)
      {
        buttonType = UIButtonTypeSystem;
        -[UIButton setChangesSelectionAsPrimaryAction:](p_super, "setChangesSelectionAsPrimaryAction:", 1);
        -[UIButton setShowsMenuAsPrimaryAction:](p_super, "setShowsMenuAsPrimaryAction:", 1);
      }
      -[UIButton _setButtonType:](p_super, "_setButtonType:", buttonType);
      if ((_DWORD)v18)
      {
        -[UIButton setAdjustsImageWhenHighlighted:](p_super, "setAdjustsImageWhenHighlighted:", 0);
        -[UIButton setAdjustsImageWhenDisabled:](p_super, "setAdjustsImageWhenDisabled:", 0);
        -[UIButton setShowsTouchWhenHighlighted:](p_super, "setShowsTouchWhenHighlighted:", 0);
        -[UIButton _setDefaultFontForIdiom](p_super, "_setDefaultFontForIdiom");
      }

      return p_super;
  }
}

- (void)_setButtonType:(int64_t)a3
{
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFC03FLL | ((unint64_t)a3 << 6));
  if (a3 == 7)
    -[UIControl setPointerInteractionEnabled:](self, "setPointerInteractionEnabled:", 1);
  -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)adjustsImageWhenHighlighted
{
  uint64_t v4;

  if (((((*(_QWORD *)&self->_buttonFlags & 2) == 0) ^ adjustsImageWhenHighlighted) & 1) == 0)
  {
    v4 = 2;
    if (!adjustsImageWhenHighlighted)
      v4 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFFDLL | v4);
    if (-[UIControl isHighlighted](self, "isHighlighted"))
      -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsTouchWhenHighlighted:(BOOL)showsTouchWhenHighlighted
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  if (((((*(_QWORD *)&self->_buttonFlags & 0x20) == 0) ^ showsTouchWhenHighlighted) & 1) == 0)
  {
    v3 = showsTouchWhenHighlighted;
    v4 = 32;
    if (!showsTouchWhenHighlighted)
      v4 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFDFLL | v4);
    -[UIButton _visualProvider](self, "_visualProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsTouchWhenHighlighted:", v3);

  }
}

- (void)setAdjustsImageWhenDisabled:(BOOL)adjustsImageWhenDisabled
{
  uint64_t v4;

  if (((((*(_QWORD *)&self->_buttonFlags & 4) == 0) ^ adjustsImageWhenDisabled) & 1) == 0)
  {
    v4 = 4;
    if (!adjustsImageWhenDisabled)
      v4 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFFBLL | v4);
    if (!-[UIControl isEnabled](self, "isEnabled"))
      -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setDefaultFontForIdiom
{
  void *v3;
  id v4;

  if (-[UIButton _isiOSSystemProvidedButton](self, "_isiOSSystemProvidedButton")
    && -[UIButton _shouldAdjustToTraitCollection](self, "_shouldAdjustToTraitCollection"))
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton _setFont:isDefaultForIdiom:](self, "_setFont:isDefaultForIdiom:");
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton _defaultFontForIdiom:](self, "_defaultFontForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _setFont:isDefaultForIdiom:](self, "_setFont:isDefaultForIdiom:", v3, 1);

  }
}

- (BOOL)_shouldAdjustToTraitCollection
{
  return 0;
}

- (void)_setFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  _BOOL8 v4;
  __int16 buttonVisualProviderFlags;
  void *v7;
  __int16 v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0)
      goto LABEL_7;
LABEL_6:
    -[UIButton _visualProvider](self, "_visualProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:isDefaultForIdiom:", v10, v4);

    goto LABEL_7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (__int16)self->_buttonVisualProviderFlags;

    if ((v8 & 0x20) != 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (void)_setLazyTitleViewFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  objc_storeStrong((id *)&self->_lazyTitleViewFont, a3);
  self->_lazyTitleViewFontIsDefaultForIdiom = a4;
}

- (id)_defaultFontForIdiom:(int64_t)a3
{
  double v3;

  v3 = 15.0;
  if (a3 == 5)
    v3 = 13.0;
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", v3);
}

- (void)_setDisableAutomaticTitleAnimations:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)_setImageContentMode:(int64_t)a3
{
  __int16 buttonVisualProviderFlags;
  void *v6;
  __int16 v7;
  id v8;

  self->__imageContentMode = a3;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x40) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImageContentMode:", a3);

    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (__int16)self->_buttonVisualProviderFlags;

      if ((v7 & 0x40) != 0)
        goto LABEL_4;
    }
  }
}

- (void)setChangesSelectionAsPrimaryAction:(BOOL)changesSelectionAsPrimaryAction
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!changesSelectionAsPrimaryAction)
    v3 = 0;
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFDFFFFFFFFFLL | v3);
  -[UIButton _updateForAutomaticSelection](self, "_updateForAutomaticSelection");
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  __int16 buttonVisualProviderFlags;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2739, CFSTR("Unexpected use of multiline text content sizing in UIButton"));

    goto LABEL_7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_6;
  v11 = (__int16)self->_buttonVisualProviderFlags;

  if ((v11 & 4) == 0)
    goto LABEL_6;
LABEL_7:
  -[UIButton _visualProvider](self, "_visualProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", x, y, width, height);
  objc_msgSend(v13, "setWidthForMultilineTextLayout:", CGRectGetWidth(v15));

  v14.receiver = self;
  v14.super_class = (Class)UIButton;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v14, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  __int16 buttonVisualProviderFlags;
  void *v5;
  __int16 v6;
  void *v7;
  void *v8;
  objc_super v9;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2732, CFSTR("Unexpected use of multiline text content sizing in UIButton"));

    goto LABEL_7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (__int16)self->_buttonVisualProviderFlags;

  if ((v6 & 4) == 0)
    goto LABEL_6;
LABEL_7:
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWidthForMultilineTextLayout:", 0.0);

  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v9, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (UIButtonConfiguration)configuration
{
  void *v2;
  void *v3;

  -[_UIButtonConfigurationShim _apiValue](self->_configuration, "_apiValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (UIButtonConfiguration *)v3;
}

- (void)_setContentHuggingPriorities:(CGSize)a3
{
  double width;
  double height;
  void *v7;
  id v8;
  objc_super v9;

  width = a3.width;
  if (a3.width < 1.0 || a3.height < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("UIButton content-hugging priorities must be >= 1."), 0, 1.0, a3.height);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  height = a3.height;
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  -[UIView _setContentHuggingPriorities:](&v9, sel__setContentHuggingPriorities_, a3.width);
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentHuggingPriorities:", width, height);

}

- (void)setShowsMenuAsPrimaryAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  -[UIControl setShowsMenuAsPrimaryAction:](&v6, sel_setShowsMenuAsPrimaryAction_);
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContextMenuIsPrimary:", v3);

  -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
  -[UIButton _updateForAutomaticSelection](self, "_updateForAutomaticSelection");
}

- (void)setMenu:(UIMenu *)menu
{
  UIMenu *v4;
  void *v5;
  UIMenu *v6;
  UIMenu *v7;
  void *v8;

  if (self->_menu != menu)
  {
    v4 = menu;
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIControlMenuUpdateVisibleMenu(v5, self->_menu, v4);

    v6 = (UIMenu *)-[UIMenu copy](v4, "copy");
    v7 = self->_menu;
    self->_menu = v6;

    -[UIButton _updateForAutomaticSelection](self, "_updateForAutomaticSelection");
    -[UIButton _visualProvider](self, "_visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMenu:", self->_menu);

    -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
    -[UIButton _updateContextMenuEnabled](self, "_updateContextMenuEnabled");
  }
}

- (void)_updateForAutomaticSelection
{
  _BOOL4 v3;
  UIMenu *menu;
  void *v5;
  void *v6;
  id v7;

  v3 = -[UIButton _isPopUpMenuButtonWithMenu:](self, "_isPopUpMenuButtonWithMenu:", self->_menu);
  menu = self->_menu;
  if (v3)
  {
    -[UIMenu setForceAutomaticSelection:](menu, "setForceAutomaticSelection:", 1);
    -[UIMenu setForcedAutomaticSelectionDelegate:](self->_menu, "setForcedAutomaticSelectionDelegate:", self);
    -[UIMenu selectedElements](self->_menu, "selectedElements");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](self, "setTitle:forState:", v6, 0);

  }
  else
  {
    -[UIMenu setForcedAutomaticSelectionDelegate:](menu, "setForcedAutomaticSelectionDelegate:", 0);
    -[UIMenu setForceAutomaticSelection:](self->_menu, "setForceAutomaticSelection:", 0);
  }
}

- (BOOL)_isPopUpMenuButtonWithMenu:(id)a3
{
  return a3
      && (*((_BYTE *)&self->_buttonFlags + 4) & 0x20) != 0
      && -[UIControl showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction");
}

- (void)_shim_setConfiguration:(id)a3
{
  _UIButtonConfigurationShim *v4;
  _UIButtonConfigurationShim *v5;
  _UIButtonConfigurationShim *configuration;
  _BOOL4 v7;
  _BOOL4 v8;
  _UIButtonConfigurationShim *v9;
  _UIButtonConfigurationShim *v10;
  __int16 buttonVisualProviderFlags;
  void *v12;
  __int16 v13;
  void *v14;
  _UIButtonConfigurationShim *v15;

  v4 = (_UIButtonConfigurationShim *)a3;
  v5 = v4;
  configuration = self->_configuration;
  if (configuration != v4)
  {
    v7 = configuration == 0;
    v8 = v4 != 0;
    v15 = v4;
    v9 = (_UIButtonConfigurationShim *)-[_UIButtonConfigurationShim copy](v4, "copy");
    v10 = self->_configuration;
    self->_configuration = v9;

    if (((v8 ^ v7) & 1) == 0)
      -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
    buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if ((buttonVisualProviderFlags & 1) != 0)
    {
      v5 = v15;
      if ((buttonVisualProviderFlags & 4) == 0)
        goto LABEL_10;
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      if (!v12)
        goto LABEL_10;
      v13 = (__int16)self->_buttonVisualProviderFlags;

      v5 = v15;
      if ((v13 & 4) == 0)
        goto LABEL_10;
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "automaticallyUpdateConfigurationIfNecessary:", self->_configuration);
    objc_msgSend(v14, "applyConfiguration");

    v5 = v15;
  }
LABEL_10:

}

- (BOOL)automaticallyUpdatesConfiguration
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 4) & 1;
}

- (void)_setCurrentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIButtonRole)role
{
  return (unint64_t)(*(_QWORD *)&self->_buttonFlags >> 14);
}

- (BOOL)_menuEnabled
{
  void *v3;
  int v4;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "shouldUpdateContextMenuEnabledOnMenuChanges");

  if (v4)
    return -[UIControl isContextMenuInteractionEnabled](self, "isContextMenuInteractionEnabled");
  if (self->_menu)
    return 1;
  return self->_menuProvider != 0;
}

- (BOOL)changesSelectionAsPrimaryAction
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 5) & 1;
}

void __33__UIButton__hasImageForProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a3, "valueForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
  NSString *v6;
  int v7;
  void *v8;

  v6 = title;
  v7 = -[UIButton _setContentValue:forField:state:](self, v6, CFSTR("title"), state);
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v6, state);

  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  if (v7)
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("title"), state);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL8 v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (dyld_program_sdk_at_least())
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }
  -[UIButton _setFrame:deferLayout:](self, "_setFrame:deferLayout:", v9, x, y, width, height);
}

- (void)_setFrame:(CGRect)a3 deferLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  __int16 buttonVisualProviderFlags;
  void *v16;
  __int16 v17;
  void *v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v19.receiver = self;
  v19.super_class = (Class)UIButton;
  -[UIView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  if (v11 != width || v13 != height)
  {
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
    if (!a4)
      -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if ((buttonVisualProviderFlags & 1) != 0)
    {
      if ((buttonVisualProviderFlags & 4) == 0)
        return;
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        return;
      v17 = (__int16)self->_buttonVisualProviderFlags;

      if ((v17 & 4) == 0)
        return;
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "invalidateLayoutData");

  }
}

- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
{
  if (self->_imageEdgeInsets.left != imageEdgeInsets.left
    || self->_imageEdgeInsets.top != imageEdgeInsets.top
    || self->_imageEdgeInsets.right != imageEdgeInsets.right
    || self->_imageEdgeInsets.bottom != imageEdgeInsets.bottom)
  {
    self->_imageEdgeInsets = imageEdgeInsets;
    if (-[UIButton autosizesToFit](self, "autosizesToFit"))
      -[UIView sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIButton;
  -[UIView dealloc](&v2, sel_dealloc);
}

- (void)_updateContextMenuEnabled
{
  void *v3;
  int v4;
  _BOOL8 v5;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "shouldUpdateContextMenuEnabledOnMenuChanges");

  if (v4)
  {
    if (self->_menu)
      v5 = 1;
    else
      v5 = self->_menuProvider != 0;
    -[UIControl setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v5);
  }
}

- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  self->_preferredMenuElementOrder = preferredMenuElementOrder;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *contentLookup;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIButton;
  -[UIControl _didMoveFromWindow:toWindow:](&v14, sel__didMoveFromWindow_toWindow_, v6, v7);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  contentLookup = self->_contentLookup;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__UIButton__didMoveFromWindow_toWindow___block_invoke;
  v9[3] = &unk_1E16C2D70;
  v9[4] = self;
  v9[5] = &v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contentLookup, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (*((_BYTE *)v11 + 24))
  {
    if ((~*(_QWORD *)&self->super.super._viewFlags & 0x420000000000000) == 0)
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if (-[UIButton autosizesToFit](self, "autosizesToFit"))
      -[UIView sizeToFit](self, "sizeToFit");
    -[UIButton _invalidateForPropertyChange](self, "_invalidateForPropertyChange");
  }
  _Block_object_dispose(&v10, 8);

}

- (void)_setFont:(id)a3
{
  -[UIButton _setFont:isDefaultForIdiom:](self, "_setFont:isDefaultForIdiom:", a3, 0);
}

- (double)_preferredMaxLayoutWidth
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  double v7;
  double v8;
  double result;
  objc_super v10;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "widthForMultilineTextLayout");
      v8 = v7;

      return v8;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UIButton;
  -[UIView _preferredMaxLayoutWidth](&v10, sel__preferredMaxLayoutWidth);
  return result;
}

- (NSString)currentTitle
{
  return -[UIButton titleForState:](self, "titleForState:", -[UIControl state](self, "state"));
}

- (void)_setWantsAccessibilityUnderline:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (a3)
    v3 = 0;
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setPreferredBehavioralStyle:(UIBehavioralStyle)preferredBehavioralStyle
{
  char v3;
  UIBehavioralStyle v5;

  v3 = preferredBehavioralStyle;
  v5 = -[UIButton behavioralStyle](self, "behavioralStyle");
  *(_WORD *)&self->_buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xF87F | ((v3 & 0xF) << 7);
  if (v5 != -[UIButton behavioralStyle](self, "behavioralStyle"))
    -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
}

- (UIBehavioralStyle)behavioralStyle
{
  return 1;
}

- (void)_commonInitForPrimaryAction:(id)a3
{
  id v4;
  UIButtonType v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIButton;
  -[UIControl _commonInitForPrimaryAction:](&v8, sel__commonInitForPrimaryAction_, v4);
  v5 = -[UIButton buttonType](self, "buttonType");
  if ((unint64_t)(v5 - 124) < 3 || (unint64_t)v5 <= UIButtonTypeSystem)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      -[UIButton setTitle:forState:](self, "setTitle:forState:", v6, 0);
    objc_msgSend(v4, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[UIButton setImage:forState:](self, "setImage:forState:", v7, 0);

  }
}

- (void)setRole:(UIButtonRole)role
{
  id v4;

  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFC03FFFLL | ((unint64_t)role << 14));
  -[UIButton _visualProvider](self, "_visualProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRole:", role);

}

- (void)_setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  __int16 buttonVisualProviderFlags;
  void *v8;
  __int16 v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  v6 = 0x10000000;
  if (!v4)
    v6 = 0;
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFEFFFFFFFLL | v6);
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x10) == 0)
      goto LABEL_9;
LABEL_8:
    -[UIButton _visualProvider](self, "_visualProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisualEffectViewEnabled:backgroundColor:", v4, v11);

    goto LABEL_9;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (__int16)self->_buttonVisualProviderFlags;

    if ((v9 & 0x10) != 0)
      goto LABEL_8;
  }
LABEL_9:

}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[UIControl contentVerticalAlignment](self, "contentVerticalAlignment") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButton;
    -[UIControl setContentVerticalAlignment:](&v6, sel_setContentVerticalAlignment_, a3);
    -[UIButton _visualProvider](self, "_visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentVerticalAlignment:", a3);

  }
}

- (UILabel)subtitleLabel
{
  void *v2;
  void *v3;

  if ((*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitleViewCreateIfNeeded:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (UILabel *)v2;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
  if (self->_titleEdgeInsets.left != titleEdgeInsets.left
    || self->_titleEdgeInsets.top != titleEdgeInsets.top
    || self->_titleEdgeInsets.right != titleEdgeInsets.right
    || self->_titleEdgeInsets.bottom != titleEdgeInsets.bottom)
  {
    self->_titleEdgeInsets = titleEdgeInsets;
    if (-[UIButton autosizesToFit](self, "autosizesToFit"))
      -[UIView sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setLineBreakMode:(int64_t)a3
{
  __int16 buttonVisualProviderFlags;
  void *v6;
  __int16 v7;
  id v8;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLineBreakMode:", a3);

    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (__int16)self->_buttonVisualProviderFlags;

      if ((v7 & 0x20) != 0)
        goto LABEL_4;
    }
  }
}

- (void)_setMenuProvider:(id)a3
{
  id v4;
  void *v5;
  id menuProvider;
  void *v7;

  if (self->_menuProvider != a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(v4, "copy");
    menuProvider = self->_menuProvider;
    self->_menuProvider = v5;

    -[UIButton _visualProvider](self, "_visualProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenuProvider:", v4);

    -[UIButton _updateContextMenuEnabled](self, "_updateContextMenuEnabled");
  }
}

- (void)_setHasActiveMenuPresentation:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIControl _hasActiveMenuPresentation](self, "_hasActiveMenuPresentation");
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  -[UIControl _setHasActiveMenuPresentation:](&v6, sel__setHasActiveMenuPresentation_, v3);
  if (v5 != v3)
    -[UIButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
  int v6;

  v6 = -[UIButton _setContentValue:forField:state:](self, image, CFSTR("background"), state);
  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  if (v6)
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("background"), state);
}

- (id)largeContentTitle
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetLargeContentTitle");

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    -[UIView largeContentTitle](&v9, sel_largeContentTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIButton titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (void)setConfigurationUpdateHandler:(UIButtonConfigurationUpdateHandler)configurationUpdateHandler
{
  void *v4;
  id v5;
  __int16 buttonVisualProviderFlags;
  void *v7;
  __int16 v8;

  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    v4 = (void *)objc_msgSend(configurationUpdateHandler, "copy");
    v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if ((buttonVisualProviderFlags & 1) != 0)
    {
      if ((buttonVisualProviderFlags & 4) != 0)
      {
LABEL_9:
        -[UIButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
        return;
      }
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_9;
      v8 = (__int16)self->_buttonVisualProviderFlags;

      if ((v8 & 4) != 0)
        goto LABEL_9;
    }
    -[UIButton _refreshVisualProvider](self, "_refreshVisualProvider");
    goto LABEL_9;
  }
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[5];

  v3 = a3;
  if (-[UIButton adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory") != a3)
  {
    v5 = 0x100000000;
    if (!v3)
      v5 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFEFFFFFFFFLL | v5);
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __117__UIButton_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
  }
}

- (void)setImage:(id)a3 forStates:(unint64_t)a4
{
  -[UIButton _setImage:forStates:](self, "_setImage:forStates:", a3, a4);
  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setImage:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("image"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_updateConfigurationWithObservationTracking:(id)a3
{
  UIButton *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_185729508(a3);
  swift_unknownObjectRelease();

}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (unint64_t)defaultAccessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIButton;
  return -[NSObject defaultAccessibilityTraits](&v3, sel_defaultAccessibilityTraits) | 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (UIBehavioralStyle)preferredBehavioralStyle
{
  return ((unint64_t)*(_WORD *)&self->_buttonVisualProviderFlags >> 7) & 0xF;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_configuration)
    objc_msgSend(v4, "appendFormat:", CFSTR(" configuration=%@"), self->_configuration);
  return (NSString *)v4;
}

- (id)_layoutDebuggingTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIButton titleForState:](self, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIButton attributedTitleForState:](self, "attributedTitleForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (UIButton)systemButtonWithPrimaryAction:(UIAction *)primaryAction
{
  return (UIButton *)objc_msgSend(a1, "buttonWithType:primaryAction:", 1, primaryAction);
}

+ (id)_defaultNormalTitleColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)_defaultNormalTitleShadowColor
{
  return 0;
}

- (UIButton)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIButton *v5;
  UIButton *v6;
  unint64_t buttonFlags;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  double v37;
  uint64_t v38;
  UIFont *lazyTitleViewFont;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  char v46;
  uint64_t v47;
  UIMenu *menu;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  _UIButtonConfigurationShim *configuration;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = coder;
  v58.receiver = self;
  v58.super_class = (Class)UIButton;
  v5 = -[UIControl initWithCoder:](&v58, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_43;
  *(_QWORD *)&v5->_buttonFlags &= 0xFFFFFFFFFFFFC03FLL;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIButtonType")))
    buttonFlags = *(_QWORD *)&v6->_buttonFlags & 0xFFFFFFFFFFFFC03FLL | ((unint64_t)-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIButtonType")) << 6);
  else
    buttonFlags = (unint64_t)v6->_buttonFlags;
  v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(buttonFlags & 0xFFFFFFFFFFC03FFFLL);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIButtonRole")))
    v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&v6->_buttonFlags & 0xFFFFFFFFFFC03FFFLL | ((unint64_t)-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIButtonRole")) << 14));
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIReversesTitleShadowOnHighlight"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = CFSTR("UIReversesTitleShadowOnHighlight");
  else
    v9 = CFSTR("UIReversesTitleShadowWhenHighlighted");
  v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&v6->_buttonFlags & 0xFFFFFFFFFFFFFFFELL | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v9));
  -[UIButton setShowsTouchWhenHighlighted:](v6, "setShowsTouchWhenHighlighted:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowsTouchWhenHighlighted")));
  v10 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAdjustsImageWhenHighlighted"));
  v11 = 2;
  if (!v10)
    v11 = 0;
  v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&v6->_buttonFlags & 0xFFFFFFFFFFFFFFFDLL | v11);
  v12 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAdjustsImageWhenDisabled"));
  v13 = 4;
  if (!v12)
    v13 = 0;
  v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&v6->_buttonFlags & 0xFFFFFFFFFFFFFFFBLL | v13);
  v14 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAdjustsImageSizeForAccessibilityContentSizeCategory"));
  v15 = 0x100000000;
  if (!v14)
    v15 = 0;
  v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&v6->_buttonFlags & 0xFFFFFFFEFFFFFFFFLL | v15);
  -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIContentEdgeInsets"));
  v6->_contentEdgeInsets.top = v16;
  v6->_contentEdgeInsets.left = v17;
  v6->_contentEdgeInsets.bottom = v18;
  v6->_contentEdgeInsets.right = v19;
  -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UITitleEdgeInsets"));
  v6->_titleEdgeInsets.top = v20;
  v6->_titleEdgeInsets.left = v21;
  v6->_titleEdgeInsets.bottom = v22;
  v6->_titleEdgeInsets.right = v23;
  -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIImageEdgeInsets"));
  v6->_imageEdgeInsets.top = v24;
  v6->_imageEdgeInsets.left = v25;
  v6->_imageEdgeInsets.bottom = v26;
  v6->_imageEdgeInsets.right = v27;
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIButtonStatefulContent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _takeContentFromArchivableContent:](v6, "_takeContentFromArchivableContent:", v28);
  *(_QWORD *)&v6->_buttonFlags |= 0x80000000uLL;
  if (-[UIButton _shouldHaveFloatingAppearance](v6, "_shouldHaveFloatingAppearance"))
  {
    -[UIView subviews](v6, "subviews");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");

    -[UIButton _effectiveContentView](v6, "_effectiveContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v32 = v30;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v55 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(v31, "addSubview:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), (_QWORD)v54);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v34);
    }

  }
  objc_msgSend(off_1E167A828, "defaultFontSize", (_QWORD)v54);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", v37 + 1.0);
  v38 = objc_claimAutoreleasedReturnValue();
  lazyTitleViewFont = v6->_lazyTitleViewFont;
  v6->_lazyTitleViewFont = (UIFont *)v38;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIFont"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](v6, "traitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "userInterfaceIdiom");

  if (v42 == 5)
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v40, "isEqual:", v43);

    if (!v44)
      goto LABEL_30;
    goto LABEL_29;
  }
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 18.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v40, "isEqual:", v45);

  if ((v46 & 1) != 0)
  {
LABEL_29:

    v40 = 0;
  }
LABEL_30:
  -[UIButton _setFont:](v6, "_setFont:", v40);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UILineBreakMode")))
    -[UIButton _setLineBreakMode:](v6, "_setLineBreakMode:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UILineBreakMode")));
  -[NSCoder decodeCGSizeForKey:](v4, "decodeCGSizeForKey:", CFSTR("UITitleShadowOffset"));
  -[UIButton _setTitleShadowOffset:](v6, "_setTitleShadowOffset:");
  *(_WORD *)&v6->_buttonVisualProviderFlags = *(_WORD *)&v6->_buttonVisualProviderFlags & 0xF87F | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIBehavioralStyle")) & 0xF) << 7);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISpringLoaded")))
    -[UIButton setSpringLoaded:](v6, "setSpringLoaded:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISpringLoaded")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIButtonMenu")))
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonMenu"));
    v47 = objc_claimAutoreleasedReturnValue();
    menu = v6->_menu;
    v6->_menu = (UIMenu *)v47;

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIButtonChangesSelectionAsPrimaryAction")))
  {
    v49 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIButtonChangesSelectionAsPrimaryAction"));
    v50 = 0x2000000000;
    if (!v49)
      v50 = 0;
    v6->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&v6->_buttonFlags & 0xFFFFFFDFFFFFFFFFLL | v50);
  }
  -[UIButton _updateForAutomaticSelection](v6, "_updateForAutomaticSelection");
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIButtonConfiguration")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIButtonConfiguration"));
    v51 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (_UIButtonConfigurationShim *)v51;

  }
  _UIButtonCommonInit(v6);
  -[UIButton _refreshVisualProvider](v6, "_refreshVisualProvider");

LABEL_43:
  return v6;
}

- (UIButton)initWithFrame:(CGRect)frame primaryAction:(UIAction *)primaryAction
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIButton;
  return -[UIControl initWithFrame:primaryAction:](&v5, sel_initWithFrame_primaryAction_, primaryAction, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

- (id)_encodableSubviews
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 8) != 0)
        goto LABEL_4;
    }
LABEL_6:
    v7 = 0;
    return v7;
  }
  if ((buttonVisualProviderFlags & 8) == 0)
    goto LABEL_6;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodableSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  __int16 buttonVisualProviderFlags;
  void *v6;
  __int16 v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  -[UIView _populateArchivedSubviews:](&v9, sel__populateArchivedSubviews_, v4);
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 8) == 0)
      goto LABEL_7;
LABEL_6:
    -[UIButton _visualProvider](self, "_visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "populateArchivedSubviews:", v4);

    goto LABEL_7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (__int16)self->_buttonVisualProviderFlags;

    if ((v7 & 8) != 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  __int16 buttonVisualProviderFlags;
  void *v9;
  uint64_t v10;
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  unint64_t v21;
  UIMenu *menu;
  id v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIButton;
  -[UIControl encodeWithCoder:](&v24, sel_encodeWithCoder_, v5);
  v23 = 0;
  -[UIButton _archivableContent:](self, "_archivableContent:", &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UIButtonStatefulContent"));
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("UIButtonStatefulContentOverrides"));
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0)
      goto LABEL_15;
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0)
      goto LABEL_14;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lineBreakMode");

  if ((buttonVisualProviderFlags & 1) == 0)
  if (v10 != 5)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeInteger:forKey:", objc_msgSend(v3, "lineBreakMode"), CFSTR("UILineBreakMode"));
LABEL_14:

  }
LABEL_15:
  buttonFlags = self->_buttonFlags;
  if ((*(_BYTE *)&buttonFlags & 1) != 0)
  {
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIReversesTitleShadowWhenHighlighted"));
    buttonFlags = self->_buttonFlags;
    if ((*(_BYTE *)&buttonFlags & 0x20) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&buttonFlags & 2) == 0)
        goto LABEL_18;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&buttonFlags & 0x20) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIShowsTouchWhenHighlighted"));
  buttonFlags = self->_buttonFlags;
  if ((*(_BYTE *)&buttonFlags & 2) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&buttonFlags & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_30:
  objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIAdjustsImageWhenHighlighted"));
  buttonFlags = self->_buttonFlags;
  if ((*(_BYTE *)&buttonFlags & 4) != 0)
  {
LABEL_19:
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIAdjustsImageWhenDisabled"));
    buttonFlags = self->_buttonFlags;
  }
LABEL_20:
  if ((*(unint64_t *)&buttonFlags >> 6))
  {
    objc_msgSend(v5, "encodeInteger:forKey:");
    buttonFlags = self->_buttonFlags;
  }
  if ((*(_QWORD *)&buttonFlags & 0x100000000) != 0)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIAdjustsImageSizeForAccessibilityContentSizeCategory"));
  v12 = (__int16)self->_buttonVisualProviderFlags;
  if ((v12 & 1) != 0)
  {
    if ((v12 & 0x20) == 0)
      goto LABEL_38;
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0)
      goto LABEL_37;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v12 & 1) == 0)
  if (v14)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("UIFont"));

LABEL_37:
  }
LABEL_38:
  if ((*(_DWORD *)&self->_buttonFlags >> 14))
    objc_msgSend(v5, "encodeInteger:forKey:");
  if (self->_contentEdgeInsets.top != 0.0
    || self->_contentEdgeInsets.bottom != 0.0
    || self->_contentEdgeInsets.left != 0.0
    || self->_contentEdgeInsets.right != 0.0)
  {
    objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", CFSTR("UIContentEdgeInsets"));
  }
  if (self->_titleEdgeInsets.top != 0.0
    || self->_titleEdgeInsets.bottom != 0.0
    || self->_titleEdgeInsets.left != 0.0
    || self->_titleEdgeInsets.right != 0.0)
  {
    objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", CFSTR("UITitleEdgeInsets"));
  }
  v16 = (__int16)self->_buttonVisualProviderFlags;
  if ((v16 & 1) != 0)
  {
    if ((v16 & 0x20) == 0)
      goto LABEL_64;
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0)
      goto LABEL_63;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleShadowOffset");
  v20 = v19 != *(double *)(MEMORY[0x1E0C9D820] + 8) || v18 != *MEMORY[0x1E0C9D820];

  if ((v16 & 1) == 0)
  {

    if (!v20)
      goto LABEL_64;
    goto LABEL_62;
  }
  if (v20)
  {
LABEL_62:
    -[UIButton _visualProvider](self, "_visualProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "titleShadowOffset");
    objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("UITitleShadowOffset"));
LABEL_63:

  }
LABEL_64:
  if (self->_imageEdgeInsets.top != 0.0
    || self->_imageEdgeInsets.bottom != 0.0
    || self->_imageEdgeInsets.left != 0.0
    || self->_imageEdgeInsets.right != 0.0)
  {
    objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", CFSTR("UIImageEdgeInsets"));
  }
  v21 = ((unint64_t)*(_WORD *)&self->_buttonVisualProviderFlags >> 7) & 0xF;
  if ((_DWORD)v21)
    objc_msgSend(v5, "encodeInteger:forKey:", v21, CFSTR("UIBehavioralStyle"));
  if (-[UIButton isSpringLoaded](self, "isSpringLoaded"))
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UISpringLoaded"));
  menu = self->_menu;
  if (menu)
    objc_msgSend(v5, "encodeObject:forKey:", menu, CFSTR("UIButtonMenu"));
  if ((*((_BYTE *)&self->_buttonFlags + 4) & 0x20) != 0)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIButtonChangesSelectionAsPrimaryAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configuration, CFSTR("UIButtonConfiguration"));

}

- (void)_setHighlightedWithoutUpdatingState:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIButton;
  -[UIControl setHighlighted:](&v3, sel_setHighlighted_, a3);
}

- (void)_setHovered:(BOOL)a3
{
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  uint64_t v4;

  buttonFlags = self->_buttonFlags;
  if (((((*(_QWORD *)&buttonFlags & 0x800000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x800000000;
    if (!a3)
      v4 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&buttonFlags & 0xFFFFFFF7FFFFFFFFLL | v4);
    -[UIButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (BOOL)isHovered
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 3) & 1;
}

- (BOOL)reversesTitleShadowWhenHighlighted
{
  return *(_DWORD *)&self->_buttonFlags & 1;
}

- (void)setReversesTitleShadowWhenHighlighted:(BOOL)reversesTitleShadowWhenHighlighted
{
  _BOOL8 v3;
  id v4;

  if (((((*(_QWORD *)&self->_buttonFlags & 1) == 0) ^ reversesTitleShadowWhenHighlighted) & 1) == 0)
  {
    v3 = reversesTitleShadowWhenHighlighted;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFFELL | reversesTitleShadowWhenHighlighted);
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReversesTitleShadowWhenHighlighted:", v3);

  }
}

+ (void)_registerVisualProviderClass:(Class)a3 forIdiom:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = (void *)__UIButtonIdiomsToVisualProviderClasses;
  if (!__UIButtonIdiomsToVisualProviderClasses)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__UIButtonIdiomsToVisualProviderClasses;
    __UIButtonIdiomsToVisualProviderClasses = v7;

    v6 = (void *)__UIButtonIdiomsToVisualProviderClasses;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)__UIButtonIdiomsToVisualProviderClasses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v11);

  }
  if ((-[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_automaticallyUpdateConfigurationIfNecessary_) & 1) != 0)v12 = 2;
  else
    v12 = objc_opt_respondsToSelector() & 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", a3, v13);

}

- (BOOL)_supportsMacIdiom
{
  return -[UIButton isMemberOfClass:](self, "isMemberOfClass:", NSClassFromString(CFSTR("CNPropertyLabelButton"))) ^ 1;
}

- (BOOL)_disableAutomaticTitleAnimations
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 1) & 1;
}

- (BOOL)_hasVisibleDefaultSelectionIndicator
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[UIControl isSelected](self, "isSelected"))
    return 0;
  -[UIButton _selectionIndicatorView](self, "_selectionIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_isEffectivelyDisabledExternalButton
{
  void *v3;
  BOOL v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIButton _isInCarPlay](self, "_isInCarPlay")
    && !-[UIButton canBecomeFocused](self, "canBecomeFocused")
    && (objc_msgSend(v3, "interactionModel") & 1) == 0;

  return v4;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  -[UIView _didUpdateFocusInContext:](&v9, sel__didUpdateFocusInContext_, v5);
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 1844, CFSTR("Received call to _didUpdateFocusInContext: outside of a focus update."));

  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didUpdateFocusInContext:withAnimationCoordinator:", v5, v6);

}

- (BOOL)canBecomeFocused
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  if (!-[UIControl canBecomeFocused](&v6, sel_canBecomeFocused))
    return 0;
  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canBecomeFocused");

  return v4;
}

- (id)_defaultFocusEffect
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UIButton _visualProvider](self, "_visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultFocusEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    -[UIView _defaultFocusEffect](&v9, sel__defaultFocusEffect);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (double)_focusSizeIncrease
{
  void *v2;
  double v3;
  double v4;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSizeIncrease");
  v4 = v3;

  return v4;
}

- (void)_setFocusSizeIncrease:(double)a3
{
  id v4;

  -[UIButton _visualProvider](self, "_visualProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFocusSizeIncrease:", a3);

}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredConfigurationForFocusAnimation:inContext:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIButton;
    -[UIView _preferredConfigurationForFocusAnimation:inContext:](&v13, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "touchesBegan");

  if (_UIDeviceHasExternalTouchInput())
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIButton;
    v9 = -[UIControl beginTrackingWithTouch:withEvent:](&v11, sel_beginTrackingWithTouch_withEvent_, v6, v7);
  }

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "touchesEnded");

  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  -[UIControl endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v7, v6);

}

- (void)_selectionInteractionDidBeginHinting:(id)a3
{
  void *v3;
  char v4;
  UIButton *v5;

  v5 = self;
  -[UIView _focusBehavior](v5, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonSelectionMode");

  if ((v4 & 2) != 0 && -[UIControl isEnabled](v5, "isEnabled"))
  {
    *(_QWORD *)&v5->_buttonFlags |= 0x4000000uLL;
    -[UIButton setHighlighted:](v5, "setHighlighted:", 1);
  }

}

- (void)_selectionInteractionDidCancelHinting:(id)a3
{
  void *v3;
  char v4;
  UIButton *v5;

  v5 = self;
  -[UIView _focusBehavior](v5, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonSelectionMode");

  if ((v4 & 2) != 0 && -[UIControl isHighlighted](v5, "isHighlighted"))
  {
    *(_QWORD *)&v5->_buttonFlags |= 0x4000000uLL;
    -[UIButton setHighlighted:](v5, "setHighlighted:", 0);
    -[UIControl _setTouchHasHighlighted:](v5, "_setTouchHasHighlighted:", 0);
  }

}

- (void)_selectionInteractionDidSelect:(id)a3
{
  UIButton *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  uint64_t v8;

  v3 = self;
  -[UIView _focusBehavior](v3, "_focusBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonSelectionMode");

  if ((v5 & 2) != 0 && -[UIControl isHighlighted](v3, "isHighlighted"))
  {
    *(_QWORD *)&v3->_buttonFlags |= 0x4000000uLL;
    -[UIButton setHighlighted:](v3, "setHighlighted:", 0);
    -[UIControl _setTouchHasHighlighted:](v3, "_setTouchHasHighlighted:", 0);
  }

  -[UIView _focusBehavior](v3, "_focusBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "buttonSelectionMode");

  if ((v7 & 1) != 0)
  {
    -[UIControl sendActionsForControlEvents:](v3, "sendActionsForControlEvents:", 1);
    v8 = 64;
  }
  else
  {
    if (-[UIButton _isToggleButton](v3, "_isToggleButton"))
      -[UIButton setSelected:](v3, "setSelected:", -[UIControl isSelected](v3, "isSelected") ^ 1);
    v8 = 0x2000;
  }
  -[UIControl sendActionsForControlEvents:](v3, "sendActionsForControlEvents:", v8);
}

- (UIEdgeInsets)_pathTitleEdgeInsets
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5)
    v5 = 8.0;
  else
    v5 = 10.0;
  UIRoundToViewScale(self);
  v7 = v6 + 1.0;
  v8 = v5;
  v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)_pathImageEdgeInsets
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5)
    v5 = 8.0;
  else
    v5 = 11.0;
  UIRoundToViewScale(self);
  v7 = v6 + 1.0;
  v8 = v5;
  v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (double)_highlightCornerRadius
{
  double result;
  double v4;
  double v5;
  double v6;

  if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
  {
    UIRoundToViewScale(self);
  }
  else
  {
    -[UIButton _clippedHighlightBounds](self, "_clippedHighlightBounds");
    if (v4 >= v5)
      v6 = v5;
    else
      v6 = v4;
    return v6 * 0.5;
  }
  return result;
}

- (BOOL)_hasHighlightColor
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UIButton _contentForState:](self, "_contentForState:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D98, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v2, "titleColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4 != 0;

  return v5;
}

+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5 highlightBlock:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v7 = a5;
  v8 = a3;
  v9 = a4;
  v10 = a6;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __73__UIButton__setVisuallyHighlighted_forViews_initialPress_highlightBlock___block_invoke;
  v18 = &unk_1E16B1D18;
  v11 = v9;
  v19 = v11;
  v12 = v10;
  v20 = v12;
  v13 = _Block_copy(&v15);
  v14 = v13;
  if (v8 && v7)
    (*((void (**)(void *))v13 + 2))(v13);
  else
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v13, 0, 0.47, 0.0, v15, v16, v17, v18, v19);

}

void __73__UIButton__setVisuallyHighlighted_forViews_initialPress_highlightBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __68__UIButton__setVisuallyHighlighted_forViews_initialPress_baseAlpha___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", *(double *)(a1 + 32));
}

- (double)_selectedIndicatorAlpha
{
  return 1.0;
}

- (id)_selectedIndicatorViewWithImage:(id)a3
{
  id v3;
  UIImageView *v4;

  v3 = a3;
  v4 = objc_alloc_init(UIImageView);
  -[UIImageView setImage:](v4, "setImage:", v3);

  return v4;
}

- (CGRect)_selectedIndicatorBounds
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 buttonVisualProviderFlags;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[UIView bounds](self, "bounds");
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIButton _visualProvider](self, "_visualProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "useTitleForSelectedIndicatorBounds");

  if (v14)
  {
    -[UIButton titleRectForContentRect:](self, "titleRectForContentRect:", v6, v8, v10, v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if ((buttonVisualProviderFlags & 1) != 0)
    {
      if ((buttonVisualProviderFlags & 0x20) == 0)
      {
LABEL_10:
        UIRoundToViewScale(self);
        v35 = v34;
        UIRoundToViewScale(self);
        v30 = -v36;
        v31 = -v35;
        v26 = v16;
        v27 = v18;
        v28 = v20;
        v29 = v22;
        goto LABEL_12;
      }
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
        goto LABEL_10;
      v25 = (__int16)self->_buttonVisualProviderFlags;

      if ((v25 & 0x20) == 0)
        goto LABEL_10;
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "font");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pointSize");

    goto LABEL_10;
  }
  -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:", v6, v8, v10, v12);
  if (v4 == 5)
  {
    v30 = -4.0;
    v31 = -6.0;
  }
  else
  {
    v30 = -5.0;
    v31 = -8.0;
  }
LABEL_12:
  result = CGRectInset(*(CGRect *)&v26, v30, v31);
  v37 = result.size.height + 1.0;
  result.size.height = v37;
  return result;
}

- (id)_selectionIndicatorView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_externalDrawingStyleForState:(unint64_t)a3
{
  if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton", a3))
    return 2;
  else
    return 0;
}

- (id)_externalFocusedTitleColor
{
  return +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
}

- (id)_externalTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4
{
  void *v6;
  BOOL v7;

  if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton", a3))
  {
    if (-[UIButton canBecomeFocused](self, "canBecomeFocused") && !-[UIView isFocused](self, "isFocused"))
    {
      -[UIView tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
      if (!a4)
        return v6;
    }
    else
    {
      -[UIButton _externalFocusedTitleColor](self, "_externalFocusedTitleColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      if (!a4)
        return v6;
    }
    goto LABEL_7;
  }
  v7 = 0;
  v6 = 0;
  if (a4)
LABEL_7:
    *a4 = v7;
  return v6;
}

- (id)_externalUnfocusedBorderColor
{
  return +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
}

- (id)_externalBorderColorForState:(unint64_t)a3
{
  char v3;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;

  v3 = a3;
  if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
  {
    if (-[UIButton canBecomeFocused](self, "canBecomeFocused") && !-[UIView isFocused](self, "isFocused"))
    {
      -[UIButton _externalUnfocusedBorderColor](self, "_externalUnfocusedBorderColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView tintColor](self, "tintColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    if ((v3 & 2) != 0)
    {
      v7 = 1;
      if (!v6)
        return v6;
    }
    else
    {
      v7 = -[UIButton _isEffectivelyDisabledExternalButton](self, "_isEffectivelyDisabledExternalButton");
      if (!v6)
        return v6;
    }
    if (v7)
    {
      +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_externalImageColorForState:(unint64_t)a3
{
  void *v5;

  if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton"))
  {
    -[UIButton _externalTitleColorForState:isTintColor:](self, "_externalTitleColorForState:isTintColor:", a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)_externalFlatEdge
{
  return self->_externalFlatEdge;
}

- (void)_setExternalFlatEdge:(unint64_t)a3
{
  __int16 buttonVisualProviderFlags;
  void *v6;
  __int16 v7;
  id v8;

  self->_externalFlatEdge = a3;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x40) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExternalFlatEdge:", a3);

    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (__int16)self->_buttonVisualProviderFlags;

      if ((v7 & 0x40) != 0)
        goto LABEL_4;
    }
  }
}

- (id)_borderColorForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton")
    || (-[UIButton _externalBorderColorForState:](self, "_externalBorderColorForState:", a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    if ((a3 & 1) == 0)
    {
      if (-[UIButton _buttonType](self, "_buttonType") == 3)
      {
        v7 = 0.2;
        v8 = 1.0;
LABEL_9:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (-[UIButton _buttonType](self, "_buttonType") == 4)
      {
        v8 = 0.8;
        v7 = 1.0;
        goto LABEL_9;
      }
    }
    -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  -[UIButton _externalBorderColorForState:](self, "_externalBorderColorForState:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (BOOL)_isTitleFrozen
{
  return *((unsigned __int8 *)&self->_buttonFlags + 2) >> 7;
}

- (CGRect)_clippedHighlightBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v17;

  -[UIButton _highlightBounds](self, "_highlightBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView bounds](self, "bounds");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectIntersection(v15, v17);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  UIButton *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || !objc_msgSend(v4, "_isGestureType:", 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)setSpringLoaded:(BOOL)a3
{
  -[UIView _setSpringLoaded:interactionInitializer:](self, a3, &__block_literal_global_148);
}

UISpringLoadedInteraction *__28__UIButton_setSpringLoaded___block_invoke()
{
  return -[UISpringLoadedInteraction initWithActivationHandler:]([UISpringLoadedInteraction alloc], "initWithActivationHandler:", &__block_literal_global_335);
}

void __28__UIButton_setSpringLoaded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 64);

}

- (void)_setImageColor:(id)a3 forState:(unint64_t)a4
{
  if (-[UIButton _setContentValue:forField:state:](self, a3, CFSTR("imageColor"), a4))
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("imageColor"), a4);
}

- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state
{
  if (-[UIButton _setContentValue:forField:state:](self, color, CFSTR("shadowColor"), state))
    -[UIButton _markAndLayoutAsNeededForField:state:](self, CFSTR("shadowColor"), state);
}

- (void)_setSubtitle:(id)a3 forState:(unint64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2496, CFSTR("Set a subtitle on the configuration itself"));

}

- (void)_setAttributedSubtitle:(id)a3 forState:(unint64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2500, CFSTR("Set a subtitle on the configuration itself"));

}

- (id)_subtitleForState:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2533, CFSTR("This method currently does nothing. Come back later please."));

  return 0;
}

- (id)_attributedSubtitleForState:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2538, CFSTR("This method currently does nothing. Come back later please."));

  return 0;
}

- (UIColor)currentTitleColor
{
  return -[UIButton titleColorForState:](self, "titleColorForState:", -[UIControl state](self, "state"));
}

- (UIColor)_currentImageColor
{
  return (UIColor *)-[UIButton _imageColorForState:](self, "_imageColorForState:", -[UIControl state](self, "state"));
}

- (UIColor)currentTitleShadowColor
{
  return -[UIButton titleShadowColorForState:](self, "titleShadowColorForState:", -[UIControl state](self, "state"));
}

- (NSAttributedString)currentAttributedTitle
{
  return -[UIButton attributedTitleForState:](self, "attributedTitleForState:", -[UIControl state](self, "state"));
}

- (UIImageSymbolConfiguration)currentPreferredSymbolConfiguration
{
  return -[UIButton preferredSymbolConfigurationForImageInState:](self, "preferredSymbolConfigurationForImageInState:", -[UIControl state](self, "state"));
}

- (id)_currentImageWithResolvedConfiguration
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x40) != 0)
        goto LABEL_4;
    }
LABEL_6:
    v7 = 0;
    return v7;
  }
  if ((buttonVisualProviderFlags & 0x40) == 0)
    goto LABEL_6;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentImageWithResolvedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateBaselineInformationDependentOnBounds
{
  __int16 buttonVisualProviderFlags;
  void *v5;
  __int16 v6;
  void *v7;
  id v8;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButton.m"), 2668, CFSTR("Unexpected use of baseline-updating UIButton"));

    goto LABEL_7;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (__int16)self->_buttonVisualProviderFlags;

  if ((v6 & 4) == 0)
    goto LABEL_6;
LABEL_7:
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateBaselineInformationDependentOnBounds");

}

- (double)_firstBaselineOffsetFromTop
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  double v6;
  double v7;
  double result;
  objc_super v9;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      -[UIView bounds](self, "bounds");
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", v6, v7);
      return result;
    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0)
        goto LABEL_4;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  -[UIView _firstBaselineOffsetFromTop](&v9, sel__firstBaselineOffsetFromTop);
  return result;
}

- (id)_contentBackdropView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentBackdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_visualEffectViewEnabled
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 3) >> 4) & 1;
}

- (BOOL)_blurEnabled
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 3) >> 3) & 1;
}

- (void)_setBlurEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  __int16 buttonVisualProviderFlags;
  void *v7;
  __int16 v8;
  id v9;

  if (((((*(_QWORD *)&self->_buttonFlags & 0x8000000) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    v5 = 0x8000000;
    if (!a3)
      v5 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFF7FFFFFFLL | v5);
    buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if ((buttonVisualProviderFlags & 1) != 0)
    {
      if ((buttonVisualProviderFlags & 0x10) == 0)
        return;
    }
    else
    {
      -[UIButton _visualProvider](self, "_visualProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        return;
      v8 = (__int16)self->_buttonVisualProviderFlags;

      if ((v8 & 0x10) == 0)
        return;
    }
    -[UIButton _visualProvider](self, "_visualProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBlurEnabled:", v3);

  }
}

- (BOOL)_requiresLayoutForPropertyChange
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 3) >> 6) & 1;
}

- (id)_effectiveContentView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIView)_imageEffectContainerView
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageEffectContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)_alwaysHandleScrollerMouseEvent
{
  return (*((_BYTE *)&self->_buttonFlags + 2) & 0x40) != 0 && -[UIControl isEnabled](self, "isEnabled");
}

- (void)_setShouldHandleScrollerMouseEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setAutosizesToFit:(BOOL)a3
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_buttonFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    v3 = 8;
    if (!a3)
      v3 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFF7 | v3);
    if (a3)
      -[UIView sizeToFit](self, "sizeToFit");
  }
}

- (void)setDisabledDimsImage:(BOOL)a3
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_buttonFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    v3 = 16;
    if (!a3)
      v3 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFEFLL | v3);
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitle:(id)a3 forStates:(unint64_t)a4
{
  -[UIButton _setTitle:forStates:](self, "_setTitle:forStates:", a3, a4);
  if (-[UIButton autosizesToFit](self, "autosizesToFit"))
    -[UIView sizeToFit](self, "sizeToFit");
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleColor:(id)a3 forStates:(unint64_t)a4
{
  -[UIButton _setTitleColor:forStates:](self, "_setTitleColor:forStates:", a3, a4);
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleShadowColor:(id)a3 forStates:(unint64_t)a4
{
  -[UIButton _setShadowColor:forStates:](self, "_setShadowColor:forStates:", a3, a4);
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_resetLazyTitleViewFont
{
  UIFont *lazyTitleViewFont;

  lazyTitleViewFont = self->_lazyTitleViewFont;
  self->_lazyTitleViewFont = 0;

  self->_lazyTitleViewFontIsDefaultForIdiom = 0;
}

- (CGSize)_titleShadowOffset
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0)
        goto LABEL_4;
    }
LABEL_6:
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 0x20) == 0)
    goto LABEL_6;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleShadowOffset");
  v8 = v7;
  v10 = v9;

LABEL_7:
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_setTitleShadowOffset:(CGSize)a3
{
  double height;
  double width;
  __int16 buttonVisualProviderFlags;
  void *v7;
  __int16 v8;
  id v9;

  height = a3.height;
  width = a3.width;
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x20) != 0)
    {
LABEL_4:
      -[UIButton _visualProvider](self, "_visualProvider");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitleShadowOffset:", width, height);

    }
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (__int16)self->_buttonVisualProviderFlags;

      if ((v8 & 0x20) != 0)
        goto LABEL_4;
    }
  }
}

- (id)title
{
  return 0;
}

- (id)image
{
  return 0;
}

- (CGRect)_highlightBounds
{
  __int16 buttonVisualProviderFlags;
  void *v4;
  __int16 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x40) != 0)
        goto LABEL_4;
    }
LABEL_6:
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 0x40) == 0)
    goto LABEL_6;
LABEL_4:
  -[UIButton _visualProvider](self, "_visualProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highlightBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

LABEL_7:
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)_drawingStrokeForStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 1)
    result = 1.0;
  if (a3 == 2)
    return -1.0;
  return result;
}

- (int64_t)_drawingStyleForStroke:(double)a3
{
  double v3;
  int64_t v4;

  v3 = fabs(a3);
  v4 = 2;
  if (a3 >= 0.0)
    v4 = 1;
  if (v3 >= 2.22044605e-16)
    return v4;
  else
    return 0;
}

- (void)_setDrawingStyle:(int64_t)a3 forState:(unint64_t)a4
{
  -[UIButton _drawingStrokeForStyle:](self, "_drawingStrokeForStyle:", a3);
  -[UIButton _setDrawingStroke:forState:](self, "_setDrawingStroke:forState:", a4);
}

- (int64_t)_drawingStyleForState:(unint64_t)a3
{
  -[UIButton _drawingStrokeForState:](self, "_drawingStrokeForState:", a3);
  return -[UIButton _drawingStyleForStroke:](self, "_drawingStyleForStroke:");
}

- (void)_setDrawingStroke:(double)a3 forState:(unint64_t)a4
{
  void *v7;
  __int16 buttonVisualProviderFlags;
  void *v9;
  __int16 v10;
  void *v11;
  void *v12;
  id v13;

  if (fabs(a3) < 2.22044605e-16)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v7;
  -[UIButton _setContentValue:forField:state:](self, v7, CFSTR("drawingStroke"), a4);
  buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) != 0)
  {
    if ((buttonVisualProviderFlags & 0x40) == 0)
      goto LABEL_10;
LABEL_9:
    -[UIButton _visualProvider](self, "_visualProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDrawingStroke:forState:", a4, a3);

    goto LABEL_10;
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (__int16)self->_buttonVisualProviderFlags;

    if ((v10 & 0x40) != 0)
      goto LABEL_9;
  }
LABEL_10:
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
  if (-[UIControl state](self, "state") == a4)
  {
    -[UIView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }

}

- (double)_drawingStrokeForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[UIButton _contentForState:](self, "_contentForState:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingStroke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (-[UIButton _isCarPlaySystemTypeButton](self, "_isCarPlaySystemTypeButton")
      && -[UIButton _externalDrawingStyleForState:](self, "_externalDrawingStyleForState:", a3))
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      -[UIButton _drawingStrokeForStyle:](self, "_drawingStrokeForStyle:", -[UIButton _externalDrawingStyleForState:](self, "_externalDrawingStyleForState:", a3));
      objc_msgSend(v7, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIButton _contentForState:](self, "_contentForState:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "drawingStroke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  return v10;
}

- (BOOL)_isContentBackgroundHidden
{
  return (*((_BYTE *)&self->_buttonFlags + 3) & 0x10) == 0;
}

- (void)_setContentBackgroundHidden:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  v4 = !a3;
  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _setVisualEffectViewEnabled:backgroundColor:](self, "_setVisualEffectViewEnabled:backgroundColor:", v4, v5);

  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isOn
{
  void *v2;
  char v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOn");

  return v3;
}

- (void)_setOn:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (void)_setTitle:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("title"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setTitleColor:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("titleColor"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setImageColor:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("imageColor"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setShadowColor:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("shadowColor"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setAttributedTitle:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, CFSTR("attributedTitle"), a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (id)_allButtonContent
{
  return (id)-[NSMutableDictionary copy](self->_contentLookup, "copy");
}

- (id)_archivableContent:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  char v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  NSMutableDictionary *obj;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = (void *)objc_opt_class();
  v7 = (*(_QWORD *)&self->_buttonFlags >> 6);
  objc_msgSend((id)objc_opt_class(), "_defaultSymbolConfigurationForType:andState:compact:idiom:", v7, 0, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_defaultImageForType:andState:withConfiguration:", v7, 0, v8);
  v43[0] = objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  v10 = (*(_QWORD *)&self->_buttonFlags >> 6);
  objc_msgSend((id)objc_opt_class(), "_defaultSymbolConfigurationForType:andState:compact:idiom:", v10, 1, 0, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_defaultImageForType:andState:withConfiguration:", v10, 1, v11);
  v43[1] = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = self->_contentLookup;
  v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v37 = v13;
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "unsignedIntegerValue");
        v36 = v14;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_contentLookup, "objectForKeyedSubscript:", v14);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v18 = 1;
        do
        {
          v19 = v18;
          v20 = (void *)v43[v17];
          if (v20)
            v21 = v15 == *((_QWORD *)&xmmword_1866794A0 + v17);
          else
            v21 = 0;
          if (v21)
          {
            v22 = v12;
            v23 = v22;
            if (v16 && v20 != v16)
            {
              objc_msgSend(v22, "objectForKey:", CFSTR("image"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKey:", CFSTR("image"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v25)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v26 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("image"));
                v24 = (void *)v26;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v27);

            }
          }
          v18 = 0;
          v17 = 1;
        }
        while ((v19 & 1) != 0);
        objc_msgSend(v33, "setObject:forKey:", v35, v36);

        v13 = v37 + 1;
      }
      while (v37 + 1 != v34);
      v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v34);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v12);

  for (i = 1; i != -1; --i)
  return v33;
}

- (void)_takeContentFromArchivableContent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton _setContent:forState:](self, "_setContent:forState:", v10, objc_msgSend(v9, "integerValue"));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_applyCarPlaySystemButtonCustomizations
{
  void *v3;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _setFont:](self, "_setFont:", v3);

  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (CGRect)_visualBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualBoundsWithCornerRadius:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_pointerEffectPreviewParameters
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointerEffectPreviewParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_pointerEffectWithPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointerEffectWithPreview:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_pointerEffect
{
  void *v3;
  UITargetedPreview *v4;
  void *v5;

  -[UIButton _pointerEffectPreviewParameters](self, "_pointerEffectPreviewParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", self, v3);
  -[UIButton _pointerEffectWithPreview:](self, "_pointerEffectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_shapeInContainer:(id)a3
{
  return -[UIButton _shapeInContainer:proposal:](self, "_shapeInContainer:proposal:", a3, 0);
}

- (id)_shapeInContainer:(id)a3 proposal:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointerShapeInContainer:proposal:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_selectorOverridden:(SEL)a3
{
  uint64_t v4;

  v4 = -[UIButton methodForSelector:](self, "methodForSelector:");
  return v4 != +[UIButton instanceMethodForSelector:](UIButton, "instanceMethodForSelector:", a3);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a3;
  -[UIControl _pointerInteraction](self, "_pointerInteraction");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    if (-[UIControl isSelected](self, "isSelected"))
    {
      v11 = v7;
    }
    else
    {
      objc_msgSend(v7, "rect");
      +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", CFSTR("com.apple.UIKit.UIButton.selectedRegion"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v11;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void (**pointerStyleProvider)(id, UIButton *, void *, id);
  void *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  -[UIControl _pointerInteraction](self, "_pointerInteraction");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[UIControl _safeHoverStyle](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25.receiver = self;
    v25.super_class = (Class)UIButton;
    -[UIControl pointerInteraction:styleForRegion:](&v25, sel_pointerInteraction_styleForRegion_, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_msgSend(v11, "pointerEffect"), (v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v13 = (void *)v12,
          objc_msgSend(v10, "shape"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      v9 = v11;
    }
    else
    {
      objc_msgSend(v11, "pointerEffect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v11, "pointerShape");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }

      if (v15)
      {
        v18 = v15;
      }
      else
      {
        -[UIButton _pointerEffect](self, "_pointerEffect");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;
      if (v17)
      {
        v20 = v17;
      }
      else
      {
        -[UIView superview](self, "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton _shapeInContainer:](self, "_shapeInContainer:", v21);
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      pointerStyleProvider = (void (**)(id, UIButton *, void *, id))self->_pointerStyleProvider;
      if (pointerStyleProvider)
        pointerStyleProvider[2](pointerStyleProvider, self, v19, v20);
      else
        +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v23;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__UIButton_pointerInteraction_willEnterRegion_animator___block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  v6 = a5;
  objc_msgSend(v6, "addAnimations:", v8);
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerWillEnter:", v6);

}

uint64_t __56__UIButton_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHovered:", 1);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UIButton_pointerInteraction_willExitRegion_animator___block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  v6 = a5;
  objc_msgSend(v6, "addAnimations:", v8);
  -[UIButton _visualProvider](self, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerWillExit:", v6);

}

uint64_t __55__UIButton_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHovered:", 0);
}

- (id)_preferredHoverEffect
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHoverEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_preferredHoverShape
{
  void *v2;
  void *v3;

  -[UIButton _visualProvider](self, "_visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHoverShape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isToggleButton
{
  if ((*((_BYTE *)&self->_buttonFlags + 4) & 0x20) == 0)
    return 0;
  if (self->_menu)
    return !-[UIControl showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction");
  return 1;
}

- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](self, "setTitle:forState:", v7, 0);

  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenu:", v6);

}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  if (-[UIButton _isToggleButton](self, "_isToggleButton")
    && (-[UIButton _controlEventsForActionTriggered](self, "_controlEventsForActionTriggered") & a3) != 0)
  {
    -[UIButton setSelected:](self, "setSelected:", -[UIControl isSelected](self, "isSelected") ^ 1);
  }
  v7.receiver = self;
  v7.super_class = (Class)UIButton;
  -[UIControl _sendActionsForEvents:withEvent:](&v7, sel__sendActionsForEvents_withEvent_, a3, v6);

}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuAttachmentPointForConfiguration:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[UIButton _visualProvider](self, "_visualProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextMenuInteraction:configurationForMenuAtLocation:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPreferredMenuElementOrder:", -[UIButton preferredMenuElementOrder](self, "preferredMenuElementOrder"));
  objc_msgSend(v9, "setPrefersHorizontalAttachment:", -[UIButton prefersHorizontalMenuAttachment](self, "prefersHorizontalMenuAttachment"));
  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIButton;
  v6 = a4;
  v7 = a3;
  -[UIControl _contextMenuInteraction:styleForMenuWithConfiguration:](&v11, sel__contextMenuInteraction_styleForMenuWithConfiguration_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _visualProvider](self, "_visualProvider", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextMenuInteraction:updateStyleForMenuWithConfiguration:style:", v7, v6, v8);

  return v8;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[UIControl _contextMenuInteraction](self, "_contextMenuInteraction");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextMenuInteraction:previewForHighlightingMenuWithConfiguration:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIButton;
    -[UIControl contextMenuInteraction:previewForHighlightingMenuWithConfiguration:](&v12, sel_contextMenuInteraction_previewForHighlightingMenuWithConfiguration_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[UIControl _contextMenuInteraction](self, "_contextMenuInteraction");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextMenuInteraction:previewForDismissingMenuWithConfiguration:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIButton;
    -[UIControl contextMenuInteraction:previewForDismissingMenuWithConfiguration:](&v12, sel_contextMenuInteraction_previewForDismissingMenuWithConfiguration_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_configurationUpdateHandler
{
  void *v2;
  _QWORD aBlock[5];

  if (self->_configurationUpdateHandler)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__UIButton__configurationUpdateHandler__block_invoke;
    aBlock[3] = &unk_1E16C2DC0;
    aBlock[4] = self;
    v2 = _Block_copy(aBlock);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __39__UIButton__configurationUpdateHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 664) + 16))();
}

- (void)_setConfigurationUpdateHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__UIButton__setConfigurationUpdateHandler___block_invoke;
  v6[3] = &unk_1E16C2DE8;
  v7 = v4;
  v5 = v4;
  -[UIButton setConfigurationUpdateHandler:](self, "setConfigurationUpdateHandler:", v6);

}

void __43__UIButton__setConfigurationUpdateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "_configurationState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

}

- (void)setAutomaticallyUpdatesConfiguration:(BOOL)automaticallyUpdatesConfiguration
{
  $1CF1FC38577B636919C637EEED589224 buttonFlags;
  uint64_t v4;

  buttonFlags = self->_buttonFlags;
  if (((((*(_QWORD *)&buttonFlags & 0x1000000000) == 0) ^ automaticallyUpdatesConfiguration) & 1) == 0)
  {
    v4 = 0x1000000000;
    if (!automaticallyUpdatesConfiguration)
      v4 = 0;
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(_QWORD *)&buttonFlags & 0xFFFFFFEFFFFFFFFFLL | v4);
    if (automaticallyUpdatesConfiguration)
      -[UIButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (_UIButtonConfiguration)_configuration
{
  return (_UIButtonConfiguration *)-[_UIButtonConfigurationShim _spiValue](self->_configuration, "_spiValue");
}

- (id)_titleOrImageViewForBaselineLayout
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Use -[UIButton viewForBaselineLayout], -[UIButton viewForFirstBaselineLayout], or -[UIButton viewForLastBaselineLayout] instead of calling IPI", buf, 2u);
    }

  }
  else
  {
    v3 = _titleOrImageViewForBaselineLayout___s_category;
    if (!_titleOrImageViewForBaselineLayout___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_titleOrImageViewForBaselineLayout___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Use -[UIButton viewForBaselineLayout], -[UIButton viewForFirstBaselineLayout], or -[UIButton viewForLastBaselineLayout] instead of calling IPI", v9, 2u);
    }
  }
  -[UIButton _visualProvider](self, "_visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForFirstBaselineLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIEdgeInsets)_internalTitlePaddingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_internalTitlePaddingInsets.top;
  left = self->_internalTitlePaddingInsets.left;
  bottom = self->_internalTitlePaddingInsets.bottom;
  right = self->_internalTitlePaddingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSISEngine)_activeSizeToFitLayoutEngine
{
  return (NSISEngine *)objc_loadWeakRetained((id *)&self->_activeSizeToFitLayoutEngine);
}

- (id)_menuProvider
{
  return self->_menuProvider;
}

- (UIButtonPointerStyleProvider)pointerStyleProvider
{
  return self->_pointerStyleProvider;
}

- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (UIColor)_plainButtonBackgroundColor
{
  return self->__plainButtonBackgroundColor;
}

- (void)_setPlainButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->__plainButtonBackgroundColor, a3);
}

- (BOOL)prefersHorizontalMenuAttachment
{
  return self->_prefersHorizontalMenuAttachment;
}

- (void)setPrefersHorizontalMenuAttachment:(BOOL)a3
{
  self->_prefersHorizontalMenuAttachment = a3;
}

- (double)_scaleFactorForImage
{
  void *v2;
  double v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(v2);

  return v3;
}

- (double)_additionalBaselineSpacingForEdge:(int)a3
{
  double result;
  double v4;

  result = 0.0;
  if ((*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
  {
    if (a3 == 6)
    {
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      return v4;
    }
    else if (a3 == 5)
    {
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    }
  }
  return result;
}

- (BOOL)_calloutBar_shouldHideTitleLabel
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIButton isSecurePasteButton](self, "isSecurePasteButton");
  else
    return 0;
}

- (void)_uikit_applyValueFromTraitStorage:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSString *v26;
  const char *v27;
  void *v28;
  void *v29;
  UIButton *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ECD7E980 != -1)
    dispatch_once(&qword_1ECD7E980, &__block_literal_global_300);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = &qword_1ECD7E000;
  v9 = (id)qword_1ECD7E978;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v10)
  {

    v33 = 0;
    v29 = 0;
LABEL_18:
    v35.receiver = self;
    v35.super_class = (Class)UIButton;
    -[NSObject _uikit_applyValueFromTraitStorage:forKeyPath:](&v35, sel__uikit_applyValueFromTraitStorage_forKeyPath_, v6, v7);
    v28 = 0;
    goto LABEL_19;
  }
  v11 = v10;
  v30 = self;
  v31 = v6;
  v32 = 0;
  v33 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v37;
  do
  {
    v14 = 0;
    v34 = v11;
    do
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
      objc_msgSend((id)v8[303], "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasPrefix:", v16))
      {
        v17 = v9;
        v18 = v8;
        v19 = v7;
        objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v16, "length"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)qword_1ECD7E970, "containsObject:", v20))
        {
          v21 = v20;

          v22 = v16;
          v23 = v12;
          v12 = v22;

          v24 = v15;
          v32 = v24;
          v33 = v21;
        }

        v8 = v18;
        v9 = v17;
        v7 = v19;
        v11 = v34;
      }

      ++v14;
    }
    while (v11 != v14);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v11);

  if (!v12)
  {
    self = v30;
    v6 = v31;
    v29 = v32;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set%@:forState:"), v33);
  v25 = v12;
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  v27 = NSSelectorFromString(v26);

  v28 = v25;
  v29 = v32;
  v6 = v31;
  objc_msgSend(v30, v27, v31, objc_msgSend(v32, "unsignedIntegerValue"));
LABEL_19:

}

void __70__UIButton_UIIBPrivate___uikit_applyValueFromTraitStorage_forKeyPath___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Title"), CFSTR("AttributedTitle"), CFSTR("TitleColor"), CFSTR("TitleShadowColor"), CFSTR("Image"), CFSTR("BackgroundImage"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E970;
  qword_1ECD7E970 = v0;

  v4[0] = &unk_1E1A97F50;
  v4[1] = &unk_1E1A97F68;
  v5[0] = CFSTR("normal");
  v5[1] = CFSTR("highlighted");
  v4[2] = &unk_1E1A97F80;
  v4[3] = &unk_1E1A97F98;
  v5[2] = CFSTR("disabled");
  v5[3] = CFSTR("selected");
  v4[4] = &unk_1E1A97FB0;
  v5[4] = CFSTR("focused");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7E978;
  qword_1ECD7E978 = v2;

}

- (id)largeContentImage
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  objc_super v8;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetLargeContentImage");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIButton;
    -[UIView largeContentImage](&v8, sel_largeContentImage);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIButton imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (BOOL)scalesLargeContentImage
{
  void *v3;
  int v4;
  objc_super v6;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetScalesLargeContentImage");

  if (!v4)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  return -[UIView scalesLargeContentImage](&v6, sel_scalesLargeContentImage);
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xDF | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 5) & 1;
}

+ (double)_defaultNeighborSpacingForAxis:(int64_t)a3
{
  return 8.0;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 0;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  uint64_t v6;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v6 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)UIButton;
  -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v12, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, a6);
  v9 = v8;
  -[UIButton _additionalBaselineSpacingForEdge:](self, "_additionalBaselineSpacingForEdge:", v6);
  return v9 + v10;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(id)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v8;
  uint64_t v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)UIButton;
  -[UIView _autolayoutSpacingAtEdge:forAttribute:nextToNeighbor:edge:attribute:multiplier:](&v18, sel__autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier_, *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7, a8);
  v13 = v12;
  -[UIButton _additionalBaselineSpacingForEdge:](self, "_additionalBaselineSpacingForEdge:", v10);
  v15 = v13 + v14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a5, "_additionalBaselineSpacingForEdge:", v8);
    return v15 + v16;
  }
  return v15;
}

@end
