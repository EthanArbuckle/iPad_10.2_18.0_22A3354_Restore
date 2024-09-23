@implementation STRootStorage

- (STRootStorage)initWithName:(id)a3 andMode:(int)a4
{
  int v6;
  uint64_t StructuredStorage;
  uint64_t v8;
  uint64_t StorageFromRoot;
  objc_super v11;
  uint64_t v12;

  v12 = 0;
  self->m_pvBuf = 0;
  self->m_StorageData = 0;
  v6 = StgModeFromSTStgMode(*(uint64_t *)&a4);
  if (v6 == 1)
  {
    StructuredStorage = createStructuredStorage((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 1, (uint64_t *)&self->m_pCRoot);
  }
  else
  {
    if ((v6 & 0xFFFFFFFD) != 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    StructuredStorage = openStructuredStorage((const char *)objc_msgSend(a3, "fileSystemRepresentation"), v6, (uint64_t *)&self->m_pCRoot);
  }
  v8 = StructuredStorage;
  if ((_DWORD)StructuredStorage)

LABEL_8:
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", v8);
  StorageFromRoot = getStorageFromRoot((uint64_t)self->m_pCRoot, &v12);
  if ((_DWORD)StorageFromRoot)

  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", StorageFromRoot);
  v11.receiver = self;
  v11.super_class = (Class)STRootStorage;
  return -[STStorage initWithCStorage:](&v11, sel_initWithCStorage_, v12);
}

- (STRootStorage)initWithMutableData:(id)a3 andMode:(int)a4
{
  id v6;
  int v7;
  int8x8_t v8;
  uint64_t StructuredStorageInBuf;
  objc_super v11;
  uint64_t v12;

  v12 = 0;
  self->m_StorageData = 0;
  if (StgModeFromSTStgMode(*(uint64_t *)&a4) == 1)
  {
    self->m_StorageData = (NSMutableData *)a3;
    v6 = a3;
    if (-[NSMutableData length](self->m_StorageData, "length") <= 7)
      -[NSMutableData setLength:](self->m_StorageData, "setLength:", 8);
    *(_QWORD *)-[NSMutableData mutableBytes](self->m_StorageData, "mutableBytes") = self;
    self->m_pvBuf = -[NSMutableData mutableBytes](self->m_StorageData, "mutableBytes") + 8;
    v7 = -[NSMutableData length](self->m_StorageData, "length");
    StructuredStorageInBuf = createStructuredStorageInBuf(&self->m_pvBuf, v7 - 8, (uint64_t)storageBufferReallocFunction, 1, (uint64_t *)&self->m_pCRoot, v8);
  }
  else
  {
    self->m_pvBuf = (void *)objc_msgSend(a3, "mutableBytes");
    StructuredStorageInBuf = openStructuredStorageInBuf(&self->m_pvBuf, objc_msgSend(a3, "length"), 0, (uint64_t *)&self->m_pCRoot);
  }
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", StructuredStorageInBuf);
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", getStorageFromRoot((uint64_t)self->m_pCRoot, &v12));
  v11.receiver = self;
  v11.super_class = (Class)STRootStorage;
  return -[STStorage initWithCStorage:](&v11, sel_initWithCStorage_, v12);
}

- (void)dealloc
{
  uint64_t **p_m_pCRoot;
  NSMutableData *m_StorageData;
  objc_super v5;

  self->super.m_pCStorage = 0;
  p_m_pCRoot = (uint64_t **)&self->m_pCRoot;
  if (*p_m_pCRoot)
    closeStructuredStorage(p_m_pCRoot);
  m_StorageData = self->m_StorageData;
  if (m_StorageData)
  {
    memmove(-[NSMutableData mutableBytes](m_StorageData, "mutableBytes"), -[NSMutableData mutableBytes](self->m_StorageData, "mutableBytes") + 8, -[NSMutableData length](self->m_StorageData, "length") - 8);
    -[NSMutableData setLength:](self->m_StorageData, "setLength:", -[NSMutableData length](self->m_StorageData, "length") - 4);

    self->m_StorageData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)STRootStorage;
  -[STStorage dealloc](&v5, sel_dealloc);
}

- (void)resizeStorageBuffer:(unint64_t)a3
{
  void *result;

  -[NSMutableData setLength:](self->m_StorageData, "setLength:", a3 + 8);
  result = -[NSMutableData mutableBytes](self->m_StorageData, "mutableBytes") + 8;
  self->m_pvBuf = result;
  return result;
}

- (id)getDocumentProperty:(int)a3 withId:(int)a4 PropType:(int *)a5
{
  return -[STRootStorage getDocumentProperty:withId:PropType:throwOnError:](self, "getDocumentProperty:withId:PropType:throwOnError:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 1);
}

- (id)getDocumentProperty:(int)a3 withId:(int)a4 PropType:(int *)a5 throwOnError:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t DocumentProperty;
  char *v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  int v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  int v19;
  unsigned int v20;
  char *__s;

  v6 = a6;
  __s = 0;
  *a5 = -1;
  v20 = 1;
  DocumentProperty = getDocumentProperty((uint64_t)self->m_pCRoot, a3, *(uint64_t *)&a4, (int *)&v20, (void **)&__s);
  v9 = __s;
  if ((_DWORD)DocumentProperty)
    v10 = 1;
  else
    v10 = __s == 0;
  if (!v10)
  {
    v12 = v20;
    v13 = 1;
    v14 = 4;
    v15 = 2;
    switch(v20)
    {
      case 0u:
        goto LABEL_10;
      case 1u:
        goto LABEL_20;
      case 2u:
        goto LABEL_18;
      case 3u:
        v15 = 8;
LABEL_10:
        v14 = v15;
        goto LABEL_20;
      case 4u:
      case 6u:
        goto LABEL_12;
      default:
        v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "long TypeLength(TypeTag)", 4);
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"), 56, 0, "Unsupported type tag encountered in structured storage library.");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        v13 = 0;
        v12 = v20;
        v9 = __s;
LABEL_12:
        if (v12 == 1)
        {
          v14 = 4;
        }
        else if (v12 == 6 || v12 == 4)
        {
          v14 = *(_QWORD *)v9;
          v9 += 4 * (v12 == 6);
        }
        else if (v13)
        {
LABEL_18:
          v14 = strlen(v9) + 1;
        }
        else
        {
          v14 = 0;
        }
LABEL_20:
        v11 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, v14);
        if (__s)
          goto LABEL_21;
        goto LABEL_22;
    }
  }
  v11 = 0;
  if (__s)
LABEL_21:
    freeDocumentProperty((void **)&__s);
LABEL_22:
  if ((_DWORD)DocumentProperty)
  {
    if (v6)
LABEL_24:
      +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", DocumentProperty);
  }
  else
  {
    if (v20 < 7 && ((0x5Fu >> v20) & 1) != 0)
    {
      v19 = dword_22A4C0E7C[v20];
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STTypeTag STTypeTagFromTypeTag(TypeTag)");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"), 76, 0, "Unsupported type tag encountered in structured storage library.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v19 = -1;
    }
    *a5 = v19;
    if (v6)
      goto LABEL_24;
  }
  return v11;
}

