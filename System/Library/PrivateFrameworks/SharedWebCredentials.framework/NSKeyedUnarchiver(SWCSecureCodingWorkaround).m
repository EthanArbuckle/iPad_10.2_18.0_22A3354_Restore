@implementation NSKeyedUnarchiver(SWCSecureCodingWorkaround)

+ (id)swc_unarchivedObjectOfClass:()SWCSecureCodingWorkaround fromData:error:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a3, 0);
  objc_msgSend(a1, "swc_unarchivedObjectOfClasses:fromData:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)swc_unarchivedObjectOfClasses:()SWCSecureCodingWorkaround fromData:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A85D4B3C]();
  v25 = 0;
  objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  objc_autoreleasePoolPop(v10);
  if (v11)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26[0] = CFSTR("Line");
      v26[1] = CFSTR("Function");
      v27[0] = &unk_1E5480ED0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[NSKeyedUnarchiver(SWCSecureCodingWorkaround) swc_unarchivedObjectOfClasses:fromData:error:]", v21);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v27[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v18);

      v11 = 0;
      v12 = (id)v19;
    }

  }
  if (a5 && !v11)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

@end
