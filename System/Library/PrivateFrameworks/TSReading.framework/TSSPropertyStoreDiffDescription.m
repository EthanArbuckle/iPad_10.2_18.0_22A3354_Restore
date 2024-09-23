@implementation TSSPropertyStoreDiffDescription

unint64_t __TSSPropertyStoreDiffDescription_block_invoke(uint64_t a1, unsigned __int16 a2)
{
  void *v4;
  void *v5;
  unsigned int *v6;
  size_t *v7;
  double v8;
  unsigned int *v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t result;
  unint64_t j;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (unsigned int *)p_TSSPropertyStoreSearch(*(size_t **)(a1 + 64), a2);
  v7 = p_TSSPropertyStoreSearch(*(size_t **)(a1 + 72), a2);
  v9 = (unsigned int *)v7;
  v10 = CFSTR(" ");
  if (v6)
  {
    if (v7)
    {
      if (String((uint64_t)v6, (uint64_t)v7, v8))
        v11 = CFSTR(" ");
      else
        v11 = CFSTR("!");
    }
    else
    {
      v11 = CFSTR("+");
    }
    objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)String(v6), "componentsSeparatedByString:", CFSTR("\n")));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v4);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          if (v17 <= objc_msgSend(v16, "length"))
          {
            v19 = objc_msgSend(v16, "length");
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v19 = *(_QWORD *)(v18 + 24);
          }
          *(_QWORD *)(v18 + 24) = v19;
        }
        v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }
    v10 = (__CFString *)v11;
    if (v9)
      goto LABEL_20;
  }
  else
  {
    v11 = CFSTR("-");
    if (v7)
    {
LABEL_20:
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)String(v9), "componentsSeparatedByString:", CFSTR("\n")));
      v10 = (__CFString *)v11;
    }
  }
  v20 = objc_msgSend(v4, "count");
  if (v20 < objc_msgSend(v5, "count"))
  {
    do
    {
      objc_msgSend(v4, "addObject:", &stru_24D82FEB0);
      v21 = objc_msgSend(v4, "count");
    }
    while (v21 < objc_msgSend(v5, "count"));
  }
  v22 = objc_msgSend(v5, "count");
  if (v22 < objc_msgSend(v4, "count"))
  {
    do
    {
      objc_msgSend(v5, "addObject:", &stru_24D82FEB0);
      v23 = objc_msgSend(v5, "count");
    }
    while (v23 < objc_msgSend(v4, "count"));
  }
  result = objc_msgSend(v4, "count");
  if (result)
  {
    for (j = 0; j < result; ++j)
    {
      if (*(_BYTE *)(a1 + 80) || (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR(" ")) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(v4, "objectAtIndexedSubscript:", j));
        objc_msgSend(*(id *)(a1 + 48), "addObject:", objc_msgSend(v5, "objectAtIndexedSubscript:", j));
      }
      result = objc_msgSend(v4, "count");
    }
  }
  return result;
}

@end
