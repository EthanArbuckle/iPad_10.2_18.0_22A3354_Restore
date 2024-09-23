@implementation OISFUDataRepresentation

- (BOOL)isReadable
{
  return 1;
}

- (int64_t)dataLength
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUDataRepresentation dataLength]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"), 60, 0, "Abstract method.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUDataRepresentation inputStream]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"), 73, 0, "Abstract method.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (id)bufferedInputStream
{
  return -[OISFUBufferedInputStream initWithStream:dataLength:]([OISFUBufferedInputStream alloc], "initWithStream:dataLength:", -[OISFUDataRepresentation inputStream](self, "inputStream"), -[OISFUDataRepresentation dataLength](self, "dataLength"));
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  return -[OISFUBufferedInputStream initWithStream:bufferSize:]([OISFUBufferedInputStream alloc], "initWithStream:bufferSize:", -[OISFUDataRepresentation inputStream](self, "inputStream"), a3);
}

- (BOOL)hasSameLocationAs:(id)a3
{
  return 0;
}

- (_xmlDoc)xmlDocument
{
  id v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  xmlParserCtxtPtr PushParserCtxt;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xmlDoc *myDoc;
  void *context;
  char *chunk;

  context = (void *)MEMORY[0x22E2DDB58](self, a2);
  if (initMultiThreadedLibXMLUse_once != -1)
    dispatch_once(&initMultiThreadedLibXMLUse_once, &__block_literal_global_13);
  v3 = -[OISFUDataRepresentation bufferedInputStream](self, "bufferedInputStream");
  chunk = 0;
  v4 = objc_msgSend(v3, "readToOwnBuffer:size:", &chunk, -1);
  v5 = v4;
  if (v4 >> 31)
  {
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUDataRepresentation xmlDocument]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"), 107, 0, "overflow in xmlDocument");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  PushParserCtxt = xmlCreatePushParserCtxt(0, 0, chunk, v5, 0);
  if (!PushParserCtxt)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUDataRepresentationError"), CFSTR("xmlCreatePushParserCtxt() failed"));
  while (1)
  {
    v8 = objc_msgSend(v3, "readToOwnBuffer:size:", &chunk, -1);
    v9 = v8;
    if (!v8)
      break;
    if (v8 >> 31)
    {
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUDataRepresentation xmlDocument]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"), 120, 0, "overflow in xmlDocument");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    v11 = xmlParseChunk(PushParserCtxt, chunk, v9, 0);
    if ((_DWORD)v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUDataRepresentationError"), CFSTR("xmlParseChunk() failed: %d"), v11);
  }
  v12 = xmlParseChunk(PushParserCtxt, chunk, 0, 1);
  if ((_DWORD)v12)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUDataRepresentationError"), CFSTR("xmlParseChunk() failed: %d"), v12);
  myDoc = PushParserCtxt->myDoc;
  if (!PushParserCtxt->wellFormed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUDataRepresentationError"), CFSTR("XML document is not well formed."));
  xmlFreeParserCtxt(PushParserCtxt);
  objc_msgSend(v3, "close");
  objc_autoreleasePoolPop(context);
  return myDoc;
}

- (_xmlTextReader)xmlReader
{
  return -[OISFUDataRepresentation xmlReaderWithReadCallback:](self, "xmlReaderWithReadCallback:", SFUXmlReaderIORead);
}

- (_xmlTextReader)xmlReaderWithReadCallback:(void *)a3
{
  return xmlReaderForIO((xmlInputReadCallback)a3, (xmlInputCloseCallback)SFUXmlReaderIOClose, -[OISFUDataRepresentation inputStream](self, "inputStream"), 0, 0, 0);
}

- (_xmlTextReader)xmlReaderForGzippedData
{
  return -[OISFUDataRepresentation xmlReaderForGzippedDataWithInputStream:](self, "xmlReaderForGzippedDataWithInputStream:", 0);
}

- (_xmlTextReader)xmlReaderForGzippedDataWithInputStream:(id *)a3
{
  id v4;
  char v5;
  OISFUZipInflateInputStream *v6;
  int v8;
  unsigned __int16 v9;
  _BYTE v10[3];
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = -[OISFUDataRepresentation inputStream](self, "inputStream");
  if (objc_msgSend(v4, "readToBuffer:size:", v10, 10) != 10)
    return 0;
  v5 = v11;
  if ((v11 & 4) != 0)
  {
    v9 = 0;
    if (objc_msgSend(v4, "readToBuffer:size:", &v9, 2) != 2)
      return 0;
    if (v9)
    {
      v8 = 0;
      while (objc_msgSend(v4, "readToBuffer:size:", v10, 1) == 1)
      {
        if (++v8 >= v9)
          goto LABEL_3;
      }
      return 0;
    }
  }
LABEL_3:
  if ((v5 & 8) != 0)
  {
    v10[0] = 1;
    while (objc_msgSend(v4, "readToBuffer:size:", v10, 1) == 1)
    {
      if (!v10[0])
        goto LABEL_7;
    }
    return 0;
  }
LABEL_7:
  if ((v5 & 0x10) != 0)
  {
    v10[0] = 1;
    while (objc_msgSend(v4, "readToBuffer:size:", v10, 1) == 1)
    {
      if (!v10[0])
        goto LABEL_11;
    }
    return 0;
  }
LABEL_11:
  if ((v5 & 2) != 0 && objc_msgSend(v4, "readToBuffer:size:", v10, 2) != 2)
    return 0;
  v6 = -[OISFUZipInflateInputStream initWithInput:]([OISFUZipInflateInputStream alloc], "initWithInput:", v4);
  if (a3)
    *a3 = v6;
  return xmlReaderForIO((xmlInputReadCallback)SFUXmlReaderIORead, (xmlInputCloseCallback)SFUXmlReaderIOClose, v6, 0, 0, 0);
}

- (CGDataProvider)cgDataProvider
{
  id v2;
  uint64_t v3;

  v2 = -[OISFUDataRepresentation inputStream](self, "inputStream");
  if ((objc_msgSend(v2, "canSeek") & 1) == 0)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUDataRepresentation cgDataProvider]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"), 244, 0, "Need a seekable input stream for -cgDataProvider");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return CGDataProviderCreateSequential(v2, &SFUCGDataProviderCallbacks);
}

- (unint64_t)readIntoData:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;

  v5 = objc_msgSend(a3, "length");
  v6 = -[OISFUDataRepresentation bufferedInputStream](self, "bufferedInputStream");
  for (i = 0; ; objc_msgSend(a3, "appendBytes:length:", i, v7))
  {
    v7 = objc_msgSend(v6, "readToOwnBuffer:size:", &i, -1);
    if (!v7)
      break;
  }
  objc_msgSend(v6, "close");
  return objc_msgSend(a3, "length") - v5;
}

