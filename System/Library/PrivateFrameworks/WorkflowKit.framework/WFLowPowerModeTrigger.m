@implementation WFLowPowerModeTrigger

- (WFLowPowerModeTrigger)init
{
  WFLowPowerModeTrigger *v2;
  WFLowPowerModeTrigger *v3;
  WFLowPowerModeTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFLowPowerModeTrigger;
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
  return -[WFLowPowerModeTrigger onEnable](self, "onEnable") || -[WFLowPowerModeTrigger onDisable](self, "onDisable");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFLowPowerModeTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFLowPowerModeTrigger onEnable](self, "onEnable") && -[WFLowPowerModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Low Power Mode is turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFLowPowerModeTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("When Low Power Mode is turned on");
    goto LABEL_8;
  }
  if (-[WFLowPowerModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("When Low Power Mode is turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFLowPowerModeTrigger localizedDescriptionWithConfigurationSummary]";
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
  WFLowPowerModeTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFLowPowerModeTrigger onEnable](self, "onEnable") && -[WFLowPowerModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Low Power Mode turned on or off");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFLowPowerModeTrigger onEnable](self, "onEnable"))
  {
    v3 = CFSTR("Low Power Mode turned on");
    goto LABEL_8;
  }
  if (-[WFLowPowerModeTrigger onDisable](self, "onDisable"))
  {
    v3 = CFSTR("Low Power Mode turned off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFLowPowerModeTrigger localizedPastTenseDescription]";
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
  v7.super_class = (Class)WFLowPowerModeTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFLowPowerModeTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onEnable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFLowPowerModeTrigger onDisable](self, "onDisable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisable"));

}

- (WFLowPowerModeTrigger)initWithCoder:(id)a3
{
  id v4;
  WFLowPowerModeTrigger *v5;
  void *v6;
  void *v7;
  WFLowPowerModeTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLowPowerModeTrigger;
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
  v6.super_class = (Class)WFLowPowerModeTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnEnable:", -[WFLowPowerModeTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFLowPowerModeTrigger onDisable](self, "onDisable"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DB38, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  return MGGetBoolAnswer();
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Low Power Mode"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When Low Power Mode is turned off”"));
}

+ (id)displayGlyphName
{
  return CFSTR("battery.25");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)onIcon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a1, "yellowBatteryHierarchicalColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("battery.25"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)offIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC79F8], "batteryOutlineColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("battery.25"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

+ (id)yellowBatteryHierarchicalColors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 1.0, 0.792156875, 0.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC79F8], "batteryOutlineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
