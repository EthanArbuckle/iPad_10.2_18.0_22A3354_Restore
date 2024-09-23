@implementation NSMutableArray

uint64_t __59__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_before___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setOwner:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (!v2
    || (objc_msgSend(*(id *)(a1 + 40), "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2 == v3))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", *(_QWORD *)(a1 + 48));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("_UIKBRTObjectArray.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

      v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), v4);
}

uint64_t __58__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_after___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setOwner:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", *(_QWORD *)(a1 + 48));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("_UIKBRTObjectArray.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  return objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), v4 + 1);
}

void __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke(id *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a1[4], "setOwner:", a1[5]);
  v2 = objc_msgSend(a1[5], "count");
  v4 = a1[4];
  v3 = a1[5];
  if (v2)
  {
    v5 = objc_msgSend(a1[5], "count");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke_2;
    v6[3] = &unk_1E16D7EB8;
    v7 = a1[6];
    objc_msgSend(a1[5], "insertObject:atIndex:", a1[4], objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, v6));

  }
  else
  {
    objc_msgSend(a1[5], "addObject:", a1[4]);
  }
}

uint64_t __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke_2(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return 1;
  else
    return -1;
}

uint64_t __52__NSMutableArray__UIKBRTObjectArray___uikbrtRemove___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setOwner:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_set_listContainsOrderedItems:", 0);
  return result;
}

@end
