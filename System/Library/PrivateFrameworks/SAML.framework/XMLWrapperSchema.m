@implementation XMLWrapperSchema

- (XMLWrapperSchema)initWithSchemaData:(id)a3
{
  id v4;
  XMLWrapperSchema *v5;
  id v6;
  xmlDoc *Memory;
  xmlSchemaParserCtxt *v8;
  xmlSchemaParserCtxt *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)XMLWrapperSchema;
  v5 = -[XMLWrapperSchema init](&v11, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_retainAutorelease(v4);
  Memory = xmlReadMemory((const char *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0, 0, 0);
  if (!Memory)
  {
    NSLog(CFSTR("Schema could not be loaded"));
    goto LABEL_10;
  }
  defaultLoader = (uint64_t)xmlGetExternalEntityLoader();
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)XMLWExternalEntityLoader);
  v8 = xmlSchemaNewDocParserCtxt(Memory);
  if (!v8)
  {
    NSLog(CFSTR("Failed to create parser context for schema"));
    xmlFreeDoc(Memory);
LABEL_9:
    Memory = 0;
    goto LABEL_10;
  }
  v9 = v8;
  xmlSchemaSetParserErrors(v8, (xmlSchemaValidityErrorFunc)XMLWSchemaValidityError, (xmlSchemaValidityWarningFunc)XMLWSchemaValidityWarning, 0);
  v5->_schemaPtr = xmlSchemaParse(v9);
  xmlSchemaFreeParserCtxt(v9);
  xmlFreeDoc(Memory);
  if (!v5->_schemaPtr)
  {
    NSLog(CFSTR("Schema is not valid"));
    goto LABEL_9;
  }
LABEL_5:
  Memory = v5;
LABEL_10:

  return (XMLWrapperSchema *)Memory;
}

- (void)dealloc
{
  _xmlSchema *schemaPtr;
  objc_super v4;

  schemaPtr = self->_schemaPtr;
  if (schemaPtr)
    xmlSchemaFree(schemaPtr);
  v4.receiver = self;
  v4.super_class = (Class)XMLWrapperSchema;
  -[XMLWrapperSchema dealloc](&v4, sel_dealloc);
}

- (BOOL)validateDocument:(_xmlDoc *)a3 error:(id *)a4
{
  _xmlSchema *schemaPtr;
  xmlSchemaValidCtxtPtr v7;
  xmlSchemaValidCtxt *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    schemaPtr = self->_schemaPtr;
    if (schemaPtr)
    {
      v7 = xmlSchemaNewValidCtxt(schemaPtr);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        xmlSchemaSetValidErrors(v8, (xmlSchemaValidityErrorFunc)XMLWSchemaValidityErrorFunc, 0, v9);
        v10 = xmlSchemaValidateDoc(v8, a3);
        v11 = v10 == 0;
        if (a4 && v10)
        {
          v12 = (void *)MEMORY[0x24BDD1540];
          v23 = *MEMORY[0x24BDD0FC8];
          v24[0] = v9;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 100, v13);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        xmlSchemaFreeValidCtxt(v8);
        goto LABEL_11;
      }
      NSLog(CFSTR("Failed to create schema context"));
      if (a4)
      {
        v14 = (void *)MEMORY[0x24BDD1540];
        v21 = *MEMORY[0x24BDD0FC8];
        v22 = CFSTR("Failed to create schema context");
        v15 = (void *)MEMORY[0x24BDBCE70];
        v16 = &v22;
        v17 = &v21;
        goto LABEL_10;
      }
      return 0;
    }
  }
  NSLog(CFSTR("Invalid docPtr or schemaPtr given for validating DOM Document"), a2);
  if (!a4)
    return 0;
  v14 = (void *)MEMORY[0x24BDD1540];
  v19 = *MEMORY[0x24BDD0FC8];
  v20 = CFSTR("Invalid docPtr or schemaPtr given for validating DOM Document");
  v15 = (void *)MEMORY[0x24BDBCE70];
  v16 = &v20;
  v17 = &v19;
LABEL_10:
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 100, v9);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

@end
