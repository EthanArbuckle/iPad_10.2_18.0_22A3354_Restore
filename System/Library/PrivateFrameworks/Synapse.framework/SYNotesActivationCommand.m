@implementation SYNotesActivationCommand

+ (void)setRemotePresentationEnabled:(BOOL)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (SYIsPhone())
  {
    SYRemotePresentationEnabled = a3;
    v5 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = SYRemotePresentationEnabled;
      _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "System Paper remote presentation enabled: %d", (uint8_t *)v6, 8u);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SYNotesActivationCommand setRemotePresentationEnabled:].cold.1(a2, v5);

  }
}

+ (BOOL)remotePresentationEnabled
{
  return SYRemotePresentationEnabled;
}

+ (void)activateWithMetaActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_iOSImpl"), "activateWithMetaActivity:completion:", v7, v6);

}

+ (void)activateWithNoteIdentifier:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "activateWithDomainIdentifier:noteIdentifier:completion:", &stru_1E757CA18, a3, a4);
}

+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_iOSImpl"), "activateWithDomainIdentifier:noteIdentifier:completion:", v10, v9, v8);

}

+ (Class)_iOSImpl
{
  void *v2;

  if (SYIsPhone() && !SYRemotePresentationEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "BOOLForKey:", CFSTR("SYEnableSystemPaperRemoteAlert"));

  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (SYNotesActivationCommand)init
{
  SYNotesActivationCommand *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dataLoadingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SYNotesActivationCommand;
  v2 = -[SYNotesActivationCommand init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.synapse.dataLoadingQueue", 0);
    dataLoadingQueue = v2->__dataLoadingQueue;
    v2->__dataLoadingQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  void (**v34)(_QWORD);
  _QWORD v35[4];
  id v36;
  id v37;
  SYNotesActivationCommand *v38;
  id v39;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.notes.activity.insert-data"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __51__SYNotesActivationCommand_activateWithCompletion___block_invoke;
  v35[3] = &unk_1E757C2D0;
  v8 = v5;
  v36 = v8;
  v9 = v6;
  v37 = v9;
  v38 = self;
  v10 = v4;
  v39 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1BCCFF08C](v35);
  -[SYNotesActivationCommand activationRequest](self, "activationRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "urls");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[SYNotesActivationCommand activationRequest](self, "activationRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "urls");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("SYContentItemURLs"));

  }
  -[SYNotesActivationCommand activationRequest](self, "activationRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imagesData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[SYNotesActivationCommand activationRequest](self, "activationRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imagesData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("SYContentItemImageData"));

  }
  -[SYNotesActivationCommand activationRequest](self, "activationRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageFileURLs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    -[SYNotesActivationCommand activationRequest](self, "activationRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageFileURLs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    v30 = 3221225472;
    v31 = __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_13;
    v32 = &unk_1E757B6E8;
    v33 = v9;
    v34 = v11;
    -[SYNotesActivationCommand _loadDataFromFileURLs:withCompletion:](self, "_loadDataFromFileURLs:withCompletion:", v26, &v29);

  }
  -[SYNotesActivationCommand activationRequest](self, "activationRequest", v29, v30, v31, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "shouldAutoInsertLinkToCurrentActivity");

  if (v28)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SYAutoInsertLinkToCurrentUserActivity"));
  if (!v24)
    v11[2](v11);

}

uint64_t __51__SYNotesActivationCommand_activateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.synapse", "NotesActivation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "activityType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218498;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_INFO, "Performing Notes activation with meta activity: %p:%@, userInfo: %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setUserInfo:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_opt_class(), "activateWithMetaActivity:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

void __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_2;
  block[3] = &unk_1E757B388;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SYContentItemImageData"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v2, "addObjectsFromArray:", v3);
    objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, CFSTR("SYContentItemImageData"));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_loadDataFromFileURLs:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *dataLoadingQueue;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYNotesActivationCommand.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  dataLoadingQueue = self->__dataLoadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SYNotesActivationCommand__loadDataFromFileURLs_withCompletion___block_invoke;
  block[3] = &unk_1E757B850;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(dataLoadingQueue, block);

}

void __65__SYNotesActivationCommand__loadDataFromFileURLs_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = os_log_create("com.apple.synapse", "NotesActivation");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v9;
          _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_INFO, "Loading image data from file URL: %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v4);
  }

  v11 = *(_QWORD *)(v14 + 40);
  v12 = v2;
  v13 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

}

- (SYNotesActivationRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activationRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationRequest, 0);
  objc_storeStrong((id *)&self->__dataLoadingQueue, 0);
}

+ (void)setRemotePresentationEnabled:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;

}

@end
