@implementation RVSelection

+ (_NSRange)revealRangeAtIndex:(unint64_t)a3 selectedRanges:(id)a4 shouldUpdateSelection:(BOOL *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  _NSRange result;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "rangeValue", (_QWORD)v18);
        if (a3 >= v11 && a3 - v11 < v12)
        {
          v14 = v11;
          v15 = v12;
          LODWORD(v8) = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v15 = 0;
  v14 = a3;
LABEL_14:

  if (a5)
    *a5 = v8 ^ 1;
  if (!(_DWORD)v8 || (unint64_t)objc_msgSend(v7, "count") > 1 || v15 >= 0x1F4)
  {
    v15 = 0;
    v14 = a3;
  }

  v16 = v14;
  v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

+ (_NSRange)searchRangeForString:(id)a3 aroundLocation:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = v6 - 1;
  if (v6 > a4)
    v7 = a4;
  if (!a4)
    v7 = 0;
  if (v7 >= 0x12D)
    v8 = v7 - 300;
  else
    v8 = 0;
  if (v7 + 200 >= v6 || v7 >= v6)
    v10 = v6;
  else
    v10 = v7 + 200;
  if (v10 == v8)
  {
LABEL_21:
    v12 = 0;
  }
  else
  {
    while ((objc_msgSend(v5, "characterAtIndex:", v8) & 0xFC00) == 0xDC00)
    {
      if (v10 == ++v8)
        goto LABEL_21;
    }
    v11 = 0;
    while ((objc_msgSend(v5, "characterAtIndex:", v10 - 1 + v11) & 0xFC00) == 0xD800)
    {
      if (--v11 + v10 == v8)
        goto LABEL_21;
    }
    v12 = v10 - v8 + v11;
    a4 = v8;
  }

  v13 = a4;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

+ (unint64_t)maxContextLength
{
  return 400;
}

@end
