@implementation PLAirplayService

uint64_t __44__PLAirplayService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleScreenStateCallback:", a2);
}

uint64_t __56__PLAirplayService_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)handleScreenStateCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("group"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAirplayService entryKeyPLScreenStateAgentScreenState](self, "entryKeyPLScreenStateAgentScreenState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAirplayService setScreenLayoutEntries:](self, "setScreenLayoutEntries:", v6);
  if (-[PLAirplayService airplayMirroringOn](self, "airplayMirroringOn") && v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bundleID"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bundleID"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v13);
        }

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 3, v8, v20);

      }
    }

  }
}

- (void)setScreenLayoutEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)entryKeyPLScreenStateAgentScreenState
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)airplayMirroringOn
{
  return self->_airplayMirroringOn;
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAirplayService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLAirplayService)init
{
  PLAirplayService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAirplayService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  NSArray *screenLayoutEntries;
  NSString *v4;
  uint64_t v5;
  void *v6;
  NSString *entryKeyPLScreenStateAgentScreenState;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0)
  {
    screenLayoutEntries = self->_screenLayoutEntries;
    self->_screenLayoutEntries = 0;

    self->_airplayMirroringOn = 0;
    +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__PLAirplayService_initOperatorDependancies__block_invoke;
    v13[3] = &unk_1E8578710;
    v13[4] = self;
    -[PLAirplayService buildCallBack:withGroup:withHandler:](self, "buildCallBack:withGroup:withHandler:", v4, 1, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAirplayService setScreenstateCallback:](self, "setScreenstateCallback:", v6);

    entryKeyPLScreenStateAgentScreenState = self->_entryKeyPLScreenStateAgentScreenState;
    self->_entryKeyPLScreenStateAgentScreenState = v4;
    v8 = v4;

    +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AudioApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __44__PLAirplayService_initOperatorDependancies__block_invoke_2;
    v12[3] = &unk_1E8578710;
    v12[4] = self;
    -[PLAirplayService buildCallBack:withGroup:withHandler:](self, "buildCallBack:withGroup:withHandler:", v9, 0, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAirplayService setAudioAppCallback:](self, "setAudioAppCallback:", v10);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D22C78]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAirplayService setExcludedAccountingEvents:](self, "setExcludedAccountingEvents:", v11);

  }
}

uint64_t __44__PLAirplayService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAudioAppCallback:", a2);
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GroupID_%@"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PLAirplayService_buildCallBack_withGroup_withHandler___block_invoke;
  v16[3] = &unk_1E8578760;
  v17 = v9;
  v13 = v9;
  v14 = (void *)objc_msgSend(v12, "initWithOperator:forEntryKey:withBlock:", self, v11, v16);

  return v14;
}

- (void)handleAudioAppCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PLAirplayService *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MirroringState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MirroringState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");

            if (v16)
            {
              v39 = v13;
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              -[PLAirplayService screenLayoutEntries](self, "screenLayoutEntries");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v41 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("bundleID"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v23)
                    {
                      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("bundleID"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "addObject:", v24);

                    }
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
                }
                while (v19);
              }

              objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v39;
              objc_msgSend(v39, "entryDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 3, v14, v26);

            }
          }

        }
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864D2F0, v28);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, MEMORY[0x1E0C9AA70], v30);

      v31 = self;
      v32 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864D318, v34);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, MEMORY[0x1E0C9AA70], v36);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 3, MEMORY[0x1E0C9AA60], v38);

      v31 = self;
      v32 = 0;
    }
    -[PLAirplayService setAirplayMirroringOn:](v31, "setAirplayMirroringOn:", v32);
  }

}

- (PLEntryNotificationOperatorComposition)screenstateCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScreenstateCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)audioAppCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAudioAppCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)screenLayoutEntries
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAirplayMirroringOn:(BOOL)a3
{
  self->_airplayMirroringOn = a3;
}

- (NSSet)excludedAccountingEvents
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExcludedAccountingEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedAccountingEvents, 0);
  objc_storeStrong((id *)&self->_entryKeyPLScreenStateAgentScreenState, 0);
  objc_storeStrong((id *)&self->_screenLayoutEntries, 0);
  objc_storeStrong((id *)&self->_audioAppCallback, 0);
  objc_storeStrong((id *)&self->_screenstateCallback, 0);
}

@end
