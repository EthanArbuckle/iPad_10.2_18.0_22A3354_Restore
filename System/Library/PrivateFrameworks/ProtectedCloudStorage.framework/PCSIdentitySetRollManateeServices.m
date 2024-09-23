@implementation PCSIdentitySetRollManateeServices

void __PCSIdentitySetRollManateeServices_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  const void *v6;
  const void *v7;
  const void *CurrentCreationTime;
  int v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const void *v17;
  const void *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const void *v24[7];

  if (a6 >= 1 && a5 && a4)
  {
    v24[5] = v6;
    v24[6] = v7;
    v24[0] = 0;
    CurrentCreationTime = PCSIdentitySetGetCurrentCreationTime(*(_QWORD *)(a1 + 40), a3, v24);
    if (CurrentCreationTime)
    {
      v12 = *(_DWORD *)(a1 + 56);
      if (v12 == -1)
        v12 = a6;
      if ((uint64_t)CurrentCreationTime + v12 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v13 = dispatch_semaphore_create(0);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __PCSIdentitySetRollManateeServices_block_invoke_2;
        v19[3] = &unk_1E553E270;
        v23 = *(_DWORD *)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v21 = a3;
        v22 = v14;
        v16 = v13;
        v20 = v16;
        PCSIdentitySetCreateManatee(v15, a3, 0, v19);
        v17 = v24[0];
        if (v24[0])
        {
          v24[0] = 0;
          CFRelease(v17);
        }
        dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

      }
    }
    else
    {
      v18 = v24[0];
      if (v24[0])
      {
        v24[0] = 0;
        CFRelease(v18);
      }
    }
  }
}

intptr_t __PCSIdentitySetRollManateeServices_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  pcsLogObjForScope("keyRoll");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_DWORD *)(a1 + 56);
      v11 = 138412546;
      v12 = v6;
      v13 = 1024;
      v14 = v7;
      _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, "Rolled Service Identity %@ expiration %d", (uint8_t *)&v11, 0x12u);
    }

    **(_BYTE **)(a1 + 48) = 1;
  }
  else
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_DWORD *)(a1 + 56);
      v11 = 138412546;
      v12 = v8;
      v13 = 1024;
      v14 = v9;
      _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, "Rolled Service Identity %@ expiration %d", (uint8_t *)&v11, 0x12u);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
