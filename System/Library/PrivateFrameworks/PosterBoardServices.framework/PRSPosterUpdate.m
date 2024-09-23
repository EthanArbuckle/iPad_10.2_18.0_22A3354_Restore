@implementation PRSPosterUpdate

- (id)_initWithUpdateType:(unint64_t)a3 payload:(id)a4
{
  id v6;
  PRSPosterUpdate *v7;
  PRSPosterUpdate *v8;
  uint64_t v9;
  PRSPosterUpdatePayload *payload;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRSPosterUpdate;
  v7 = -[PRSPosterUpdate init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    payload = v8->_payload;
    v8->_payload = (PRSPosterUpdatePayload *)v9;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)updateNecessitatesPosterUpdate
{
  return (self->_type & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (void)encodeWithCoder:(id)a3
{
  PRSPosterUpdatePayload *payload;
  id v5;

  payload = self->_payload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payload, CFSTR("_payload"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));

}

- (PRSPosterUpdate)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PRSPosterUpdatePayload *payload;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRSPosterUpdate;
  v5 = -[PRSPosterUpdate init](&v17, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_payload"));
    v14 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (PRSPosterUpdatePayload *)v14;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  PRSPosterUpdatePayload *payload;
  uint64_t v7;
  PRSPosterUpdatePayload *v8;
  PRSPosterUpdatePayload *v9;
  PRSPosterUpdatePayload *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  PRSPosterUpdatePayload *v18;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromPRSPosterUpdateType(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("type"));

  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_payload, CFSTR("payload"));
  if (self->_type == 9)
  {
    payload = self->_payload;
    v7 = objc_opt_class();
    v8 = payload;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    if (v10)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __30__PRSPosterUpdate_description__block_invoke;
      v16 = &unk_1E4D427A0;
      v17 = v3;
      v18 = v10;
      objc_msgSend(v17, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("ambientWidgets"), CFSTR("\n"), &v13);

    }
    else
    {
      objc_msgSend(v3, "appendString:withName:", CFSTR("unable to read property list payload for ambient widget update"), CFSTR("ambientWidget update payload error"));
    }

  }
  objc_msgSend(v3, "build", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __30__PRSPosterUpdate_description__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "propertyListRoot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PRSPosterUpdateAmbientWidgetsIdentifiers(v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v1, "appendObject:withName:", v2, CFSTR("ambientWidgetDebugInfo"));

}

+ (id)posterUpdateMirroredHomeScreenLegibilityBlurWithValue:(BOOL)a3
{
  _BOOL8 v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateTristatePayload *v5;
  void *v6;
  PRSPosterUpdateTristatePayload *v7;
  id v8;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = [PRSPosterUpdateTristatePayload alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRSPosterUpdateTristatePayload initWithState:](v5, "initWithState:", v6);
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 5, v7);

  return v8;
}

+ (id)posterUpdateHomeScreenPosterLegibilityBlurWithValue:(BOOL)a3
{
  _BOOL8 v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateTristatePayload *v5;
  void *v6;
  PRSPosterUpdateTristatePayload *v7;
  id v8;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = [PRSPosterUpdateTristatePayload alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRSPosterUpdateTristatePayload initWithState:](v5, "initWithState:", v6);
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 4, v7);

  return v8;
}

+ (id)posterUpdateLegibilityBlurWithValue:(BOOL)a3
{
  _BOOL8 v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateTristatePayload *v5;
  void *v6;
  PRSPosterUpdateTristatePayload *v7;
  id v8;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = [PRSPosterUpdateTristatePayload alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRSPosterUpdateTristatePayload initWithState:](v5, "initWithState:", v6);
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 3, v7);

  return v8;
}

+ (id)posterUpdateInlineComplication:(id)a3
{
  id v3;
  PRSPosterUpdateComplicationPayload *v4;
  PRSPosterUpdateComplicationPayload *v5;
  void *v6;
  PRSPosterUpdateComplicationPayload *v7;
  id v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    NSClassFromString(CFSTR("PRSWidget"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSWidgetClass]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PRSPosterUpdate posterUpdateInlineComplication:].cold.1();
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49B9004);
    }
  }

  v4 = [PRSPosterUpdateComplicationPayload alloc];
  v5 = v4;
  if (v3)
  {
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PRSPosterUpdateComplicationPayload initWithComplications:](v5, "initWithComplications:", v6);

  }
  else
  {
    v7 = -[PRSPosterUpdateComplicationPayload initWithComplications:](v4, "initWithComplications:", MEMORY[0x1E0C9AA60]);
  }
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 2, v7);

  return v8;
}