- (id)getStringDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v13;
  void *v14;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v14 = 0;
  v7 = -[STRootStorage getShortDocumentPropertyWithId:givenPropStream:](self, "getShortDocumentPropertyWithId:givenPropStream:", 1);
  if (v7 <= 0x270Fu)
  {
    if (v7 > 0x4E1u)
    {
      switch(v7)
      {
        case 0x4E2u:
          v8 = 15;
          break;
        case 0x4E3u:
          v8 = 11;
          break;
        case 0x4E4u:
          v8 = 12;
          break;
        case 0x4E5u:
          v8 = 13;
          break;
        case 0x4E6u:
          v8 = 14;
          break;
        default:
          goto LABEL_25;
      }
      goto LABEL_27;
    }
    if (v7 == 932)
    {
      v8 = 8;
      goto LABEL_27;
    }
    v9 = 0;
    if (v7 == 1200)
      return v9;
    if (v7 == 1201)
    {
      v8 = 10;
      goto LABEL_27;
    }
LABEL_25:
    v8 = CFStringConvertEncodingToNSStringEncoding(v7);
    if (v8 == 0xFFFFFFFF)
    {
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSStringEncoding NSStringEncodingFromCodePage(UInt16)");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"), 117, 0, "Encountered unhandled code page");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v8 = 1;
    }
    goto LABEL_27;
  }
  if (v7 <= 0xC42Bu)
  {
    if (v7 == 10000)
    {
      v8 = 30;
      goto LABEL_27;
    }
    if (v7 == 28591)
    {
      v8 = 5;
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if (v7 == 50220)
  {
    v8 = 21;
    goto LABEL_27;
  }
  if (v7 == 51932)
  {
    v8 = 3;
    goto LABEL_27;
  }
  if (v7 != 65001)
    goto LABEL_25;
  v8 = 4;
LABEL_27:
  v13 = -1;
  v11 = -[STRootStorage getDocumentProperty:withId:PropType:throwOnError:](self, "getDocumentProperty:withId:PropType:throwOnError:", v4, v5, &v13, 0);
  if (v13 == 2)
  {
    if (v11)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), v8);
    else
      return 0;
  }
  return v14;
}

