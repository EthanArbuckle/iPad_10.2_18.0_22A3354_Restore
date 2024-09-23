@implementation WFAirplaneModeTrigger

- (WFAirplaneModeTrigger)init
{
  WFAirplaneModeTrigger *v2;
  WFAirplaneModeTrigger *v3;
  WFAirplaneModeTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAirplaneModeTrigger;
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
  return -[WFAirplaneModeTrigger onEnable](self, "onEnable") || -[WFAirplaneModeTrigger onDisable](self, "onDisable");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFAirplaneModeTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFAirplaneModeTrigger onEnable](self, "onEnable") && -[WFAirplaneModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Airplane Mode is turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFAirplaneModeTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("When Airplane Mode is turned on");
    goto LABEL_8;
  }
  if (-[WFAirplaneModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Airplane Mode is turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFAirplaneModeTrigger localizedDescriptionWithConfigurationSummary]";
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
  WFAirplaneModeTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFAirplaneModeTrigger onEnable](self, "onEnable") && -[WFAirplaneModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Airplane Mode turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFAirplaneModeTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("Airplane Mode turned on");
    goto LABEL_8;
  }
  if (-[WFAirplaneModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Airplane Mode turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFAirplaneModeTrigger localizedPastTenseDescription]";
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
  v7.super_class = (Class)WFAirplaneModeTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFAirplaneModeTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onEnable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFAirplaneModeTrigger onDisable](self, "onDisable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisable"));

}

- (WFAirplaneModeTrigger)initWithCoder:(id)a3
{
  id v4;
  WFAirplaneModeTrigger *v5;
  void *v6;
  void *v7;
  WFAirplaneModeTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAirplaneModeTrigger;
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
  v6.super_class = (Class)WFAirplaneModeTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnEnable:", -[WFAirplaneModeTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFAirplaneModeTrigger onDisable](self, "onDisable"));
  return v4;
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

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Airplane Mode"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When Airplane Mode is turned on”"));
}

+ (id)displayGlyphName
{
  return CFSTR("airplane.circle.fill");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)onIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("airplane.circle.fill"), 2);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("airplane.circle"), 2);
}

+ (id)tintColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79F8]), "initWithRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0);
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Is Turned On"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Is Turned Off"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
