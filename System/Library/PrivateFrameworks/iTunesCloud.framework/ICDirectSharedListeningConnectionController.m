@implementation ICDirectSharedListeningConnectionController

- (ICDirectSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  ICDirectSharedListeningConnectionController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *delegateQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICDirectSharedListeningConnectionController;
  v5 = -[ICSharedListeningConnectionController initWithSessionIdentifier:identity:bundleID:](&v10, sel_initWithSessionIdentifier_identity_bundleID_, a3, a4, a5);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDirectSharedListeningConnectionController.delegateQueue", v6);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v7;

    v5->_state = 0;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  ICDirectSharedListeningConnectionController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICDirectSharedListeningConnectionController;
  -[ICDirectSharedListeningConnectionController dealloc](&v4, sel_dealloc);
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  ICDirectSharedListeningConnectionController *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ICDirectSharedListeningConnectionController assertion](self, "assertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D4D108]);
    -[ICSharedListeningConnectionController bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:bundleID:subsystem:reason:flags:", CFSTR("SharedListeningAssertion"), v6, CFSTR("QuickRelay"), 1, 3);
    -[ICDirectSharedListeningConnectionController setAssertion:](self, "setAssertion:", v7);

    v8 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ICDirectSharedListeningConnectionController assertion](self, "assertion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v31 = self;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Taking out assertion %@.", buf, 0x16u);

    }
  }
  if (!-[ICDirectSharedListeningConnectionController state](self, "state"))
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = self;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Begin session discovery and connection.", buf, 0xCu);
    }

    -[ICDirectSharedListeningConnectionController setState:](self, "setState:", 1);
    v13 = (void *)objc_opt_new();
    -[ICDirectSharedListeningConnectionController setReport:](self, "setReport:", v13);

    -[ICSharedListeningConnectionController sessionIdentifier](self, "sessionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[ICSharedListeningConnectionController sessionIdentifier](self, "sessionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSharedListeningConnectionController identity](self, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkQRConnectionDataSource dataSourceForExistingSharedListeningSession:identity:](ICLiveLinkQRConnectionDataSource, "dataSourceForExistingSharedListeningSession:identity:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICSharedListeningConnectionController identity](self, "identity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkQRConnectionDataSource dataSourceForNewSharedListeningSessionWithIdentity:](ICLiveLinkQRConnectionDataSource, "dataSourceForNewSharedListeningSessionWithIdentity:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_initWeak((id *)buf, self);
    v18 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __52__ICDirectSharedListeningConnectionController_start__block_invoke;
    v28[3] = &unk_1E4390250;
    objc_copyWeak(&v29, (id *)buf);
    objc_msgSend(v17, "setDataSourceErrorHandler:", v28);
    -[ICDirectSharedListeningConnectionController report](self, "report");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setReport:", v19);

    v20 = (void *)MEMORY[0x1E0D4D0C8];
    v21 = (void *)objc_opt_new();
    objc_msgSend(v20, "connectionWithDataSource:messageCoder:", v17, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDirectSharedListeningConnectionController setConnection:](self, "setConnection:", v22);

    -[ICDirectSharedListeningConnectionController connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    -[ICDirectSharedListeningConnectionController report](self, "report");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDirectSharedListeningConnectionController connection](self, "connection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setReport:", v24);

    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __52__ICDirectSharedListeningConnectionController_start__block_invoke_2;
    v26[3] = &unk_1E4390278;
    v26[4] = self;
    v11 = v17;
    v27 = v11;
    -[NSObject populateWithCompletion:](v11, "populateWithCompletion:", v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
    goto LABEL_22;
  }
  if (-[ICDirectSharedListeningConnectionController state](self, "state") == 2)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] Start connection for populated controller.", buf, 2u);
    }

    -[ICDirectSharedListeningConnectionController connection](self, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject start](v11, "start");
LABEL_22:

    goto LABEL_23;
  }
  if (-[ICDirectSharedListeningConnectionController state](self, "state") != 1
    && -[ICDirectSharedListeningConnectionController state](self, "state") != 3
    && -[ICDirectSharedListeningConnectionController state](self, "state") != 4
    && -[ICDirectSharedListeningConnectionController state](self, "state") == -1)
  {
    _ICLogCategoryQuickRelay();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "[ICSharedListeningConnectionController][D] Client trying to start controller in invalidated state.", buf, 2u);
    }
    goto LABEL_22;
  }
LABEL_23:
  os_unfair_lock_unlock(p_lock);
}

