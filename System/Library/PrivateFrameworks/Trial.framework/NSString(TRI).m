@implementation NSString(TRI)

- (id)triStringByResolvingSymlinksInPath
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stringByResolvingSymlinksInPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("/var/")))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v2, "destinationOfSymbolicLinkAtPath:error:", CFSTR("/var"), &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;

    if (v3)
    {
      objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("/var/"), "length"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0CB3940];
      v10[0] = CFSTR("/");
      v10[1] = v3;
      v10[2] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathWithComponents:", v7);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (uint64_t)triIsPathSafePlausibleUniqueId
{
  uint64_t result;

  result = objc_msgSend(a1, "triIsPathSafe");
  if ((_DWORD)result)
    return (unint64_t)objc_msgSend(a1, "length") > 5;
  return result;
}

- (uint64_t)triIsPathSafe
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return (objc_msgSend(a1, "containsString:", CFSTR("/")) & 1) == 0
        && (objc_msgSend(a1, "containsString:", &stru_1E3C04170) & 1) == 0
        && objc_msgSend(objc_retainAutorelease(a1), "UTF8String") != 0;
  return result;
}

- (id)triSanitizedPathComponentWithMaxLength:()TRI addHash:error:
{
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 1);
    if (v12)
    {
      v13 = (void *)v12;
      if (qword_1ECED7E80 != -1)
        dispatch_once(&qword_1ECED7E80, &__block_literal_global_16);
      objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", _MergedGlobals_13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", &stru_1E3C00710);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a4 || objc_msgSend(a1, "isEqualToString:", v15))
      {
        if (!a3)
        {
LABEL_32:
          v25 = v15;

          v28 = v25;
          goto LABEL_33;
        }
        if (objc_msgSend(v15, "length") > a3)
        {
          if (a4)
            goto LABEL_10;
          v40 = a2;
          v29 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "substringToIndex:", a3 - 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%@#"), v30);
          v31 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v31;
          a2 = v40;
        }
LABEL_26:
        v32 = objc_msgSend(v15, "length");
        v33 = 8;
        if (!a4)
          v33 = 0;
        if (v33 <= a3)
          v33 = a3;
        if (v32 > v33)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = a2;
          v37 = v35;
          objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v36, a1, CFSTR("NSString+TRI.m"), 125, CFSTR("sanitized string is longer than expected"));

        }
        goto LABEL_32;
      }
LABEL_10:
      v39 = a2;
      v38 = objc_msgSend(a1, "triJavaHash");
      v16 = v15;
      v17 = v16;
      v18 = v16;
      if (a3)
      {
        if (a3 < 8)
        {
          v18 = &stru_1E3C00710;
        }
        else
        {
          v19 = -[__CFString length](v16, "length");
          if (v19 >= a3 - 8)
            v20 = a3 - 8;
          else
            v20 = v19;
          -[__CFString substringToIndex:](v17, "substringToIndex:", v20);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@#%07x"), v18, v38 & 0xFFFFFFF);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      a2 = v39;
      if (!a3)
        goto LABEL_32;
      goto LABEL_26;
    }
    if (a5)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("could not create string from ASCII encoded data");
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v42;
      v24 = &v41;
      goto LABEL_20;
    }
  }
  else if (a5)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44[0] = CFSTR("could not get data from string");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = (const __CFString **)v44;
    v24 = &v43;
LABEL_20:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *a5;
    *a5 = (void *)v26;

    v28 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v28 = 0;
LABEL_34:

  objc_autoreleasePoolPop(v10);
  return v28;
}

- (id)triHashWithIntegerSalt:()TRI
{
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "triHashWithDataSalt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)triHashWithDataSalt:()TRI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const void *v9;
  CC_LONG v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v5, "length") + objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v4);

  objc_msgSend(v6, "appendData:", v5);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = (const void *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = objc_retainAutorelease(v7);
  CC_SHA256(v9, v10, (unsigned __int8 *)objc_msgSend(v11, "mutableBytes"));
  v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v13 = objc_retainAutorelease(v11);
  v14 = (void *)objc_msgSend(v12, "initWithUUIDBytes:", objc_msgSend(v13, "bytes"));

  return v14;
}

+ (id)triHashStrings:()TRI withDataSalt:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CC_SHA256_CTX c;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+TRI.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strings"));

  }
  v9 = (void *)MEMORY[0x1A1AC6B8C]();
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  if (v8)
  {
    v10 = objc_retainAutorelease(v8);
    CC_SHA256_Update(&c, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1A1AC6B8C]();
        objc_msgSend(v16, "dataUsingEncoding:", 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = objc_retainAutorelease(v18);
          CC_SHA256_Update(&c, (const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
        }

        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

  v21 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32));
  if (!objc_msgSend(v21, "mutableBytes"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v22 = objc_retainAutorelease(v21);
  CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v22, "mutableBytes"), &c);
  objc_autoreleasePoolPop(v9);

  return v22;
}

- (uint64_t)triJavaHash
{
  unint64_t v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = 0;
  LODWORD(v3) = 0;
  do
    v3 = objc_msgSend(a1, "characterAtIndex:", v2++) - v3 + 32 * (_DWORD)v3;
  while (v2 < objc_msgSend(a1, "length"));
  return v3;
}

- (id)triFilenameForFactorName
{
  void *v4;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "triSanitizedPathComponentWithMaxLength:addHash:error:", 50, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+TRI.m"), 136, CFSTR("Failed to sanitize factor name \"%@\": %@"), a1, v7);

  }
  return v4;
}

- (id)triTrim
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)triNullableStringsAreEqualWithString:()TRI andOther:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqualToString:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
