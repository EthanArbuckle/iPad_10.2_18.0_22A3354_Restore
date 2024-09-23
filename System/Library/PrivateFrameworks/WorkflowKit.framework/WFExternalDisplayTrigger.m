@implementation WFExternalDisplayTrigger

- (WFExternalDisplayTrigger)init
{
  WFExternalDisplayTrigger *v2;
  WFExternalDisplayTrigger *v3;
  WFExternalDisplayTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFExternalDisplayTrigger;
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
  return -[WFExternalDisplayTrigger onConnect](self, "onConnect")
      || -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect");
}

- (id)localizedDescriptionWithConfigurationSummary
{
  __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFExternalDisplayTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFExternalDisplayTrigger onConnect](self, "onConnect")
    && -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("When my display connects or disconnects");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFExternalDisplayTrigger onConnect](self, "onConnect"))
  {
    v3 = CFSTR("When my display connects");
    goto LABEL_8;
  }
  if (-[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("When my display disconnects");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFExternalDisplayTrigger localizedDescriptionWithConfigurationSummary]";
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
  WFExternalDisplayTrigger *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WFExternalDisplayTrigger onConnect](self, "onConnect")
    && -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("Display connected or disconnected");
LABEL_8:
    WFLocalizedString(v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[WFExternalDisplayTrigger onConnect](self, "onConnect"))
  {
    v3 = CFSTR("Display connected");
    goto LABEL_8;
  }
  if (-[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"))
  {
    v3 = CFSTR("Display disconnected");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[WFExternalDisplayTrigger localizedPastTenseDescription]";
    v8 = 2114;
    v9 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (Class)shortcutInputContentItemClass
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFExternalDisplayTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFExternalDisplayTrigger onConnect](self, "onConnect", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onConnect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisconnect"));

}

- (WFExternalDisplayTrigger)initWithCoder:(id)a3
{
  id v4;
  WFExternalDisplayTrigger *v5;
  void *v6;
  void *v7;
  WFExternalDisplayTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFExternalDisplayTrigger;
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
  v6.super_class = (Class)WFExternalDisplayTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnConnect:", -[WFExternalDisplayTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"));
  return v4;
}

- (id)suggestedActions
{
  return (id)MEMORY[0x1E0C9AA60];
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
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom") == 1;

  return v3;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Display"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When my display connects”"));
}

+ (id)displayGlyphName
{
  return CFSTR("display");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)onIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a1, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(a1, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("cable.connector"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)offIcon
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)getUIImageSymbolConfigurationClass_softClass;
  v20 = getUIImageSymbolConfigurationClass_softClass;
  if (!getUIImageSymbolConfigurationClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getUIImageSymbolConfigurationClass_block_invoke;
    v15 = &unk_1E7AF9520;
    v16 = &v17;
    __getUIImageSymbolConfigurationClass_block_invoke((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v3, "configurationWithPointSize:", 54.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v5 = (void *)getUIImageClass_softClass;
  v20 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getUIImageClass_block_invoke;
    v15 = &unk_1E7AF9520;
    v16 = &v17;
    __getUIImageClass_block_invoke((uint64_t)&v12);
    v5 = (void *)v18[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", CFSTR("custom.cable.connector.slash"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B70]), "initWithPlatformImage:", v8);
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Connects"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Disconnects"));
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
