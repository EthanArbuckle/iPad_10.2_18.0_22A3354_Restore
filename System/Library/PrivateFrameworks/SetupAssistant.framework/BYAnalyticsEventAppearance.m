@implementation BYAnalyticsEventAppearance

- (BYAnalyticsEventAppearance)initWithAnalyticsManager:(id)a3 buddyPreferencesExcludedFromBackup:(id)a4
{
  id v6;
  id v7;
  BYAnalyticsEventAppearance *v8;
  BYAnalyticsEventAppearance *v9;
  uint64_t v10;
  BYAnalyticsEventAppearance *v11;
  BYAnalyticsEventAppearance *v12;
  _QWORD v14[4];
  BYAnalyticsEventAppearance *v15;
  _QWORD v16[4];
  BYAnalyticsEventAppearance *v17;
  _QWORD v18[4];
  BYAnalyticsEventAppearance *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BYAnalyticsEventAppearance;
  v8 = -[BYAnalyticsEventAppearance init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    -[BYAnalyticsEventAppearance setBuddyPreferencesExcludedFromBackup:](v8, "setBuddyPreferencesExcludedFromBackup:", v7);
    -[BYAnalyticsEventAppearance setShouldRemoveAnalyticsEventPayloadFromPreferences:](v9, "setShouldRemoveAnalyticsEventPayloadFromPreferences:", 0);
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__BYAnalyticsEventAppearance_initWithAnalyticsManager_buddyPreferencesExcludedFromBackup___block_invoke;
    v18[3] = &unk_1E4E27B08;
    v11 = v9;
    v19 = v11;
    objc_msgSend(v6, "addEvent:withPayloadBlock:persist:", CFSTR("com.apple.settings.personalizedsetup_appearance_setup"), v18, 0);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __90__BYAnalyticsEventAppearance_initWithAnalyticsManager_buddyPreferencesExcludedFromBackup___block_invoke_2;
    v16[3] = &unk_1E4E27B30;
    v12 = v11;
    v17 = v12;
    objc_msgSend(v6, "setAppearanceSetupEventBlock:", v16);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __90__BYAnalyticsEventAppearance_initWithAnalyticsManager_buddyPreferencesExcludedFromBackup___block_invoke_3;
    v14[3] = &unk_1E4E26958;
    v15 = v12;
    objc_msgSend(v6, "addDidProduceLazyEventsBlock:", v14);

  }
  return v9;
}

uint64_t __90__BYAnalyticsEventAppearance_initWithAnalyticsManager_buddyPreferencesExcludedFromBackup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventPayload");
}

uint64_t __90__BYAnalyticsEventAppearance_initWithAnalyticsManager_buddyPreferencesExcludedFromBackup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_biomeEvent");
}

uint64_t __90__BYAnalyticsEventAppearance_initWithAnalyticsManager_buddyPreferencesExcludedFromBackup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_analyticsManagerDidProduceLazyEvents");
}

- (void)didChooseToSetUpForChild:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  -[BYAnalyticsEventAppearance _eventPayloadFromPreferences](self, "_eventPayloadFromPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("child_setup"));

    -[BYAnalyticsEventAppearance buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:persistImmediately:](v8, "setObject:forKey:persistImmediately:", v6, CFSTR("AppearanceAnalyticsEventPayload"), 1);
  }
  else
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BYAnalyticsEventAppearance didChooseToSetUpForChild:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)didChooseAppearanceModeName:(id)a3 forDisposition:(unint64_t)a4
{
  char v4;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[BYAnalyticsEventAppearance _eventPayloadFromPreferences](self, "_eventPayloadFromPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((v4 & 0x10) != 0)
    v8 = CFSTR("child_size_choice");
  else
    v8 = CFSTR("size_choice");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);
  -[BYAnalyticsEventAppearance buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:persistImmediately:", v7, CFSTR("AppearanceAnalyticsEventPayload"), 1);

}

- (void)setChildAge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[BYAnalyticsEventAppearance _eventPayloadFromPreferences](self, "_eventPayloadFromPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("child_age"));
    -[BYAnalyticsEventAppearance buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:persistImmediately:](v7, "setObject:forKey:persistImmediately:", v6, CFSTR("AppearanceAnalyticsEventPayload"), 1);
  }
  else
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BYAnalyticsEventAppearance didChooseToSetUpForChild:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (id)_eventPayloadFromPreferences
{
  void *v2;
  void *v3;

  -[BYAnalyticsEventAppearance buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AppearanceAnalyticsEventPayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (id)_eventPayloadFromPreferencesIfComplete
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  -[BYAnalyticsEventAppearance _eventPayloadFromPreferences](self, "_eventPayloadFromPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("child_setup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v3, "BOOLValue"))
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("child_size_choice"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        _BYLoggingFacility();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[BYAnalyticsEventAppearance _eventPayloadFromPreferencesIfComplete].cold.1(v5);

        v2 = 0;
      }
    }
  }

  return v2;
}

- (id)_eventPayload
{
  void *v3;

  -[BYAnalyticsEventAppearance _eventPayloadFromPreferencesIfComplete](self, "_eventPayloadFromPreferencesIfComplete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[BYAnalyticsEventAppearance setShouldRemoveAnalyticsEventPayloadFromPreferences:](self, "setShouldRemoveAnalyticsEventPayloadFromPreferences:", 1);
  return v3;
}

- (id)_biomeEvent
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;

  -[BYAnalyticsEventAppearance _eventPayloadFromPreferencesIfComplete](self, "_eventPayloadFromPreferencesIfComplete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("size_choice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size_choice"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("child_setup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("child_setup"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("child_size_choice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("child_size_choice"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("child_age"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("child_age"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02318]), "initWithChoice:childSetup:childChoice:childAge:", v7, v11, v14, v17);
    -[BYAnalyticsEventAppearance setShouldRemoveAnalyticsEventPayloadFromPreferences:](self, "setShouldRemoveAnalyticsEventPayloadFromPreferences:", 1);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_analyticsManagerDidProduceLazyEvents
{
  void *v3;

  if (-[BYAnalyticsEventAppearance shouldRemoveAnalyticsEventPayloadFromPreferences](self, "shouldRemoveAnalyticsEventPayloadFromPreferences"))
  {
    -[BYAnalyticsEventAppearance buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:onlyFromMemory:", CFSTR("AppearanceAnalyticsEventPayload"), 0);

    -[BYAnalyticsEventAppearance setShouldRemoveAnalyticsEventPayloadFromPreferences:](self, "setShouldRemoveAnalyticsEventPayloadFromPreferences:", 0);
  }
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return (BYPreferencesController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldRemoveAnalyticsEventPayloadFromPreferences
{
  return self->_shouldRemoveAnalyticsEventPayloadFromPreferences;
}

- (void)setShouldRemoveAnalyticsEventPayloadFromPreferences:(BOOL)a3
{
  self->_shouldRemoveAnalyticsEventPayloadFromPreferences = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
}

- (void)didChooseToSetUpForChild:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "preexisting appearance analytics payload was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_eventPayloadFromPreferencesIfComplete
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E92000, log, OS_LOG_TYPE_DEBUG, "skipping appearance analytics because child has not selected yet", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
