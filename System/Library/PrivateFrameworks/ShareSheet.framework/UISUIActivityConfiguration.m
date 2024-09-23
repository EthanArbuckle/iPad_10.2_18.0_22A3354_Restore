@implementation UISUIActivityConfiguration

+ (id)configurationForActivity:(id)a3 forRemoteUIService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  v7 = ~objc_msgSend((id)objc_opt_class(), "_xpcAttributes") & 3;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:].cold.2((uint64_t)v6, v8, v10, v11, v12, v13, v14, v15);
    v16 = 2;
  }
  else
  {
    if (v9)
      +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:].cold.1((uint64_t)v6, v8, v10, v11, v12, v13, v14, v15);
    v16 = 1;
  }

  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithActivity:encodingType:forRemoteUIService:", v6, v16, v4);
  return v17;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISUIActivityConfiguration;
  return -[UISUIActivityConfiguration init](&v3, sel_init);
}

- (UISUIActivityConfiguration)initWithActivity:(id)a3 encodingType:(int64_t)a4 forRemoteUIService:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  UISUIActivityConfiguration *v9;
  objc_class *v10;
  uint64_t v11;
  NSString *activityClassName;
  uint64_t v13;
  NSUUID *activityUUID;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UISUIActivityConfiguration;
  v9 = -[UISUIActivityConfiguration init](&v16, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    activityClassName = v9->_activityClassName;
    v9->_activityClassName = (NSString *)v11;

    v9->_encodingType = a4;
    objc_msgSend(v8, "activityUUID");
    v13 = objc_claimAutoreleasedReturnValue();
    activityUUID = v9->_activityUUID;
    v9->_activityUUID = (NSUUID *)v13;

    v9->_appIsDocumentTypeOwner = objc_msgSend(v8, "_appIsDocumentTypeOwner");
    v9->_isCapabilityBasedActivity = objc_msgSend((id)objc_opt_class(), "_isCapabilityBasedActivity");
    v9->_isDisabled = objc_msgSend(v8, "_isDisabled");
    if (a4 == 2)
      -[UISUIActivityConfiguration _collectPropertiesFromAttributesOfUnderlyingActivity:forRemoteUIService:](v9, "_collectPropertiesFromAttributesOfUnderlyingActivity:forRemoteUIService:", v8, v5);
  }

  return v9;
}

- (void)updateConfigurationWithOverrideTitle:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTitle, a3);
}

- (NSString)activityTitle
{
  NSString *overrideTitle;

  overrideTitle = self->_overrideTitle;
  if (!overrideTitle)
    overrideTitle = self->_defaultActivityTitle;
  return overrideTitle;
}

- (NSExtension)extension
{
  void *v3;
  void *v4;
  void *v5;

  -[UISUIActivityConfiguration extensionIdentifier](self, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UISUIActivityConfiguration activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSExtension *)v5;
}

- (BOOL)isEqual:(id)a3
{
  UISUIActivityConfiguration *v4;
  UISUIActivityConfiguration *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = (UISUIActivityConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UISUIActivityConfiguration activityUUID](self, "activityUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISUIActivityConfiguration activityUUID](v5, "activityUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v11 = 1;
      }
      else if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
      }
      else
      {
        v11 = objc_msgSend(v8, "isEqual:", v9);
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  int64_t encodingType;
  id v5;

  v5 = a3;
  -[UISUIActivityConfiguration _encodeBasicPropertiesWithCoder:](self, "_encodeBasicPropertiesWithCoder:");
  encodingType = self->_encodingType;
  if (encodingType == 2)
  {
    -[UISUIActivityConfiguration _encodeByPropertiesWithCoder:](self, "_encodeByPropertiesWithCoder:", v5);
  }
  else if (encodingType == 1)
  {
    -[UISUIActivityConfiguration _encodeByClassNameWithCoder:](self, "_encodeByClassNameWithCoder:", v5);
  }

}

