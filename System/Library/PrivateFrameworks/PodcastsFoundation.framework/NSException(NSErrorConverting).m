@implementation NSException(NSErrorConverting)

- (id)error
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB3388];
  v16[0] = a1;
  v5 = *MEMORY[0x1E0CB2938];
  v15[0] = v4;
  v15[1] = v5;
  objc_msgSend(a1, "userInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA70];
  if (v6)
    v8 = v6;
  v16[1] = v8;
  v15[2] = *MEMORY[0x1E0CB2D60];
  objc_msgSend(a1, "reason");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E5500770;
  if (v9)
    v11 = (const __CFString *)v9;
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, 0, v12);

  return v13;
}

@end
