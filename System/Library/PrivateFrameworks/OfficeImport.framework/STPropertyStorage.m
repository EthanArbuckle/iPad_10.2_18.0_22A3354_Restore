@implementation STPropertyStorage

- (STPropertyStorage)initWithPropertyStorage:(_SsrwPropertyStorage *)a3
{
  STPropertyStorage *v4;
  STPropertyStorage *v5;
  STPropertyStorage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STPropertyStorage;
  v4 = -[STPropertyStorage init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->m_pPropertyStorage = a3;
    v6 = v4;
  }

  return v5;
}

- (void)close
{
  propertyStorageClose((void **)&self->m_pPropertyStorage);
}

- (id)getDocumentPropertyWithId:(int)a3 propType:(int *)a4
{
  uint64_t v5;
  STPropVariant *v7;
  void *v8;

  v5 = *(_QWORD *)&a3;
  if (a4)
    *a4 = -1;
  v7 = objc_alloc_init(STPropVariant);
  if (propertyStorageGetPropertyValue((uint64_t *)self->m_pPropertyStorage, v5, (uint64_t)-[STPropVariant propVariant](v7, "propVariant")))
  {
    v8 = 0;
  }
  else
  {
    -[STPropVariant asDataOfType:](v7, "asDataOfType:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (int)getLongDocumentPropertyWithId:(int)a3
{
  void *v3;
  void *v4;
  int v6;
  int v8;

  v8 = 0;
  -[STPropertyStorage getDocumentPropertyWithId:propType:](self, "getDocumentPropertyWithId:propType:", *(_QWORD *)&a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v8 != 1 || v3 == 0)
    v6 = -1;
  else
    v6 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v3), "bytes");

  return v6;
}

- (signed)getShortDocumentPropertyWithId:(int)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  signed __int16 v6;
  int v8;

  v8 = 0;
  -[STPropertyStorage getDocumentPropertyWithId:propType:](self, "getDocumentPropertyWithId:propType:", *(_QWORD *)&a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v8)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
    v6 = -1;
  else
    v6 = *(_WORD *)objc_msgSend(objc_retainAutorelease(v3), "bytes");

  return v6;
}

- (id)getStringDocumentPropertyWithId:(int)a3
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  int v15;

  v3 = *(_QWORD *)&a3;
  v5 = (unsigned __int16)-[STPropertyStorage getShortDocumentPropertyWithId:](self, "getShortDocumentPropertyWithId:", 1);
  if (v5 > 0x270F)
  {
    if (v5 <= 50219)
    {
      if (v5 == 10000)
      {
        v6 = 30;
        goto LABEL_27;
      }
      if (v5 == 28591)
      {
        v6 = 5;
        goto LABEL_27;
      }
    }
    else
    {
      switch(v5)
      {
        case 50220:
          v6 = 21;
          goto LABEL_27;
        case 51932:
          v6 = 3;
          goto LABEL_27;
        case 65001:
          v6 = 4;
          goto LABEL_27;
      }
    }
  }
  else
  {
    if (v5 > 1249)
    {
      switch(v5)
      {
        case 1250:
          v6 = 15;
          break;
        case 1251:
          v6 = 11;
          break;
        case 1252:
          v6 = 12;
          break;
        case 1253:
          v6 = 13;
          break;
        case 1254:
          v6 = 14;
          break;
        default:
          goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v5)
    {
      case 932:
        v6 = 8;
        goto LABEL_27;
      case 1200:
        return 0;
      case 1201:
        v6 = 10;
        goto LABEL_27;
    }
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSStringEncoding NSStringEncodingFromCodePage(UInt16)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STPropertyStorage.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 51, 0, "Encountered unhandled code page");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = 1;
LABEL_27:
  v15 = 0;
  -[STPropertyStorage getDocumentPropertyWithId:propType:](self, "getDocumentPropertyWithId:propType:", v3, &v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v7 = 0;
  if (v15 == 2 && v10)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = objc_retainAutorelease(v11);
    v7 = (void *)objc_msgSend(v12, "initWithBytes:length:encoding:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), v6);
  }

  return v7;
}

- (id)getDocumentPropertyWithName:(id)a3 propType:(int *)a4
{
  unsigned int v7;

  v7 = 0;
  if (propertyStorageGetPropertyID((uint64_t *)self->m_pPropertyStorage, (char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &v7))return 0;
  -[STPropertyStorage getDocumentPropertyWithId:propType:](self, "getDocumentPropertyWithId:propType:", v7, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDocumentPropertyWithId:(int)a3 to:(id)a4
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", propertyStorageSetPropertyValueWithID((uint64_t *)self->m_pPropertyStorage, *(uint64_t *)&a3, (unsigned __int16 *)objc_msgSend(a4, "propVariant")));
}

- (void)setLongDocumentPropertyWithId:(int)a3 to:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  STPropVariant *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(STPropVariant);
  -[STPropVariant setLongValue:](v7, "setLongValue:", v4);
  -[STPropertyStorage setDocumentPropertyWithId:to:](self, "setDocumentPropertyWithId:to:", v5, v7);

}

- (void)setShortDocumentPropertyWithId:(int)a3 to:(signed __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  STPropVariant *v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(STPropVariant);
  -[STPropVariant setShortValue:](v7, "setShortValue:", v4);
  -[STPropertyStorage setDocumentPropertyWithId:to:](self, "setDocumentPropertyWithId:to:", v5, v7);

}

- (void)setStringDocumentPropertyWithId:(int)a3 to:(id)a4
{
  uint64_t v4;
  id v6;
  STPropVariant *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_alloc_init(STPropVariant);
  -[STPropVariant setStringValue:](v7, "setStringValue:", v6);

  -[STPropertyStorage setDocumentPropertyWithId:to:](self, "setDocumentPropertyWithId:to:", v4, v7);
}

- (void)setBlobDocumentPropertyWithName:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  STPropVariant *v8;
  uint64_t *m_pPropertyStorage;
  id v10;
  char *v11;
  unsigned int v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(STPropVariant);
  -[STPropVariant setBlobValue:](v8, "setBlobValue:", v6);

  v12 = 0;
  m_pPropertyStorage = (uint64_t *)self->m_pPropertyStorage;
  v10 = objc_retainAutorelease(v7);
  v11 = (char *)objc_msgSend(v10, "UTF8String");

  propertyStorageGetPropertyID(m_pPropertyStorage, v11, &v12);
  -[STPropertyStorage setDocumentPropertyWithId:to:](self, "setDocumentPropertyWithId:to:", v12, v8);

}

@end
