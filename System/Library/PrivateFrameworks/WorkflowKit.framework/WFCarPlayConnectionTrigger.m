@implementation WFCarPlayConnectionTrigger

- (WFCarPlayConnectionTrigger)init
{
  WFCarPlayConnectionTrigger *v2;
  WFCarPlayConnectionTrigger *v3;
  WFCarPlayConnectionTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCarPlayConnectionTrigger;
  v2 = -[WFTrigger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_onConnect = 1;
    v2->_onDisconnect = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  return -[WFCarPlayConnectionTrigger onConnect](self, "onConnect")
      || -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFCarPlayConnectionTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFCarPlayConnectionTrigger onConnect](self, "onConnect")
    && -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("When CarPlay connects or disconnects");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFCarPlayConnectionTrigger onConnect](self, "onConnect"))
  {
    v3 = CFSTR("When CarPlay connects");
    goto LABEL_8;
  }
  if (-[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("When CarPlay disconnects");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFCarPlayConnectionTrigger localizedDescriptionWithConfigurationSummary]";
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
  WFCarPlayConnectionTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFCarPlayConnectionTrigger onConnect](self, "onConnect")
    && -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("CarPlay connected or disconnected");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFCarPlayConnectionTrigger onConnect](self, "onConnect"))
  {
    v3 = CFSTR("CarPlay connected");
    goto LABEL_8;
  }
  if (-[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("CarPlay disconnected");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFCarPlayConnectionTrigger localizedPastTenseDescription]";
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
  v7.super_class = (Class)WFCarPlayConnectionTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFCarPlayConnectionTrigger onConnect](self, "onConnect", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onConnect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisconnect"));

}

- (WFCarPlayConnectionTrigger)initWithCoder:(id)a3
{
  id v4;
  WFCarPlayConnectionTrigger *v5;
  void *v6;
  void *v7;
  WFCarPlayConnectionTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCarPlayConnectionTrigger;
  v5 = -[WFTrigger initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onConnect"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onConnect = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onDisconnect"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onDisconnect = objc_msgSend(v7, "BOOLValue");

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCarPlayConnectionTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnConnect:", -[WFCarPlayConnectionTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DC10, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)onConnect
{
  return self->_onConnect;
}

- (void)setOnConnect:(BOOL)a3
{
  self->_onConnect = a3;
}

- (BOOL)onDisconnect
{
  return self->_onDisconnect;
}

- (void)setOnDisconnect:(BOOL)a3
{
  self->_onDisconnect = a3;
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
  return MGGetBoolAnswer();
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("CarPlay"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When CarPlay connects”"));
}

+ (id)displayGlyphName
{
  return CFSTR("carplay");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)onIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("carplay"), 0);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("xmark.circle"), 0);
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Connects"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Disconnects"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
