@implementation WFBatteryLevelTrigger

- (WFBatteryLevelTrigger)init
{
  WFBatteryLevelTrigger *v2;
  WFBatteryLevelTrigger *v3;
  WFBatteryLevelTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFBatteryLevelTrigger;
  v2 = -[WFTrigger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_level = 50;
    v2->_selection = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  -[WFBatteryLevelTrigger level](self, "level");
  return -[WFBatteryLevelTrigger level](self, "level") < 0x65;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  WFBatteryLevelTrigger *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37F0];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v5 = (float)-[WFBatteryLevelTrigger level](self, "level") / 100.0;
  objc_msgSend(v4, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFBatteryLevelTrigger selection](self, "selection");
  switch(v8)
  {
    case 2uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("When battery level falls below %@");
      goto LABEL_7;
    case 1uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("When battery level rises above %@");
      goto LABEL_7;
    case 0uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("When battery level is %@");
LABEL_7:
      WFLocalizedString(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v11, v7);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
  }
  getWFTriggersLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFBatteryLevelTrigger localizedDescriptionWithConfigurationSummary]";
    v17 = 2114;
    v18 = self;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v12 = &stru_1E7AFA810;
LABEL_11:

  return v12;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  WFBatteryLevelTrigger *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37F0];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v5 = (float)-[WFBatteryLevelTrigger level](self, "level") / 100.0;
  objc_msgSend(v4, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFBatteryLevelTrigger selection](self, "selection");
  switch(v8)
  {
    case 2uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("Battery level fell below %@");
      goto LABEL_7;
    case 1uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("Battery level rose above %@");
      goto LABEL_7;
    case 0uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("Battery level reached %@");
LABEL_7:
      WFLocalizedString(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v11, v7);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
  }
  getWFTriggersLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFBatteryLevelTrigger localizedPastTenseDescription]";
    v17 = 2114;
    v18 = self;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v12 = &stru_1E7AFA810;
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFBatteryLevelTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFBatteryLevelTrigger level](self, "level", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("level"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFBatteryLevelTrigger selection](self, "selection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selection"));

}

- (WFBatteryLevelTrigger)initWithCoder:(id)a3
{
  id v4;
  WFBatteryLevelTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFBatteryLevelTrigger *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFBatteryLevelTrigger;
  v5 = -[WFTrigger initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("level"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v8 = 50;
    -[WFBatteryLevelTrigger setLevel:](v5, "setLevel:", v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBatteryLevelTrigger setSelection:](v5, "setSelection:", objc_msgSend(v9, "unsignedIntegerValue"));
    v10 = v5;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFBatteryLevelTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setLevel:", -[WFBatteryLevelTrigger level](self, "level"));
  objc_msgSend(v4, "setSelection:", -[WFBatteryLevelTrigger selection](self, "selection"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8D9D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (unint64_t)selection
{
  return self->_selection;
}

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Battery Level"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When battery level rises above 50%”"));
}

+ (id)displayGlyphName
{
  return CFSTR("battery.75");
}

+ (id)displayGlyphHierarchicalColors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC79F8], "batteryOutlineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
