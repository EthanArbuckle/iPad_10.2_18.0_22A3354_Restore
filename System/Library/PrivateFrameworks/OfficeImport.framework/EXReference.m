@implementation EXReference

+ (id)edReferenceFromXmlReference:(id)a3
{
  id v4;
  void *v5;
  _BYTE v7[16];

  v4 = a3;
  if ((objc_msgSend(a1, "edAreaReferenceFromXmlReference:areaReference:", v4, v7) & 1) != 0)
  {
    +[EDReference referenceWithAreaReference:](EDReference, "referenceWithAreaReference:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)edAreaReferenceFromXmlReference:(id)a3 areaReference:(EDAreaReference *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int firstRow;
  int lastRow;
  int lastColumn;
  int firstColumn;
  BOOL v24;
  uint64_t v26;
  void *v27;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    v8 = operator new[]();
    objc_msgSend(v6, "getCharacters:range:", v8, 0, v7);
    *(_QWORD *)&a4->firstRow = -1;
    *(_QWORD *)&a4->lastRow = -1;
    if (!v7)
      goto LABEL_38;
    v26 = v8;
    v27 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = v8 - 2;
    v15 = 1;
    v16 = 1;
    do
    {
      v17 = *(unsigned __int16 *)(v14 + 2 * v7);
      if (v17 != 36)
      {
        if (v17 == 58)
        {
          if (v10)
            a4->lastColumn = v13;
          v13 = 0;
          if (v11 >= 1)
          {
            v11 = 0;
            v10 = 0;
            v9 = 0;
            a4->lastRow = v12 - 1;
            v16 = 1;
            v15 = 1;
            v12 = 0;
          }
          else
          {
            v12 = 0;
            v11 = 0;
            v10 = 0;
            v9 = 0;
            v16 = 1;
            v15 = 1;
          }
        }
        else
        {
          if ((v17 - 48) > 9)
          {
            if (v11)
              v18 = v11;
            else
              v18 = v9;
            v19 = v17 - 97;
            if ((v17 - 97) > 0x19 && (v19 = v17 - 65, (v17 - 65) > 0x19))
            {
              +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
              v19 = 0;
            }
            else
            {
              ++v10;
            }
            if (v9 == v18)
              v13 = v19;
            else
              v13 += 26 * v15 + 26 * v15 * v19;
            if (v9 == v18)
              v11 = v9;
            else
              v11 = v18;
            if (v9 != v18)
              v15 *= 26;
          }
          else
          {
            if (v9)
              v12 += (v17 - 48) * 10 * v16;
            else
              v12 = v17 - 48;
            if (v9)
              v16 *= 10;
          }
          ++v9;
        }
      }
      --v7;
    }
    while (v7);
    if (v10)
      a4->firstColumn = v13;
    v8 = v26;
    v6 = v27;
    if (v11 > 0)
    {
      firstRow = v12 - 1;
      a4->firstRow = v12 - 1;
    }
    else
    {
LABEL_38:
      firstRow = a4->firstRow;
    }
    lastRow = a4->lastRow;
    lastColumn = a4->lastColumn;
    firstColumn = a4->firstColumn;
    if (lastRow == -1 && lastColumn == -1)
    {
      a4->lastRow = firstRow;
      a4->lastColumn = firstColumn;
      lastRow = firstRow;
      lastColumn = firstColumn;
    }
    v24 = 0;
    if (firstColumn <= 0x4000 && lastColumn <= 0x4000 && firstRow <= 0x100000 && lastRow <= 0x100000)
    {
      MEMORY[0x22E2DD3F0](v8, 0x1000C80BDFB0063);
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)xmlReferenceFromAreaReference:(EDAreaReference *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int lastColumn;
  int lastRow;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  if (a3->firstColumn == -1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "numberToStringBase26:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3->firstRow == -1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (a3->firstRow + 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  lastColumn = a3->lastColumn;
  if (lastColumn < 0
    || (lastRow = a3->lastRow, lastRow < 0)
    || a3->firstColumn == lastColumn && a3->firstRow == lastRow)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(a1, "numberToStringBase26:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (a3->lastRow + 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@:%@%@"), v5, v7, v13, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

+ (id)xmlReferenceFromEDReference:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];

  v4 = a3;
  v8[0] = objc_msgSend(v4, "areaReference");
  v8[1] = v5;
  objc_msgSend(a1, "xmlReferenceFromAreaReference:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)edDiscontinousReferencesFromXmlRanges:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int i;
  void *v8;
  char v9;
  EDReference *v10;
  _BYTE v12[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; objc_msgSend(v6, "count") > (unint64_t)i; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(a1, "edAreaReferenceFromXmlReference:areaReference:", v8, v12);

      if ((v9 & 1) != 0)
      {
        v10 = -[EDReference initWithAreaReference:]([EDReference alloc], "initWithAreaReference:", v12);
        objc_msgSend(v5, "addObject:", v10);

      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)xmlRangesFromDiscontinuousReferences:(id)a3
{
  id v4;
  unsigned int v5;
  __CFString *i;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = 0;
  for (i = &stru_24F3BFFF8; ; i = (__CFString *)v11)
  {
    v7 = v5;
    if (objc_msgSend(v4, "count") <= (unint64_t)v5)
      break;
    objc_msgSend(v4, "objectAtIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "xmlReferenceFromEDReference:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](i, "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByAppendingString:", CFSTR(" "));
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = v7 + 1;
  }

  return i;
}

+ (id)numberToStringBase26:(int)a3
{
  uint64_t v3;
  int v4;
  BOOL v5;
  uint64_t *v6;
  unsigned int v7;
  _WORD *v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v13 = 0;
  if (a3 < 26)
  {
    LOWORD(v13) = a3 % 26 + 65;
LABEL_9:
    v11 = 1;
    goto LABEL_10;
  }
  v3 = 0;
  do
  {
    v4 = a3 / 0x1Au - 1;
    *((_WORD *)&v13 + v3++) = a3 % 0x1Au + 65;
    v5 = a3 > 0x2BD;
    a3 = v4;
  }
  while (v5);
  v6 = &v13;
  *((_WORD *)&v13 + v3) = v4 % 26 + 65;
  if (!(_DWORD)v3)
    goto LABEL_9;
  v7 = v3 + 1;
  v8 = (_WORD *)&v13 + (int)v3;
  v9 = v7 >> 1;
  do
  {
    v10 = *(char *)v6;
    *(_WORD *)v6 = *v8;
    v6 = (uint64_t *)((char *)v6 + 2);
    *v8-- = v10;
    --v9;
  }
  while (v9);
  v11 = v7;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v13, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
