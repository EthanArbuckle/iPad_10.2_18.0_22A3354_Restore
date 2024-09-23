@implementation WFWifiTrigger

- (WFWifiTrigger)init
{
  WFWifiTrigger *v2;
  WFWifiTrigger *v3;
  NSArray *selectedNetworks;
  WFWifiTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWifiTrigger;
  v2 = -[WFTrigger init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    selectedNetworks = v2->_selectedNetworks;
    v2->_selectedNetworks = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_selection = 1;
    v3->_onConnect = 1;
    v5 = v3;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  void *v3;
  BOOL v4;
  BOOL v5;

  -[WFWifiTrigger selectedNetworks](self, "selectedNetworks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[WFWifiTrigger selection](self, "selection") == 0;

  v5 = -[WFWifiTrigger onConnect](self, "onConnect") || -[WFWifiTrigger onDisconnect](self, "onDisconnect");
  return v4 && v5;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[WFWifiTrigger selection](self, "selection"))
  {
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasCapability:", *MEMORY[0x1E0DC80E8]);

    v13 = -[WFWifiTrigger onConnect](self, "onConnect");
    if (v12)
    {
      if (v13 && -[WFWifiTrigger onDisconnect](self, "onDisconnect"))
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("When %@ joins or leaves any WLAN network");
      }
      else if (-[WFWifiTrigger onConnect](self, "onConnect"))
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("When %@ joins any WLAN network");
      }
      else
      {
        if (!-[WFWifiTrigger onDisconnect](self, "onDisconnect"))
          goto LABEL_46;
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("When %@ leaves any WLAN network");
      }
    }
    else if (v13 && -[WFWifiTrigger onDisconnect](self, "onDisconnect"))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("When %@ joins or leaves any Wi-Fi network");
    }
    else if (-[WFWifiTrigger onConnect](self, "onConnect"))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("When %@ joins any Wi-Fi network");
    }
    else
    {
      if (!-[WFWifiTrigger onDisconnect](self, "onDisconnect"))
        goto LABEL_46;
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("When %@ leaves any Wi-Fi network");
    }
    WFLocalizedString(v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v8, v4);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  -[WFWifiTrigger selectedNetworks](self, "selectedNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasCapability:", *MEMORY[0x1E0DC80E8]);

    v18 = -[WFWifiTrigger onConnect](self, "onConnect");
    if (v17)
    {
      if (v18 && -[WFWifiTrigger onDisconnect](self, "onDisconnect"))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = CFSTR("When %2$@ joins or leaves any of %1$lu WLAN networks");
LABEL_43:
        WFLocalizedPluralString(v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWifiTrigger selectedNetworks](self, "selectedNetworks");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringWithFormat:", v8, objc_msgSend(v23, "count"), v4);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_44;
      }
      if (-[WFWifiTrigger onConnect](self, "onConnect"))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = CFSTR("When %2$@ joins any of %1$lu WLAN networks");
        goto LABEL_43;
      }
      if (-[WFWifiTrigger onDisconnect](self, "onDisconnect"))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = CFSTR("When %2$@ leaves any of %1$lu WLAN networks");
        goto LABEL_43;
      }
    }
    else
    {
      if (v18 && -[WFWifiTrigger onDisconnect](self, "onDisconnect"))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = CFSTR("When %2$@ joins or leaves any of %1$lu Wi-Fi networks");
        goto LABEL_43;
      }
      if (-[WFWifiTrigger onConnect](self, "onConnect"))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = CFSTR("When %2$@ joins any of %1$lu Wi-Fi networks");
        goto LABEL_43;
      }
      if (-[WFWifiTrigger onDisconnect](self, "onDisconnect"))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = CFSTR("When %2$@ leaves any of %1$lu Wi-Fi networks");
        goto LABEL_43;
      }
    }
