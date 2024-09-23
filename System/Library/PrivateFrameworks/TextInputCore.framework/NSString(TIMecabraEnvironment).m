@implementation NSString(TIMecabraEnvironment)

- (void)characters
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "length");
  v3 = malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
  objc_msgSend(a1, "getCharacters:range:", v3, 0, v2);
  return v3;
}

- (__CFString)longestCommonSubstring:()TIMecabraEnvironment backwards:
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  __CFString *v7;
  unint64_t v8;
  unsigned __int16 *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_msgSend(v4, "length");
  v7 = &stru_1EA1081D0;
  if (v5)
  {
    v8 = v6;
    if (v6)
    {
      v9 = (unsigned __int16 *)objc_msgSend(a1, "characters");
      v10 = objc_msgSend(v4, "characters");
      v11 = (void *)v10;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v16 = v9[v13];
        v17 = *(unsigned __int16 *)(v10 + 2 * v12);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          v18 = v13;
        else
          v18 = v15;
        if (v16 == v17)
          v15 = v18;
        else
          v15 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 == v17)
          ++v14;
        else
          v14 = 0;
        if (v16 == v17)
          ++v12;
        else
          v12 = 0;
        ++v13;
      }
      while (v13 < v5 && v12 < v8);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        v19 = 0;
      else
        v19 = v14;
      if (v19)
        v20 = v15 == 0x7FFFFFFFFFFFFFFFLL;
      else
        v20 = 1;
      if (v20 || v15 + v19 > (unint64_t)objc_msgSend(a1, "length"))
      {
        v7 = &stru_1EA1081D0;
      }
      else
      {
        objc_msgSend(a1, "substringWithRange:", v15, v19);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      free(v9);
      free(v11);
    }
  }

  return v7;
}

- (uint64_t)TI_hasTruePrefix:()TIMecabraEnvironment
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5 <= objc_msgSend(v4, "length"))
    v6 = 0;
  else
    v6 = objc_msgSend(a1, "hasPrefix:", v4);

  return v6;
}

- (uint64_t)TI_hasTrueSuffix:()TIMecabraEnvironment
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5 <= objc_msgSend(v4, "length"))
    v6 = 0;
  else
    v6 = objc_msgSend(a1, "hasSuffix:", v4);

  return v6;
}

@end
