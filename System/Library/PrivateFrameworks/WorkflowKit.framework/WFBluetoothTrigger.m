@implementation WFBluetoothTrigger

- (WFBluetoothTrigger)init
{
  WFBluetoothTrigger *v2;
  WFBluetoothTrigger *v3;
  NSArray *selectedDevices;
  WFBluetoothTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFBluetoothTrigger;
  v2 = -[WFTrigger init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    selectedDevices = v2->_selectedDevices;
    v2->_selectedDevices = (NSArray *)MEMORY[0x1E0C9AA60];

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

  -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[WFBluetoothTrigger selection](self, "selection") == 0;

  v5 = -[WFBluetoothTrigger onConnect](self, "onConnect") || -[WFBluetoothTrigger onDisconnect](self, "onDisconnect");
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
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[WFBluetoothTrigger selection](self, "selection"))
  {
    if (-[WFBluetoothTrigger onConnect](self, "onConnect") && -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = CFSTR("When %1$@ is connected or disconnected from any Bluetooth device");
    }
    else if (-[WFBluetoothTrigger onConnect](self, "onConnect"))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = CFSTR("When %1$@ is connected to any Bluetooth device");
    }
    else
    {
      if (!-[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
        goto LABEL_27;
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = CFSTR("When %1$@ is disconnected from any Bluetooth device");
    }
    WFLocalizedString(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v8, v4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WFBluetoothTrigger onConnect](self, "onConnect") && -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("When %1$@ is connected or disconnected from “%2$@”");
    }
    else if (-[WFBluetoothTrigger onConnect](self, "onConnect"))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("When %1$@ is connected to “%2$@”");
    }
    else
    {
      if (!-[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
      {
        v15 = &stru_1E7AFA810;
        goto LABEL_29;
      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = CFSTR("When %1$@ is disconnected from “%2$@”");
    }
    WFLocalizedString(v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v16, v4, v8);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_29:
    goto LABEL_30;
  }
  if (-[WFBluetoothTrigger onConnect](self, "onConnect") && -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = CFSTR("When %2$@ is connected or disconnected from any of %1$lu Bluetooth devices");
LABEL_26:
    WFLocalizedPluralString(v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v8, objc_msgSend(v17, "count"), v4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  if (-[WFBluetoothTrigger onConnect](self, "onConnect"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = CFSTR("When %2$@ is connected to any of %1$lu Bluetooth devices");
    goto LABEL_26;
  }
  if (-[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = CFSTR("When %2$@ is disconnected from any of %1$lu Bluetooth devices");
    goto LABEL_26;
  }
LABEL_27:
  v15 = &stru_1E7AFA810;
LABEL_30:

  return v15;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFBluetoothTrigger selection](self, "selection")
    && (-[WFBluetoothTrigger selection](self, "selection") != 1
     || (-[WFBluetoothTrigger selectedDevices](self, "selectedDevices"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = objc_msgSend(v5, "count"),
         v5,
         v6 < 2)))
  {
    -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 == 1)
    {
      -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[WFBluetoothTrigger onConnect](self, "onConnect")
        && -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = CFSTR("%1$@ connected or disconnected from “%2$@”");
      }
      else if (-[WFBluetoothTrigger onConnect](self, "onConnect"))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = CFSTR("%1$@ connected to “%2$@”");
      }
      else
      {
        if (!-[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
        {
          v15 = &stru_1E7AFA810;
          goto LABEL_22;
        }
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = CFSTR("%1$@ disconnected from “%2$@”");
      }
      WFLocalizedString(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v16, v4, v12);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      goto LABEL_23;
    }
  }
  else
  {
    if (-[WFBluetoothTrigger onConnect](self, "onConnect") && -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = CFSTR("%1$@ connected or disconnected from Bluetooth device");
LABEL_15:
      WFLocalizedString(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v12, v4);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (-[WFBluetoothTrigger onConnect](self, "onConnect"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = CFSTR("%1$@ connected to Bluetooth device");
      goto LABEL_15;
    }
    if (-[WFBluetoothTrigger onDisconnect](self, "onDisconnect"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = CFSTR("%1$@ disconnected from Bluetooth device");
      goto LABEL_15;
    }
  }
  v15 = &stru_1E7AFA810;
LABEL_23:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFBluetoothTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[WFBluetoothTrigger selectedDevices](self, "selectedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedDevices:", v6);

  objc_msgSend(v4, "setSelection:", -[WFBluetoothTrigger selection](self, "selection"));
  objc_msgSend(v4, "setOnConnect:", -[WFBluetoothTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFBluetoothTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFBluetoothTrigger selectedDevices](self, "selectedDevices", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFBluetoothTrigger selection](self, "selection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selection"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFBluetoothTrigger onConnect](self, "onConnect"), CFSTR("onConnect"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"), CFSTR("onDisconnect"));

}

- (WFBluetoothTrigger)initWithCoder:(id)a3
{
  id v4;
  WFBluetoothTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *selectedDevices;
  void *v11;
  void *v12;
  uint64_t v13;
  WFBluetoothTrigger *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFBluetoothTrigger;
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("selectedDevices"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedDevices = v5->_selectedDevices;
    v5->_selectedDevices = (NSArray *)v9;

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
    if (!-[WFBluetoothTrigger onConnect](v5, "onConnect") && !-[WFBluetoothTrigger onDisconnect](v5, "onDisconnect"))
      v5->_onConnect = 1;
    v14 = v5;

  }
  return v5;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DAF0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDevices, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDevices, 0);
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Bluetooth"));
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
  WFLocalizedString(CFSTR("Ex. “When my %@ connects to AirPods”"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayGlyphName
{
  return CFSTR("bluetooth");
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
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("bluetooth.circle.fill"), 2);
}

+ (id)offIcon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "triggerConfigurationSymbolNamed:renderingMode:", CFSTR("bluetooth.circle"), 2);
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Is Connected"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Is Disconnected"));
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
