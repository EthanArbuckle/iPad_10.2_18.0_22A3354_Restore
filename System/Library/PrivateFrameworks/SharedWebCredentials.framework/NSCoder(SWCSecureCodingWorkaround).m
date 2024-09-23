@implementation NSCoder(SWCSecureCodingWorkaround)

- (id)swc_decodeObjectOfClass:()SWCSecureCodingWorkaround forKey:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A85D4B3C]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a3, 0);
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15[0] = CFSTR("Line");
    v15[1] = CFSTR("Function");
    v16[0] = &unk_1E5480EE8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSCoder(SWCSecureCodingWorkaround) swc_decodeObjectOfClass:forKey:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v12);
    objc_msgSend(a1, "failWithError:", v13);

    v9 = 0;
  }

  return v9;
}

- (id)swc_decodeObjectOfClasses:()SWCSecureCodingWorkaround forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A85D4B3C]();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22[0] = CFSTR("Line");
      v22[1] = CFSTR("Function");
      v23[0] = &unk_1E5480F00;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSCoder(SWCSecureCodingWorkaround) swc_decodeObjectOfClasses:forKey:]", v18);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v15);
      objc_msgSend(a1, "failWithError:", v16);

      v9 = 0;
    }

  }
  return v9;
}

@end
