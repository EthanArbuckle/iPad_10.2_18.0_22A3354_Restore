@implementation WFTriggerMigrator

+ (id)migrateTriggerUponUnarchival:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "migratedUserFocusActivityTriggerFromLegacyDNDTrigger:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
  }
  v6 = v5;

  return v6;
}

+ (id)migratedUserFocusActivityTriggerFromLegacyDNDTrigger:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  WFUserFocusActivityTrigger *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[WFTriggerMigrator migratedUserFocusActivityTriggerFromLegacyDNDTrigger:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s [Migration] Migrating from pre-Sky WFDNDTrigger to WFUserFocusActivityTrigger", buf, 0xCu);
  }

  +[WFFocusModesManager availableModes](WFFocusModesManager, "availableModes");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "activityIdentifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.default"));

        if ((v12 & 1) != 0)
        {
          v14 = -[WFUserFocusActivityTrigger initWithActivity:]([WFUserFocusActivityTrigger alloc], "initWithActivity:", v10);
          -[WFUserFocusActivityTrigger setOnEnable:](v14, "setOnEnable:", objc_msgSend(v3, "onEnable"));
          -[WFUserFocusActivityTrigger setOnDisable:](v14, "setOnDisable:", objc_msgSend(v3, "onDisable"));

          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  getWFTriggersLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[WFTriggerMigrator migratedUserFocusActivityTriggerFromLegacyDNDTrigger:]";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s [Migration] Unable to find Do Not Disturb focus so unable to migrate to a WFUserFocusActivityTrigger. Returning the original WFDNDTrigger.", buf, 0xCu);
  }

  v14 = (WFUserFocusActivityTrigger *)v3;
LABEL_15:

  return v14;
}

+ (id)migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "+[WFTriggerMigrator migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:]";
    v30 = 2112;
    v31 = v3;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s [Migration] Migrating from unique identifier to semantic identifier on WFUserFocusActivityTrigger (%@)", buf, 0x16u);
  }

  objc_msgSend(v3, "activitySemanticIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[WFTriggerMigrator migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:]";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s [Migration] Trigger already has a semantic identifier, moving on", buf, 0xCu);
    }

    v7 = v3;
  }
  else
  {
    objc_msgSend(v3, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFocusModesManager availableModes](WFFocusModesManager, "availableModes");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "activityUniqueIdentifier", (_QWORD)v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v8);

          if (v17)
          {
            objc_msgSend(v14, "activityIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setActivitySemanticIdentifier:", v20);

            v21 = v3;
            goto LABEL_19;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
    }

    getWFTriggersLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[WFTriggerMigrator migrateUserFocusActivityTriggerFromUniqueIdentifierToSemanticIdentifier:]";
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s [Migration] Unable to find a focus that matches the trigger. Returning the original trigger without a semantic identifier.", buf, 0xCu);
    }

    v19 = v3;
LABEL_19:

  }
  return v3;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  void *v5;

  objc_msgSend((id)objc_opt_class(), "migrateTriggerUponUnarchival:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
