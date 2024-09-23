@implementation SUIHostActivityProxy

+ (id)activitiesForConfigurations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
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
        v10 = +[SUIHostActivityProxy newWithActivityConfiguration:](SUIHostActivityProxy, "newWithActivityConfiguration:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), (_QWORD)v12);
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
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
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extension"));
    v8 = v4;
    if (!v7)
      v8 = (void *)objc_opt_class(v5, v6);
    v9 = objc_msgSend(v8, "activityCategory");

  }
  else
  {
    v9 = objc_msgSend(v4, "activityCategory");
  }
  v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "activityProxyClassForActivityCategory:", v9)), "initWithAttributesFromActivityConfiguration:", v4);

  return v10;
}

+ (Class)activityProxyClassForActivityCategory:(int64_t)a3
{
  __objc2_class **v3;
  uint64_t v4;

  if (!a3)
  {
    v3 = off_1007115D0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = &off_1007115D8;
LABEL_5:
    v4 = objc_opt_class(*v3, a2);
    a1 = (id)objc_claimAutoreleasedReturnValue(v4);
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
  uint64_t v14;
  UIActivity *v15;
  id v16;
  void *v17;
  void *v18;
  UIActivity *v19;
  id v20;
  UIActivity *v21;
  void *v22;
  void *v23;
  UIActivity *v24;
  CGFloat v25;
  CGFloat v26;
  UIActivity *v27;
  unsigned __int8 v28;
  UIActivity *v29;
  void *v30;
  NSString *v31;
  NSString *overrideActivityTitle;
  uint64_t v33;
  NSString *activityTitle;
  uint64_t v35;
  UIImage *activityImage;
  uint64_t v37;
  UIImage *activitySettingsImage;
  uint64_t v39;
  UIImage *actionImage;
  uint64_t v41;
  NSString *systemImageName;
  uint64_t v43;
  NSAttributedString *activityFooterText;
  uint64_t v45;
  UIImage *activityStatusImage;
  uint64_t v47;
  UIColor *activityStatusTintColor;
  objc_super v50;

  v5 = (UIActivity *)a3;
  v50.receiver = self;
  v50.super_class = (Class)SUIHostActivityProxy;
  v6 = -[SUIHostActivityProxy init](&v50, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityConfiguration, a3);
    v8 = objc_claimAutoreleasedReturnValue(-[UIActivity activity](v5, "activity"));
    activity = v7->_activity;
    v7->_activity = (UIActivity *)v8;

    v10 = objc_claimAutoreleasedReturnValue(-[UIActivity activityUUID](v5, "activityUUID"));
    hostActivityUUID = v7->_hostActivityUUID;
    v7->_hostActivityUUID = (NSUUID *)v10;

    v7->_appIsDocumentTypeOwner = -[UIActivity appIsDocumentTypeOwner](v5, "appIsDocumentTypeOwner");
    v12 = v7->_activity;
    if (!v12)
      v12 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivity activityType](v12, "activityType"));
    objc_storeStrong((id *)&v7->_activityType, v13);

    v15 = v7->_activity;
    if (v15)
    {
      v16 = objc_msgSend((id)objc_opt_class(v15, v14), "_defaultFallbackActivityType");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivity fallbackActivityType](v5, "fallbackActivityType"));
    }
    v18 = v17;
    objc_storeStrong((id *)&v7->_fallbackActivityType, v17);

    v19 = v7->_activity;
    if (v19)
      v20 = -[UIActivity _defaultSortGroup](v19, "_defaultSortGroup");
    else
      v20 = -[UIActivity defaultSortGroup](v5, "defaultSortGroup");
    v7->_defaultSortGroup = (int64_t)v20;
    v21 = v7->_activity;
    if (v21)
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivity _beforeActivity](v21, "_beforeActivity"));
    else
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivity positionBeforeActivityType](v5, "positionBeforeActivityType"));
    v23 = v22;
    objc_storeStrong((id *)&v7->_positionBeforeActivityType, v22);

    v24 = v7->_activity;
    if (v24)
      -[UIActivity _thumbnailSize](v24, "_thumbnailSize");
    else
      -[UIActivity preferredThumbnailSize](v5, "preferredThumbnailSize");
    v7->_preferredThumbnailSize.width = v25;
    v7->_preferredThumbnailSize.height = v26;
    v27 = v7->_activity;
    if (v27)
      v28 = -[UIActivity _activitySupportsPromiseURLs](v27, "_activitySupportsPromiseURLs");
    else
      v28 = -[UIActivity activitySupportsPromiseURLs](v5, "activitySupportsPromiseURLs");
    v7->_activitySupportsPromiseURLs = v28;
    v29 = v7->_activity;
    if (!v29)
      v29 = v5;
    -[SUIHostActivityProxy setIndexInApplicationDefinedActivities:](v7, "setIndexInApplicationDefinedActivities:", -[UIActivity indexInApplicationDefinedActivities](v29, "indexInApplicationDefinedActivities"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivity overrideTitle](v5, "overrideTitle"));
    v31 = (NSString *)objc_msgSend(v30, "copy");
    overrideActivityTitle = v7->_overrideActivityTitle;
    v7->_overrideActivityTitle = v31;

    v7->_wantsOriginalImageColor = -[UIActivity wantsOriginalImageColor](v5, "wantsOriginalImageColor");
    v7->_isBuiltinDerived = -[UIActivity isBuiltinDerived](v5, "isBuiltinDerived");
    v7->_showsInSystemActionGroup = -[UIActivity showsInSystemActionGroup](v5, "showsInSystemActionGroup");
    v33 = objc_claimAutoreleasedReturnValue(-[UIActivity activityTitle](v5, "activityTitle"));
    activityTitle = v7->_activityTitle;
    v7->_activityTitle = (NSString *)v33;

    v35 = objc_claimAutoreleasedReturnValue(-[UIActivity activityImage](v5, "activityImage"));
    activityImage = v7->_activityImage;
    v7->_activityImage = (UIImage *)v35;

    v37 = objc_claimAutoreleasedReturnValue(-[UIActivity activitySettingsImage](v5, "activitySettingsImage"));
    activitySettingsImage = v7->_activitySettingsImage;
    v7->_activitySettingsImage = (UIImage *)v37;

    v39 = objc_claimAutoreleasedReturnValue(-[UIActivity actionImage](v5, "actionImage"));
    actionImage = v7->_actionImage;
    v7->_actionImage = (UIImage *)v39;

    v41 = objc_claimAutoreleasedReturnValue(-[UIActivity systemImageName](v5, "systemImageName"));
    systemImageName = v7->_systemImageName;
    v7->_systemImageName = (NSString *)v41;

    v43 = objc_claimAutoreleasedReturnValue(-[UIActivity _activityFooterText](v5, "_activityFooterText"));
    activityFooterText = v7->_activityFooterText;
    v7->_activityFooterText = (NSAttributedString *)v43;

    v45 = objc_claimAutoreleasedReturnValue(-[UIActivity activityStatusImage](v5, "activityStatusImage"));
    activityStatusImage = v7->_activityStatusImage;
    v7->_activityStatusImage = (UIImage *)v45;

    v47 = objc_claimAutoreleasedReturnValue(-[UIActivity activityStatusTintColor](v5, "activityStatusTintColor"));
    activityStatusTintColor = v7->_activityStatusTintColor;
    v7->_activityStatusTintColor = (UIColor *)v47;

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

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy overrideActivityTitle](self, "overrideActivityTitle"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
      v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityTitle"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extension"));
    if (v5)
    {
      v6 = self->_activityFooterText;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
      v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_activityFooterText"));

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
  unsigned int wantsOriginalImageColor;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extension"));
    if (v5)
    {
      wantsOriginalImageColor = self->_wantsOriginalImageColor;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
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
  unsigned int isBuiltinDerived;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extension"));
    if (v5)
    {
      isBuiltinDerived = self->_isBuiltinDerived;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
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
  unsigned int showsInSystemActionGroup;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extension"));
    if (v5)
    {
      showsInSystemActionGroup = self->_showsInSystemActionGroup;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activityConfiguration](self, "activityConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extension"));
    if (v5)
    {
      v6 = self->_activityStatusTintColor;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_activityStatusTintColor"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_activityImage"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_actionImage"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_systemImageName"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_activitySettingsImage"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_activityStatusImage"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activity](self, "activity"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_activityImage"));

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
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUIHostActivityProxy;
  v3 = -[SUIHostActivityProxy description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy _activityTypeUsingFallbackActivityTypeIfNecessary](self, "_activityTypeUsingFallbackActivityTypeIfNecessary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUIHostActivityProxy activityTitle](self, "activityTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {type = %@, title = %@}"), v4, v5, v6));

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
