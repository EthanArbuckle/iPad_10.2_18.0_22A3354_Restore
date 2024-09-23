@implementation WFPerformACECommand

void __WFPerformACECommand_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  Class AceObjectClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 48))
  {
    v16 = v3;
    getSAGenericCommandClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      AceObjectClass = getAceObjectClass();
      objc_msgSend(v16, "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class aceObjectWithDictionary:](AceObjectClass, "aceObjectWithDictionary:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      getSABaseCommandClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;

        v16 = v7;
      }
      else
      {
        NSLog(CFSTR("[WFPerformACECommand] Generic command was unable to be converted into a base command"));
      }

    }
    getSACommandFailedClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v16;
      objc_msgSend(v8, "reason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "errorCode");
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFACEErrorDomain"), v10, MEMORY[0x1E0C9AA70]);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      NSLog(CFSTR("[WFPerformACECommand] Command failed with reason string %@ error code %ld"), v9, v10);
    }
    else
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = v16;
      v9 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v15;
    }

    v3 = v16;
  }

}

void __WFPerformACECommand_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_18;
  if (!v5)
  {
    v18 = 0;
    goto LABEL_14;
  }
  v20 = v5;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getkAFAssistantErrorDomain();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v7))
    goto LABEL_11;
  objc_msgSend(v20, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v20, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v11, "mutableCopy");

    v12 = objc_msgSend(v20, "code");
    v13 = CFSTR("An unknown error occurred while performing the request.");
    if (v12 == 18)
      v13 = CFSTR("Unable to complete request because Siri is disabled.");
    if (v12 == 13)
      v14 = CFSTR("Unable to complete request because it is not supported on this platform.");
    else
      v14 = (__CFString *)v13;
    WFLocalizedString(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v9);

    v16 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v20, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v7, objc_msgSend(v20, "code"), v6);
    v17 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v17;
LABEL_11:

  }
  v18 = v20;
LABEL_14:
  v21 = v18;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    v19 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  else
    v19 = v18;
  (*(void (**)(_QWORD, _QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, v19);
  v5 = v21;
LABEL_18:

}

@end
