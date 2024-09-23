@implementation PLInitialSyncAgent

+ (void)load
{
  objc_msgSend(MEMORY[0x1E0D7FF90], "registerOperator:", objc_opt_class());
}

+ (id)entryEventIntervalDefinitions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("InitialSync");
  v35 = *MEMORY[0x1E0D80298];
  v2 = v35;
  v33 = *MEMORY[0x1E0D80318];
  v3 = v33;
  v34 = &unk_1E86530E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  v36 = *MEMORY[0x1E0D802F0];
  v4 = v36;
  v31[0] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v22;
  v31[1] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_DateFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v35, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = CFSTR("InitialSyncActivity");
  v39[0] = v18;
  v28 = &unk_1E86530E0;
  v29[0] = v2;
  v27 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v4;
  v30[0] = v17;
  v25[0] = CFSTR("activityID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v25[1] = CFSTR("errorDescription");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v7;
  v25[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v9;
  v25[3] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_DateFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)initOperatorDependancies
{
  id v3;
  PLXPCListenerOperatorComposition *v4;
  PLXPCListenerOperatorComposition *xpcHandler;
  _QWORD v6[5];

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80090]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PLInitialSyncAgent_initOperatorDependancies__block_invoke;
    v6[3] = &unk_1E8578610;
    v6[4] = self;
    v4 = (PLXPCListenerOperatorComposition *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C648, v6);
    xpcHandler = self->_xpcHandler;
    self->_xpcHandler = v4;

  }
}

void __46__PLInitialSyncAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitialSyncActivity")))
  {
    objc_msgSend(*(id *)(a1 + 32), "logInitialSyncActivityFromEvent:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitialSync")))
  {
    objc_msgSend(*(id *)(a1 + 32), "logInitialSyncFromEvent:", v7);
  }

}

- (void)logInitialSyncActivityFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLInitialSyncAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("InitialSyncActivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("start")))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("activityID"));

    -[PLOperator logEntry:](self, "logEntry:", v7);
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("end")))
  {
    -[PLOperator storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastEntryForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestampEnd")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54__PLInitialSyncAgent_logInitialSyncActivityFromEvent___block_invoke;
      v17[3] = &unk_1E85791E0;
      v18 = v7;
      v19 = v4;
      -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v18, v17);

    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v6, 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activity"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("activityID"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("success"));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("success"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("success"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v15, "BOOLValue");

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("errorDescription"));

      }
      -[PLOperator logEntry:](self, "logEntry:", v11);

    }
    goto LABEL_10;
  }
LABEL_11:

}

void __54__PLInitialSyncAgent_logInitialSyncActivityFromEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("timestampEnd"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("success"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("success"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("error"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("errorDescription"));

  }
}

- (void)logInitialSyncFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLInitialSyncAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("InitialSync"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("start")))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activityCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("count"));

    -[PLOperator logEntry:](self, "logEntry:", v7);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("end")))
  {
    -[PLOperator storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastEntryForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestampEnd")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__PLInitialSyncAgent_logInitialSyncFromEvent___block_invoke;
      v14[3] = &unk_1E85780C8;
      v15 = v7;
      -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v15, v14);

    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v6, 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activityCount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("count"));

      -[PLOperator logEntry:](self, "logEntry:", v11);
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __46__PLInitialSyncAgent_logInitialSyncFromEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("timestampEnd"));

}

- (PLXPCListenerOperatorComposition)xpcHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcHandler, 0);
}

@end
