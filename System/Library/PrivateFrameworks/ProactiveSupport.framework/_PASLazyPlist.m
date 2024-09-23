@implementation _PASLazyPlist

+ (id)dictionaryWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a1, "propertyListWithPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v9 = v6;
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2AA0]);

      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v10, "copy");
      v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 5, v12);

      v8 = 0;
      *a4 = v13;
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (id)propertyListWithPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _PASLPReaderV1 *v12;
  id *v13;
  void **v14;
  __CFString *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  _PASLPReaderV1 *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLazyPlist.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  v34 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, &v34);
  v10 = v34;
  v11 = v10;
  if (!v9)
  {
    if (v10)
    {
      objc_msgSend(v10, "localizedDescription");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("Unable to open the file.");
    }
    fileAccessError(v7, v15);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  v33 = 0;
  if ((objc_msgSend(a1, "isLazyPlistLikelyContainedInData:format:", v9, &v33) & 1) == 0)
  {
    v16 = v7;
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("The file is not a lazy plist archive."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2D68]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB2AA0]);

    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = (void *)objc_msgSend(v17, "copy");
    v20 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 2, v19);

    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_27:
      v24 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    v21 = MEMORY[0x1E0C81028];
LABEL_17:
    _os_log_error_impl(&dword_1A0957000, v21, OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    goto LABEL_27;
  }
  if (v33 != 2)
  {
    if (v33 == 1)
    {
      v12 = [_PASLPReaderV1 alloc];
      v32 = v11;
      v13 = &v32;
      v14 = &v32;
      goto LABEL_20;
    }
LABEL_24:
    v20 = v11;
LABEL_25:
    if (v20)
      goto LABEL_27;
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v27 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("Unsupported format version %tu"), v33);
    wrongVersionError(v27);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  v22 = (void *)objc_opt_self();
  if (!objc_msgSend(v22, "isSubclassOfClass:", objc_opt_class()))
    goto LABEL_24;
  v12 = [_PASLPReaderBinaryPlist alloc];
  v31 = v11;
  v13 = &v31;
  v14 = &v31;
LABEL_20:
  v23 = -[_PASLPReaderV1 initWithData:sourcedFromPath:needsValidation:error:](v12, "initWithData:sourcedFromPath:needsValidation:error:", v9, v7, 1, v14);
  v20 = *v13;

  if (!v23)
    goto LABEL_25;
  v30 = 0;
  -[_PASLPReaderV1 rootObjectWithErrMsg:](v23, "rootObjectWithErrMsg:", &v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    corruptionError(v7, v30);
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v25;
  }

LABEL_28:
  objc_autoreleasePoolPop(v8);
  if (a4)
    *a4 = objc_retainAutorelease(v20);

  return v24;
}

+ (BOOL)isLazyPlistLikelyContainedInData:(id)a3 format:(unint64_t *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  void *v14;
  __int128 v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLazyPlist.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  v9 = (void *)objc_opt_self();
  if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class())
    && (unint64_t)objc_msgSend(v7, "length") >= 6
    && ((v10 = objc_msgSend(objc_retainAutorelease(v7), "bytes"), *(_DWORD *)v10 == 1768714338)
      ? (v11 = *(unsigned __int16 *)(v10 + 4) == 29811)
      : (v11 = 0),
        v11))
  {
    if (a4)
      *a4 = 2;
    v12 = 1;
  }
  else if ((unint64_t)objc_msgSend(v7, "length") >= 0x10)
  {
    v15 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v12 = ((unsigned __int16)v15 ^ 0x4C50 | BYTE2(v15) ^ 0x50) == 0;
    if (a4 && !((unsigned __int16)v15 ^ 0x4C50 | BYTE2(v15) ^ 0x50))
      *a4 = BYTE3(v15);
  }
  else
  {
    v12 = 0;
  }
  objc_autoreleasePoolPop(v8);

  return v12;
}

