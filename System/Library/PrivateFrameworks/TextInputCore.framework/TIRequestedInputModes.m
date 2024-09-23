@implementation TIRequestedInputModes

- (TIRequestedInputModes)init
{
  void *v3;
  TIRequestedInputModes *v4;

  +[TIRequestedInputModes defaultDatabaseURL](TIRequestedInputModes, "defaultDatabaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIRequestedInputModes initWithURL:](self, "initWithURL:", v3);

  return v4;
}

- (TIRequestedInputModes)initWithURL:(id)a3
{
  id v4;
  TIRequestedInputModes *v5;
  TIRequestedInputModes *v6;
  uint64_t v7;
  NSURL *databaseURL;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIRequestedInputModes;
  v5 = -[TIRequestedInputModes init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_didLoad = 0;
    v7 = objc_msgSend(v4, "copy");
    databaseURL = v6->_databaseURL;
    v6->_databaseURL = (NSURL *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.TextInput.requested-input-modes", v9);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v10;

  }
  return v6;
}

- (void)_loadIfNecessaryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *inputModesByDate;
  NSMutableDictionary *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (!self->_didLoad)
  {
    self->_didLoad = 1;
    if (self->_databaseURL)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = (void *)MEMORY[0x1E0C9AA70];
      if (v5)
        v7 = (void *)v5;
      v8 = v7;

      v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
      inputModesByDate = self->_inputModesByDate;
      self->_inputModesByDate = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      inputModesByDate = self->_inputModesByDate;
      self->_inputModesByDate = v11;
    }

    v4 = v12;
  }
  (*((void (**)(void))v4 + 2))();

}

- (void)_saveInputModes
{
  NSURL *databaseURL;
  NSMutableDictionary *inputModesByDate;
  NSURL *v4;
  id v5;

  databaseURL = self->_databaseURL;
  if (databaseURL)
  {
    inputModesByDate = self->_inputModesByDate;
    v4 = databaseURL;
    v5 = (id)-[NSMutableDictionary copy](inputModesByDate, "copy");
    objc_msgSend(v5, "writeToURL:atomically:", v4, 1);

  }
}

- (id)_inputModes
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allKeys](self->_inputModesByDate, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)_inputModes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__TIRequestedInputModes__inputModes___block_invoke;
  v6[3] = &unk_1EA105BD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TIRequestedInputModes _loadIfNecessaryWithCompletion:](self, "_loadIfNecessaryWithCompletion:", v6);

}

- (void)_addInputMode:(id)a3 date:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__TIRequestedInputModes__addInputMode_date_handler___block_invoke;
  v14[3] = &unk_1EA104CD0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[TIRequestedInputModes _loadIfNecessaryWithCompletion:](self, "_loadIfNecessaryWithCompletion:", v14);

}

- (void)_removeInputModesBeforeDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke;
  v10[3] = &unk_1EA107398;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[TIRequestedInputModes _loadIfNecessaryWithCompletion:](self, "_loadIfNecessaryWithCompletion:", v10);

}

- (void)_removeAllInputModes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__TIRequestedInputModes__removeAllInputModes___block_invoke;
  v6[3] = &unk_1EA105BD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TIRequestedInputModes _loadIfNecessaryWithCompletion:](self, "_loadIfNecessaryWithCompletion:", v6);

}

- (void)inputModes:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (void)addInputMode:(id)a3 date:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  v9 = v10;
  TIDispatchAsync();

}

- (void)removeInputModesBeforeDate:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  TIDispatchAsync();

}

- (void)removeAllInputModes:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModesByDate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

uint64_t __45__TIRequestedInputModes_removeAllInputModes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllInputModes:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__TIRequestedInputModes_removeInputModesBeforeDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeInputModesBeforeDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51__TIRequestedInputModes_addInputMode_date_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addInputMode:date:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __36__TIRequestedInputModes_inputModes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inputModes:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__TIRequestedInputModes__removeAllInputModes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_saveInputModes");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke_2;
  v9[3] = &unk_1EA104CF8;
  v10 = v2;
  objc_msgSend(v3, "keysOfEntriesPassingTest:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v4, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsForKeys:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_saveInputModes");
  }
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_inputModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

BOOL __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a3;
  objc_msgSend(v4, "earlierDate:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

void __52__TIRequestedInputModes__addInputMode_date_handler___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  if (!v5 || (objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", v5), v2 > 86400.0))
    objc_msgSend(*(id *)(a1 + 32), "_saveInputModes");
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_inputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __37__TIRequestedInputModes__inputModes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_inputModes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)defaultDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  TI_KB_USER_DIRECTORY();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("requested_linguistic_assets.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
