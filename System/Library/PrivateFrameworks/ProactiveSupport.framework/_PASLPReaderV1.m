@implementation _PASLPReaderV1

- (id)objectForKey:(id)a3 usingDictionaryContext:(id)a4
{
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  int *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int *v19;
  unint64_t v20;
  const char *v21;
  int v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *context;
  _QWORD v32[5];
  __int128 buf;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1047, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (v9)
      goto LABEL_3;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1048, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    context = (void *)MEMORY[0x1A1AFDC98]();
LABEL_31:
    v13 = 0;
    goto LABEL_32;
  }
  if (!v8)
    goto LABEL_30;
LABEL_3:
  context = (void *)MEMORY[0x1A1AFDC98]();
  if (!v9[2])
    goto LABEL_31;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  objc_msgSend(v9, "enumerationCache");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v30, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (int *)objc_msgSend(v10, "pointerValue");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: cache hit for object value at 0x%lx", (uint8_t *)&buf, 0xCu);
        if (v12)
          goto LABEL_9;
      }
      else if (v12)
      {
LABEL_9:
        -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1067, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valuePtr"));

      goto LABEL_9;
    }
  }
  v14 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("Rejecting non-Unicode key provided to objectForKey");
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_22;
  }
  v15 = v9[2];
  if (!v15)
  {
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  v16 = (const char *)v14;
  v17 = 0;
  while (1)
  {
    v18 = (v15 + v17) >> 1;
    v19 = (unsigned int *)(v9[1] + 4 * v18);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x2020000000;
    v35 = 0;
    v20 = *v19 | ((unint64_t)((_DWORD)v19 - LODWORD(self->_mappedRegion.mmapBase)) << 32);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __54___PASLPReaderV1_objectForKey_usingDictionaryContext___block_invoke;
    v32[3] = &unk_1E442F458;
    v32[4] = &buf;
    -[_PASLPReaderV1 decodeDictionaryKeyForValue:handleString:]((uint64_t)self, v20, v32);
    v21 = *(const char **)(*((_QWORD *)&buf + 1) + 24);
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1095, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("midCStr"));

      v21 = *(const char **)(*((_QWORD *)&buf + 1) + 24);
    }
    v22 = strcmp(v16, v21);
    if (v22 < 0)
      goto LABEL_18;
    if (!v22)
      break;
    v17 = v18 + 1;
    v18 = v15;
LABEL_18:
    _Block_object_dispose(&buf, 8);
    v15 = v18;
    if (v17 >= v18)
      goto LABEL_22;
  }
  _Block_object_dispose(&buf, 8);
  v23 = v9[2];
  if (v18 >= v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyOfs < context.count"));

    v23 = v9[2];
  }
  -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *(_DWORD *)(v9[1] + 4 * v23 + 4 * v18));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_32:
  objc_autoreleasePoolPop(context);

  return v13;
}

- (void)decodeDictionaryKeyForValue:(void *)a3 handleString:
{
  id v5;
  _PASLazyPlistCorruptException *v6;
  id v7;

  v5 = a3;
  if (a1)
  {
    v7 = 0;
    if ((-[_PASLPReaderV1 _decodeDictionaryKeyValue:errMsg:handleString:](a1, a2, (uint64_t *)&v7, v5) & 1) == 0)
    {
      v6 = [_PASLazyPlistCorruptException alloc];
      objc_exception_throw(-[_PASLazyPlistCorruptException initWithName:reason:userInfo:](v6, "initWithName:reason:userInfo:", CFSTR("_PASLazyPlistCorruptException"), v7, 0));
    }

  }
}