LABEL_46:
    v22 = &stru_1E7AFA810;
    goto LABEL_45;
  }
  -[WFWifiTrigger selectedNetworks](self, "selectedNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFWifiTrigger onConnect](self, "onConnect") && -[WFWifiTrigger onDisconnect](self, "onDisconnect"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = CFSTR("When %1$@ joins or leaves “%2$@”");
  }
  else if (-[WFWifiTrigger onConnect](self, "onConnect"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = CFSTR("When %1$@ joins “%2$@”");
  }
  else
  {
    if (!-[WFWifiTrigger onDisconnect](self, "onDisconnect"))
    {
      v22 = &stru_1E7AFA810;
      goto LABEL_44;
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = CFSTR("When %1$@ leaves “%2$@”");
  }
  WFLocalizedString(v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v21, v4, v8);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_44:
LABEL_45:

  return v22;
}

- (id)localizedPastTenseDescription
{
  return &stru_1E7AFA810;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWifiTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFWifiTrigger selectedNetworks](self, "selectedNetworks", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedNetworks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFWifiTrigger selection](self, "selection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selection"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWifiTrigger onConnect](self, "onConnect"), CFSTR("onConnect"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWifiTrigger onDisconnect](self, "onDisconnect"), CFSTR("onDisconnect"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWifiTrigger runAfterConnectionInterruption](self, "runAfterConnectionInterruption"), CFSTR("runAfterConnectionInterruption"));

}

- (WFWifiTrigger)initWithCoder:(id)a3
{
  id v4;
  WFWifiTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *selectedNetworks;
  void *v11;
  void *v12;
  uint64_t v13;
  WFWifiTrigger *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFWifiTrigger;
  v5 = -[WFTrigger initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("selectedNetworks"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedNetworks = v5->_selectedNetworks;
    v5->_selectedNetworks = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "unsignedIntegerValue");
    else
      v13 = 1;
    v5->_selection = v13;
    v5->_onConnect = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onConnect"));
    v5->_onDisconnect = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onDisconnect"));
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("runAfterConnectionInterruption")) & 1) != 0)
      v5->_runAfterConnectionInterruption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("runAfterConnectionInterruption"));
    else
      v5->_runAfterConnectionInterruption = 1;
    v14 = v5;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWifiTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[WFWifiTrigger selectedNetworks](self, "selectedNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedNetworks:", v6);

  objc_msgSend(v4, "setSelection:", -[WFWifiTrigger selection](self, "selection"));
  objc_msgSend(v4, "setOnConnect:", -[WFWifiTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFWifiTrigger onDisconnect](self, "onDisconnect"));
  objc_msgSend(v4, "setRunAfterConnectionInterruption:", -[WFWifiTrigger runAfterConnectionInterruption](self, "runAfterConnectionInterruption"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("ShowWhenRun");
  v10[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.sendmessage"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DB80, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "arrayByAddingObject:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (NSArray)selectedNetworks
{
  return self->_selectedNetworks;
}

- (void)setSelectedNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_selectedNetworks, a3);
}

- (unint64_t)selection
{
  return self->_selection;
}

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
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

- (BOOL)runAfterConnectionInterruption
{
  return self->_runAfterConnectionInterruption;
}

- (void)setRunAfterConnectionInterruption:(BOOL)a3
{
  self->_runAfterConnectionInterruption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedNetworks, 0);
}

+ (id)localizedDisplayName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedWiFiDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedDisplayExplanation
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasCapability:", *MEMORY[0x1E0DC80E8]);

  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
    v7 = CFSTR("Ex. “When my %@ joins home WLAN”");
  else
    v7 = CFSTR("Ex. “When my %@ joins home Wi-Fi”");
  WFLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)displayGlyphName
{
  return CFSTR("wifi");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (BOOL)requiresNotification
{
  return 1;
}

+ (id)onIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("wifi.circle.fill"), 2);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("wifi.circle"), 2);
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Network Joined"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Network Left"));
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
