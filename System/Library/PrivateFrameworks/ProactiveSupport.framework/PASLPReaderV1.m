@implementation PASLPReaderV1

uint64_t __54___PASLPReaderV1_objectForKey_usingDictionaryContext___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __64___PASLPReaderV1__decodeDictionaryKeyValue_errMsg_handleString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  void **v6;
  void *v7;

  if (a4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Dictionary key 0x%lx at ofs 0x%lx points to byte offset outside of string table"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    v6 = *(void ***)(a1 + 48);
    v7 = *v6;
    *v6 = (void *)v5;

  }
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_8(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_11(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v3 = *(_QWORD *)(result + 56);
  v4 = *(_QWORD *)(v3 + 88) + a3;
  ++*(_QWORD *)(v3 + 80);
  *(_QWORD *)(v3 + 88) = v4;
  if (a3)
  {
    v5 = a2;
    v6 = result;
    v7 = a3 - 1;
    v8 = a2 << 32;
    do
    {
      v5 += 4;
      result = -[_PASLPReaderV1 _validateObjectGraphWithFilename:rootValue:recursionDepth:stats:error:]();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24) = result;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24))
        v9 = v7 == 0;
      else
        v9 = 1;
      --v7;
      v8 += 0x400000000;
    }
    while (!v9);
  }
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __52___PASLPReaderV1_keyAtIndex_usingDictionaryContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

void __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_9(_QWORD *a1, unsigned int *a2, unsigned int a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  BOOL v27;
  uint64_t v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v3 = (_QWORD *)a1[8];
  v4 = v3[13] + a3;
  ++v3[12];
  v3[13] = v4;
  v3[7] += a3;
  if (a3)
  {
    v6 = 0;
    v7 = a3;
    v8 = (_QWORD)a2 << 32;
    v29 = a3;
    v9 = a2;
    do
    {
      v10 = (void *)MEMORY[0x1A1AFDC98]();
      v11 = a1[4];
      v12 = *v9++;
      v13 = v8 - (*(_QWORD *)(v11 + 16) << 32) + v12;
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v14 = (uint64_t *)(*(_QWORD *)(a1[6] + 8) + 40);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_10;
      v30[3] = &unk_1E442F458;
      v30[4] = &v31;
      if ((-[_PASLPReaderV1 _decodeDictionaryKeyValue:errMsg:handleString:](v11, v13, v14, v30) & 1) == 0)
        goto LABEL_12;
      v15 = v32[3];
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[4], CFSTR("_PASLPReaderV1.m"), 716, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("next"));

        v15 = v32[3];
      }
      if (v15 <= v6)
      {
        v17 = a1[4];
        if (v17)
          v18 = ((_DWORD)a2 - *(_DWORD *)(v17 + 16));
        else
          v18 = 0;
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("dictionary keys in [0x%lx, 0x%lx) are non-sorted or contain duplicates"), v18, v18 + 4 * v29);
        v20 = *(_QWORD *)(a1[6] + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

LABEL_12:
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
        _Block_object_dispose(&v31, 8);
        objc_autoreleasePoolPop(v10);
        return;
      }
      _Block_object_dispose(&v31, 8);
      objc_autoreleasePoolPop(v10);
      v8 += 0x400000000;
      v6 = v15;
      --v7;
    }
    while (v7);
    v22 = &a2[v29];
    v23 = v29 - 1;
    v24 = (v29 << 34) + ((_QWORD)a2 << 32);
    do
    {
      v25 = (void *)MEMORY[0x1A1AFDC98]();
      ++v22;
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = -[_PASLPReaderV1 _validateObjectGraphWithFilename:rootValue:recursionDepth:stats:error:]();
      v26 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
      objc_autoreleasePoolPop(v25);
      if (v26)
        v27 = v23 == 0;
      else
        v27 = 1;
      --v23;
      v24 += 0x400000000;
    }
    while (!v27);
  }
}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_9(uint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[_PASLPReaderV1 _stringForMappedUTF8CString:](*(CFTypeRef **)(a1 + 32), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = CFSTR("String table contains non-UTF-8 content");

  }
}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_11(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _PASLPArray *v4;
  uint64_t v5;
  void *v6;
  _PASLPArrayContext *v7;
  uint64_t v8;
  uint64_t v9;
  _PASLPArrayContext *v10;

  if (a3)
  {
    v10 = -[_PASLPArrayContext initWithStorage:count:]([_PASLPArrayContext alloc], "initWithStorage:count:", a2, a3);
    v4 = -[_PASLPArray initWithLazyPlistReader:context:]([_PASLPArray alloc], "initWithLazyPlistReader:context:", *(_QWORD *)(a1 + 32), v10);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = v10;
  }
  else
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(_PASLPArrayContext **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_10(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _PASLPDictionary *v4;
  uint64_t v5;
  void *v6;
  _PASLPDictionaryContext *v7;
  uint64_t v8;
  uint64_t v9;
  _PASLPDictionaryContext *v10;

  if (a3)
  {
    v10 = -[_PASLPDictionaryContext initWithStorage:count:]([_PASLPDictionaryContext alloc], "initWithStorage:count:", a2, a3);
    v4 = -[_PASLPDictionary initWithLazyPlistReader:context:]([_PASLPDictionary alloc], "initWithLazyPlistReader:context:", *(_QWORD *)(a1 + 32), v10);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = v10;
  }
  else
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(_PASLPDictionaryContext **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_4(uint64_t a1, float a2)
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v5 = a2;
  v6 = objc_msgSend(v4, "initWithFloat:", v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_5(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_6(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = objc_alloc(MEMORY[0x1E0C99D50]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_8;
  v11[3] = &unk_1E442F5C0;
  v12 = *(id *)(a1 + 32);
  v7 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:deallocator:", a2, a3, v11);
  objc_msgSend(v7, "_pas_dataWithNonnullBytes");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_4(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_5(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_6(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_7(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 32);
  v4 = *(_QWORD *)(v3 + 72) + a3;
  ++*(_QWORD *)(v3 + 64);
  *(_QWORD *)(v3 + 72) = v4;
  return result;
}

@end
