@implementation NSOptimalLineBreaker

void __55___NSOptimalLineBreaker__shouldAvoidBreakingAfterWord___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v1 = objc_msgSend(&unk_1E2631680, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v24 != v3)
          objc_enumerationMutation(&unk_1E2631680);
        v5 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(&unk_1E2631680, "objectForKeyedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, v5);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = _shouldAvoidBreakingAfterWord__maxShortWordLength;
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "length");
              if (v15 <= v16)
                v17 = v16;
              else
                v17 = v15;
              _shouldAvoidBreakingAfterWord__maxShortWordLength = v17;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

      }
      v2 = objc_msgSend(&unk_1E2631680, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v2);
  }
  v18 = (void *)_shouldAvoidBreakingAfterWord__wordSets;
  _shouldAvoidBreakingAfterWord__wordSets = (uint64_t)v0;

}

uint64_t __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *a7 = 1;
  return result;
}

uint64_t __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *a7 = 1;
  return result;
}

void __62___NSOptimalLineBreaker__enumerateNonBreakingSpacesWithBlock___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 160, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_enumerateNonBreakingSpacesWithBlock__nbspCharacterSet;
  _enumerateNonBreakingSpacesWithBlock__nbspCharacterSet = v0;

}

void __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, __int16 a4)
{
  -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:](*(_QWORD **)(a1 + 32), a2, a3, a4);
}

void __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:](*(_QWORD **)(a1 + 32), a2, a3, 4);
}

void __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke_3(uint64_t a1, unint64_t a2, int a3)
{
  _QWORD *v3;
  __int16 v4;

  v3 = *(_QWORD **)(a1 + 32);
  if (a3)
    v4 = 138;
  else
    v4 = 10;
  -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:](v3, a2, 0, v4);
}

uint64_t __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke_4(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  if (*a2 < *a3)
    result = -1;
  else
    result = *a3 < *a2;
  if (!result)
  {
    v4 = a2[1] + *a2;
    v5 = a3[1] + *a3;
    if (v4 < v5)
      return -1;
    else
      return v5 < v4;
  }
  return result;
}

uint64_t __50___NSOptimalLineBreaker__equivalenceClassForNode___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) ^= a2
                                                                   + (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 24) << 6)
                                                                   + (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 24) >> 2)
                                                                   - 0x61C8864680B583EALL;
  return result;
}

uint64_t __59___NSOptimalLineBreaker__bestNodeInNodeList_withLineCount___block_invoke(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = -[_NSOptimalLineBreaker _node:isBetterThanNode:](a1[4], (double *)a2, *(double **)(*(_QWORD *)(a1[5] + 8) + 24));
  if ((_DWORD)result)
  {
    v5 = a1[6];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 == *(_QWORD *)(a2 + 16))
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  }
  return result;
}

BOOL __50___NSOptimalLineBreaker__calculateOptimalWrapping__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(_WORD *)(a2 + 48) & 0x82) != 2;
}

uint64_t __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!-[_NSOptimalLineBreaker _bestNode:dominatesNode:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a3))return objc_msgSend(*(id *)(a1 + 40), "appendValue:", a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == a3)
    __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke_cold_1();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "releaseNode:", a3);
}

void __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke_cold_1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]_block_invoke", "NSOptimalLineBreaker.m", 2300, "node != bestNode");
}

@end
