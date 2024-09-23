@implementation PLSmartConnectorAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSmartConnectorAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Status");
  +[PLSmartConnectorAgent entryEventForwardDefinitionStatus](PLSmartConnectorAgent, "entryEventForwardDefinitionStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("EAStatus");
  v7[0] = v2;
  +[PLSmartConnectorAgent entryEventForwardDefinitionEAStatus](PLSmartConnectorAgent, "entryEventForwardDefinitionEAStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventForwardDefinitionStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653020;
  v14[1] = MEMORY[0x1E0C9AAA0];
  v13[2] = *MEMORY[0x1E0D80308];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("ConnectState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("AccessoryID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionEAStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653030;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("ConnectState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("AccessoryID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PLSmartConnectorAgent)init
{
  PLSmartConnectorAgent *v3;
  PLSmartConnectorAgent *v4;
  void *v5;
  void *v6;
  id v7;
  PLSmartConnectorAgent *v8;
  uint64_t v9;
  PLIOKitOperatorComposition *iokitOrion;
  PLSmartConnectorAgent *v11;
  _QWORD v13[4];
  PLSmartConnectorAgent *v14;
  objc_super v15;

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 2))
  {
    v15.receiver = self;
    v15.super_class = (Class)PLSmartConnectorAgent;
    v3 = -[PLAgent init](&v15, sel_init);
    v4 = v3;
    if (v3)
    {
      -[PLSmartConnectorAgent setTimer:](v3, "setTimer:", 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSmartConnectorAgent setPreStatus:](v4, "setPreStatus:", v5);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSmartConnectorAgent setCurStatus:](v4, "setCurStatus:", v6);

      v7 = objc_alloc(MEMORY[0x1E0D7FFE8]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __29__PLSmartConnectorAgent_init__block_invoke;
      v13[3] = &unk_1E857B1E0;
      v8 = v4;
      v14 = v8;
      v9 = objc_msgSend(v7, "initWithOperator:forService:withBlock:", v8, CFSTR("AppleOrionManager"), v13);
      iokitOrion = v8->_iokitOrion;
      v8->_iokitOrion = (PLIOKitOperatorComposition *)v9;

    }
    self = v4;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __29__PLSmartConnectorAgent_init__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __29__PLSmartConnectorAgent_init__block_invoke_2;
  v25 = &unk_1E8578C50;
  objc_copyWeak(&v26, &location);
  v9 = objc_msgSend(v6, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v7, 0, 0, v8, &v22, 0.0, 0.0);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "arm", v22, v23, v24, v25);
  objc_msgSend(MEMORY[0x1E0D7FFE8], "snapshotFromIOEntry:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IOAccessoryDetect"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurStatus:", v13);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IOAccessoryAccessoryName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurName:", v14);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IOAccessoryAccessoryModelNumber"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurModel:", v15);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IOAccessoryAccessoryVersionInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurVersion:", v16);

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "curStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "curModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "curVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "curName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v20;
    v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEFAULT, "Update from accessory state: %@, model: %@, version: %@, name: %@", buf, 0x2Au);

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __29__PLSmartConnectorAgent_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reArmCallback");

}

- (void)initOperatorDependancies
{
  void *v3;
  id v4;

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_externalAccessoryConnected_, *MEMORY[0x1E0CAA618], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_externalAccessoryDisconnected_, *MEMORY[0x1E0CAA620], 0);

  }
}

- (void)reArmCallback
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PLSmartConnectorAgent curStatus](self, "curStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSmartConnectorAgent curName](self, "curName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSmartConnectorAgent curModel](self, "curModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSmartConnectorAgent curVersion](self, "curVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSmartConnectorAgent logEventForwardStatus:withName:withModel:andVersionInfo:](self, "logEventForwardStatus:withName:withModel:andVersionInfo:", v6, v3, v4, v5);

}

- (void)externalAccessoryConnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLSmartConnectorAgent *v9;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PLSmartConnectorAgent_externalAccessoryConnected___block_invoke;
  v7[3] = &unk_1E85791E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__PLSmartConnectorAgent_externalAccessoryConnected___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "[SC]: received connection notification, %@", (uint8_t *)&v7, 0xCu);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA628]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventForwardEAAccessory:", v6);

}

- (void)externalAccessoryDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLSmartConnectorAgent *v9;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PLSmartConnectorAgent_externalAccessoryDisconnected___block_invoke;
  v7[3] = &unk_1E85791E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__PLSmartConnectorAgent_externalAccessoryDisconnected___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "[SC]: received disconnection notification, %@", (uint8_t *)&v7, 0xCu);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA628]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventForwardEAAccessory:", v6);

}

- (void)log
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D7FFE8];
  -[PLSmartConnectorAgent iokitOrion](self, "iokitOrion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotFromIOEntry:", objc_msgSend(v4, "service"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IOAccessoryDetect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IOAccessoryAccessoryName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IOAccessoryAccessoryModelNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IOAccessoryAccessoryVersionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSmartConnectorAgent logEventForwardStatus:withName:withModel:andVersionInfo:](self, "logEventForwardStatus:withName:withModel:andVersionInfo:", v5, v6, v7, v8);

}

