@implementation NSString(_PASAdditions)

- (const)_pas_fastUTF8StringPtrWithOptions:()_PASAdditions encodedLength:
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (const char *)objc_msgSend(a1, "_pas_overrideFastUTF8StringPtrWithOptions:encodedLength:", a3, a4);
  v8 = a3 & 1;
  v9 = objc_retainAutorelease(a1);
  v10 = objc_msgSend(v9, "_fastCStringContents:", v8);
  if (v10)
  {
    v11 = v10;
    if (a4)
      *a4 = objc_msgSend(v9, "length");
  }
  else if (objc_msgSend(v9, "length"))
  {
    return 0;
  }
  else
  {
    if (a4)
      *a4 = 0;
    return "";
  }
  return (const char *)v11;
}

- (__CFString)_pas_stringBackedByUTF8CString
{
  __CFString *v2;
  uint64_t v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  void *memptr;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[__CFString _pas_overrideStringBackedByUTF8CString](a1, "_pas_overrideStringBackedByUTF8CString");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (CFStringGetCStringPtr(a1, 0x8000100u))
  {
LABEL_4:
    v2 = a1;
    return v2;
  }
  v4 = -[__CFString length](a1, "length");
  if (!v4)
    return &stru_1E4431528;
  v5 = v4;
  v6 = -[__CFString lengthOfBytesUsingEncoding:](a1, "lengthOfBytesUsingEncoding:", 4);
  if (!v6)
    goto LABEL_4;
  v7 = v6;
  v8 = v6 + 1;
  memptr = 0;
  v23 = 0;
  if ((unint64_t)(v6 + 4) > 0x400)
  {
    v19 = malloc_type_posix_memalign(&memptr, 8uLL, v8, 0x7C790F8uLL);
    LOBYTE(v23) = 0;
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v20);
    }
    v9 = (char *)memptr;
  }
  else
  {
    v9 = (char *)&v21 - ((v6 + 19) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, v6 + 4);
    memptr = v9;
    LOBYTE(v23) = 1;
  }
  v10 = v23;
  -[__CFString getCString:maxLength:encoding:](a1, "getCString:maxLength:encoding:", v9, v8, 4);
  if (v7 == v5)
  {
    if (strnlen(v9, v5) < v5)
    {
      if ((v10 & 1) == 0)
        free(v9);
      goto LABEL_4;
    }
    v13 = (void *)MEMORY[0x1A1AFDC98]();
    objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v9, v10, v8, 1, 1, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      __assert_rtn("-[NSString(_PASAdditions) _pas_stringBackedByUTF8CString]", "NSString+_PASAdditions.m", 1044, "result");
    v15 = (void *)v14;
    objc_autoreleasePoolPop(v13);
    return (__CFString *)v15;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    if ((v10 & 1) != 0)
      v12 = (void *)objc_msgSend(v11, "initWithBytes:length:", v9, v8);
    else
      v12 = (void *)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v9, v8, 1);
    v16 = v12;
    +[NSString _pas_stringWithDataNoCopy:encoding:nullTerminated:isExternalRepresentation:utf8StringThreshold:](MEMORY[0x1E0CB3940], v12, 4, 1, 0, 1uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      __assert_rtn("-[NSString(_PASAdditions) _pas_stringBackedByUTF8CString]", "NSString+_PASAdditions.m", 1060, "result");
    v18 = (void *)v17;

    return (__CFString *)v18;
  }
}

- (id)_pas_proxyArrayOfSubstringsWithRanges:()_PASAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = a1;
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0C99D20];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke;
  v14[3] = &unk_1E442FCB0;
  v15 = v5;
  v16 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke_2;
  v12[3] = &unk_1E442FCD8;
  v13 = v16;
  v8 = v16;
  v9 = v5;
  objc_msgSend(v7, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v14, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_pas_setRetainsConmingledBackingStore:()_PASAdditions
{
  void *v5;

  if (malloc_size(a1))
  {
    if (a3)
      v5 = (void *)*MEMORY[0x1E0C9AE50];
    else
      v5 = 0;
    objc_setAssociatedObject(a1, sel__pas_setRetainsConmingledBackingStore_, v5, (void *)1);
  }
}

- (uint64_t)_pas_retainsConmingledBackingStore
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel__pas_setRetainsConmingledBackingStore_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (id)_pas_stringWithConsumedAllocaDescrNoCopy:()_PASAdditions bufferSize:encoding:nullTerminated:isExternalRepresentation:
{
  CFIndex v9;
  void *v11;
  CFStringEncoding v12;
  void *v16;
  unint64_t v17;

  v9 = a5;
  if ((a4 & 1) != 0)
  {
    if (a7)
    {
      if (!a5)
      {
        v17 = encoding;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+_PASAdditions.m"), 933, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferSize > 0"));

        encoding = v17;
      }
      --v9;
    }
    v12 = CFStringConvertNSStringEncodingToEncoding(encoding);
    v11 = (void *)CFStringCreateWithBytes(0, a3, v9, v12, a8);
  }
  else
  {
    +[NSString _pas_foundationStringNoCopyWithBufferStart:bufferEnd:encoding:nullTerminated:isExternalRepresentation:allocator:](a1, (const char *)a3, (unint64_t)&a3[a5], encoding, a7, a8, (const __CFAllocator *)*MEMORY[0x1E0C9AE10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (_PASUTF8String)_pas_stringWithDataNoCopy:()_PASAdditions encoding:nullTerminated:isExternalRepresentation:
{
  return +[NSString _pas_stringWithDataNoCopy:encoding:nullTerminated:isExternalRepresentation:utf8StringThreshold:](MEMORY[0x1E0CB3940], a3, a4, a5, a6, 0x400uLL);
}

+ (uint64_t)_pas_stringWithDataNoCopy:()_PASAdditions encoding:nullTerminated:
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithDataNoCopy:encoding:nullTerminated:isExternalRepresentation:", a3, a4, a5, 0);
}

+ (__CFString)_pas_proxyStringByConcatenatingStrings:()_PASAdditions
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  v3 = a3;
  objc_opt_self();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_1760);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (uint64_t)-[_PASProxyConcatenatedString _initWithComponents:]([_PASProxyConcatenatedString alloc], v4);
    }
    v6 = (__CFString *)v5;
  }
  else
  {
    v6 = &stru_1E4431528;
  }

  return v6;
}

@end
