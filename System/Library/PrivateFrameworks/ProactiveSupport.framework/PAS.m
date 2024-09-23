@implementation PAS

void ___PAS_sqlite3_bind_nsstring_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___PAS_sqlite3_bind_nsdata_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___PAS_sqlite3_column_nsdata_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    if (a3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;
    }
    else
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = &unk_1EE5A9FD0;
      v6 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = &unk_1EE5A9FD0;
    }

  }
}

void ___PAS_sqlite3_column_nssecurecoding_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0);
    v5 = (void *)MEMORY[0x1A1AFDC98]();
    v6 = *(_QWORD *)(a1 + 32);
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v11);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v11;
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can not unarchive data: %@", buf, 0xCu);
    }

  }
}

@end
