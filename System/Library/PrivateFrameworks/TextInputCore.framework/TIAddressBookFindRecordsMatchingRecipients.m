@implementation TIAddressBookFindRecordsMatchingRecipients

void __TIAddressBookFindRecordsMatchingRecipients_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CONTACTS: Could not access database: %@"), "TIAddressBookFindRecordsMatchingRecipients_block_invoke", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  else if (a2)
  {
    recordsFromAddressBookMatchingRecipients(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 56), "lock");
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (v8)
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CONTACTS: Timeout before access handler completed"), "TIAddressBookFindRecordsMatchingRecipients_block_invoke");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }
  else
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CONTACTS: Retrieved %lu record(s) from database"), "TIAddressBookFindRecordsMatchingRecipients_block_invoke", objc_msgSend(v7, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 56), "broadcast");
  objc_msgSend(*(id *)(a1 + 56), "unlock");

}

@end
