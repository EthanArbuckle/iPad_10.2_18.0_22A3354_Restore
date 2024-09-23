@implementation _PASLPWriterV1

+ (id)dataWithPropertyList:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;

  v7 = a3;
  if (v7)
  {
    v14 = 0;
    v8 = (void *)MEMORY[0x1A1AFDC98]();
    v9 = a1;
    v10 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLPWriterV1.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

    v14 = 0;
    v8 = (void *)MEMORY[0x1A1AFDC98]();
    v9 = a1;
    v10 = 0;
  }
  +[_PASLPWriterV1 _mappedDataWithPlist:fd:ofs:error:]((uint64_t)v9, v10, -1, 0, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v14);

  return v11;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  void *v16;
  id v17;
  int *v18;
  char *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLPWriterV1.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLPWriterV1.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

LABEL_3:
  v31 = 0;
  v12 = (void *)MEMORY[0x1A1AFDC98]();
  v13 = objc_retainAutorelease(v11);
  v14 = open((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 1538, 420);
  if (v14 < 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    v18 = __error();
    v19 = strerror(*v18);
    v20 = (id)objc_msgSend(v17, "initWithFormat:", CFSTR("Could not open file: %s (%d)"), v19, *__error());
    v21 = v13;
    v22 = (void *)objc_opt_new();
    v23 = v22;
    if (v20)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The file cannot be opened: %@"), v20);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2D50]);

    }
    else
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("The file cannot be opened."), *MEMORY[0x1E0CB2D50]);
    }
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB2D68]);

    objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2AA0]);
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = (void *)objc_msgSend(v23, "copy");
    v27 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 1, v26);

    v31 = v27;
    v16 = 0;
  }
  else
  {
    v15 = v14;
    +[_PASLPWriterV1 _mappedDataWithPlist:fd:ofs:error:]((uint64_t)a1, v9, v14, 0, &v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    close(v15);
  }
  objc_autoreleasePoolPop(v12);
  if (a5 && !v16)
    *a5 = objc_retainAutorelease(v31);

  return v16;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 startOfs:(int64_t *)a5 error:(id *)a6
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  off_t v22;
  void *v24;
  void *v25;
  stat v26;
  id v27;
  uint8_t buf[4];
  off_t st_size;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (v11)
  {
    if ((a4 & 0x80000000) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLPWriterV1.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

    if ((a4 & 0x80000000) == 0)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASLPWriterV1.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fd >= 0"));

LABEL_3:
  v27 = 0;
  v12 = (void *)MEMORY[0x1A1AFDC98]();
  memset(&v26, 0, sizeof(v26));
  if (fstat(a4, &v26))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0CB2FE0];
    v15 = *__error();
    v30 = *MEMORY[0x1E0CB2D50];
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = __error();
    v18 = strerror(*v17);
    v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("stat() failure: %s (%d)"), v18, *__error());
    v31[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, v20);

    v21 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      st_size = v26.st_size;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASLazyPlist: Appending to fd beginning at file offset %lld", buf, 0xCu);
    }
    v22 = v26.st_size;
    if (a5)
      *a5 = v26.st_size;
    +[_PASLPWriterV1 _mappedDataWithPlist:fd:ofs:error:]((uint64_t)a1, v11, a4, v22, &v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v12);
  if (a6 && !v21)
    *a6 = objc_retainAutorelease(v27);

  return v21;
}

