@implementation VMUProcessDescription

- (void)setCrashReporterInfo
{
  void *v3;
  __CFString *processName;
  __CFString *v5;
  __CFString *executablePath;
  __CFString *v7;
  __CFString *parentProcessName;
  __CFString *v9;
  __CFString *parentExecutablePath;
  __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1A85A9758](self, a2);
  processName = (__CFString *)self->_processName;
  if (!processName)
    processName = CFSTR("<unknown>");
  v5 = processName;
  executablePath = (__CFString *)self->_executablePath;
  if (!executablePath)
    executablePath = CFSTR("<unknown>");
  v7 = executablePath;
  parentProcessName = (__CFString *)self->_parentProcessName;
  if (!parentProcessName)
    parentProcessName = CFSTR("<unknown>");
  v9 = parentProcessName;
  parentExecutablePath = (__CFString *)self->_parentExecutablePath;
  if (!parentExecutablePath)
    parentExecutablePath = CFSTR("<unknown>");
  v11 = parentExecutablePath;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VMUProcessDescription is examining:\n   process: %@  pid: %d  path: %@  _binaryImages count: %zu\n   parent process: %@  pid: %d  path: %@\n"), v5, self->_pid, v7, -[NSMutableArray count](self->_binaryImages, "count"), v9, self->_ppid, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  VMUSetCrashReporterInfo(v12);

  objc_autoreleasePoolPop(v3);
}

+ (id)parseBinaryImagesDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v3);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("/"), 0);
    if ((objc_msgSend(v5, "isAtEnd") & 1) != 0)
      break;
    v12 = 0;
    objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v6, &v12);
    v7 = v12;
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "rangeOfString:options:", CFSTR("/"), 4) + 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("ExecutablePath"));
        objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("DisplayName"));
        objc_msgSend(v4, "addObject:", v10);

      }
    }

  }
  return v4;
}

+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _CSTypeRef result;

  v4 = a3;
  v5 = objc_msgSend(a1, "symbolicatorFromBinaryImagesDescription:withArchitecture:", v4, MEMORY[0x1A85A87D4]());
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result._opaque_2 = v9;
  result._opaque_1 = v8;
  return result;
}

+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3 withArchitecture:(_CSArchitecture)a4
{
  id v5;
  int v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  _CSArchitecture v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(__n128 *, __n128 *);
  void (*v33)(uint64_t);
  void *v34;
  void *__p;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __n128 (*v41)(__n128 *, __n128 *);
  void (*v42)(uint64_t);
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _CSTypeRef result;

  v5 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x4812000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = &unk_1A4E39779;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x4812000000;
  v32 = __Block_byref_object_copy__11;
  v33 = __Block_byref_object_dispose__12;
  v34 = &unk_1A4E39779;
  __p = 0;
  v36 = 0;
  v37 = 0;
  v6 = objc_msgSend(v5, "containsString:", CFSTR("("));
  if (v6)
    v7 = CFSTR("(0x[a-fA-F0-9]*)\\s*-\\s*(0x[a-fA-F0-9]*)\\s*(\\S*)\\s*\\(([0-9\\- \\.\\?]*)\\)\\s*<(\\S{36})>\\s*(.*)");
  else
    v7 = CFSTR("(0x[a-fA-F0-9]*)\\s*-\\s*(0x[a-fA-F0-9]*)\\s*(\\S*)\\s*(\\S*)\\s*<(\\S{32})>\\s*(.*)");
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "length");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__VMUProcessDescription_symbolicatorFromBinaryImagesDescription_withArchitecture___block_invoke;
  v23[3] = &unk_1E4E01560;
  v10 = v5;
  v24 = v10;
  v25 = &v29;
  v28 = v6;
  v26 = &v38;
  v27 = a4;
  objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v9, v23);
  v11 = v39[6];
  if (v39[7] == v11)
    goto LABEL_11;
  v12 = 0;
  v13 = 0;
  v14 = 48;
  do
  {
    *(_QWORD *)(v11 + v14) = v30[6] + v12;
    ++v13;
    v11 = v39[6];
    v15 = v39[7];
    v12 += 40;
    v14 += 64;
  }
  while (v13 < (v15 - v11) >> 6);
  if (v15 == v11)
  {
LABEL_11:
    v18 = 0;
    v16 = 0;
  }
  else
  {
    v16 = CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification();
    v18 = v17;
    v19 = v39[6];
    v20 = v39[7];
    while (v19 != v20)
    {
      free(*(void **)(v19 + 40));
      v19 += 64;
    }
  }

  _Block_object_dispose(&v29, 8);
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v38, 8);
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
  }

  v21 = v16;
  v22 = v18;
  result._opaque_2 = v22;
  result._opaque_1 = v21;
  return result;
}

