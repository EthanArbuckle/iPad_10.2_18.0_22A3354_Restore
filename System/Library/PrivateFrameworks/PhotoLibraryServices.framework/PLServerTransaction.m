@implementation PLServerTransaction

unint64_t __45___PLServerTransaction__enqueueChangeScopes___block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "count");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), (_QWORD)v9);
          objc_msgSend(*(id *)(a1 + 40), "_updateChangeScopesDescriptionSnapshot");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "count");
    if (result > v3)
      return objc_msgSend(*(id *)(a1 + 40), "persistTransactionScopes:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  }
  return result;
}

uint64_t __49___PLServerTransaction_completeTransactionScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateChangeScopesDescriptionSnapshot");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
  if (result != v2)
    return objc_msgSend(*(id *)(a1 + 32), "persistTransactionScopes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  return result;
}

void __36___PLServerTransaction_changeScopes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