- (UISUIActivityConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  UISUIActivityConfiguration *v5;
  UISUIActivityConfiguration *v6;
  int64_t encodingType;

  v4 = a3;
  v5 = -[UISUIActivityConfiguration _init](self, "_init");
  v6 = v5;
  if (v5)
  {
    -[UISUIActivityConfiguration _decodeBasicPropertiesWithCoder:](v5, "_decodeBasicPropertiesWithCoder:", v4);
    encodingType = v6->_encodingType;
    if (encodingType == 2)
    {
      -[UISUIActivityConfiguration _decodeForEncodingByPropertiesWithCoder:](v6, "_decodeForEncodingByPropertiesWithCoder:", v4);
    }
    else if (encodingType == 1)
    {
      -[UISUIActivityConfiguration _decodeForEncodingByClassNameWithCoder:](v6, "_decodeForEncodingByClassNameWithCoder:", v4);
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityConfiguration)initWithCoder:(id)a3
{
  id v4;
  UISUIActivityConfiguration *v5;
  UISUIActivityConfiguration *v6;
  int64_t encodingType;

  v4 = a3;
  v5 = -[UISUIActivityConfiguration _init](self, "_init");
  v6 = v5;
  if (v5)
  {
    -[UISUIActivityConfiguration _decodeBasicPropertiesWithCoder:](v5, "_decodeBasicPropertiesWithCoder:", v4);
    encodingType = v6->_encodingType;
    if (encodingType == 2)
    {
      -[UISUIActivityConfiguration _decodeForEncodingByPropertiesWithCoder:](v6, "_decodeForEncodingByPropertiesWithCoder:", v4);
    }
    else if (encodingType == 1)
    {
      -[UISUIActivityConfiguration _decodeForEncodingByClassNameWithCoder:](v6, "_decodeForEncodingByClassNameWithCoder:", v4);
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t encodingType;
  id v5;

  v5 = a3;
  -[UISUIActivityConfiguration _encodeBasicPropertiesWithCoder:](self, "_encodeBasicPropertiesWithCoder:");
  encodingType = self->_encodingType;
  if (encodingType == 2)
  {
    -[UISUIActivityConfiguration _encodeByPropertiesWithCoder:](self, "_encodeByPropertiesWithCoder:", v5);
  }
  else if (encodingType == 1)
  {
    -[UISUIActivityConfiguration _encodeByClassNameWithCoder:](self, "_encodeByClassNameWithCoder:", v5);
  }

}

- (void)_encodeBasicPropertiesWithCoder:(id)a3
{
  char isKindOfClass;
  int64_t encodingType;
  void *v6;
  NSUUID *activityUUID;
  void *v8;
  _BOOL8 appIsDocumentTypeOwner;
  void *v10;
  NSString *overrideTitle;
  void *v12;
  _BOOL8 isCapabilityBasedActivity;
  void *v14;
  _BOOL8 isDisabled;
  void *v16;
  id v17;

  v17 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  encodingType = self->_encodingType;
  NSStringFromSelector(sel_encodingType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v17, "encodeInt64:forKey:", encodingType, v6);
  else
    objc_msgSend(v17, "encodeInteger:forKey:", encodingType, v6);

  activityUUID = self->_activityUUID;
  NSStringFromSelector(sel_activityUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", activityUUID, v8);

  appIsDocumentTypeOwner = self->_appIsDocumentTypeOwner;
  NSStringFromSelector(sel_appIsDocumentTypeOwner);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeBool:forKey:", appIsDocumentTypeOwner, v10);

  overrideTitle = self->_overrideTitle;
  if (overrideTitle)
  {
    NSStringFromSelector(sel_overrideTitle);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", overrideTitle, v12);

  }
  isCapabilityBasedActivity = self->_isCapabilityBasedActivity;
  NSStringFromSelector(sel_isCapabilityBasedActivity);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeBool:forKey:", isCapabilityBasedActivity, v14);

  isDisabled = self->_isDisabled;
  NSStringFromSelector(sel_isDisabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeBool:forKey:", isDisabled, v16);

}

- (void)_encodeByClassNameWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UISUIActivityConfiguration activityClassName](self, "activityClassName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityClassName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (void)_encodeByPropertiesWithCoder:(id)a3
{
  char isKindOfClass;
  int64_t activityCategory;
  void *v6;
  int64_t defaultSortGroup;
  void *v8;
  unint64_t indexInApplicationDefinedActivities;
  void *v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  NSString *defaultActivityTitle;
  void *v15;
  NSString *activityType;
  void *v17;
  NSString *fallbackActivityType;
  void *v19;
  NSString *positionBeforeActivityType;
  void *v21;
  _BOOL8 activitySupportsPromiseURLs;
  void *v23;
  _BOOL8 wantsOriginalImageColor;
  void *v25;
  _BOOL8 isBuiltinDerived;
  void *v27;
  _BOOL8 showsInSystemActionGroup;
  void *v29;
  void *v30;
  NSString *extensionIdentifier;
  void *v32;
  UIImage *activityImage;
  void *v34;
  UIImage *actionImage;
  void *v36;
  UIImage *activitySettingsImage;
  void *v38;
  NSString *systemImageName;
  void *v40;
  NSAttributedString *activityFooterText;
  void *v42;
  UIImage *activityStatusImage;
  void *v44;
  UIColor *activityStatusTintColor;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  activityCategory = self->_activityCategory;
  NSStringFromSelector(sel_activityCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v48, "encodeInt64:forKey:", activityCategory, v6);

    defaultSortGroup = self->_defaultSortGroup;
    NSStringFromSelector(sel_defaultSortGroup);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeInt64:forKey:", defaultSortGroup, v8);

    indexInApplicationDefinedActivities = self->_indexInApplicationDefinedActivities;
    NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeInt64:forKey:", indexInApplicationDefinedActivities, v10);
  }
  else
  {
    objc_msgSend(v48, "encodeInteger:forKey:", activityCategory, v6);

    v11 = self->_defaultSortGroup;
    NSStringFromSelector(sel_defaultSortGroup);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeInteger:forKey:", v11, v12);

    v13 = self->_indexInApplicationDefinedActivities;
    NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeInteger:forKey:", v13, v10);
  }

  defaultActivityTitle = self->_defaultActivityTitle;
  NSStringFromSelector(sel_activityTitle);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:forKey:", defaultActivityTitle, v15);

  activityType = self->_activityType;
  NSStringFromSelector(sel_activityType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:forKey:", activityType, v17);

  fallbackActivityType = self->_fallbackActivityType;
  NSStringFromSelector(sel_fallbackActivityType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:forKey:", fallbackActivityType, v19);

  positionBeforeActivityType = self->_positionBeforeActivityType;
  NSStringFromSelector(sel_positionBeforeActivityType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:forKey:", positionBeforeActivityType, v21);

  activitySupportsPromiseURLs = self->_activitySupportsPromiseURLs;
  NSStringFromSelector(sel_activitySupportsPromiseURLs);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeBool:forKey:", activitySupportsPromiseURLs, v23);

  wantsOriginalImageColor = self->_wantsOriginalImageColor;
  NSStringFromSelector(sel_wantsOriginalImageColor);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeBool:forKey:", wantsOriginalImageColor, v25);

  isBuiltinDerived = self->_isBuiltinDerived;
  NSStringFromSelector(sel_isBuiltinDerived);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeBool:forKey:", isBuiltinDerived, v27);

  showsInSystemActionGroup = self->_showsInSystemActionGroup;
  NSStringFromSelector(sel_showsInSystemActionGroup);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeBool:forKey:", showsInSystemActionGroup, v29);

  if (self->_preferredThumbnailSize.width != *MEMORY[0x1E0C9D820]
    || self->_preferredThumbnailSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", v30, CFSTR("preferredThumbnailSizeValue"));

  }
  extensionIdentifier = self->_extensionIdentifier;
  if (extensionIdentifier)
  {
    NSStringFromSelector(sel_extensionIdentifier);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", extensionIdentifier, v32);

  }
  activityImage = self->_activityImage;
  if (activityImage)
  {
    NSStringFromSelector(sel_activityImage);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", activityImage, v34);

  }
  actionImage = self->_actionImage;
  if (actionImage)
  {
    NSStringFromSelector(sel_actionImage);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", actionImage, v36);

  }
  activitySettingsImage = self->_activitySettingsImage;
  if (activitySettingsImage)
  {
    NSStringFromSelector(sel_activitySettingsImage);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", activitySettingsImage, v38);

  }
  systemImageName = self->_systemImageName;
  if (systemImageName)
  {
    NSStringFromSelector(sel_systemImageName);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", systemImageName, v40);

  }
  activityFooterText = self->__activityFooterText;
  if (activityFooterText)
  {
    NSStringFromSelector(sel__activityFooterText);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", activityFooterText, v42);

  }
  activityStatusImage = self->_activityStatusImage;
  if (activityStatusImage)
  {
    NSStringFromSelector(sel_activityStatusImage);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", activityStatusImage, v44);

  }
  activityStatusTintColor = self->_activityStatusTintColor;
  v46 = v48;
  if (activityStatusTintColor)
  {
    NSStringFromSelector(sel_activityStatusTintColor);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "encodeObject:forKey:", activityStatusTintColor, v47);

    v46 = v48;
  }

}

- (void)_decodeBasicPropertiesWithCoder:(id)a3
{
  char isKindOfClass;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  NSUUID *v9;
  NSUUID *activityUUID;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  NSString *overrideTitle;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  NSStringFromSelector(sel_encodingType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
    v6 = objc_msgSend(v18, "decodeInt64ForKey:", v5);
  else
    v6 = objc_msgSend(v18, "decodeIntegerForKey:", v5);
  self->_encodingType = v6;

  v7 = objc_opt_class();
  NSStringFromSelector(sel_activityUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  activityUUID = self->_activityUUID;
  self->_activityUUID = v9;

  NSStringFromSelector(sel_appIsDocumentTypeOwner);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_appIsDocumentTypeOwner = objc_msgSend(v18, "decodeBoolForKey:", v11);

  v12 = objc_opt_class();
  NSStringFromSelector(sel_overrideTitle);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "decodeObjectOfClass:forKey:", v12, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  overrideTitle = self->_overrideTitle;
  self->_overrideTitle = v14;

  NSStringFromSelector(sel_isCapabilityBasedActivity);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isCapabilityBasedActivity = objc_msgSend(v18, "decodeBoolForKey:", v16);

  NSStringFromSelector(sel_isDisabled);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isDisabled = objc_msgSend(v18, "decodeBoolForKey:", v17);

}

- (void)_decodeForEncodingByClassNameWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *activityClassName;
  UIActivity *v9;
  UIActivity *activity;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_activityClassName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  activityClassName = self->_activityClassName;
  self->_activityClassName = v7;

  NSClassFromString(self->_activityClassName);
  v9 = (UIActivity *)objc_opt_new();
  activity = self->_activity;
  self->_activity = v9;

}

- (void)_decodeForEncodingByPropertiesWithCoder:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  NSString *defaultActivityTitle;
  uint64_t v15;
  void *v16;
  NSString *v17;
  NSString *activityType;
  uint64_t v19;
  void *v20;
  NSString *v21;
  NSString *fallbackActivityType;
  uint64_t v23;
  void *v24;
  NSString *v25;
  NSString *positionBeforeActivityType;
  void *v27;
  void *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  UIImage *v37;
  UIImage *activityImage;
  uint64_t v39;
  void *v40;
  UIImage *v41;
  UIImage *actionImage;
  uint64_t v43;
  void *v44;
  UIImage *v45;
  UIImage *activitySettingsImage;
  uint64_t v47;
  void *v48;
  NSString *v49;
  NSString *systemImageName;
  uint64_t v51;
  void *v52;
  NSAttributedString *v53;
  NSAttributedString *activityFooterText;
  uint64_t v55;
  void *v56;
  UIImage *v57;
  UIImage *activityStatusImage;
  uint64_t v59;
  void *v60;
  UIColor *v61;
  UIColor *activityStatusTintColor;
  uint64_t v63;
  void *v64;
  NSString *v65;
  NSString *extensionIdentifier;
  NSString *v67;
  void *v68;
  id v69;
  UIApplicationExtensionActivity *v70;
  void *v71;
  NSObject *p_super;
  id v73;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  NSStringFromSelector(sel_activityCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    self->_activityCategory = objc_msgSend(v4, "decodeInt64ForKey:", v6);

    NSStringFromSelector(sel_defaultSortGroup);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_defaultSortGroup = objc_msgSend(v4, "decodeInt64ForKey:", v7);

    NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "decodeInt64ForKey:", v8);
  }
  else
  {
    self->_activityCategory = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    NSStringFromSelector(sel_defaultSortGroup);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_defaultSortGroup = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", v8);
  }
  self->_indexInApplicationDefinedActivities = v9;

  v11 = objc_opt_class();
  NSStringFromSelector(sel_activityTitle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  defaultActivityTitle = self->_defaultActivityTitle;
  self->_defaultActivityTitle = v13;

  v15 = objc_opt_class();
  NSStringFromSelector(sel_activityType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  activityType = self->_activityType;
  self->_activityType = v17;

  v19 = objc_opt_class();
  NSStringFromSelector(sel_fallbackActivityType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  fallbackActivityType = self->_fallbackActivityType;
  self->_fallbackActivityType = v21;

  v23 = objc_opt_class();
  NSStringFromSelector(sel_positionBeforeActivityType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  positionBeforeActivityType = self->_positionBeforeActivityType;
  self->_positionBeforeActivityType = v25;

  NSStringFromSelector(sel_activitySupportsPromiseURLs);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self->_activitySupportsPromiseURLs = objc_msgSend(v4, "decodeBoolForKey:", v27);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredThumbnailSizeValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "CGSizeValue");
    self->_preferredThumbnailSize.width = v30;
    self->_preferredThumbnailSize.height = v31;
  }
  NSStringFromSelector(sel_wantsOriginalImageColor);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wantsOriginalImageColor = objc_msgSend(v4, "decodeBoolForKey:", v32);

  NSStringFromSelector(sel_isBuiltinDerived);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isBuiltinDerived = objc_msgSend(v4, "decodeBoolForKey:", v33);

  NSStringFromSelector(sel_showsInSystemActionGroup);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showsInSystemActionGroup = objc_msgSend(v4, "decodeBoolForKey:", v34);

  v35 = objc_opt_class();
  NSStringFromSelector(sel_activityImage);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, v36);
  v37 = (UIImage *)objc_claimAutoreleasedReturnValue();
  activityImage = self->_activityImage;
  self->_activityImage = v37;

  v39 = objc_opt_class();
  NSStringFromSelector(sel_actionImage);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, v40);
  v41 = (UIImage *)objc_claimAutoreleasedReturnValue();
  actionImage = self->_actionImage;
  self->_actionImage = v41;

  v43 = objc_opt_class();
  NSStringFromSelector(sel_activitySettingsImage);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, v44);
  v45 = (UIImage *)objc_claimAutoreleasedReturnValue();
  activitySettingsImage = self->_activitySettingsImage;
  self->_activitySettingsImage = v45;

  v47 = objc_opt_class();
  NSStringFromSelector(sel_systemImageName);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v48);
  v49 = (NSString *)objc_claimAutoreleasedReturnValue();
  systemImageName = self->_systemImageName;
  self->_systemImageName = v49;

  v51 = objc_opt_class();
  NSStringFromSelector(sel__activityFooterText);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v51, v52);
  v53 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  activityFooterText = self->__activityFooterText;
  self->__activityFooterText = v53;

  v55 = objc_opt_class();
  NSStringFromSelector(sel_activityStatusImage);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v55, v56);
  v57 = (UIImage *)objc_claimAutoreleasedReturnValue();
  activityStatusImage = self->_activityStatusImage;
  self->_activityStatusImage = v57;

  v59 = objc_opt_class();
  NSStringFromSelector(sel_activityStatusTintColor);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v59, v60);
  v61 = (UIColor *)objc_claimAutoreleasedReturnValue();
  activityStatusTintColor = self->_activityStatusTintColor;
  self->_activityStatusTintColor = v61;

  v63 = objc_opt_class();
  NSStringFromSelector(sel_extensionIdentifier);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v63, v64);
  v65 = (NSString *)objc_claimAutoreleasedReturnValue();
  extensionIdentifier = self->_extensionIdentifier;
  self->_extensionIdentifier = v65;

  v67 = self->_extensionIdentifier;
  if (v67)
  {
    v73 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v67, &v73);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v73;
    if (v68)
    {
      v70 = -[UIApplicationExtensionActivity initWithApplicationExtension:]([UIApplicationExtensionActivity alloc], "initWithApplicationExtension:", v68);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activityCategory);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplicationExtensionActivity setOverrideActivityCategory:](v70, "setOverrideActivityCategory:", v71);

      p_super = &self->_activity->super;
      self->_activity = &v70->super;
    }
    else
    {
      share_sheet_log();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[UISUIActivityConfiguration _decodeForEncodingByPropertiesWithCoder:].cold.1((uint64_t *)&self->_extensionIdentifier, (uint64_t)v69, p_super);
    }

  }
}

