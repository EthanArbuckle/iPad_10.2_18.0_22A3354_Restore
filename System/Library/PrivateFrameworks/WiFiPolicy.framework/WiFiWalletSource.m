@implementation WiFiWalletSource

- (id)relevantNetworks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[WiFiWalletSource networks](self, "networks");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v14);

        }
        else
        {
          NSLog(CFSTR("%s: no relevant networks found for identifier %@"), "-[WiFiWalletSource relevantNetworks]", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v3;
}

- (NSMutableSet)relevantPassIdentifiers
{
  return self->_relevantPassIdentifiers;
}

- (WiFiWalletSource)init
{
  return -[WiFiWalletSource initWithChangeHandler:](self, "initWithChangeHandler:", 0);
}

- (WiFiWalletSource)initWithChangeHandler:(id)a3
{
  id v4;
  WiFiWalletSource *v5;
  uint64_t v6;
  id changeHandler;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v10;
  NSMutableDictionary *networks;
  NSMutableSet *v12;
  NSMutableSet *relevantPassIdentifiers;
  PKPassLibrary *v14;
  PKPassLibrary *passLibrary;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WiFiWalletSource;
  v5 = -[WiFiWalletSource init](&v19, sel_init);
  if (!v5)
  {
    v17 = 0;
    goto LABEL_9;
  }
  if (v4)
  {
    v6 = MEMORY[0x1D17AC9EC](v4);
    changeHandler = v5->changeHandler;
    v5->changeHandler = (id)v6;

  }
  v8 = dispatch_queue_create("com.apple.wifi.wallet-source", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v8;

  if (!v5->_queue)
    goto LABEL_12;
  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  networks = v5->_networks;
  v5->_networks = v10;

  if (!v5->_networks
    || (v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]),
        relevantPassIdentifiers = v5->_relevantPassIdentifiers,
        v5->_relevantPassIdentifiers = v12,
        relevantPassIdentifiers,
        !v5->_relevantPassIdentifiers))
  {
LABEL_12:
    v17 = v5;
    v5 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(MEMORY[0x1E0D66F10], "isPassLibraryAvailable") & 1) == 0)
  {
    NSLog(CFSTR("PKPassLibrary is not available"));
    goto LABEL_12;
  }
  v14 = (PKPassLibrary *)objc_alloc_init(MEMORY[0x1E0D66F10]);
  passLibrary = v5->_passLibrary;
  v5->_passLibrary = v14;

  -[WiFiWalletSource _initializeWiFiPasses](v5, "_initializeWiFiPasses");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__passLibraryDidChange_, *MEMORY[0x1E0D6A790], v5->_passLibrary);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:suspensionBehavior:", v5, sel__passLibraryDidBecomeRelevantNotification_, *MEMORY[0x1E0D6A7B8], 0, 2);
LABEL_9:

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_passLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D6A790], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiWalletSource;
  -[WiFiWalletSource dealloc](&v4, sel_dealloc);
}

- (void)_initializeWiFiPasses
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WiFiWalletSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__WiFiWalletSource__initializeWiFiPasses__block_invoke;
  block[3] = &unk_1E881DFF8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__WiFiWalletSource__initializeWiFiPasses__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "passLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passesOfType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = objc_loadWeakRetained(v2);
        objc_msgSend(v12, "_addPass:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "passLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__WiFiWalletSource__initializeWiFiPasses__block_invoke_2;
  v14[3] = &unk_1E881E680;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "fetchCurrentRelevantPassInfo:", v14);

}

