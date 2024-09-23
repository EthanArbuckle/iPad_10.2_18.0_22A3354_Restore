@implementation PKDAPairingSessionManager

- (PKDAPairingSessionManager)initWithQueue:(id)a3 sessionCreationBlock:(id)a4
{
  PKDAPairingSessionManager *v4;
  NSMutableArray *v5;
  NSMutableArray *probingCompletionBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDAPairingSessionManager;
  v4 = -[PKDASessionManager initWithQueue:sessionCreationBlock:](&v8, sel_initWithQueue_sessionCreationBlock_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    probingCompletionBlocks = v4->_probingCompletionBlocks;
    v4->_probingCompletionBlocks = v5;

  }
  return v4;
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unspported object", v4, 2u);
  }

}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unsupported object: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unsupported object: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unsupported object: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKDAPairingSessionManager *v10;

  v5 = a4;
  -[PKDASessionManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __90__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Finished prewarming with result: %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = 0;

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKDAPairingSessionManager *v12;
  unint64_t v13;

  v7 = a4;
  -[PKDASessionManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishProbingTerminalWithError_brandCode___block_invoke;
  block[3] = &unk_1E2AC5810;
  v11 = v7;
  v12 = self;
  v13 = a5;
  v9 = v7;
  dispatch_async(v8, block);

}

void __107__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishProbingTerminalWithError_brandCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  _BOOL8 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v2 == 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Finished probing terminal, pairing mode: %ld", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeAllObjects");
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
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = 0;
}

- (BOOL)isProbingTerminalPairingStatus
{
  return self->_probingTerminalPairingStatus;
}

- (void)setProbingTerminalPairingStatus:(BOOL)a3
{
  self->_probingTerminalPairingStatus = a3;
}

- (NSMutableArray)probingCompletionBlocks
{
  return self->_probingCompletionBlocks;
}

- (id)prewarmCompletion
{
  return self->_prewarmCompletion;
}

- (void)setPrewarmCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prewarmCompletion, 0);
  objc_storeStrong((id *)&self->_probingCompletionBlocks, 0);
}

@end
