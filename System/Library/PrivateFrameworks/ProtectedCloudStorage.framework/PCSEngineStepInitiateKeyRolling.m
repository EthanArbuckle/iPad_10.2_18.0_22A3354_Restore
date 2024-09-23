@implementation PCSEngineStepInitiateKeyRolling

void __PCSEngineStepInitiateKeyRolling_block_invoke(uint64_t a1, const __CFNumber *a2)
{
  void *v4;
  const __CFNumber *IndexByName;
  const __CFNumber *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFDictionary *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1AF415520]();
  if (!PCSServiceItemTypeIsManatee((_BOOL8)a2) && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
  {
    IndexByName = PCSServiceItemGetIndexByName(a2);
    if ((_DWORD)IndexByName)
    {
      v6 = IndexByName;
      v7 = *MEMORY[0x1E0CD6CB8];
      v8 = *MEMORY[0x1E0CD6B80];
      v9 = MEMORY[0x1E0C9AAB0];
      v21[0] = *MEMORY[0x1E0CD6C98];
      v21[1] = v8;
      v22[0] = v7;
      v22[1] = MEMORY[0x1E0C9AAB0];
      v10 = *MEMORY[0x1E0CD6B50];
      v21[2] = *MEMORY[0x1E0CD6B40];
      v21[3] = v10;
      v11 = *(_QWORD *)(a1 + 72);
      v22[2] = kPCSServiceName[0];
      v22[3] = v11;
      v21[4] = *MEMORY[0x1E0CD6BC8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IndexByName | 0x10000);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[4] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *MEMORY[0x1E0CD69D0];
      v20 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = qword_1ECED3FF0(v13, v14);
      if ((_DWORD)v15 == -25300)
      {
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Failed to find identity for service %@ to mark for rolling"), a2);
      }
      else if ((_DWORD)v15)
      {
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Failed to mark identities for service %@ for rolling: %d"), a2, v15);
      }
      else
      {
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v16 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 40), "options");
        CFDictionaryGetValue(v16, kPCSSetupCallbackMarkNegative[0]);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          (*(void (**)(uint64_t, _QWORD, const __CFNumber *))(v17 + 16))(v17, *(_QWORD *)(a1 + 72), v6);

      }
    }
    else
    {
      PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Failed to get service ID for %@"), a2);
    }
  }
  objc_autoreleasePoolPop(v4);
}

@end
