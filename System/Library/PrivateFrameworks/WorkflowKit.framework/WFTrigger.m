@implementation WFTrigger

- (WFTrigger)init
{
  WFTrigger *v2;
  WFTrigger *v3;
  WFTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTrigger;
  v2 = -[WFTrigger init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serializedData
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  WFTrigger *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3)
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "-[WFTrigger serializedData]";
      v10 = 2112;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s failed to serialize trigger (%@): %{public}@", buf, 0x20u);
    }

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (id)localizedDisplayName
{
  return (id)objc_msgSend((id)objc_opt_class(), "localizedDisplayName");
}

- (id)localizedDisplayExplanation
{
  return (id)objc_msgSend((id)objc_opt_class(), "localizedDisplayExplanation");
}

- (id)displayGlyphName
{
  return (id)objc_msgSend((id)objc_opt_class(), "displayGlyphName");
}

- (id)displayGlyphHierarchicalColors
{
  return (id)objc_msgSend((id)objc_opt_class(), "displayGlyphHierarchicalColors");
}

- (id)displayGlyph
{
  return (id)objc_msgSend((id)objc_opt_class(), "displayGlyph");
}

- (double)displayGlyphCornerRadius
{
  double result;

  objc_msgSend((id)objc_opt_class(), "displayGlyphCornerRadius");
  return result;
}

- (id)displayGlyphTintColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "displayGlyphTintColor");
}

- (BOOL)hasValidConfiguration
{
  NSObject *v2;
  id v3;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315394;
    v6 = "-[WFTrigger hasValidConfiguration]";
    v7 = 2114;
    v8 = (id)objc_opt_class();
    v3 = v8;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override -hasValidConfiguration (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);

  }
  return 0;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  NSObject *v2;
  id v3;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315394;
    v6 = "-[WFTrigger localizedDescriptionWithConfigurationSummary]";
    v7 = 2114;
    v8 = (id)objc_opt_class();
    v3 = v8;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override -localizedDescriptionWithConfigurationSummary (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "localizedDisplayName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedPastTenseDescription
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  __CFString *v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically");
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "-[WFTrigger localizedPastTenseDescription]";
      v12 = 2114;
      v13 = (id)objc_opt_class();
      v6 = v13;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override -localizedPastTenseDescription (but %{public}@ didn't)", (uint8_t *)&v10, 0x16u);

    }
    -[WFTrigger localizedDescriptionWithConfigurationSummary](self, "localizedDescriptionWithConfigurationSummary");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[WFTrigger localizedPastTenseDescription]";
      v12 = 2112;
      v13 = (id)objc_opt_class();
      v8 = v13;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Shouldn't have used -localizedPastTenseDescription for %@, because it should always ask before running", (uint8_t *)&v10, 0x16u);

    }
    v7 = &stru_1E7AFA810;
  }
  return v7;
}

- (id)suggestedActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (Class)shortcutInputContentItemClass
{
  return 0;
}

+ (id)triggerWithSerializedData:(id)a3
{
  id v3;
  WFTriggerMigrator *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(WFTriggerMigrator);
  v20 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v20);
  v6 = v20;
  objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("LSApplicationProxy"));
  objc_msgSend(v5, "setDelegate:", v4);
  if (!v5)
  {
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "+[WFTrigger triggerWithSerializedData:]";
      v23 = 2112;
      v24 = (uint64_t)v16;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create NSKeyedUnarchiver due to error: %@", buf, 0x16u);

    }
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(v3, "length");
      *(_DWORD *)buf = 136315650;
      v22 = "+[WFTrigger triggerWithSerializedData:]";
      v23 = 2048;
      v24 = v18;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s Failed to unarchive WFTrigger from data (length=%lu) error: %{public}@", buf, 0x20u);
    }

    v11 = 0;
LABEL_10:
    v12 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    v11 = v10;
    v12 = (void *)objc_opt_new();
    -[NSObject region](v11, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRegion:", v13);

    -[NSObject startTime](v11, "startTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStartTime:", v14);

    -[NSObject endTime](v11, "endTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setEndTime:", v15);
  }
  else
  {
    v11 = v10;
    v12 = v11;
  }
LABEL_12:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 0;
}

+ (BOOL)requiresNotification
{
  return 0;
}

+ (BOOL)isUserInitiated
{
  return 0;
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

+ (id)localizedDisplayName
{
  NSObject *v2;
  id v3;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315394;
    v6 = "+[WFTrigger localizedDisplayName]";
    v7 = 2114;
    v8 = (id)objc_opt_class();
    v3 = v8;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override +localizedDisplayName (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);

  }
  return &stru_1E7AFA810;
}

+ (id)localizedDisplayExplanation
{
  NSObject *v2;
  id v3;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315394;
    v6 = "+[WFTrigger localizedDisplayExplanation]";
    v7 = 2114;
    v8 = (id)objc_opt_class();
    v3 = v8;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override +localizedDisplayExplanation (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);

  }
  return &stru_1E7AFA810;
}

+ (id)displayGlyphName
{
  return &stru_1E7AFA810;
}

+ (id)displayGlyphHierarchicalColors
{
  return 0;
}

+ (id)displayGlyph
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "displayGlyphHierarchicalColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a1, "displayGlyphName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "displayGlyphHierarchicalColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerDisplaySymbolNamed:hierarchicalColors:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "triggerDisplaySymbolNamed:renderingMode:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (double)displayGlyphCornerRadius
{
  return 0.0;
}

+ (int64_t)triggerBacking
{
  return 0;
}

+ (id)onIcon
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[WFTrigger onIcon]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

+ (id)offIcon
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[WFTrigger offIcon]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

+ (id)onLabel
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[WFTrigger onLabel]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

+ (id)offLabel
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[WFTrigger offLabel]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

+ (id)displayGlyphTintColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79F8]), "initWithSystemColor:", 4);
}

+ (id)onIconTintColor
{
  return 0;
}

+ (id)offIconTintColor
{
  return 0;
}

+ (id)inputTypeDescriptionForClass:(Class)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTrigger.m"), 238, CFSTR("Class is not of type WFContentItem instead %@"), v11);

  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class())
    || -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[objc_class localizedPluralTypeDescription](a3, "localizedPluralTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[objc_class localizedTypeDescription](a3, "localizedTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "localizedLowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