+ (id)posterUpdateComplications:(id)a3
{
  id v3;
  id v4;
  void *v5;
  PRSPosterUpdateComplicationPayload *v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    NSClassFromString(CFSTR("NSArray"));
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PRSPosterUpdate posterUpdateComplications:].cold.1();
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49B90B8);
    }
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  v6 = -[PRSPosterUpdateComplicationPayload initWithComplications:]([PRSPosterUpdateComplicationPayload alloc], "initWithComplications:", v4);
  v7 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 1, v6);

  return v7;
}

+ (id)posterUpdateSidebarComplications:(id)a3
{
  id v3;
  id v4;
  void *v5;
  PRSPosterUpdateComplicationPayload *v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    NSClassFromString(CFSTR("NSArray"));
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PRSPosterUpdate posterUpdateSidebarComplications:].cold.1();
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49B91C8);
    }
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  v6 = -[PRSPosterUpdateComplicationPayload initWithComplications:]([PRSPosterUpdateComplicationPayload alloc], "initWithComplications:", v4);
  v7 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 8, v6);

  return v7;
}

+ (id)posterUpdateAmbientWidgets:(id)a3
{
  id v3;
  PRSPosterUpdatePropertyListPayload *v4;
  NSObject *v5;
  id v6;
  id result;
  void *v8;

  v3 = a3;
  if (v3 && (NSClassFromString(CFSTR("NSDictionary")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateAmbientWidgets:].cold.2();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = -[PRSPosterUpdatePropertyListPayload initWithPropertyList:]([PRSPosterUpdatePropertyListPayload alloc], "initWithPropertyList:", v3);
    PRSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateAmbientWidgets:].cold.1(v3, v5);

    v6 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 9, v4);
    return v6;
  }
  return result;
}

+ (id)posterUpdateHomeScreenPosterProvider:(id)a3 sessionInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  PRSPosterUpdateHomeScreenAppearancePayload *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B94ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9510);
  }

  v8 = v6;
  NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9574);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:].cold.2();
    goto LABEL_17;
  }

  v9 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:]([PRSPosterUpdateHomeScreenAppearancePayload alloc], "initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:", 0, v8, v7);
  v10 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 6, v9);

  return v10;
}

+ (id)posterUpdatePosterWithSessionInfo:(id)a3
{
  id v3;
  PRSPosterUpdateHomeScreenAppearancePayload *v4;
  id v5;
  void *v7;

  v3 = a3;
  NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B96E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:].cold.1();
    goto LABEL_9;
  }

  v4 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateSwitcherPoster:]([PRSPosterUpdateHomeScreenAppearancePayload alloc], "initWithUpdatedAppearanceType:updateSwitcherPoster:", 0, v3);
  v5 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 7, v4);

  return v5;
}

+ (id)posterUpdatesForDecoratedSessionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForDecoratedSessionInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B98E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForDecoratedSessionInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B994CLL);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "shortcutsWallpaperConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "shortcutsWallpaperConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "posterUpdatesForWFWallpaperConfiguration:sessionInfo:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    v9 = v5;
  }
  else
  {
    +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:](PRSPosterUpdate, "posterUpdatePosterWithSessionInfo:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)posterUpdatesForWFWallpaperConfiguration:(id)a3 sessionInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  PRSPosterUpdateSessionInfo *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("WFWallpaperConfiguration"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:].cold.1();
LABEL_33:
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9C14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:WFWallpaperConfigurationClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9C78);
  }

  v8 = v6;
  NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9CDCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9D40);
  }

  objc_msgSend(v8, "shortcutsWallpaperConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v7);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sessionInfo && [[sessionInfo shortcutsWallpaperConfiguration] isEqual:wallpaperConfiguration]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:].cold.3();
    goto LABEL_33;
  }
  v11 = objc_msgSend(v7, "location");
  v12 = (void *)objc_opt_new();
  v13 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  -[PRSPosterUpdateSessionInfo setShortcutsWallpaperConfiguration:](v13, "setShortcutsWallpaperConfiguration:", v7);
  if (!v11 || v11 == 2)
  {
    +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:](PRSPosterUpdate, "posterUpdatePosterWithSessionInfo:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

    if (v11 != 2)
      goto LABEL_13;
    v15 = 1;
  }
  else
  {
    if (v11 != 1)
      goto LABEL_13;
    +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:](PRSPosterUpdate, "posterUpdateHomeScreenPosterProvider:sessionInfo:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

    v15 = 4;
  }
  +[PRSPosterUpdate posterUpdateHomeScreenAppearance:](PRSPosterUpdate, "posterUpdateHomeScreenAppearance:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);

LABEL_13:
  objc_msgSend(v7, "legibilityBlur");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      objc_msgSend(v7, "legibilityBlur");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSPosterUpdate posterUpdateMirroredHomeScreenLegibilityBlurWithValue:](PRSPosterUpdate, "posterUpdateMirroredHomeScreenLegibilityBlurWithValue:", objc_msgSend(v19, "BOOLValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v20);

    }
    if (v11 == 1)
    {
      objc_msgSend(v7, "legibilityBlur");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSPosterUpdate posterUpdateHomeScreenPosterLegibilityBlurWithValue:](PRSPosterUpdate, "posterUpdateHomeScreenPosterLegibilityBlurWithValue:", objc_msgSend(v21, "BOOLValue"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v22);

    }
  }

  return v12;
}

+ (id)posterUpdatesForWFWallpaperConfiguration:(id)a3
{
  id v4;
  PRSPosterUpdateSessionInfo *v5;
  void *v6;
  void *v8;

  v4 = a3;
  NSClassFromString(CFSTR("WFWallpaperConfiguration"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B9EA4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:WFWallpaperConfigurationClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:].cold.1();
    goto LABEL_9;
  }

  v5 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  -[PRSPosterUpdateSessionInfo setShortcutsWallpaperConfiguration:](v5, "setShortcutsWallpaperConfiguration:", v4);
  objc_msgSend(a1, "posterUpdatesForWFWallpaperConfiguration:sessionInfo:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)posterUpdateHomeScreenGradient:(id)a3
{
  id v3;
  PRSPosterUpdateHomeScreenAppearancePayload *v4;
  PRSPosterUpdateColorPayload *v5;
  PRSPosterUpdateHomeScreenAppearancePayload *v6;
  id v7;
  void *v9;

  v3 = a3;
  NSClassFromString(CFSTR("BSColor"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenGradient:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BA034);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSColorClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenGradient:].cold.1();
    goto LABEL_9;
  }

  v4 = [PRSPosterUpdateHomeScreenAppearancePayload alloc];
  v5 = -[PRSPosterUpdateColorPayload initWithColor:]([PRSPosterUpdateColorPayload alloc], "initWithColor:", v3);
  v6 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:gradientColorAppearance:](v4, "initWithUpdatedAppearanceType:gradientColorAppearance:", 0, v5);

  v7 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 6, v6);
  return v7;
}

+ (id)posterUpdateHomeScreenColor:(id)a3
{
  id v3;
  PRSPosterUpdateHomeScreenAppearancePayload *v4;
  PRSPosterUpdateColorPayload *v5;
  PRSPosterUpdateHomeScreenAppearancePayload *v6;
  id v7;
  void *v9;

  v3 = a3;
  NSClassFromString(CFSTR("BSColor"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenColor:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BA1C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSColorClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdate posterUpdateHomeScreenColor:].cold.1();
    goto LABEL_9;
  }

  v4 = [PRSPosterUpdateHomeScreenAppearancePayload alloc];
  v5 = -[PRSPosterUpdateColorPayload initWithColor:]([PRSPosterUpdateColorPayload alloc], "initWithColor:", v3);
  v6 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:solidColorAppearance:](v4, "initWithUpdatedAppearanceType:solidColorAppearance:", 0, v5);

  v7 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 6, v6);
  return v7;
}

+ (id)posterUpdateHomeScreenAppearance:(unint64_t)a3
{
  PRSPosterUpdateHomeScreenAppearancePayload *v3;
  id v4;

  v3 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:]([PRSPosterUpdateHomeScreenAppearancePayload alloc], "initWithUpdatedAppearanceType:", a3);
  v4 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 6, v3);

  return v4;
}

