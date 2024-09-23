@implementation PASFileUtils

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to initialize dirent db: %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

void __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  dirent *v3;
  dirent *v4;
  const char *d_name;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int *v20;
  char *v21;
  int v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  __int128 v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;
  _QWORD v32[3];

  v2 = MEMORY[0x1E0C809B0];
  v32[1] = *MEMORY[0x1E0C80C00];
  v23 = *MEMORY[0x1E0CB2D68];
  while (1)
  {
    *__error() = 0;
    v3 = readdir(*(DIR **)(a1 + 56));
    if (!v3)
      break;
    v4 = v3;
    d_name = v3->d_name;
    if (strcmp(v3->d_name, "."))
    {
      if (strcmp(d_name, ".."))
      {
        v6 = *(_QWORD *)(a1 + 40);
        if (!v6 || (*(unsigned int (**)(uint64_t, dirent *))(v6 + 16))(v6, v4))
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = 0;

          v9 = *(void **)(a1 + 32);
          v25[1] = 3221225472;
          v25[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2;
          v25[3] = &__block_descriptor_56_e29_v16__0___PASSqliteStatement_8l;
          v25[4] = v4;
          v26 = *(_OWORD *)(a1 + 64);
          v24[0] = v2;
          v24[1] = 3221225472;
          v24[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_3;
          v24[3] = &unk_1E4430768;
          v24[4] = *(_QWORD *)(a1 + 48);
          v25[0] = v2;
          v10 = objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO dirents (name,  dirent) VALUES (:name, :dirent)"), v25, 0, v24);
          v11 = *(_QWORD *)(a1 + 48);
          if ((v10 & 1) == 0 && !*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to insert dirent for unknown reason", buf, 2u);
            }
            v31 = v23;
            v32[0] = CFSTR("_PASFileUtils failed to insert dirent for unknown reason");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("_PASFileUtilsErrorDomain"), 1, v12);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

            v11 = *(_QWORD *)(a1 + 48);
          }
          if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40))
            return;
        }
      }
    }
  }
  if (*__error())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      v21 = strerror(*v20);
      v22 = *__error();
      *(_DWORD *)buf = 136315394;
      v28 = v21;
      v29 = 1024;
      v30 = v22;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed on readdir: %s (%d)", buf, 0x12u);
    }
    v16 = __error();
    posixError(*v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_28(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v7;
  unsigned __int8 v8;
  _BYTE v9[1048];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], a1[6], CFSTR("_PASFileUtils.m"), 115, CFSTR("Read nil blob from dirents query"));

  }
  bzero(v9, 0x418uLL);
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  __memcpy_chk();
  (*(void (**)(void))(a1[4] + 16))();
  v5 = v8;

  return v5;
}

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2_32(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to read dirent row: %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

void __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2(_QWORD *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(unsigned __int16 *)(a1[4] + 18);
  if (v3 >= 0x403)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], a1[6], CFSTR("_PASFileUtils.m"), 78, CFSTR("Bogus dirent size"));

  }
  v4 = v3 + 22;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1[4] + 21);
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":name", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a1[4], v4);
  objc_msgSend(v8, "bindNamedParam:toNSData:", ":dirent", v6);

}

uint64_t __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to insert dirent: %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

@end