void __82__VMUProcessDescription_symbolicatorFromBinaryImagesDescription_withArchitecture___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  char *v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  const char *v48;
  size_t v49;
  void *v50;
  char v51;
  id v52;
  void *v53;
  _QWORD *v54;
  _OWORD *v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _OWORD *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char *v72;
  char *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *context;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1A85A9758]();
  *((_QWORD *)&v86 + 1) = 1;
  strcpy((char *)&v88, "__TEXT");
  v4 = objc_msgSend(v3, "rangeAtIndex:", 1);
  v6 = v5;
  v7 = objc_msgSend(v3, "rangeAtIndex:", 2);
  v9 = v8;
  v10 = objc_msgSend(v3, "rangeAtIndex:", 4);
  v78 = v11;
  v12 = v10;
  v13 = objc_msgSend(v3, "rangeAtIndex:", 5);
  v77 = v12;
  v79 = v14;
  v80 = v13;
  v15 = objc_msgSend(v3, "rangeAtIndex:", 6);
  v17 = v16;
  v18 = objc_alloc(MEMORY[0x1E0CB3900]);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

  objc_msgSend(v20, "scanHexLongLong:", &v87);
  v21 = objc_alloc(MEMORY[0x1E0CB3900]);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:", v22);

  objc_msgSend(v23, "scanHexLongLong:", (char *)&v87 + 8);
  ++*((_QWORD *)&v87 + 1);
  v24 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v25 = v24[7];
  v26 = v24[8];
  if (v25 >= v26)
  {
    v30 = v24[6];
    v31 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v25 - v30) >> 3);
    v32 = v31 + 1;
    if (v31 + 1 > 0x666666666666666)
      std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
    v33 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v26 - v30) >> 3);
    if (2 * v33 > v32)
      v32 = 2 * v33;
    if (v33 >= 0x333333333333333)
      v34 = 0x666666666666666;
    else
      v34 = v32;
    if (v34)
      v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(v24 + 8), v34);
    else
      v35 = 0;
    v36 = &v35[40 * v31];
    v37 = &v35[40 * v34];
    v38 = v87;
    v39 = v88;
    *((_QWORD *)v36 + 4) = v89;
    *(_OWORD *)v36 = v38;
    *((_OWORD *)v36 + 1) = v39;
    v29 = v36 + 40;
    v41 = (char *)v24[6];
    v40 = (char *)v24[7];
    if (v40 != v41)
    {
      do
      {
        v42 = *(_OWORD *)(v40 - 40);
        v43 = *(_OWORD *)(v40 - 24);
        *((_QWORD *)v36 - 1) = *((_QWORD *)v40 - 1);
        *(_OWORD *)(v36 - 24) = v43;
        *(_OWORD *)(v36 - 40) = v42;
        v36 -= 40;
        v40 -= 40;
      }
      while (v40 != v41);
      v40 = (char *)v24[6];
    }
    v24[6] = v36;
    v24[7] = v29;
    v24[8] = v37;
    if (v40)
      operator delete(v40);
  }
  else
  {
    v27 = v87;
    v28 = v88;
    *(_QWORD *)(v25 + 32) = v89;
    *(_OWORD *)v25 = v27;
    *(_OWORD *)(v25 + 16) = v28;
    v29 = (char *)(v25 + 40);
  }
  v24[7] = v29;
  if (*(_BYTE *)(a1 + 64))
  {
    v44 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v82 = 0;
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v77, v78);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = objc_msgSend(v45, "cStringUsingEncoding:", 4);

    if ((MEMORY[0x1A85A92CC](v46, (char *)&v82 + 4, &v82) & 1) == 0)
    {
      CFLog();
      goto LABEL_43;
    }
    v44 = HIDWORD(v82) | ((unint64_t)v82 << 32);
  }
  *(_QWORD *)&v85 = v44;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v15, v17);
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v48 = (const char *)objc_msgSend(v47, "cStringUsingEncoding:", 4);

  v49 = strlen(v48);
  *((_QWORD *)&v85 + 1) = strndup(v48, v49);
  if (*((_QWORD *)&v85 + 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v80, v79);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "containsString:", CFSTR("-"));
    v52 = objc_retainAutorelease(v50);
    v53 = v52;
    if ((v51 & 1) != 0)
      MEMORY[0x1A85A8B94](objc_msgSend(v52, "cStringUsingEncoding:", 1), &v84);
    else
      sscanf((const char *)objc_msgSend(v52, "cStringUsingEncoding:", 1), "%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx", &v84, (char *)&v84 + 1, (char *)&v84 + 2, (char *)&v84 + 3, (char *)&v84 + 4, (char *)&v84 + 5, (char *)&v84 + 6, (char *)&v84 + 7, (char *)&v84 + 8, (char *)&v84 + 9, (char *)&v84 + 10, (char *)&v84 + 11, (char *)&v84 + 12, (char *)&v84 + 13, (char *)&v84 + 14, (char *)&v84 + 15);
    v54 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v55 = (_OWORD *)v54[7];
    v56 = v54[8];
    if ((unint64_t)v55 >= v56)
    {
      v61 = v54[6];
      v62 = ((uint64_t)v55 - v61) >> 6;
      v63 = v62 + 1;
      if ((unint64_t)(v62 + 1) >> 58)
        std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
      v64 = v56 - v61;
      if (v64 >> 5 > v63)
        v63 = v64 >> 5;
      if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFC0)
        v65 = 0x3FFFFFFFFFFFFFFLL;
      else
        v65 = v63;
      if (v65)
        v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(v54 + 8), v65);
      else
        v66 = 0;
      v67 = &v66[64 * v62];
      v68 = &v66[64 * v65];
      v69 = v83;
      v70 = v84;
      v71 = v86;
      *((_OWORD *)v67 + 2) = v85;
      *((_OWORD *)v67 + 3) = v71;
      *(_OWORD *)v67 = v69;
      *((_OWORD *)v67 + 1) = v70;
      v60 = v67 + 64;
      v73 = (char *)v54[6];
      v72 = (char *)v54[7];
      if (v72 != v73)
      {
        do
        {
          v74 = *((_OWORD *)v72 - 4);
          v75 = *((_OWORD *)v72 - 3);
          v76 = *((_OWORD *)v72 - 1);
          *((_OWORD *)v67 - 2) = *((_OWORD *)v72 - 2);
          *((_OWORD *)v67 - 1) = v76;
          *((_OWORD *)v67 - 4) = v74;
          *((_OWORD *)v67 - 3) = v75;
          v67 -= 64;
          v72 -= 64;
        }
        while (v72 != v73);
        v72 = (char *)v54[6];
      }
      v54[6] = v67;
      v54[7] = v60;
      v54[8] = v68;
      if (v72)
        operator delete(v72);
    }
    else
    {
      v57 = v83;
      v58 = v84;
      v59 = v86;
      v55[2] = v85;
      v55[3] = v59;
      *v55 = v57;
      v55[1] = v58;
      v60 = v55 + 4;
    }
    v54[7] = v60;

  }
LABEL_43:

  objc_autoreleasePoolPop(context);
}

- (VMUProcessDescription)initWithPid:(int)a3 orTask:(unsigned int)a4
{
  return -[VMUProcessDescription initWithTask:getBinariesList:](self, "initWithTask:getBinariesList:", *(_QWORD *)&a4, 0);
}

- (VMUProcessDescription)initWithTask:(unsigned int)a3 getBinariesList:(BOOL)a4
{
  _BOOL8 v4;
  VMUTaskMemoryCache *v6;
  VMUProcessDescription *v7;

  v4 = a4;
  v6 = -[VMUTaskMemoryCache initWithTask:]([VMUTaskMemoryCache alloc], "initWithTask:", *(_QWORD *)&a3);
  v7 = -[VMUProcessDescription initWithVMUTaskMemoryCache:getBinariesList:](self, "initWithVMUTaskMemoryCache:getBinariesList:", v6, v4);

  return v7;
}

