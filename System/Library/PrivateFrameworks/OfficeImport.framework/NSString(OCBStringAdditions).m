@implementation NSString(OCBStringAdditions)

- (uint64_t)initWithCsString:()OCBStringAdditions
{
  unsigned int v4;
  const UInt8 *v5;
  CFStringRef v6;

  if (!a3)
    return objc_msgSend(a1, "init");
  v4 = *(_DWORD *)(a3 + 16);
  if (!v4)
    return objc_msgSend(a1, "init");
  if (*(_QWORD *)(a3 + 8))
    v5 = *(const UInt8 **)(a3 + 8);
  else
    v5 = (const UInt8 *)&unk_22A4C0734;
  if (!*(_WORD *)&v5[2 * v4 - 2])
    --v4;
  v6 = CFStringCreateWithBytes(0, v5, 2 * v4, 0x100u, 0);

  return (uint64_t)v6;
}

+ (id)stringWithCsString:()OCBStringAdditions
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCsString:", a3);
}

+ (id)stringWithOcText:()OCBStringAdditions
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOcText:", a3);
}

- (_DWORD)initWithOcText:()OCBStringAdditions
{
  __CFString *v3;
  _DWORD *v4;
  int v5;
  _DWORD *v6;
  __CFString *v7;
  const UInt8 *v8;
  int isSingleByteEncoding;
  int v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  CFStringEncoding v15;

  v3 = a1;
  if (!a3 || (v4 = a3, !a3[4]))
  {
    v7 = -[__CFString init](a1, "init");
LABEL_16:
    v3 = v7;
    v6 = v3;
    goto LABEL_17;
  }
  v5 = a3[2];
  if (v5 == 2)
  {
    v6 = (_DWORD *)operator new();
    OcText::OcText(v6, v4, 1);
    v5 = v6[2];
    v4 = v6;
  }
  else
  {
    v6 = 0;
  }
  v8 = (const UInt8 *)*((_QWORD *)v4 + 3);
  isSingleByteEncoding = OcText::isSingleByteEncoding(v5);
  v10 = v4[4];
  v11 = OCNsEncodingForOcEncoding(v4[2]);
  if (isSingleByteEncoding)
    v12 = 1;
  else
    v12 = 2;
  if (v11)
    goto LABEL_14;
  v14 = v4[4];
  v13 = v4[5];
  if ((_DWORD)v13 == (_DWORD)v14 || (_DWORD)v13 == (_DWORD)v14 + 1)
  {
    v12 = 1;
    v11 = 4;
    goto LABEL_14;
  }
  v12 = 2;
  v11 = 10;
  if (v13 == 2 * v14 || 2 * (v14 + 1) == v13)
  {
LABEL_14:
    v15 = CFStringConvertNSStringEncodingToEncoding(v11);
    v7 = (__CFString *)CFStringCreateWithBytes(0, v8, v10 * (uint64_t)v12, v15, 0);

    if (v6)
      (*(void (**)(_DWORD *))(*(_QWORD *)v6 + 8))(v6);
    goto LABEL_16;
  }
  if (v6)
  {
    (*(void (**)(_DWORD *))(*(_QWORD *)v6 + 8))(v6);
    v6 = 0;
  }
LABEL_17:

  return v6;
}

- (uint64_t)copyToOcText:()OCBStringAdditions
{
  return objc_msgSend(a1, "copyToOcText:encoding:", a3, 1);
}

- (void)copyToOcText:()OCBStringAdditions encoding:
{
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;

  v7 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(a1, "dataUsingWordEncoding:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  if (v9)
  {
    if (OcText::isSingleByteEncoding(a4))
      v10 = 1;
    else
      v10 = 2;
    OcText::allocBuffer(a3, v10 + v9, 1);
    OcText::copyBuffer(a3, (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v9);
    a3->var3 = objc_msgSend(a1, "length");
    a3->var1 = a4;
  }
  else
  {
    OcText::removeBuffer(a3);
  }

  objc_autoreleasePoolPop(v7);
}

- (id)dataUsingWordEncoding:()OCBStringAdditions
{
  unint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t v8;
  __int16 *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = OCNsEncodingForOcEncoding(a3);
  objc_msgSend(a1, "dataUsingEncoding:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (_QWORD *)objc_msgSend(MEMORY[0x24BDD17C8], "availableStringEncodings");
    while (*v6++)
    {
      objc_msgSend(a1, "dataUsingEncoding:");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v5 = (id)v8;
        goto LABEL_7;
      }
    }
    v5 = 0;
  }
LABEL_7:
  if (v4 == 10)
  {
    v5 = objc_retainAutorelease(v5);
    v9 = (__int16 *)objc_msgSend(v5, "bytes");
    v10 = objc_msgSend(v5, "length");
    if (v10)
    {
      if (*v9 == -257)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v9 + 1, v10 - 2, 0);
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v11;
      }
    }
  }
  return v5;
}

- (void)copyToCsString:()OCBStringAdditions
{
  void *v5;
  void *v6;
  unsigned int v7;

  v5 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(a1, "dataUsingWordEncoding:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  a3->var2 = 0;
  bzero(a3->var1, 2 * a3->var3);
  if (v7)
    CsString::append(a3, (const unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v7 >> 1);

  objc_autoreleasePoolPop(v5);
}

@end
