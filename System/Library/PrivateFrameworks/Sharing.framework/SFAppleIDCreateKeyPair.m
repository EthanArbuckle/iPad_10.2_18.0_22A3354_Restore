@implementation SFAppleIDCreateKeyPair

void __SFAppleIDCreateKeyPair_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __SecKey *v20;
  __SecKey *v21;
  SecKeyRef v22;
  int v23;
  NSObject *v24;
  CFErrorRef v25;
  uint64_t v26;
  void *v27;
  _QWORD block[4];
  id v29;
  __SecKey *v30;
  SecKeyRef v31;
  int v32;
  CFErrorRef error;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  error = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_16;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A70], *MEMORY[0x1E0CD6A38]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E48906D0, *MEMORY[0x1E0CD6A20]);
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8]);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = *(const __CFString **)(a1 + 32);
  if (!v6)
    v6 = &stru_1E483B8E8;
  v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("Apple ID %@ private key"), v6);
  if (v7)
  {
    v8 = *MEMORY[0x1E0CD69D8];
    v9 = *MEMORY[0x1E0CD68A0];
    v36[0] = *MEMORY[0x1E0CD69D8];
    v36[1] = v9;
    v10 = *MEMORY[0x1E0CD68B0];
    v37[0] = v4;
    v37[1] = v10;
    v11 = *MEMORY[0x1E0CD6B80];
    v12 = a1;
    v13 = *MEMORY[0x1E0CD6A90];
    v36[2] = *MEMORY[0x1E0CD6B80];
    v36[3] = v13;
    v37[2] = MEMORY[0x1E0C9AAA0];
    v37[3] = v7;
    v27 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = *(const __CFString **)(v12 + 32);
    if (!v16)
      v16 = &stru_1E483B8E8;
    v26 = v12;
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("Apple ID %@ public key"), v16);
    v18 = (void *)v17;
    if (v17)
    {
      v34[0] = v8;
      v34[1] = v9;
      v35[0] = MEMORY[0x1E0C9AAB0];
      v35[1] = v10;
      v34[2] = v11;
      v34[3] = v13;
      v35[2] = MEMORY[0x1E0C9AAA0];
      v35[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CD6FC0]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CD6FF8]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("com.apple.sharing.appleidauthentication"), *MEMORY[0x1E0CD6898]);
      v20 = SecKeyCreateRandomKey((CFDictionaryRef)v3, &error);
      if (v20)
      {
        v21 = v20;
        v22 = SecKeyCopyPublicKey(v20);
        a1 = v26;
        if (v22)
        {
          if (gLogCategory_SFAppleIDKeychainUtilities <= 50
            && (gLogCategory_SFAppleIDKeychainUtilities != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v23 = 0;
        }
        else
        {
          CFRelease(v21);
          v21 = 0;
          v23 = -6762;
        }
      }
      else
      {
        a1 = v26;
        if (gLogCategory_SFAppleIDKeychainUtilities <= 90
          && (gLogCategory_SFAppleIDKeychainUtilities != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v25 = error;
        v23 = NSErrorToOSStatus();

        v22 = 0;
        v21 = 0;
      }
    }
    else
    {
      v19 = 0;
      v22 = 0;
      v21 = 0;
      v23 = -6728;
      a1 = v26;
    }
  }
  else
  {
LABEL_16:
    v18 = 0;
    v19 = 0;
    v27 = 0;
    v14 = 0;
    v22 = 0;
    v21 = 0;
    v23 = -6728;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SFAppleIDCreateKeyPair_block_invoke_2;
  block[3] = &unk_1E482D290;
  v24 = *(NSObject **)(a1 + 40);
  v29 = *(id *)(a1 + 48);
  v30 = v21;
  v31 = v22;
  v32 = v23;
  dispatch_async(v24, block);

}

uint64_t __SFAppleIDCreateKeyPair_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

uint64_t __SFAppleIDCreateKeyPair_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, *(unsigned int *)(a1 + 40));
}

@end
