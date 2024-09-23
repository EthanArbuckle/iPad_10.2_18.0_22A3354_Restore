@implementation TIGetMeCardAsync

void __TIGetMeCardAsync_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __TIGetMeCardAsync_block_invoke_2;
  v5[3] = &unk_1EA107410;
  v3 = *(id *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "requestAccessForEntityType:completionHandler:", 0, v5);

}

void __TIGetMeCardAsync_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to open address book for Me card: %@"), "TIGetMeCardAsync_block_invoke_2", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    TIAddressBookGetMeCard(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

@end