- (void)_collectPropertiesFromAttributesOfUnderlyingActivity:(id)a3 forRemoteUIService:(BOOL)a4
{
  _BOOL4 v4;
  char isKindOfClass;
  NSString *defaultActivityTitle;
  NSString *v8;
  NSString *v9;
  NSString *activityType;
  NSString *v11;
  NSString *fallbackActivityType;
  NSString *v13;
  NSString *positionBeforeActivityType;
  CGFloat v15;
  CGFloat v16;
  NSAttributedString *v17;
  NSAttributedString *activityFooterText;
  UIColor *v19;
  UIColor *activityStatusTintColor;
  void *activityStatusImage;
  NSString *v22;
  NSString *extensionIdentifier;
  UIImage *v24;
  UIImage *activityImage;
  UIImage *v26;
  UIImage *actionImage;
  UIImage *v28;
  UIImage *activitySettingsImage;
  NSString *v30;
  NSString *systemImageName;
  UIImage *v32;
  id v33;

  v4 = a4;
  v33 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  self->_activityCategory = objc_msgSend((id)objc_opt_class(), "activityCategory");
  if ((isKindOfClass & 1) != 0)
  {
    defaultActivityTitle = self->_defaultActivityTitle;
    self->_defaultActivityTitle = 0;
  }
  else
  {
    objc_msgSend(v33, "activityTitle");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultActivityTitle = self->_defaultActivityTitle;
    self->_defaultActivityTitle = v8;
  }

  objc_msgSend(v33, "activityType");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  activityType = self->_activityType;
  self->_activityType = v9;

  objc_msgSend((id)objc_opt_class(), "_defaultFallbackActivityType");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  fallbackActivityType = self->_fallbackActivityType;
  self->_fallbackActivityType = v11;

  objc_msgSend(v33, "_beforeActivity");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  positionBeforeActivityType = self->_positionBeforeActivityType;
  self->_positionBeforeActivityType = v13;

  self->_activitySupportsPromiseURLs = objc_msgSend(v33, "_activitySupportsPromiseURLs");
  objc_msgSend(v33, "_thumbnailSize");
  self->_preferredThumbnailSize.width = v15;
  self->_preferredThumbnailSize.height = v16;
  self->_defaultSortGroup = objc_msgSend(v33, "_defaultSortGroup");
  self->_indexInApplicationDefinedActivities = objc_msgSend(v33, "indexInApplicationDefinedActivities");
  objc_msgSend(v33, "_activityFooterText");
  v17 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  activityFooterText = self->__activityFooterText;
  self->__activityFooterText = v17;

  if (v4 && _os_feature_enabled_impl())
  {
    self->_wantsOriginalImageColor = objc_msgSend(v33, "_wantsOriginalImageColor");
    self->_isBuiltinDerived = objc_msgSend(v33, "_isBuiltinDerived");
    self->_showsInSystemActionGroup = objc_msgSend(v33, "_showsInSystemActionGroup");
    objc_msgSend(v33, "_activityStatusTintColor");
    v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    activityStatusTintColor = self->_activityStatusTintColor;
    self->_activityStatusTintColor = v19;

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v33, "applicationExtension");
      activityStatusImage = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(activityStatusImage, "identifier");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      extensionIdentifier = self->_extensionIdentifier;
      self->_extensionIdentifier = v22;

    }
    else
    {
      objc_msgSend(v33, "_activityImage");
      v24 = (UIImage *)objc_claimAutoreleasedReturnValue();
      activityImage = self->_activityImage;
      self->_activityImage = v24;

      objc_msgSend(v33, "_actionImage");
      v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
      actionImage = self->_actionImage;
      self->_actionImage = v26;

      objc_msgSend(v33, "_activitySettingsImage");
      v28 = (UIImage *)objc_claimAutoreleasedReturnValue();
      activitySettingsImage = self->_activitySettingsImage;
      self->_activitySettingsImage = v28;

      objc_msgSend(v33, "_systemImageName");
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      systemImageName = self->_systemImageName;
      self->_systemImageName = v30;

      objc_msgSend(v33, "_activityStatusImage");
      v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
      activityStatusImage = self->_activityStatusImage;
      self->_activityStatusImage = v32;
    }

  }
  -[UISUIActivityConfiguration _validateProperties](self, "_validateProperties");

}

