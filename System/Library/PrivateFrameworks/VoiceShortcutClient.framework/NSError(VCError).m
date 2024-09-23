@implementation NSError(VCError)

- (BOOL)vc_isFileNotFound
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 result;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  result = 1;
  if (!v3 || objc_msgSend(a1, "code") != 260 && objc_msgSend(a1, "code") != 4)
  {
    objc_msgSend(a1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if (!v5 || objc_msgSend(a1, "code") != 2)
      return 0;
  }
  return result;
}

- (BOOL)vc_isFileAlreadyExists
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 result;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  result = 1;
  if (!v3 || objc_msgSend(a1, "code") != 516)
  {
    objc_msgSend(a1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if (!v5 || objc_msgSend(a1, "code") != 17)
      return 0;
  }
  return result;
}

+ (id)vc_voiceShortcutErrorWithCode:()VCError underlyingError:reason:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v18 = &a9;
  if (!v13)
  {
    v14 = 0;
    if (v12)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v13, &a9);
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v19 = *MEMORY[0x1E0CB3388];
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, &a9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(a1, "_vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", a3, v15, v14, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)vc_voiceShortcutErrorWithCode:()VCError reason:
{
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;

  if (a4)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB3940];
    v12 = a4;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a1, "_vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", a3, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)vc_voiceShortcutErrorWithCode:()VCError extraUserInfo:reason:
{
  id v12;
  objc_class *v13;
  id v14;
  void *v15;

  v12 = a4;
  if (a5)
  {
    v13 = (objc_class *)MEMORY[0x1E0CB3940];
    v14 = a5;
    a5 = (void *)objc_msgSend([v13 alloc], "initWithFormat:arguments:", v14, &a9);

  }
  objc_msgSend(a1, "_vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", a3, v12, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_vc_voiceShortcutErrorWithCode:()VCError extraUserInfo:reason:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  if (v7)
    v9 = (id)objc_msgSend(v7, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCVoiceShortcutsErrorDomain"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)vc_persistenceErrorWithUnderlyingError:()VCError
{
  return objc_msgSend(a1, "vc_voiceShortcutErrorWithCode:underlyingError:", 1004, a3);
}

+ (id)vc_partialPersistenceErrorWithPartialErrors:()VCError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = CFSTR("VCPartialErrorsByItemIDKey");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCVoiceShortcutsErrorDomain"), 1006, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)vc_voiceShortcutErrorWithCode:()VCError underlyingError:
{
  return objc_msgSend(a1, "vc_voiceShortcutErrorWithCode:underlyingError:reason:", a3, a4, 0);
}

@end
