@implementation UASharedPasteboard

+ (void)localPasteboardDidAddData:(id)a3 toItemAtIndex:(unint64_t)a4 generation:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218243;
    v12 = a4;
    v13 = 2113;
    v14 = v9;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "PBOARD CLIENT: add type for index: %lu/%{private}@", (uint8_t *)&v11, 0x16u);

  }
  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addData:toItemAtIndex:generation:", v7, a4, a5);

}

+ (void)localPasteboardDidAddItems:(id)a3 forGeneration:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _uaGetLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218243;
    v22 = objc_msgSend(v5, "count");
    v23 = 2113;
    v24 = v5;
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "PBOARD CLIENT: addItems, %lud items added, items=%{private}@", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "types");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
            +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addData:toItemAtIndex:generation:", v14, v7, a4);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }

      ++v7;
    }
    while (objc_msgSend(v5, "count") > v7);
  }

}

+ (void)clearLocalPasteboardInformation
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _uaGetLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "PBOARD CLIENT: Clear Local Pasteboard Info", v4, 2u);
  }

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLocalPasteboardInformation");

}

+ (void)localPasteboardDidPasteGeneration:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = a3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_INFO, "PBOARD CLIENT: localPasteboardDidPasteGeneration = %ld", (uint8_t *)&v5, 0xCu);
  }

}

+ (id)remotePasteboard
{
  if (remotePasteboard_onceToken != -1)
    dispatch_once(&remotePasteboard_onceToken, &__block_literal_global_13);
  return (id)remotePasteboard_remotePasteboard;
}

void __38__UASharedPasteboard_remotePasteboard__block_invoke()
{
  UASharedPasteboard *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(UASharedPasteboard);
  v1 = (void *)remotePasteboard_remotePasteboard;
  remotePasteboard_remotePasteboard = (uint64_t)v0;

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)remotePasteboard_remotePasteboard, "setManager:", v2);

}

- (BOOL)returnPasteboardDataBeforeArchives
{
  void *v2;
  char v3;

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestPasteboardFetchReturnEarly");

  return v3;
}

- (void)requestRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[UASharedPasteboard requestRemotePasteboardTypesForProcess:withCompletion:]";
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestRemotePasteboardTypesForProcess:withCompletion:", v4, v5);

}

- (void)requestRemotePasteboardDataForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[UASharedPasteboard requestRemotePasteboardDataForProcess:withCompletion:]";
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestRemotePasteboardDataForProcess:withCompletion:", v4, v5);

}

- (void)prefetchRemotePasteboardTypes:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136446210;
    v5 = "-[UASharedPasteboard prefetchRemotePasteboardTypes:]";
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v4, 0xCu);
  }

}

- (id)currentRemoteDeviceName
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[UASharedPasteboard currentRemoteDeviceName]";
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRemoteDeviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)startPreventingPasteboardSharing
{
  id v2;

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPreventingPasteboardSharing");

}

+ (void)stopPreventingPasteboardSharing
{
  id v2;

  +[UASharedPasteboardManager sharedManager](UASharedPasteboardManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPreventingPasteboardSharing");

}

- (UASharedPasteboardManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  self->_manager = (UASharedPasteboardManager *)a3;
}

@end