+ (id)posterUpdateHomeScreenPosterWithImageAtURL:(id)a3
{
  id v3;
  PRSPosterUpdateSessionInfo *v4;
  id v5;
  void *v6;
  PRSPosterUpdateHomeScreenAppearancePayload *v7;
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  v5 = objc_alloc(MEMORY[0x1E0DC7E08]);
  v6 = (void *)objc_msgSend(v5, "initWithURL:location:legibilityBlur:smartCrop:usePreview:", v3, 1, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);

  -[PRSPosterUpdateSessionInfo setShortcutsWallpaperConfiguration:](v4, "setShortcutsWallpaperConfiguration:", v6);
  v7 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:]([PRSPosterUpdateHomeScreenAppearancePayload alloc], "initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:", 4, v4, CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 6, v7);

  return v8;
}

+ (id)posterUpdateLockScreenPosterWithImageAtURL:(id)a3
{
  id v3;
  PRSPosterUpdateSessionInfo *v4;
  id v5;
  void *v6;
  PRSPosterUpdateHomeScreenAppearancePayload *v7;
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  v5 = objc_alloc(MEMORY[0x1E0DC7E08]);
  v6 = (void *)objc_msgSend(v5, "initWithURL:location:legibilityBlur:smartCrop:usePreview:", v3, 0, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);

  -[PRSPosterUpdateSessionInfo setShortcutsWallpaperConfiguration:](v4, "setShortcutsWallpaperConfiguration:", v6);
  v7 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateSwitcherPoster:]([PRSPosterUpdateHomeScreenAppearancePayload alloc], "initWithUpdatedAppearanceType:updateSwitcherPoster:", 0, v4);
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 7, v7);

  return v8;
}

+ (id)posterUpdateHomeScreenTintWithVariation:(id)a3 saturation:(id)a4 luminance:(id)a5
{
  id v7;
  id v8;
  id v9;
  PRSPosterUpdate *v10;
  PRSPosterUpdateDiscreteStylePayload *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PRSPosterUpdate alloc];
  v11 = -[PRSPosterUpdateDiscreteStylePayload initWithVariation:saturation:luminance:]([PRSPosterUpdateDiscreteStylePayload alloc], "initWithVariation:saturation:luminance:", v9, v8, v7);

  v12 = -[PRSPosterUpdate _initWithUpdateType:payload:](v10, "_initWithUpdateType:payload:", 14, v11);
  return v12;
}

+ (id)posterUpdateHomeScreenTintForColor:(id)a3
{
  id v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateColorPayload *v5;
  id v6;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = -[PRSPosterUpdateColorPayload initWithColor:]([PRSPosterUpdateColorPayload alloc], "initWithColor:", v3);

  v6 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 14, v5);
  return v6;
}

+ (id)posterUpdateHomeScreenSuggestedTintColor:(id)a3
{
  id v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateColorPayload *v5;
  id v6;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = -[PRSPosterUpdateColorPayload initWithColor:]([PRSPosterUpdateColorPayload alloc], "initWithColor:", v3);

  v6 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 15, v5);
  return v6;
}

+ (id)posterUpdateHomeScreenAppearanceDimWithValue:(BOOL)a3
{
  _BOOL8 v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateTristatePayload *v5;
  void *v6;
  PRSPosterUpdateTristatePayload *v7;
  id v8;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = [PRSPosterUpdateTristatePayload alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRSPosterUpdateTristatePayload initWithState:](v5, "initWithState:", v6);
  v8 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 13, v7);

  return v8;
}

+ (id)posterUpdateShouldUseLargeHomeScreenIcons:(id)a3
{
  id v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdateTristatePayload *v5;
  id v6;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = -[PRSPosterUpdateTristatePayload initWithState:]([PRSPosterUpdateTristatePayload alloc], "initWithState:", v3);

  v6 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 16, v5);
  return v6;
}

+ (id)posterUpdateHomeScreenIconUserInterfaceStyle:(id)a3
{
  id v3;
  PRSPosterUpdate *v4;
  PRSPosterUpdatePropertyListPayload *v5;
  void *v6;
  void *v7;
  PRSPosterUpdatePropertyListPayload *v8;
  id v9;

  v3 = a3;
  v4 = [PRSPosterUpdate alloc];
  v5 = [PRSPosterUpdatePropertyListPayload alloc];
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[PRSPosterUpdatePropertyListPayload initWithPropertyListData:](v5, "initWithPropertyListData:", v7);
  v9 = -[PRSPosterUpdate _initWithUpdateType:payload:](v4, "_initWithUpdateType:payload:", 17, v8);

  if (!v6)
  return v9;
}

