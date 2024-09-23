@implementation PRSRankingUtilities

+ (BOOL)multiWordString:(id)a3 hasPrefix:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasPrefix:", v7) & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasPrefix:", v7) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v8;
}

+ (BOOL)userQueryTermsHasOnlySingleCharacterTerms:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = 0;
      v7 = v5 - 1;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");
        v10 = v9 < 2;

        if (v9 > 1)
          break;
      }
      while (v7 != v6++);
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)userQueryHasOnlySingleCharacterTerms:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PRSRankingUtilities userQueryTermsHasOnlySingleCharacterTerms:](PRSRankingUtilities, "userQueryTermsHasOnlySingleCharacterTerms:", v3);

  return v4;
}

+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 isEqualToString:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (v7 >= objc_msgSend(v6, "length"))
    v8 = objc_msgSend(v5, "compare:options:range:", v6, 129, 0, objc_msgSend(v5, "length")) == 0;
  else
    v8 = +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v6, v5);

  return v8;
}

+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 hasPrefix:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "rangeOfString:options:range:locale:", v8, 137, 0, objc_msgSend(v9, "length"), v7);
  v11 = v10;

  return v11 != 0;
}

+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 containsString:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "rangeOfString:options:range:locale:", v8, 129, 0, objc_msgSend(v9, "length"), v7);
  v11 = v10;

  return v11 != 0;
}

+ (id)categoryForBundleID:(id)a3
{
  return a3;
}

+ (id)bundleIDForCategory:(id)a3
{
  return 0;
}

+ (void)computeDateCountsForDates:(id)a3 countLastYear:(unint64_t *)a4 countLastMonth:(unint64_t *)a5 countLastWeek:(unint64_t *)a6 countLastDay:(unint64_t *)a7 currentTime:(double)a8
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  double v21;
  unint64_t *v22;
  unint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v22 = a6;
  v23 = a7;
  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "timeIntervalSinceReferenceDate", v22, v23);
        v21 = a8 - v20;
        if (v21 <= 86400.0)
          ++v16;
        if (v21 <= 604800.0)
          ++v15;
        if (v21 <= 2592000.0)
          ++v14;
        if (v21 <= 31536000.0)
          ++v17;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  *a4 = v17;
  *a5 = v14;
  *v22 = v15;
  *v23 = v16;

}

+ (float)floatValue:(float)a3 withSigFigs:(int64_t)a4
{
  float v4;
  void *v5;
  float v6;
  char __str[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3 >= 10.0)
  {
    v14 = 0u;
    v15 = 0u;
    *(_OWORD *)v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    *(_OWORD *)__str = 0u;
    v9 = 0u;
    snprintf(__str, 0x40uLL, "%%.%ldg", a4);
    snprintf(v12, 0x40uLL, __str, v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v4 = v6;

  }
  return v4;
}

+ (BOOL)aToZInString:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = aToZInString__aToZ_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&aToZInString__aToZ_onceToken, &__block_literal_global_10);
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", aToZInString__aToZ);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

void __36__PRSRankingUtilities_aToZInString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwzyzABCDEFGHIJKLMNOPQRSTUVWZYZ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)aToZInString__aToZ;
  aToZInString__aToZ = v0;

}

+ (BOOL)digitInString:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = digitInString__digitsOnceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&digitInString__digitsOnceToken, &__block_literal_global_20);
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", digitInString__digits);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

void __37__PRSRankingUtilities_digitInString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)digitInString__digits;
  digitInString__digits = v0;

}

+ (id)onlyPotentialPhoneNumbersInString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v3 = onlyPotentialPhoneNumbersInString__oneToNine_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&onlyPotentialPhoneNumbersInString__oneToNine_onceToken, &__block_literal_global_31);
  removeLeadingSpaces(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 4; ++i)
  {
    v7 = v5;
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", onlyPotentialPhoneNumbersInString__sPhoneNumberSeparatorList[i], CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  removeLeadingSpaces(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (!v9)
    goto LABEL_12;
  v10 = v9;
  v11 = 0;
  while (objc_msgSend((id)onlyPotentialPhoneNumbersInString__oneToNine, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v11)))
  {
    if (v10 == ++v11)
    {
      v11 = v10;
      break;
    }
  }
  if (v11 >= 3)
    v12 = v8;
  else
LABEL_12:
    v12 = 0;

  return v12;
}

void __57__PRSRankingUtilities_onlyPotentialPhoneNumbersInString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789 "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)onlyPotentialPhoneNumbersInString__oneToNine;
  onlyPotentialPhoneNumbersInString__oneToNine = v0;

}

+ (BOOL)somePotentialPhoneNumbersInString:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = somePotentialPhoneNumbersInString__oneToNine_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&somePotentialPhoneNumbersInString__oneToNine_onceToken, &__block_literal_global_34);
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", somePotentialPhoneNumbersInString__oneToNine);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

void __57__PRSRankingUtilities_somePotentialPhoneNumbersInString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)somePotentialPhoneNumbersInString__oneToNine;
  somePotentialPhoneNumbersInString__oneToNine = v0;

}

+ (id)hyphensCharacterSet
{
  if (hyphensCharacterSet_hyphens_onceToken != -1)
    dispatch_once(&hyphensCharacterSet_hyphens_onceToken, &__block_literal_global_35);
  return (id)hyphensCharacterSet_hyphensSet;
}

void __42__PRSRankingUtilities_hyphensCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C%C%C%C%C%C%C%C%C%C%C%C%C"), 45, 1418, 1470, 6150, 8208, 8209, 8210, 8211, 8212, 8213, 65112, 65123, 65293);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hyphensCharacterSet_hyphensSet;
  hyphensCharacterSet_hyphensSet = v1;

}

@end
