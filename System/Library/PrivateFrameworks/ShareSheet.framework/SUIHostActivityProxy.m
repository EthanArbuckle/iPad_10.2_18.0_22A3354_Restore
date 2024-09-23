@implementation SUIHostActivityProxy

+ (id)activitiesForConfigurations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = +[SUIHostActivityProxy newWithActivityConfiguration:](SUIHostActivityProxy, "newWithActivityConfiguration:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)newWithActivityConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    if (!v6)
      v7 = (void *)objc_opt_class();
    v8 = objc_msgSend(v7, "activityCategory");

  }
  else
  {
    v8 = objc_msgSend(v4, "activityCategory");
  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "activityProxyClassForActivityCategory:", v8)), "initWithAttributesFromActivityConfiguration:", v4);

  return v9;
}

+ (Class)activityProxyClassForActivityCategory:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

- (SUIHostActivityProxy)initWithAttributesFromActivityConfiguration:(id)a3
{
  UIActivity *v5;
  SUIHostActivityProxy *v6;
  SUIHostActivityProxy *v7;
  uint64_t v8;
  UIActivity *activity;
  uint64_t v10;
  NSUUID *hostActivityUUID;
  UIActivity *v12;
  void *v13;
  void *v14;
  UIActivity *v15;
  uint64_t v16;
  UIActivity *v17;
  void *v18;
  UIActivity *v19;
  CGFloat v20;
  CGFloat v21;
  UIActivity *v22;
  char v23;
  UIActivity *v24;
  void *v25;
  uint64_t v26;
  NSString *overrideActivityTitle;
  uint64_t v28;
  NSString *activityTitle;
  uint64_t v30;
  UIImage *activityImage;
  uint64_t v32;
  UIImage *activitySettingsImage;
  uint64_t v34;
  UIImage *actionImage;
  uint64_t v36;
  NSString *systemImageName;
  uint64_t v38;
  NSAttributedString *activityFooterText;
  uint64_t v40;
  UIImage *activityStatusImage;
  uint64_t v42;
  UIColor *activityStatusTintColor;
  objc_super v45;

  v5 = (UIActivity *)a3;
  v45.receiver = self;
  v45.super_class = (Class)SUIHostActivityProxy;
  v6 = -[UIActivity init](&v45, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityConfiguration, a3);
    -[UIActivity activity](v5, "activity");
    v8 = objc_claimAutoreleasedReturnValue();
    activity = v7->_activity;
    v7->_activity = (UIActivity *)v8;

    -[UIActivity activityUUID](v5, "activityUUID");
    v10 = objc_claimAutoreleasedReturnValue();
    hostActivityUUID = v7->_hostActivityUUID;
    v7->_hostActivityUUID = (NSUUID *)v10;

    v7->_appIsDocumentTypeOwner = -[UIActivity appIsDocumentTypeOwner](v5, "appIsDocumentTypeOwner");
    v12 = v7->_activity;
    if (!v12)
      v12 = v5;
    -[UIActivity activityType](v12, "activityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_activityType, v13);

    if (v7->_activity)
      objc_msgSend((id)objc_opt_class(), "_defaultFallbackActivityType");
    else
      -[UIActivity fallbackActivityType](v5, "fallbackActivityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_fallbackActivityType, v14);

    v15 = v7->_activity;
    if (v15)
      v16 = -[UIActivity _defaultSortGroup](v15, "_defaultSortGroup");
    else
      v16 = -[UIActivity defaultSortGroup](v5, "defaultSortGroup");
    v7->_defaultSortGroup = v16;
    v17 = v7->_activity;
    if (v17)
      -[UIActivity _beforeActivity](v17, "_beforeActivity");
    else
      -[UIActivity positionBeforeActivityType](v5, "positionBeforeActivityType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_positionBeforeActivityType, v18);

    v19 = v7->_activity;
    if (v19)
      -[UIActivity _thumbnailSize](v19, "_thumbnailSize");
    else
      -[UIActivity preferredThumbnailSize](v5, "preferredThumbnailSize");
    v7->_preferredThumbnailSize.width = v20;
    v7->_preferredThumbnailSize.height = v21;
    v22 = v7->_activity;
    if (v22)
      v23 = -[UIActivity _activitySupportsPromiseURLs](v22, "_activitySupportsPromiseURLs");
    else
      v23 = -[UIActivity activitySupportsPromiseURLs](v5, "activitySupportsPromiseURLs");
    v7->_activitySupportsPromiseURLs = v23;
    v24 = v7->_activity;
    if (!v24)
      v24 = v5;
    -[UIActivity setIndexInApplicationDefinedActivities:](v7, "setIndexInApplicationDefinedActivities:", -[UIActivity indexInApplicationDefinedActivities](v24, "indexInApplicationDefinedActivities"));
    -[UIActivity overrideTitle](v5, "overrideTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    overrideActivityTitle = v7->_overrideActivityTitle;
    v7->_overrideActivityTitle = (NSString *)v26;

    v7->_wantsOriginalImageColor = -[UIActivity wantsOriginalImageColor](v5, "wantsOriginalImageColor");
    v7->_isBuiltinDerived = -[UIActivity isBuiltinDerived](v5, "isBuiltinDerived");
    v7->_showsInSystemActionGroup = -[UIActivity showsInSystemActionGroup](v5, "showsInSystemActionGroup");
    -[UIActivity activityTitle](v5, "activityTitle");
    v28 = objc_claimAutoreleasedReturnValue();
    activityTitle = v7->_activityTitle;
    v7->_activityTitle = (NSString *)v28;

    -[UIActivity activityImage](v5, "activityImage");
    v30 = objc_claimAutoreleasedReturnValue();
    activityImage = v7->_activityImage;
    v7->_activityImage = (UIImage *)v30;

    -[UIActivity activitySettingsImage](v5, "activitySettingsImage");
    v32 = objc_claimAutoreleasedReturnValue();
    activitySettingsImage = v7->_activitySettingsImage;
    v7->_activitySettingsImage = (UIImage *)v32;

    -[UIActivity actionImage](v5, "actionImage");
    v34 = objc_claimAutoreleasedReturnValue();
    actionImage = v7->_actionImage;
    v7->_actionImage = (UIImage *)v34;

    -[UIActivity systemImageName](v5, "systemImageName");
    v36 = objc_claimAutoreleasedReturnValue();
    systemImageName = v7->_systemImageName;
    v7->_systemImageName = (NSString *)v36;

    -[UIActivity _activityFooterText](v5, "_activityFooterText");
    v38 = objc_claimAutoreleasedReturnValue();
    activityFooterText = v7->_activityFooterText;
    v7->_activityFooterText = (NSAttributedString *)v38;

    -[UIActivity activityStatusImage](v5, "activityStatusImage");
    v40 = objc_claimAutoreleasedReturnValue();
    activityStatusImage = v7->_activityStatusImage;
    v7->_activityStatusImage = (UIImage *)v40;

    -[UIActivity activityStatusTintColor](v5, "activityStatusTintColor");
    v42 = objc_claimAutoreleasedReturnValue();
    activityStatusTintColor = v7->_activityStatusTintColor;
    v7->_activityStatusTintColor = (UIColor *)v42;

  }
  return v7;
}

- (NSUUID)activityUUID
{
  return self->_hostActivityUUID;
}

- (id)_activityTypeUsingFallbackActivityTypeIfNecessary
{
  NSString *activityType;

  activityType = self->_activityType;
  if (!activityType)
    activityType = self->_fallbackActivityType;
  return activityType;
}

- (id)_beforeActivity
{
  return self->_positionBeforeActivityType;
}

- (CGSize)_thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredThumbnailSize.width;
  height = self->_preferredThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (int64_t)_defaultSortGroup
{
  return self->_defaultSortGroup;
}

- (BOOL)_appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (BOOL)_isDisabled
{
  return -[UISUIActivityConfiguration isDisabled](self->_activityConfiguration, "isDisabled");
}

- (NSString)activityTitle
{
  NSString *v3;
  void *v4;
  void *v5;

  -[SUIHostActivityProxy overrideActivityTitle](self, "overrideActivityTitle");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[SUIHostActivityProxy activity](self, "activity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityTitle");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = self->_activityTitle;
    }

  }
  return v3;
}

- (id)_activityFooterText
{
  void *v3;
  void *v4;
  void *v5;
  NSAttributedString *v6;
  void *v7;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = self->_activityFooterText;
    }
    else
    {
      -[SUIHostActivityProxy activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_activityFooterText");
      v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = self->_activityFooterText;
  }

  return v6;
}

- (BOOL)_wantsOriginalImageColor
{
  void *v3;
  void *v4;
  void *v5;
  int wantsOriginalImageColor;
  void *v7;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      wantsOriginalImageColor = self->_wantsOriginalImageColor;
    }
    else
    {
      -[SUIHostActivityProxy activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      wantsOriginalImageColor = objc_msgSend(v7, "_wantsOriginalImageColor");

    }
  }
  else
  {
    wantsOriginalImageColor = self->_wantsOriginalImageColor;
  }

  return wantsOriginalImageColor != 0;
}