+ (dispatch_data_t)_mappedDataWithPlist:(int)a3 fd:(unint64_t)a4 ofs:(id *)a5 error:
{
  id v8;
  _BOOL4 v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  dispatch_data_t v16;
  off_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  int *v23;
  char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  __CFSet *Mutable;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  size_t v43;
  void *v44;
  __CFSet *v45;
  int v46;
  _DWORD *v47;
  uint64_t v48;
  size_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void (*v53)(uint64_t, _BYTE *);
  void *v54;
  size_t v55;
  int v56;
  id v57;
  uint64_t v58;
  id v59;
  int *v60;
  char *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  int *v69;
  char *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  int *v82;
  char *v83;
  int v84;
  id v85;
  uint64_t v86;
  id v87;
  int *v88;
  char *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  int *v94;
  char *v95;
  int v96;
  int *v97;
  char *v98;
  int v99;
  void *v100;
  void *v101;
  id v102;
  void *context;
  void (**v104)(_QWORD);
  char *buffer;
  uint64_t v106;
  id v107;
  id v108;
  unint64_t v109;
  size_t v110;
  char *v111;
  size_t v112;
  int v113;
  unint64_t v114;
  void **v115;
  void *v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[5];
  _QWORD v125[2];
  CFMutableSetRef theSet;
  char *v127;
  uint8_t *v128;
  _QWORD v129[5];
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  _BYTE value[32];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  uint8_t buf[32];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v117 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", sel__mappedDataWithPlist_fd_ofs_error_, v117, CFSTR("_PASLPWriterV1.m"), 939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

  }
  v113 = a3;
  if (a3 <= -2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", sel__mappedDataWithPlist_fd_ofs_error_, v117, CFSTR("_PASLPWriterV1.m"), 940, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fd >= -1"));

  }
  v114 = a4;
  if ((a4 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", sel__mappedDataWithPlist_fd_ofs_error_, v117, CFSTR("_PASLPWriterV1.m"), 941, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs >= 0"));

  }
  v119 = 0;
  v118 = v8;
  v115 = a5;
  v116 = (void *)objc_opt_new();
  if ((+[_PASLPWriterV1 _scanPlist:recursionDepth:sizeUpperBound:allDictionaryKeys:error:](v117, v8, 0, (uint64_t *)&v119, v116, a5) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
LABEL_81:
    v75 = *v115;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v75;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    goto LABEL_14;
  }
  v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  v10 = v119;
  if (v9)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v119;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASLazyPlist: _mappedDataWithPlist: _PASLazyPlist size over-estimate: %zu bytes", buf, 0xCu);
  }
  if (v10 >> 29)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("The object is too large to serialize as _PASLazyPlist."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2D68]);
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = (void *)objc_msgSend(v11, "copy");
    v14 = objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 7, v13);

    v15 = *v115;
    *v115 = (void *)v14;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_81;
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v18 = a4 / *MEMORY[0x1E0C85AD8] * *MEMORY[0x1E0C85AD8];
  v109 = a4 % *MEMORY[0x1E0C85AD8];
  v110 = v10;
  v112 = v109 + v10;
  if (v113 == -1)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", sel__mappedDataWithPlist_fd_ofs_error_, v117, CFSTR("_PASLPWriterV1.m"), 969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs == 0"));

    }
    v111 = (char *)mmap(0, v112, 3, 4098, -1, v18);
  }
  else
  {
    v19 = v10 + a4;
    if (ftruncate(v113, v10 + a4))
    {
      v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *__error();
      v136 = *MEMORY[0x1E0CB2D50];
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = __error();
      v24 = strerror(*v23);
      v25 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("Failed to ftruncate file to size %zu bytes: %s (%d)"), v19, v24, *__error());
      v137 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v20, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v21, v26);
      v28 = *a5;
      *a5 = (id)v27;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_81;
      goto LABEL_14;
    }
    v111 = (char *)mmap(0, v112, 3, 1, v113, v18);
  }
  if (v111 == (char *)-1)
  {
    v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v67 = *__error();
    v134 = *MEMORY[0x1E0CB2D50];
    v68 = objc_alloc(MEMORY[0x1E0CB3940]);
    v69 = __error();
    v70 = strerror(*v69);
    v71 = (void *)objc_msgSend(v68, "initWithFormat:", CFSTR("Failed to map buffer of size %zu bytes: %s (%d)"), v110, v70, *__error());
    v135 = v71;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v66, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v67, v72);
    v74 = *a5;
    *a5 = (id)v73;

    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    goto LABEL_81;
  }
  v108 = v8;
  v29 = v116;
  v106 = objc_opt_self();
  Mutable = CFSetCreateMutable(0, 0, &bufferDescrCallbacks);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", sel__writePlist_allDictionaryKeys_toBuffer_size_actSize_, v106, CFSTR("_PASLPWriterV1.m"), 857, CFSTR("Failed to allocate buffer set"));

  }
  v31 = MEMORY[0x1E0C809B0];
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke;
  v129[3] = &__block_descriptor_40_e5_v8__0l;
  v129[4] = Mutable;
  v107 = (id)MEMORY[0x1A1AFDE78](v129);
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  memset(buf, 0, sizeof(buf));
  *(_QWORD *)buf = objc_msgSend(v29, "count");
  v125[0] = &v111[v109];
  v125[1] = &v111[v109 + v110];
  theSet = Mutable;
  v127 = &v111[v109];
  buffer = &v111[v109];
  v128 = buf;
  v32 = bumpChecked((uint64_t)v125, 16);
  *(_DWORD *)v32 = 22039632;
  *(_QWORD *)(v32 + 8) = 0;
  *(_DWORD *)(v32 + 4) = 0;
  context = (void *)MEMORY[0x1A1AFDC98]();
  v33 = malloc_type_malloc(8 * objc_msgSend(v29, "count"), 0x50040EE9192B6uLL);
  v34 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v102 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v102);
  }
  v124[0] = v31;
  v124[1] = 3221225472;
  v124[2] = __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke_2;
  v124[3] = &__block_descriptor_40_e5_v8__0l;
  v124[4] = v33;
  v104 = (void (**)(_QWORD))MEMORY[0x1A1AFDE78](v124);
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v35 = v29;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
  if (v36)
  {
    v37 = 0;
    v38 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v121 != v38)
          objc_enumerationMutation(v35);
        v40 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i)), "UTF8String");
        if (!v40)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__writePlist_allDictionaryKeys_toBuffer_size_actSize_, v106, CFSTR("_PASLPWriterV1.m"), 886, CFSTR("dictionary key is not Unicode"));

        }
        v34[v37 + i] = v40;
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
      v37 += i;
    }
    while (v36);
  }

  qsort_b(v34, objc_msgSend(v35, "count"), 8uLL, &__block_literal_global_101);
  v42 = 0;
  *(_DWORD *)(v32 + 4) = (_DWORD)v127 - LODWORD(v125[0]);
  while (v42 < objc_msgSend(v35, "count"))
  {
    v43 = strlen((const char *)v34[v42]) + 1;
    v44 = (void *)bumpChecked((uint64_t)v125, v43);
    memcpy(v44, (const void *)v34[v42], v43);
    *(_QWORD *)value = v44;
    *(_QWORD *)&value[8] = v43 | 0x100000000;
    v45 = theSet;
    ++*((_QWORD *)v128 + 15);
    CFSetAddValue(v45, value);
    ++v42;
  }
  *(_DWORD *)(v32 + 8) = (_DWORD)v127 - LODWORD(v125[0]);
  if (v104)
    v104[2](v104);

  objc_autoreleasePoolPop(context);
  v46 = +[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:](v106, v108, (uint64_t)v125, 0);
  alignChecked(v125, 4uLL);
  v47 = (_DWORD *)bumpChecked((uint64_t)v125, 4);
  *v47 = v46;
  v48 = v125[0];
  *(_DWORD *)(v32 + 12) = (_DWORD)v47 - LODWORD(v125[0]);
  v49 = (size_t)&v127[-v48];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(_QWORD *)&value[4] = v49;
    *(_WORD *)&value[12] = 2048;
    *(_QWORD *)&value[14] = &v111[v109];
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Successfully constructed _PASLazyPlist of size %zu bytes in buffer %p .  Object graph statistics:", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = *(_QWORD *)&buf[8];
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boolean:        %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = *(_QWORD *)&buf[16];
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged integer: %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = *(_QWORD *)&buf[24];
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed integer:  %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = v147;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged real:    %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = *((_QWORD *)&v147 + 1);
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed real:     %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = v148;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Date:           %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(_QWORD *)&value[4] = *((_QWORD *)&v148 + 1);
    *(_WORD *)&value[12] = 2048;
    *(_QWORD *)&value[14] = *(_QWORD *)buf;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: String:         %tu (%tu unique dictionary keys)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(_QWORD *)&value[4] = v149;
    *(_WORD *)&value[12] = 2048;
    *(_QWORD *)&value[14] = *((_QWORD *)&v149 + 1);
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Data:           %tu (%tu total bytes)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(_QWORD *)&value[4] = v151;
    *(_WORD *)&value[12] = 2048;
    *(_QWORD *)&value[14] = *((_QWORD *)&v151 + 1);
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Dictionary:     %tu (%tu total key/value mappings)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(_QWORD *)&value[4] = v150;
    *(_WORD *)&value[12] = 2048;
    *(_QWORD *)&value[14] = *((_QWORD *)&v150 + 1);
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Array:          %tu (%tu total elements)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(_QWORD *)&value[4] = v152;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Object graph maximum depth: %tu", value, 0xCu);
  }
  v50 = *((_QWORD *)&v152 + 1);
  if (*((_QWORD *)&v152 + 1) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(_QWORD *)&value[4] = v50;
    *(_WORD *)&value[12] = 2048;
    *(_QWORD *)&value[14] = v151
                          + v150
                          + v149
                          + *((_QWORD *)&v148 + 1)
                          + v148
                          + *((_QWORD *)&v147 + 1)
                          + *(_QWORD *)&buf[24];
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed allocations: %tu (referenced by %tu total pointers)", value, 0x16u);
  }
  +[_PASLazyPlist serializationStatsHandler](_PASLazyPlist, "serializationStatsHandler");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v51;
  if (v51)
  {
    v53 = *(void (**)(uint64_t, _BYTE *))(v51 + 16);
    v141 = v149;
    v142 = v150;
    v143 = v151;
    v144 = v152;
    *(_OWORD *)value = *(_OWORD *)buf;
    *(_OWORD *)&value[16] = *(_OWORD *)&buf[16];
    v139 = v147;
    v140 = v148;
    v53(v51, value);
  }

  v54 = v107;
  if (v107)
  {
    (*((void (**)(void))v107 + 2))();
    v54 = v107;
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v49;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASLazyPlist: _mappedDataWithPlist: _PASLazyPlist actual size: %zu bytes", buf, 0xCu);
  }
  v55 = v110;
  v56 = v113;
  if (v49 > v110)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", sel__mappedDataWithPlist_fd_ofs_error_, v117, CFSTR("_PASLPWriterV1.m"), 1009, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actSize <= sizeUpperBound"));

    v56 = v113;
    v55 = v110;
    if (v113 < 0)
      goto LABEL_83;
  }
  else if (v113 < 0)
  {
    goto LABEL_83;
  }
  v56 = v113;
  if (msync(v111, v112, 16))
  {
    v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v58 = *__error();
    v132 = *MEMORY[0x1E0CB2D50];
    v59 = objc_alloc(MEMORY[0x1E0CB3940]);
    v60 = __error();
    v61 = strerror(*v60);
    v62 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("Failed to msync file content of size %zu bytes: %s (%d)"), v49, v61, *__error());
    v133 = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v57, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v58, v63);
    v65 = *v115;
    *v115 = (void *)v64;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_97;
    goto LABEL_90;
  }
