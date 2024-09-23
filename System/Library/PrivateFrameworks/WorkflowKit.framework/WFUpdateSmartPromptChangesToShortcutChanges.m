@implementation WFUpdateSmartPromptChangesToShortcutChanges

void __WFUpdateSmartPromptChangesToShortcutChanges_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFDatabaseObjectTypeForEntityName(v5);

  if (v6 == 8)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectWithID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortcut");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
      v9 = *(void **)(a1 + 48);
      objc_msgSend(v8, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
    else
    {
      getWFDatabaseLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = 136315138;
        v13 = "WFUpdateSmartPromptChangesToShortcutChanges_block_invoke";
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Found an orphaned WFCoreDataSmartPromptPermission, which should never happen", (uint8_t *)&v12, 0xCu);
      }

    }
  }

}

uint64_t __WFUpdateSmartPromptChangesToShortcutChanges_block_invoke_464(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

@end