- (VMUProcessDescription)initWithVMUTaskMemoryCache:(id)a3 getBinariesList:(BOOL)a4
{
  int v4;
  VMUProcessDescription *v7;
  uint64_t v8;
  NSDate *date;
  _BOOL4 v10;
  VMUTaskMemoryCache *memoryCache;
  mach_error_t v12;
  VMUProcessDescription *v13;
  void *v14;
  uint64_t v15;
  NSString *hardwareModel;
  int ppid;
  CFStringRef v18;
  NSString *parentProcessName;
  CFStringRef v20;
  NSString *parentExecutablePath;
  NSMutableArray *v22;
  NSMutableArray *binaryImages;
  _BOOL4 taskIsCorpseOrCore;
  int FlagsForNoSymbolOrSourceInfoData;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t pid;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *executablePath;
  uint64_t v45;
  void *v46;
  NSMutableArray *v47;
  NSMutableArray *obj;
  _BOOL8 *p_memoryCache;
  id v50;
  id location[2];
  __int128 v52;
  __int128 v53;
  int v54;
  uint64_t v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62[5];
  VMUProcessDescription *v63;
  size_t v64;
  objc_super v65;
  _BYTE v66[128];
  int v67[2];
  uint64_t v68;

  v4 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v65.receiver = self;
  v65.super_class = (Class)VMUProcessDescription;
  v7 = -[VMUProcessDescription init](&v65, sel_init);
  if (!v7)
    goto LABEL_60;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = objc_claimAutoreleasedReturnValue();
  date = v7->_date;
  v7->_date = (NSDate *)v8;

  if (v50)
  {
    p_memoryCache = (_BOOL8 *)&v7->_memoryCache;
    objc_storeStrong((id *)&v7->_memoryCache, a3);
    v10 = -[VMUTaskMemoryCache representsCore]((_BOOL8)v7->_memoryCache);
    memoryCache = v7->_memoryCache;
    if (v10)
    {
      if (-[VMUTaskMemoryCache isKernel](memoryCache, "isKernel"))
      {
        v7->_pid = -1;
LABEL_11:
        if (-[VMUTaskMemoryCache getPlatform:](v7->_memoryCache, "getPlatform:", &v7->_platform))
        {

          v7 = 0;
          goto LABEL_13;
        }
        if (-[VMUTaskMemoryCache representsCore](*p_memoryCache))
        {
          v7->_taskIsCorpseOrCore = 1;
          -[VMUProcessDescription initFromCorpseOrCore](v7, "initFromCorpseOrCore");
        }
        else if (-[VMUProcessDescription initFromCorpseOrCore](v7, "initFromCorpseOrCore"))
        {
          v7->_taskIsCorpseOrCore = 1;
        }
        else
        {
          v7->_taskIsCorpseOrCore = 0;
          -[VMUProcessDescription initFromLiveProcess](v7, "initFromLiveProcess");
        }
        v64 = 0;
        *(_QWORD *)v67 = 0x100000006;
        if (!sysctl(v67, 2u, 0, &v64, 0, 0))
        {
          v14 = malloc_type_malloc(v64, 0xD8059D57uLL);
          if (!sysctl(v67, 2u, v14, &v64, 0, 0))
          {
            v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
            hardwareModel = v7->_hardwareModel;
            v7->_hardwareModel = (NSString *)v15;

          }
          free(v14);
        }
        if (!v7->_hardwareModel)
        {
          v7->_hardwareModel = (NSString *)&stru_1E4E04720;

        }
        if (!-[VMUTaskMemoryCache representsCore](*p_memoryCache))
        {
          ppid = v7->_ppid;
          if (ppid)
          {
            v18 = _CRCopyProcessNameForPID(ppid);
            parentProcessName = v7->_parentProcessName;
            v7->_parentProcessName = &v18->isa;

            v20 = _CRCopyExecutablePathForPID(v7->_ppid);
            parentExecutablePath = v7->_parentExecutablePath;
            v7->_parentExecutablePath = &v20->isa;

          }
        }
        if (!v7->_taskIsCorpseOrCore)
        {
          objc_msgSend((id)*p_memoryCache, "taskPort");
          v4 &= CSTaskHasStarted();
        }
        if (-[VMUTaskMemoryCache representsCore](*p_memoryCache)
          || objc_msgSend((id)*p_memoryCache, "taskPort")
          && objc_msgSend((id)*p_memoryCache, "taskPort") != -1)
        {
          v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          binaryImages = v7->_binaryImages;
          v7->_binaryImages = v22;

          if (v4)
          {
            taskIsCorpseOrCore = v7->_taskIsCorpseOrCore;
            FlagsForNoSymbolOrSourceInfoData = CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
            objc_initWeak(location, v7);
            v26 = -[VMUTaskMemoryCache representsCore]((_BOOL8)v7->_memoryCache);
            v27 = FlagsForNoSymbolOrSourceInfoData | !taskIsCorpseOrCore;
            v28 = *p_memoryCache;
            if (v26)
            {
              v7->_symbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:](*p_memoryCache, v27, 0);
              v7->_symbolicator._opaque_2 = v29;
              v62[1] = (id)MEMORY[0x1E0C809B0];
              v62[2] = (id)3221225472;
              v62[3] = __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke;
              v62[4] = &unk_1E4E012C8;
              v63 = v7;
              CSSymbolicatorForeachSymbolOwnerAtTime();

            }
            else
            {
              v61[0] = MEMORY[0x1E0C809B0];
              v61[1] = 3221225472;
              v61[2] = __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_2;
              v61[3] = &unk_1E4E015B0;
              objc_copyWeak(v62, location);
              v7->_symbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:](v28, v27, v61);
              v7->_symbolicator._opaque_2 = v31;
              objc_destroyWeak(v62);
            }
            if (CSIsNull())
            {
              pid = v7->_pid;
              -[VMUProcessDescription processName](v7, "processName");
              v45 = pid;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              CFLog();

            }
            objc_destroyWeak(location);
          }
        }
        else
        {
          v30 = v7->_pid;
          -[VMUProcessDescription processName](v7, "processName");
          v45 = v30;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          CFLog();

        }
        if (v7->_executablePathNeedsCorrection || !-[NSString length](v7->_executablePath, "length"))
        {
          v47 = v7->_binaryImages;
          objc_sync_enter(v47);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          obj = v7->_binaryImages;
          v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v58;
            while (2)
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v58 != v34)
                  objc_enumerationMutation(obj);
                v36 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                -[VMUProcessDescription processIdentifier](v7, "processIdentifier", v45, v46);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "objectForKey:", CFSTR("Identifier"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v37, "isEqualToString:", v38);

                if (v39)
                {
                  objc_msgSend(v36, "objectForKey:", CFSTR("ExecutablePath"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v40;
                  if (v40)
                  {
                    v42 = objc_msgSend(v40, "copy");
                    executablePath = v7->_executablePath;
                    v7->_executablePath = (NSString *)v42;

                    v7->_executablePathNeedsCorrection = 0;
                    goto LABEL_53;
                  }
                }
              }
              v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
              if (v33)
                continue;
              break;
            }
          }
LABEL_53:

          objc_sync_exit(v47);
        }
        -[VMUProcessDescription cleansePathsIncludingBinaryImageList:](v7, "cleansePathsIncludingBinaryImageList:", 0, v45, v46);
        CSSymbolicatorGetAOutSymbolOwner();
        if ((CSIsNull() & 1) != 0)
        {
          if (!-[VMUTaskMemoryCache isExclave]((_BOOL8)v50))
          {
            v55 = 0;
            v56 = 0;
            v54 = 9999;
            v52 = 0u;
            v53 = 0u;
            *(_OWORD *)location = 0u;
            if (!objc_msgSend((id)*p_memoryCache, "machVMRegionRecurseSubmapShortInfo64onAddress:size:nestingDepth:info:", &v56, &v55, &v54, location))v7->_executableLoadAddress = v56;
          }
        }
        else
        {
          v7->_executableLoadAddress = CSSymbolOwnerGetBaseAddress();
        }
LABEL_60:
        v7 = v7;
        v13 = v7;
        goto LABEL_61;
      }
      if (!-[VMUTaskMemoryCache getCoreFilePid:]((uint64_t)v7->_memoryCache))
        goto LABEL_11;
    }
    else
    {
      if (!-[VMUTaskMemoryCache taskPort](memoryCache, "taskPort"))
        goto LABEL_11;
      if (objc_msgSend((id)*p_memoryCache, "taskPort") == -1)
        goto LABEL_11;
      v12 = pid_for_task(objc_msgSend((id)*p_memoryCache, "taskPort"), &v7->_pid);
      if (!v12)
        goto LABEL_11;
      objc_msgSend((id)*p_memoryCache, "taskPort");
      mach_error_string(v12);
      CFLog();
    }
  }
LABEL_13:
  v13 = 0;
LABEL_61:

  return v13;
}

uint64_t __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_libraryLoaded:", a2, a3);
}

void __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained;
  id v5;

  if (a2 == 256)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_libraryLoaded:", *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));

  }
  else if (a2 == 16)
  {
    objc_copyWeak(&v5, (id *)(a1 + 32));
    CSSymbolicatorForeachSymbolOwnerAtTime();
    objc_destroyWeak(&v5);
  }
}

void __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_libraryLoaded:", a2, a3);

}

