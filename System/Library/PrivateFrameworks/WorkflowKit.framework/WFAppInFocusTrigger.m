@implementation WFAppInFocusTrigger

- (WFAppInFocusTrigger)init
{
  WFAppInFocusTrigger *v2;
  uint64_t v3;
  NSArray *selectedBundleIdentifiers;
  WFAppInFocusTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFAppInFocusTrigger;
  v2 = -[WFTrigger init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    selectedBundleIdentifiers = v2->_selectedBundleIdentifiers;
    v2->_selectedBundleIdentifiers = (NSArray *)v3;

    v2->_onFocus = 1;
    v5 = v2;
  }

  return v2;
}

- (BOOL)hasValidConfiguration
{
  void *v3;
  BOOL v4;

  -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = -[WFAppInFocusTrigger onFocus](self, "onFocus") || -[WFAppInFocusTrigger onBackground](self, "onBackground");
  else
    v4 = 0;

  return v4;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  NSObject *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  WFAppInFocusTrigger *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, 0);

    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFAppInFocusTrigger onFocus](self, "onFocus") && -[WFAppInFocusTrigger onBackground](self, "onBackground"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("When “%@” is opened or closed");
    }
    else if (-[WFAppInFocusTrigger onFocus](self, "onFocus"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("When “%@” is opened");
    }
    else
    {
      if (!-[WFAppInFocusTrigger onBackground](self, "onBackground"))
      {
        getWFTriggersLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[WFAppInFocusTrigger localizedDescriptionWithConfigurationSummary]";
          v23 = 2114;
          v24 = self;
          _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
        }

        v15 = &stru_1E7AFA810;
        goto LABEL_15;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("When “%@” is closed");
    }
    WFLocalizedString(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v14, v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    return v15;
  }
  if (-[WFAppInFocusTrigger onFocus](self, "onFocus") && -[WFAppInFocusTrigger onBackground](self, "onBackground"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("When any of %lu apps are opened or closed");
LABEL_18:
    WFLocalizedPluralString(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  if (-[WFAppInFocusTrigger onFocus](self, "onFocus"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("When any of %lu apps are opened");
    goto LABEL_18;
  }
  if (-[WFAppInFocusTrigger onBackground](self, "onBackground"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("When any of %lu apps are closed");
    goto LABEL_18;
  }
  getWFTriggersLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFAppInFocusTrigger localizedDescriptionWithConfigurationSummary]";
    v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  NSObject *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  WFAppInFocusTrigger *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, 0);

    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFAppInFocusTrigger onFocus](self, "onFocus") && -[WFAppInFocusTrigger onBackground](self, "onBackground"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("Opened or closed “%@”");
    }
    else if (-[WFAppInFocusTrigger onFocus](self, "onFocus"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("Opened “%@”");
    }
    else
    {
      if (!-[WFAppInFocusTrigger onBackground](self, "onBackground"))
      {
        getWFTriggersLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[WFAppInFocusTrigger localizedPastTenseDescription]";
          v23 = 2114;
          v24 = self;
          _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
        }

        v15 = &stru_1E7AFA810;
        goto LABEL_15;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("Closed “%@”");
    }
    WFLocalizedString(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v14, v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    return v15;
  }
  if (-[WFAppInFocusTrigger onFocus](self, "onFocus") && -[WFAppInFocusTrigger onBackground](self, "onBackground"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("Opened or closed any of %lu apps");
LABEL_18:
    WFLocalizedString(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  if (-[WFAppInFocusTrigger onFocus](self, "onFocus"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("Opened any of %lu apps");
    goto LABEL_18;
  }
  if (-[WFAppInFocusTrigger onBackground](self, "onBackground"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("Closed any of %lu apps");
    goto LABEL_18;
  }
  getWFTriggersLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFAppInFocusTrigger localizedPastTenseDescription]";
    v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAppInFocusTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appIdentifiers"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAppInFocusTrigger onFocus](self, "onFocus"), CFSTR("onFocus"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFAppInFocusTrigger onBackground](self, "onBackground"), CFSTR("onBackground"));

}

- (WFAppInFocusTrigger)initWithCoder:(id)a3
{
  id v4;
  WFAppInFocusTrigger *v5;
  WFAppInFocusTrigger *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  WFAppInFocusTrigger *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)WFAppInFocusTrigger;
  v5 = -[WFTrigger initWithCoder:](&v34, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_17;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  -[WFAppInFocusTrigger setSelectedBundleIdentifiers:](v5, "setSelectedBundleIdentifiers:", MEMORY[0x1E0C9AA60]);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("appIdentifiers")))
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("appIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = v11;
    else
      v13 = (uint64_t)v7;
    -[WFAppInFocusTrigger setSelectedBundleIdentifiers:](v6, "setSelectedBundleIdentifiers:", v13);

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("apps")))
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("apps"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v7;
    v20 = v19;

    objc_msgSend(v20, "if_compactMap:", &__block_literal_global_10241);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAppInFocusTrigger setSelectedBundleIdentifiers:](v6, "setSelectedBundleIdentifiers:", v9);
    goto LABEL_12;
  }
LABEL_13:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("onFocus")))
  {
    -[WFAppInFocusTrigger setOnFocus:](v6, "setOnFocus:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onFocus")));
    v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onBackground"));
  }
  else
  {
    -[WFAppInFocusTrigger setOnFocus:](v6, "setOnFocus:", 1);
    v21 = 0;
  }
  -[WFAppInFocusTrigger setOnBackground:](v6, "setOnBackground:", v21);
  -[WFAppInFocusTrigger selectedBundleIdentifiers](v6, "selectedBundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "if_objectsPassingTest:", &__block_literal_global_189);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_opt_new();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __37__WFAppInFocusTrigger_initWithCoder___block_invoke_3;
  v32 = &unk_1E7AF9D28;
  v33 = v24;
  v25 = v24;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", &v29);
  objc_msgSend(v25, "allObjects", v29, v30, v31, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppInFocusTrigger setSelectedBundleIdentifiers:](v6, "setSelectedBundleIdentifiers:", v26);

  v27 = v6;
LABEL_17:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAppInFocusTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[WFAppInFocusTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedBundleIdentifiers:", v6);

  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8D370, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)selectedBundleIdentifiers
{
  return self->_selectedBundleIdentifiers;
}

- (void)setSelectedBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)onFocus
{
  return self->_onFocus;
}

- (void)setOnFocus:(BOOL)a3
{
  self->_onFocus = a3;
}

- (BOOL)onBackground
{
  return self->_onBackground;
}

- (void)setOnBackground:(BOOL)a3
{
  self->_onBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedBundleIdentifiers, 0);
}

void __37__WFAppInFocusTrigger_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
  objc_msgSend(v3, "applicationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInstalled");

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __37__WFAppInFocusTrigger_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0DC7FD8]) ^ 1;
}

uint64_t __37__WFAppInFocusTrigger_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (BOOL)isUserInitiated
{
  return 1;
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("App"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When “Weather” is opened or closed”"));
}

+ (id)displayGlyphName
{
  return CFSTR("arrow.up.forward.app.fill");
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)onIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("arrow.up.forward.app.fill"), 0);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("xmark.app.fill"), 0);
}

+ (id)tintColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC79F8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNamed:inBundle:", CFSTR("AppTriggerIconColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Is Opened"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Is Closed"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
