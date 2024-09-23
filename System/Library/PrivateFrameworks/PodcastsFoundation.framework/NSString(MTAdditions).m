@implementation NSString(MTAdditions)

+ (id)stringWithDuration:()MTAdditions unitsStyle:includeTimeRemainingPhrase:
{
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a2 >= 0.0 && a2 < 1.0;
  v9 = (uint64_t)a2;
  if (v8)
    v9 = 1;
  v10 = v9 / 60 % 60;
  if (v9 % 60 > 29)
  {
    v11 = v10 + 1;
    v12 = v10 == -1;
    v13 = 60 * v11 + 3600 * (v9 / 3600);
    v14 = 96;
    if ((unint64_t)(v9 + 3599) > 0x1C1E || !v12)
      goto LABEL_16;
LABEL_26:
    v22 = 0;
    return v22;
  }
  v14 = 96;
  if ((unint64_t)(v9 + 3599) <= 0x1C1E && !v10)
  {
    if (v9 % 60 < 1)
      goto LABEL_26;
    v14 = 224;
  }
  v13 = v9;
LABEL_16:
  if (stringWithDuration_unitsStyle_includeTimeRemainingPhrase__onceToken != -1)
    dispatch_once(&stringWithDuration_unitsStyle_includeTimeRemainingPhrase__onceToken, &__block_literal_global_5);
  v15 = (id)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
  objc_sync_enter(v15);
  v16 = (void *)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    objc_msgSend(v18, "setUnitsStyle:", a4);
    objc_msgSend(v18, "setMaximumUnitCount:", 2);
    v19 = (void *)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

  }
  objc_sync_exit(v15);

  v21 = v18;
  objc_sync_enter(v21);
  objc_msgSend(v21, "setAllowedUnits:", v14);
  objc_msgSend(v21, "setIncludesTimeRemainingPhrase:", a5);
  objc_msgSend(v21, "stringFromTimeInterval:", (double)v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v21);

  if (a4 == 2)
  {
    objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E5500770);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
  if ((_DWORD)a5 && objc_msgSend(a1, "mt_isEnglish"))
  {
    objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("remaining"), CFSTR("left"));
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }

  return v22;
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions includeTimeRemainingPhrase:abbreviated:
{
  uint64_t v5;

  if (a4)
    v5 = 1;
  else
    v5 = 2;
  return objc_msgSend(a1, "stringWithDuration:unitsStyle:includeTimeRemainingPhrase:", v5, a3);
}

- (id)cleanedTitleStringWithPrefix:()MTAdditions
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  void *v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD *v18;
  _QWORD v19[6];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v5 = a1;
  v26 = v5;
  if (v4)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "length");
    if (v7 > objc_msgSend(v4, "length"))
    {
      objc_msgSend(v4, "words");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v20[3] = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3010000000;
      v19[4] = 0;
      v19[5] = 0;
      v19[3] = "";
      v9 = objc_msgSend(v6, "length");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__NSString_MTAdditions__cleanedTitleStringWithPrefix___block_invoke;
      v13[3] = &unk_1E54D1878;
      v10 = v8;
      v16 = v20;
      v17 = &v21;
      v14 = v10;
      v15 = v6;
      v18 = v19;
      objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v13);

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v20, 8);

    }
  }
  v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (BOOL)containsStringInsensitive:()MTAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 1) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)words
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__NSString_MTAdditions__words__block_invoke;
  v6[3] = &unk_1E54D18A0;
  v4 = v2;
  v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 1027, v6);

  return v4;
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:abbreviated:", 0);
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions abbreviated:
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", 0, a3);
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions includeTimeRemainingPhrase:
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", a3, 0);
}

+ (uint64_t)mt_isEnglish
{
  if (mt_isEnglish_onceToken != -1)
    dispatch_once(&mt_isEnglish_onceToken, &__block_literal_global_17);
  return mt_isEnglish_isEnglish;
}

+ (uint64_t)mt_isJapanese
{
  if (mt_isJapanese_onceToken != -1)
    dispatch_once(&mt_isJapanese_onceToken, &__block_literal_global_21);
  return mt_isJapanese_isJapanese;
}

- (BOOL)isNotEmpty
{
  return objc_msgSend(a1, "length") != 0;
}

- (__CFString)stringByRemovingNewlineCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (__CFString *)0;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = -[__CFString length](v9, "length");
    v11 = &stru_1E5500770;
    v21 = v9;
    if (v10)
      v11 = v9;
    v5 = v11;
    for (i = 1; i != v7; ++i)
    {
      objc_msgSend(v3, "objectAtIndex:", i, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v5, "length") && objc_msgSend(v13, "length"))
      {
        v14 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", -[__CFString length](v5, "length") - 1);
        v15 = objc_msgSend(v13, "characterAtIndex:", 0);
        if (objc_msgSend(v8, "characterIsMember:", v14)
          && objc_msgSend(v8, "characterIsMember:", v15))
        {
          -[__CFString stringByTrimmingCharactersInSet:](v5, "stringByTrimmingCharactersInSet:", v8);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v16;
          v23[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
          v19 = objc_claimAutoreleasedReturnValue();

          v5 = (__CFString *)v16;
        }
        else if ((objc_msgSend(v8, "characterIsMember:", v14) & 1) != 0
               || (objc_msgSend(v8, "characterIsMember:", v15) & 1) != 0)
        {
          -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v13);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22[0] = v5;
          v22[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString componentsJoinedByString:](v20, "componentsJoinedByString:", CFSTR(" "));
          v19 = objc_claimAutoreleasedReturnValue();

          v5 = v20;
        }

        v5 = (__CFString *)v19;
      }

    }
  }

  return v5;
}

- (id)stringBySmartlyStrippingHTML
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "stringByRemovingNewlineCharacters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<br>"), CFSTR("\n<br>"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<br/>"), CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<p>"), CFSTR("\n\n<p>"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByStrippingHTML");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pf_localizedStringByFoldingWithOptions:()MTAdditions
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByFoldingWithOptions:locale:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
