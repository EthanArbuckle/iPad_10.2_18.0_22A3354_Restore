@implementation PKOpenSensitiveURL

void __PKOpenSensitiveURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open URL with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_8:
      v9();
    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_8;
    }
  }

}

@end