LABEL_83:
  v81 = (unint64_t)&buffer[v49 - 1 + *MEMORY[0x1E0C85AD8]] / *MEMORY[0x1E0C85AD8] * *MEMORY[0x1E0C85AD8];
  if ((unint64_t)&buffer[v55] > v81)
  {
    v56 = v113;
    if (munmap((void *)v81, (size_t)&buffer[v55 - v81]))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v82 = __error();
        v83 = strerror(*v82);
        v84 = *__error();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v83;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v84;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: Warning: failed to unmap unused tail: %s (%d)", buf, 0x12u);
        v56 = v113;
      }
    }
  }
  v112 = v49 + v109;
  if ((v56 & 0x80000000) == 0 && ftruncate(v56, v49 + v114))
  {
    v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v86 = *__error();
    v130 = *MEMORY[0x1E0CB2D50];
    v87 = objc_alloc(MEMORY[0x1E0CB3940]);
    v88 = __error();
    v89 = strerror(*v88);
    v90 = (void *)objc_msgSend(v87, "initWithFormat:", CFSTR("Failed to ftruncate file to size %zu bytes: %s (%d)"), v49, v89, *__error());
    v131 = v90;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v85, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v86, v91);
    v93 = *v115;
    *v115 = (void *)v92;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_97:
      v100 = *v115;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v100;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }
LABEL_90:
    if (munmap(v111, v112) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v94 = __error();
      v95 = strerror(*v94);
      v96 = *__error();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v95;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v96;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: Warning: failed to unmap in failure recovery: %s (%d)", buf, 0x12u);
    }
    goto LABEL_14;
  }
  if (mprotect(v111, v112, 1) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v97 = __error();
    v98 = strerror(*v97);
    v99 = *__error();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v98;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v99;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: Warning: failed to mprotect mapping: %s (%d)", buf, 0x12u);
  }
  v16 = dispatch_data_create(buffer, v49, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);
LABEL_15:

  return v16;
}

+ (uint64_t)_scanPlist:(unint64_t)a3 recursionDepth:(uint64_t *)a4 sizeUpperBound:(void *)a5 allDictionaryKeys:(id *)a6 error:
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  id obj;

  v10 = a2;
  v11 = a5;
  v12 = objc_opt_self();
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error_, v12, CFSTR("_PASLPWriterV1.m"), 359, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  if (a3 < 0x65)
  {
    v17 = *a4;
    v28 = a3;
    v29 = v17;
    v30 = v11;
    obj = *a6;
    v18 = +[_PASLPWriterV1 _visitObject:context:handleBoolean:handleInt64:handleFloat64:handleTimeInterval:handleData:handleString:handleDict:handleArray:handleOther:](v12, v10, (uint64_t)&v28, &__block_literal_global_3767, &__block_literal_global_30, &__block_literal_global_32_3768, &__block_literal_global_33_3769, &__block_literal_global_35, &__block_literal_global_37, &__block_literal_global_41, &__block_literal_global_49, &__block_literal_global_52_3770);
    if ((v18 & 1) != 0)
    {
      v19 = obj;
      *a4 = v29 + 19;
      objc_storeStrong(a6, v19);
      v20 = v30;
      v30 = 0;

      v21 = obj;
      obj = 0;

    }
  }
  else
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("plist object graph exceeds maximum depth %tu, or contains a cycle"), 100);
    v14 = (void *)objc_opt_new();
    v15 = v14;
    if (v13)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The object is too large to serialize as _PASLazyPlist: %@"), v13);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB2D50]);

    }
    else
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("The object is too large to serialize as _PASLazyPlist."), *MEMORY[0x1E0CB2D50]);
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D68]);

    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = (void *)objc_msgSend(v15, "copy");
    v24 = objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 7, v23);

    v25 = *a6;
    *a6 = (id)v24;

    v18 = 0;
  }

  return v18;
}