+ (id)deserializationStatsHandler
{
  void *v2;
  void *v3;

  pthread_mutex_lock(&_statsHandlerLock);
  v2 = (void *)MEMORY[0x1A1AFDE78](_deserializationStatsHandler);
  pthread_mutex_unlock(&_statsHandlerLock);
  v3 = (void *)MEMORY[0x1A1AFDE78](v2);

  return v3;
}

+ (id)propertyListWithData:(id)a3 error:(id *)a4
{
  return +[_PASLazyPlist propertyListWithData:needsValidation:error:]((uint64_t)a1, a3, 1, a4);
}

+ (id)propertyListWithPath:(id)a3 fileRange:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  _PASLPReaderBinaryPlist *v18;
  id *v19;
  void **v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  _PASLPReaderBinaryPlist *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  length = a4.length;
  location = a4.location;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLazyPlist.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v11 = (void *)MEMORY[0x1A1AFDC98]();
  v38 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v10, 1, &v38);
  v13 = v38;
  v14 = v13;
  if (!v12)
  {
    if (v13)
    {
      objc_msgSend(v13, "localizedDescription");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = CFSTR("Unable to open the file.");
    }
    fileAccessError(v10, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (location + length > objc_msgSend(v12, "length"))
  {
    fileAccessError(v10, CFSTR("Specified file range exceeds actual file length."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }

LABEL_22:
    v25 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v12, "subdataWithRange:", location, length);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  if ((objc_msgSend(a1, "isLazyPlistLikelyContainedInData:format:", v17, &v37) & 1) == 0)
  {
    v21 = v10;
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("The file is not a lazy plist archive."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2D68]);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2AA0]);

    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = (void *)objc_msgSend(v22, "copy");
    v15 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 2, v24);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }

    goto LABEL_22;
  }
  if (v37 == 2)
  {
    v27 = (void *)objc_opt_self();
    if (!objc_msgSend(v27, "isSubclassOfClass:", objc_opt_class()))
      goto LABEL_33;
    v18 = [_PASLPReaderBinaryPlist alloc];
    v35 = v14;
    v19 = &v35;
    v20 = &v35;
  }
  else
  {
    if (v37 != 1)
      goto LABEL_33;
    v18 = [_PASLPReaderV1 alloc];
    v36 = v14;
    v19 = &v36;
    v20 = &v36;
  }
  v28 = -[_PASLPReaderBinaryPlist initWithData:sourcedFromPath:needsValidation:error:](v18, "initWithData:sourcedFromPath:needsValidation:error:", v17, v10, 1, v20);
  v29 = *v19;

  if (!v28)
  {
    v14 = v29;
LABEL_33:
    if (!v14)
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      v32 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("Unsupported format version %tu"), v37);
      wrongVersionError(v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v14;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
      }
    }
    v25 = 0;
    goto LABEL_37;
  }
  v34 = 0;
  -[_PASLPReaderBinaryPlist rootObjectWithErrMsg:](v28, "rootObjectWithErrMsg:", &v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    corruptionError(v10, v34);
    v30 = objc_claimAutoreleasedReturnValue();

    v29 = (id)v30;
  }

  v14 = v29;
LABEL_37:

  v15 = v14;
LABEL_23:
  objc_autoreleasePoolPop(v11);
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v25;
}

+ (id)dictionaryWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "propertyListWithData:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<NSData buffer %p>"), objc_msgSend(objc_retainAutorelease(v6), "bytes"));
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D68]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2AA0]);

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v9, "copy");
    v12 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 5, v11);

    *a4 = v12;
LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  a4 = v7;
LABEL_7:

  return a4;
}

+ (id)arrayWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a1, "propertyListWithPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v9 = v6;
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2AA0]);

      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v10, "copy");
      v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 5, v12);

      v8 = 0;
      *a4 = v13;
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (id)arrayWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "propertyListWithData:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<NSData buffer %p>"), objc_msgSend(objc_retainAutorelease(v6), "bytes"));
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive root object has unexpected type."), *MEMORY[0x1E0CB2D68]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2AA0]);

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v9, "copy");
    v12 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 5, v11);

    *a4 = v12;
LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  a4 = v7;
LABEL_7:

  return a4;
}

+ (id)dataWithPropertyList:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t DeepCopy;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      +[_PASLPWriterV1 dataWithPropertyList:error:](_PASLPWriterV1, "dataWithPropertyList:error:", v8, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  v10 = (void *)objc_opt_self();
  if (!objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()))
  {
LABEL_11:
    if (a5)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("version code %tu is unsupported"), a4);
      wrongVersionError(v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
    goto LABEL_24;
  }
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v23);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  v13 = v12;
  if (v11 && !v12)
  {
    v22 = 0;
    v14 = +[_PASLazyPlist propertyListWithData:needsValidation:error:]((uint64_t)a1, v11, 1, &v22);
    v13 = v22;
  }
  if (!v13)
    goto LABEL_21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "_pas_unlazyArray");
    DeepCopy = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "_pas_unlazyDictionary");
      DeepCopy = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      DeepCopy = (uint64_t)CFPropertyListCreateDeepCopy(0, v8, 0);
    }
  }
  v17 = (void *)DeepCopy;
  if (!DeepCopy)
    goto LABEL_19;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", DeepCopy, 200, 0, &v21);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v21;

  v11 = (id)v18;
  v13 = v19;
  if (v19)
  {
LABEL_19:
    if (a5)
    {
      v13 = objc_retainAutorelease(v13);
      v9 = 0;
      *a5 = v13;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
LABEL_21:
    v11 = v11;
    v13 = 0;
    v9 = v11;
  }

LABEL_24:
  return v9;
}

+ (id)dataWithPropertyList:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "dataWithPropertyList:format:error:", a3, 1, a4);
}

+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 format:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a3;
  v10 = a4;
  if (a5 == 1)
  {
    +[_PASLPWriterV1 fileBackedDataWithPropertyList:writtenToPath:error:](_PASLPWriterV1, "fileBackedDataWithPropertyList:writtenToPath:error:", v9, v10, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("version code %tu is unsupported"), a5);
    wrongVersionError(v11);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "fileBackedDataWithPropertyList:writtenToPath:format:error:", a3, a4, 1, a5);
}

+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 format:(unint64_t)a5 startOfs:(int64_t *)a6 error:(id *)a7
{
  uint64_t v10;
  id v11;
  void *v12;

  v10 = *(_QWORD *)&a4;
  v11 = a3;
  if (a5 == 1)
  {
    +[_PASLPWriterV1 fileBackedDataWithPropertyList:appendedToFd:startOfs:error:](_PASLPWriterV1, "fileBackedDataWithPropertyList:appendedToFd:startOfs:error:", v11, v10, a6, a7);
    a7 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a7)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("version code %tu is unsupported"), a5);
    wrongVersionError(v12);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }

  return a7;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 startOfs:(int64_t *)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "fileBackedDataWithPropertyList:appendedToFd:format:startOfs:error:", a3, *(_QWORD *)&a4, 1, a5, a6);
}

+ (BOOL)isLazyPlistLikelyContainedInFileAtPath:(id)a3 format:(unint64_t *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLazyPlist.m"), 458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 1, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v11 = objc_msgSend(a1, "isLazyPlistLikelyContainedInData:format:", v9, a4);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: Unable to load file \"%@\": %@", buf, 0x16u);
    }
    v11 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v11;
}