- (void)initFromLiveProcess
{
  int pid;
  void *v4;
  NSString *executablePath;
  NSString *processName;
  VMUTaskMemoryCache *memoryCache;
  int v8;
  unsigned int v9;
  VMUProcInfo *v10;
  VMUProcInfo *v11;
  int v12;
  int v13;
  void *v14;
  uint32_t flags;
  __int16 v16;
  size_t size;
  int v18[2];
  int v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  size = 0;
  *(_QWORD *)v18 = 0xE00000001;
  pid = self->_pid;
  v19 = 1;
  v20 = pid;
  if ((sysctl(v18, 4u, 0, &size, 0, 0) & 0x80000000) == 0)
  {
    v4 = malloc_type_malloc(size, 0x35D5403BuLL);
    if (v4)
    {
      if ((sysctl(v18, 4u, v4, &size, 0, 0) & 0x80000000) == 0)
      {
        self->_is64Bit = (*((_BYTE *)v4 + 32) & 4) != 0;
        self->_proc_starttime = *(timeval *)v4;
        self->_ppid = *((_DWORD *)v4 + 140);
      }
      free(v4);
    }
  }
  v16 = 0;
  size = 0;
  *(_QWORD *)v18 = 0;
  _CRCopyExecutablePathAndNameForPIDDetectingInconsistencies(self->_pid, (CFStringRef *)v18, &v16, (CFStringRef *)&size, (_BYTE *)&v16 + 1);
  executablePath = self->_executablePath;
  self->_executablePath = *(NSString **)v18;

  processName = self->_processName;
  self->_processName = (NSString *)size;

  memoryCache = self->_memoryCache;
  self->_executablePathNeedsCorrection = (_BYTE)v16 != 0;
  self->_processNameNeedsCorrection = HIBYTE(v16) != 0;
  -[VMUTaskMemoryCache taskPort](memoryCache, "taskPort");
  self->_taskIsTranslated = CSTaskIsTranslated();
  flags = 0;
  proc_get_dirty(self->_pid, &flags);
  if ((flags & 4) != 0)
    v8 = 3;
  else
    v8 = 2;
  if ((~flags & 3) != 0)
    v9 = 1;
  else
    v9 = v8;
  self->_idleExitStatus = v9;
  v10 = -[VMUProcInfo initWithTask:]([VMUProcInfo alloc], "initWithTask:", -[VMUTaskMemoryCache taskPort](self->_memoryCache, "taskPort"));
  v11 = v10;
  if (!v10)
  {
    CFLog();
    goto LABEL_25;
  }
  v12 = -[VMUProcInfo cpuType](v10, "cpuType");
  self->_cpuType = v12;
  if (self->_is64Bit)
  {
    v13 = 16777223;
    if (v12 == 18)
    {
      v13 = 16777234;
    }
    else if (v12 != 7)
    {
      goto LABEL_20;
    }
    self->_cpuType = v13;
  }
LABEL_20:
  if (self->_processNameNeedsCorrection || !-[NSString length](self->_processName, "length"))
  {
    -[VMUProcInfo name](v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_storeStrong((id *)&self->_processName, v14);
      self->_processNameNeedsCorrection = 0;
    }

  }
LABEL_25:

}