+ (uint64_t)_valueWordForObjectGraph:(uint64_t)a3 allocContext:(unint64_t)a4 recursionDepth:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v6 = a2;
  v7 = objc_opt_self();
  v8 = v7;
  v9 = *(_QWORD *)(a3 + 32);
  v10 = *(_QWORD *)(v9 + 112);
  if (v10 <= a4)
    v10 = a4;
  *(_QWORD *)(v9 + 112) = v10;
  v15 = a3;
  v16 = 0;
  v17 = a4;
  v11 = +[_PASLPWriterV1 _visitObject:context:handleBoolean:handleInt64:handleFloat64:handleTimeInterval:handleData:handleString:handleDict:handleArray:handleOther:](v7, v6, (uint64_t)&v15, &__block_literal_global_59, &__block_literal_global_60, &__block_literal_global_61, &__block_literal_global_64, &__block_literal_global_65_3721, &__block_literal_global_69, &__block_literal_global_73, &__block_literal_global_84, 0);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__valueWordForObjectGraph_allocContext_recursionDepth_, v8, CFSTR("_PASLPWriterV1.m"), 841, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ok"));

  }
  if (!BYTE4(v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__valueWordForObjectGraph_allocContext_recursionDepth_, v8, CFSTR("_PASLPWriterV1.m"), 842, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueWordContext.hasValueWord"));

  }
  return v16;
}

