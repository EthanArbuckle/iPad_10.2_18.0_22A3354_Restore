@implementation SUCSScheduler

- (SUCSScheduler)init
{
  SUCSScheduler *v2;
  uint64_t v3;
  _CDContext *context;
  _CDContextualChangeRegistration *registration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUCSScheduler;
  v2 = -[SUCSScheduler init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v3 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (_CDContext *)v3;

    registration = v2->_registration;
    v2->_registration = 0;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SUCSScheduler unregisterInstallationAlertAction](self, "unregisterInstallationAlertAction");
  v3.receiver = self;
  v3.super_class = (Class)SUCSScheduler;
  -[SUCSScheduler dealloc](&v3, sel_dealloc);
}

- (void)registerInstallAlertConditionsWithHandler:(id)a3
{
  void (**v4)(id, const __CFString *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _CDContextualChangeRegistration *v20;
  _CDContextualChangeRegistration *registration;
  uint64_t v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, const __CFString *))a3;
  v5 = (void *)MEMORY[0x24BE1B1A0];
  +[SUCSScheduler batteryLevelPredicate:](SUCSScheduler, "batteryLevelPredicate:", &unk_24CE6E220);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  +[SUCSScheduler phoneCallPredicate:](SUCSScheduler, "phoneCallPredicate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  +[SUCSScheduler networkPredicate:](SUCSScheduler, "networkPredicate:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  +[SUCSScheduler carplayPredicate:](SUCSScheduler, "carplayPredicate:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v12, "evaluatePredicate:", v11);

  if ((_DWORD)v7)
  {
    SULogInfo(CFSTR("Installation alert predicate conditions met"), v13, v14, v15, v16, v17, v18, v19, v22);
    v4[2](v4, CFSTR("com.apple.softwareupdateservicesd.installAlert"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.softwareupdateservicesd.installAlert"), v11, v4);
    v20 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue();
    registration = self->_registration;
    self->_registration = v20;

    -[_CDContext registerCallback:](self->_context, "registerCallback:", self->_registration);
  }

}

- (void)unregisterInstallationAlertAction
{
  _CDContextualChangeRegistration *registration;
  _CDContext *context;

  registration = self->_registration;
  if (registration)
  {
    context = self->_context;
    if (context)
    {
      -[_CDContext deregisterCallback:](context, "deregisterCallback:");
      registration = self->_registration;
    }
    self->_registration = 0;

  }
}

+ (id)networkPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B180], "predicateForCellConnectionAvailability:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "predicateForWiFiConnectionAvailability:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE1B1A0];
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)phoneCallPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v3 = a3;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCallInProgressStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForKeyPath:equalToValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCallInProgressStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForKeyPath:equalToValue:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BE1B1A0];
  v16[0] = v7;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)batteryLevelPredicate:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v17;

  v3 = (void *)MEMORY[0x24BE1B1A0];
  v4 = (void *)MEMORY[0x24BE1B180];
  v5 = a3;
  objc_msgSend(v4, "keyPathForBatteryLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryLevel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v6, CFSTR("self.%@.value >= %@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v15 = v7;
  else
    SULogInfo(CFSTR("Failed to create battery level _CDContextualPredicate"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v17);

  return v7;
}

+ (id)carplayPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForKeyPath:equalToValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v15 = v7;
  else
    SULogInfo(CFSTR("Failed to create carplay _CDContextualPredicate"), v8, v9, v10, v11, v12, v13, v14, v17);

  return v7;
}

+ (BOOL)_getBoolForKeyPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE1B170];
  v4 = a3;
  objc_msgSend(v3, "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

+ (int)_getIntForKeyPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE1B170];
  v4 = a3;
  objc_msgSend(v3, "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "intValue");
  return (int)v5;
}

+ (int)_batteryLevel
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "_getIntForKeyPath:", v3);

  return (int)a1;
}

+ (BOOL)_callInProgress
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCallInProgressStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_getBoolForKeyPath:", v3);

  return (char)a1;
}

+ (BOOL)_hasNetworkConnection
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForWiFiConnectionQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "_getIntForKeyPath:", v3);

  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCellConnectionQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "_getIntForKeyPath:", v5);

  return (v4 & a1 & 0x80000000) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