- (BOOL)initFromCorpseOrCore
{
  _BOOL4 v3;
  VMUTaskMemoryCache *memoryCache;
  VMUTaskMemoryCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  kern_return_t v10;
  task_read_t v11;
  vm_map_t *v12;
  mach_vm_size_t v13;
  int *v14;
  mach_vm_size_t v15;
  mach_vm_address_t v16;
  vm_map_t *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *environment;
  const char *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int i;
  const char *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  uint64_t v52;
  int v53;
  char v55;
  char v56;
  int v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  id obj[2];
  id v70[2];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _OWORD v74[2];
  mach_vm_size_t kcd_size;
  mach_vm_address_t kcd_addr_begin;
  __int128 v77;
  char v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v73 = 0u;
  memset(v74, 0, 24);
  v71 = 0u;
  v72 = 0u;
  *(_OWORD *)obj = 0u;
  *(_OWORD *)v70 = 0u;
  v3 = -[VMUTaskMemoryCache representsCore]((_BOOL8)self->_memoryCache);
  memoryCache = self->_memoryCache;
  if (v3)
  {
    v5 = memoryCache;
    -[VMUTaskMemoryCache coreFileProcName](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    obj[0] = (id)objc_msgSend(v6, "copy");

    -[VMUTaskMemoryCache coreFileProcPath](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    obj[1] = (id)objc_msgSend(v7, "copy");

    -[VMUTaskMemoryCache coreFileParentProcName](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = (id)objc_msgSend(v8, "copy");

    -[VMUTaskMemoryCache coreFileParentProcPath](v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = (id)objc_msgSend(v9, "copy");

    if (-[VMUTaskMemoryCache getCoreFileProcStarttimeSec:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcStarttimeUSec:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileUserstack:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcFlags:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileArgsLen:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcArgc:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprint:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprintLifetimeMax:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFilePid:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFilePPid:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileCPUType:](v5, "getCoreFileCPUType:", (char *)&v71 + 4))
    {
      v10 = 5;
    }
    else if (-[VMUTaskMemoryCache getCoreFileDirtyFlags:]((uint64_t)v5))
    {
      v10 = 5;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v11 = -[VMUTaskMemoryCache taskPort](memoryCache, "taskPort");
    kcd_size = 0;
    kcd_addr_begin = 0;
    v12 = (vm_map_t *)MEMORY[0x1E0C83DA0];
    v10 = task_map_corpse_info_64(*MEMORY[0x1E0C83DA0], v11, &kcd_addr_begin, &kcd_size);
    if (!v10)
    {
      v13 = kcd_size;
      v14 = (int *)kcd_addr_begin;
      v15 = kcd_size + kcd_addr_begin;
      v16 = kcd_addr_begin + 16;
      if (v14 + 4 <= (int *)((char *)v14 + kcd_size) && v16 + *(unsigned int *)(kcd_addr_begin + 4) <= v15)
      {
        v18 = 0;
        if (*(_DWORD *)kcd_addr_begin == -559025833)
        {
          v65 = 0;
          v63 = 0;
          v64 = 0;
          v62 = 0;
          v55 = 0;
          v56 = 0;
          v68 = 0;
          do
          {
            if (v16 + v14[1] > v15)
              break;
            v57 = *v14;
            if (*v14 == -242132755)
              break;
            if ((v57 & 0xFFFFFFF0) == 0x20)
              v57 = 17;
            switch(v57)
            {
              case 2053:
                DWORD2(v71) = v14[4];
                v65 = 1;
                break;
              case 2054:
                HIDWORD(v71) = v14[4];
                BYTE4(v64) = 1;
                break;
              case 2055:
              case 2056:
              case 2058:
              case 2062:
              case 2064:
              case 2065:
              case 2066:
              case 2067:
                break;
              case 2057:
                v77 = *((_OWORD *)v14 + 1);
                v78 = 0;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v77);
                v58 = objc_claimAutoreleasedReturnValue();
                v59 = obj[0];
                obj[0] = (id)v58;

                break;
              case 2059:
                *(_QWORD *)&v72 = *((_QWORD *)v14 + 2);
                *((_QWORD *)&v72 + 1) = v14[6];
                LOBYTE(v64) = 1;
                break;
              case 2060:
                *(_QWORD *)&v73 = *((_QWORD *)v14 + 2);
                BYTE4(v63) = 1;
                break;
              case 2061:
                HIDWORD(v73) = v14[4];
                v62 = 1;
                break;
              case 2063:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14 + 4);
                v60 = objc_claimAutoreleasedReturnValue();
                v61 = obj[1];
                obj[1] = (id)v60;

                break;
              case 2068:
                LODWORD(v74[0]) = v14[4];
                v55 = 1;
                break;
              case 2069:
                DWORD2(v73) = v14[4];
                LOBYTE(v63) = 1;
                break;
              case 2070:
                DWORD1(v71) = v14[4];
                v56 = 1;
                break;
              default:
                if (v57 == 2086)
                {
                  *((_QWORD *)&v74[0] + 1) = *((_QWORD *)v14 + 2);
                  BYTE4(v68) = 1;
                }
                else if (v57 == 2087)
                {
                  *(_QWORD *)&v74[1] = *((_QWORD *)v14 + 2);
                  LOBYTE(v68) = 1;
                }
                break;
            }
            v14 = (int *)(v16 + v14[1]);
            v16 = (mach_vm_address_t)(v14 + 4);
          }
          while ((unint64_t)(v14 + 4) <= v15);
          v17 = v12;
          v13 = kcd_size;
          v14 = (int *)kcd_addr_begin;
          v18 = v68 & 1;
          LODWORD(v67) = v56 & 1;
          HIDWORD(v67) = BYTE4(v68) & 1;
          v66 = v55 & 1;
          v19 = v62 & 1;
          v20 = v63 & 1;
          v21 = BYTE4(v63) & 1;
          v22 = v64 & 1;
          v23 = BYTE4(v64) & 1;
          v24 = v65 & 1;
        }
        else
        {
          v17 = v12;
          v67 = 0;
          v66 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
        }
      }
      else
      {
        v17 = v12;
        v18 = 0;
        v67 = 0;
        v66 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v24 = 0;
      }
      mach_vm_deallocate(*v17, (mach_vm_address_t)v14, v13);
      v10 = 5;
      if (obj[0])
      {
        if (obj[1])
          v25 = v24;
        else
          v25 = 0;
        if ((v25 & v23 & v22 & v21 & v20 & v19 & v66 & v67 & HIDWORD(v67) & v18 & 1) != 0)
          v10 = 0;
        else
          v10 = 5;
      }
    }
  }
  if (-[VMUTaskMemoryCache isKernel](self->_memoryCache, "isKernel"))
  {
    v26 = obj[0];
    obj[0] = CFSTR("kernel");

    LODWORD(v71) = 4;
    DWORD2(v73) = 4;
  }
  else if (v10)
  {
    v27 = 0;
    goto LABEL_76;
  }
  objc_storeStrong((id *)&self->_processName, obj[0]);
  self->_proc_starttime.tv_sec = v72;
  v28 = v73;
  self->_proc_starttime.tv_usec = DWORD2(v72);
  v29 = HIDWORD(v73);
  objc_storeStrong((id *)&self->_executablePath, obj[1]);
  -[NSString lastPathComponent](self->_executablePath, "lastPathComponent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "length"))
    objc_storeStrong((id *)&self->_processName, v30);
  objc_storeStrong((id *)&self->_parentExecutablePath, v70[1]);
  objc_storeStrong((id *)&self->_parentProcessName, v70[0]);
  -[NSString lastPathComponent](self->_parentExecutablePath, "lastPathComponent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
    objc_storeStrong((id *)&self->_parentProcessName, v31);
  v32 = DWORD1(v71);
  if ((v71 & 4) != 0)
    v33 = 3;
  else
    v33 = 2;
  if ((~(_DWORD)v71 & 3) != 0)
    v34 = 1;
  else
    v34 = v33;
  self->_idleExitStatus = v34;
  v35 = v74[0];
  v36 = DWORD2(v73);
  self->_is64Bit = (BYTE8(v73) & 4) != 0;
  self->_cpuType = v32;
  v37 = HIDWORD(v71);
  self->_pid = DWORD2(v71);
  *(_OWORD *)&self->_physicalFootprint = *(_OWORD *)((char *)v74 + 8);
  self->_ppid = v37;
  self->_taskIsTranslated = (v36 & 0x20000) != 0;
  if (v28)
  {
    if ((int)v29 >= 1)
    {
      v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      environment = self->_environment;
      self->_environment = v38;

      *(_QWORD *)&v77 = 0;
      if (!-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:](self->_memoryCache, "mapAddress:size:returnedAddress:returnedSize:", v28 - v29, v29, &v77, 0)&& v29 >= 5)
      {
        v40 = (const char *)(v77 + 4);
        v41 = 4;
        while (*v40)
        {
          ++v41;
          ++v40;
          if ((_DWORD)v29 == v41)
            goto LABEL_75;
        }
        if (v41 < (int)v29)
        {
          v42 = v41 + 1;
          while ((_DWORD)v29 != v42)
          {
            v43 = *(unsigned __int8 *)++v40;
            ++v42;
            if (v43)
            {
              v44 = v42 - 1;
              if (v35 >= 1)
              {
                for (i = 0; i != v35; ++i)
                {
                  if (v44 >= (int)v29)
                    break;
                  v46 = v40 + 1;
                  while (*v40)
                  {
                    ++v44;
                    ++v40;
                    ++v46;
                    if ((_DWORD)v29 == v44)
                      goto LABEL_75;
                  }
                  if (v44 < (int)v29)
                  {
                    while (1)
                    {
                      v40 = v46;
                      if (++v44 >= (int)v29)
                        break;
                      ++v46;
                      if (*v40)
                        goto LABEL_64;
                    }
                    v44 = v29;
                  }
LABEL_64:
                  ;
                }
              }
              for (; v44 < (int)v29; v44 += v53)
              {
                if (*v40)
                {
                  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v40, strnlen(v40, (int)v29 - v44), 4);
                  v48 = objc_msgSend(v47, "rangeOfString:", CFSTR("="));
                  if (objc_msgSend(v47, "length"))
                    v49 = v48 == 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v49 = 1;
                  if (!v49)
                  {
                    objc_msgSend(v47, "substringToIndex:", v48);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "substringFromIndex:", v48 + 1);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_environment, "setObject:forKeyedSubscript:", v51, v50);

                  }
                  v52 = objc_msgSend(v47, "length");

                  v53 = v52 + 1;
                  v40 += v52 + 1;
                }
                else
                {
                  ++v40;
                  v53 = 1;
                }
              }
              break;
            }
          }
        }
      }
    }
  }
LABEL_75:

  v27 = 1;
LABEL_76:

  return v27;
}

- (void)_libraryLoaded:(_CSTypeRef)a3
{
  void *v4;
  void *v5;
  uint64_t Name;
  __CFString *v7;
  uint64_t v8;
  uint64_t Path;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t CFUUIDBytes;
  void *v14;
  uint64_t Architecture;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = (void *)MEMORY[0x1A85A9758](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Name = CSSymbolOwnerGetName();
  if (Name)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", Name, 30);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
        v7 = (__CFString *)v8;
      else
        v7 = CFSTR("nonUTF8-binary-name");
    }
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("Identifier"));

  }
  Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", Path, 30);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
        v10 = (__CFString *)v11;
      else
        v10 = CFSTR("nonUTF8-binary-path");
    }
    -[__CFString stringByStandardizingPath](v10, "stringByStandardizingPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("ExecutablePath"));
  }
  CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", CFUUIDBytes, 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("BinaryInfoDwarfUUIDKey"));

  }
  Architecture = CSSymbolOwnerGetArchitecture();
  v16 = macho_arch_name_for_cpu_type(Architecture, SHIDWORD(Architecture));
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("BinaryInfoArchitectureKey"));

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21 = MEMORY[0x1E0C809B0];
  CSSymbolOwnerForeachSection();
  if (v27[3] || v23[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21, 3221225472, __40__VMUProcessDescription__libraryLoaded___block_invoke, &unk_1E4E015D8, &v26, &v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("StartAddress"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23[3] - v27[3] + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("Size"));

  }
  v20 = self->_binaryImages;
  objc_sync_enter(v20);
  -[NSMutableArray addObject:](self->_binaryImages, "addObject:", v5);
  self->_binaryImagePostProcessingComplete = 0;
  objc_sync_exit(v20);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  objc_autoreleasePoolPop(v4);
}

unint64_t __40__VMUProcessDescription__libraryLoaded___block_invoke(uint64_t a1)
{
  const char *Name;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  Name = (const char *)CSRegionGetName();
  if (!strncmp(Name, "__TEXT", 6uLL) || (result = strcmp(Name, "MACH_HEADER"), !(_DWORD)result))
  {
    result = CSRegionGetRange();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v5 + 24) - 1 >= result)
      *(_QWORD *)(v5 + 24) = result;
    v6 = v4 + result - 1;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v6 > *(_QWORD *)(v7 + 24))
      *(_QWORD *)(v7 + 24) = v6;
  }
  return result;
}