- (uint64_t)_decodeDictionaryKeyValue:(uint64_t *)a3 errMsg:(void *)a4 handleString:
{
  void (**v7)(_QWORD);
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a4;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64___PASLPReaderV1__decodeDictionaryKeyValue_errMsg_handleString___block_invoke;
  v13[3] = &unk_1E442F4D0;
  v13[4] = &v15;
  v13[5] = v14;
  v13[6] = a3;
  v13[7] = a2;
  -[_PASLPReaderV1 _decodeValue:errMsg:handleBoolean:handleTaggedInt:handleBoxedInt:handleTaggedFloat:handleBoxedFloat:handleDate:handleData:handleString:handleDict:handleArray:](a1, a2, (uint64_t)a3, 0, 0, 0, 0, 0, 0, 0, v13, 0, 0);
  if ((v8 & 1) != 0)
  {
    if (v16[3])
    {
      if (v7)
        v7[2](v7);
      v9 = 1;
      goto LABEL_10;
    }
    if (!*a3)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Dictionary key 0x%lx at ofs 0x%lx is not of string type"), a2, HIDWORD(a2));
      v11 = (void *)*a3;
      *a3 = v10;

    }
  }
  v9 = 0;
LABEL_10:
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
LABEL_11:

  return v9;
}

- (void)_decodeValue:(uint64_t)a3 errMsg:(void *)a4 handleBoolean:(void *)a5 handleTaggedInt:(void *)a6 handleBoxedInt:(void *)a7 handleTaggedFloat:(void *)a8 handleBoxedFloat:(void *)a9 handleDate:(void *)a10 handleData:(void *)a11 handleString:(void *)a12 handleDict:(void *)a13 handleArray:
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  a10;
  v23 = a11;
  a12;
  v24 = a13;
  __asm { BR              X10 }
}

- (uint64_t)_validateObjectGraphWithFilename:(int)a3 rootValue:(unint64_t)a4 recursionDepth:(uint64_t)a5 stats:(void *)a6 error:
{
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  void **v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  void **v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v11 = a2;
  v12 = v11;
  if (!a1)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_15;
  }
  v13 = *(_QWORD *)(a5 + 112);
  if (v13 <= a4)
    v13 = a4;
  *(_QWORD *)(a5 + 112) = v13;
  if (a4 >= 0x65)
  {
    if (a6)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("object graph traversal exceeded maximum recursion depth %tu"), 100);
      corruptionError(v12, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *a6;
      *a6 = (void *)v15;

    }
    goto LABEL_7;
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__133;
  v54 = __Block_byref_object_dispose__134;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 1;
  v18 = MEMORY[0x1E0C809B0];
  v44[4] = a5;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke;
  v45[3] = &__block_descriptor_40_e8_v12__0B8l;
  v45[4] = a5;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_2;
  v44[3] = &__block_descriptor_40_e8_v12__0i8l;
  v42[4] = a5;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_3;
  v43[3] = &__block_descriptor_40_e8_v16__0q8l;
  v43[4] = a5;
  v41[4] = a5;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_4;
  v42[3] = &__block_descriptor_40_e8_v12__0f8l;
  v40[4] = a5;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_5;
  v41[3] = &__block_descriptor_40_e8_v16__0d8l;
  v39[4] = a5;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_6;
  v40[3] = &__block_descriptor_40_e8_v16__0d8l;
  v38[4] = a5;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_7;
  v39[3] = &__block_descriptor_40_e13_v24__0r_v8Q16l;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_8;
  v38[3] = &__block_descriptor_40_e15_v28__0r_8Q16B24l;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_9;
  v30[3] = &unk_1E442F480;
  v30[4] = a1;
  v32 = &v50;
  v33 = &v46;
  v34 = a5;
  v35 = sel__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error_;
  v31 = v11;
  v36 = a4;
  v37 = a6;
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_11;
  v24[3] = &unk_1E442F4A8;
  v26 = &v46;
  v27 = a5;
  v24[4] = a1;
  v19 = v31;
  v25 = v19;
  v28 = a4;
  v29 = a6;
  -[_PASLPReaderV1 _decodeValue:errMsg:handleBoolean:handleTaggedInt:handleBoxedInt:handleTaggedFloat:handleBoxedFloat:handleDate:handleData:handleString:handleDict:handleArray:](a1, a3, (uint64_t)&v55, v45, v44, v43, v42, v41, v40, v39, v38, v30, v24);
  if (*((_BYTE *)v47 + 24))
    v17 = v20;
  else
    v17 = 0;
  if ((v17 & 1) == 0 && !*a6)
  {
    corruptionError(v19, (void *)v51[5]);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *a6;
    *a6 = (void *)v21;

  }
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

LABEL_15:
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingData, 0);
}