- (unint64_t)hash
{
  return -[OISFUDataRepresentation uint32Hash](self, "uint32Hash");
}

- (unsigned)uint32Hash
{
  void *v3;
  int64_t v4;
  id v5;
  char *v6;
  uint64_t v7;

  if (!self->mHasHash && -[OISFUDataRepresentation isReadable](self, "isReadable"))
  {
    objc_sync_enter(self);
    if (!self->mHasHash && -[OISFUDataRepresentation isReadable](self, "isReadable"))
    {
      v3 = (void *)MEMORY[0x22E2DDB58]();
      v4 = -[OISFUDataRepresentation dataLength](self, "dataLength");
      v5 = -[OISFUDataRepresentation inputStream](self, "inputStream");
      v6 = (char *)malloc_type_malloc(0x1008uLL, 0x39413CC6uLL);
      if (!v6)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Failed to allocate hash buffer for SFEData"));
      v7 = objc_msgSend(v5, "readToBuffer:size:", v6, 4096);
      *(_QWORD *)&v6[v7] = v4;
      self->mHash = SFUHash(v6, v7 + 8);
      free(v6);
      __dmb(0xBu);
      self->mHasHash = 1;
      objc_autoreleasePoolPop(v3);
    }
    objc_sync_exit(self);
  }
  return self->mHash;
}

