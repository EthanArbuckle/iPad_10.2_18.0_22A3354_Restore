@implementation PASLPDictionary

void __45___PASLPDictionary_getObjects_andKeys_count___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t j;
  id v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "bytes");
    for (i = 0; ; ++i)
    {
      v6 = *(_QWORD *)(a1[4] + 16);
      if (v6)
        v6 = *(_QWORD *)(v6 + 16);
      if (i >= 2 * v6)
        break;
      v7 = CFRetain(*(CFTypeRef *)(v4 + 8 * i));
      CFAutorelease(v7);
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1[4] + 16);
    if (v8)
      v9 = 16 * *(_QWORD *)(v8 + 16);
    else
      v9 = 0;
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v9);
    v10 = objc_msgSend(v22, "mutableBytes");
    v11 = v10;
    v12 = a1[4];
    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
      v14 = *(_QWORD *)(v13 + 16);
    else
      v14 = 0;
    v15 = 0;
    v16 = v10 + 8 * v14;
    if (!v13)
      goto LABEL_15;
LABEL_12:
    for (j = *(_QWORD *)(v13 + 16); v15 < j; j = 0)
    {
      objc_msgSend(*(id *)(v12 + 8), "keyAtIndex:usingDictionaryContext:", v15);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v16 + 8 * v15) = CFAutorelease(v18);

      objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndex:usingDictionaryContext:", v15, *(_QWORD *)(a1[4] + 16));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v11 + 8 * v15) = CFAutorelease(v19);

      ++v15;
      v12 = a1[4];
      v13 = *(_QWORD *)(v12 + 16);
      if (v13)
        goto LABEL_12;
LABEL_15:
      ;
    }
    v20 = (id *)(v12 + 24);
    v3 = v22;
    objc_storeWeak(v20, v3);

  }
  v23 = v3;
  CFAutorelease(v23);
  v21 = a1[5];
  if (v21)
    objc_msgSend(v23, "getBytes:range:", v21, 0, 8 * a1[6]);
  if (a1[7])
    objc_msgSend(v23, "getBytes:range:");

}

void __40___PASLPDictionary_isEqualToDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __37___PASLPDictionary_allKeysForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __29___PASLPDictionary_allValues__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __27___PASLPDictionary_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
