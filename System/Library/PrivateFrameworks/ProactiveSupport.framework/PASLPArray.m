@implementation PASLPArray

void __32___PASLPArray_getObjects_range___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  unint64_t i;
  unint64_t v6;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t j;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id *v17;
  id v18;

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
      if (i >= v6)
        break;
      v7 = CFRetain(*(CFTypeRef *)(v4 + 8 * i));
      CFAutorelease(v7);
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1[4] + 16);
    if (v8)
      v9 = 8 * *(_QWORD *)(v8 + 16);
    else
      v9 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v9);
    v11 = objc_msgSend(v10, "mutableBytes");
    for (j = 0; ; ++j)
    {
      v13 = a1[4];
      v14 = *(_QWORD *)(v13 + 16);
      v15 = v14 ? *(_QWORD *)(v14 + 16) : 0;
      if (j >= v15)
        break;
      objc_msgSend(*(id *)(v13 + 8), "objectAtIndex:usingArrayContext:", j);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v11 + 8 * j) = CFAutorelease(v16);

    }
    v17 = (id *)(v13 + 24);
    v3 = v10;
    objc_storeWeak(v17, v3);

  }
  v18 = v3;
  CFAutorelease(v18);
  objc_msgSend(v18, "getBytes:range:", a1[5], 8 * a1[6], 8 * a1[7]);

}

@end