void __41__WiFiWalletSource__initializeWiFiPasses__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  NSLog(CFSTR("relevant passes: %@"), v3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_handleRelevantPassUpdate:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_addPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "semantics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v5, "semantics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        v11 = *MEMORY[0x1E0D6A898];
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "isEqualToString:", v11) & 1) != 0)
            {

              objc_msgSend(v5, "uniqueID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "serialNumber");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("%s: adding pass %@ (uniqueID: %@, serialNumber: %@)"), "-[WiFiWalletSource _addPass:]", v5, v15, v16);

              -[WiFiWalletSource _createWiFiWalletPassFromPass:](self, "_createWiFiWalletPassFromPass:", v5);
              v14 = (id)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                -[WiFiWalletSource networks](self, "networks");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "uniqueID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKey:", v14, v18);

                -[WiFiWalletSource changeHandler](self, "changeHandler");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __29__WiFiWalletSource__addPass___block_invoke;
                  block[3] = &unk_1E881C8C0;
                  block[4] = self;
                  v14 = v14;
                  v21 = v14;
                  dispatch_async(MEMORY[0x1E0C80D38], block);

                }
              }
              else
              {
                NSLog(CFSTR("%s: Failed to create wifi wallet pass from pass %@"), "-[WiFiWalletSource _addPass:]", v5);
              }
              goto LABEL_16;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
  }

  objc_msgSend(v5, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: pass (%@ - %@) doesn't contain wifi semantics"), "-[WiFiWalletSource _addPass:]", v5, v13);

  v14 = 0;
LABEL_16:

}

void __29__WiFiWalletSource__addPass___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "changeHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), 0);

}

- (void)_passLibraryDidBecomeRelevantNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  NSLog(CFSTR("%s: %@"), a2, "-[WiFiWalletSource _passLibraryDidBecomeRelevantNotification:]", a3);
  -[WiFiWalletSource queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "passLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke_2;
  v3[3] = &unk_1E881E680;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "fetchCurrentRelevantPassInfo:", v3);

}

void __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    NSLog(CFSTR("relevant passes: %@"), v3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_handleRelevantPassUpdate:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  else
  {
    NSLog(CFSTR("%s: no relevant passes"), "-[WiFiWalletSource _passLibraryDidBecomeRelevantNotification:]_block_invoke_2");
    objc_msgSend(*(id *)(a1 + 32), "_removeRelevantPasses");
  }

}

- (void)_passLibraryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  NSLog(CFSTR("library changed: %@"), v4);
  -[WiFiWalletSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WiFiWalletSource__passLibraryDidChange___block_invoke;
  block[3] = &unk_1E881C8C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __42__WiFiWalletSource__passLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_handlePassLibraryChange:", v2);

}

- (void)_handlePassLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A778]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          -[WiFiWalletSource _addPass:](self, "_addPass:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A7D0], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[WiFiWalletSource _addPass:](self, "_addPass:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

- (void)_handleRelevantPassUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A7B0]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[WiFiWalletSource passLibrary](self, "passLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "passWithUniqueID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[WiFiWalletSource _passDidBecomeRelevant:](self, "_passDidBecomeRelevant:", v8);

      }
      else
      {
        NSLog(CFSTR("%s: unable to find pass with uniqueID %@"), "-[WiFiWalletSource _handleRelevantPassUpdate:]", v6);
      }

    }
    else
    {
      NSLog(CFSTR("%s: missing uniqueID for passInfo %@"), "-[WiFiWalletSource _handleRelevantPassUpdate:]", v9);
    }
  }
  else
  {
    NSLog(CFSTR("%s: passInfo is nil"), "-[WiFiWalletSource _handleRelevantPassUpdate:]");
  }

}

- (void)_passDidBecomeRelevant:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(v10, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: pass is now relevant (%@, identifier %@"), "-[WiFiWalletSource _passDidBecomeRelevant:]", v10, v6);

    objc_msgSend(v10, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiWalletSource _networksWithIdentifier:](self, "_networksWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:](self, "_issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:", v8, 0);

    }
    else
    {
      objc_msgSend(v10, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: no relevant networks found for pass %@ (identifier %@)"), "-[WiFiWalletSource _passDidBecomeRelevant:]", v10, v9);

    }
  }
  else
  {
    NSLog(CFSTR("%s: no pass given for relevancy"), "-[WiFiWalletSource _passDidBecomeRelevant:]");
  }

}

- (void)_removeRelevantPasses
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: relevant pass idenitfiers %@"), "-[WiFiWalletSource _removeRelevantPasses]", v5);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[WiFiWalletSource _networksWithIdentifier:](self, "_networksWithIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "allObjects");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v15);

          }
          else
          {
            NSLog(CFSTR("%s: no networks found for identifier %@"), "-[WiFiWalletSource _removeRelevantPasses]", v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    -[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:](self, "_issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:", 0, v6);
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllObjects");

  }
  else
  {
    NSLog(CFSTR("%s: no relevant passes"), "-[WiFiWalletSource _removeRelevantPasses]");
  }
}

