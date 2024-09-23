@implementation PPConnectionsStore

- (PPConnectionsStore)init
{
  PPConnectionsStore *v2;
  PPClientFeedbackHelper *v3;
  PPClientFeedbackHelper *clientFeedbackHelper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPConnectionsStore;
  v2 = -[PPConnectionsStore init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v3;

  }
  return v2;
}

- (BOOL)iterRecentLocationDonationsSinceDate:(id)a3 client:(id)a4 error:(id *)a5 block:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  +[PPConnectionsClient sharedInstance](PPConnectionsClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PPConnectionsStore_iterRecentLocationDonationsSinceDate_client_error_block___block_invoke;
  v15[3] = &unk_1E226C1F0;
  v16 = v9;
  v13 = v9;
  LOBYTE(a5) = objc_msgSend(v12, "recentLocationDonationsSinceDate:client:error:handleBatch:", v11, v10, a5, v15);

  return (char)a5;
}

- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 client:(id)a6 error:(id *)a7 block:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v13 = a8;
  v14 = a6;
  v15 = a4;
  +[PPConnectionsClient sharedInstance](PPConnectionsClient, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_client_error_block___block_invoke;
  v19[3] = &unk_1E226C1F0;
  v20 = v13;
  v17 = v13;
  LOBYTE(a7) = objc_msgSend(v16, "recentLocationsForConsumer:criteria:limit:explanationSet:client:error:handleBatch:", a3, v15, a5, 0, v14, a7, v19);

  return (char)a7;
}

- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 error:(id *)a8 block:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  +[PPConnectionsClient sharedInstance](PPConnectionsClient, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __102__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_explanationSet_client_error_block___block_invoke;
  v22[3] = &unk_1E226C1F0;
  v23 = v15;
  v20 = v15;
  LOBYTE(a8) = objc_msgSend(v19, "recentLocationsForConsumer:criteria:limit:explanationSet:client:error:handleBatch:", a3, v18, a5, v17, v16, a8, v22);

  return (char)a8;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isMapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPConnectionsStore.m"), 111, CFSTR("You cannot send mapped feedback on connections. Please use PPFeedback to create the feedback for connections."));

  }
  -[PPConnectionsStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPConnectionsStore.m"), 112, CFSTR("The clientIdentifier property must be set on the %@ in order to send feedback."), v17);

  }
  -[PPConnectionsStore clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  +[PPConnectionsClient sharedInstance](PPConnectionsClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__PPConnectionsStore_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E226C218;
  v18[4] = self;
  v19 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerFeedback:completion:", v8, v18);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  PPClientFeedbackHelper *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_clientFeedbackHelper;
  else
    v4 = 0;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
}

void __50__PPConnectionsStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  if (v5)
  {
    pp_connections_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "Error from registerFeedback:completion: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __102__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_explanationSet_client_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __87__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_client_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __78__PPConnectionsStore_iterRecentLocationDonationsSinceDate_client_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
