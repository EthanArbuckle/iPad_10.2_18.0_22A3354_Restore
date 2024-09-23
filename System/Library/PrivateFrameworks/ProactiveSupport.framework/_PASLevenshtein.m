@implementation _PASLevenshtein

+ (unint64_t)distanceBetweenStrings:(id)a3 and:(id)a4
{
  __CFString *v7;
  __CFString *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  const char *CStringPtr;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  size_t v20;
  size_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  char *v26;
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v36;
  void *v37;
  int v38;
  id v39;
  id v40;
  unint64_t v41;
  _QWORD v42[8];
  void *memptr;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = -[__CFString length](v7, "length");
  v10 = -[__CFString length](v8, "length");
  if (!v9 || (v11 = v10) == 0)
  {
    v13 = -[__CFString lengthOfBytesUsingEncoding:](v8, "lengthOfBytesUsingEncoding:", 2348810496);
    v12 = ((unint64_t)-[__CFString lengthOfBytesUsingEncoding:](v7, "lengthOfBytesUsingEncoding:", 2348810496) >> 2)
        + (v13 >> 2);
    goto LABEL_30;
  }
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v8) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_30;
  }
  CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v15 = CFStringGetCStringPtr(v8, 0x600u);
  if (CStringPtr || -[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String"))
  {
    if (v15)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLevenshtein.mm"), 133, CFSTR("First string is not valid Unicode."));

    if (v15)
      goto LABEL_11;
  }
  if (!-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLevenshtein.mm"), 134, CFSTR("Second string is not valid Unicode."));

  }
LABEL_11:
  if (CStringPtr || (v16 = -[__CFString canBeConvertedToEncoding:](v7, "canBeConvertedToEncoding:", 1), (_DWORD)v16))
  {
    if (v15 || (v16 = -[__CFString canBeConvertedToEncoding:](v8, "canBeConvertedToEncoding:", 1), (_DWORD)v16))
    {
      if (CStringPtr)
      {
        if (!v15)
          goto LABEL_27;
      }
      else
      {
        CStringPtr = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
        if (!v15)
LABEL_27:
          v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
      }
      v12 = levenshtein<char>((uint64_t)CStringPtr, (uint64_t)v15, v9, v11);
      goto LABEL_30;
    }
  }
  v17 = v11;
  v18 = 4 * v11;
  if (v18 + 4 * v9 > 0x7CF)
  {
    -[__CFString dataUsingEncoding:](v7, "dataUsingEncoding:", 2348810496);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString dataUsingEncoding:](v8, "dataUsingEncoding:", 2348810496);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "length");
    v31 = objc_msgSend(v29, "length");
    v32 = objc_retainAutorelease(v28);
    v33 = objc_msgSend(v32, "bytes");
    v34 = objc_retainAutorelease(v29);
    v12 = levenshtein<unsigned int>(v33, objc_msgSend(v34, "bytes"), v30 >> 2, v31 >> 2);

  }
  else
  {
    v19 = v9;
    v20 = 4 * v9;
    memptr = 0;
    v44 = 0;
    if ((v20 | 3) > 0x7D0)
    {
      v23 = malloc_type_posix_memalign(&memptr, 8uLL, v20, 0xC0947BEFuLL);
      LOBYTE(v44) = 0;
      if ((_DWORD)v23)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v39);
      }
      v22 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](v16);
      v22 = (char *)&v42[-1] - ((v21 + 15) & 0x7FFFFFFF0);
      bzero(v22, v21);
      memptr = v22;
      LOBYTE(v44) = 1;
    }
    v24 = v44;
    memptr = 0;
    v44 = 0;
    if ((v18 | 3) > 0x7D0)
    {
      v38 = malloc_type_posix_memalign(&memptr, 8uLL, v18, 0xDA2A97C6uLL);
      LOBYTE(v44) = 0;
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v40);
      }
      v26 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](v23);
      v26 = (char *)&v42[-1] - ((v25 + 15) & 0x7FFFFFFF0);
      bzero(v26, v25);
      memptr = v26;
      LOBYTE(v44) = 1;
    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __46___PASLevenshtein_distanceBetweenStrings_and___block_invoke;
    v42[3] = &__block_descriptor_64_e5_v8__0l;
    v42[4] = v22;
    v42[5] = v24;
    v42[6] = v26;
    v42[7] = v44;
    v27 = (void (**)(_QWORD))MEMORY[0x1A1AFDE78](v42);
    memptr = 0;
    v41 = 0;
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v22, v20, &memptr, 2348810496, 0, 0, v19, 0);
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v8, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v26, v18, &v41, 2348810496, 0, 0, v17, 0);
    v12 = levenshtein<unsigned int>((uint64_t)v22, (uint64_t)v26, (unint64_t)memptr >> 2, v41 >> 2);
    if (v27)
      v27[2](v27);

  }
LABEL_30:

  return v12;
}

@end
