@implementation TCDumpBlob

- (TCDumpBlob)initWithSize_:(unint64_t)a3
{
  TCDumpBlob *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCDumpBlob;
  result = -[TCDumpType init](&v5, sel_init);
  if (result)
    result->mSize = a3;
  return result;
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  unint64_t mSize;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  void *v9;
  void *v10;
  xmlNode *v11;
  unsigned __int8 *v12;
  char *v13;
  size_t v14;
  int v15;
  void *v16;
  char *v17;
  unsigned __int8 *v18;
  size_t v19;
  char v20;
  int v21;
  void *v22;
  void *v26;
  char v27[17];
  char __str[49];
  _BYTE __ptr[16];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  mSize = self->mSize;
  if (mSize)
  {
    v6 = 0;
    do
    {
      v7 = mSize - v6;
      if (v7 >= 0x10)
        v8 = 16;
      else
        v8 = v7;
      if (fread(__ptr, 1uLL, v8, a3) != v8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TCDumpBlob fromBinary:toXml:state:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Common/Utilities/TCDump.mm");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 487, 0, "Unexpected number of bytes read");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v11 = xmlNewNode(0, (const xmlChar *)"row");
      xmlAddChild(a4, v11);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04lX"), v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sfaxmlSetNSStringNoNsProp(v11, (const xmlChar *)"offset", v26);
      if (v8)
      {
        v12 = __ptr;
        v13 = __str;
        v14 = 49;
        do
        {
          v15 = *v12++;
          snprintf(v13, v14, "%02X ", v15);
          v14 -= 3;
          v13 += 3;
        }
        while (3 * v8 + v14 != 49);
      }
      __str[3 * v8 + 2] = 0;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", __str);
      sfaxmlSetNSStringNoNsProp(v11, (const xmlChar *)"hex", v16);
      if (v8)
      {
        v17 = v27;
        v18 = __ptr;
        v19 = v8;
        do
        {
          v21 = *v18++;
          v20 = v21;
          if ((v21 - 127) < 0xFFFFFFA1)
            v20 = 46;
          *v17++ = v20;
          --v19;
        }
        while (v19);
      }
      v27[v8] = 0;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v27);
      sfaxmlSetNSStringNoNsProp(v11, (const xmlChar *)"chars", v22);

      v6 += v8;
      mSize = self->mSize;
    }
    while (v6 < mSize);
  }
}

@end
