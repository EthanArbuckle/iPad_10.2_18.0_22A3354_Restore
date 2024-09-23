@implementation PASLPWriterV1

void __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _DWORD *v7;
  id v8;
  _QWORD v10[6];

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * objc_msgSend(v4, "count") + 4));
  v7 = (_DWORD *)objc_msgSend(v6, "mutableBytes");
  *v7 = objc_msgSend(v4, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_7;
  v10[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  v10[4] = v7;
  v10[5] = a2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  v8 = objc_retainAutorelease(v6);
  *(_DWORD *)(a2 + 8) = _block_invoke((uint64_t *)a2, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length") | 0x400000000) | 0xE0000000;
  *(_BYTE *)(a2 + 12) = 1;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 32) + 80);

  objc_autoreleasePoolPop(v5);
  return 1;
}

void __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = +[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]((uint64_t)_PASLPWriterV1, v8, **(_QWORD **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 1);
  v7 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * a3 + 4) = v6;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 32) + 88);
  objc_autoreleasePoolPop(v5);

}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_3_72(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _DWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _DWORD *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (8 * objc_msgSend(v4, "count")) | 4));
  v7 = (_DWORD *)objc_msgSend(v6, "mutableBytes");
  *v7 = objc_msgSend(v4, "count");
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(v4, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_77);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_5_78;
  v14[3] = &unk_1E4430E20;
  v16 = a2;
  v17 = v7;
  v11 = v4;
  v15 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v12 = objc_retainAutorelease(v6);
  *(_DWORD *)(a2 + 8) = _block_invoke((uint64_t *)a2, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length") | 0x400000000) | 0xC0000000;
  *(_BYTE *)(a2 + 12) = 1;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 32) + 96);

  objc_autoreleasePoolPop(v5);
  return 1;
}

