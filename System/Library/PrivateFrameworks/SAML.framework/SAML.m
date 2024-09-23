id SAMLParserErrorForErrorCode(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD1540]);
  SAMLErrorInfoForParserErrorCode(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("SAMLParserErrorDomain"), a1, v3);

  return v4;
}

id SAMLErrorInfoForParserErrorCode(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("An unknown error occurred.");
  if (a1 <= 299)
  {
    v2 = CFSTR("The document element was not a Response element.");
    v3 = CFSTR("The SAML element could not be created.");
    v4 = CFSTR("The SAML element could not be created due to an error upstream.");
    if (a1 != 201)
      v4 = CFSTR("An unknown error occurred.");
    if (a1 != 200)
      v3 = v4;
    if (a1 != 102)
      v2 = v3;
    if (a1 == 101)
      v1 = CFSTR("The SAML failed XML Schema validation.");
    if (a1 == 100)
      v1 = CFSTR("The SAML string does not use UTF-8 encoding.");
    if (a1 > 101)
      v1 = v2;
  }
  else if (a1 > 399)
  {
    if (a1 == 500)
      v1 = CFSTR("The SAML signature was missing or failed validation.");
    if (a1 == 401)
      v1 = CFSTR("The SAML assertion or authN failed validation due to invalid date attributes.");
    if (a1 == 400)
      v1 = CFSTR("The SAML response contains no valid assertion statements.");
  }
  else
  {
    switch(a1)
    {
      case 300:
        v1 = CFSTR("The SAML response is invalid.");
        break;
      case 301:
        v1 = CFSTR("The SAML response returned a status code indiciating failure.");
        break;
      case 302:
        v1 = CFSTR("The SAML response returned a status code indiciating failure from the reqestor.");
        break;
      case 303:
        v1 = CFSTR("The SAML response returned a status code indiciating failure from the responder.");
        break;
      case 304:
        v1 = CFSTR("The SAML response returned a status code indiciating failure because the version of the request message was incorrect.");
        break;
      default:
        break;
    }
  }
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id SAMLInvalidDocumentElementErrorForClass(objc_class *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  SAMLErrorInfoForParserErrorCode(102);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  NSStringFromClass(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("recievedClass"));

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SAMLParserErrorDomain"), 102, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id SAMLStringFromDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SAMLDateFormatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SAMLDateFormatter()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v2);

  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  return v0;
}

id SAMLDateFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SAMLDateFormatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromString:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

xmlParserInputPtr XMLWExternalEntityLoader(uint64_t a1, uint64_t a2, xmlParserCtxt *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  xmlChar *v17;
  xmlParserInputPtr v18;

  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLastObject");
  }
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v14, 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = xmlCharStrdup((const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
      v18 = xmlNewStringInputStream(a3, v17);
      v18->free = (xmlParserInputDeallocate)XMLWExternalEntityLoaderInputDeallocator;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void XMLWSchemaValidityError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;

  v10 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:arguments:", v11, &a9);

  NSLog(CFSTR("XML SCHEMA VALIDITY ERROR: %@"), v12);
}

void XMLWSchemaValidityWarning(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;

  v10 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:arguments:", v11, &a9);

  NSLog(CFSTR("XML SCHEMA VALIDITY WARNING: %@"), v12);
}

void XMLWSchemaValidityErrorFunc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xmlErrorPtr LastError;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (a2)
  {
    LastError = xmlGetLastError();
    if (LastError)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", LastError->file, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", LastError->message, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR %i: %@ line %i: %@\n"), LastError->code, v12, LastError->line, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v15, "initWithFormat:arguments:", v12, &a9);
    }

    objc_msgSend(a1, "appendString:", v14);
  }
}

uint64_t XMLWExternalEntityLoaderInputDeallocator()
{
  return ((uint64_t (*)(void))*MEMORY[0x24BEDE758])();
}

XMLWrapperNamespace *SAMLProtocolNamespace()
{
  XMLWrapperNamespace *v0;

  v0 = objc_alloc_init(XMLWrapperNamespace);
  -[XMLWrapperNamespace setPrefix:](v0, "setPrefix:", CFSTR("samlp"));
  -[XMLWrapperNamespace setHref:](v0, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:protocol"));
  return v0;
}

XMLWrapperNamespace *SAMLAssertionNamespace()
{
  XMLWrapperNamespace *v0;

  v0 = objc_alloc_init(XMLWrapperNamespace);
  -[XMLWrapperNamespace setPrefix:](v0, "setPrefix:", CFSTR("saml"));
  -[XMLWrapperNamespace setHref:](v0, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));
  return v0;
}

