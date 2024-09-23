@implementation PKBiometrics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PKBiometrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_sharedInstance_2;
}

void __30__PKBiometrics_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (PKBiometrics)init
{
  PKBiometrics *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  BKDevicePearl *pearlDevice;
  NSObject *v13;
  uint64_t v14;
  BKDeviceTouchID *touchIDDevice;
  int *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  uint8_t v25[4];
  uint64_t v26;
  uint8_t v27[4];
  uint64_t v28;
  uint8_t v29[4];
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKBiometrics;
  v2 = -[PKBiometrics init](&v24, sel_init);
  if (v2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(MEMORY[0x1E0D02800], "availableDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (!v4)
      goto LABEL_20;
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v17 = &v30;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "type", v17);
        if (v9 == 1)
        {
          v18 = 0;
          objc_msgSend(MEMORY[0x1E0D02818], "deviceWithDescriptor:error:", v8, &v18);
          v14 = objc_claimAutoreleasedReturnValue();
          v11 = v18;
          touchIDDevice = v2->_touchIDDevice;
          v2->_touchIDDevice = (BKDeviceTouchID *)v14;

          if (v11)
            goto LABEL_18;
          _PSLoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[PKBiometrics init].cold.3(v27, &v28, v13);
          goto LABEL_15;
        }
        if (v9 == 2)
        {
          v19 = 0;
          objc_msgSend(MEMORY[0x1E0D02810], "deviceWithDescriptor:error:", v8, &v19);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = v19;
          pearlDevice = v2->_pearlDevice;
          v2->_pearlDevice = (BKDevicePearl *)v10;

          if (v11)
            goto LABEL_18;
          _PSLoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[PKBiometrics init].cold.2(v29, v17, v13);
LABEL_15:

          goto LABEL_18;
        }
        _PSLoggingFacility();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[PKBiometrics init].cold.1(v25, v8, &v26, v11);
LABEL_18:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      if (!v5)
      {
LABEL_20:

        return v2;
      }
    }
  }
  return v2;
}

- (id)identitiesForIdentityType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  -[PKBiometrics deviceForType:](self, "deviceForType:", -[PKBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "identitiesWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PKBiometrics identitiesForIdentityType:].cold.1();

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (int64_t)maximumIdentityCountForIdentityType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  NSObject *v7;
  id v9;

  -[PKBiometrics deviceForType:](self, "deviceForType:", -[PKBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "maxIdentityCountWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PKBiometrics maximumIdentityCountForIdentityType:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)nameForIdentity:(id)a3
{
  return (id)objc_msgSend(a3, "name");
}

- (BOOL)setName:(id)a3 forIdentity:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;

  v6 = a4;
  objc_msgSend(v6, "setName:", a3);
  -[PKBiometrics deviceForType:](self, "deviceForType:", -[PKBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", objc_msgSend(v6, "type")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "updateIdentity:error:", v6, &v12);

  v9 = v12;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("PKBiometricsDidUpdate"), 0);
  }
  else
  {
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PKBiometrics setName:forIdentity:].cold.1();
  }

  return v8;
}

- (BOOL)removeIdentity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;

  v4 = a3;
  -[PKBiometrics deviceForType:](self, "deviceForType:", -[PKBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", objc_msgSend(v4, "type")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "removeIdentity:error:", v4, &v10);

  v7 = v10;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v8, "postNotificationName:object:", CFSTR("PKBiometricsDidUpdate"), 0);
  }
  else
  {
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PKBiometrics removeIdentity:].cold.1();
  }

  return v6;
}

- (BOOL)isPeriocularEnrollmentSupported
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  NSObject *v8;
  id v10;

  -[PKBiometrics pearlDevice](self, "pearlDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PKBiometrics pearlDevice](self, "pearlDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "supportsPeriocularEnrollmentWithError:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PKBiometrics isPeriocularEnrollmentSupported].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)deviceForType:(int64_t)a3
{
  void *v3;
  NSObject *v4;

  if (a3 == 1)
  {
    -[PKBiometrics touchIDDevice](self, "touchIDDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    -[PKBiometrics pearlDevice](self, "pearlDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _PSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PKBiometrics deviceForType:].cold.1();

    v3 = 0;
  }
  return v3;
}

- (int64_t)deviceTypeForIdentityType:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;

  v3 = a3;
  if (a3 != 2 && a3 != 1)
  {
    _PSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PKBiometrics deviceTypeForIdentityType:].cold.1();

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)nextIdentityNameForIdentityType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  unint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v38 = 0u;
  +[PKBiometrics sharedInstance](PKBiometrics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identitiesForIdentityType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v9), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);
  }

  +[PKBiometrics sharedInstance](PKBiometrics, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maximumIdentityCountForIdentityType:", a3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v14, "setNumberStyle:", 0);
  if (v12)
  {
    for (i = 1; i <= v12; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromNumber:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3 == 1)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        PSLocalizableMesaStringForKey(CFSTR("IDENTITY_NAME_FORMAT"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v22, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else if (a3 == 2)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        PSLocalizablePearlStringForKey(CFSTR("IDENTITY_NAME_FORMAT"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Identity %@"), v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "addObject:", v20);

    }
  }
  v23 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke;
  v36[3] = &unk_1E4A674D8;
  v24 = v4;
  v37 = v24;
  objc_msgSend(v13, "indexesOfObjectsPassingTest:", v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0x7FFFFFFFFFFFFFFFLL;
  v29[0] = v23;
  v29[1] = 3221225472;
  v29[2] = __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke_2;
  v29[3] = &unk_1E4A67500;
  v26 = v24;
  v30 = v26;
  v31 = &v32;
  objc_msgSend(v25, "enumerateRangesWithOptions:usingBlock:", 2, v29);
  if (v33[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v32, 8);
  return v27;
}

uint64_t __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

unint64_t __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= a2 && result - a2 < a3)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "count");
    a2 = result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BKDevicePearl)pearlDevice
{
  return self->_pearlDevice;
}

- (void)setPearlDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pearlDevice, a3);
}

- (BKDeviceTouchID)touchIDDevice
{
  return self->_touchIDDevice;
}

- (void)setTouchIDDevice:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDDevice, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

- (void)init
{
  *(_DWORD *)a1 = 138412290;
  *a2 = 0;
}

- (void)identitiesForIdentityType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_11();
}

- (void)maximumIdentityCountForIdentityType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_11();
}

- (void)setName:forIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1A3819000, v0, v1, "An error occured while updating the identity name: %@", v2);
  OUTLINED_FUNCTION_11();
}

- (void)removeIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1A3819000, v0, v1, "An error occured while removing the identity: %@", v2);
  OUTLINED_FUNCTION_11();
}

- (void)isPeriocularEnrollmentSupported
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1A3819000, v0, v1, "Failed to check periocular support status: %@.", v2);
  OUTLINED_FUNCTION_11();
}

- (void)deviceForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11();
}

- (void)deviceTypeForIdentityType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11();
}

@end
