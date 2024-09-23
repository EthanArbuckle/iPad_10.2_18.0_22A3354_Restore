@implementation NSData(Base64Additions)

- (id)tsu_encodeToBase64String
{
  unint64_t v2;
  unint64_t v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t updated;
  unint64_t v14;
  size_t v15;
  unint64_t v16;
  _BYTE __dst[384];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  v3 = (v2 + 2) / 3;
  v4 = 8 * v3;
  if (v2 >= 0xBFFFFFFFFFFFFFFELL)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSData(Base64Additions) tsu_encodeToBase64String]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"), 86, 0, "Overflow when calculating buffer size!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    goto LABEL_5;
  }
  if ((v3 & 0x2000000000000000) != 0)
  {
LABEL_5:
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSData(Base64Additions) tsu_encodeToBase64String]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"), 87, 0, "Overflow when calculating buffer size!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = malloc_type_malloc(v4, 0x2EA6E3A7uLL);
  if (!v7)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSData(Base64Additions) tsu_encodeToBase64String]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"), 91, 0, "invalid nil value for '%{public}s'", "result");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v9 = objc_msgSend(a1, "bytes");
  if (v2)
  {
    v10 = (char *)v9;
    v11 = 0;
    v12 = 0;
    updated = 0;
    v14 = 384;
    v15 = v2;
    do
    {
      if (v2 >= v14)
        v16 = v14;
      else
        v16 = v2;
      v12 += 384;
      if (v12 <= v2)
      {
        memcpy(__dst, v10, sizeof(__dst));
        v10 += 384;
      }
      else
      {
        memcpy(__dst, v10, v15);
      }
      updated = TSUBase64UpdateBase64StringWithChunk((uint64_t)v7, updated, (uint64_t)__dst, v16 + v11);
      v14 += 384;
      v11 -= 384;
      v15 -= 384;
    }
    while (v12 < v2);
  }
  else
  {
    updated = 0;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v7, updated, 1);
}

- (id)tsu_encodeToBase64URLSafeString
{
  id v1;

  v1 = (id)objc_msgSend((id)objc_msgSend(a1, "base64EncodedStringWithOptions:", 0), "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR("-"), 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_24F3BFFF8, 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

+ (uint64_t)tsu_decodeFromBase64StringWithWhitespace:()Base64Additions
{
  return objc_msgSend(a1, "tsu_decodeFromBase64String:", objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[ \r\n\t]+"), &stru_24F3BFFF8, 1024, 0, objc_msgSend(a3, "length")));
}

+ (uint64_t)tsu_decodeFromBase64String:()Base64Additions
{
  return objc_msgSend(MEMORY[0x24BDBCE50], "tsu_decodeFromBase64CString:srcLength:", objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"));
}

+ (id)tsu_decodeFromBase64CString:()Base64Additions srcLength:
{
  size_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  unsigned __int8 v13;
  unsigned int v14;
  unsigned __int8 v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  size_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v26;
  int v27;
  unint64_t v28;
  size_t v29;
  uint64_t v30;
  _BYTE __src[384];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if ((a4 & 3) != 0)
    goto LABEL_2;
  v22 = (void *)MEMORY[0x22E2DDB58]();
  v23 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v23, 1);
  objc_autoreleasePoolPop(v22);
  if (v24)
  {
    if (objc_msgSend(v24, "length"))
      return v24;

  }
  if (a4)
  {
LABEL_2:
    v6 = (unint64_t)((double)a4 * 0.25 * 3.0);
    if (*(_BYTE *)(a4 + a3 - 1) == 61)
    {
      v7 = -2;
      if (*(_BYTE *)(a4 + a3 - 2) != 61)
        v7 = -1;
      v6 += v7;
    }
    v8 = (char *)malloc_type_calloc(v6, 1uLL, 0xA354556FuLL);
    if (!v8)
    {
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSData(Base64Additions) tsu_decodeFromBase64CString:srcLength:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"), 186, 0, "invalid nil value for '%{public}s'", "result");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    if (a4 < 5)
    {
      v11 = 0;
      v17 = 0;
      v12 = v8;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v12 = v8;
      do
      {
        v13 = DECODE_DATA[*(char *)(a3 + v10 + 1)];
        v14 = DECODE_DATA[*(char *)(a3 + v10 + 2)];
        v15 = DECODE_DATA[*(char *)(a3 + v10 + 3)];
        v16 = &__src[v11];
        *v16 = (v13 >> 4) | (4 * DECODE_DATA[*(char *)(a3 + v10)]);
        v16[1] = (v14 >> 2) | (16 * v13);
        v11 += 3;
        v16[2] = v15 | ((_BYTE)v14 << 6);
        if (v11 == 384)
        {
          memcpy(v12, __src, 0x180uLL);
          v11 = 0;
          v12 += 384;
        }
        v17 = v10 + 4;
        v18 = v10 + 8;
        v10 += 4;
      }
      while (v18 < a4);
    }
    if (v17 < a4)
    {
      v19 = DECODE_DATA[*(char *)(a3 + (v17 | 1))];
      v20 = v11 + 1;
      __src[v11] = (DECODE_DATA[*(char *)(a3 + (v17 | 1))] >> 4) | (4 * DECODE_DATA[*(char *)(a3 + v17)]);
      if ((v17 | 2) >= a4 || (v21 = *(char *)(a3 + (v17 | 2)), v21 == 61))
      {
        ++v11;
        if (!v20)
          return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1);
        goto LABEL_27;
      }
      v26 = DECODE_DATA[v21];
      v27 = (v26 >> 2) | (16 * v19);
      v28 = v17 | 3;
      v29 = v11 + 2;
      __src[v20] = v27;
      if (v28 < a4)
      {
        v30 = *(char *)(a3 + v28);
        if (v30 != 61)
        {
          v11 += 3;
          __src[v29] = DECODE_DATA[v30] | ((_BYTE)v26 << 6);
          if (!v11)
            return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1);
          goto LABEL_27;
        }
      }
      v11 += 2;
    }
    if (!v11)
      return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1);
LABEL_27:
    memcpy(v12, __src, v11);
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1);
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "data");
}

@end
