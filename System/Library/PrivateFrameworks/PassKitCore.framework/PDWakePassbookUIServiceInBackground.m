@implementation PDWakePassbookUIServiceInBackground

void __PDWakePassbookUIServiceInBackground_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PDWakePassbookUIServiceInBackground: -[FBSOpenApplicationService openApplication] returned error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = 0xFFFFFFFFLL;
    if (v5 && !v6)
    {
      v9 = objc_msgSend(v5, "pid", 0xFFFFFFFFLL);
      v8 = *(_QWORD *)(a1 + 32);
    }
    if (v6)
      v10 = 1;
    else
      v10 = (int)v9 < 0;
    v11 = !v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v11, v9);
  }

}

@end
