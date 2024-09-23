@implementation _PASLPReaderBinaryPlist

- (id)rootObjectWithErrMsg:(id *)a3
{
  uint64_t v4;
  BOOL v5;
  id v6;
  id v8;

  v4 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, self->_topObjectRecord);
  if (v4 == -1)
    __assert_rtn("-[_PASLPReaderBinaryPlist rootObjectWithErrMsg:]", "_PASLPReaderBinaryPlist.m", 323, "offset != UINT64_MAX");
  v8 = 0;
  if (-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v4, &v8, 0, -1, 0))
  {
    v5 = v8 == 0;
  }
  else
  {
    v5 = 1;
  }
  if (v5)
    __assert_rtn("-[_PASLPReaderBinaryPlist rootObjectWithErrMsg:]", "_PASLPReaderBinaryPlist.m", 330, "success && decoded");
  v6 = v8;

  return v6;
}

- (uint64_t)_validateCollectionMembers:(int)a3 validationDepth:(uint64_t)a4 count:
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  uint64_t result;

  if (!a3)
    return 0;
  if (!a4)
    return 1;
  v7 = 0;
  while (1)
  {
    v8 = *(unsigned __int8 *)(a1 + 49);
    if (*(_BYTE *)(a1 + 49))
    {
      v9 = 0;
      v10 = (unsigned __int8 *)(a2 + v7 * v8);
      do
      {
        v11 = *v10++;
        v9 = v11 | (v9 << 8);
        --v8;
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    if (*(_QWORD *)(a1 + 40) <= v9)
      break;
    v12 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 48))
    {
      v13 = 0;
      v14 = (unsigned __int8 *)(*(_QWORD *)(a1 + 56) + v9 * v12);
      do
      {
        v15 = *v14++;
        v13 = v15 | (v13 << 8);
        --v12;
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }
    if (v13 >= *(_QWORD *)(a1 + 24))
      break;
    result = -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](a1);
    if (!result)
      return result;
    if (++v7 == a4)
      return 1;
  }
  return 0;
}

- (uint64_t)_decodeUnsignedIntegerValue:(_QWORD *)a3 usingCursor:
{
  _BYTE *v3;
  unint64_t *v4;
  unsigned int v5;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  unint64_t v12;
  unsigned int v13;

  v3 = (_BYTE *)*a3;
  v4 = (unint64_t *)(*a3 + 1);
  if ((*(_BYTE *)*a3 & 0xF0) != 0x10)
    return 0;
  v5 = *(_BYTE *)*a3 & 0xF;
  if (v5 > 4)
    return 0;
  result = 0;
  v8 = *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 16);
  v9 = 1 << v5;
  v10 = (char *)v4 + (1 << v5);
  v11 = __CFADD__(v4, 1 << v5);
  if ((unint64_t)v10 < v8 && !v11)
  {
    if (*a3 == -1)
      return 0;
    if (v5 > 3)
    {
      v12 = bswap64(*v4);
    }
    else
    {
      v12 = 0;
      do
      {
        v13 = *(unsigned __int8 *)v4;
        v4 = (unint64_t *)((char *)v4 + 1);
        v12 = v13 | (v12 << 8);
        --v9;
      }
      while (v9);
      if (v5 == 3 && (v12 & 0x8000000000000000) != 0)
        return 0;
    }
    *a2 = v12;
    *a3 = v10;
    return v10 - v3;
  }
  return result;
}

- (uint64_t)_offsetForRecord:(uint64_t)result
{
  uint64_t v2;
  unint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;

  if (result)
  {
    if (*(_QWORD *)(result + 40) <= a2)
    {
      return -1;
    }
    else
    {
      v2 = *(unsigned __int8 *)(result + 48);
      if (*(_BYTE *)(result + 48))
      {
        v3 = 0;
        v4 = (unsigned __int8 *)(*(_QWORD *)(result + 56) + v2 * a2);
        do
        {
          v5 = *v4++;
          v3 = v5 | (v3 << 8);
          --v2;
        }
        while (v2);
      }
      else
      {
        v3 = 0;
      }
      if (v3 >= *(_QWORD *)(result + 24))
        return -1;
      else
        return v3;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingData, 0);
}

- (_PASLPReaderBinaryPlist)initWithData:(id)a3 sourcedFromPath:(id)a4 needsValidation:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  _PASLPReaderBinaryPlist *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFAllocatorRef v19;
  id v20;
  unint64_t v21;
  void *v22;
  _PASLPReaderBinaryPlist *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  objc_super v57;
  CFAllocatorContext context;
  uint64_t v59;

  v7 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

LABEL_3:
  v57.receiver = self;
  v57.super_class = (Class)_PASLPReaderBinaryPlist;
  v15 = -[_PASLPReaderBinaryPlist init](&v57, sel_init);
  v16 = (uint64_t)v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_backingData, a3);
    v17 = objc_msgSend(*(id *)(v16 + 8), "bytes");
    v18 = objc_msgSend(*(id *)(v16 + 8), "length");
    *(_QWORD *)(v16 + 16) = v17;
    *(_QWORD *)(v16 + 24) = v18;
    context.version = 0;
    context.info = v12;
    memset(&context.retain, 0, 24);
    context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing;
    context.reallocate = 0;
    context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateReleaseInfo;
    context.preferredSize = 0;
    v19 = CFAllocatorCreate(0, &context);
    *(_QWORD *)(v16 + 64) = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("_PASLPReaderBinaryPlist.m"), 205, CFSTR("Failed to create _releaseReaderDeallocator"));

    }
    v20 = v14;
    v21 = *(_QWORD *)(v16 + 24);
    if (v21 <= 7)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("file \"%@\" not long enough for bplist header"), v20);
