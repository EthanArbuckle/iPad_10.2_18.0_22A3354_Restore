@implementation CNVCardDataAnalyzer

+ (CNVCardDataAnalysis)analyzeData:(id)a3
{
  id v4;
  unint64_t v5;
  _BOOL8 v6;
  unint64_t v7;
  _BOOL8 v8;
  CNVCardDataAnalysis result;

  v4 = a3;
  v7 = 0;
  v8 = 0;
  if (objc_msgSend(v4, "length")
    && (objc_msgSend(a1, "tryUTF8VCard:analysis:", v4, &v7) & 1) == 0
    && (objc_msgSend(a1, "tryUTF16LEVCard:analysis:", v4, &v7) & 1) == 0
    && (objc_msgSend(a1, "tryUTF16BEVCard:analysis:", v4, &v7) & 1) == 0
    && (objc_msgSend(a1, "tryUTF16LEBOMVCard:analysis:", v4, &v7) & 1) == 0
    && (objc_msgSend(a1, "tryUTF16BEBOMVCard:analysis:", v4, &v7) & 1) == 0
    && (objc_msgSend(a1, "tryUTF16WithByteOrderMarker:analysis:", v4, &v7) & 1) == 0)
  {
    objc_msgSend(a1, "tryUTF16ByInferrence:analysis:", v4, &v7);
  }

  v5 = v7;
  v6 = v8;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)tryUTF8VCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  return objc_msgSend(a1, "tryVCardEncoding:data:analysis:", 4, a3, a4);
}

+ (BOOL)tryUTF16LEVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  return objc_msgSend(a1, "tryVCardEncoding:data:analysis:", 2483028224, a3, a4);
}

+ (BOOL)tryUTF16BEVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  return objc_msgSend(a1, "tryVCardEncoding:data:analysis:", 2415919360, a3, a4);
}

+ (BOOL)tryUTF16LEBOMVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v6 = a3;
  objc_msgSend(CFSTR("BEGIN:VCARD"), "dataUsingEncoding:", 2483028224);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\xFF\xFE", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "data:byPrependingData:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "data:isVersion30WithPrefix:encoding:", v6, v9, 2483028224);
  if (v10)
  {
    a4->var0 = 2483028224;
    a4->var1 = 1;
  }

  return v10;
}

+ (BOOL)tryUTF16BEBOMVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v6 = a3;
  objc_msgSend(CFSTR("BEGIN:VCARD"), "dataUsingEncoding:", 2415919360);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\xFE\xFF", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "data:byPrependingData:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "data:isVersion30WithPrefix:encoding:", v6, v9, 2415919360);
  if (v10)
  {
    a4->var0 = 2415919360;
    a4->var1 = 1;
  }

  return v10;
}

+ (BOOL)tryVCardEncoding:(unint64_t)a3 data:(id)a4 analysis:(CNVCardDataAnalysis *)a5
{
  id v8;
  void *v9;
  int v10;

  v8 = a4;
  objc_msgSend(CFSTR("BEGIN:VCARD"), "dataUsingEncoding:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "data:isVersion30WithPrefix:encoding:", v8, v9, a3);

  if (v10)
    a5->var0 = a3;

  return v10;
}

+ (BOOL)data:(id)a3 isVersion30WithPrefix:(id)a4 encoding:(unint64_t)a5
{
  id v8;
  char v9;

  v8 = a3;
  if (objc_msgSend(a1, "data:hasPrefix:", v8, a4))
  {
    if ((objc_msgSend(a1, "data:containsString:encoding:", v8, CFSTR("VERSION:3.0"), a5) & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(a1, "data:containsParam:value:encoding:", v8, CFSTR("VERSION"), CFSTR("3.0"), a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)data:(id)a3 containsString:(id)a4 encoding:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "dataUsingEncoding:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "data:containsSubdata:", v8, v9);

  return (char)a4;
}

+ (BOOL)data:(id)a3 containsParam:(id)a4 value:(id)a5 encoding:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "dataUsingEncoding:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "rangeOfData:options:range:", v11, 0, 0, objc_msgSend(v9, "length"));
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else
  {
    v15 = v12 + v13;
    objc_msgSend(v9, "length");
    v28 = v10;
    objc_msgSend(v10, "dataUsingEncoding:", a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "rangeOfData:options:range:");
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      v17 = v16;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = objc_msgSend(&unk_1E957CEE8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = v17 - v15;
        v21 = *(_QWORD *)v30;
        v26 = v11;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(&unk_1E957CEE8);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dataUsingEncoding:", a6);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v9, "rangeOfData:options:range:", v23, 0, v15, v20);

            if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v14 = 0;
              v11 = v26;
              goto LABEL_16;
            }
          }
          v19 = objc_msgSend(&unk_1E957CEE8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v14 = 1;
          v11 = v26;
          if (v19)
            continue;
          break;
        }
      }
      else
      {
        v14 = 1;
      }
    }
LABEL_16:

    v10 = v28;
  }

  return v14;
}

+ (BOOL)tryUTF16WithByteOrderMarker:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6;
  int v7;
  int v8;
  unint64_t v9;
  BOOL result;

  v6 = a3;
  v7 = objc_msgSend(a1, "data:byteAtIndex:", v6, 0);
  v8 = objc_msgSend(a1, "data:byteAtIndex:", v6, 1);

  if (v7 == 254 && v8 == 255)
  {
    v9 = 2415919360;
LABEL_7:
    a4->var0 = v9;
    result = 1;
    a4->var1 = 1;
    return result;
  }
  result = 0;
  if (v7 == 255 && v8 == 254)
  {
    v9 = 2483028224;
    goto LABEL_7;
  }
  return result;
}

+ (BOOL)tryUTF16ByInferrence:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  BOOL v14;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  if (v7 >= 0x16)
    v8 = 22;
  else
    v8 = v7;
  if (v7 < 0x16)
    goto LABEL_16;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    if (!objc_msgSend(a1, "data:byteAtIndex:", v6, v9))
      ++v11;
    if (!objc_msgSend(a1, "data:byteAtIndex:", v6, v9 + 1))
      ++v10;
    v9 += 2;
  }
  while (v9 < v8);
  v12 = (double)v8 * 0.5;
  if ((double)v11 / v12 <= 0.8)
  {
    if ((double)v10 / v12 > 0.8)
    {
      v13 = 2483028224;
      goto LABEL_15;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v13 = 2415919360;
LABEL_15:
  a4->var0 = v13;
  v14 = 1;
LABEL_17:

  return v14;
}

+ (unsigned)data:(id)a3 byteAtIndex:(unint64_t)a4
{
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, a4, 1);
  return v5;
}

+ (BOOL)data:(id)a3 hasPrefix:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "rangeOfData:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  return v7 == 0;
}

+ (BOOL)data:(id)a3 containsSubdata:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "rangeOfData:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)data:(id)a3 byPrependingData:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DF0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v6);

  objc_msgSend(v8, "appendData:", v7);
  return v8;
}

@end
