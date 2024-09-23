@implementation WFSleepTrigger

- (WFSleepTrigger)init
{
  WFSleepTrigger *v2;
  WFSleepTrigger *v3;
  WFSleepTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSleepTrigger;
  v2 = -[WFTrigger init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)hasValidConfiguration
{
  unint64_t v3;

  if (-[WFSleepTrigger selection](self, "selection"))
  {
    v3 = -[WFSleepTrigger selection](self, "selection");
    if (v3 != 1)
      LOBYTE(v3) = -[WFSleepTrigger selection](self, "selection") == 2;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFSleepTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[WFSleepTrigger selection](self, "selection"))
  {
    v3 = CFSTR("When Wind Down starts");
    goto LABEL_7;
  }
  if (-[WFSleepTrigger selection](self, "selection") == 1)
  {
    v3 = CFSTR("When Bedtime starts");
LABEL_7:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFSleepTrigger selection](self, "selection") == 2)
  {
    v3 = CFSTR("When Waking Up");
    goto LABEL_7;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFSleepTrigger localizedDescriptionWithConfigurationSummary]";
    v8 = 2114;
    v9 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (id)localizedPastTenseDescription
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFSleepTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[WFSleepTrigger selection](self, "selection"))
  {
    v3 = CFSTR("Wind Down started");
    goto LABEL_7;
  }
  if (-[WFSleepTrigger selection](self, "selection") == 1)
  {
    v3 = CFSTR("Bedtime started");
LABEL_7:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFSleepTrigger selection](self, "selection") == 2)
  {
    v3 = CFSTR("Woke Up");
    goto LABEL_7;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFSleepTrigger localizedPastTenseDescription]";
    v8 = 2114;
    v9 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSleepTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFSleepTrigger selection](self, "selection", v5.receiver, v5.super_class), CFSTR("selection"));

}

- (WFSleepTrigger)initWithCoder:(id)a3
{
  id v4;
  WFSleepTrigger *v5;
  WFSleepTrigger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSleepTrigger;
  v5 = -[WFTrigger initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    -[WFSleepTrigger setSelection:](v5, "setSelection:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("selection")));
    v6 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSleepTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSelection:", -[WFSleepTrigger selection](self, "selection"));
  return v4;
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

+ (id)displayGlyphName
{
  return CFSTR("bed.double.fill");
}

+ (id)displayGlyphTintColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC79F8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNamed:inBundle:", CFSTR("SleepTriggerIconColor"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (BOOL)isSupportedOnThisDevice
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom") != 1;

  return v3;
}

+ (id)localizedDisplayName
{
  return WFLocalizedStringWithKey(CFSTR("Sleep trigger name"), CFSTR("Sleep"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When Wind Down starts”"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