LABEL_11:
      v24 = v22;
      corruptionError(v20, v22);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (v21 <= 0x1F)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("file \"%@\" not long enough for bplist trailer"), v20);
      goto LABEL_11;
    }
    v26 = *(_QWORD *)(v16 + 16);
    if (*(_DWORD *)v26 != 1768714338 || *(_WORD *)(v26 + 4) != 29811)
    {
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("file \"%@\" is missing \"bplist\" magic"), v20);
      v28 = v20;
      v29 = (void *)objc_opt_new();
      v30 = v29;
      if (v24)
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The file is not a bplist archive: %@"), v24);
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CB2D50]);

      }
      else
      {
        objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("The file is not a bplist archive."), *MEMORY[0x1E0CB2D50]);
      }
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2D68]);

      objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CB2AA0]);
      v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v45 = (void *)objc_msgSend(v30, "copy");
      v46 = v44;
      v47 = 8;
LABEL_29:
      v25 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), v47, v45);

      goto LABEL_30;
    }
    if (*(_BYTE *)(v26 + 6) != 48 || (*(_BYTE *)(v26 + 7) & 0xFE) != 0x30)
    {
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because header has unexpected version \"bplist%c%c\"), v20, *(unsigned __int8 *)(v26 + 6), *(unsigned __int8 *)(v26 + 7));
      v42 = (void *)objc_opt_new();
      v30 = v42;
      if (v24)
      {
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported format version: %@"), v24);
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0CB2D50]);

      }
      else
      {
        objc_msgSend(v42, "setObject:forKeyedSubscript:", CFSTR("Unsupported format version."), *MEMORY[0x1E0CB2D50]);
      }
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2D68]);

      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v45 = (void *)objc_msgSend(v30, "copy");
      v46 = v48;
      v47 = 3;
      goto LABEL_29;
    }
    v32 = *(unsigned __int8 *)(v21 + v26 - 26);
    v33 = *(_BYTE *)(v21 + v26 - 25);
    v35 = *(_QWORD *)(v21 + v26 - 24);
    v34 = *(_QWORD *)(v21 + v26 - 16);
    v36 = *(_QWORD *)(v21 + v26 - 8);
    *(_BYTE *)(v16 + 48) = v32;
    *(_BYTE *)(v16 + 49) = v33;
    v37 = bswap64(v35);
    *(_QWORD *)(v16 + 40) = v37;
    v38 = bswap64(v36);
    v39 = __CFADD__(v26, v38);
    v40 = v26 + v38;
    if (v39)
    {
      v41 = CFSTR("mmapBase + indicated offsets table location overflows address space");
    }
    else if (is_mul_ok(v32, v37))
    {
      v50 = v32 * v37;
      v39 = __CFADD__(v40, v50);
      v51 = v40 + v50;
      if (v39)
      {
        v41 = CFSTR("purported last byte of offsets list exceeds address space");
      }
      else if (v51 - v26 <= v21)
      {
        *(_QWORD *)(v16 + 56) = v40;
        v52 = bswap64(v34);
        *(_QWORD *)(v16 + 32) = v52;
        if (v52 <= v37)
        {
          if (v7)
          {
            v55 = -[_PASLPReaderBinaryPlist _offsetForRecord:](v16, v52);
            if (v55 == -1)
            {
              v41 = CFSTR("purported offset of serialized top-level record starts past end of buffer");
              goto LABEL_44;
            }
            if (!-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](v16, v55, 0, 0, 128, 0))
            {
              v41 = CFSTR("A disqualifying issue was found while performing a validation traversal of the bplist's object tree");
              goto LABEL_44;
            }
          }

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            LODWORD(context.version) = 138412290;
            *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v20;
            _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASLazyPlist: Loaded \"%@\", (uint8_t *)&context, 0xCu);
          }
          v23 = (_PASLPReaderBinaryPlist *)(id)v16;
          v25 = 0;
          goto LABEL_33;
        }
        v41 = CFSTR("offsets table is not large enough to contain the record number of the top-level object");
      }
      else
      {
        v41 = CFSTR("purported last byte of offsets list exceeds size of backing store");
      }
    }
    else
    {
      v41 = CFSTR("(size of offset table entry) * (number of offset table entries) overflows UINT64_MAX");
    }
LABEL_44:
    corruptionError(v20, v41);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