+ (id)lazyPlistWithPlist:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLazyPlist.m"), 486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

  }
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("_PASLazyPlist-memoryopt.plplist-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  +[_PASFileUtils mkstempWithPrefix:error:](_PASFileUtils, "mkstempWithPrefix:error:", v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v9)
  {
    objc_msgSend(v9, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    unlink((const char *)objc_msgSend(v11, "fileSystemRepresentation"));

    objc_msgSend(a1, "fileBackedDataWithPropertyList:appendedToFd:startOfs:error:", v5, objc_msgSend(v9, "fd"), 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    close(objc_msgSend(v9, "fd"));
    if (v12)
    {
      +[_PASLazyPlist propertyListWithData:needsValidation:error:]((uint64_t)a1, v12, 0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (void *)v13;
      else
        v15 = v5;
      v16 = v15;

    }
    else
    {
      v16 = v5;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: Unable to create tempfile for temporary _PASLazyPlist backing storage: %@", buf, 0xCu);
    }
    v16 = v5;
  }

  objc_autoreleasePoolPop(v6);
  return v16;
}

+ (id)serializationStatsHandler
{
  void *v2;
  void *v3;

  pthread_mutex_lock(&_statsHandlerLock);
  v2 = (void *)MEMORY[0x1A1AFDE78](_serializationStatsHandler);
  pthread_mutex_unlock(&_statsHandlerLock);
  v3 = (void *)MEMORY[0x1A1AFDE78](v2);

  return v3;
}

+ (void)setSerializationStatsHandler:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  pthread_mutex_lock(&_statsHandlerLock);
  v4 = MEMORY[0x1A1AFDE78](v3);

  v5 = (void *)_serializationStatsHandler;
  _serializationStatsHandler = v4;

  pthread_mutex_unlock(&_statsHandlerLock);
}

+ (void)setDeserializationStatsHandler:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  pthread_mutex_lock(&_statsHandlerLock);
  v4 = MEMORY[0x1A1AFDE78](v3);

  v5 = (void *)_deserializationStatsHandler;
  _deserializationStatsHandler = v4;

  pthread_mutex_unlock(&_statsHandlerLock);
}

+ (id)propertyListWithData:(uint64_t)a3 needsValidation:(_QWORD *)a4 error:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _PASLPReaderV1 *v12;
  id *v13;
  uint64_t *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _PASLPReaderV1 *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)objc_opt_self();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel_propertyListWithData_needsValidation_error_, v7, CFSTR("_PASLazyPlist.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = objc_retainAutorelease(v6);
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("<NSData buffer %p>"), objc_msgSend(v10, "bytes"));
  v33 = 0;
  if ((objc_msgSend(v7, "isLazyPlistLikelyContainedInData:format:", v10, &v33) & 1) == 0)
  {
    v15 = v11;
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("The file is not a lazy plist archive."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2D68]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB2AA0]);

    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = (void *)objc_msgSend(v16, "copy");
    v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 2, v18);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v19;
      v20 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  if (v33 != 2)
  {
    if (v33 == 1)
    {
      v12 = [_PASLPReaderV1 alloc];
      v32 = 0;
      v13 = (id *)&v32;
      v14 = &v32;
      goto LABEL_11;
    }
LABEL_16:
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v27 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("Unsupported format version %tu"), v33);
    wrongVersionError(v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v35 = v19;
    v20 = MEMORY[0x1E0C81028];
LABEL_22:
    _os_log_error_impl(&dword_1A0957000, v20, OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    goto LABEL_17;
  }
  v21 = (void *)objc_opt_self();
  if (!objc_msgSend(v21, "isSubclassOfClass:", objc_opt_class()))
    goto LABEL_16;
  v12 = [_PASLPReaderBinaryPlist alloc];
  v31 = 0;
  v13 = (id *)&v31;
  v14 = &v31;
LABEL_11:
  v22 = -[_PASLPReaderV1 initWithData:sourcedFromPath:needsValidation:error:](v12, "initWithData:sourcedFromPath:needsValidation:error:", v10, v11, a3, v14);
  v23 = *v13;
  v19 = v23;
  if (!v22)
  {
    if (!v23)
      goto LABEL_16;
LABEL_17:
    v24 = 0;
    goto LABEL_18;
  }
  v30 = 0;
  -[_PASLPReaderV1 rootObjectWithErrMsg:](v22, "rootObjectWithErrMsg:", &v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    corruptionError(v11, v30);
    v25 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v25;
  }

LABEL_18:
  objc_autoreleasePoolPop(v8);
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  return v24;
}

@end