- (void)_issueRelevancyCallbackWithRelevantNetworks:(id)a3 notRelevantNetworks:(id)a4
{
  unint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  unint64_t v9;

  v9 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  -[WiFiWalletSource relevancyHandler](self, "relevancyHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v9 | v6)
    {
      -[WiFiWalletSource relevancyHandler](self, "relevancyHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, v9, v6);

    }
    else
    {
      NSLog(CFSTR("%s: tried to isssue callback without relevant or non-relevant networks"), "-[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:]");
    }
  }

}

- (id)_createWiFiWalletPassFromPass:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  WiFiWalletPass *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v3, "semantics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v49;
    v8 = *MEMORY[0x1E0D6A898];
    v9 = *MEMORY[0x1E0D6AAE8];
    v10 = *MEMORY[0x1E0D6AAE0];
    v37 = *MEMORY[0x1E0D6A898];
    v38 = *(_QWORD *)v49;
    while (2)
    {
      v11 = 0;
      v39 = v5;
      do
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v11);
        if (objc_msgSend(v12, "isEqualToString:", v8))
        {
          v42 = v11;
          objc_msgSend(v3, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "localizedDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("pass has WiFi %@ : %@"), v13, v14);

          objc_msgSend(v3, "semantics");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "dictionariesValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (!v18)
          {
            NSLog(CFSTR("%s: pass (%@) has a wifiAccess key but no entries"), "-[WiFiWalletSource _createWiFiWalletPassFromPass:]", v3);

            v35 = 0;
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v41 = v16;
          objc_msgSend(v16, "dictionariesValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v45 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                v25 = objc_alloc_init(WiFiWalletPass);
                objc_msgSend(v3, "uniqueID");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setUniqueIdentifier:](v25, "setUniqueIdentifier:", v26);

                objc_msgSend(v24, "objectForKey:", v9);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setSSID:](v25, "setSSID:", v27);

                objc_msgSend(v24, "objectForKey:", v10);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setPassword:](v25, "setPassword:", v28);

                objc_msgSend(v3, "serialNumber");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setSerialNumber:](v25, "setSerialNumber:", v29);

                objc_msgSend(v3, "relevantDate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setRelevantDate:](v25, "setRelevantDate:", v30);

                objc_msgSend(v3, "localizedDescription");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setLocalizedDescription:](v25, "setLocalizedDescription:", v31);

                -[WiFiWalletPass SSID](v25, "SSID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                {
                  -[WiFiWalletPass SSID](v25, "SSID");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "length");

                  if (v34)
                  {
                    objc_msgSend(v43, "addObject:", v25);
                    NSLog(CFSTR("%s: added wifiInfo: %@"), "-[WiFiWalletSource _createWiFiWalletPassFromPass:]", v25);
                  }
                }

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            }
            while (v21);
          }

          v11 = v42;
          v6 = v43;
          v8 = v37;
          v7 = v38;
          v5 = v39;
        }
        ++v11;
      }
      while (v11 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }

  v6 = v6;
  v35 = v6;
LABEL_25:

  return v35;
}

- (id)_networksWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WiFiWalletSource networks](self, "networks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    NSLog(CFSTR("%s: relevant networks are nil for identifier %@"), "-[WiFiWalletSource _networksWithIdentifier:]", v4);

  return v6;
}

- (id)candidateNetworks
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WiFiWalletSource networks](self, "networks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)expiredWalletIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WiFiWalletSource passLibrary](self, "passLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isExpired", (_QWORD)v13))
        {
          objc_msgSend(v10, "serialNumber");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)changeHandler
{
  return self->changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)relevancyHandler
{
  return self->relevancyHandler;
}

- (void)setRelevancyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKPassLibrary)passLibrary
{
  return self->_passLibrary;
}

- (void)setPassLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_passLibrary, a3);
}

- (NSMutableDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_networks, a3);
}

- (void)setRelevantPassIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_relevantPassIdentifiers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_relevantPassIdentifiers, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong(&self->relevancyHandler, 0);
  objc_storeStrong(&self->changeHandler, 0);
}

@end
