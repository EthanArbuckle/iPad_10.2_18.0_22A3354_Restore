@implementation WFStageManagerTrigger

- (WFStageManagerTrigger)init
{
  WFStageManagerTrigger *v2;
  WFStageManagerTrigger *v3;
  WFStageManagerTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFStageManagerTrigger;
  v2 = -[WFTrigger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_onEnable = 1;
    v2->_onDisable = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  return -[WFStageManagerTrigger onEnable](self, "onEnable") || -[WFStageManagerTrigger onDisable](self, "onDisable");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFStageManagerTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFStageManagerTrigger onEnable](self, "onEnable") && -[WFStageManagerTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Stage Manager is turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFStageManagerTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("When Stage Manager is turned on");
    goto LABEL_8;
  }
  if (-[WFStageManagerTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Stage Manager is turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFStageManagerTrigger localizedDescriptionWithConfigurationSummary]";
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
  WFStageManagerTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFStageManagerTrigger onEnable](self, "onEnable") && -[WFStageManagerTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Stage Manager turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFStageManagerTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("Stage Manager turned on");
    goto LABEL_8;
  }
  if (-[WFStageManagerTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Stage Manager turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFStageManagerTrigger localizedPastTenseDescription]";
    v8 = 2114;
    v9 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFStageManagerTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFStageManagerTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onEnable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFStageManagerTrigger onDisable](self, "onDisable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisable"));

}

- (WFStageManagerTrigger)initWithCoder:(id)a3
{
  id v4;
  WFStageManagerTrigger *v5;
  void *v6;
  void *v7;
  WFStageManagerTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFStageManagerTrigger;
  v5 = -[WFTrigger initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onEnable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onEnable = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onDisable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onDisable = objc_msgSend(v7, "BOOLValue");

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFStageManagerTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnEnable:", -[WFStageManagerTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFStageManagerTrigger onDisable](self, "onDisable"));
  return v4;
}

- (id)suggestedActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)onEnable
{
  return self->_onEnable;
}

- (void)setOnEnable:(BOOL)a3
{
  self->_onEnable = a3;
}

- (BOOL)onDisable
{
  return self->_onDisable;
}

- (void)setOnDisable:(BOOL)a3
{
  self->_onDisable = a3;
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
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapability:", *MEMORY[0x1E0DC80E0]);

  return v3;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Stage Manager"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When Stage Manager is turned on”"));
}

+ (id)displayGlyphName
{
  return CFSTR("squares.leading.rectangle");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)onIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("squares.leading.rectangle.fill"), 0);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("squares.leading.rectangle"), 0);
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Is Turned On"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Is Turned Off"));
}

+ (id)tintColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79F8]), "initWithSystemColor:", 4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
