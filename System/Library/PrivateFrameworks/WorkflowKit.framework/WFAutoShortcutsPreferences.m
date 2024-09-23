@implementation WFAutoShortcutsPreferences

- (WFAutoShortcutsPreferences)initWithAppDescriptor:(id)a3 isSiriEnabled:(BOOL)a4 isSpotlightEnabled:(BOOL)a5 disabledAutoShortcuts:(id)a6 cloudKitMetadata:(id)a7 lastSyncedHash:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  WFAutoShortcutsPreferences *v18;
  WFAutoShortcutsPreferences *v19;
  WFAutoShortcutsPreferences *v20;
  objc_super v22;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFAutoShortcutsPreferences;
  v18 = -[WFAutoShortcutsPreferences init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_appDescriptor, a3);
    v19->_isSiriEnabled = a4;
    v19->_isSpotlightEnabled = a5;
    objc_storeStrong((id *)&v19->_disabledAutoShortcuts, a6);
    objc_storeStrong((id *)&v19->_cloudKitMetadata, a7);
    v19->_lastSyncedHash = a8;
    v20 = v19;
  }

  return v19;
}

- (WFAutoShortcutsPreferences)initWithAppDescriptor:(id)a3 isSiriEnabled:(BOOL)a4 isSpotlightEnabled:(BOOL)a5 disabledAutoShortcuts:(id)a6 cloudKitMetadata:(id)a7
{
  return -[WFAutoShortcutsPreferences initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:](self, "initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:", a3, a4, a5, a6, a7, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFAutoShortcutsPreferences appDescriptor](self, "appDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("appDescriptor"));

  objc_msgSend(v7, "encodeBool:forKey:", -[WFAutoShortcutsPreferences isSiriEnabled](self, "isSiriEnabled"), CFSTR("isSiriEnabled"));
  objc_msgSend(v7, "encodeBool:forKey:", -[WFAutoShortcutsPreferences isSpotlightEnabled](self, "isSpotlightEnabled"), CFSTR("isSpotlightEnabled"));
  -[WFAutoShortcutsPreferences disabledAutoShortcuts](self, "disabledAutoShortcuts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("disabledAutoShortcuts"));

  -[WFAutoShortcutsPreferences cloudKitMetadata](self, "cloudKitMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("cloudKitMetadata"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[WFAutoShortcutsPreferences lastSyncedHash](self, "lastSyncedHash"), CFSTR("lastSyncedHash"));
}

- (WFAutoShortcutsPreferences)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  WFAutoShortcutsPreferences *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSiriEnabled"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSpotlightEnabled"));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("disabledAutoShortcuts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudKitMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastSyncedHash"));

  v14 = -[WFAutoShortcutsPreferences initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:](self, "initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:", v5, v6, v7, v11, v12, v13);
  return v14;
}

- (int64_t)computedSyncHash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;

  v3 = (void *)objc_opt_new();
  -[WFAutoShortcutsPreferences appDescriptor](self, "appDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFAutoShortcutsPreferences appDescriptor](self, "appDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combineInteger:", +[WFAutoShortcutsPreferences crossPlatformHashForAppDescriptor:](WFAutoShortcutsPreferences, "crossPlatformHashForAppDescriptor:", v5));

  }
  -[WFAutoShortcutsPreferences disabledAutoShortcuts](self, "disabledAutoShortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFAutoShortcutsPreferences disabledAutoShortcuts](self, "disabledAutoShortcuts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v10);
  }
  v12 = (id)objc_msgSend(v3, "combineBool:", -[WFAutoShortcutsPreferences isSiriEnabled](self, "isSiriEnabled"));
  v13 = (id)objc_msgSend(v3, "combineBool:", -[WFAutoShortcutsPreferences isSpotlightEnabled](self, "isSpotlightEnabled"));
  v14 = objc_msgSend(v3, "finalize");

  return v14;
}

- (INAppDescriptor)appDescriptor
{
  return self->_appDescriptor;
}

- (void)setAppDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptor, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (BOOL)isSiriEnabled
{
  return self->_isSiriEnabled;
}

- (void)setIsSiriEnabled:(BOOL)a3
{
  self->_isSiriEnabled = a3;
}

- (BOOL)isSpotlightEnabled
{
  return self->_isSpotlightEnabled;
}

- (void)setIsSpotlightEnabled:(BOOL)a3
{
  self->_isSpotlightEnabled = a3;
}

- (NSSet)disabledAutoShortcuts
{
  return self->_disabledAutoShortcuts;
}

- (void)setDisabledAutoShortcuts:(id)a3
{
  objc_storeStrong((id *)&self->_disabledAutoShortcuts, a3);
}

- (NSData)cloudKitMetadata
{
  return self->_cloudKitMetadata;
}

- (void)setCloudKitMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitMetadata, a3);
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitMetadata, 0);
  objc_storeStrong((id *)&self->_disabledAutoShortcuts, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
}

+ (id)defaultSettingsForAppDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple."));

  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(v8, "initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:", v4, v7, 1, v9, 0, 0x7FFFFFFFFFFFFFFFLL);

  return v10;
}

+ (id)appDescriptorWithBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithApplicationRecord:", v5);
  return v6;
}

+ (int)crossPlatformHashForAppDescriptor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAutoShortcutsPreferences.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appDescriptor"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "applicationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("CFBundleDisplayName"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("CFBundleName"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(v5, "teamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  v13 = (id)objc_msgSend(v6, "combineInteger:", v10);
  v14 = (id)objc_msgSend(v6, "combineInteger:", v12);
  LODWORD(v10) = objc_msgSend(v6, "finalize");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