LABEL_30:

    if (a6)
    {
      v25 = objc_retainAutorelease(v25);
      v23 = 0;
      *a6 = v25;
    }
    else
    {
      v23 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  v23 = 0;
LABEL_34:

  return v23;
}

- (void)dealloc
{
  __CFAllocator *releaseReaderDeallocator;
  objc_super v4;

  releaseReaderDeallocator = self->_releaseReaderDeallocator;
  if (releaseReaderDeallocator)
    CFRelease(releaseReaderDeallocator);
  v4.receiver = self;
  v4.super_class = (Class)_PASLPReaderBinaryPlist;
  -[_PASLPReaderBinaryPlist dealloc](&v4, sel_dealloc);
}

- (id)objectForKey:(id)a3 usingDictionaryContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t objectRefSize;
  unint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && (v10 = *((_QWORD *)v8 + 2)) != 0)
  {
    v11 = 0;
    v12 = *((_QWORD *)v8 + 1);
    while (1)
    {
      if (self && (objectRefSize = self->_objectRefSize) != 0)
      {
        v14 = 0;
        v15 = (unsigned __int8 *)(v12 + v11 * objectRefSize);
        do
        {
          v16 = *v15++;
          v14 = v16 | (v14 << 8);
          --objectRefSize;
        }
        while (objectRefSize);
      }
      else
      {
        v14 = 0;
      }
      v17 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v14);
      if (v17 == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 953, CFSTR("objectForKey error loading key record, this should have been caught during validation"));

        v17 = -1;
      }
      if (-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v17, 0, v7, -1, 0))
      {
        break;
      }
      if (++v11 == v10)
        goto LABEL_14;
    }
    -[_PASLPReaderBinaryPlist objectAtIndex:usingDictionaryContext:](self, "objectAtIndex:usingDictionaryContext:", v11, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_14:
    v18 = 0;
  }

  return v18;
}

- (id)keyAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  uint64_t v7;
  uint64_t objectRefSize;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  id v20;

  if (self && (!a4 ? (v7 = 0) : (v7 = *((_QWORD *)a4 + 1)), (objectRefSize = self->_objectRefSize) != 0))
  {
    v9 = 0;
    v10 = (unsigned __int8 *)(v7 + objectRefSize * a3);
    do
    {
      v11 = *v10++;
      v9 = v11 | (v9 << 8);
      --objectRefSize;
    }
    while (objectRefSize);
  }
  else
  {
    v9 = 0;
  }
  v12 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v9);
  v13 = v12;
  if (v12 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 970, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offset != UINT64_MAX"));

    v14 = -1;
  }
  else
  {
    v14 = v12;
  }
  v20 = 0;
  -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v14, &v20, 0, -1, 0);
  v15 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 974, CFSTR("Unexpected validation failure (index=%tu, offset=%llu)"), a3, v13);

    v15 = v20;
  }
  v16 = v15;

  return v16;
}

- (id)objectAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t objectRefSize;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v21;
  void *v22;
  id v23;

  v7 = a4;
  v8 = v7;
  if (self
    && (!v7 ? (v9 = 0, v10 = 0) : (v10 = *((_QWORD *)v7 + 1), v9 = *((_QWORD *)v7 + 2)),
        (objectRefSize = self->_objectRefSize) != 0))
  {
    v12 = 0;
    v13 = (unsigned __int8 *)(v10 + (v9 + a3) * objectRefSize);
    do
    {
      v14 = *v13++;
      v12 = v14 | (v12 << 8);
      --objectRefSize;
    }
    while (objectRefSize);
  }
  else
  {
    v12 = 0;
  }
  v15 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v12);
  v16 = v15;
  if (v15 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 983, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offset != UINT64_MAX"));

    v17 = -1;
  }
  else
  {
    v17 = v15;
  }
  v23 = 0;
  -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v17, &v23, 0, -1, 0);
  v18 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 987, CFSTR("Unexpected validation failure (index=%tu, offset=%llu)"), a3, v16);

    v18 = v23;
  }
  v19 = v18;

  return v19;
}

- (id)unlazyCopyForDictionaryWithContext:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4[1];
    v5 = v4[2];
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return -[_PASLPReaderBinaryPlist _unlazyCopyForDictionaryWithCount:storage:unlazyCopyCache:]((uint64_t)self, v5, v6, 0);
}

- (id)objectAtIndex:(unint64_t)a3 usingArrayContext:(id)a4
{
  uint64_t v7;
  uint64_t objectRefSize;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  id v20;

  if (self && (!a4 ? (v7 = 0) : (v7 = *((_QWORD *)a4 + 1)), (objectRefSize = self->_objectRefSize) != 0))
  {
    v9 = 0;
    v10 = (unsigned __int8 *)(v7 + objectRefSize * a3);
    do
    {
      v11 = *v10++;
      v9 = v11 | (v9 << 8);
      --objectRefSize;
    }
    while (objectRefSize);
  }
  else
  {
    v9 = 0;
  }
  v12 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v9);
  v13 = v12;
  if (v12 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 1042, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offset != UINT64_MAX"));

    v14 = -1;
  }
  else
  {
    v14 = v12;
  }
  v20 = 0;
  -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v14, &v20, 0, -1, 0);
  v15 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderBinaryPlist.m"), 1046, CFSTR("Unexpected validation failure (index=%tu, offset=%llu)"), a3, v13);

    v15 = v20;
  }
  v16 = v15;

  return v16;
}

