@implementation PETConfig

void __45__PETConfig__enumerateGroupConfigsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v4 = v6;
    objc_msgSend(v3, "pet_dictForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __35__PETConfig__configForMessageName___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;

  objc_msgSend(a3, "pet_dictForKey:", CFSTR("message_whitelist"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pet_dictForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
    *a4 = 1;
  }

}

- (id)bucketsForMessageName:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PETConfig _configForMessageName:](self, "_configForMessageName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pet_arrayForKey:", CFSTR("hist_buckets"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v4;
LABEL_11:

  return v9;
}

- (id)_configForMessageName:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__555;
  v15 = __Block_byref_object_dispose__556;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PETConfig__configForMessageName___block_invoke;
  v8[3] = &unk_1E2A41118;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PETConfig _enumerateGroupConfigsWithBlock:](self, "_enumerateGroupConfigsWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_enumerateGroupConfigsWithBlock:(id)a3
{
  id v4;
  NSDictionary *messageGroups;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  messageGroups = self->_messageGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PETConfig__enumerateGroupConfigsWithBlock___block_invoke;
  v7[3] = &unk_1E2A410F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](messageGroups, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (PETConfig)initWithFile:(id)a3
{
  id v4;
  PETConfig *v5;
  PETConfig *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  PETConfig *v12;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PETConfig;
  v5 = -[PETConfig init](&v15, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("bin"));

    if (v8)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0D815D0], "propertyListWithPath:error:", v4, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (v10)
      {
        v11 = v10;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error loading pet config lazy plist: %@", buf, 0xCu);
        }
        AnalyticsSendEvent();

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v9)
    {
      v6 = -[PETConfig initWithDictionary:](v6, "initWithDictionary:", v9);

      v12 = v6;
LABEL_15:

      goto LABEL_16;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error loading pet config. File is missing or corrupted: %@", buf, 0xCu);
    }
    AnalyticsSendEvent();
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (void)writeToFile:(id)a3
{
  -[NSDictionary writeToFile:atomically:](self->_configDictionary, "writeToFile:atomically:", a3, 1);
}

- (PETConfig)initWithDictionary:(id)a3
{
  id v5;
  PETConfig *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *messageGroups;
  PETConfig *v10;
  uint8_t v12[16];
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETConfig;
  v6 = -[PETConfig init](&v13, sel_init);
  if (!v6)
    goto LABEL_4;
  if (+[PETConfigValidator configIsValid:](PETConfigValidator, "configIsValid:", v5))
  {
    objc_storeStrong((id *)&v6->_configDictionary, a3);
    -[NSDictionary pet_numForKey:](v6->_configDictionary, "pet_numForKey:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_version = objc_msgSend(v7, "unsignedIntegerValue");

    -[NSDictionary pet_dictForKey:](v6->_configDictionary, "pet_dictForKey:", CFSTR("message_groups"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageGroups = v6->_messageGroups;
    v6->_messageGroups = (NSDictionary *)v8;

LABEL_4:
    v10 = v6;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Configuration format is not valid", v12, 2u);
  }
  AnalyticsSendEvent();
  v10 = 0;
LABEL_8:

  return v10;
}

- (unint64_t)samplingLimitForMessageGroup:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("default")) & 1) != 0)
  {
    v5 = 40960;
  }
  else
  {
    -[NSDictionary pet_dictForKey:](self->_messageGroups, "pet_dictForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pet_numForKey:", CFSTR("sampling_limit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "longValue") < 1 || objc_msgSend(v7, "longValue") > 4294967294)
      v5 = 4096;
    else
      v5 = objc_msgSend(v7, "unsignedIntegerValue");

  }
  return v5;
}

- (id)groupForMessageName:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  __CFString *v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__555;
  v15 = __Block_byref_object_dispose__556;
  v16 = CFSTR("default");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__PETConfig_groupForMessageName___block_invoke;
  v8[3] = &unk_1E2A41118;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PETConfig _enumerateGroupConfigsWithBlock:](self, "_enumerateGroupConfigsWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_groupConfigForMessageName:(id)a3
{
  void *v4;
  void *v5;

  -[PETConfig groupForMessageName:](self, "groupForMessageName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("default")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[NSDictionary pet_dictForKey:](self->_messageGroups, "pet_dictForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_whitelistHelper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  PETConfig *v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PETConfig _configForMessageName:](self, "_configForMessageName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "pet_arrayForKey:", CFSTR("field_whitelist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __30__PETConfig__whitelistHelper___block_invoke;
    v17[3] = &unk_1E2A41140;
    v9 = v5;
    v18 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
    objc_msgSend(v6, "pet_dictForKey:", CFSTR("nested_fields"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __30__PETConfig__whitelistHelper___block_invoke_2;
    v14[3] = &unk_1E2A41168;
    v11 = v9;
    v15 = v11;
    v16 = self;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_nestedFieldsHelper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PETConfig *v13;

  -[PETConfig _configForMessageName:](self, "_configForMessageName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pet_dictForKey:", CFSTR("nested_fields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__PETConfig__nestedFieldsHelper___block_invoke;
    v11[3] = &unk_1E2A41168;
    v8 = v7;
    v12 = v8;
    v13 = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9 = v8;

  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (double)deviceSamplingForMessageName:(id)a3 isSeed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;

  v4 = a4;
  v6 = a3;
  -[PETConfig _groupConfigForMessageName:](self, "_groupConfigForMessageName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "pet_numForKey:", CFSTR("device_sampling"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETConfig _configForMessageName:](self, "_configForMessageName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pet_numForKey:", CFSTR("device_sampling"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;

      v9 = v13;
    }
    if (v4)
    {
      objc_msgSend(v8, "pet_numForKey:", CFSTR("device_sampling_seed"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;

        v9 = v16;
      }
      objc_msgSend(v10, "pet_numForKey:", CFSTR("device_sampling_seed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;

        v9 = v19;
      }

    }
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v21 = v20;
    }
    else
    {
      v21 = 1.0;
    }

  }
  else
  {
    v21 = 1.0;
  }

  return v21;
}

- (double)messageSamplingForMessageName:(id)a3 isSeed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;

  v4 = a4;
  v6 = a3;
  -[PETConfig _groupConfigForMessageName:](self, "_groupConfigForMessageName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "pet_numForKey:", CFSTR("message_sampling"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETConfig _configForMessageName:](self, "_configForMessageName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pet_numForKey:", CFSTR("message_sampling"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;

      v9 = v13;
    }
    if (v4)
    {
      objc_msgSend(v8, "pet_numForKey:", CFSTR("message_sampling_seed"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;

        v9 = v16;
      }
      objc_msgSend(v10, "pet_numForKey:", CFSTR("message_sampling_seed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;

        v9 = v19;
      }

    }
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v21 = v20;
    }
    else
    {
      v21 = 1.0;
    }

  }
  else
  {
    v21 = 1.0;
  }

  return v21;
}

- (unint64_t)sigFigsForMessageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;

  v4 = a3;
  -[PETConfig _groupConfigForMessageName:](self, "_groupConfigForMessageName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pet_numForKey:", CFSTR("sig_figs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETConfig _configForMessageName:](self, "_configForMessageName:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pet_numForKey:", CFSTR("sig_figs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;

      v7 = v11;
    }
    else if (!v7)
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    v12 = objc_msgSend(v7, "unsignedIntegerValue");
LABEL_7:

    goto LABEL_8;
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:

  return v12;
}

- (BOOL)isAggregatedForMessageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;

  v4 = a3;
  -[PETConfig _groupConfigForMessageName:](self, "_groupConfigForMessageName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pet_numForKey:", CFSTR("aggregated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETConfig _configForMessageName:](self, "_configForMessageName:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pet_numForKey:", CFSTR("aggregated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;

      v7 = v11;
    }
    else if (!v7)
    {
      v12 = 1;
      goto LABEL_7;
    }
    v12 = objc_msgSend(v7, "BOOLValue");
LABEL_7:

    goto LABEL_8;
  }
  v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)isTVOSEnabledForMessageName:(id)a3 messageGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;

  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_messageGroups, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PETConfig _groupConfigForMessageName:](self, "_groupConfigForMessageName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v13 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v7, "pet_numForKey:", CFSTR("tvos_enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETConfig _configForMessageName:](self, "_configForMessageName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pet_numForKey:", CFSTR("tvos_enabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;

    v8 = v12;
  }
  else if (!v8)
  {
    v13 = 0;
    goto LABEL_7;
  }
  v13 = objc_msgSend(v8, "BOOLValue");
LABEL_7:

LABEL_8:
  return v13;
}

- (BOOL)isChinaEnabledForMessageName:(id)a3 messageGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;

  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_messageGroups, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PETConfig _groupConfigForMessageName:](self, "_groupConfigForMessageName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v13 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v7, "pet_numForKey:", CFSTR("china_enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETConfig _configForMessageName:](self, "_configForMessageName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pet_numForKey:", CFSTR("china_enabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;

    v8 = v12;
  }
  else if (!v8)
  {
    v13 = 0;
    goto LABEL_7;
  }
  v13 = objc_msgSend(v8, "BOOLValue");
LABEL_7:

LABEL_8:
  return v13;
}

- (BOOL)shouldUploadToParsec
{
  void *v2;
  void *v3;
  char v4;

  -[PETConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pet_numForKey:", CFSTR("upload_to_parsec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldUploadToFBFv2
{
  void *v2;
  void *v3;
  char v4;

  -[PETConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pet_numForKey:", CFSTR("upload_to_fbfv2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldUploadToFBFv2ForCarryAndSeed
{
  void *v2;
  void *v3;
  char v4;

  -[PETConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pet_numForKey:", CFSTR("upload_to_fbfv2_carry_seed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDictionary)configDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_messageGroups, 0);
}

void __33__PETConfig__nestedFieldsHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_nestedFieldsHelper:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
}

uint64_t __30__PETConfig__whitelistHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], a2);
}

void __30__PETConfig__whitelistHelper___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_whitelistHelper:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

  }
}

void __33__PETConfig_groupForMessageName___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "pet_dictForKey:", CFSTR("message_whitelist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pet_dictForKey:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