XMLWrapperNamespace *SAMLSignatureNamespace()
{
  XMLWrapperNamespace *v0;

  v0 = objc_alloc_init(XMLWrapperNamespace);
  -[XMLWrapperNamespace setPrefix:](v0, "setPrefix:", CFSTR("ds"));
  -[XMLWrapperNamespace setHref:](v0, "setHref:", CFSTR("http://www.w3.org/2000/09/xmldsig#"));
  return v0;
}

void sub_22FA319E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA31B94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x24BEDE5E8](parent, cur);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x24BEDE630](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE638]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x24BEDE650](buf);
}

int xmlBufferLength(const xmlBuffer *buf)
{
  return MEMORY[0x24BEDE658](buf);
}

xmlChar *__cdecl xmlCharStrdup(const char *cur)
{
  return (xmlChar *)MEMORY[0x24BEDE678](cur);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x24BEDE740](doc);
}

xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root)
{
  return (xmlNodePtr)MEMORY[0x24BEDE748](doc, root);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeNode(xmlNodePtr cur)
{
  MEMORY[0x24BEDE780](cur);
}

xmlExternalEntityLoader xmlGetExternalEntityLoader(void)
{
  return (xmlExternalEntityLoader)MEMORY[0x24BEDE7E0]();
}

xmlErrorPtr xmlGetLastError(void)
{
  return (xmlErrorPtr)MEMORY[0x24BEDE7F8]();
}

xmlDocPtr xmlNewDoc(const xmlChar *version)
{
  return (xmlDocPtr)MEMORY[0x24BEDE958](version);
}

xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar *name)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9A8](ns, name);
}

xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar *href, const xmlChar *prefix)
{
  return (xmlNsPtr)MEMORY[0x24BEDE9B0](node, href, prefix);
}

xmlAttrPtr xmlNewNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDE9B8](node, ns, name, value);
}

xmlAttrPtr xmlNewProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDE9C8](node, name, value);
}

xmlParserInputPtr xmlNewStringInputStream(xmlParserCtxtPtr ctxt, const xmlChar *buffer)
{
  return (xmlParserInputPtr)MEMORY[0x24BEDE9D0](ctxt, buffer);
}

xmlNodePtr xmlNewText(const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9D8](content);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x24BEDEA38](buf, doc, cur, *(_QWORD *)&level, *(_QWORD *)&format);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x24BEDEB00](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

void xmlSchemaFree(xmlSchemaPtr schema)
{
  MEMORY[0x24BEDEB70](schema);
}

void xmlSchemaFreeParserCtxt(xmlSchemaParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDEB78](ctxt);
}

void xmlSchemaFreeValidCtxt(xmlSchemaValidCtxtPtr ctxt)
{
  MEMORY[0x24BEDEB80](ctxt);
}

xmlSchemaParserCtxtPtr xmlSchemaNewDocParserCtxt(xmlDocPtr doc)
{
  return (xmlSchemaParserCtxtPtr)MEMORY[0x24BEDEB88](doc);
}

xmlSchemaValidCtxtPtr xmlSchemaNewValidCtxt(xmlSchemaPtr schema)
{
  return (xmlSchemaValidCtxtPtr)MEMORY[0x24BEDEB98](schema);
}

xmlSchemaPtr xmlSchemaParse(xmlSchemaParserCtxtPtr ctxt)
{
  return (xmlSchemaPtr)MEMORY[0x24BEDEBA0](ctxt);
}

void xmlSchemaSetParserErrors(xmlSchemaParserCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void *ctx)
{
  MEMORY[0x24BEDEBA8](ctxt, err, warn, ctx);
}

void xmlSchemaSetValidErrors(xmlSchemaValidCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void *ctx)
{
  MEMORY[0x24BEDEBB0](ctxt, err, warn, ctx);
}

int xmlSchemaValidateDoc(xmlSchemaValidCtxtPtr ctxt, xmlDocPtr instance)
{
  return MEMORY[0x24BEDEBC0](ctxt, instance);
}

void xmlSetExternalEntityLoader(xmlExternalEntityLoader f)
{
  MEMORY[0x24BEDEBF0](f);
}

void xmlSetNs(xmlNodePtr node, xmlNsPtr ns)
{
  MEMORY[0x24BEDEBF8](node, ns);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEED0](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
  MEMORY[0x24BEDEEE8](ctxt);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x24BEDEF58](doc);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x24BEDF038](ctxt, prefix, ns_uri);
}

int xmlXPathSetContextNode(xmlNodePtr node, xmlXPathContextPtr ctx)
{
  return MEMORY[0x24BEDF048](node, ctx);
}