void __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_5_78(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD value[2];

  v5 = a2;
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_5");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("_PASLPWriterV1.m"), 752, CFSTR("unexpected failure of UTF-8 NSString conversion"));

  }
  v9 = strlen(v8) + 1;
  v10 = **(_QWORD **)(a1 + 40);
  value[0] = v8;
  value[1] = v9 | 0x100000000;
  v11 = CFSetGetValue(*(CFSetRef *)(v10 + 16), value);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_5");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_PASLPWriterV1.m"), 761, CFSTR("failed to find dictionary key \"%@\" in string table"), v7);

  }
  v12 = **(_QWORD ***)(a1 + 40);
  v13 = *v11 - *v12;
  if (v13 < *(unsigned int *)(*v12 + 4) || v13 + v9 > *(unsigned int *)(*v12 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_5");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_PASLPWriterV1.m"), 765, CFSTR("found dictionary key \"%@\" but not contained in string table"), v7);

    v12 = **(_QWORD ***)(a1 + 40);
    v13 = *v11 - *v12;
  }
  v14 = a3 + 1;
  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * (a3 + 1)) = v13 | 0xA0000000;
  ++*(_QWORD *)(v12[4] + 56);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]((uint64_t)_PASLPWriterV1, v15, **(_QWORD **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 1);
  v17 = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v17 + 4 * (objc_msgSend(*(id *)(a1 + 32), "count") + v14)) = v16;

  v18 = *(_QWORD *)(**(_QWORD **)(a1 + 40) + 32);
  ++*(_QWORD *)(v18 + 104);
  objc_autoreleasePoolPop(v6);

}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_4_75(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  v7 = objc_retainAutorelease(v4);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = objc_retainAutorelease(v5);
  v10 = objc_msgSend(v9, "UTF8String");
  v11 = (const char *)v10;
  if (!v8 || !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_4");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_PASLPWriterV1.m"), 743, CFSTR("unexpected failure of UTF-8 NSString conversion"));

  }
  v12 = strcmp(v8, v11);
  objc_autoreleasePoolPop(v6);

  return v12;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_2_68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  int v8;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke_2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_PASLPWriterV1.m"), 716, CFSTR("unexpected failure of UTF-8 NSString conversion"));

  }
  v8 = strlen(v7);
  *(_DWORD *)(a2 + 8) = _block_invoke((uint64_t *)a2, v7, (v8 + 1) | 0x100000000) | 0xA0000000;
  *(_BYTE *)(a2 + 12) = 1;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 32) + 56);
  objc_autoreleasePoolPop(v5);

  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_5(uint64_t a1, _QWORD **a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  id v13;
  void *v15;
  void *v16;
  __int128 value;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length") | 0x2000000000;
  v7 = *a2;
  *(_QWORD *)&value = v5;
  *((_QWORD *)&value + 1) = v6;
  v8 = CFSetGetValue((CFSetRef)v7[2], &value);
  if (v8)
  {
    v9 = *v8 - **a2;
    if ((v9 & 0xFFFFFFFC) != 0)
    {
      v10 = *(unsigned int *)(*v8 - 4);
      if (objc_msgSend(v4, "length") == v10)
      {
        *((_DWORD *)a2 + 2) = (v9 + 2147483644) | 0x80000000;
        *((_BYTE *)a2 + 12) = 1;
      }
    }
    if (!*((_BYTE *)a2 + 12) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(value) = 138412290;
      *(_QWORD *)((char *)&value + 4) = CFSTR("Warning: unexpectedly found aligned data region without matching size prefix.");
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: %@", (uint8_t *)&value, 0xCu);
    }
  }
  v11 = (uint64_t)*a2;
  if (!*((_BYTE *)a2 + 12))
  {
    *(_DWORD *)bumpChecked(v11, 4) = 0;
    alignChecked(*a2, 0x20uLL);
    v12 = (_DWORD *)bumpChecked((uint64_t)*a2, objc_msgSend(v4, "length"));
    *(v12 - 1) = objc_msgSend(v4, "length");
    v13 = objc_retainAutorelease(v4);
    memcpy(v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    cacheBuffer((__CFSet *)(*a2)[2], (*a2)[4], (uint64_t)v12, v6);
    v11 = (uint64_t)*a2;
    *((_DWORD *)a2 + 2) = ((_DWORD)v12 - *(_DWORD *)*a2 + 2147483644) | 0x80000000;
    *((_BYTE *)a2 + 12) = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(v11 + 32) + 64);
  *(_QWORD *)((*a2)[4] + 72) += objc_msgSend(v4, "length");
  if (!*((_BYTE *)a2 + 12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:]_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_PASLPWriterV1.m"), 708, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueWordContext->hasValueWord"));

  }
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_4(double a1, uint64_t a2, uint64_t a3)
{
  double v5;

  v5 = a1;
  *(_DWORD *)(a3 + 8) = _block_invoke((uint64_t *)a3, &v5, 0x100000008) | 0x60000000;
  *(_BYTE *)(a3 + 12) = 1;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 32) + 48);
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_3(double a1, uint64_t a2, uint64_t a3)
{
  float v4;
  BOOL v5;
  double v8;

  v8 = a1;
  if (a1 >= -3.40282347e38)
  {
    v4 = a1;
    v5 = a1 <= 3.40282347e38 && v4 == a1;
    if (v5 && (LOBYTE(v4) & 0xF) == 0)
    {
      *(_DWORD *)(a3 + 8) = (LODWORD(v4) >> 4) | 0x10000000;
      *(_BYTE *)(a3 + 12) = 1;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 32) + 32);
    }
  }
  if (!*(_BYTE *)(a3 + 12))
  {
    *(_DWORD *)(a3 + 8) = _block_invoke((uint64_t *)a3, &v8, 0x100000008) | 0x40000000;
    *(_BYTE *)(a3 + 12) = 1;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 32) + 40);
  }
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  _QWORD *v5;
  uint64_t v7;

  v7 = a3;
  if ((unint64_t)(a3 + 0x7FFFFFF) > 0xFFFFFFD)
  {
    v4 = _block_invoke((uint64_t *)a2, &v7, 0x100000008) | 0x20000000;
    v5 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 32) + 24);
  }
  else
  {
    v4 = a3 + 0x7FFFFFF;
    v5 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 32) + 16);
  }
  ++*v5;
  *(_DWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 12) = 1;
  return 1;
}