+ (uint64_t)_visitObject:(uint64_t)a3 context:(void *)a4 handleBoolean:(void *)a5 handleInt64:(void *)a6 handleFloat64:(void *)a7 handleTimeInterval:(void *)a8 handleData:(void *)a9 handleString:(void *)a10 handleDict:(void *)a11 handleArray:(void *)a12 handleOther:
{
  id v17;
  id v18;
  uint64_t (**v19)(id, _QWORD, __n128);
  uint64_t (**v20)(id, _QWORD, id);
  uint64_t (**v21)(id, _QWORD, id);
  uint64_t (**v22)(id, _QWORD, id);
  uint64_t (**v23)(id, _QWORD, id);
  uint64_t (**v24)(id, _QWORD, id);
  uint64_t v25;
  CFTypeID v26;
  uint64_t (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  _BOOL8 v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  void *v36;
  void *v37;
  id v39;
  uint64_t (**v40)(id, _QWORD, __n128);
  unint64_t valuePtr;

  v17 = a2;
  v39 = a4;
  v18 = a5;
  v40 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = CFGetTypeID(v17);
    if (v26 == CFBooleanGetTypeID())
    {
      v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v18;
      v28 = v39;
      if (v39)
      {
        v29 = CFBooleanGetValue((CFBooleanRef)v17) != 0;
        v30 = (*((uint64_t (**)(id, uint64_t, _BOOL8))v39 + 2))(v39, a3, v29);
LABEL_34:
        v34 = v30;
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v18;
    if (CFNumberIsFloatType((CFNumberRef)v17))
    {
      if (v40)
      {
        valuePtr = 0;
        if (!CFNumberGetValue((CFNumberRef)v17, kCFNumberDoubleType, &valuePtr))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__visitObject_context_handleBoolean_handleInt64_handleFloat64_handleTimeInterval_handleData_handleString_handleDict_handleArray_handleOther_, v25, CFSTR("_PASLPWriterV1.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("convOk"));

          v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v18;
        }
        v33.n128_u64[0] = valuePtr;
        v32 = v40[2](v40, a3, v33);
        goto LABEL_13;
      }
    }
    else if (v18)
    {
      valuePtr = 0;
      if (!CFNumberGetValue((CFNumberRef)v17, kCFNumberSInt64Type, &valuePtr))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__visitObject_context_handleBoolean_handleInt64_handleFloat64_handleTimeInterval_handleData_handleString_handleDict_handleArray_handleOther_, v25, CFSTR("_PASLPWriterV1.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("convOk"));

        v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v18;
      }
      v32 = v27[2](v27, a3, valuePtr);
      goto LABEL_13;
    }
LABEL_24:
    v34 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v39;
      if (v20)
      {
        v30 = v20[2](v20, a3, v17);
        goto LABEL_34;
      }
    }
    else
    {
      objc_opt_class();
      v28 = v39;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v21)
        {
          v30 = v21[2](v21, a3, v17);
          goto LABEL_34;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v22)
          {
            v30 = v22[2](v22, a3, v17);
            goto LABEL_34;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v23)
            {
              v30 = v23[2](v23, a3, v17);
              goto LABEL_34;
            }
          }
          else if (v24)
          {
            v30 = v24[2](v24, a3, v17);
            goto LABEL_34;
          }
        }
      }
    }
LABEL_35:
    v34 = 1;
    goto LABEL_36;
  }
  v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v18;
  if (!v19)
    goto LABEL_24;
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v32 = v19[2](v19, a3, v31);
LABEL_13:
  v34 = v32;
LABEL_25:
  v28 = v39;
LABEL_36:

  return v34;
}

@end
