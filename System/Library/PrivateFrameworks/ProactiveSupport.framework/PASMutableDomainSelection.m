@implementation PASMutableDomainSelection

void __64___PASMutableDomainSelection__decrementCountAndMaybePruneItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  else
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);

}

void __104___PASMutableDomainSelection__addDomainsFromOtherDictionary_toOwnDictionary_ownDictionaryIsPlaceholder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(*(id *)(a1 + 40), "_addDomainsFromOtherDictionary:toOwnDictionary:ownDictionaryIsPlaceholder:", v5, v6, 0);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = (v8 & 1) != 0 || *(_BYTE *)(v9 + 24) != 0;
    *(_BYTE *)(v9 + 24) = v10;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v13);
    v11 = objc_msgSend(v5, "count");
    v12 = *(_QWORD **)(a1 + 40);
    if (v11)
      objc_msgSend(v12, "_addDomainsFromOtherDictionary:toOwnDictionary:ownDictionaryIsPlaceholder:", v5, v7, 1);
    else
      ++v12[2];
  }

}

void __40___PASMutableDomainSelection_allDomains__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)MEMORY[0x1A1AFDC98]();
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = a1[5];
    objc_msgSend(v15, "_pas_revivedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@%@."), v9, v10);

    v12 = (void *)a1[6];
    +[_PASTuple2 tupleWithFirst:second:](_PASTuple2, "tupleWithFirst:second:", v5, v11);
  }
  else
  {
    v12 = (void *)a1[4];
    v13 = (void *)a1[5];
    objc_msgSend(v15, "_pas_revivedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v11);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  objc_autoreleasePoolPop(v7);
}

@end
