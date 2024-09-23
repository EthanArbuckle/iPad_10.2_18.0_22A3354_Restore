@implementation VUIRemoveFromPlayHistoryRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_2 != -1)
    dispatch_once(&sharedInstance___onceToken_2, &__block_literal_global_24);
  return (id)sharedInstance___instance_0;
}

void __56__VUIRemoveFromPlayHistoryRequestManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIRemoveFromPlayHistoryRequestManager _init]([VUIRemoveFromPlayHistoryRequestManager alloc], "_init");
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

- (id)_init
{
  VUIRemoveFromPlayHistoryRequestManager *v2;
  uint64_t v3;
  NSMutableDictionary *ongoingDeleteIDOperationDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIRemoveFromPlayHistoryRequestManager;
  v2 = -[VUIRemoveFromPlayHistoryRequestManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    ongoingDeleteIDOperationDictionary = v2->_ongoingDeleteIDOperationDictionary;
    v2->_ongoingDeleteIDOperationDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (VUIRemoveFromPlayHistoryRequestManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented"), CFSTR("-[VUIRemoveFromPlayHistoryRequestManager init] not supported, use +sharedInstance instead"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)sendRequestForDeleteID:(id)a3 isContinueWatching:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id from;
  id location;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_ongoingDeleteIDOperationDictionary, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isCancelled"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8830]), "initWithItemID:", v6);
    if (v9)
    {
      objc_initWeak(&location, v9);
      objc_initWeak(&from, self);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke;
      v15 = &unk_1E9F9B0F0;
      objc_copyWeak(&v17, &location);
      v10 = v6;
      v16 = v10;
      objc_copyWeak(&v18, &from);
      v19 = a4;
      objc_msgSend(v9, "setCompletionBlock:", &v12);
      -[NSMutableDictionary setValue:forKey:](self->_ongoingDeleteIDOperationDictionary, "setValue:forKey:", v9, v10, v12, v13, v14, v15);
      objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addOperation:", v9);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }

}

void __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", *(_QWORD *)(a1 + 32), CFSTR("CanonicalID"));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("Error"));

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke_2;
  v7[3] = &unk_1E9F99CE0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 56);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "ongoingDeleteIDOperationDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (*(_BYTE *)(a1 + 56))
    v5 = CFSTR("VUIClearFromPlayHistoryRequestDidFinishNotification");
  else
    v5 = CFSTR("VUIRemoveFromPlayHistoryRequestDidFinishNotification");
  objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)ongoingDeleteIDOperationDictionary
{
  return self->_ongoingDeleteIDOperationDictionary;
}

- (void)setOngoingDeleteIDOperationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingDeleteIDOperationDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingDeleteIDOperationDictionary, 0);
}

- (void)sendRequestForDeleteID:(os_log_t)log isContinueWatching:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIRemoveFromPlayHistoryRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end
