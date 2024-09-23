@implementation PSUIBiometrics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__PSUIBiometrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __32__PSUIBiometrics_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (PSUIBiometrics)init
{
  PSUIBiometrics *v2;
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

  v32 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)PSUIBiometrics;
  v2 = -[PSUIBiometrics init](&v24, sel_init);
  if (v2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(MEMORY[0x24BE0CE28], "availableDevices");
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
          objc_msgSend(MEMORY[0x24BE0CE40], "deviceWithDescriptor:error:", v8, &v18);
          v14 = objc_claimAutoreleasedReturnValue();
          v11 = v18;
          touchIDDevice = v2->_touchIDDevice;
          v2->_touchIDDevice = (BKDeviceTouchID *)v14;

          if (v11)
            goto LABEL_18;
          PSUILogForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[PSUIBiometrics init].cold.3(v27, &v28, v13);
          goto LABEL_15;
        }
        if (v9 == 2)
        {
          v19 = 0;
          objc_msgSend(MEMORY[0x24BE0CE38], "deviceWithDescriptor:error:", v8, &v19);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = v19;
          pearlDevice = v2->_pearlDevice;
          v2->_pearlDevice = (BKDevicePearl *)v10;

          if (v11)
            goto LABEL_18;
          PSUILogForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[PSUIBiometrics init].cold.2(v29, v17, v13);
LABEL_15:

          goto LABEL_18;
        }
        PSUILogForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[PSUIBiometrics init].cold.1(v25, v8, &v26, v11);
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

+ (id)identities
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0CE60], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identities:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)identitiesForIdentityType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "identitiesWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    PSUILogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics identitiesForIdentityType:].cold.1();

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

  -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "maxIdentityCountWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    PSUILogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics maximumIdentityCountForIdentityType:].cold.1();

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
  -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", objc_msgSend(v6, "type")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "updateIdentity:error:", v6, &v12);

  v9 = v12;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("PSUIBiometricsDidUpdate"), 0);
  }
  else
  {
    PSUILogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics setName:forIdentity:].cold.1();
  }

  return v8;
}

- (void)setName:(id)a3 forIdentity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "setName:", a3);
  -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", objc_msgSend(v9, "type")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke;
  v12[3] = &unk_24F9E40F0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "updateIdentity:reply:", v9, v12);

}

void __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_5);
  }
  else
  {
    PSUILogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics setName:forIdentity:].cold.1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke_2;
  block[3] = &unk_24F9E47D8;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke_6()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PSUIBiometricsDidUpdate"), 0);

}

uint64_t __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
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
  -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", objc_msgSend(v4, "type")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "removeIdentity:error:", v4, &v10);

  v7 = v10;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v8, "postNotificationName:object:", CFSTR("PSUIBiometricsDidUpdate"), 0);
  }
  else
  {
    PSUILogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics removeIdentity:].cold.1();
  }

  return v6;
}

- (void)removeIdentity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", objc_msgSend(v7, "type")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__PSUIBiometrics_removeIdentity_completion___block_invoke;
  v10[3] = &unk_24F9E40F0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "removeIdentity:reply:", v7, v10);

}

void __44__PSUIBiometrics_removeIdentity_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_9);
  }
  else
  {
    PSUILogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics removeIdentity:].cold.1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__PSUIBiometrics_removeIdentity_completion___block_invoke_2;
  block[3] = &unk_24F9E47D8;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __44__PSUIBiometrics_removeIdentity_completion___block_invoke_8()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PSUIBiometricsDidUpdate"), 0);

}

uint64_t __44__PSUIBiometrics_removeIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
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

  -[PSUIBiometrics pearlDevice](self, "pearlDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PSUIBiometrics pearlDevice](self, "pearlDevice");
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
    PSUILogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics isPeriocularEnrollmentSupported].cold.1();

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
    -[PSUIBiometrics touchIDDevice](self, "touchIDDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    -[PSUIBiometrics pearlDevice](self, "pearlDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PSUILogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics deviceForType:].cold.1();

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
    PSUILogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PSUIBiometrics deviceTypeForIdentityType:].cold.1();

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
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  unint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v36 = 0u;
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identitiesForIdentityType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
  }

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maximumIdentityCountForIdentityType:", a3);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v14, "setNumberStyle:", 0);
  if (v12)
  {
    for (j = 1; j <= v12; ++j)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", j);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromNumber:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3 == 1 || a3 == 2)
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        PSLocalizableMesaStringForKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown Identity %@"), v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "addObject:", v20);

    }
  }
  v21 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke;
  v34[3] = &unk_24F9E4820;
  v22 = v4;
  v35 = v22;
  objc_msgSend(v13, "indexesOfObjectsPassingTest:", v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke_2;
  v27[3] = &unk_24F9E4848;
  v24 = v22;
  v28 = v24;
  v29 = &v30;
  objc_msgSend(v23, "enumerateRangesWithOptions:usingBlock:", 2, v27);
  if (v31[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v30, 8);
  return v25;
}

uint64_t __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

unint64_t __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, _BYTE *a4)
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

- (BOOL)isBiometricEditingAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFingerprintModificationAllowed");

  return v3;
}

- (BOOL)shouldRestrictFeaturesRequiringEnrollment
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend((id)objc_opt_class(), "identities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    LOBYTE(v4) = 0;
  else
    v4 = !-[PSUIBiometrics isBiometricEditingAllowed](self, "isBiometricEditingAllowed");

  return v4;
}

- (BOOL)isFingerprintUnlockAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63948]) == 1;

  return v3;
}

- (BOOL)isTouchIDUnlockRestricted
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63948]) & 1) != 0
    || -[PSUIBiometrics shouldRestrictFeaturesRequiringEnrollment](self, "shouldRestrictFeaturesRequiringEnrollment");

  return v4;
}

- (BOOL)isEnrolledInFaceID
{
  void *v2;
  BOOL v3;

  -[PSUIBiometrics identitiesForIdentityType:](self, "identitiesForIdentityType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1();
}

- (void)maximumIdentityCountForIdentityType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1();
}

- (void)setName:forIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, v0, v1, "An error occured while updating the identity name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)removeIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, v0, v1, "An error occured while removing the identity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)isPeriocularEnrollmentSupported
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, v0, v1, "Failed to check periocular support status: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)deviceForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_1();
}

- (void)deviceTypeForIdentityType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_1();
}

@end
