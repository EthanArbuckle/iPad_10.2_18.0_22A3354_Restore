@implementation PUAdjustmentInfo

- (id)copy
{
  id result;

  result = (id)-[PUAdjustmentInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (double)normalizedCurrentLevel
{
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

  -[PUAdjustmentInfo maximumLevel](self, "maximumLevel");
  v4 = v3;
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  if (v4 <= v5)
    return 2.22507386e-308;
  -[PUAdjustmentInfo currentLevel](self, "currentLevel");
  v7 = v6;
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  v9 = v7 - v8;
  -[PUAdjustmentInfo maximumLevel](self, "maximumLevel");
  v11 = v10;
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  return v9 / (v11 - v12);
}

- (double)normalizedDefaultLevel
{
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

  -[PUAdjustmentInfo maximumLevel](self, "maximumLevel");
  v4 = v3;
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  if (v4 <= v5)
    return 2.22507386e-308;
  -[PUAdjustmentInfo defaultLevel](self, "defaultLevel");
  v7 = v6;
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  v9 = v7 - v8;
  -[PUAdjustmentInfo maximumLevel](self, "maximumLevel");
  v11 = v10;
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  return v9 / (v11 - v12);
}

- (void)setCurrentLevel:(double)a3
{
  if (self->_currentLevel != a3)
  {
    -[PUAdjustmentInfo setLastAdjustedLevel:](self, "setLastAdjustedLevel:");
    self->_currentLevel = a3;
  }
}

- (void)setLastAdjustedLevel:(double)a3
{
  if (self->_lastAdjustedLevel != a3)
    self->_lastAdjustedLevel = a3;
}

- (NSString)localizedActionName
{
  NSString *localizedActionName;
  NSString *v3;
  void *v5;
  void *v7;

  localizedActionName = self->_localizedActionName;
  if (localizedActionName)
  {
    v3 = localizedActionName;
  }
  else
  {
    PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENT_CHANGE_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentInfo localizedName](self, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedStringWithValidatedFormat(v5, CFSTR("%@"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUAdjustmentInfo enabled](self, "enabled");
  -[PUAdjustmentInfo localizedSectionName](self, "localizedSectionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo adjustmentKey](self, "adjustmentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo settingKey](self, "settingKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo attributeKey](self, "attributeKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo minimumLevel](self, "minimumLevel");
  v13 = v12;
  -[PUAdjustmentInfo maximumLevel](self, "maximumLevel");
  v15 = v14;
  -[PUAdjustmentInfo defaultLevel](self, "defaultLevel");
  v17 = v16;
  -[PUAdjustmentInfo identityLevel](self, "identityLevel");
  v19 = v18;
  -[PUAdjustmentInfo lastAdjustedLevel](self, "lastAdjustedLevel");
  v21 = v20;
  -[PUAdjustmentInfo currentLevel](self, "currentLevel");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name=%@, enabled:%d, sectionName:%@, adjustmentKey=%@, settingsKey:%@, attributeKey:%@, min=%f, max=%f, default=%f, identity=%f, lastAdjusted=%f, current=%f"), v5, self, v6, v7, v8, v9, v10, v11, v13, v15, v17, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void)setLocalizedActionName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedActionName, a3);
}

- (NSString)localizedSectionName
{
  return self->_localizedSectionName;
}

- (void)setLocalizedSectionName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSectionName, a3);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_storeStrong((id *)&self->_iconName, a3);
}

- (NSString)altIconName
{
  return self->_altIconName;
}

- (void)setAltIconName:(id)a3
{
  objc_storeStrong((id *)&self->_altIconName, a3);
}

- (id)altImageTransformBlock
{
  return self->_altImageTransformBlock;
}

- (void)setAltImageTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)iconIsColor
{
  return self->_iconIsColor;
}

- (void)setIconIsColor:(BOOL)a3
{
  self->_iconIsColor = a3;
}

- (double)defaultLevel
{
  return self->_defaultLevel;
}

- (void)setDefaultLevel:(double)a3
{
  self->_defaultLevel = a3;
}

- (double)identityLevel
{
  return self->_identityLevel;
}

- (void)setIdentityLevel:(double)a3
{
  self->_identityLevel = a3;
}

- (double)minimumLevel
{
  return self->_minimumLevel;
}

- (void)setMinimumLevel:(double)a3
{
  self->_minimumLevel = a3;
}

- (double)maximumLevel
{
  return self->_maximumLevel;
}

- (void)setMaximumLevel:(double)a3
{
  self->_maximumLevel = a3;
}

- (double)baseLevel
{
  return self->_baseLevel;
}

- (void)setBaseLevel:(double)a3
{
  self->_baseLevel = a3;
}

- (double)currentLevel
{
  return self->_currentLevel;
}

- (double)lastAdjustedLevel
{
  return self->_lastAdjustedLevel;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)adjustmentKey
{
  return self->_adjustmentKey;
}

- (void)setAdjustmentKey:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentKey, a3);
}

- (NSString)settingKey
{
  return self->_settingKey;
}

- (void)setSettingKey:(id)a3
{
  objc_storeStrong((id *)&self->_settingKey, a3);
}

- (PUAdjustmentCustomBehavior)customSettingDelegate
{
  return self->_customSettingDelegate;
}

- (void)setCustomSettingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_customSettingDelegate, a3);
}

- (NSString)attributeKey
{
  return self->_attributeKey;
}

- (void)setAttributeKey:(id)a3
{
  objc_storeStrong((id *)&self->_attributeKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeKey, 0);
  objc_storeStrong((id *)&self->_customSettingDelegate, 0);
  objc_storeStrong((id *)&self->_settingKey, 0);
  objc_storeStrong((id *)&self->_adjustmentKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_altImageTransformBlock, 0);
  objc_storeStrong((id *)&self->_altIconName, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedSectionName, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