- (int)getLongDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4
{
  id v4;
  int v6;
  int v7;

  v7 = -1;
  v6 = -1;
  v4 = -[STRootStorage getDocumentProperty:withId:PropType:throwOnError:](self, "getDocumentProperty:withId:PropType:throwOnError:", *(_QWORD *)&a4, *(_QWORD *)&a3, &v6, 0);
  if (v6 == 1)
    return *(_DWORD *)objc_msgSend(v4, "bytes");
  return v7;
}

- (signed)getShortDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4
{
  id v4;
  int v6;
  signed __int16 v7;

  v7 = -1;
  v6 = -1;
  v4 = -[STRootStorage getDocumentProperty:withId:PropType:throwOnError:](self, "getDocumentProperty:withId:PropType:throwOnError:", *(_QWORD *)&a4, *(_QWORD *)&a3, &v6, 0);
  if (!v6)
    return *(_WORD *)objc_msgSend(v4, "bytes");
  return v7;
}

- (void)setDocumentProperty:(int)a3 withId:(int)a4 AndType:(int)a5 AndValue:(void *)a6
{
  uint64_t v7;
  int v10;
  uint64_t v11;

  v7 = *(_QWORD *)&a4;
  if (a5 >= 6)
  {
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TypeTag TypeTagFromSTTypeTag(STTypeTag)");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"), 37, 0, "Unsupported type tag encountered in structured storage library.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v10 = -1;
  }
  else
  {
    v10 = dword_22A4C0E98[a5];
  }
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", setDocumentProperty((uint64_t)self->m_pCRoot, a3, v7, v10, (char *)a6));
}

- (void)setStringDocumentPropertyWithId:(int)a3 to:(id)a4 givenPropStream:(int)a5
{
  uint64_t v5;
  uint64_t v7;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  if (-[STRootStorage getShortDocumentPropertyWithId:givenPropStream:](self, "getShortDocumentPropertyWithId:givenPropStream:", 1, *(_QWORD *)&a5) == -535)-[STRootStorage setDocumentProperty:withId:AndType:AndValue:](self, "setDocumentProperty:withId:AndType:AndValue:", v5, v7, 2, objc_msgSend(a4, "UTF8String"));
}

- (void)setLongDocumentPropertyWithId:(int)a3 to:(int)a4 givenPropStream:(int)a5
{
  int v5;

  v5 = a4;
  -[STRootStorage setDocumentProperty:withId:AndType:AndValue:](self, "setDocumentProperty:withId:AndType:AndValue:", *(_QWORD *)&a5, *(_QWORD *)&a3, 1, &v5);
}

- (void)setShortDocumentPropertyWithId:(int)a3 to:(signed __int16)a4 givenPropStream:(int)a5
{
  signed __int16 v5;

  v5 = a4;
  -[STRootStorage setDocumentProperty:withId:AndType:AndValue:](self, "setDocumentProperty:withId:AndType:AndValue:", *(_QWORD *)&a5, *(_QWORD *)&a3, 0, &v5);
}

- (void)setBlobDocumentPropertyWithId:(int)a3 to:(void *)a4 givenPropStream:(int)a5
{
  -[STRootStorage setDocumentProperty:withId:AndType:AndValue:](self, "setDocumentProperty:withId:AndType:AndValue:", *(_QWORD *)&a5, *(_QWORD *)&a3, 5, a4);
}

- (void)setDefaultDocumentProperties
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", setDefaultDocumentProperties((uint64_t)self->m_pCRoot));
}

@end