- (void)stop
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  ICDirectSharedListeningConnectionController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ICDirectSharedListeningConnectionController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  os_unfair_lock_lock(&self->_lock);
  -[ICDirectSharedListeningConnectionController assertion](self, "assertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ICDirectSharedListeningConnectionController assertion](self, "assertion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = self;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] <%p> Releasing assertion %@.", (uint8_t *)&v7, 0x16u);

    }
    -[ICDirectSharedListeningConnectionController setAssertion:](self, "setAssertion:", 0);
  }
  -[ICDirectSharedListeningConnectionController setConnection:](self, "setConnection:", 0);
  -[ICDirectSharedListeningConnectionController setState:](self, "setState:", 0);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)sendMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICDirectSharedListeningConnectionController connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:", v4);

}

- (void)_handleQRDataSourceError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  ICDirectSharedListeningConnectionController *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[ICDirectSharedListeningConnectionController setState:](self, "setState:", -1);
  os_unfair_lock_unlock(&self->_lock);
  -[ICDirectSharedListeningConnectionController report](self, "report");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[ICDirectSharedListeningConnectionController report](self, "report");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formattedReport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] %@", buf, 0xCu);

    }
    -[ICDirectSharedListeningConnectionController setReport:](self, "setReport:", 0);
  }
  -[ICDirectSharedListeningConnectionController stop](self, "stop");
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICDirectSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ICDirectSharedListeningConnectionController__handleQRDataSourceError___block_invoke;
    block[3] = &unk_1E4391230;
    v12 = v9;
    v13 = self;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)connection:(id)a3 didEndWithError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  ICDirectSharedListeningConnectionController *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[ICDirectSharedListeningConnectionController state](self, "state") >= 3)
    -[ICDirectSharedListeningConnectionController setState:](self, "setState:", 2);
  os_unfair_lock_unlock(&self->_lock);
  -[ICDirectSharedListeningConnectionController report](self, "report");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ICDirectSharedListeningConnectionController report](self, "report");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "formattedReport");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] %@", buf, 0xCu);

    }
    -[ICDirectSharedListeningConnectionController setReport:](self, "setReport:", 0);
  }
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICDirectSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__ICDirectSharedListeningConnectionController_connection_didEndWithError___block_invoke;
    block[3] = &unk_1E4391230;
    v13 = v10;
    v14 = self;
    v15 = v5;
    dispatch_async(v11, block);

  }
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  ICDirectSharedListeningConnectionController *v10;
  id v11;

  v5 = a4;
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICDirectSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__ICDirectSharedListeningConnectionController_connection_didReceiveMessage___block_invoke;
    block[3] = &unk_1E4391230;
    v9 = v6;
    v10 = self;
    v11 = v5;
    dispatch_async(v7, block);

  }
}

- (void)connectionDidStart:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  ICDirectSharedListeningConnectionController *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ICDirectSharedListeningConnectionController setState:](self, "setState:", 4);
  os_unfair_lock_unlock(p_lock);
  -[ICDirectSharedListeningConnectionController report](self, "report");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[ICDirectSharedListeningConnectionController report](self, "report");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formattedReport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][D] %@", buf, 0xCu);

    }
    -[ICDirectSharedListeningConnectionController setReport:](self, "setReport:", 0);
  }
  -[ICSharedListeningConnectionController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICDirectSharedListeningConnectionController delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__ICDirectSharedListeningConnectionController_connectionDidStart___block_invoke;
    v11[3] = &unk_1E4391110;
    v12 = v9;
    v13 = self;
    dispatch_async(v10, v11);

  }
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MSVQRConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (ICLiveLinkQRConnectionDataSource)dataSource
{
  return self->_dataSource;
}

- (ICSharedListeningConnectionReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
  objc_storeStrong((id *)&self->_report, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (MSVTaskAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __66__ICDirectSharedListeningConnectionController_connectionDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionControllerConnectionDidStart:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__ICDirectSharedListeningConnectionController_connection_didReceiveMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionController:connectionDidReceiveMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __74__ICDirectSharedListeningConnectionController_connection_didEndWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionController:connectionDidEndWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __72__ICDirectSharedListeningConnectionController__handleQRDataSourceError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionController:didEncounterFatalError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __52__ICDirectSharedListeningConnectionController_start__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleQRDataSourceError:", v3);

}

void __52__ICDirectSharedListeningConnectionController_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (a2)
  {
    -[os_unfair_lock_s _handleQRDataSourceError:](v3, "_handleQRDataSourceError:", a2);
  }
  else
  {
    os_unfair_lock_lock(v3 + 14);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    objc_msgSend(*(id *)(a1 + 40), "sharedListeningSessionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSessionIdentifier:", v4);

    objc_msgSend(*(id *)(a1 + 40), "sharedSessionToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSessionToken:", v5);

    objc_msgSend(*(id *)(a1 + 40), "sharedListeningSessionInviteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInviteURL:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "start");

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  }
}

@end