- (id)date
{
  return self->_date;
}

- (unsigned)task
{
  return -[VMUTaskMemoryCache taskPort](self->_memoryCache, "taskPort");
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)is64Bit
{
  return self->_is64Bit;
}

- (BOOL)isTranslated
{
  return self->_taskIsTranslated;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (id)processName
{
  return self->_processName;
}

- (id)processIdentifier
{
  void *v3;

  -[VMUProcessDescription bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[VMUProcessDescription processName](self, "processName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)parentPid
{
  return self->_ppid;
}

- (id)parentProcessName
{
  return self->_parentProcessName;
}

- (id)parentProcessPath
{
  return self->_parentExecutablePath;
}

- (id)processVersionDictionary
{
  NSDictionary **p_lsApplicationInformation;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_lsApplicationInformation = &self->_lsApplicationInformation;
  -[NSDictionary objectForKey:](self->_lsApplicationInformation, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](*p_lsApplicationInformation, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v19 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[VMUProcessDescription binaryImages](self, "binaryImages");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      v17 = CFSTR("ShortVersionString");
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[VMUProcessDescription processIdentifier](self, "processIdentifier", v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("Identifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v12)
          {
            if (!v4)
            {
              objc_msgSend(v9, "objectForKey:", CFSTR("Version"));
              v4 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (!v19)
            {
              objc_msgSend(v9, "objectForKey:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v19, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("shortVersion"));

  }
  if (v4)
  {
    objc_msgSend(v4, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("version"));

  }
  return v13;
}

- (id)_sanitizeVersion:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), CFSTR("["));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), CFSTR("]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    v6 = v3;
  }
  else
  {
    v6 = CFSTR("???");
  }

  return v6;
}

- (id)processVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[VMUProcessDescription processVersionDictionary](self, "processVersionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("shortVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    -[VMUProcessDescription _sanitizeVersion:](self, "_sanitizeVersion:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUProcessDescription _sanitizeVersion:](self, "_sanitizeVersion:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%@)"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VMUProcessDescription _sanitizeVersion:](self, "_sanitizeVersion:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)executablePath
{
  return self->_executablePath;
}

- (id)bundleIdentifier
{
  return -[NSDictionary objectForKey:](self->_lsApplicationInformation, "objectForKey:", *MEMORY[0x1E0C9AE78]);
}

- (BOOL)isAppleApplication
{
  VMUProcessDescription *v2;
  void *v3;
  char v4;
  void *v5;

  v2 = self;
  -[VMUProcessDescription bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."));

  -[VMUProcessDescription executablePath](v2, "executablePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "hasPrefix:", CFSTR("/System/"));

  return v2 | v4;
}

- (id)_bundleLock
{
  if (-[VMUProcessDescription _bundleLock]::onceToken != -1)
    dispatch_once(&-[VMUProcessDescription _bundleLock]::onceToken, &__block_literal_global_4);
  return (id)-[VMUProcessDescription _bundleLock]::_bundleLock;
}

void __36__VMUProcessDescription__bundleLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
  v1 = (void *)-[VMUProcessDescription _bundleLock]::_bundleLock;
  -[VMUProcessDescription _bundleLock]::_bundleLock = (uint64_t)v0;

}

- (id)binaryImages
{
  VMUProcessDescription *v2;
  void *v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  VMUProcessDescription *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  CFURLRef v14;
  __CFBundle *v15;
  __CFBundle *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFAllocator *allocator;
  void *v31;
  void *v32;

  v2 = self;
  -[VMUProcessDescription setCrashReporterInfo](self, "setCrashReporterInfo");
  if (!v2->_binaryImagePostProcessingComplete)
  {
    -[VMUProcessDescription _bundleLock](v2, "_bundleLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");

    v4 = v2->_binaryImages;
    objc_sync_enter(v4);
    v5 = (void *)-[NSMutableArray mutableCopy](v2->_binaryImages, "mutableCopy");
    objc_sync_exit(v4);

    objc_msgSend(v5, "objectEnumerator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v31 = v5;
    while (1)
    {
      objc_msgSend(v32, "nextObject", allocator);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(v5, "sortUsingFunction:context:", _compareBinaryImageDicts, 0);
        v2->_binaryImagePostProcessingComplete = 1;
        objc_storeStrong((id *)&v2->_sortedBinaryImages, v5);
        -[VMUProcessDescription _bundleLock](v2, "_bundleLock");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "unlock");

        goto LABEL_40;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("ExecutablePath"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v2;
      -[NSDictionary objectForKey:](v2->_binaryImageHints, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("ShortVersionString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_5;
      v14 = CFURLCreateWithFileSystemPath(allocator, v8, kCFURLPOSIXPathStyle, 1u);
      if (!v14)
        break;
      v15 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
      v16 = v15;
      if (v15)
      {
        objc_msgSend((id)CFBundleGetValueForInfoDictionaryKey(v15, CFSTR("CFBundleShortVersionString")), "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v17, "copy");

        objc_msgSend((id)CFBundleGetValueForInfoDictionaryKey(v16, CFSTR("CFBundleVersion")), "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v18, "copy");

        -[__CFString description]((id)CFBundleGetIdentifier(v16), "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v19, "copy");

        CFRelease(v16);
      }
      else
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
      }
      CFRelease(v14);
LABEL_12:
      objc_msgSend(v7, "objectForKey:", CFSTR("SourceVersion"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v12 && v20)
        v12 = v20;
      if (v13
        || (-[__CFString lastPathComponent](v8, "lastPathComponent"),
            (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("Identifier"));
      }
      if (v12)
        objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("Version"));
      if (v11)
        objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("ShortVersionString"));
      objc_msgSend(v10, "objectForKey:", CFSTR("IsAppleCode"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("IsAppleCode"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "BOOLValue");

      }
      else
      {
        v24 = (objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
           || (objc_msgSend(v13, "hasPrefix:", CFSTR("commpage")) & 1) != 0
           || (objc_msgSend(v13, "isEqualToString:", CFSTR("Ozone")) & 1) != 0
           || objc_msgSend(v13, "isEqualToString:", CFSTR("Motion"));
        if ((-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("/System")) & 1) != 0
          || -[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("/usr/lib")))
        {
          v24 = 1;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("IsAppleCode"));

      objc_msgSend(v10, "objectForKey:", CFSTR("DisplayName"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        objc_msgSend(v10, "objectForKey:", CFSTR("DisplayName"));
      else
        -[__CFString lastPathComponent](v8, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v7, "setObject:forKey:", v27, CFSTR("DisplayName"));

      v6 = v7;
      v5 = v31;
      v2 = v9;
    }
    v11 = 0;
LABEL_5:
    v12 = 0;
    v13 = 0;
    goto LABEL_12;
  }
LABEL_40:
  -[VMUProcessDescription cleansePathsIncludingBinaryImageList:](v2, "cleansePathsIncludingBinaryImageList:", 1);
  -[VMUProcessDescription clearCrashReporterInfo](v2, "clearCrashReporterInfo");
  return v2->_sortedBinaryImages;
}

- (id)binaryImageDictionaryForAddress:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[VMUProcessDescription binaryImages](self, "binaryImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  while (1)
  {
    objc_msgSend(v5, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "objectForKey:", CFSTR("StartAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("Size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    v6 = v7;
    if (v9 <= a3)
    {
      v6 = v7;
      if (v11 + v9 >= a3)
      {
        v12 = v7;
        break;
      }
    }
  }

  return v7;
}

- (id)valueForEnvVar:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *environment;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  VMUProcInfo *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_taskIsCorpseOrCore && !self->_environment)
  {
    v20 = v4;
    v19 = (void *)MEMORY[0x1A85A9758]();
    v21 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", self->_pid);
    -[VMUProcInfo envVars](v21, "envVars");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      environment = self->_environment;
      self->_environment = v6;

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = v22;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v19);
      if (v9)
      {
        v10 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("="));
            if (objc_msgSend(v12, "length"))
              v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
            else
              v14 = 1;
            if (!v14)
            {
              objc_msgSend(v12, "substringToIndex:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "substringFromIndex:", v13 + 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_environment, "setObject:forKeyedSubscript:", v16, v15);

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v9);
      }

    }
    v5 = v20;
    objc_autoreleasePoolPop(v19);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_environment, "objectForKeyedSubscript:", v5, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_cpuTypeDescription
{
  uint64_t cpuType;
  __CFString *v4;
  uint64_t v6;

  cpuType = self->_cpuType;
  if ((int)cpuType <= 16777222)
  {
    switch((_DWORD)cpuType)
    {
      case 7:
        return CFSTR("X86");
      case 0xC:
        return CFSTR("ARM");
      case 0x12:
        return CFSTR("PPC");
    }
    goto LABEL_18;
  }
  if ((int)cpuType > 16777233)
  {
    if ((_DWORD)cpuType == 33554444)
      return CFSTR("ARM64_32");
    if ((_DWORD)cpuType == 16777234)
      return CFSTR("PPC-64");
    goto LABEL_18;
  }
  if ((_DWORD)cpuType == 16777223)
    return CFSTR("X86-64");
  if ((_DWORD)cpuType != 16777228)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08X"), cpuType);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v4 = CFSTR("ARM64");
  if ((CSIsNull() & 1) != 0)
    return v4;
  if (CSSymbolicatorGetArchitecture() == 0x20100000CLL)
  {
    v4 = CFSTR("ARM64E");
  }
  else if (CSArchitectureIsX86_64())
  {
    v4 = CFSTR("X86-64");
  }
  if (!self->_taskIsTranslated)
    return v4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ (translated)"), v4);
LABEL_24:
  v4 = (__CFString *)v6;
  return v4;
}

- (id)_binaryImagesDescriptionForRanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  unsigned int i;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  id v31;
  void *v32;
  id v33;
  VMUProcessDescription *v34;
  void *v35;
  __CFString *v36;
  void *v37;

  v4 = a3;
  v34 = self;
  self = (VMUProcessDescription *)((char *)self + 56);
  CSRelease();
  self->super.isa = 0;
  self->_memoryCache = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](v34->_unreadableBinaryImagePaths, "count"))
  {
    objc_msgSend(v33, "appendString:", CFSTR("Unreadable Binary Images:\n"));
    -[NSArray componentsJoinedByString:](v34->_unreadableBinaryImagePaths, "componentsJoinedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendString:", v5);

  }
  -[VMUProcessDescription binaryImages](v34, "binaryImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v33, "appendString:", CFSTR("Binary Images:\n"));
    -[VMUProcessDescription binaryImages](v34, "binaryImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v31 = v4;
    v32 = v9;
    while (1)
    {
      v11 = v10;
      objc_msgSend(v9, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      v12 = (void *)MEMORY[0x1A85A9758]();
      objc_msgSend(v10, "objectForKey:", CFSTR("Identifier"));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("ExecutablePath"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("BinaryInfoDwarfUUIDKey"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("Size"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedLongLongValue");

      objc_msgSend(v10, "objectForKey:", CFSTR("IsAppleCode"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      objc_msgSend(v10, "objectForKey:", CFSTR("StartAddress"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, "unsignedLongLongValue");
        if (!v4 || objc_msgSend(v4, "indexForLocation:", v19) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "length"))
          {
            objc_msgSend(v20, "appendString:", CFSTR("<"));
            v21 = objc_retainAutorelease(v37);
            v22 = objc_msgSend(v21, "bytes");
            for (i = 0; objc_msgSend(v21, "length") > (unint64_t)i; ++i)
              objc_msgSend(v20, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v22 + i));
            v4 = v31;
            objc_msgSend(v20, "appendString:", CFSTR("> "));
          }
          objc_msgSend(v10, "objectForKey:", CFSTR("BinaryInfoArchitectureKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          v27 = CFSTR("+");
          if (v16)
            v27 = CFSTR(" ");
          v28 = v36;
          if (!v36)
            v28 = CFSTR("???");
          if (v34->_is64Bit)
            v29 = CFSTR("%#18qx - %#18qx %@%@ %@%@ %@%@\n");
          else
            v29 = CFSTR("%#10lx - %#10lx %@%@ %@%@ %@%@\n");
          objc_msgSend(v33, "appendFormat:", v29, v19, v14 + v19 - 1, v27, v28, v25, &stru_1E4E04720, v20, v35);

          v9 = v32;
        }
      }

      objc_autoreleasePoolPop(v12);
    }

  }
  else
  {
    objc_msgSend(v33, "appendString:", CFSTR("Binary images description not available\n\n"));
  }

  return v33;
}

- (id)_rangesOfBinaryImages:(id)a3 forBacktraces:(id)a4
{
  id v5;
  uint64_t v6;
  VMURangeArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  id v33;
  uint64_t v34;
  id obj;
  id obja;
  VMURangeArray *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v5 = a4;
  if (!v5)
    goto LABEL_30;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v5;
      goto LABEL_6;
    }
LABEL_30:
    v37 = 0;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v6;
LABEL_6:
  v7 = objc_alloc_init(VMURangeArray);
  v37 = objc_alloc_init(VMURangeArray);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v33;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", CFSTR("StartAddress"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = objc_msgSend(v12, "unsignedLongLongValue");
          objc_msgSend(v11, "objectForKey:", CFSTR("Size"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedLongLongValue");

          -[VMURangeArray addRange:](v7, "addRange:", v14, v16);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obja = v32;
  v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      v34 = v17;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(obja);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v20;
          v22 = (uint64_t *)objc_msgSend(v21, "backtrace");
          v23 = objc_msgSend(v21, "backtraceLength");
          v24 = v18;
          if (v23)
          {
            v25 = v23;
            do
            {
              v26 = *v22++;
              v27 = -[VMURangeArray indexForLocation:](v7, "indexForLocation:", v26);
              if (v27 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v28 = -[VMURangeArray rangeAtIndex:](v7, "rangeAtIndex:", v27);
                v30 = v29;
                -[VMURangeArray removeRangeAtIndex:](v7, "removeRangeAtIndex:", v27);
                -[VMURangeArray addRange:](v37, "addRange:", v28, v30);
              }
              --v25;
            }
            while (v25);
          }

          v18 = v24;
          v17 = v34;
        }
        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v17);
  }

  v5 = obja;
LABEL_31:

  return v37;
}

- (id)binaryImagesDescriptionForBacktraces:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A9758]();
  -[VMUProcessDescription binaryImages](self, "binaryImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessDescription _rangesOfBinaryImages:forBacktraces:](self, "_rangesOfBinaryImages:forBacktraces:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMUProcessDescription _binaryImagesDescriptionForRanges:](self, "_binaryImagesDescriptionForRanges:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)binaryImagesDescription
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1A85A9758](self, a2);
  -[VMUProcessDescription _binaryImagesDescriptionForRanges:](self, "_binaryImagesDescriptionForRanges:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)_buildVersionDictionary
{
  return self->_buildVersionDictionary;
}

- (id)_buildInfoDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ProjectName"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("SourceVersion"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("BuildVersion"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v10 = CFSTR("Unknown");
    if (v5)
      v11 = v5;
    else
      v11 = CFSTR("Unknown");
    if (v7)
      v12 = v7;
    else
      v12 = CFSTR("Unknown");
    if (v9)
      v10 = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@~%@"), v11, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_osVersionDictionary
{
  NSDictionary *osVersionDictionary;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  void *v7;

  osVersionDictionary = self->_osVersionDictionary;
  if (!osVersionDictionary)
  {
    -[VMUProcessDescription _bundleLock](self, "_bundleLock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lock");

    _CRGetOSVersionDictionary();
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_osVersionDictionary;
    self->_osVersionDictionary = v5;

    -[VMUProcessDescription _bundleLock](self, "_bundleLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

    osVersionDictionary = self->_osVersionDictionary;
  }
  return osVersionDictionary;
}

- (id)_systemVersionDescription
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  -[VMUProcessDescription _osVersionDictionary](self, "_osVersionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AB98]);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AB90]);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("???");
  if (v4)
    v7 = v4;
  else
    v7 = CFSTR("???");
  if (v3)
    v8 = v3;
  else
    v8 = CFSTR("???");
  if (v5)
    v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (%@)"), v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)processDescriptionHeader
{
  void *v3;
  uint64_t v4;
  uint64_t pid;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int platform;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  int ppid;
  __CFString *v17;
  void *v19;
  unint64_t executableLoadAddress;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendFormat:", CFSTR("Hardware Model:  %@\n"), self->_hardwareModel);
  -[VMUProcessDescription _buildInfoDescription](self, "_buildInfoDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v3;
  -[VMUProcessDescription processName](self, "processName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v27, "length");
  if (v4)
  {
    -[VMUProcessDescription processName](self, "processName");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = CFSTR("???");
  }
  pid = self->_pid;
  v26 = v4;
  if ((_DWORD)pid)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), pid);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = CFSTR("Unknown");
  }
  v25 = pid;
  -[VMUProcessDescription executablePath](self, "executablePath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v24, "length");
  if (v6)
  {
    -[VMUProcessDescription executablePath](self, "executablePath");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("???");
  }
  executableLoadAddress = self->_executableLoadAddress;
  v23 = v6;
  -[VMUProcessDescription processIdentifier](self, "processIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v22, "length");
  if (v7)
  {
    -[VMUProcessDescription processIdentifier](self, "processIdentifier");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = CFSTR("???");
  }
  v21 = v7;
  -[VMUProcessDescription processVersion](self, "processVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "length");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Build Info:      %@\n"), v3);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = &stru_1E4E04720;
  }
  -[VMUProcessDescription _cpuTypeDescription](self, "_cpuTypeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  platform = self->_platform;
  if (platform)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    VMUPlatformNameForPlatform(self->_platform);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Platform:        %@\n"), v19);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1E4E04720;
  }
  -[VMUProcessDescription parentProcessName](self, "parentProcessName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  if (v14)
  {
    -[VMUProcessDescription parentProcessName](self, "parentProcessName");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("???");
  }
  ppid = self->_ppid;
  if (ppid)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_ppid);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("Unknown");
  }
  objc_msgSend(v35, "appendFormat:", CFSTR("Process:         %@ [%@]\nPath:            %@\nLoad Address:    %#qx\nIdentifier:      %@\nVersion:         %@\n%@Code Type:       %@\n%@Parent Process:  %@ [%@]\n"), v33, v32, v31, executableLoadAddress, v30, v34, v29, v9, v12, v15, v17);
  if (ppid)

  if (v14)
  if (platform)
  {

  }
  if (v8)

  if (v21)
  if (v23)

  if (v25)
  if (v26)

  return v35;
}

- (id)dateAndVersionDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS ZZZ"));
  objc_msgSend(v3, "stringFromDate:", self->_date);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)self->_proc_starttime.tv_usec / 1000000.0 + (double)self->_proc_starttime.tv_sec);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VMUProcessDescription _systemVersionDescription](self, "_systemVersionDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Date/Time:       %@\nLaunch Time:     %@\nOS Version:      %@\nReport Version:  %d\n"), v4, v6, v8, 104);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)processStatisticsDescription
{
  void *physicalFootprint;
  unsigned int idleExitStatus;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  unint64_t v11;
  rusage_info_t buffer[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->_taskIsCorpseOrCore)
  {
    physicalFootprint = (void *)self->_physicalFootprint;
    if (!physicalFootprint)
      return physicalFootprint;
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)buffer = 0u;
    if (proc_pid_rusage(self->_pid, 6, buffer))
      goto LABEL_13;
    physicalFootprint = (void *)*((_QWORD *)&v16 + 1);
    v11 = v27;
    self->_physicalFootprint = *((_QWORD *)&v16 + 1);
    self->_physicalFootprintPeak = v11;
    if (!physicalFootprint)
      return physicalFootprint;
  }
  if (!self->_physicalFootprintPeak)
  {
LABEL_13:
    physicalFootprint = 0;
    return physicalFootprint;
  }
  idleExitStatus = self->_idleExitStatus;
  v5 = "untracked";
  v6 = "clean";
  if (idleExitStatus == 3)
    v6 = "dirty";
  if (idleExitStatus != 1)
    v5 = v6;
  if (idleExitStatus)
    v7 = v5;
  else
    v7 = "unknown";
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = VMUMemorySizeString(physicalFootprint);
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Physical footprint:         %s\nPhysical footprint (peak):  %s\nIdle exit:                  %s\n"), v9, VMUMemorySizeString(self->_physicalFootprintPeak), v7);
  physicalFootprint = (void *)objc_claimAutoreleasedReturnValue();
  return physicalFootprint;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A85A9758]();
  -[VMUProcessDescription processDescriptionHeader](self, "processDescriptionHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[VMUProcessDescription dateAndVersionDescription](self, "dateAndVersionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  -[VMUProcessDescription processStatisticsDescription](self, "processStatisticsDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    objc_msgSend(v3, "appendString:", v7);
  }
  objc_msgSend(v3, "appendString:", CFSTR("----\n"));
  objc_msgSend(v3, "appendString:", CFSTR("\n"));

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)dealloc
{
  NSMutableArray *v3;
  NSMutableArray *binaryImages;
  objc_super v5;

  -[VMUProcessDescription setCrashReporterInfo](self, "setCrashReporterInfo");
  CSRelease();
  self->_symbolicator._opaque_1 = 0;
  self->_symbolicator._opaque_2 = 0;
  v3 = self->_binaryImages;
  objc_sync_enter(v3);
  binaryImages = self->_binaryImages;
  self->_binaryImages = 0;

  objc_sync_exit(v3);
  -[VMUProcessDescription clearCrashReporterInfo](self, "clearCrashReporterInfo");
  v5.receiver = self;
  v5.super_class = (Class)VMUProcessDescription;
  -[VMUProcessDescription dealloc](&v5, sel_dealloc);
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprintPeak;
}

- (unsigned)idleExitStatus
{
  return self->_idleExitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_parentExecutablePath, 0);
  objc_storeStrong((id *)&self->_parentProcessName, 0);
  objc_storeStrong((id *)&self->_osVersionDictionary, 0);
  objc_storeStrong((id *)&self->_buildVersionDictionary, 0);
  objc_storeStrong((id *)&self->_unreadableBinaryImagePaths, 0);
  objc_storeStrong((id *)&self->_binaryImageHints, 0);
  objc_storeStrong((id *)&self->_sortedBinaryImages, 0);
  objc_storeStrong((id *)&self->_binaryImages, 0);
  objc_storeStrong((id *)&self->_lsApplicationInformation, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end
