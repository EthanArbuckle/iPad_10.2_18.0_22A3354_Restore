@implementation STBlueprintBackedDowntimeOverrideModifier

- (STBlueprintBackedDowntimeOverrideModifier)initWithDowntimeBlueprint:(id)a3
{
  STBlueprint *v4;
  STBlueprintBackedDowntimeOverrideModifier *v5;
  STBlueprint *downtimeBlueprint;
  objc_super v8;

  v4 = (STBlueprint *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STBlueprintBackedDowntimeOverrideModifier;
  v5 = -[STBlueprintBackedDowntimeOverrideModifier init](&v8, sel_init);
  downtimeBlueprint = v5->_downtimeBlueprint;
  v5->_downtimeBlueprint = v4;

  return v5;
}

- (STDowntimeOverride)activeOverride
{
  void *v2;
  void *v3;

  -[STBlueprintBackedDowntimeOverrideModifier downtimeBlueprint](self, "downtimeBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STDowntimeOverride *)v3;
}

- (BOOL)applyDowntimeOverride:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[STBlueprintBackedDowntimeOverrideModifier downtimeBlueprint](self, "downtimeBlueprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "override");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STDowntimeOverrideTransformer coreOverrideFromDowntimeOverride:existingDowntimeOverride:inContext:](STDowntimeOverrideTransformer, "coreOverrideFromDowntimeOverride:existingDowntimeOverride:inContext:", v6, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOverride:", v10);
  objc_msgSend(v7, "setIsDirty:", 1);
  -[STBlueprintBackedDowntimeOverrideModifier _deleteOrphanedOrTombstonedDowntimeOverridesInContext:](self, "_deleteOrphanedOrTombstonedDowntimeOverridesInContext:", v8);
  v21 = 0;
  v11 = -[STBlueprintBackedDowntimeOverrideModifier _saveWithError:](self, "_saveWithError:", &v21);
  v12 = v21;
  if (v11)
  {
    +[STLog blueprint](STLog, "blueprint");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1D22E7000, v13, OS_LOG_TYPE_DEFAULT, "Saved downtime override: %@", buf, 0xCu);
    }
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[STBlueprintBackedDowntimeOverrideModifier applyDowntimeOverride:error:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)removeDowntimeOverrideWithError:(id *)a3
{
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v15[16];

  -[STBlueprintBackedDowntimeOverrideModifier _tombstoneDowntimeOverride](self, "_tombstoneDowntimeOverride");
  v5 = -[STBlueprintBackedDowntimeOverrideModifier _saveWithError:](self, "_saveWithError:", a3);
  if (v5)
  {
    +[STLog blueprint](STLog, "blueprint");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "Removed downtime override", v15, 2u);
    }
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[STBlueprintBackedDowntimeOverrideModifier removeDowntimeOverrideWithError:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return v5;
}

- (BOOL)_saveWithError:(id *)a3
{
  char v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  -[STBlueprintBackedDowntimeOverrideModifier downtimeBlueprint](self, "downtimeBlueprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "hasChanges"))
  {
    v10 = 0;
    v5 = objc_msgSend(v7, "save:", &v10);
    v8 = v10;
    if (a3)
    {
      v8 = objc_retainAutorelease(v8);
      *a3 = v8;
    }
  }
  else
  {
    v8 = 0;
    v5 = 1;
  }

  return v5;
}

- (void)_deleteOrphanedOrTombstonedDowntimeOverridesInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[STCoreDowntimeOverride fetchRequest](STCoreDowntimeOverride, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil OR %K == YES"), CFSTR("downtime"), CFSTR("isTombstoned"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v25 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v10);
    }

    +[STLog blueprint](STLog, "blueprint");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl(&dword_1D22E7000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %@ orphaned/tombstoned downtime overrides", buf, 0xCu);

    }
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[STBlueprintBackedDowntimeOverrideModifier _deleteOrphanedOrTombstonedDowntimeOverridesInContext:].cold.1((uint64_t)v7, v13, v15, v16, v17, v18, v19, v20);
  }

}

- (void)_tombstoneDowntimeOverride
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[STBlueprintBackedDowntimeOverrideModifier downtimeBlueprint](self, "downtimeBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "override");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setIsTombstoned:", 1);
    objc_msgSend(v2, "setIsDirty:", 1);
    +[STLog blueprint](STLog, "blueprint");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      v6 = "Tombstoning existing downtime override: %@";
      v7 = v5;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1D22E7000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      v6 = "No existing downtime override - nothing to do";
      v7 = v5;
      v8 = 2;
      goto LABEL_6;
    }
  }

}

- (STBlueprint)downtimeBlueprint
{
  return (STBlueprint *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeBlueprint, 0);
}

- (void)applyDowntimeOverride:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to save downtime override: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeDowntimeOverrideWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a1, a3, "Failed to save downtime override removal: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteOrphanedOrTombstonedDowntimeOverridesInContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Could not fetch orphaned/tombstoned downtime overrides: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