- (BOOL)_isBuiltinDerived
{
  void *v3;
  void *v4;
  void *v5;
  int isBuiltinDerived;
  void *v7;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      isBuiltinDerived = self->_isBuiltinDerived;
    }
    else
    {
      -[SUIHostActivityProxy activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isBuiltinDerived = objc_msgSend(v7, "_isBuiltinDerived");

    }
  }
  else
  {
    isBuiltinDerived = self->_isBuiltinDerived;
  }

  return isBuiltinDerived != 0;
}

- (BOOL)_showsInSystemActionGroup
{
  void *v3;
  void *v4;
  void *v5;
  int showsInSystemActionGroup;
  void *v7;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      showsInSystemActionGroup = self->_showsInSystemActionGroup;
    }
    else
    {
      -[SUIHostActivityProxy activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      showsInSystemActionGroup = objc_msgSend(v7, "_showsInSystemActionGroup");

    }
  }
  else
  {
    showsInSystemActionGroup = self->_showsInSystemActionGroup;
  }

  return showsInSystemActionGroup != 0;
}

- (id)_activityStatusTintColor
{
  void *v3;
  void *v4;
  void *v5;
  UIColor *v6;
  void *v7;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = self->_activityStatusTintColor;
    }
    else
    {
      -[SUIHostActivityProxy activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_activityStatusTintColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = self->_activityStatusTintColor;
  }

  return v6;
}

