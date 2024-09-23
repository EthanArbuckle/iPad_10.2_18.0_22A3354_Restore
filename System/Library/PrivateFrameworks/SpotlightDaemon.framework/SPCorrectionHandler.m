@implementation SPCorrectionHandler

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_12);
  return (id)sharedHandler_handler;
}

void __36__SPCorrectionHandler_sharedHandler__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedHandler_handler;
  sharedHandler_handler = v0;

}

- (SPCorrectionHandler)init
{
  SPCorrectionHandler *v2;
  const __CFURL *v3;
  const __CFString *v4;
  CFMutableStringRef MutableCopy;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFDictionaryValueCallBacks v13;
  stat v14;
  objc_super v15;
  char buffer[16];
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
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)SPCorrectionHandler;
  v2 = -[SPCorrectionHandler init](&v15, sel_init);
  if (v2)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    *(_OWORD *)buffer = 0u;
    v17 = 0u;
    v3 = CFCopyHomeDirectoryURL();
    v4 = CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
    MutableCopy = CFStringCreateMutableCopy(0, 0, v4);
    CFStringAppend(MutableCopy, CFSTR("/Library/Spotlight/Corrections"));
    CFStringGetFileSystemRepresentation(MutableCopy, buffer, 256);
    memset(&v14, 0, sizeof(v14));
    if (stat(buffer, &v14))
      mkdir(buffer, 0x1FFu);
    -[SPCorrectionHandler setDictDirFd:](v2, "setDictDirFd:", open(buffer, 0x100000));
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("/correction_version.txt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCorrectionHandler setVersionInfoLocation:](v2, "setVersionInfoLocation:", v9);

    *(_OWORD *)&v13.version = xmmword_24D0EE3C8;
    *(_OWORD *)&v13.release = *(_OWORD *)&off_24D0EE3D8;
    v13.equal = 0;
    -[SPCorrectionHandler setCorrectionRefs:](v2, "setCorrectionRefs:", CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], &v13));
    v10 = (void *)objc_opt_new();
    -[SPCorrectionHandler setCorrectionRefsLock:](v2, "setCorrectionRefsLock:", v10);

    -[SPCorrectionHandler readCommittedVersions](v2, "readCommittedVersions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCorrectionHandler setLastCommittedVersions:](v2, "setLastCommittedVersions:", v11);

    CFRelease(v4);
    CFRelease(v3);
    CFRelease(MutableCopy);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  close(-[SPCorrectionHandler dictDirFd](self, "dictDirFd"));
  v3.receiver = self;
  v3.super_class = (Class)SPCorrectionHandler;
  -[SPCorrectionHandler dealloc](&v3, sel_dealloc);
}

- (id)versionForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SPCorrectionHandler lastCommittedVersions](self, "lastCommittedVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getCorrections:(id)a3 forLanguage:(id)a4 version:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[SPCorrectionHandler lastCommittedVersions](self, "lastCommittedVersions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SPCorrectionHandler lastCommittedVersions](self, "lastCommittedVersions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SPCorrectionHandler correctionRefsLock](self, "correctionRefsLock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lock");

      -[SPCorrectionHandler openCorrectionRef:language:create:](self, "openCorrectionRef:language:create:", v12, v9, 0);
      v14 = (void *)SICopyCorrections();
      *a5 = objc_retainAutorelease(v12);
      -[SPCorrectionHandler correctionRefsLock](self, "correctionRefsLock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unlock");

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateWithFilePath:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingAtPath:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SPCorrectionHandler updateWithFileHandle:](self, "updateWithFileHandle:", v4);

}

- (void)updateWithFileHandle:(id)a3
{
  id v4;
  SPCorrectionHandler *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_INFO, "Processing corrections begin", buf, 2u);
  }

  -[SPCorrectionHandler processCorrectionsWithHandle:](v5, "processCorrectionsWithHandle:", v4);
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Processing corrections complete", v8, 2u);
  }

  objc_sync_exit(v5);
}

- (BOOL)sanityCheckFile:(__sFILE *)a3
{
  NSObject *v4;
  char v5;
  NSObject *v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE __ptr[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    bzero(__ptr, 0x400uLL);
    if (fread(__ptr, 1uLL, 0x400uLL, a3))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ptr, 1);
      v4 = objc_claimAutoreleasedReturnValue();
      rewind(a3);
      v5 = -[NSObject containsString:](v4, "containsString:", CFSTR("\n"));
    }
    else
    {
      logForCSLogCategoryDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[SPCorrectionHandler sanityCheckFile:].cold.2(v4, v14, v15, v16, v17, v18, v19, v20);
      v5 = 0;
    }

  }
  else
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SPCorrectionHandler sanityCheckFile:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    return 0;
  }
  return v5;
}