- (id)objectAtIndex:(unint64_t)a3 usingArrayContext:(id)a4
{
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AFDC98]();
  if (v6)
  {
    if (v6[2] <= a3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index out of range"), 0);
    v8 = v6[1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index out of range"), 0);
    v8 = 0;
  }
  -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *(_DWORD *)(v8 + 4 * a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);

  return v9;
}

- (_PASLPReaderV1)initWithData:(id)a3 sourcedFromPath:(id)a4 needsValidation:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  _PASLPReaderV1 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFAllocatorRef v19;
  void *v20;
  void *v21;
  id v22;
  _PASLPReaderV1 *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unsigned int v37;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v48;
  uint8_t *p_context;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  const char *v60;
  const char *v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, _BYTE *);
  void *v67;
  const __CFString *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  objc_super v73;
  _BYTE buf[32];
  _BYTE v75[32];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 context;
  __int128 context_16;
  __int128 context_32;
  __int128 context_48;
  __int128 context_64;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v7 = a5;
  v88 = *MEMORY[0x1E0C80C00];
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
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

LABEL_3:
  v73.receiver = self;
  v73.super_class = (Class)_PASLPReaderV1;
  v15 = -[_PASLPReaderV1 init](&v73, sel_init);
  v16 = (uint64_t)v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_backingData, a3);
    v17 = objc_msgSend(*(id *)(v16 + 8), "bytes");
    v18 = objc_msgSend(*(id *)(v16 + 8), "length");
    *(_QWORD *)(v16 + 16) = v17;
    *(_QWORD *)(v16 + 24) = v18;
    *(_QWORD *)&context = 0;
    *((_QWORD *)&context + 1) = v12;
    context_16 = 0uLL;
    *(_QWORD *)&context_32 = 0;
    *((_QWORD *)&context_32 + 1) = cfAllocateAlwaysFailing_176;
    *(_QWORD *)&context_48 = 0;
    *((_QWORD *)&context_48 + 1) = cfDeallocateReleaseInfo_177;
    *(_QWORD *)&context_64 = 0;
    v19 = CFAllocatorCreate(0, (CFAllocatorContext *)&context);
    *(_QWORD *)(v16 + 32) = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("_PASLPReaderV1.m"), 493, CFSTR("Failed to create _releaseReaderDeallocator"));

    }
    v72 = 0;
    if (*(_QWORD *)(v16 + 24) <= 0xFuLL)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because it is too small."), v14);
      notPLPlistError(v14, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v72;
      v72 = v21;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(context) = 138412290;
        *(_QWORD *)((char *)&context + 4) = v72;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", (uint8_t *)&context, 0xCu);
        if (!a6)
          goto LABEL_10;
      }
      else if (!a6)
      {
LABEL_10:

        goto LABEL_11;
      }
      *a6 = objc_retainAutorelease(v72);
      goto LABEL_10;
    }
    v24 = *(_QWORD *)(v16 + 16);
    if (v7)
    {
      v25 = v14;
      v26 = v25;
      if (*(_WORD *)v24 != 19536 || *(_BYTE *)(v24 + 2) != 80)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because header has bad magic value"), v25);
        notPLPlistError(v26, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v43 = v72;
        v72 = v29;
        goto LABEL_37;
      }
      if (*(_BYTE *)(v24 + 3) != 1)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because header has unexpected version number (exp %u, act %u)"), v25, 1, *(unsigned __int8 *)(v24 + 3));
        *(_QWORD *)buf = *MEMORY[0x1E0CB2D50];
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The lazy plist file cannot be opened: %@"), v28);
        v41 = *MEMORY[0x1E0CB2D68];
        *(_QWORD *)&context = v40;
        *((_QWORD *)&context + 1) = v28;
        v42 = *MEMORY[0x1E0CB2AA0];
        *(_QWORD *)&buf[8] = v41;
        *(_QWORD *)&buf[16] = v42;
        *(_QWORD *)&context_16 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &context, buf, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 3, v43);
        v45 = v72;
        v72 = v44;