uint64_t __71___PASLPWriterV1__valueWordForObjectGraph_allocContext_recursionDepth___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  int v3;

  if (a3)
    v3 = 0xFFFFFFF;
  else
    v3 = 268435454;
  *(_DWORD *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 12) = 1;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 32) + 8);
  return 1;
}

uint64_t __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke_3(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_11(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The object is not plist-compatible: %@"), CFSTR("plist contains value which is not plist-compatible"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("plist contains value which is not plist-compatible"), *MEMORY[0x1E0CB2D68]);
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = (void *)objc_msgSend(v3, "copy");
  v7 = objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 6, v6);

  v8 = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v7;

  return 0;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_10;
  v7[3] = &unk_1E4430CB8;
  v7[4] = &v8;
  v7[5] = a2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  *(_QWORD *)(a2 + 8) += 8;
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  if ((+[_PASLPWriterV1 _scanPlist:recursionDepth:sizeUpperBound:allDictionaryKeys:error:]((uint64_t)_PASLPWriterV1, v7, **(_QWORD **)(a1 + 40) + 1, (uint64_t *)(*(_QWORD *)(a1 + 40) + 8), *(void **)(*(_QWORD *)(a1 + 40) + 16), (id *)(*(_QWORD *)(a1 + 40) + 24)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_autoreleasePoolPop(v6);

}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_8;
  v7[3] = &unk_1E4430C70;
  v7[4] = &v8;
  v7[5] = a2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  *(_QWORD *)(a2 + 8) += 8;
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_retainAutorelease(v27);
    v10 = objc_msgSend(v9, "UTF8String");
    if (v10)
    {
      v11 = (const char *)v10;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v9);
      v12 = strlen(v11);
      v13 = *(uint64_t **)(a1 + 40);
      v14 = *v13;
      v15 = (void *)v13[2];
      v16 = (id *)(v13 + 3);
      v17 = v13[1];
      *++v13 = v12 + v17 + 5;
      if ((+[_PASLPWriterV1 _scanPlist:recursionDepth:sizeUpperBound:allDictionaryKeys:error:]((uint64_t)_PASLPWriterV1, v7, v14 + 1, v13, v15, v16) & 1) != 0)goto LABEL_9;
      goto LABEL_8;
    }
    v18 = (void *)objc_opt_new();
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    v20 = CFSTR("object contains NSString dictionary key which is not valid Unicode");
  }
  else
  {
    v18 = (void *)objc_opt_new();
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    v20 = CFSTR("plist contains dictionary key which is not a string");
  }
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("The object is not plist-compatible: %@"), v20);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB2D68]);
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = (void *)objc_msgSend(v18, "copy");
  v24 = objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 6, v23);

  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(void **)(v25 + 24);
  *(_QWORD *)(v25 + 24) = v24;

LABEL_8:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  *a4 = 1;
LABEL_9:
  objc_autoreleasePoolPop(v8);

}

BOOL __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_6(int a1, uint64_t a2, id a3)
{
  const char *v4;
  const char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(a2 + 8) += strlen(v4) + 8;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The object is not plist-compatible: %@"), CFSTR("plist contains NSString which is not valid Unicode"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("plist contains NSString which is not valid Unicode"), *MEMORY[0x1E0CB2D68]);
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 6, v9);

    v11 = *(void **)(a2 + 24);
    *(_QWORD *)(a2 + 24) = v10;

  }
  return v5 != 0;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  *(_QWORD *)(a2 + 8) += objc_msgSend(a3, "length") + 42;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) += 12;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) += 12;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) += 12;
  return 1;
}

uint64_t __83___PASLPWriterV1__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) += 4;
  return 1;
}

@end
