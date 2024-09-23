@implementation WFPlugInTrigger

- (WFPlugInTrigger)init
{
  WFPlugInTrigger *v2;
  WFPlugInTrigger *v3;
  WFPlugInTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPlugInTrigger;
  v2 = -[WFTrigger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_onEnable = 1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  return -[WFPlugInTrigger onEnable](self, "onEnable") || -[WFPlugInTrigger onDisable](self, "onDisable");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  WFPlugInTrigger *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFPlugInTrigger onEnable](self, "onEnable") && -[WFPlugInTrigger onDisable](self, "onDisable"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("When %@ is connected or disconnected from power");
LABEL_8:
    WFLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (-[WFPlugInTrigger onEnable](self, "onEnable"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("When %@ is connected to power");
    goto LABEL_8;
  }
  if (-[WFPlugInTrigger onDisable](self, "onDisable"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("When %@ is disconnected from power");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFPlugInTrigger localizedDescriptionWithConfigurationSummary]";
    v13 = 2114;
    v14 = self;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v8 = &stru_1E7AFA810;
LABEL_9:

  return v8;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  WFPlugInTrigger *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFPlugInTrigger onEnable](self, "onEnable") && -[WFPlugInTrigger onDisable](self, "onDisable"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("%@ connected or disconnected from power");
LABEL_8:
    WFLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (-[WFPlugInTrigger onEnable](self, "onEnable"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("%@ connected to power");
    goto LABEL_8;
  }
  if (-[WFPlugInTrigger onDisable](self, "onDisable"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("%@ disconnected from power");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFPlugInTrigger localizedPastTenseDescription]";
    v13 = 2114;
    v14 = self;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v8 = &stru_1E7AFA810;
LABEL_9:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFPlugInTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[WFPlugInTrigger onEnable](self, "onEnable", v5.receiver, v5.super_class), CFSTR("onEnable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFPlugInTrigger onDisable](self, "onDisable"), CFSTR("onDisable"));

}

- (WFPlugInTrigger)initWithCoder:(id)a3
{
  id v4;
  WFPlugInTrigger *v5;
  int v6;
  uint64_t v7;
  WFPlugInTrigger *v8;
  WFPlugInTrigger *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFPlugInTrigger;
  v5 = -[WFTrigger initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selection")))
    {
      v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("selection"));
      if (v6 == 2)
      {
        -[WFPlugInTrigger setOnEnable:](v5, "setOnEnable:", 1);
      }
      else if (v6 != 1)
      {
        -[WFPlugInTrigger setOnEnable:](v5, "setOnEnable:", 1);
LABEL_10:
        v9 = v5;
        goto LABEL_11;
      }
      v8 = v5;
      v7 = 1;
    }
    else
    {
      -[WFPlugInTrigger setOnEnable:](v5, "setOnEnable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onEnable")));
      v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onDisable"));
      v8 = v5;
    }
    -[WFPlugInTrigger setOnDisable:](v8, "setOnDisable:", v7);
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPlugInTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnEnable:", -[WFPlugInTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFPlugInTrigger onDisable](self, "onDisable"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8D940, 0);
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

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Charger"));
}

+ (id)localizedDisplayExplanation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Ex. “When my %@ connects to power”"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayGlyphName
{
  return CFSTR("battery.100.bolt");
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)onIcon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a1, "pluggedInHierarchicalColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("battery.100.bolt"), v3);
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
  objc_msgSend(v2, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("battery.100"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Is Connected"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Is Disconnected"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pluggedInHierarchicalColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC79F8], "batteryOutlineColor", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 0.298039228, 0.843137264, 0.392156869, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