LABEL_37:
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        LODWORD(context) = 138412290;
        *(_QWORD *)((char *)&context + 4) = v72;
        v48 = MEMORY[0x1E0C81028];
        p_context = (uint8_t *)&context;
        goto LABEL_43;
      }
      v37 = *(_DWORD *)(v24 + 4);
      v36 = *(unsigned int *)(v24 + 8);
      if (v37 <= 0xF && v37 != (_DWORD)v36)
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because header has bad string table start 0x%lx"), v25, *(unsigned int *)(v24 + 4));
LABEL_35:
        v28 = v46;
        corruptionError(v26, v46);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      if (v36 < v37 || (v39 = *(_QWORD *)(v16 + 24), v39 < v36))
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because header has bad string table end 0x%lx"), v25, *(unsigned int *)(v24 + 8));
        goto LABEL_35;
      }
      v50 = *(unsigned int *)(v24 + 12);
      if ((v50 & 3) != 0 || v50 + 4 > v39)
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because header has bad root object offset 0x%lx"), v25, *(unsigned int *)(v24 + 12));
        goto LABEL_35;
      }

      v86 = 0u;
      v87 = 0u;
      context_64 = 0u;
      v85 = 0u;
      context_32 = 0u;
      context_48 = 0u;
      context = 0u;
      context_16 = 0u;
      v51 = v72;
      v72 = 0;

      v71 = v26;
      v52 = *(_QWORD *)(v16 + 16);
      v53 = *(unsigned int *)(v52 + 4);
      v54 = *(unsigned int *)(v52 + 8);
      if (v54 > v53)
      {
        if (*(_BYTE *)(v52 + v54 - 1))
        {
          v55 = v71;
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rejecting file \"%@\" because string table is not 0-terminated"), v71);
          corruptionError(v71, v56);
          v57 = v72;
          v72 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v60 = 0;
          v61 = (const char *)(v52 + v53);
          while (1)
          {
            *(_QWORD *)&context = context + 1;
            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v61);
            if (!v56)
            {
              v68 = CFSTR("rejecting file \"%@\" because string table contains non-UTF-8 content");
              goto LABEL_91;
            }
            if (v60 && (strcmp(v60, v61) & 0x80000000) == 0)
              break;
            v62 = (unint64_t)&v61[strlen(v61) + 1];

            v60 = v61;
            v61 = (const char *)v62;
            if (v62 >= *(_QWORD *)(v16 + 16) + (unint64_t)*(unsigned int *)(*(_QWORD *)(v16 + 16) + 8))
              goto LABEL_57;
          }
          v68 = CFSTR("rejecting file \"%@\" because string table contains non-sorted or duplicate entries");
LABEL_91:
          v55 = v71;
          v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v68, v71);
          corruptionError(v71, v57);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v72;
          v72 = v69;

        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v72;
          v48 = MEMORY[0x1E0C81028];
          goto LABEL_94;
        }
        goto LABEL_38;
      }
