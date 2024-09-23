@implementation NSData(TRI)

- (id)triSha256
{
  void *v2;
  id v3;
  const void *v4;
  CC_LONG v5;
  id v6;
  unsigned __int8 *v7;
  id v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v2);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "mutableBytes");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  CC_SHA256(v4, v5, v7);
  return v6;
}

- (id)triSha256Base64String
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "triSha256");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)triHexlify
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  id v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  char v14;
  char v15;
  void *v16;
  void *v18;
  id v19;

  v4 = objc_msgSend(a1, "length");
  v5 = 2 * v4;
  v6 = (char *)malloc_type_malloc(2 * v4, 0x19C0FF2BuLL);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v7 = v6;
  v8 = objc_retainAutorelease(a1);
  v9 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
  if (v4)
  {
    v10 = v7 + 1;
    do
    {
      v12 = *v9++;
      v11 = v12;
      v13 = v12 & 0xF;
      if (v12 >= 0xA0)
        v14 = 87;
      else
        v14 = 48;
      *(v10 - 1) = v14 + (v11 >> 4);
      if (v13 >= 0xA)
        v15 = 87;
      else
        v15 = 48;
      *v10 = v15 + v13;
      v10 += 2;
      --v4;
    }
    while (v4);
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v5, 1, 1);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("NSData+TRI.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  return v16;
}

+ (id)triVerifiedMappedDataWithFile:()TRI error:
{
  id v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  ssize_t v13;
  ssize_t v14;
  id v15;
  int *v16;
  char *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  int *v26;
  char *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  v7 = objc_retainAutorelease(v5);
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);
  if (v8 < 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = __error();
    v17 = strerror(*v16);
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("Failed to open \"%@\": %s (%d)"), v7, v17, *__error());
    if (a4)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2FE0];
      v21 = *__error();
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, v21, v22);
      v24 = *a4;
      *a4 = (id)v23;

    }
    objc_autoreleasePoolPop(v6);
LABEL_17:
    v35 = 0;
    goto LABEL_18;
  }
  v9 = v8;
  v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 0x10000));
  v11 = objc_msgSend(v10, "mutableBytes");
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  v12 = (void *)v11;
  while (1)
  {
    v13 = read(v9, v12, objc_msgSend(v10, "length"));
    v14 = v13;
    if (v13 < 0)
      break;
    if (!v13)
      goto LABEL_13;
  }
  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
  v26 = __error();
  v27 = strerror(*v26);
  v28 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("Error while read-verifying \"%@\": %s (%d)"), v7, v27, *__error());
  if (a4)
  {
    v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0CB2FE0];
    v30 = *__error();
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v31 = v6;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v40, "initWithDomain:code:userInfo:", v29, v30, v32);
    v34 = *a4;
    *a4 = (id)v33;

    v6 = v31;
  }

LABEL_13:
  close(v9);

  objc_autoreleasePoolPop(v6);
  if (v14 < 0)
    goto LABEL_17;
  v41 = 0;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 8, &v41);
  v36 = v41;
  v37 = v41;
  if (a4)
    objc_storeStrong(a4, v36);

LABEL_18:
  return v35;
}

@end
