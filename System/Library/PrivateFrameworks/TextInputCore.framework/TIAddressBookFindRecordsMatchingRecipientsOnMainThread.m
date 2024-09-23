@implementation TIAddressBookFindRecordsMatchingRecipientsOnMainThread

void __TIAddressBookFindRecordsMatchingRecipientsOnMainThread_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Could not open address book on main thread: %@"), "TIAddressBookFindRecordsMatchingRecipientsOnMainThread_block_invoke", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  else
  {
    recordsFromAddressBookMatchingRecipients(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

@end
