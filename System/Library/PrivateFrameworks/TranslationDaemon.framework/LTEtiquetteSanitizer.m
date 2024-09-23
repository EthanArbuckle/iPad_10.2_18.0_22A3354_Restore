@implementation LTEtiquetteSanitizer

void __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a2;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke_33;
  v9[3] = &unk_251A12688;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v9);

  objc_msgSend((id)v11[5], "setObject:forKeyedSubscript:", v6, CFSTR("TOKEN"));
  _Block_object_dispose(&v10, 8);

}

void __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke_33(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v4, v8);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __42___LTEtiquetteSanitizer_matchesForString___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSRange v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _LTMatch *v24;
  id *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  NSRange v33;
  NSRange v34;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v25 = WeakRetained;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "node", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v6);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v18 = *(void **)(v17 + 40);
          *(_QWORD *)(v17 + 40) = v16;

          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
            v33.location = objc_msgSend(v14, "range");
            v34.location = a3;
            v34.length = a4;
            v19 = NSUnionRange(v33, v34);
            objc_msgSend(v14, "setRange:", v19.location, v19.length);
            objc_msgSend(v14, "setNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          }
          else
          {
            objc_msgSend(v14, "node");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("TOKEN"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v14, "setToken:", v21);
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
            }
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    v8 = v25;
    objc_msgSend(v25[1], "objectForKeyedSubscript:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = *(void **)(a1 + 32);
      v24 = -[_LTMatch initWithNode:range:]([_LTMatch alloc], "initWithNode:range:", v22, a3, a4);
      objc_msgSend(v23, "addObject:", v24);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", *(_QWORD *)(a1 + 48), v25);
    objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");

  }
}

uint64_t __61___LTEtiquetteSanitizer_replacementStringForString_forToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", CFSTR("*"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, CFSTR("*"));
  return result;
}

@end