- (void)processCorrectionsWithHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t *v8;
  int v9;
  int v10;
  off_t st_size;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)();
  void *v17;
  SPCorrectionHandler *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
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
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];
  char v41;
  stat v42;

  v4 = a3;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke;
  v17 = &unk_24D0EE470;
  v20 = &v30;
  v18 = self;
  v21 = &v36;
  v22 = &v24;
  v7 = v6;
  v19 = v7;
  v23 = v40;
  v8 = &v14;
  v9 = objc_msgSend(v4, "fileDescriptor", v14, v15);
  v10 = v9;
  if (v9 != -1)
  {
    memset(&v42, 0, sizeof(v42));
    fstat(v9, &v42);
    st_size = v42.st_size;
    v12 = mmap(0, v42.st_size, 1, 1, v10, 0);
    v13 = v12;
    if (v12 != (void *)-1)
    {
      madvise(v12, st_size, 2);
      ((void (*)(uint64_t *, void *, off_t))v16)(v8, v13, st_size);
      munmap(v13, st_size);
    }
  }

  if (v37[3])
  {
    if (v25[5] && v31[5])
      -[SPCorrectionHandler commitDictionary:language:version:](self, "commitDictionary:language:version:");
    SICorrectionDestory();
  }
  -[SPCorrectionHandler revokeUnusedFiles](self, "revokeUnusedFiles");

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);

}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  __int128 v22;
  _QWORD v23[5];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  _QWORD v43[7];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[3];
  int v47;
  _BYTE v48[24576];
  _QWORD v49[5];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v49[3] = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_2;
  v27[3] = &unk_24D0EE3F8;
  v27[4] = *(_QWORD *)(v0 + 48);
  v7 = (void *)MEMORY[0x2199C2F34](v27);
  v24[0] = v6;
  v24[1] = 3221225472;
  v8 = *(_OWORD *)(v5 + 56);
  v24[2] = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_3;
  v24[3] = &unk_24D0EE420;
  v24[4] = *(_QWORD *)(v5 + 32);
  v26 = v8;
  v22 = *(_OWORD *)(v5 + 40);
  v9 = (id)v22;
  v25 = v22;
  v10 = (void *)MEMORY[0x2199C2F34](v24);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_4;
  v23[3] = &unk_24D0EE448;
  v23[4] = *(_QWORD *)(v5 + 56);
  v11 = (void *)MEMORY[0x2199C2F34](v23);
  v12 = v7;
  v13 = v10;
  v14 = v11;
  memset(v49, 0, 24);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = -1;
  bzero(v48, 0x6000uLL);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = v48;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3810000000;
  v43[3] = &unk_213D92C0A;
  v43[5] = 0;
  v43[6] = 0;
  v43[4] = 1;
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __si_process_corrections_block_invoke;
  v29[3] = &unk_24D0EE498;
  v33 = v46;
  v34 = v44;
  v15 = v14;
  v30 = v15;
  v35 = v43;
  v36 = v45;
  v37 = v49;
  v38 = "";
  v39 = "q";
  v40 = "c";
  v41 = "version";
  v42 = "language";
  v16 = v13;
  v31 = v16;
  v17 = v12;
  v32 = v17;
  v18 = (void *)MEMORY[0x2199C2F34](v29);
  v19 = v4 + v2;
  do
  {
    v20 = v4;
    if (v4 >= v19)
      break;
    v28 = 0;
    v21 = json_parse();
    v4 += v28;
  }
  while ((v21 & 1) != 0);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v46, 8);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 72) + 8) + 24) = v20 >= v19;
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  json_utf8_string(a2, v8, 0x100uLL);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a3 = 1;
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _OWORD v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    memset(v12, 0, sizeof(v12));
    json_utf8_string(a2, v12, 0x100uLL);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "lastCommittedVersions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if ((v9 & 1) == 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        objc_msgSend(*(id *)(a1 + 32), "commitDictionary:language:version:");
      SICorrectionDestory();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
      if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))
      {
        objc_msgSend(*(id *)(a1 + 32), "correctionRefsLock");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lock");

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "openCorrectionRef:language:create:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)+ 8)+ 40), 1);
        objc_msgSend(*(id *)(a1 + 32), "correctionRefsLock");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unlock");

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))*a3 = 1;
        }
      }
    }

  }
  else
  {
    *a3 = 1;
  }
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  void *i;
  void *v11;
  _BYTE v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  bzero(v12, 0x400uLL);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v8 = (void *)MEMORY[0x2199C2D78]();
    json_utf8_string(a2, v12, 0x400uLL);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4);
      for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
      {
        json_utf8_string(a3, v12, 0x400uLL);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(i, "addObject:", v11);

        a3 += 24;
      }
      if (objc_msgSend(i, "count"))
        SIAddCorrection();

    }
    objc_autoreleasePoolPop(v8);
  }
}

- (void)openCorrectionRef:(id)a3 language:(id)a4 create:(BOOL)a5
{
  id v8;
  void *v9;
  const void *Value;
  NSObject *v12;
  uint64_t v13;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  Value = CFDictionaryGetValue(-[SPCorrectionHandler correctionRefs](self, "correctionRefs"), v9);
  if (Value
    || (-[SPCorrectionHandler dictDirFd](self, "dictDirFd"), (Value = (const void *)SICorrectionCreate()) != 0))
  {
    if (!a5)
LABEL_4:
      CFDictionaryAddValue(-[SPCorrectionHandler correctionRefs](self, "correctionRefs"), v9, Value);
  }
  else
  {
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SPCorrectionHandler openCorrectionRef:language:create:].cold.1((uint64_t)v8, v12, v13);

    Value = 0;
    if (!a5)
      goto LABEL_4;
  }

  return (void *)Value;
}

