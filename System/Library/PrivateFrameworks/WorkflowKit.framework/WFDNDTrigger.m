@implementation WFDNDTrigger

- (WFDNDTrigger)init
{
  WFDNDTrigger *v2;
  WFDNDTrigger *v3;
  WFDNDTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDNDTrigger;
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
  return -[WFDNDTrigger onEnable](self, "onEnable") || -[WFDNDTrigger onDisable](self, "onDisable");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFDNDTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFDNDTrigger onEnable](self, "onEnable") && -[WFDNDTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Do Not Disturb is turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFDNDTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("When Do Not Disturb is turned on");
    goto LABEL_8;
  }
  if (-[WFDNDTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Do Not Disturb is turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFDNDTrigger localizedDescriptionWithConfigurationSummary]";
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
  WFDNDTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFDNDTrigger onEnable](self, "onEnable") && -[WFDNDTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Do Not Disturb turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFDNDTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("Do Not Disturb turned on");
    goto LABEL_8;
  }
  if (-[WFDNDTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Do Not Disturb turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFDNDTrigger localizedPastTenseDescription]";
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
  v7.super_class = (Class)WFDNDTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFDNDTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onEnable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFDNDTrigger onDisable](self, "onDisable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisable"));

}

- (WFDNDTrigger)initWithCoder:(id)a3
{
  id v4;
  WFDNDTrigger *v5;
  void *v6;
  void *v7;
  WFDNDTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDNDTrigger;
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
  v6.super_class = (Class)WFDNDTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnEnable:", -[WFDNDTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFDNDTrigger onDisable](self, "onDisable"));
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
  return WFLocalizedString(CFSTR("Do Not Disturb"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When Do Not Disturb is turned on”"));
}

+ (id)displayGlyphName
{
  return CFSTR("moon.circle.fill");
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)onIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("moon.circle.fill"), 0);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("moon.circle"), 0);
}

+ (id)tintColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79F8]), "initWithRed:green:blue:alpha:", 0.345098039, 0.337254902, 0.839215686, 1.0);
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