- (id)unlazyCopyForArrayWithContext:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4[1];
    v5 = v4[2];
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return -[_PASLPReaderBinaryPlist _unlazyCopyForArrayWithCount:storage:unlazyCopyCache:]((uint64_t)self, v5, v6, 0);
}

- (id)_unlazyCopyForArrayWithCount:(uint64_t)a3 storage:(void *)a4 unlazyCopyCache:
{
  id v7;
  void *v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  int v21;
  void *v22;
  id v24;
  id v25;
  void *memptr;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (!a1)
  {
    v22 = 0;
    goto LABEL_30;
  }
  if (!v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 0);
    v7 = (id)objc_msgSend(v8, "setCount:", *(_QWORD *)(a1 + 40));
  }
  v9 = (8 * a2) | 7;
  memptr = 0;
  v27 = 0;
  if (v9 > 0x80)
  {
    v21 = malloc_type_posix_memalign(&memptr, 8uLL, 8 * a2, 0x80040B8603338uLL);
    LOBYTE(v27) = 0;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v24);
    }
    v10 = (char *)memptr;
    if (!a2)
      goto LABEL_28;
    goto LABEL_6;
  }
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, (8 * a2) | 7);
  if (a2)
  {
LABEL_6:
    v11 = 0;
    do
    {
      v12 = *(unsigned __int8 *)(a1 + 49);
      if (*(_BYTE *)(a1 + 49))
      {
        v13 = 0;
        v14 = (unsigned __int8 *)(a3 + v11 * v12);
        do
        {
          v15 = *v14++;
          v13 = v15 | (v13 << 8);
          --v12;
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v8, "pointerAtIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      memptr = v16;
      if (!v16)
      {
        if (*(_QWORD *)(a1 + 40) <= v13)
          goto LABEL_25;
        v17 = *(unsigned __int8 *)(a1 + 48);
        if (*(_BYTE *)(a1 + 48))
        {
          v18 = 0;
          v19 = (unsigned __int8 *)(*(_QWORD *)(a1 + 56) + v13 * v17);
          do
          {
            v20 = *v19++;
            v18 = v20 | (v18 << 8);
            --v17;
          }
          while (v17);
        }
        else
        {
          v18 = 0;
        }
        if (v18 >= *(_QWORD *)(a1 + 24))
        {
LABEL_25:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__unlazyCopyForArrayWithCount_storage_unlazyCopyCache_, a1, CFSTR("_PASLPReaderBinaryPlist.m"), 1067, CFSTR("_unlazyCopyForArray error loading array member, this should have been caught during validation"));

        }
        -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](a1);
        if (!memptr)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__unlazyCopyForArrayWithCount_storage_unlazyCopyCache_, a1, CFSTR("_PASLPReaderBinaryPlist.m"), 1073, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("member"));

        }
        objc_msgSend(v8, "replacePointerAtIndex:withPointer:", v13);
        v16 = memptr;
      }
      *(_QWORD *)&v10[8 * v11] = v16;

      ++v11;
    }
    while (v11 != a2);
  }
LABEL_28:
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v10, a2);
  if (v9 > 0x80)
    free(v10);
LABEL_30:

  return v22;
}