LABEL_57:

      v63 = v72;
      v72 = 0;

      if ((-[_PASLPReaderV1 _validateObjectGraphWithFilename:rootValue:recursionDepth:stats:error:](v16, v71, *(_DWORD *)(*(unsigned int *)(*(_QWORD *)(v16 + 16) + 12) + *(_QWORD *)(v16 + 16)), 0, (uint64_t)&context, &v72) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v72;
          v48 = MEMORY[0x1E0C81028];
LABEL_94:
          p_context = buf;
LABEL_43:
          _os_log_error_impl(&dword_1A0957000, v48, OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", p_context, 0xCu);
        }
LABEL_38:
        if (a6)
        {
          v23 = 0;
          *a6 = objc_retainAutorelease(v72);
          goto LABEL_40;
        }
LABEL_11:
        v23 = 0;
LABEL_40:

        goto LABEL_41;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v71;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Successfully traversed object graph for lazy plist \"%@\".  Object statistics:", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = *((_QWORD *)&context + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boolean:        %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = context_16;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged integer: %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = *((_QWORD *)&context_16 + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed integer:  %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = context_32;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged real:    %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = *((_QWORD *)&context_32 + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed real:     %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = context_48;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Date:           %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = *((_QWORD *)&context_48 + 1);
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = context;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: String:         %tu (%tu unique dictionary keys)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = context_64;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = *((_QWORD *)&context_64 + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Data:           %tu (%tu total bytes)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v86;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = *((_QWORD *)&v86 + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Dictionary:     %tu (%tu total key/value mappings)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = *((_QWORD *)&v85 + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Array:          %tu (%tu total elements)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v87;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Object graph maximum depth: %tu", buf, 0xCu);
      }
      v64 = *((_QWORD *)&v87 + 1);
      if (*((_QWORD *)&v87 + 1) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v86
                            + v85
                            + context_64
                            + *((_QWORD *)&context_48 + 1)
                            + context_48
                            + *((_QWORD *)&context_32 + 1)
                            + *((_QWORD *)&context_16 + 1);
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed allocations: %tu (referenced by %tu total pointers)", buf, 0x16u);
      }
      +[_PASLazyPlist deserializationStatsHandler](_PASLazyPlist, "deserializationStatsHandler");
      v65 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v65;
      if (v65)
      {
        v66 = *(void (**)(uint64_t, _BYTE *))(v65 + 16);
        v76 = context_64;
        v77 = v85;
        v78 = v86;
        v79 = v87;
        *(_OWORD *)buf = context;
        *(_OWORD *)&buf[16] = context_16;
        *(_OWORD *)v75 = context_32;
        *(_OWORD *)&v75[16] = context_48;
        v66(v65, buf);
      }
    }
    else
    {
      v86 = 0u;
      v87 = 0u;
      context_64 = 0u;
      v85 = 0u;
      context_32 = 0u;
      context_48 = 0u;
      context = 0u;
      context_16 = 0u;
      v30 = 0;
      v72 = 0;
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v31 = *(_QWORD *)(v16 + 16);
      v32 = *(_QWORD *)(v16 + 24);
      v33 = *(unsigned int *)(v24 + 4);
      v34 = *(unsigned int *)(v24 + 8);
      v35 = *(unsigned int *)(v24 + 12);
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v32;
      *(_WORD *)v75 = 2048;
      *(_QWORD *)&v75[2] = v33;
      *(_WORD *)&v75[10] = 2048;
      *(_QWORD *)&v75[12] = v34;
      *(_WORD *)&v75[20] = 2048;
      *(_QWORD *)&v75[22] = v35;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASLazyPlist: Loaded \"%@\" (mapping %p, size %zu, string table [0x%lx, 0x%lx), root 0x%lx)", buf, 0x3Eu);
    }
    v23 = (_PASLPReaderV1 *)(id)v16;
    goto LABEL_40;
  }
  v23 = 0;
LABEL_41:

  return v23;
}

- (id)rootObjectWithErrMsg:(id *)a3
{
  return -[_PASLPReaderV1 _objectForValue:errMsg:]((uint64_t)self, *(_DWORD *)((char *)self->_mappedRegion.mmapBase + *((unsigned int *)self->_mappedRegion.mmapBase + 3)), a3);
}

- (id)objectAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7[2];
    if (v9 > a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < context.count"));

  if (!v8)
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_4;
  }
  v9 = v8[2];
LABEL_3:
  v10 = v8[1];
LABEL_4:
  -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *(_DWORD *)(v10 + 4 * v9 + 4 * a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_objectForValue:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  _PASLazyPlistCorruptException *v5;
  id v6;

  if (!a1)
    return 0;
  v6 = 0;
  -[_PASLPReaderV1 _objectForValue:errMsg:](a1, a2, &v6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v5 = [_PASLazyPlistCorruptException alloc];
    objc_exception_throw(-[_PASLazyPlistCorruptException initWithName:reason:userInfo:](v5, "initWithName:reason:userInfo:", CFSTR("_PASLazyPlistCorruptException"), v6, 0));
  }
  v3 = (void *)v2;

  return v3;
}

- (id)_objectForValue:(id *)a3 errMsg:
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[7];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  if (a1)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__133;
    v34 = __Block_byref_object_dispose__134;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__133;
    v28 = __Block_byref_object_dispose__134;
    v29 = 0;
    v6 = *(id *)(a1 + 8);
    v7 = MEMORY[0x1E0C809B0];
    v22[4] = &v30;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke;
    v23[3] = &unk_1E442F4F8;
    v23[4] = &v30;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_2;
    v22[3] = &unk_1E442F520;
    v20[4] = &v30;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_3;
    v21[3] = &unk_1E442F548;
    v21[4] = &v30;
    v19[4] = &v30;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_4;
    v20[3] = &unk_1E442F570;
    v18[4] = &v30;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_5;
    v19[3] = &unk_1E442F598;
    v17 = &v30;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_6;
    v18[3] = &unk_1E442F598;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_7;
    v15[3] = &unk_1E4430720;
    v8 = v6;
    v16 = v8;
    v13[5] = &v30;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_9;
    v14[3] = &unk_1E442F5E8;
    v14[4] = a1;
    v14[5] = &v30;
    v14[6] = &v24;
    v12[5] = &v30;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_10;
    v13[3] = &unk_1E442F610;
    v13[4] = a1;
    v12[1] = 3221225472;
    v12[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_11;
    v12[3] = &unk_1E442F610;
    v12[4] = a1;
    v12[0] = v7;
    -[_PASLPReaderV1 _decodeValue:errMsg:handleBoolean:handleTaggedInt:handleBoxedInt:handleTaggedFloat:handleBoxedFloat:handleDate:handleData:handleString:handleDict:handleArray:](a1, a2, (uint64_t)a3, v23, v22, v21, v20, v19, v18, v15, v14, v13, v12);
    v9 = (void *)v25[5];
    if (v9)
      objc_storeStrong(a3, v9);
    v10 = (id)v31[5];

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)keyAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v7[2] > a3)
    {
LABEL_3:
      v9 = v8[1];
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < context.count"));

  if (v8)
    goto LABEL_3;
  v9 = 0;
LABEL_4:
  v25 = 0;
  v26 = &v25;
  v10 = (unsigned int *)(v9 + 4 * a3);
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52___PASLPReaderV1_keyAtIndex_usingDictionaryContext___block_invoke;
  v23[3] = &unk_1E442F638;
  v23[4] = &v25;
  v23[5] = v24;
  v11 = (void *)MEMORY[0x1A1AFDE78](v23);
  -[_PASLPReaderV1 decodeDictionaryKeyForValue:handleString:]((uint64_t)self, *v10 | ((unint64_t)((_DWORD)v10 - LODWORD(self->_mappedRegion.mmapBase)) << 32), v11);
  v12 = (char *)v26[3];
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderV1.m"), 1138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyBytes"));

    v12 = (char *)v26[3];
  }
  -[_PASLPReaderV1 _stringForMappedUTF8CString:]((CFTypeRef *)&self->super.isa, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    objc_exception_throw(-[_PASLazyPlistCorruptException initWithName:reason:userInfo:]([_PASLazyPlistCorruptException alloc], "initWithName:reason:userInfo:", CFSTR("_PASLazyPlistCorruptException"), CFSTR("String table contains non-UTF-8 content"), 0));

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  objc_msgSend(v8, "enumerationCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1A1AFDC98]();
    if (v8)
    {
      v16 = v8[1];
      v17 = v8[2];
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v16 + 4 * v17 + 4 * a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v14, "setObject:forKey:", v18, v13);

  }
  return v13;
}

- (CFTypeRef)_stringForMappedUTF8CString:(CFTypeRef *)a1
{
  CFTypeRef *v3;

  if (a1)
  {
    v3 = a1;
    CFRetain(a1[1]);
    a1 = (CFTypeRef *)CFStringCreateWithCStringNoCopy(0, a2, 0x8000100u, (CFAllocatorRef)v3[4]);
    if (!a1)
    {
      CFAllocatorDeallocate((CFAllocatorRef)v3[4], a2);
      a1 = 0;
    }
  }
  return a1;
}

- (void)dealloc
{
  __CFAllocator *releaseReaderDeallocator;
  objc_super v4;

  releaseReaderDeallocator = self->_releaseReaderDeallocator;
  if (releaseReaderDeallocator)
    CFRelease(releaseReaderDeallocator);
  v4.receiver = self;
  v4.super_class = (Class)_PASLPReaderV1;
  -[_PASLPReaderV1 dealloc](&v4, sel_dealloc);
}

@end
