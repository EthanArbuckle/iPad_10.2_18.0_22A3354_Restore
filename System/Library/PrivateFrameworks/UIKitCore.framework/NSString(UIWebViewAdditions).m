@implementation NSString(UIWebViewAdditions)

- (id)_uikit_stringByTrimmingWhitespaceAndNewlines
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char IsMemberOf;
  uint64_t v7;
  id v8;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    goto LABEL_11;
  v3 = v2;
  v4 = v2 + 1;
  do
  {
    v5 = v4 - 1;
    if (v4 == 1)
    {
      v7 = 0;
      goto LABEL_10;
    }
    objc_msgSend(a1, "characterAtIndex:", v4 - 2);
    IsMemberOf = CFUniCharIsMemberOf();
    v4 = v5;
  }
  while ((IsMemberOf & 1) != 0);
  v7 = 0;
  do
  {
    objc_msgSend(a1, "characterAtIndex:", v7);
    if (!CFUniCharIsMemberOf())
      break;
    ++v7;
    --v5;
  }
  while (v5);
LABEL_10:
  if (v3 != v5)
  {
    objc_msgSend(a1, "substringWithRange:", v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v8 = a1;
  }
  return v8;
}

- (id)_uikit_stringWithWritingDirection:()UIWebViewAdditions asOverride:
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  int v11;

  v7 = objc_msgSend(a1, "length");
  if (a3 == -1 || !v7)
    goto LABEL_13;
  if ((a4 & 1) == 0)
  {
    v11 = MEMORY[0x186DCA240](objc_msgSend(a1, "characterAtIndex:", 0));
    if (a3 || v11)
    {
      LODWORD(v8) = 8234;
      v9 = 8235;
      if (a3 != 1 || v11 != 1)
        goto LABEL_5;
    }
LABEL_13:
    v10 = a1;
    return v10;
  }
  LODWORD(v8) = 8237;
  v9 = 8238;
LABEL_5:
  if (a3)
    v8 = v9;
  else
    v8 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C%@%C"), v8, a1, 8236);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)_uikit_stringByRemovingFirstMatchFromPrefixes:()UIWebViewAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "length"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(a1, "hasPrefix:", v10, (_QWORD)v13) & 1) != 0)
          {
            objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v10, "length"));
            v11 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  v11 = a1;
LABEL_13:

  return v11;
}

@end
