@implementation PPQuickTypeURLServant

- (PPQuickTypeURLServant)initWithConversationManager:(id)a3
{
  id v5;
  PPQuickTypeURLServant *v6;
  PPQuickTypeURLServant *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _PASLock *dataLock;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPQuickTypeURLServant;
  v6 = -[PPQuickTypeURLServant init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversationManager, a3);
    v8 = objc_alloc(MEMORY[0x1E0D815F0]);
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "initWithGuardedData:", v9);
    dataLock = v7->_dataLock;
    v7->_dataLock = (_PASLock *)v10;

  }
  return v7;
}

- (PPQuickTypeURLServant)init
{
  void *v3;
  PPQuickTypeURLServant *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[PPQuickTypeURLServant initWithConversationManager:](self, "initWithConversationManager:", v3);

  return v4;
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  TUConversationManager *conversationManager;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _PASLock *dataLock;
  id v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 *v35;
  _QWORD v36[4];
  NSObject *v37;
  __int128 *p_buf;
  id v39;
  uint8_t v40[4];
  uint64_t v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "type") != 5)
    goto LABEL_12;
  pp_quicktype_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPQuickTypeURLServant: quickTypeItemsWithQuery", (uint8_t *)&buf, 2u);
  }

  if (objc_msgSend(v7, "subtype") == 13)
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D70DE0];
    v12 = objc_msgSend(v10, "bundleIdentifierIsEnabledForDonation:", *MEMORY[0x1E0D70DE0]);

    pp_quicktype_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 1) != 0)
    {
      if (v14)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: queried for %@ URL.", (uint8_t *)&buf, 0xCu);
      }

      +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v7);
      v13 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_semaphore_create(0);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__9703;
      v45 = __Block_byref_object_dispose__9704;
      v46 = 0;
      v16 = MEMORY[0x1E0C809B0];
      conversationManager = self->_conversationManager;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke;
      v36[3] = &unk_1E7E18CA0;
      p_buf = &buf;
      v18 = v15;
      v37 = v18;
      -[TUConversationManager getInactiveLinkWithCompletionHandler:](conversationManager, "getInactiveLinkWithCompletionHandler:", v36);
      objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v18);
      pp_quicktype_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: getInactiveLinkWithCompletionHandler completed.", v40, 2u);
      }

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "length"))
      {
        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[NSObject inviteLinkLabel](v13, "inviteLinkLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("🔗 %@"), v23);

        BYTE2(v31) = 10;
        LOWORD(v31) = 1024;
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", &stru_1E7E221D0, v21, v24, 0, 0x2000000, 0, 1.0, 0, 0, v31, 0);
        dataLock = self->_dataLock;
        v32[0] = v16;
        v32[1] = 3221225472;
        v32[2] = __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke_20;
        v32[3] = &unk_1E7E18CC8;
        v35 = &buf;
        v27 = v25;
        v33 = v27;
        v34 = v7;
        -[_PASLock runWithLockAcquired:](dataLock, "runWithLockAcquired:", v32);
        v39 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        pp_quicktype_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v40 = 138412290;
          v41 = v30;
          _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: link URL was empty or nil: %@", v40, 0xCu);
        }
        v28 = 0;
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v14)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: ignoring request for %@ URL due to settings.", (uint8_t *)&buf, 0xCu);
      }
      v28 = 0;
    }

  }
  else
  {
LABEL_12:
    v28 = 0;
  }

  return v28;
}

- (void)registerFeedback:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *dataLock;
  id v7;
  _QWORD v8[4];
  id v9;
  PPQuickTypeURLServant *v10;
  uint8_t buf[16];

  v4 = a3;
  pp_quicktype_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: registerFeedback called.", buf, 2u);
  }

  dataLock = self->_dataLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PPQuickTypeURLServant_registerFeedback___block_invoke;
  v8[3] = &unk_1E7E18D18;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[_PASLock runWithLockAcquired:](dataLock, "runWithLockAcquired:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
}

void __42__PPQuickTypeURLServant_registerFeedback___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3[1])
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "feedbackItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v9, "itemFeedbackType") == 1)
          {
            objc_msgSend(v9, "itemString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3[1], "value");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqualToString:", v11);

            if (v12)
            {
              pp_quicktype_log_handle();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v14 = v3[3];
                *(_DWORD *)buf = 138412290;
                v31 = v14;
                _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: URL engaged in app '%@'", buf, 0xCu);
              }

              pp_private_log_handle();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v3[1], "value");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v3[3];
                *(_DWORD *)buf = 138412546;
                v31 = v22;
                v32 = 2112;
                v33 = v23;
                _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "PPQuickTypeURLServant: '%@' engaged in app '%@'", buf, 0x16u);

              }
              if (v3[2])
              {
                v16 = dispatch_semaphore_create(0);
                v17 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
                v18 = v3[2];
                v24[0] = MEMORY[0x1E0C809B0];
                v24[1] = 3221225472;
                v24[2] = __42__PPQuickTypeURLServant_registerFeedback___block_invoke_23;
                v24[3] = &unk_1E7E18CF0;
                v19 = v16;
                v25 = v19;
                objc_msgSend(v17, "activateLink:completionHandler:", v18, v24);
                objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v19);
                pp_quicktype_log_handle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: activateLink completed.", buf, 2u);
                }

                objc_msgSend(v3, "reset");
              }
              else
              {
                pp_quicktype_log_handle();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: _tuConversationLink is unexpectedly nil.", buf, 2u);
                }

                objc_msgSend(v3, "reset");
              }
              goto LABEL_23;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_23:

  }
}

void __42__PPQuickTypeURLServant_registerFeedback___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    pp_quicktype_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: activateLink error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (!v6)
  {
    pp_quicktype_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: getInactiveLinkWithCompletionHandler error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke_20(uint64_t a1, id *a2)
{
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_storeStrong(a2 + 2, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v4 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v6 = v4[1];
  v4[1] = (id)v5;

  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "copy");
  v8 = v4[3];
  v4[3] = (id)v7;

}

@end
