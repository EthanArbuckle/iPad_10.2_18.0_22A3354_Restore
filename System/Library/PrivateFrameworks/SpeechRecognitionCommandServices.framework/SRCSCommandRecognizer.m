@implementation SRCSCommandRecognizer

- (SRCSCommandRecognizer)initWithCommandRecognitionSystem:(id)a3 commandIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SRCSSpokenCommand *v15;
  uint64_t v16;
  void *v17;
  SRCSCommandRecognizer *v18;
  NSObject *v19;
  SRCSCommandRecognizer *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        v15 = [SRCSSpokenCommand alloc];
        v16 = -[SRCSSpokenCommand initWithIdentifier:](v15, "initWithIdentifier:", v14, (_QWORD)v22);
        if (!v16)
        {
          SRCSLogGeneral();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_impl(&dword_22BD8C000, v19, OS_LOG_TYPE_DEFAULT, "Error, could not create command %@!", buf, 0xCu);
          }

          v18 = 0;
          goto LABEL_13;
        }
        v17 = (void *)v16;
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v11)
        continue;
      break;
    }
  }

  self = -[SRCSCommandRecognizer initWithCommandRecognitionSystem:spokenCommands:](self, "initWithCommandRecognitionSystem:spokenCommands:", v6, v8);
  v18 = self;
LABEL_13:
  v20 = v18;

  return v20;
}

- (SRCSCommandRecognizer)initWithCommandRecognitionSystem:(id)a3 spokenCommands:(id)a4
{
  id v6;
  id v7;
  SRCSCommandRecognizer *v8;
  SRCSCommandRecognizer *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  _QWORD block[4];
  SRCSCommandRecognizer *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SRCSCommandRecognizer;
  v8 = -[SRCSCommandRecognizer init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_commandRecognitionSystem, v6);
    objc_storeStrong((id *)&v9->_spokenCommands, a4);
    if (initWithCommandRecognitionSystem_spokenCommands__staticInitialization != -1)
      dispatch_once(&initWithCommandRecognitionSystem_spokenCommands__staticInitialization, &__block_literal_global_4);
    objc_msgSend(v6, "addRecognizer:", v9);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v9->_spokenCommands;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setCommandRecognizer:", v9);
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    dispatch_get_global_queue(9, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2;
    block[3] = &unk_24F652928;
    v18 = v9;
    dispatch_async(v15, block);

  }
  return v9;
}

void __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "spokenCommands", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "fstGrammar");
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
  else
  {
    SRCSLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2_cold_1(v3);
  }

}

- (id)spokenCommands
{
  return self->_spokenCommands;
}

- (id)commandRecognitionSystem
{
  return objc_loadWeakRetained((id *)&self->_commandRecognitionSystem);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandRecognitionSystem);
  objc_storeStrong((id *)&self->_spokenCommands, 0);
}

void __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22BD8C000, log, OS_LOG_TYPE_DEBUG, "SRCSCommandRecognitionSystem has been destroyed while attempting to  process on the background thread, skipping caching of fstGrammars", v1, 2u);
}

@end