- (char)_decodeOffset:(id *)a3 decodedObject:(void *)a4 ifEqualToReferenceObject:(int)a5 validationDepth:(void *)a6 unlazyCopyCache:
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t *v18;
  char *v19;
  unsigned int v20;
  int v21;
  id v22;
  id v23;
  int v24;
  _BYTE *v25;
  BOOL v26;
  CFNumberRef v27;
  unsigned int v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  unsigned int v32;
  const __CFNumber *v33;
  CFNumberRef v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  BOOL v38;
  CFTypeID v39;
  __CFString *v40;
  const void *Length;
  int v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  BOOL v46;
  CFTypeID v47;
  id v48;
  void *v49;
  CFDateRef v50;
  CFDateRef v51;
  CFIndex v52;
  char *v53;
  BOOL v54;
  CFTypeID v55;
  id v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  BOOL v61;
  BOOL v62;
  CFTypeID v63;
  CFTypeRef *v64;
  CFTypeRef v65;
  id v66;
  CFDataRef v67;
  void *v68;
  _PASLPArray *v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  _PASLPArrayContext *v74;
  _PASLPDictionaryContext *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  const __CFString *v79;
  id v80;
  _BYTE v82[4096];
  uint64_t v83;
  char *v84;
  id v85;
  uint64_t v86;
  size_t v87;
  _QWORD v88[6];
  unint64_t valuePtr;
  unint64_t *p_valuePtr;
  uint64_t v91;
  char v92;
  unint64_t v93;
  _QWORD v94[2];

  v94[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (!a1
    || (v14 = *(_QWORD *)(a1 + 16), v86 = a2, v15 = (_BYTE *)(v14 + a2), __CFADD__(v14, a2))
    || ((v16 = *(_QWORD *)(a1 + 24) + v14, (unint64_t)v15 < v16) ? (v17 = v14 == 0) : (v17 = 1),
        v17 || (v18 = (unint64_t *)(v15 + 1), (unint64_t)(v15 + 1) >= v16) || (v94[0] = v15 + 1, !v15)))
  {
LABEL_152:
    v19 = 0;
    goto LABEL_226;
  }
  v19 = 0;
  v20 = *v15;
  v21 = 0;
  switch(v20 >> 4)
  {
    case 0u:
      if (v20 == 9)
      {
        v64 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
      }
      else
      {
        if (v20 != 8)
        {
          if (*v15)
            goto LABEL_152;
          v22 = (id)*MEMORY[0x1E0C9B0D0];
          if (v11)
          {
            if (v22 != v11)
              goto LABEL_152;
          }
          if (a3)
          {
            v23 = *a3;
            *a3 = v22;

            v15 = (_BYTE *)(*(_QWORD *)(a1 + 16) + v86);
          }
          v19 = (char *)((char *)v18 - v15);
          goto LABEL_226;
        }
        v64 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
      }
      v65 = *v64;
      if (v11 && !CFEqual(*v64, v11))
        goto LABEL_152;
      if (a3)
      {
        v66 = *a3;
        *a3 = (id)v65;

      }
      v19 = (char *)v18 - *(_QWORD *)(a1 + 16) - v86;
      goto LABEL_226;
    case 1u:
      v28 = v20 & 0xF;
      if (v28 > 4)
        goto LABEL_152;
      v19 = 0;
      v29 = 1 << v28;
      v25 = (char *)v18 + (1 << v28);
      v30 = __CFADD__(v18, 1 << v28);
      if ((unint64_t)v25 < v16 && !v30)
      {
        if (!((unint64_t)a3 | (unint64_t)v11))
          goto LABEL_94;
        if (v28 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", bswap64(*v18));
          v33 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31 = 0;
          do
          {
            v32 = *(unsigned __int8 *)v18;
            v18 = (unint64_t *)((char *)v18 + 1);
            v31 = v32 | (v31 << 8);
            --v29;
          }
          while (v29);
          valuePtr = v31;
          v33 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
        }
        v34 = v33;
        if (v11 && !CFEqual(v33, v11))
        {
          v19 = 0;
        }
        else
        {
          if (a3)
          {
            if (!v34)
              __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 541, "decoded != nil");
            objc_storeStrong(a3, v34);
          }
          v19 = &v25[-v86 - *(_QWORD *)(a1 + 16)];
        }
        goto LABEL_165;
      }
      goto LABEL_226;
    case 2u:
      v24 = v20 & 0xF;
      if ((v24 - 4) < 0xFFFFFFFE)
        goto LABEL_152;
      v19 = 0;
      v25 = (char *)v18 + (1 << v24);
      v26 = __CFADD__(v18, 1 << v24);
      if ((unint64_t)v25 < v16 && !v26)
      {
        if (!((unint64_t)a3 | (unint64_t)v11))
          goto LABEL_94;
        if (v24 == 2)
        {
          LODWORD(valuePtr) = bswap32(*(_DWORD *)v18);
          v27 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
        }
        else
        {
          valuePtr = 0;
          __memcpy_chk();
          v93 = bswap64(0);
          v27 = CFNumberCreate(0, kCFNumberFloat64Type, &v93);
        }
        v34 = v27;
        if (!v27)
          __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 572, "decoded != nil");
        if (v11 && !CFEqual(v27, v11))
        {
          v19 = 0;
        }
        else
        {
          if (a3)
            objc_storeStrong(a3, v34);
          v19 = &v25[-*(_QWORD *)(a1 + 16) - v86];
        }
LABEL_165:

      }
      goto LABEL_226;
    case 3u:
      if (v20 != 51)
        goto LABEL_152;
      v19 = 0;
      v25 = v15 + 9;
      if ((unint64_t)(v15 + 9) < v16 && (unint64_t)v15 < 0xFFFFFFFFFFFFFFF7)
      {
        if ((unint64_t)a3 | (unint64_t)v11)
        {
          v50 = CFDateCreate(0, COERCE_CFABSOLUTETIME(bswap64(*v18)));
          if (!v50)
            __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 600, "decoded");
          v51 = v50;
          if (v11 && !CFEqual(v50, v11))
          {
            v19 = 0;
          }
          else
          {
            if (a3)
              objc_storeStrong(a3, v51);
            v19 = &v25[-*(_QWORD *)(a1 + 16) - v86];
          }

        }
        else
        {
LABEL_94:
          v19 = (char *)(v25 - v15);
        }
      }
      goto LABEL_226;
    case 4u:
      v52 = v20 & 0xF;
      v93 = v52;
      v85 = v12;
      if ((v20 & 0xF) == 0xF)
      {
        if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &v93, v94))
          goto LABEL_141;
        v52 = v93;
        v18 = (unint64_t *)v94[0];
      }
      v19 = 0;
      v53 = (char *)v18 + v52;
      v54 = __CFADD__(v18, v52);
      if ((unint64_t)v53 >= v16 || v54)
        goto LABEL_225;
      v94[0] = (char *)v18 + v52;
      if (!v18)
        goto LABEL_141;
      if (!((unint64_t)a3 | (unint64_t)v11))
      {
        v19 = (char *)(v53 - v15);
        goto LABEL_225;
      }
      if (!v11)
      {
        if (!v52)
        {
          v67 = (CFDataRef)&unk_1EE5A9FD0;
          v70 = &unk_1EE5A9FD0;
          goto LABEL_177;
        }
LABEL_161:
        CFRetain(*(CFTypeRef *)(a1 + 8));
        v67 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v18, v52, *(CFAllocatorRef *)(a1 + 64));
        if (!v67)
        {
          CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 64), v18);
          if (a3)
            __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 665, "decoded");
          v67 = 0;
