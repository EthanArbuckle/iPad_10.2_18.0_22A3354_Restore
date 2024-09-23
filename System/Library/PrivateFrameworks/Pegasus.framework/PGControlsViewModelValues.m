@implementation PGControlsViewModelValues

+ (id)defaultPrerollTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.517647059, 0.752941176, 0.996078431, 1.0);
}

- (NSString)restoreButtonAccessibilityIdentifier
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("restoreButtonAccessibilityIdentifier"));
}

- (NSString)cancelButtonAccessibilityIdentifier
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("cancelButtonAccessibilityIdentifier"));
}

- (NSString)actionButtonAccessibilityIdentifier
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("actionButtonAccessibilityIdentifier"));
}

- (NSString)skipBackButtonAccessibilityIdentifier
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipBackButtonAccessibilityIdentifier"));
}

- (NSString)skipForwardButtonAccessibilityIdentifier
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipForwardButtonAccessibilityIdentifier"));
}

- (PGPlaybackStatePrerollAttributes)prerollAttributes
{
  return (PGPlaybackStatePrerollAttributes *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("prerollAttributes"));
}

- (NSString)actionButtonSystemImageName
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("actionButtonSystemImageName"));
}

- (NSString)cancelButtonSystemImageName
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("cancelButtonSystemImageName"));
}

- (UIColor)actionButtonImageTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("actionButtonImageTintColor"));
}

- (UIColor)actionButtonBackgroundTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("actionButtonBackgroundTintColor"));
}

- (UIColor)skipBackButtonImageTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipBackButtonImageTintColor"));
}

- (UIColor)skipBackButtonBackgroundTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipBackButtonBackgroundTintColor"));
}

- (UIColor)skipForwardButtonImageTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipForwardButtonImageTintColor"));
}

- (UIColor)skipForwardButtonBackgroundTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipForwardButtonBackgroundTintColor"));
}

- (UIColor)cancelButtonImageTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("cancelButtonImageTintColor"));
}

- (UIColor)cancelButtonBackgroundTintColor
{
  return (UIColor *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("cancelButtonBackgroundTintColor"));
}

- (NSString)skipBackButtonSystemImageName
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipBackButtonSystemImageName"));
}

- (NSString)skipForwardButtonSystemImageName
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("skipForwardButtonSystemImageName"));
}

- (UIImage)cancelButtonCustomImage
{
  return (UIImage *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("cancelButtonCustomImage"));
}

- (NSString)cancelButtonCustomText
{
  return (NSString *)-[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", CFSTR("cancelButtonCustomText"));
}

- (BOOL)cancelButtonWantsBackground
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("cancelButtonWantsBackground"));
}

- (BOOL)restoreButtonWantsBackground
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("restoreButtonWantsBackground"));
}

- (BOOL)actionButtonsWantBackground
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("actionButtonsWantBackground"));
}

- (BOOL)includesRestoreButton
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesRestoreButton"));
}

- (BOOL)includesContentLoadingIndicator
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesContentLoadingIndicator"));
}

- (BOOL)includesWaitingToPlayIndicator
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesWaitingToPlayIndicator"));
}

- (BOOL)includesCancelButton
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesCancelButton"));
}

- (BOOL)includesActionButton
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesActionButton"));
}

- (BOOL)includesSkipBackButton
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesSkipBackButton"));
}

- (BOOL)includesSkipForwardButton
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesSkipForwardButton"));
}

- (BOOL)includesLiveIndicatorBadge
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesLiveIndicatorBadge"));
}

- (BOOL)includesProgressBar
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesProgressBar"));
}

- (BOOL)isSkipBackButtonEnabled
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("isSkipBackButtonEnabled"));
}

- (BOOL)isActionButtonEnabled
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("isActionButtonEnabled"));
}

- (BOOL)isSkipForwardButtonEnabled
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("isSkipForwardButtonEnabled"));
}

- (BOOL)includesSingleTapGestureRecognizer
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesSingleTapGestureRecognizer"));
}

- (BOOL)includesDoubleTapGestureRecognizer
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesDoubleTapGestureRecognizer"));
}

- (BOOL)includesDoubleDoubleTapGestureRecognizer
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("includesDoubleDoubleTapGestureRecognizer"));
}

- (BOOL)progressBarShouldUpdate
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("progressBarShouldUpdate"));
}

- (BOOL)controlsShouldAutoHide
{
  return -[PGControlsViewModelValues _BOOLForKey:](self, "_BOOLForKey:", CFSTR("controlsShouldAutoHide"));
}

- (PGControlsViewModelValues)init
{
  return -[PGControlsViewModelValues initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", 0);
}

- (PGControlsViewModelValues)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  PGControlsViewModelValues *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *dictionaryRepresentation;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGControlsViewModelValues;
  v5 = -[PGControlsViewModelValues init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PGControlsViewModelValues dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionaryRepresentation:", v5);

  return v6;
}

- (NSString)restoreButtonSystemImageName
{
  return (NSString *)CFSTR("pip.exit");
}

- (BOOL)isPrerollActive
{
  void *v2;
  BOOL v3;

  -[PGControlsViewModelValues prerollAttributes](self, "prerollAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIColor)prerollTintColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (-[PGControlsViewModelValues isPrerollActive](self, "isPrerollActive"))
  {
    -[PGControlsViewModelValues prerollAttributes](self, "prerollAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultPrerollTintColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return (UIColor *)v7;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = (unint64_t)a3;
  v6 = a4;
  -[PGControlsViewModelValues dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v10 | v8 && (objc_msgSend((id)v8, "isEqual:", v10) & 1) == 0)
  {
    -[PGControlsViewModelValues dictionaryRepresentation](self, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v6);

  }
}

- (BOOL)_BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)_integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[PGControlsViewModelValues _objectForKey:](self, "_objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)_objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGControlsViewModelValues dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[PGControlsViewModelValues dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v6;
}

- (NSMutableDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