+ (id)posterUpdateAssociateWithChargerIdentifier:(id)a3
{
  id v3;
  PRSPosterUpdatePropertyListPayload *v4;
  PRSPosterUpdatePropertyListPayload *v5;
  void *v6;
  PRSPosterUpdatePropertyListPayload *v7;
  PRSPosterUpdate *v8;
  id v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [PRSPosterUpdatePropertyListPayload alloc];
  v5 = v4;
  if (v3)
  {
    v11 = CFSTR("chargerIdentifier");
    v12[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PRSPosterUpdatePropertyListPayload initWithPropertyList:](v5, "initWithPropertyList:", v6);

  }
  else
  {
    v7 = -[PRSPosterUpdatePropertyListPayload initWithPropertyList:](v4, "initWithPropertyList:", MEMORY[0x1E0C9AA70]);
  }
  v8 = [PRSPosterUpdate alloc];

  v9 = -[PRSPosterUpdate _initWithUpdateType:payload:](v8, "_initWithUpdateType:payload:", 10, v7);
  return v9;
}

+ (id)posterUpdateDisassociateFromChargerIdentifier:(id)a3
{
  id v3;
  PRSPosterUpdatePropertyListPayload *v4;
  PRSPosterUpdatePropertyListPayload *v5;
  void *v6;
  PRSPosterUpdatePropertyListPayload *v7;
  PRSPosterUpdate *v8;
  id v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [PRSPosterUpdatePropertyListPayload alloc];
  v5 = v4;
  if (v3)
  {
    v11 = CFSTR("chargerIdentifier");
    v12[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PRSPosterUpdatePropertyListPayload initWithPropertyList:](v5, "initWithPropertyList:", v6);

  }
  else
  {
    v7 = -[PRSPosterUpdatePropertyListPayload initWithPropertyList:](v4, "initWithPropertyList:", MEMORY[0x1E0C9AA70]);
  }
  v8 = [PRSPosterUpdate alloc];

  v9 = -[PRSPosterUpdate _initWithUpdateType:payload:](v8, "_initWithUpdateType:payload:", 11, v7);
  return v9;
}

+ (id)posterUpdateAmbientConfigurationForCreation:(id)a3 deletion:(id)a4 editingBehavior:(id)a5 supportedDataLayout:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PRSPosterUpdatePropertyListPayload *v15;
  void *v16;
  PRSPosterUpdatePropertyListPayload *v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("creationBehavior"));
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("deletionBehavior"));
  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("editingBehavior"));
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("supportedDataLayout"));
  v15 = [PRSPosterUpdatePropertyListPayload alloc];
  v16 = (void *)objc_msgSend(v14, "copy");
  v17 = -[PRSPosterUpdatePropertyListPayload initWithPropertyList:](v15, "initWithPropertyList:", v16);

  v18 = -[PRSPosterUpdate _initWithUpdateType:payload:]([PRSPosterUpdate alloc], "_initWithUpdateType:payload:", 12, v17);
  return v18;
}

- (unint64_t)type
{
  return self->_type;
}

- (PRSPosterUpdatePayload)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (void)posterUpdateInlineComplication:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateComplications:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateSidebarComplications:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateAmbientWidgets:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PRSPosterUpdateAmbientWidgetsIdentifiers(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1A4996000, a2, OS_LOG_TYPE_ERROR, "Building PRSPosterUpdate for ambient widgets: %{public}@", (uint8_t *)&v4, 0xCu);

}

+ (void)posterUpdateAmbientWidgets:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateHomeScreenPosterProvider:sessionInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateHomeScreenPosterProvider:sessionInfo:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdatePosterWithSessionInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdatesForDecoratedSessionInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdatesForWFWallpaperConfiguration:sessionInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdatesForWFWallpaperConfiguration:sessionInfo:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdatesForWFWallpaperConfiguration:sessionInfo:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdatesForWFWallpaperConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateHomeScreenGradient:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)posterUpdateHomeScreenColor:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