- (UIImage)activityImage
{
  void *v3;
  void *v4;
  UIImage *v5;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_activityImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_activityImage;
  }

  return v5;
}

- (id)_actionImage
{
  void *v3;
  void *v4;
  UIImage *v5;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_actionImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_actionImage;
  }

  return v5;
}

- (id)_systemImageName
{
  void *v3;
  void *v4;
  NSString *v5;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_systemImageName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_systemImageName;
  }

  return v5;
}

- (id)_activitySettingsImage
{
  void *v3;
  void *v4;
  UIImage *v5;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_activitySettingsImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_activitySettingsImage;
  }

  return v5;
}

- (id)_activityStatusImage
{
  void *v3;
  void *v4;
  UIImage *v5;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_activityStatusImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_activityStatusImage;
  }

  return v5;
}

- (id)_activityImage
{
  void *v3;
  void *v4;
  UIImage *v5;

  -[SUIHostActivityProxy activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUIHostActivityProxy activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_activityImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_activityImage;
  }

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SUIHostActivityProxy;
  -[UIActivity description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIHostActivityProxy _activityTypeUsingFallbackActivityTypeIfNecessary](self, "_activityTypeUsingFallbackActivityTypeIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIHostActivityProxy activityTitle](self, "activityTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {type = %@, title = %@}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setActivityTitle:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitle, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (void)setActivityImage:(id)a3
{
  objc_storeStrong((id *)&self->_activityImage, a3);
}

- (UIImage)activitySettingsImage
{
  return self->_activitySettingsImage;
}

- (void)setActivitySettingsImage:(id)a3
{
  objc_storeStrong((id *)&self->_activitySettingsImage, a3);
}

- (UISUIActivityConfiguration)activityConfiguration
{
  return self->_activityConfiguration;
}

- (void)setActivityConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activityConfiguration, a3);
}

