@implementation PUIWatchBundleIDForBundleID

void __PUIWatchBundleIDForBundleID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _PUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v5;
      v8 = "Error fetching watch app bundle id for %@, error %@";
LABEL_6:
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v9 = objc_msgSend(a2, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    _PUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v13 = *(void **)(a1 + 32);
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v8 = "Found watch bundle id %@ for companion bundle id %@";
      goto LABEL_6;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