- (void)_validateProperties
{
  NSString *defaultActivityTitle;

  if (!-[NSString length](self->_defaultActivityTitle, "length"))
  {
    defaultActivityTitle = self->_defaultActivityTitle;
    self->_defaultActivityTitle = (NSString *)CFSTR(" ");

  }
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)fallbackActivityType
{
  return self->_fallbackActivityType;
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

- (BOOL)activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (int64_t)defaultSortGroup
{
  return self->_defaultSortGroup;
}

- (BOOL)appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (unint64_t)indexInApplicationDefinedActivities
{
  return self->_indexInApplicationDefinedActivities;
}

- (BOOL)isCapabilityBasedActivity
{
  return self->_isCapabilityBasedActivity;
}

- (void)setIsCapabilityBasedActivity:(BOOL)a3
{
  self->_isCapabilityBasedActivity = a3;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (BOOL)wantsOriginalImageColor
{
  return self->_wantsOriginalImageColor;
}

- (BOOL)isBuiltinDerived
{
  return self->_isBuiltinDerived;
}

- (BOOL)showsInSystemActionGroup
{
  return self->_showsInSystemActionGroup;
}

- (UIImage)activityImage
{
  return self->_activityImage;
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (UIImage)activitySettingsImage
{
  return self->_activitySettingsImage;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (UIImage)activityStatusImage
{
  return self->_activityStatusImage;
}

- (UIColor)activityStatusTintColor
{
  return self->_activityStatusTintColor;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSAttributedString)_activityFooterText
{
  return self->__activityFooterText;
}

- (void)set_activityFooterText:(id)a3
{
  objc_storeStrong((id *)&self->__activityFooterText, a3);
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (void)setOverrideTitle:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTitle, a3);
}

- (NSString)defaultActivityTitle
{
  return self->_defaultActivityTitle;
}

- (NSString)positionBeforeActivityType
{
  return self->_positionBeforeActivityType;
}

- (NSString)activityClassName
{
  return self->_activityClassName;
}

- (void)setActivityClassName:(id)a3
{
  objc_storeStrong((id *)&self->_activityClassName, a3);
}

- (int64_t)encodingType
{
  return self->_encodingType;
}

- (void)setEncodingType:(int64_t)a3
{
  self->_encodingType = a3;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_activityClassName, 0);
  objc_storeStrong((id *)&self->_positionBeforeActivityType, 0);
  objc_storeStrong((id *)&self->_defaultActivityTitle, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
  objc_storeStrong((id *)&self->__activityFooterText, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_activityStatusTintColor, 0);
  objc_storeStrong((id *)&self->_activityStatusImage, 0);
  objc_storeStrong((id *)&self->_activitySettingsImage, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_fallbackActivityType, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

+ (void)configurationForActivity:(uint64_t)a3 forRemoteUIService:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19E419000, a2, a3, "configurationForActivity:%@ encodingType:UISUIActivityConfigurationEncodingByClassName", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)configurationForActivity:(uint64_t)a3 forRemoteUIService:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19E419000, a2, a3, "configurationForActivity:%@ encodingType:UISUIActivityConfigurationEncodingByProperties", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_decodeForEncodingByPropertiesWithCoder:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "failure retrieving extension for identifier:%@ error:%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
