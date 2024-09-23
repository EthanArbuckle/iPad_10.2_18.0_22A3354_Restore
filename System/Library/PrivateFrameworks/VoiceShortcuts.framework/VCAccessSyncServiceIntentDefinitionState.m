@implementation VCAccessSyncServiceIntentDefinitionState

BOOL __VCAccessSyncServiceIntentDefinitionState_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0DD9E08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    getWFWatchSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "VCAccessSyncServiceIntentDefinitionState_block_invoke";
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s VCIntentDefinitionSyncDataHandler failed to deserialize sync state into dictionary: %{public}@", buf, 0x16u);
    }

  }
  if (!v4)
    v4 = (void *)objc_opt_new();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0DD9E08], "JSONDictionaryFromModel:error:", v4, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = v7 != 0;
    if (v7)
    {
      objc_msgSend(v3, "removeAllObjects");
      objc_msgSend(v3, "addEntriesFromDictionary:", v7);
    }
    else
    {
      getWFWatchSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "VCAccessSyncServiceIntentDefinitionState_block_invoke";
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s VCIntentDefinitionSyncDataHandler failed to serialize sync state into dictionary: %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
