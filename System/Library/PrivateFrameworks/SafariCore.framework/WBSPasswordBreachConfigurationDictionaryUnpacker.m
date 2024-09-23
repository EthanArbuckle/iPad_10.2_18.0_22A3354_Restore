@implementation WBSPasswordBreachConfigurationDictionaryUnpacker

- (WBSPasswordBreachConfigurationDictionaryUnpacker)initWithDictionary:(id)a3
{
  id v5;
  WBSPasswordBreachConfigurationDictionaryUnpacker *v6;
  WBSPasswordBreachConfigurationDictionaryUnpacker *v7;
  WBSPasswordBreachConfigurationDictionaryUnpacker *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachConfigurationDictionaryUnpacker;
  v6 = -[WBSPasswordBreachConfigurationDictionaryUnpacker init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_valueOfClass:(Class)a3 forKey:(id)a4 required:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a5;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v5)
    {
      v9 = 0;
      goto LABEL_11;
    }
    v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:].cold.1();
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:].cold.2();
LABEL_9:
    v9 = 0;
    self->_errorOccurred = 1;
    goto LABEL_11;
  }
  v9 = v8;
LABEL_11:

  return v9;
}

- (id)stringForKey:(id)a3 minimumLength:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;

  v6 = a3;
  -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:](self, "_valueOfClass:forKey:required:", objc_opt_class(), v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "length") < a4)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachConfigurationDictionaryUnpacker stringForKey:minimumLength:].cold.1();
      self->_errorOccurred = 1;
    }
    v10 = v8;
  }
  else
  {
    v10 = &stru_1E64A2498;
  }

  return v10;
}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;

  v4 = a3;
  -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:](self, "_valueOfClass:forKey:required:", objc_opt_class(), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachConfigurationDictionaryUnpacker URLForKey:].cold.1();
      self->_errorOccurred = 1;
      v8 = objc_alloc_init(MEMORY[0x1E0C99E98]);
    }
    v9 = v8;

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E98]);
  }

  return v9;
}

- (unint64_t)unsignedIntegerForKey:(id)a3 minimumValue:(unint64_t)a4 maximumValue:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  NSObject *v12;
  unint64_t v13;
  int v15;
  id v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:](self, "_valueOfClass:forKey:required:", objc_opt_class(), v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  if (v10 < a4 || v10 > a5)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = v8;
      v17 = 2048;
      v18 = a4;
      v19 = 2048;
      v20 = a5;
      _os_log_error_impl(&dword_1B2621000, v12, OS_LOG_TYPE_ERROR, "Value for configuration key %@ must be between %ld and %ld (inclusive).", (uint8_t *)&v15, 0x20u);
    }
    self->_errorOccurred = 1;
  }
  v13 = objc_msgSend(v9, "unsignedIntegerValue");

  return v13;
}

- (id)sortedUnsignedIntegerArrayForKey:(id)a3 minimumValue:(unint64_t)a4 maximumValue:(unint64_t)a5 ascending:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v6 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:](self, "_valueOfClass:forKey:required:", objc_opt_class(), v10, 1);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v6 - 1;
    v15 = *(_QWORD *)v27;
    v25 = v10;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        v10 = v25;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[WBSPasswordBreachConfigurationDictionaryUnpacker sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:].cold.2();
        goto LABEL_24;
      }
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
      if (v18 < a4 || v18 > a5)
        break;
      if (v6)
      {
        if (v18 < v14)
          goto LABEL_22;
      }
      else if (v18 > v14)
      {
LABEL_22:
        v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        v10 = v25;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[WBSPasswordBreachConfigurationDictionaryUnpacker sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:].cold.1();
LABEL_24:
        self->_errorOccurred = 1;

        v20 = 0;
        goto LABEL_25;
      }
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        v10 = v25;
        if (v13)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    v22 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    v10 = v25;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v31 = v25;
      v32 = 2048;
      v33 = a4;
      v34 = 2048;
      v35 = a5;
      _os_log_error_impl(&dword_1B2621000, v22, OS_LOG_TYPE_ERROR, "Value for configuration key %@ must be between %ld and %ld (inclusive).", buf, 0x20u);
    }
    goto LABEL_24;
  }
LABEL_17:

  v20 = v11;
LABEL_25:

  return v20;
}

- (id)dataFromHexStringForKey:(id)a3 expectedLength:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:](self, "_valueOfClass:forKey:required:", objc_opt_class(), v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "safari_dataWithHexString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7 && (v11 = objc_msgSend(v9, "length"), v11 != objc_msgSend(v7, "unsignedLongValue")))
    {
      v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = v14;
        v17 = 138412802;
        v18 = v6;
        v19 = 2048;
        v20 = objc_msgSend(v7, "unsignedLongValue");
        v21 = 2048;
        v22 = objc_msgSend(v10, "length");
        _os_log_error_impl(&dword_1B2621000, v16, OS_LOG_TYPE_ERROR, "Value for configuration key %@ has unexpected length: %lu != %lu.", (uint8_t *)&v17, 0x20u);

      }
      v12 = 0;
      self->_errorOccurred = 1;
    }
    else
    {
      v12 = v10;
    }

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachConfigurationDictionaryUnpacker dataFromHexStringForKey:expectedLength:].cold.1();
    v12 = 0;
    self->_errorOccurred = 1;
  }

  return v12;
}

- (BOOL)optionalBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WBSPasswordBreachConfigurationDictionaryUnpacker _valueOfClass:forKey:required:](self, "_valueOfClass:forKey:required:", objc_opt_class(), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)_valueOfClass:forKey:required:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Configuration missing required key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_valueOfClass:forKey:required:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Value for configuration key %@ is not of expected type %@.");
  OUTLINED_FUNCTION_1_1();
}

- (void)stringForKey:minimumLength:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Value for configuration key %@ must contain at least %lu characters.");
  OUTLINED_FUNCTION_1_1();
}

- (void)URLForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Value for configuration key %@ is not a valid URL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Value for configuration key %@ must be sorted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)sortedUnsignedIntegerArrayForKey:minimumValue:maximumValue:ascending:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Value for configuration key %@ contains a non-number.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)dataFromHexStringForKey:expectedLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Value for configuration key %@ is not a string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
