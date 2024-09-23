@implementation PASLRUCache

void __29___PASLRUCache_objectForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = *(id *)(a2 + 8);
  v4 = *(id *)(a2 + 16);
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), 0);
  }

}

void __33___PASLRUCache_setObject_forKey___block_invoke(_QWORD *a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = *(id *)(a2 + 8);
  v4 = *(id *)(a2 + 16);
  objc_msgSend(v8, "objectForKeyedSubscript:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", a1[5], a1[4]);
  v6 = a1[4];
  if (v5)
  {
    objc_msgSend(v4, "removeObject:", v6);
    objc_msgSend(v4, "insertObject:atIndex:", a1[4], 0);
  }
  else
  {
    objc_msgSend(v4, "insertObject:atIndex:", v6, 0);
    if ((unint64_t)objc_msgSend(v4, "count") > *(_QWORD *)(a1[6] + 16))
    {
      objc_msgSend(v4, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v7);

      objc_msgSend(v4, "removeLastObject");
    }
  }

}

void __50___PASLRUCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)a2[1];
  v4 = a2;
  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = (void *)v4[2];
  v9 = objc_msgSend(v8, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __32___PASLRUCache_removeAllObjects__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  v2 = (void *)a2[1];
  v3 = a2;
  objc_msgSend(v2, "removeAllObjects");
  v4 = (void *)v3[2];

  return objc_msgSend(v4, "removeAllObjects");
}

uint64_t __35___PASLRUCache_removeObjectForKey___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v3 = (void *)a2[1];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);
  v6 = (void *)v5[2];

  return objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
}

@end