- (id)readCommittedVersions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SPCorrectionHandler versionInfoLocation](self, "versionInfoLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v4, "stringWithContentsOfFile:encoding:error:", v6, 1, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v8)
  {
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SPCorrectionHandler readCommittedVersions].cold.1(self, v9);
    v10 = 0;
  }
  else
  {
    v20 = v7;
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
    v9 = objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setValue:forKey:", v17, v18);

          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }
    v10 = v3;
    v7 = v20;
  }

  return v10;
}

- (void)writeCommittedVersions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__SPCorrectionHandler_writeCommittedVersions___block_invoke;
  v14[3] = &unk_24D0ED5E0;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);

  -[SPCorrectionHandler versionInfoLocation](self, "versionInfoLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "writeToFile:atomically:encoding:error:", v9, 1, 1, &v13);
  v10 = v13;

  if (v10)
  {
    logForCSLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SPCorrectionHandler writeCommittedVersions:].cold.1((uint64_t)v10, v11, v12);

  }
}

uint64_t __46__SPCorrectionHandler_writeCommittedVersions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:%@\n"), a2, a3);
}

- (void)commitDictionary:(void *)a3 language:(id)a4 version:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SPCorrectionHandler readCommittedVersions](self, "readCommittedVersions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setValue:forKey:", v7, v9);
  SICorrectionCommit();
  -[SPCorrectionHandler writeCommittedVersions:](self, "writeCommittedVersions:", v8);

}

- (void)revokeUnusedFiles
{
  SPCorrectionHandler *v2;
  void *v3;
  CFStringRef v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  SPCorrectionHandler *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  _OWORD buffer[16];
  uint64_t v41;

  v2 = self;
  v41 = *MEMORY[0x24BDAC8D0];
  -[SPCorrectionHandler readCommittedVersions](self, "readCommittedVersions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCorrectionHandler correctionRefsLock](v2, "correctionRefsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  memset(buffer, 0, sizeof(buffer));
  fcntl(-[SPCorrectionHandler dictDirFd](v2, "dictDirFd"), 50, buffer);
  v4 = CFStringCreateWithFileSystemRepresentation(0, (const char *)buffer);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBCCD0];
  v39 = *MEMORY[0x24BDBCCD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v9;
  v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v32)
  {
    v27 = v4;
    v28 = v7;
    v11 = 0;
    v31 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      v13 = v11;
      do
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        v33 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v33, v7, 0);
        v11 = v33;

        -[SPCorrectionHandler versionInfoLocation](v2, "versionInfoLocation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v11, "isEqualToString:", v17);

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v19, "count") > 2)
          {
            v20 = v10;
            v21 = v2;
            objc_msgSend(v19, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndex:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "valueForKey:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "isEqualToString:", v24);

            if ((v25 & 1) == 0)
              objc_msgSend(v30, "removeItemAtURL:error:", v14, 0);

            v2 = v21;
            v10 = v20;
            v7 = v28;
          }
          else
          {
            objc_msgSend(v30, "removeItemAtURL:error:", v14, 0);
          }

        }
        ++v12;
        v13 = v11;
      }
      while (v32 != v12);
      v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v32);

    v4 = v27;
  }

  CFRelease(v4);
  CFDictionaryRemoveAllValues(-[SPCorrectionHandler correctionRefs](v2, "correctionRefs"));
  -[SPCorrectionHandler setLastCommittedVersions:](v2, "setLastCommittedVersions:", v29);
  -[SPCorrectionHandler correctionRefsLock](v2, "correctionRefsLock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "unlock");

}

- (NSDictionary)lastCommittedVersions
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastCommittedVersions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)dictDirFd
{
  return self->_dictDirFd;
}

- (void)setDictDirFd:(int)a3
{
  self->_dictDirFd = a3;
}

- (NSURL)versionInfoLocation
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVersionInfoLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSLock)correctionRefsLock
{
  return (NSLock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCorrectionRefsLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (__CFDictionary)correctionRefs
{
  return self->_correctionRefs;
}

- (void)setCorrectionRefs:(__CFDictionary *)a3
{
  self->_correctionRefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionRefsLock, 0);
  objc_storeStrong((id *)&self->_versionInfoLocation, 0);
  objc_storeStrong((id *)&self->_lastCommittedVersions, 0);
}

- (void)sanityCheckFile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, a1, a3, "error downloading corrections file", a5, a6, a7, a8, 0);
}

- (void)sanityCheckFile:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, a1, a3, "error corrections could not fread", a5, a6, a7, a8, 0);
}

- (void)openCorrectionRef:(uint64_t)a1 language:(NSObject *)a2 create:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, a3, "err creating dict version: %@", (uint8_t *)&v3);
}

- (void)readCommittedVersions
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "versionInfoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v5, "could not read version info %@", (uint8_t *)&v6);

}

- (void)writeCommittedVersions:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, a3, "err write version info %@", (uint8_t *)&v3);
}

@end
