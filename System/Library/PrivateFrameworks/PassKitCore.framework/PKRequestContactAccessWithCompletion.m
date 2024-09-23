@implementation PKRequestContactAccessWithCompletion

void __PKRequestContactAccessWithCompletion_block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contact Access granted by user: %@", buf, 0xCu);
  }

  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error obtaining Contact Access from user: %@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PKRequestContactAccessWithCompletion_block_invoke_213;
    block[3] = &unk_1E2ABD9A0;
    v10 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __PKRequestContactAccessWithCompletion_block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