- (id)sha1Hash
{
  void *v3;

  if (!self->mHasSha1Hash && -[OISFUDataRepresentation isReadable](self, "isReadable"))
  {
    objc_sync_enter(self);
    if (!self->mHasSha1Hash && -[OISFUDataRepresentation isReadable](self, "isReadable"))
    {
      v3 = (void *)MEMORY[0x22E2DDB58]();
      self->mSha1Hash = (NSData *)+[OISFUCryptoUtils sha1HashFromStorage:](OISFUCryptoUtils, "sha1HashFromStorage:", self);
      objc_autoreleasePoolPop(v3);
      __dmb(0xBu);
      self->mHasSha1Hash = 1;
    }
    objc_sync_exit(self);
  }
  return self->mSha1Hash;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v19;
  char *v20;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[OISFUDataRepresentation dataLength](self, "dataLength");
  if (v5 != objc_msgSend(a3, "dataLength"))
    return 0;
  if (-[OISFUDataRepresentation hasSameLocationAs:](self, "hasSameLocationAs:", a3))
    return 1;
  if (!-[OISFUDataRepresentation isReadable](self, "isReadable") || !objc_msgSend(a3, "isReadable"))
    return 0;
  v7 = (void *)MEMORY[0x22E2DDB58]();
  v8 = -[OISFUDataRepresentation bufferedInputStream](self, "bufferedInputStream");
  v9 = objc_msgSend(a3, "bufferedInputStream");
  v19 = 0;
  v20 = 0;
  if (v5 < 1)
  {
LABEL_20:
    v6 = 1;
  }
  else
  {
    v10 = (void *)v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      if (v12 == v14)
      {
        v15 = objc_msgSend(v8, "readToOwnBuffer:size:", &v20, -1);
        v11 = v19;
        v12 = v20;
        v14 = &v20[v15];
      }
      if (v11 == v13)
      {
        v16 = objc_msgSend(v10, "readToOwnBuffer:size:", &v19, -1);
        v11 = v19;
        v12 = v20;
        v13 = &v19[v16];
      }
      v17 = v14 - v12 >= v13 - v11 ? v13 - v11 : v14 - v12;
      if (!v17 || memcmp(v12, v11, v17))
        break;
      v12 += v17;
      v11 += v17;
      v19 = v11;
      v20 = v12;
      v5 -= v17;
      if (v5 <= 0)
        goto LABEL_20;
    }
    v6 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v6;
}

- (int64_t)compare:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  int v20;
  char *v21;
  char *v22;

  if (self == a3)
    return 0;
  v5 = -[OISFUDataRepresentation dataLength](self, "dataLength");
  v6 = objc_msgSend(a3, "dataLength");
  if (v5 < v6)
    return -1;
  if (v5 > v6)
    return 1;
  if (-[OISFUDataRepresentation hasSameLocationAs:](self, "hasSameLocationAs:", a3))
    return 0;
  v9 = (void *)MEMORY[0x22E2DDB58]();
  v10 = -[OISFUDataRepresentation bufferedInputStream](self, "bufferedInputStream");
  v11 = objc_msgSend(a3, "bufferedInputStream");
  v21 = 0;
  v22 = 0;
  if (v5 < 1)
  {
LABEL_26:
    v7 = 0;
  }
  else
  {
    v12 = (void *)v11;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v7 = 1;
    while (1)
    {
      if (v14 == v16)
      {
        v17 = objc_msgSend(v10, "readToOwnBuffer:size:", &v22, -1);
        v13 = v21;
        v14 = v22;
        v16 = &v22[v17];
      }
      if (v13 == v15)
      {
        v18 = objc_msgSend(v12, "readToOwnBuffer:size:", &v21, -1);
        v13 = v21;
        v14 = v22;
        v15 = &v21[v18];
      }
      if (v16 == v14 && v15 != v13)
        break;
      if (v16 != v14 && v15 == v13)
        goto LABEL_28;
      if (v16 - v14 >= (unint64_t)(v15 - v13))
        v19 = v15 - v13;
      else
        v19 = v16 - v14;
      if (!v19)
        goto LABEL_26;
      v20 = memcmp(v14, v13, v19);
      if (v20 < 0)
        break;
      if (v20)
        goto LABEL_28;
      v14 += v19;
      v13 += v19;
      v21 = v13;
      v22 = v14;
      v5 -= v19;
      if (v5 <= 0)
        goto LABEL_26;
    }
    v7 = -1;
  }
LABEL_28:
  objc_autoreleasePoolPop(v9);
  return v7;
}

@end