LABEL_179:
          v71 = *(_QWORD *)(a1 + 16);

          v19 = &v53[-v71 - v86];
          goto LABEL_225;
        }
LABEL_177:
        if (a3)
          objc_storeStrong(a3, v67);
        goto LABEL_179;
      }
      v55 = CFGetTypeID(v11);
      if (v55 != CFDataGetTypeID())
        goto LABEL_141;
      v56 = v11;
      if (CFDataGetLength((CFDataRef)v56) == v52)
      {
        if (v52)
        {
          valuePtr = 0;
          p_valuePtr = &valuePtr;
          v91 = 0x2020000000;
          v92 = 1;
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __112___PASLPReaderBinaryPlist__decodeOffset_decodedObject_ifEqualToReferenceObject_validationDepth_unlazyCopyCache___block_invoke;
          v88[3] = &unk_1E442F0E0;
          v88[4] = &valuePtr;
          v88[5] = v18;
          objc_msgSend(v56, "enumerateByteRangesUsingBlock:", v88);
          v19 = 0;
          v57 = *((_BYTE *)p_valuePtr + 24) == 0;
          if (!a3 && *((_BYTE *)p_valuePtr + 24))
          {
            v19 = &v53[-*(_QWORD *)(a1 + 16) - v86];
            v57 = 1;
          }
          _Block_object_dispose(&valuePtr, 8);

          if (!v57)
            goto LABEL_161;
          goto LABEL_225;
        }
        if (a3)
          objc_storeStrong(a3, &unk_1EE5A9FD0);
        v19 = &v53[-*(_QWORD *)(a1 + 16) - v86];
      }
      else
      {
        v19 = 0;
      }

      goto LABEL_225;
    case 5u:
      v21 = 1;
      goto LABEL_45;
    case 6u:
LABEL_45:
      v35 = v20 & 0xF;
      v93 = v35;
      v85 = v12;
      if ((v20 & 0xF) != 0xF)
        goto LABEL_48;
      if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &v93, v94))
        goto LABEL_141;
      v35 = v93;
      v18 = (unint64_t *)v94[0];
LABEL_48:
      v19 = 0;
      v36 = v35 << (v21 ^ 1u);
      v37 = (char *)v18 + v36;
      v38 = __CFADD__(v18, v36);
      if ((unint64_t)v37 >= v16 || v38)
        goto LABEL_225;
      if (!v18)
      {
LABEL_141:
        v19 = 0;
        goto LABEL_225;
      }
      if (!((unint64_t)a3 | (unint64_t)v11))
      {
        v19 = (char *)(v37 - v15);
        goto LABEL_225;
      }
      v84 = v37;
      if (!v11)
        goto LABEL_211;
      v39 = CFGetTypeID(v11);
      if (v39 != CFStringGetTypeID())
      {
        v40 = 0;
        goto LABEL_144;
      }
      v40 = (__CFString *)v11;
      Length = (const void *)CFStringGetLength(v40);
      if (Length != (const void *)v35)
        goto LABEL_144;
      if (v35)
      {
        if (v21)
        {
          Length = (const void *)-[__CFString _fastCStringContents:](v40, "_fastCStringContents:", 0);
          if (Length)
          {
            v42 = memcmp(Length, v18, v35);
            if (a3 || v42)
            {
              if (!v42)
              {
                if (!a3)
                  goto LABEL_223;
                goto LABEL_213;
              }
LABEL_144:
              v19 = 0;
              goto LABEL_224;
            }
LABEL_182:
            v19 = &v84[-*(_QWORD *)(a1 + 16) - v86];
LABEL_224:

LABEL_225:
            v13 = v85;
            goto LABEL_226;
          }
          v73 = 1;
        }
        else
        {
          v73 = 2415919360;
        }
        v83 = v73;
        MEMORY[0x1E0C80A78](Length);
        bzero(v82, 0x1000uLL);
        valuePtr = 0;
        p_valuePtr = (unint64_t *)v35;
        v76 = v35;
        do
        {
          v77 = valuePtr;
          v87 = 0;
          if (valuePtr)
            v78 = 4096;
          else
            v78 = 64;
          if ((-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v40, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v82, v78, &v87, v83, 0, valuePtr, v76, &valuePtr) & 1) == 0|| memcmp((char *)v18 + (v77 << (v21 ^ 1u)), v82, v87))
          {
            goto LABEL_144;
          }
          v76 = (unint64_t)p_valuePtr;
        }
        while (p_valuePtr);
