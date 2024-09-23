@implementation SRUIFAceCommandRecords

- (SRUIFAceCommandRecords)init
{
  SRUIFAceCommandRecords *v2;
  uint64_t v3;
  NSMutableDictionary *recordsByCommandIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRUIFAceCommandRecords;
  v2 = -[SRUIFAceCommandRecords init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    recordsByCommandIdentifier = v2->_recordsByCommandIdentifier;
    v2->_recordsByCommandIdentifier = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)aceCommandRecordDidChangeResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SRUIFAceCommandRecords delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "aceCommandRecords:didChangeResultForCommand:completion:", self, v5, v6);
}

- (void)registerAceCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  SRUIFAceCommandRecord *v12;
  void *v13;
  os_log_t v14;
  SRUIFAceCommandRecord *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "aceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  v10 = *MEMORY[0x24BE08FB0];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[SRUIFAceCommandRecords registerAceCommand:completion:]";
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_219F26000, v10, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord identifier=%@", (uint8_t *)&v17, 0x16u);
    }
    -[SRUIFAceCommandRecords aceCommandWithIdentifier:](self, "aceCommandWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if ((objc_msgSend(v6, "isEqual:", v11) & 1) == 0)
      {
        v12 = -[SRUIFAceCommandRecord initWithAceCommand:andCompletion:]([SRUIFAceCommandRecord alloc], "initWithAceCommand:andCompletion:", v6, v7);
        -[SRUIFAceCommandRecord setDelegate:](v12, "setDelegate:", self);
        -[SRUIFAceCommandRecords _recordsByCommandIdentifier](self, "_recordsByCommandIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v12, v8);

      }
      if ((objc_msgSend(v6, "isEqual:", v11) & 1) == 0)
      {
        v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          -[SRUIFAceCommandRecords registerAceCommand:completion:].cold.2(v6, v14);
      }
    }
    else
    {
      v15 = -[SRUIFAceCommandRecord initWithAceCommand:andCompletion:]([SRUIFAceCommandRecord alloc], "initWithAceCommand:andCompletion:", v6, v7);
      -[SRUIFAceCommandRecord setDelegate:](v15, "setDelegate:", self);
      -[SRUIFAceCommandRecords _recordsByCommandIdentifier](self, "_recordsByCommandIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v15, v8);

    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    -[SRUIFAceCommandRecords registerAceCommand:completion:].cold.1((uint64_t)v6, v10);
  }

}

- (id)pendingAddViewsWithReflectionDialogPhaseWithRefId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SRUIFAceCommandRecords _recordsByCommandIdentifier](self, "_recordsByCommandIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__SRUIFAceCommandRecords_pendingAddViewsWithReflectionDialogPhaseWithRefId___block_invoke;
  v12[3] = &unk_24DC1B7E0;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __76__SRUIFAceCommandRecords_pendingAddViewsWithReflectionDialogPhaseWithRefId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "aceCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    goto LABEL_6;
  v6 = objc_msgSend(v13, "result");

  v7 = v13;
  if (!v6)
  {
    objc_msgSend(v13, "aceCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v13, "aceCommand");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sruif_dialogPhase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isReflectionDialogPhase");

      if (!v11)
      {
LABEL_7:

        v7 = v13;
        goto LABEL_8;
      }
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v13, "aceCommand");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v5);
LABEL_6:

      goto LABEL_7;
    }
  }
LABEL_8:

}

- (id)aceCommandWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SRUIFAceCommandRecords _recordsByCommandIdentifier](self, "_recordsByCommandIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aceCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_recordForAceCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SRUIFAceCommandRecords registerAceCommand:completion:](self, "registerAceCommand:completion:", v4, 0);
  -[SRUIFAceCommandRecords _recordsByCommandIdentifier](self, "_recordsByCommandIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)recordActionStartedForAceCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRUIFAceCommandRecords recordActionStartedForAceCommand:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord aceCommand=%@", (uint8_t *)&v7, 0x16u);
  }
  -[SRUIFAceCommandRecords _recordForAceCommand:](self, "_recordForAceCommand:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incrementNumberOfStartedActions");

}

- (void)recordActionStoppedForAceCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRUIFAceCommandRecords recordActionStoppedForAceCommand:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord aceCommand=%@", (uint8_t *)&v7, 0x16u);
  }
  -[SRUIFAceCommandRecords _recordForAceCommand:](self, "_recordForAceCommand:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incrementNumberOfStoppedActions");

}

- (void)recordActionCompletedForAceCommand:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SRUIFAceCommandRecords _recordForAceCommand:](self, "_recordForAceCommand:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "result");
    v11 = CFSTR("SRUIFAceCommandResultNone");
    if (v10 == 1)
      v11 = CFSTR("SRUIFAceCommandResultSucceeded");
    if (v10 == 2)
      v11 = CFSTR("SRUIFAceCommandResultFailed");
    v12 = v11;
    v13 = 136316674;
    v14 = "-[SRUIFAceCommandRecords recordActionCompletedForAceCommand:success:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    v19 = 2048;
    v20 = objc_msgSend(v7, "numberOfStartedActions");
    v21 = 2048;
    v22 = objc_msgSend(v7, "numberOfStoppedActions");
    v23 = 2048;
    v24 = objc_msgSend(v7, "numberOfSuccessfullyCompletedActions");
    v25 = 2048;
    v26 = objc_msgSend(v7, "numberOfUnsuccessfullyCompletedActions");
    _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord aceCommand=%@ result=%@ StartedActions=%zd StoppedActions=%zd SuccessfulActions=%zd UnsuccessfulActions=%zd ", (uint8_t *)&v13, 0x48u);

  }
  if (!objc_msgSend(v7, "result"))
  {
    if (v4)
      objc_msgSend(v7, "incrementNumberOfSuccessfullyCompletedActions");
    else
      objc_msgSend(v7, "incrementNumberOfUnsuccessfullyCompletedActions");
  }

}

- (int64_t)resultForAceCommand:(id)a3
{
  void *v3;
  int64_t v4;

  -[SRUIFAceCommandRecords _recordForAceCommand:](self, "_recordForAceCommand:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "result");

  return v4;
}

- (SRUIFAceCommandRecordsDelegate)delegate
{
  return (SRUIFAceCommandRecordsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)_recordsByCommandIdentifier
{
  return self->_recordsByCommandIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByCommandIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerAceCommand:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SRUIFAceCommandRecords registerAceCommand:completion:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_219F26000, a2, OS_LOG_TYPE_ERROR, "%s #aceCommandRecord Attempt to register Ace Command %@ with no aceId", (uint8_t *)&v2, 0x16u);
}

- (void)registerAceCommand:(void *)a1 completion:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[SRUIFAceCommandRecords registerAceCommand:completion:]";
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_219F26000, v3, OS_LOG_TYPE_ERROR, "%s #aceCommandRecord Client received Ace Command %@ but aceId %@ was already in the registry", (uint8_t *)&v5, 0x20u);

}

@end
