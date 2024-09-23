@implementation WFWorkoutTrigger

- (WFWorkoutTrigger)init
{
  WFWorkoutTrigger *v2;
  WFWorkoutTrigger *v3;
  uint64_t v4;
  NSArray *selectedWorkoutTypes;
  WFWorkoutTrigger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWorkoutTrigger;
  v2 = -[WFTrigger init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_selection = 0;
    v4 = objc_opt_new();
    selectedWorkoutTypes = v3->_selectedWorkoutTypes;
    v3->_selectedWorkoutTypes = (NSArray *)v4;

    v3->_onStart = 1;
    v6 = v3;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  BOOL v3;
  void *v4;
  uint64_t v5;

  v3 = -[WFWorkoutTrigger onStart](self, "onStart") || -[WFWorkoutTrigger onEnd](self, "onEnd");
  if (-[WFWorkoutTrigger selection](self, "selection"))
  {
    -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return 0;
  }
  return v3;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  uint64_t v4;
  WFWorkoutType *v5;
  void *v6;
  void *v7;
  WFWorkoutType *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  WFWorkoutTrigger *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[WFWorkoutTrigger selection](self, "selection"))
  {
    if (-[WFWorkoutTrigger onStart](self, "onStart") && -[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      v12 = CFSTR("When I start or end any workout");
    }
    else if (-[WFWorkoutTrigger onStart](self, "onStart"))
    {
      v12 = CFSTR("When I start any workout");
    }
    else
    {
      if (!-[WFWorkoutTrigger onEnd](self, "onEnd"))
      {
        getWFTriggersLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
LABEL_34:
          *(_DWORD *)buf = 136315394;
          v24 = "-[WFWorkoutTrigger localizedDescriptionWithConfigurationSummary]";
          v25 = 2114;
          v26 = self;
          _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
        }
LABEL_35:

        v17 = &stru_1E7AFA810;
        return v17;
      }
      v12 = CFSTR("When I end any workout");
    }
    WFLocalizedString(v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
  {
    if (-[WFWorkoutTrigger onStart](self, "onStart") && -[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("When I start or end any of %lu workouts");
LABEL_27:
      WFLocalizedPluralString(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v18, objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      return v20;
    }
    if (-[WFWorkoutTrigger onStart](self, "onStart"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("When I start any of %lu workouts");
      goto LABEL_27;
    }
    if (-[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("When I end any of %lu workouts");
      goto LABEL_27;
    }
    getWFTriggersLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    goto LABEL_35;
  }
  v5 = [WFWorkoutType alloc];
  -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFWorkoutType initWithActivityType:](v5, "initWithActivityType:", objc_msgSend(v7, "unsignedIntegerValue"));
  -[WFWorkoutType name](v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFWorkoutTrigger onStart](self, "onStart") && -[WFWorkoutTrigger onEnd](self, "onEnd"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = CFSTR("When I start or end a %@ workout");
  }
  else if (-[WFWorkoutTrigger onStart](self, "onStart"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = CFSTR("When I start a %@ workout");
  }
  else
  {
    if (!-[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      getWFTriggersLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFWorkoutTrigger localizedDescriptionWithConfigurationSummary]";
        v25 = 2114;
        v26 = self;
        _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
      }

      v17 = &stru_1E7AFA810;
      goto LABEL_24;
    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = CFSTR("When I end a %@ workout");
  }
  WFLocalizedString(v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v16, v9);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v17;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  uint64_t v4;
  WFWorkoutType *v5;
  void *v6;
  void *v7;
  WFWorkoutType *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  WFWorkoutTrigger *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[WFWorkoutTrigger selection](self, "selection"))
  {
    if (-[WFWorkoutTrigger onStart](self, "onStart") && -[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      v12 = CFSTR("Any workout started or ended");
    }
    else if (-[WFWorkoutTrigger onStart](self, "onStart"))
    {
      v12 = CFSTR("Any workout started");
    }
    else
    {
      if (!-[WFWorkoutTrigger onEnd](self, "onEnd"))
      {
        getWFTriggersLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
LABEL_34:
          *(_DWORD *)buf = 136315394;
          v24 = "-[WFWorkoutTrigger localizedPastTenseDescription]";
          v25 = 2114;
          v26 = self;
          _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
        }
LABEL_35:

        v17 = &stru_1E7AFA810;
        return v17;
      }
      v12 = CFSTR("Any workout ended");
    }
    WFLocalizedString(v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
  {
    if (-[WFWorkoutTrigger onStart](self, "onStart") && -[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("Any of %lu workouts started or ended");
LABEL_27:
      WFLocalizedPluralString(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v18, objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      return v20;
    }
    if (-[WFWorkoutTrigger onStart](self, "onStart"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("Any of %lu workouts started");
      goto LABEL_27;
    }
    if (-[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("Any of %lu workouts ended");
      goto LABEL_27;
    }
    getWFTriggersLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    goto LABEL_35;
  }
  v5 = [WFWorkoutType alloc];
  -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFWorkoutType initWithActivityType:](v5, "initWithActivityType:", objc_msgSend(v7, "unsignedIntegerValue"));
  -[WFWorkoutType name](v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFWorkoutTrigger onStart](self, "onStart") && -[WFWorkoutTrigger onEnd](self, "onEnd"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = CFSTR("%@ workout started or ended");
  }
  else if (-[WFWorkoutTrigger onStart](self, "onStart"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = CFSTR("%@ workout started");
  }
  else
  {
    if (!-[WFWorkoutTrigger onEnd](self, "onEnd"))
    {
      getWFTriggersLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFWorkoutTrigger localizedPastTenseDescription]";
        v25 = 2114;
        v26 = self;
        _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
      }

      v17 = &stru_1E7AFA810;
      goto LABEL_24;
    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = CFSTR("%@ workout ended");
  }
  WFLocalizedString(v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v16, v9);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFWorkoutTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFWorkoutTrigger selection](self, "selection", v9.receiver, v9.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selection"));

  -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selectedWorkouts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFWorkoutTrigger onStart](self, "onStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("onStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFWorkoutTrigger onEnd](self, "onEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("onEnd"));

}

- (WFWorkoutTrigger)initWithCoder:(id)a3
{
  id v4;
  WFWorkoutTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFWorkoutTrigger *v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFWorkoutTrigger;
  v5 = -[WFTrigger initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v8 = 1;
    v5->_selection = v8;
    v9 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("selectedWorkouts"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_selectedWorkoutTypes, v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onStart"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onStart = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onEnd"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_onEnd = objc_msgSend(v16, "BOOLValue");

    v17 = v5;
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
  v8.super_class = (Class)WFWorkoutTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSelection:", -[WFWorkoutTrigger selection](self, "selection"));
  -[WFWorkoutTrigger selectedWorkoutTypes](self, "selectedWorkoutTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedWorkoutTypes:", v6);

  objc_msgSend(v4, "setOnStart:", -[WFWorkoutTrigger onStart](self, "onStart"));
  objc_msgSend(v4, "setOnEnd:", -[WFWorkoutTrigger onEnd](self, "onEnd"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DAA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)selection
{
  return self->_selection;
}

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
}

- (NSArray)selectedWorkoutTypes
{
  return self->_selectedWorkoutTypes;
}

- (void)setSelectedWorkoutTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)onStart
{
  return self->_onStart;
}

- (void)setOnStart:(BOOL)a3
{
  self->_onStart = a3;
}

- (BOOL)onEnd
{
  return self->_onEnd;
}

- (void)setOnEnd:(BOOL)a3
{
  self->_onEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedWorkoutTypes, 0);
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
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[objc_class sharedInstance](getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = ((uint64_t (*)(void *))softLinkNRWatchOSVersionForRemoteDevice)(*(void **)(*((_QWORD *)&v9 + 1)
                                                                                                + 8 * i));
        if ((((uint64_t (*(*)(uint64_t, uint64_t))())softLinkNRVersionIsGreaterThanOrEqual)(v7, 393216) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Apple Watch Workout"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When I start a workout”"));
}

+ (id)displayGlyphName
{
  return CFSTR("figure.run.circle.fill");
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
  objc_msgSend(a1, "workoutColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("figure.run.circle.fill"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)offIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a1, "stopColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithWhite:alpha:", 1.0, 1.0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(a1, "stopColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.140000001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerConfigurationSymbolNamed:hierarchicalColors:", CFSTR("xmark.circle.fill"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)onLabel
{
  return WFLocalizedString(CFSTR("Starts"));
}

+ (id)offLabel
{
  return WFLocalizedString(CFSTR("Ends"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)workoutColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithWhite:alpha:", 0.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 0.725490212, 0.992156863, 0.313725501, 1.0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 0.725490212, 0.992156863, 0.313725501, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stopColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 0.917647064, 0.305882365, 0.239215687, 1.0);
}

@end
