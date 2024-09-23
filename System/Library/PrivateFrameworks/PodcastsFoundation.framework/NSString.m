@implementation NSString

uint64_t __32__NSString_IMAdditions__hasHTML__block_invoke()
{
  MTSearchTrie *v0;
  void *v1;
  uint64_t i;
  uint64_t result;

  v0 = objc_alloc_init(MTSearchTrie);
  v1 = (void *)hasHTML_trie;
  hasHTML_trie = (uint64_t)v0;

  for (i = 0; i != 253; ++i)
    result = objc_msgSend((id)hasHTML_trie, "addMatchCandidate:", kIMHTMLEntities[i]);
  return result;
}

void __82__NSString_MTAdditions__stringWithDuration_unitsStyle_includeTimeRemainingPhrase___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
  stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters = v0;

}

void __54__NSString_MTAdditions__cleanedTitleStringWithPrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24))
  {
    v11 = 0;
LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "stringByAppendingString:", CFSTR("​"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" \n\t,;:：–—-)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length") - 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    *a7 = 1;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || objc_msgSend(v24, "caseInsensitiveCompare:", v11))
    goto LABEL_6;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  *(_QWORD *)(v12 + 32) = a3;
  *(_QWORD *)(v12 + 40) = a4;
LABEL_7:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

uint64_t __30__NSString_MTAdditions__words__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __37__NSString_MTAdditions__mt_isEnglish__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  mt_isEnglish_isEnglish = objc_msgSend(v0, "hasPrefix:", CFSTR("en"));

}

void __38__NSString_MTAdditions__mt_isJapanese__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  mt_isJapanese_isJapanese = objc_msgSend(v0, "hasPrefix:", CFSTR("ja"));

}

void __52__NSString_IMAdditions__rangeOfSignificantSubstring__block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24)
    || (v11 = (void *)a1[4],
        v13 = v10,
        objc_msgSend(v10, "lowercaseString"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v11) = objc_msgSend(v11, "containsObject:", v12),
        v12,
        v10 = v13,
        (v11 & 1) == 0))
  {
    *a7 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

}

_QWORD *__87__NSString_IMAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  _QWORD *v7;

  if (++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) >= result[5])
  {
    *a7 = 1;
    v7 = (_QWORD *)result[6];
    if (v7)
      *v7 = a5 + a6;
  }
  return result;
}

uint64_t __77__NSString_IMAdditions__stringByTruncatingToLength_options_truncationString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t result;

  v9 = a3 + a4;
  v10 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v9 <= v10 - result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  else
    *a7 = 1;
  return result;
}

@end
