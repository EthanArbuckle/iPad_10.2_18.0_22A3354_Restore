@implementation RBSXPCEncodeObjectForKey

void ___RBSXPCEncodeObjectForKey_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "encodeWithRBSXPCCoder:", v4);
  NSStringFromClass((Class)objc_msgSend(*(id *)(a1 + 32), "classForCoder"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  RBSSerializeStringToXPCDictionaryWithKey(v6, v5, "bsx_class");

}

void ___RBSXPCEncodeObjectForKey_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = ++_RBSXPCEncodeObjectForKey___counter;
  v5 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%u"), v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  RBSSerializeStringToXPCDictionaryWithKey(v6, v5, "bsx_index");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "encodeObject:forKey:", *(_QWORD *)(a1 + 40), v6);
}

void ___RBSXPCEncodeObjectForKey_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = *MEMORY[0x1E0C99778];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          _RBSXPCEncodeObjectForKey(*(_QWORD *)(a1 + 40), v9, v8);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v6, CFSTR("Dictionary keys must be of type NSString"), (_QWORD)v10);
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

@end