- (void)logEventForwardStatus:(id)a3 withName:(id)a4 withModel:(id)a5 andVersionInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v21)
  {
    -[PLSmartConnectorAgent preStatus](self, "preStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToNumber:", v21);

    if ((v14 & 1) == 0)
    {
      if (v10)
      {
        if (v11)
          goto LABEL_5;
      }
      else
      {
        -[PLSmartConnectorAgent preName](self, "preName");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
LABEL_5:
          if (v12)
            goto LABEL_6;
LABEL_12:
          -[PLSmartConnectorAgent preVersion](self, "preVersion");
          v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
          +[PLOperator entryKeyForType:andName:](PLSmartConnectorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Status"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v15);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("ConnectState"));
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("A2261")) & 1) != 0)
          {
            v17 = 2;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("A1998")) & 1) != 0)
          {
            v17 = 3;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("A2480")) & 1) != 0)
          {
            v17 = 7;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("YU0040")) & 1) != 0)
          {
            v17 = 4;
          }
          else
          {
            if (!objc_msgSend(v11, "isEqualToString:", CFSTR("YU0043")))
              goto LABEL_24;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_24;
            v18 = objc_retainAutorelease(v12);
            if (!objc_msgSend(v18, "bytes") || !objc_msgSend(v18, "length"))
              goto LABEL_24;
            v19 = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v18), "bytes");
            if (v19 == 23)
            {
              v17 = 5;
              goto LABEL_27;
            }
            if (v19 != 25)
            {
LABEL_24:
              if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Apple iPad Pro Smart Keyboard")) & 1) != 0)
                v17 = 0;
              else
                v17 = objc_msgSend(v10, "isEqualToString:", CFSTR("Magic Keyboard")) ^ 1;
              goto LABEL_27;
            }
            v17 = 6;
          }
LABEL_27:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("AccessoryID"));

          -[PLOperator logEntry:](self, "logEntry:", v16);
          -[PLSmartConnectorAgent setPreStatus:](self, "setPreStatus:", v21);
          -[PLSmartConnectorAgent setPreName:](self, "setPreName:", v10);
          -[PLSmartConnectorAgent setPreModel:](self, "setPreModel:", v11);
          -[PLSmartConnectorAgent setPreVersion:](self, "setPreVersion:", v12);

          goto LABEL_28;
        }
      }
      -[PLSmartConnectorAgent preModel](self, "preModel");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
LABEL_28:

}

- (void)logEventForwardEAAccessory:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    LOWORD(v25) = 0;
    v16 = "[SC]: EAAccessory is nil";
    v17 = v15;
    v18 = 2;
LABEL_12:
    _os_log_error_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v25, v18);
    goto LABEL_20;
  }
  objc_msgSend(v4, "modelNumber");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v4, "firmwareRevision"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v25 = 138412290;
    v26 = v4;
    v16 = "[SC]: EAAccessory missing info, %@";
    v17 = v15;
    v18 = 12;
    goto LABEL_12;
  }
  objc_msgSend(v4, "modelNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Y-U0040"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "modelNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Y-U0043"));

    if (v20)
    {
      objc_msgSend(v4, "firmwareRevision");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("23."));

      if ((v22 & 1) != 0)
      {
        v10 = 5;
        goto LABEL_7;
      }
      objc_msgSend(v4, "firmwareRevision");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hasPrefix:", CFSTR("25."));

      if ((v24 & 1) != 0)
      {
        v10 = 6;
        goto LABEL_7;
      }
    }
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEFAULT, "[SC]: Skip matching the accessory", (uint8_t *)&v25, 2u);
    }
LABEL_20:

    goto LABEL_21;
  }
  v10 = 4;
LABEL_7:
  +[PLOperator entryKeyForType:andName:](PLSmartConnectorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("EAStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isConnected"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("ConnectState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("AccessoryID"));

  -[PLOperator logEntry:](self, "logEntry:", v12);
LABEL_21:

}

- (PLIOKitOperatorComposition)iokitOrion
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLTimer)timer
{
  return (PLTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)preStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)curStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)preName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)curName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)preModel
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPreModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)curModel
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSData)preVersion
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPreVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSData)curVersion
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curVersion, 0);
  objc_storeStrong((id *)&self->_preVersion, 0);
  objc_storeStrong((id *)&self->_curModel, 0);
  objc_storeStrong((id *)&self->_preModel, 0);
  objc_storeStrong((id *)&self->_curName, 0);
  objc_storeStrong((id *)&self->_preName, 0);
  objc_storeStrong((id *)&self->_curStatus, 0);
  objc_storeStrong((id *)&self->_preStatus, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_iokitOrion, 0);
}

@end
