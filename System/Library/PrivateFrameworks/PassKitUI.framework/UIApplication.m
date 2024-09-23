@implementation UIApplication

void __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_3;
  v1[3] = &unk_1E3E66238;
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

uint64_t __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = v1;
  }
  return result;
}

@end
