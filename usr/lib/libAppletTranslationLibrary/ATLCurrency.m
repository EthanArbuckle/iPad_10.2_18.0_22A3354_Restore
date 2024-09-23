@implementation ATLCurrency

+ (id)currencyCodeForNumber:(unint64_t)a3 exponentOut:(signed __int16 *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int16 *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  uint64_t v12;

  if (a3 <= 0x3E8)
  {
    v7 = (unsigned __int16 *)&countryEntries;
    v8 = 165;
    do
    {
      v9 = v8 >> 1;
      v10 = &v7[4 * (v8 >> 1)];
      v12 = *(_QWORD *)v10;
      v11 = v10 + 4;
      v8 += ~(v8 >> 1);
      if ((__int16)v12 < (int)a3)
        v7 = v11;
      else
        v8 = v9;
    }
    while (v8);
    if (v7 == (unsigned __int16 *)&unk_1C35BAE8E || *v7 != (unsigned __int16)a3)
    {
      v6 = 0;
    }
    else
    {
      if (a4)
        *a4 = v7[1];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7 + 2, 1, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)checkSorted
{
  uint64_t v2;
  int v3;
  __int16 v4;

  v2 = 8u;
  LOWORD(v3) = 8;
  do
  {
    v4 = v3;
    v3 = *(__int16 *)((char *)&countryEntries + v2);
    if (v2 == 1312)
      break;
    v2 += 8;
  }
  while (v3 > v4);
  return v3 > v4;
}

@end
