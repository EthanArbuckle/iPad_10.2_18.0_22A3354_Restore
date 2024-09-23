@implementation WBSPasswordBreachConfigurationBag

- (WBSPasswordBreachConfigurationBag)initWithSnapshotData:(id)a3 error:(id *)a4
{
  void *v6;
  WBSPasswordBreachConfigurationBag *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithJSONOrPropertyListData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSPasswordBreachConfigurationBag initWithSnapshotData:error:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      if (a4)
        goto LABEL_5;
    }
    else if (a4)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v7 = 0;
    goto LABEL_8;
  }
  self = -[WBSPasswordBreachConfigurationBag initWithBagDictionary:](self, "initWithBagDictionary:", v6);
  v7 = self;
LABEL_8:

  return v7;
}

- (WBSPasswordBreachConfigurationBag)initWithBagDictionary:(id)a3
{
  id v4;
  WBSPasswordBreachConfigurationBag *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  WBSPasswordBreachConfigurationBag *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *bag;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WBSPasswordBreachConfigurationBag;
  v5 = -[WBSPasswordBreachConfigurationBag init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("BagVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((unint64_t)objc_msgSend(v6, "unsignedIntegerValue") < 2)
      {
        v18 = objc_msgSend(v4, "copy");
        bag = v5->_bag;
        v5->_bag = (NSDictionary *)v18;

        v9 = v5;
        goto LABEL_11;
      }
      v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachConfigurationBag initWithBagDictionary:].cold.2((uint64_t)v7, v8);
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachConfigurationBag initWithBagDictionary:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)firstConfigurationForSupportedProtocolVersion:(unint64_t)a3 rampIdentifier:(unint64_t)a4 allowValuesForTesting:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  _BOOL4 v25;
  uint8_t buf[16];
  uint8_t v27;
  _BYTE v28[15];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[16];
  _BYTE v34[128];
  uint64_t v35;

  v25 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  -[NSDictionary safari_arrayContainingObjectsOfClass:forKey:](self->_bag, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("Configurations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C30]), "initWithDictionary:", v14);
          objc_msgSend(v15, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("ProtocolVersion"), 1, a3);
          if (objc_msgSend(v15, "errorOccurred"))
          {
            v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[WBSPasswordBreachConfigurationBag firstConfigurationForSupportedProtocolVersion:rampIdentifier:allowValuesForTesting:].cold.1(v33, &v33[1], v16);
          }
          else
          {
            objc_msgSend(v15, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("MaximumRampIdentifier"), a4, -1);
            if (objc_msgSend(v15, "errorOccurred"))
            {
              v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                -[WBSPasswordBreachConfigurationBag firstConfigurationForSupportedProtocolVersion:rampIdentifier:allowValuesForTesting:].cold.2(&v27, v28, v17);
            }
            else
            {
              v18 = objc_alloc(MEMORY[0x1E0D89C28]);
              v19 = objc_msgSend(v18, "initWithDictionary:protocolClasses:allowValuesForTesting:", v14, MEMORY[0x1E0C9AA60], v25);
              if (v19)
              {
                v21 = (void *)v19;

                goto LABEL_23;
              }
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v11)
          continue;
        break;
      }
    }

    v20 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_INFO, "No valid configuration available in the bag.", buf, 2u);
    }
    v21 = 0;
LABEL_23:
    v8 = v24;
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_INFO, "No configurations were found in the bag.", v33, 2u);
    }
    v21 = 0;
  }

  return v21;
}

- (id)snapshotData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_bag, 200, 0, 0);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, bag: %@>"), objc_opt_class(), self, self->_bag);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Failed to decode configuration bag plist data.", a5, a6, a7, a8, 0);
}

- (void)initWithBagDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Missing bag version.", a5, a6, a7, a8, 0);
}

- (void)initWithBagDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Unsupported bag version %@", (uint8_t *)&v2, 0xCu);
}

- (void)firstConfigurationForSupportedProtocolVersion:(uint8_t *)a1 rampIdentifier:(_BYTE *)a2 allowValuesForTesting:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_15(&dword_1A3D90000, (int)a2, a3, "Skipping configuration with ineligible protocol version.", a1);
}

- (void)firstConfigurationForSupportedProtocolVersion:(uint8_t *)a1 rampIdentifier:(_BYTE *)a2 allowValuesForTesting:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_15(&dword_1A3D90000, (int)a2, a3, "Skipping configuration with ineligible maximum ramp identifier.", a1);
}

@end