- (NSUUID)hostActivityUUID
{
  return self->_hostActivityUUID;
}

- (void)setHostActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_hostActivityUUID, a3);
}

- (NSString)overrideActivityTitle
{
  return self->_overrideActivityTitle;
}

- (void)setOverrideActivityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)fallbackActivityType
{
  return self->_fallbackActivityType;
}

- (void)setFallbackActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackActivityType, a3);
}

- (CGSize)preferredThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredThumbnailSize.width;
  height = self->_preferredThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredThumbnailSize:(CGSize)a3
{
  self->_preferredThumbnailSize = a3;
}

- (NSString)positionBeforeActivityType
{
  return self->_positionBeforeActivityType;
}

- (void)setPositionBeforeActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_positionBeforeActivityType, a3);
}

- (BOOL)activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (void)setActivitySupportsPromiseURLs:(BOOL)a3
{
  self->_activitySupportsPromiseURLs = a3;
}

- (int64_t)defaultSortGroup
{
  return self->_defaultSortGroup;
}

- (void)setDefaultSortGroup:(int64_t)a3
{
  self->_defaultSortGroup = a3;
}

- (BOOL)appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (void)setAppIsDocumentTypeOwner:(BOOL)a3
{
  self->_appIsDocumentTypeOwner = a3;
}

- (BOOL)wantsOriginalImageColor
{
  return self->_wantsOriginalImageColor;
}

- (void)setWantsOriginalImageColor:(BOOL)a3
{
  self->_wantsOriginalImageColor = a3;
}

- (BOOL)isBuiltinDerived
{
  return self->_isBuiltinDerived;
}

- (void)setIsBuiltinDerived:(BOOL)a3
{
  self->_isBuiltinDerived = a3;
}

- (BOOL)showsInSystemActionGroup
{
  return self->_showsInSystemActionGroup;
}

- (void)setShowsInSystemActionGroup:(BOOL)a3
{
  self->_showsInSystemActionGroup = a3;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (void)setActionImage:(id)a3
{
  objc_storeStrong((id *)&self->_actionImage, a3);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);
}

- (NSAttributedString)activityFooterText
{
  return self->_activityFooterText;
}

- (void)setActivityFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_activityFooterText, a3);
}

- (UIImage)activityStatusImage
{
  return self->_activityStatusImage;
}

- (void)setActivityStatusImage:(id)a3
{
  objc_storeStrong((id *)&self->_activityStatusImage, a3);
}

- (UIColor)activityStatusTintColor
{
  return self->_activityStatusTintColor;
}

- (void)setActivityStatusTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_activityStatusTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStatusTintColor, 0);
  objc_storeStrong((id *)&self->_activityStatusImage, 0);
  objc_storeStrong((id *)&self->_activityFooterText, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_positionBeforeActivityType, 0);
  objc_storeStrong((id *)&self->_fallbackActivityType, 0);
  objc_storeStrong((id *)&self->_overrideActivityTitle, 0);
  objc_storeStrong((id *)&self->_hostActivityUUID, 0);
  objc_storeStrong((id *)&self->_activityConfiguration, 0);
  objc_storeStrong((id *)&self->_activitySettingsImage, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
}

@end
