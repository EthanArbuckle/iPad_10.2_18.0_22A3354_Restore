@implementation WFUserFocusActivityTrigger

- (WFUserFocusActivityTrigger)initWithActivity:(id)a3
{
  id v4;
  WFUserFocusActivityTrigger *v5;
  uint64_t v6;
  NSString *activityName;
  void *v8;
  uint64_t v9;
  NSString *activityUniqueIdentifier;
  uint64_t v11;
  NSString *activitySemanticIdentifier;
  uint64_t v13;
  NSString *activityGlyphName;
  void *v15;
  void *v16;
  uint64_t v17;
  WFColor *activityTintColor;
  WFUserFocusActivityTrigger *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFUserFocusActivityTrigger;
  v5 = -[WFTrigger init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "activityDisplayName");
    v6 = objc_claimAutoreleasedReturnValue();
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v6;

    objc_msgSend(v4, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    activityUniqueIdentifier = v5->_activityUniqueIdentifier;
    v5->_activityUniqueIdentifier = (NSString *)v9;

    objc_msgSend(v4, "activityIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    activitySemanticIdentifier = v5->_activitySemanticIdentifier;
    v5->_activitySemanticIdentifier = (NSString *)v11;

    objc_msgSend(v4, "activitySymbolImageName");
    v13 = objc_claimAutoreleasedReturnValue();
    activityGlyphName = v5->_activityGlyphName;
    v5->_activityGlyphName = (NSString *)v13;

    v5->_onEnable = 1;
    v5->_onDisable = 0;
    v15 = (void *)MEMORY[0x1E0DC79F8];
    objc_msgSend(v4, "activityColorName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithFocusColorName:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    activityTintColor = v5->_activityTintColor;
    v5->_activityTintColor = (WFColor *)v17;

    v19 = v5;
  }

  return v5;
}

- (id)localizedDisplayExplanation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Ex. “When turning %@ on”"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserFocusActivityTrigger activityName](self, "activityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayGlyph
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  -[WFUserFocusActivityTrigger displayGlyphName](self, "displayGlyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerDisplaySymbolNamed:renderingMode:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)displayGlyphTintColor
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[WFUserFocusActivityTrigger activityTintColor](self, "activityTintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0DC79F8]);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v6 = (void *)getUIColorClass_softClass;
    v14 = getUIColorClass_softClass;
    if (!getUIColorClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getUIColorClass_block_invoke;
      v10[3] = &unk_1E7AF9520;
      v10[4] = &v11;
      __getUIColorClass_block_invoke((uint64_t)v10);
      v6 = (void *)v12[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v7, "systemIndigoColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "initWithPlatformColor:", v8);

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WFUserFocusActivityTrigger;
  -[WFTrigger description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserFocusActivityTrigger activityName](self, "activityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserFocusActivityTrigger activitySemanticIdentifier](self, "activitySemanticIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUserFocusActivityTrigger activityUniqueIdentifier](self, "activityUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, name: %@, id: %@, unique id: %@, onEnable: %i, onDisable: %i>"), v4, v5, v6, v7, -[WFUserFocusActivityTrigger onEnable](self, "onEnable"), -[WFUserFocusActivityTrigger onDisable](self, "onDisable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFUserFocusActivityTrigger)init
{
  WFUserFocusActivityTrigger *v2;
  WFUserFocusActivityTrigger *v3;
  WFUserFocusActivityTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFUserFocusActivityTrigger;
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
  void *v3;
  BOOL v4;

  if (!-[WFUserFocusActivityTrigger onEnable](self, "onEnable")
    && !-[WFUserFocusActivityTrigger onDisable](self, "onDisable"))
  {
    return 0;
  }
  -[WFUserFocusActivityTrigger activityName](self, "activityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  WFUserFocusActivityTrigger *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[WFUserFocusActivityTrigger onEnable](self, "onEnable")
    && -[WFUserFocusActivityTrigger onDisable](self, "onDisable"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("When turning %@ on or off");
LABEL_8:
    WFLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserFocusActivityTrigger activityName](self, "activityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (-[WFUserFocusActivityTrigger onEnable](self, "onEnable"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("When turning %@ on");
    goto LABEL_8;
  }
  if (-[WFUserFocusActivityTrigger onDisable](self, "onDisable"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("When turning %@ off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFUserFocusActivityTrigger localizedDescriptionWithConfigurationSummary]";
    v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  WFUserFocusActivityTrigger *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[WFUserFocusActivityTrigger onEnable](self, "onEnable")
    && -[WFUserFocusActivityTrigger onDisable](self, "onDisable"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("Turned %@ on or off");
LABEL_8:
    WFLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserFocusActivityTrigger activityName](self, "activityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (-[WFUserFocusActivityTrigger onEnable](self, "onEnable"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("Turned %@ on");
    goto LABEL_8;
  }
  if (-[WFUserFocusActivityTrigger onDisable](self, "onDisable"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("Turned %@ off");
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFUserFocusActivityTrigger localizedPastTenseDescription]";
    v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  return &stru_1E7AFA810;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFUserFocusActivityTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFUserFocusActivityTrigger onEnable](self, "onEnable", v12.receiver, v12.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("onEnable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFUserFocusActivityTrigger onDisable](self, "onDisable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("onDisable"));

  -[WFUserFocusActivityTrigger activityName](self, "activityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activityName"));

  -[WFUserFocusActivityTrigger activitySemanticIdentifier](self, "activitySemanticIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("activitySemanticIdentifier"));

  -[WFUserFocusActivityTrigger activityUniqueIdentifier](self, "activityUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("activityIdentifier"));

  -[WFUserFocusActivityTrigger activityGlyphName](self, "activityGlyphName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("activityGlyphName"));

  -[WFUserFocusActivityTrigger activityTintColor](self, "activityTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("activityTintColor"));

}

- (WFUserFocusActivityTrigger)initWithCoder:(id)a3
{
  id v4;
  WFUserFocusActivityTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *activityGlyphName;
  uint64_t v10;
  WFColor *activityTintColor;
  uint64_t v12;
  NSString *activitySemanticIdentifier;
  uint64_t v14;
  NSString *activityName;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  NSString *activityUniqueIdentifier;
  uint64_t v20;
  NSString *v21;
  WFUserFocusActivityTrigger *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFUserFocusActivityTrigger;
  v5 = -[WFTrigger initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onEnable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onEnable = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onDisable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onDisable = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityGlyphName"));
    v8 = objc_claimAutoreleasedReturnValue();
    activityGlyphName = v5->_activityGlyphName;
    v5->_activityGlyphName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityTintColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    activityTintColor = v5->_activityTintColor;
    v5->_activityTintColor = (WFColor *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activitySemanticIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    activitySemanticIdentifier = v5->_activitySemanticIdentifier;
    v5->_activitySemanticIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityName"));
    v14 = objc_claimAutoreleasedReturnValue();
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v14;

    if (!-[NSString length](v5->_activityName, "length"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedMode"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_activityName;
      v5->_activityName = (NSString *)v16;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    activityUniqueIdentifier = v5->_activityUniqueIdentifier;
    v5->_activityUniqueIdentifier = (NSString *)v18;

    if (!-[NSString length](v5->_activityUniqueIdentifier, "length"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedModeIdentifier"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_activityUniqueIdentifier;
      v5->_activityUniqueIdentifier = (NSString *)v20;

    }
    v22 = v5;
  }

  return v5;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8D970, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFUserFocusActivityTrigger;
  v4 = -[WFTrigger copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOnEnable:", -[WFUserFocusActivityTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFUserFocusActivityTrigger onDisable](self, "onDisable"));
  -[WFUserFocusActivityTrigger activityName](self, "activityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityName:", v5);

  -[WFUserFocusActivityTrigger activityUniqueIdentifier](self, "activityUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityUniqueIdentifier:", v6);

  -[WFUserFocusActivityTrigger activitySemanticIdentifier](self, "activitySemanticIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivitySemanticIdentifier:", v7);

  -[WFUserFocusActivityTrigger activityGlyphName](self, "activityGlyphName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityGlyphName:", v8);

  -[WFUserFocusActivityTrigger activityTintColor](self, "activityTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityTintColor:", v9);

  return v4;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
  objc_storeStrong((id *)&self->_activityName, a3);
}

- (NSString)activityUniqueIdentifier
{
  return self->_activityUniqueIdentifier;
}

- (void)setActivityUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activityUniqueIdentifier, a3);
}

- (NSString)activitySemanticIdentifier
{
  return self->_activitySemanticIdentifier;
}

- (void)setActivitySemanticIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activitySemanticIdentifier, a3);
}

- (NSString)activityGlyphName
{
  return self->_activityGlyphName;
}

- (void)setActivityGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_activityGlyphName, a3);
}

- (WFColor)activityTintColor
{
  return self->_activityTintColor;
}

- (void)setActivityTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_activityTintColor, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTintColor, 0);
  objc_storeStrong((id *)&self->_activityGlyphName, 0);
  objc_storeStrong((id *)&self->_activitySemanticIdentifier, 0);
  objc_storeStrong((id *)&self->_activityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_activityName, 0);
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
  return WFLocalizedString(CFSTR("Focus"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When turning on Work”"));
}

+ (id)displayGlyphName
{
  return CFSTR("moon.circle.fill");
}

+ (int64_t)triggerBacking
{
  return 2;
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
  return WFLocalizedString(CFSTR("When Turning On"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("When Turning Off"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
