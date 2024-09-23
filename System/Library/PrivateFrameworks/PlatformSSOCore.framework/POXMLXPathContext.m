@implementation POXMLXPathContext

- (POXMLXPathContext)initWithXMLContext:(id)a3
{
  id v5;
  POXMLXPathContext *v6;
  xmlXPathContextPtr v7;
  POXMLXPathContext *v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)POXMLXPathContext;
  v6 = -[POXMLXPathContext init](&v11, sel_init);
  if (!v6)
    goto LABEL_4;
  v7 = xmlXPathNewContext((xmlDocPtr)objc_msgSend(v5, "xmldoc"));
  v6->_xpathCtx = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v6->_xmldocContext, a3);
LABEL_4:
    v8 = v6;
    goto LABEL_8;
  }
  PO_LOG_POXMLHelper();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[POXMLXPathContext initWithXMLContext:].cold.1();

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)registerNamespaces:(id)a3
{
  id v4;
  id v5;
  xmlChar *v6;
  xmlChar *v7;
  const xmlChar *v8;
  const xmlChar *i;
  const xmlChar *v10;
  const xmlChar *v11;
  const xmlChar *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;

  v4 = a3;
  if (!-[POXMLXPathContext xpathCtx](self, "xpathCtx"))
    -[POXMLXPathContext registerNamespaces:].cold.1();
  if (!v4)
    -[POXMLXPathContext registerNamespaces:].cold.2();
  v5 = objc_retainAutorelease(v4);
  v6 = xmlStrdup((const xmlChar *)objc_msgSend(v5, "UTF8String"));
  if (v6)
  {
    v7 = v6;
    v8 = v6;
    while (1)
    {
      if (!v8)
        goto LABEL_16;
      for (i = v8; *i == 32; ++i)
        ;
      if (!*i)
      {
LABEL_16:
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
        v14 = 1;
        goto LABEL_21;
      }
      v10 = xmlStrchr(i, 0x3Du);
      if (!v10)
        break;
      *v10 = 0;
      v11 = v10 + 1;
      v12 = xmlStrchr(v10 + 1, 0x20u);
      v8 = v12;
      if (v12)
      {
        *v12 = 0;
        v8 = v12 + 1;
      }
      if (xmlXPathRegisterNs(-[POXMLXPathContext xpathCtx](self, "xpathCtx"), i, v11))
      {
        PO_LOG_POXMLHelper();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[POXMLXPathContext registerNamespaces:].cold.5((uint64_t)i, (uint64_t)v11, v13);
        goto LABEL_24;
      }
    }
    PO_LOG_POXMLHelper();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[POXMLXPathContext registerNamespaces:].cold.4();
LABEL_24:

    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
  }
  else
  {
    PO_LOG_POXMLHelper();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[POXMLXPathContext registerNamespaces:].cold.3();

  }
  v14 = 0;
LABEL_21:

  return v14;
}

- (id)evaluateXPath:(id)a3
{
  id v4;
  POXMLXPathResult *v5;
  id v6;
  POXMLXPathResult *v7;
  NSObject *v8;

  v4 = a3;
  v5 = objc_alloc_init(POXMLXPathResult);
  v6 = objc_retainAutorelease(v4);
  -[POXMLXPathResult setXpathObj:](v5, "setXpathObj:", MEMORY[0x24950FC5C](objc_msgSend(v6, "UTF8String"), -[POXMLXPathContext xpathCtx](self, "xpathCtx")));
  -[POXMLXPathResult setXpathContext:](v5, "setXpathContext:", self);
  if (-[POXMLXPathResult xpathObj](v5, "xpathObj"))
  {
    v7 = v5;
  }
  else
  {
    PO_LOG_POXMLHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[POXMLXPathContext evaluateXPath:].cold.1(v6, v8);

    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[POXMLXPathContext xpathCtx](self, "xpathCtx"))
    xmlXPathFreeContext(-[POXMLXPathContext xpathCtx](self, "xpathCtx"));
  -[POXMLXPathContext setXpathCtx:](self, "setXpathCtx:", 0);
  v3.receiver = self;
  v3.super_class = (Class)POXMLXPathContext;
  -[POXMLXPathContext dealloc](&v3, sel_dealloc);
}

- (_xmlXPathContext)xpathCtx
{
  return self->_xpathCtx;
}

- (void)setXpathCtx:(_xmlXPathContext *)a3
{
  self->_xpathCtx = a3;
}

- (POXMLContext)xmldocContext
{
  return self->_xmldocContext;
}

- (void)setXmldocContext:(id)a3
{
  objc_storeStrong((id *)&self->_xmldocContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmldocContext, 0);
}

- (void)initWithXMLContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Error: unable to create new XPath context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)registerNamespaces:.cold.1()
{
  __assert_rtn("-[POXMLXPathContext registerNamespaces:]", "POXMLHelper.m", 223, "self.xpathCtx");
}

- (void)registerNamespaces:.cold.2()
{
  __assert_rtn("-[POXMLXPathContext registerNamespaces:]", "POXMLHelper.m", 224, "nameSpaceList");
}

- (void)registerNamespaces:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Error: unable to strdup namespaces list\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)registerNamespaces:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Error: invalid namespaces list format\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)registerNamespaces:(os_log_t)log .cold.5(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = a1;
  v5 = 2080;
  v6 = a2;
  _os_log_error_impl(&dword_24440D000, log, OS_LOG_TYPE_ERROR, "Error: unable to register NS with prefix=\"%s\" and href=\"%s\"\n", (uint8_t *)&v3, 0x16u);
}

- (void)evaluateXPath:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  _os_log_error_impl(&dword_24440D000, a2, OS_LOG_TYPE_ERROR, "Error: unable to evaluate xpath expression \"%s\"\n", (uint8_t *)&v3, 0xCu);
}

@end
