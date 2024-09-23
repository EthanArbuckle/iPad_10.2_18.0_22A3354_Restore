@implementation WFAppInBackgroundTrigger

- (WFAppInBackgroundTrigger)init
{
  WFAppInBackgroundTrigger *v2;
  uint64_t v3;
  NSArray *selectedBundleIdentifiers;
  WFAppInBackgroundTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFAppInBackgroundTrigger;
  v2 = -[WFTrigger init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    selectedBundleIdentifiers = v2->_selectedBundleIdentifiers;
    v2->_selectedBundleIdentifiers = (NSArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)hasValidConfiguration
{
  void *v2;
  BOOL v3;

  -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
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
  void *v11;
  void *v12;
  void *v13;

  -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, 0);

    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("When “%@” is closed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedPluralString(CFSTR("When any of %lu apps is closed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
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
  void *v11;
  void *v12;
  void *v13;

  -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, 0);

    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Closed “%@”"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Closed any of %lu apps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAppInBackgroundTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appIdentifiers"));

}

- (WFAppInBackgroundTrigger)initWithCoder:(id)a3
{
  id v4;
  WFAppInBackgroundTrigger *v5;
  WFAppInBackgroundTrigger *v6;
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
  WFAppInBackgroundTrigger *v21;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFAppInBackgroundTrigger;
  v5 = -[WFTrigger initWithCoder:](&v23, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
    -[WFAppInBackgroundTrigger setSelectedBundleIdentifiers:](v5, "setSelectedBundleIdentifiers:", MEMORY[0x1E0C9AA60]);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("appIdentifiers")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
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
      -[WFAppInBackgroundTrigger setSelectedBundleIdentifiers:](v6, "setSelectedBundleIdentifiers:", v13);

    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("selectedApps")))
      {
LABEL_13:
        v21 = v6;
        goto LABEL_14;
      }
      v14 = (void *)MEMORY[0x1E0C99E60];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("selectedApps"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = v7;
      v20 = v19;

      objc_msgSend(v20, "if_compactMap:", &__block_literal_global_45659);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAppInBackgroundTrigger setSelectedBundleIdentifiers:](v6, "setSelectedBundleIdentifiers:", v9);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  WFAppInFocusTrigger *v4;

  v4 = objc_alloc_init(WFAppInFocusTrigger);
  -[WFAppInFocusTrigger setOnFocus:](v4, "setOnFocus:", 0);
  -[WFAppInFocusTrigger setOnBackground:](v4, "setOnBackground:", 1);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAppInBackgroundTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[WFAppInBackgroundTrigger selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedBundleIdentifiers:", v6);

  return v4;
}

- (NSArray)selectedBundleIdentifiers
{
  return self->_selectedBundleIdentifiers;
}

- (void)setSelectedBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedBundleIdentifiers, 0);
}

uint64_t __42__WFAppInBackgroundTrigger_initWithCoder___block_invoke(uint64_t a1, void *a2)
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

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Close App"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When “Mail” is closed”"));
}

+ (id)displayGlyphName
{
  return CFSTR("xmark.square.fill");
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
