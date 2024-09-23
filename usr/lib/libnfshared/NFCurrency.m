@implementation NFCurrency

+ (unint64_t)decodeBCDAmount:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v6 = (*(_BYTE *)(v4 + v5) & 0xF) + 10 * (*(unsigned __int8 *)(v4 + v5) >> 4) + 100 * v6;
      ++v5;
    }
    while (objc_msgSend(v3, "length") > v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)encodeBCDAmount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  BOOL v7;
  char v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 6);
  if (a3)
  {
    v5 = 5;
    do
    {
      v9 = (a3 % 0xA) | (16 * (a3 / 0xA - 10 * ((a3 / 0xA * (unsigned __int128)0x199999999999999AuLL) >> 64)));
      objc_msgSend(v4, "replaceBytesInRange:withBytes:length:", v5, 1, &v9, 1);
      if (v5-- == 0)
        break;
      v7 = a3 > 0x63;
      a3 /= 0x64uLL;
    }
    while (v7);
  }
  return v4;
}

+ (id)getCurrencyStringCodeFromNumericCode:(unsigned int)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  int NumericCode;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECFF6AC0 != -1)
    dispatch_once(&qword_1ECFF6AC0, &__block_literal_global_4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (a3 & 0xF) + 10 * (a3 >> 4) + 100 * ((a3 >> 8) & 0xF) + 1000 * ((unsigned __int16)a3 >> 12));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_5, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v17[0] = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCurrencyCodes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "getCharacters:range:", v17, 0, 3);
          NumericCode = ucurr_getNumericCode();
          if (objc_msgSend(v4, "intValue") == NumericCode)
          {
            objc_msgSend((id)_MergedGlobals_5, "setObject:forKey:", v9, v4);
            v5 = v9;
            goto LABEL_14;
          }
        }
        v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v5;
}

void __51__NFCurrency_getCurrencyStringCodeFromNumericCode___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v0;

}

+ (int)getFractionDigitsFromCurrencyStringCode:(id)a3
{
  id v3;
  uint64_t v4;
  int DefaultFractionDigits;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7[0] = 0;
  if ((unint64_t)objc_msgSend(v3, "length") > 2)
    v4 = 3;
  else
    v4 = objc_msgSend(v3, "length");
  objc_msgSend(v3, "getCharacters:range:", v7, 0, v4);
  DefaultFractionDigits = ucurr_getDefaultFractionDigits();

  return DefaultFractionDigits;
}

@end