LABEL_211:
        if (!a3)
          goto LABEL_223;
        if (!v21)
        {
          if (v35 > 0x1F)
            v79 = (const __CFString *)-[_PASBigEndianUTF16String initWithLength:buffer:backingObject:]((id *)[_PASBigEndianUTF16String alloc], (void *)v35, v18, (void *)a1);
          else
            v79 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v18, 2 * v35, 2415919360);
          goto LABEL_221;
        }
LABEL_213:
        if (v35 > 0x1E)
        {
          CFRetain(*(CFTypeRef *)(a1 + 8));
          v79 = CFStringCreateWithBytesNoCopy(0, (const UInt8 *)v18, v35, 0x600u, 0, *(CFAllocatorRef *)(a1 + 64));
          if (v79)
          {
LABEL_222:
            v80 = *a3;
            *a3 = (id)v79;

LABEL_223:
            v19 = &v84[-*(_QWORD *)(a1 + 16) - v86];
            v40 = (__CFString *)v11;
            goto LABEL_224;
          }
          CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 64), v18);
LABEL_219:
          v79 = &stru_1E4431528;
          goto LABEL_222;
        }
        v79 = CFStringCreateWithBytes(0, (const UInt8 *)v18, v35, 0x600u, 0);
LABEL_221:
        if (v79)
          goto LABEL_222;
        goto LABEL_219;
      }
      if (a3)
      {
        v72 = *a3;
        *a3 = &stru_1E4431528;

      }
      goto LABEL_182;
    case 0xAu:
      v43 = v20 & 0xF;
      valuePtr = v43;
      if ((v20 & 0xF) != 0xF)
        goto LABEL_69;
      if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &valuePtr, v94))
        goto LABEL_152;
      v43 = valuePtr;
      v18 = (unint64_t *)v94[0];
LABEL_69:
      v19 = 0;
      v44 = v43 * *(unsigned __int8 *)(a1 + 49);
      v45 = (char *)v18 + v44;
      v46 = __CFADD__(v18, v44);
      if ((unint64_t)v45 >= v16 || v46)
        goto LABEL_226;
      if (!v18
        || (a5 & 0x80000000) == 0
        && !-[_PASLPReaderBinaryPlist _validateCollectionMembers:validationDepth:count:](a1, (uint64_t)v18, (unsigned __int16)a5, v43))
      {
        goto LABEL_152;
      }
      if (!((unint64_t)a3 | (unint64_t)v11))
        goto LABEL_139;
      if (v11)
      {
        v47 = CFGetTypeID(v11);
        if (v47 != CFArrayGetTypeID() || CFArrayGetCount((CFArrayRef)v11) != v43)
          goto LABEL_152;
        if (!v43)
        {
          if (!a3)
            goto LABEL_139;
          v48 = *a3;
          v49 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_138;
        }
      }
      else if (!v43)
      {
        v68 = v13;
        v69 = (_PASLPArray *)MEMORY[0x1E0C9AA60];
        goto LABEL_189;
      }
      if (v13)
      {
        v68 = v13;
        -[_PASLPReaderBinaryPlist _unlazyCopyForArrayWithCount:storage:unlazyCopyCache:](a1, v43, (uint64_t)v18, v13);
        v69 = (_PASLPArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v68 = 0;
        v74 = -[_PASLPArrayContext initWithStorage:count:]([_PASLPArrayContext alloc], "initWithStorage:count:", v18, v43);
        v69 = -[_PASLPArray initWithLazyPlistReader:context:]([_PASLPArray alloc], "initWithLazyPlistReader:context:", a1, v74);

      }
      if (v11 && !-[_PASLPArray isEqualToArray:](v69, "isEqualToArray:", v11))
        goto LABEL_198;
LABEL_189:
      if (!a3)
        goto LABEL_196;
      goto LABEL_195;
    case 0xDu:
      v58 = v20 & 0xF;
      valuePtr = v58;
      if ((v20 & 0xF) != 0xF)
        goto LABEL_117;
      if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &valuePtr, v94))
        goto LABEL_152;
      v58 = valuePtr;
      v18 = (unint64_t *)v94[0];
LABEL_117:
      v19 = 0;
      v59 = v58 * *(unsigned __int8 *)(a1 + 49);
      v60 = (char *)v18 + v59;
      v61 = __CFADD__(v18, v59);
      if ((unint64_t)v60 >= v16 || v61)
        goto LABEL_226;
      if (!v18)
        goto LABEL_152;
      v19 = 0;
      v45 = &v60[v59];
      v62 = __CFADD__(v60, v59);
      if ((unint64_t)v45 >= v16 || v62 || !v60)
        goto LABEL_226;
      if ((a5 & 0x80000000) == 0
        && !-[_PASLPReaderBinaryPlist _validateCollectionMembers:validationDepth:count:](a1, (uint64_t)v18, (unsigned __int16)a5, 2 * v58))
      {
        goto LABEL_152;
      }
      if (!((unint64_t)a3 | (unint64_t)v11))
        goto LABEL_139;
      if (!v11)
      {
        if (!v58)
        {
          v68 = v13;
          v69 = (_PASLPArray *)MEMORY[0x1E0C9AA70];
          goto LABEL_194;
        }
LABEL_173:
        if (v13)
        {
          v68 = v13;
          -[_PASLPReaderBinaryPlist _unlazyCopyForDictionaryWithCount:storage:unlazyCopyCache:](a1, v58, (uint64_t)v18, v13);
          v69 = (_PASLPArray *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v68 = 0;
          v75 = -[_PASLPDictionaryContext initWithStorage:count:]([_PASLPDictionaryContext alloc], "initWithStorage:count:", v18, v58);
          v69 = -[_PASLPDictionary initWithLazyPlistReader:context:]([_PASLPDictionary alloc], "initWithLazyPlistReader:context:", a1, v75);

        }
        if (v11 && !CFEqual(v69, v11))
        {
LABEL_198:
          v19 = 0;
LABEL_197:

          v13 = v68;
          goto LABEL_226;
        }
LABEL_194:
        if (a3)
LABEL_195:
          objc_storeStrong(a3, v69);
LABEL_196:
        v19 = &v45[-*(_QWORD *)(a1 + 16) - v86];
        goto LABEL_197;
      }
      v63 = CFGetTypeID(v11);
      if (v63 != CFDictionaryGetTypeID() || CFDictionaryGetCount((CFDictionaryRef)v11) != v58)
        goto LABEL_152;
      if (v58)
        goto LABEL_173;
      if (a3)
      {
        v48 = *a3;
        v49 = (void *)MEMORY[0x1E0C9AA70];
LABEL_138:
        *a3 = v49;

      }
LABEL_139:
      v19 = &v45[-*(_QWORD *)(a1 + 16) - v86];
LABEL_226:

      return v19;
    default:
      goto LABEL_226;
  }
}

- (id)_unlazyCopyForDictionaryWithCount:(uint64_t)a3 storage:(void *)a4 unlazyCopyCache:
{
  id v7;
  void *v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  int v24;
  id v25;
  id v26;
  void *memptr;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 0);
      v7 = (id)objc_msgSend(v8, "setCount:", *(_QWORD *)(a1 + 40));
    }
    v9 = (16 * a2) | 7;
    memptr = 0;
    v28 = 0;
    if (v9 > 0x80)
    {
      v24 = malloc_type_posix_memalign(&memptr, 8uLL, 16 * a2, 0x80040B8603338uLL);
      LOBYTE(v28) = 0;
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v25);
      }
      v10 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](v7);
      v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, (16 * a2) | 7);
    }
    if (2 * a2)
    {
      v11 = 0;
      do
      {
        v12 = *(unsigned __int8 *)(a1 + 49);
        if (*(_BYTE *)(a1 + 49))
        {
          v13 = 0;
          v14 = (unsigned __int8 *)(a3 + v11 * v12);
          do
          {
            v15 = *v14++;
            v13 = v15 | (v13 << 8);
            --v12;
          }
          while (v12);
        }
        else
        {
          v13 = 0;
        }
        objc_msgSend(v8, "pointerAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        memptr = v16;
        if (!v16)
        {
          if (*(_QWORD *)(a1 + 40) <= v13)
            goto LABEL_25;
          v17 = *(unsigned __int8 *)(a1 + 48);
          if (*(_BYTE *)(a1 + 48))
          {
            v18 = 0;
            v19 = (unsigned __int8 *)(*(_QWORD *)(a1 + 56) + v13 * v17);
            do
            {
              v20 = *v19++;
              v18 = v20 | (v18 << 8);
              --v17;
            }
            while (v17);
          }
          else
          {
            v18 = 0;
          }
          if (v18 >= *(_QWORD *)(a1 + 24))
          {
LABEL_25:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__unlazyCopyForDictionaryWithCount_storage_unlazyCopyCache_, a1, CFSTR("_PASLPReaderBinaryPlist.m"), 1009, CFSTR("_unlazyCopyForDictionary error loading dictionary member, this should have been caught during validation"));

          }
          -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](a1);
          objc_msgSend(v8, "replacePointerAtIndex:withPointer:", v13, memptr);
          v16 = memptr;
          if (!memptr)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__unlazyCopyForDictionaryWithCount_storage_unlazyCopyCache_, a1, CFSTR("_PASLPReaderBinaryPlist.m"), 1017, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("materializedDictionaryMember"));

            v16 = memptr;
          }
        }
        *(_QWORD *)&v10[8 * v11] = v16;

        ++v11;
      }
      while (v11 != 2 * a2);
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", &v10[8 * a2], v10, a2);
    if (v9 > 0x80)
      free(v10);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
