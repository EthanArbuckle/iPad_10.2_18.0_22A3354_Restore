@implementation XMLWrapperDoc

- (XMLWrapperDoc)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  XMLWrapperDoc *v11;
  XMLWrapperDoc *v12;
  XMLWrapperQuery *v13;
  XMLWrapperQuery *query;
  uint64_t v15;
  XMLWrapperElement *documentElement;
  XMLWrapperDoc *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)XMLWrapperDoc;
  v11 = -[XMLWrapperDoc init](&v19, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  objc_storeStrong((id *)&v11->_xmlData, a3);
  objc_storeStrong((id *)&v12->_schemaData, a4);
  v13 = objc_alloc_init(XMLWrapperQuery);
  query = v12->_query;
  v12->_query = v13;

  if (!-[XMLWrapperDoc createDocument:](v12, "createDocument:", a5))
    goto LABEL_5;
  -[XMLWrapperDoc createDocumentElement:](v12, "createDocumentElement:", a5);
  v15 = objc_claimAutoreleasedReturnValue();
  documentElement = v12->_documentElement;
  v12->_documentElement = (XMLWrapperElement *)v15;

  if (v12->_documentElement)
LABEL_4:
    v17 = v12;
  else
LABEL_5:
    v17 = 0;

  return v17;
}

- (void)dealloc
{
  _xmlDoc *doc;
  objc_super v4;

  doc = self->_doc;
  if (doc)
    xmlFreeDoc(doc);
  v4.receiver = self;
  v4.super_class = (Class)XMLWrapperDoc;
  -[XMLWrapperDoc dealloc](&v4, sel_dealloc);
}

- (XMLWrapperDoc)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  XMLWrapperDoc *v10;
  XMLWrapperDoc *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XMLWrapperDoc;
  v10 = -[XMLWrapperDoc init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_schemaData, a4);
    objc_storeStrong((id *)&v11->_documentElement, a3);
  }

  return v11;
}

- (void)setNamespace:(id)a3
{
  NSMutableDictionary *namespaces;
  id v5;
  void *v6;
  id v7;

  namespaces = self->_namespaces;
  v5 = a3;
  objc_msgSend(v5, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](namespaces, "setObject:forKey:", v5, v6);

  -[XMLWrapperDoc query](self, "query");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerNamespace:", v5);

}

- (id)getResultsByXpathQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[XMLWrapperDoc query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchNodeWithXpathQuery:query:error:", self->_docNode, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)firstResultByXpathQuery:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[XMLWrapperDoc getResultsByXpathQuery:error:](self, "getResultsByXpathQuery:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_xmlDoc)docNode:(id *)a3
{
  xmlChar *v5;
  xmlDocPtr v6;
  _xmlDoc *v7;
  void *v8;
  xmlNode *v9;

  v5 = xmlCharStrdup("2.0");
  v6 = xmlNewDoc(v5);
  if (!v6)
  {
    if (a3)
    {
      v7 = 0;
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 101, 0);
      return v7;
    }
    return 0;
  }
  v7 = v6;
  -[XMLWrapperDoc documentElement](self, "documentElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (xmlNode *)objc_msgSend(v8, "xmlNode:", a3);

  if (!v9)
  {
    if (a3)
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 101, 0);
    xmlFreeDoc(v7);
    return 0;
  }
  xmlDocSetRootElement(v7, v9);
  return v7;
}

- (id)xmlString:(id *)a3
{
  _xmlDoc *v4;
  xmlDoc *v5;
  xmlNodePtr RootElement;
  xmlNode *v7;
  xmlBuffer *v8;
  xmlBuffer *v9;
  id v10;
  const xmlChar *v11;
  void *v12;

  v4 = -[XMLWrapperDoc docNode:](self, "docNode:");
  if (!v4)
  {
    if (a3)
    {
      v12 = 0;
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 101, 0);
      return v12;
    }
LABEL_11:
    v12 = 0;
    return v12;
  }
  v5 = v4;
  RootElement = xmlDocGetRootElement(v4);
  if (!RootElement || (v7 = RootElement, (v8 = xmlBufferCreate()) == 0))
  {
    if (a3)
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 101, 0);
    xmlFreeDoc(v5);
    goto LABEL_11;
  }
  v9 = v8;
  if (xmlNodeDump(v8, v5, v7, 0, 1) < 1)
  {
    v12 = 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    v11 = xmlBufferContent(v9);
    v12 = (void *)objc_msgSend(v10, "initWithBytes:length:encoding:", v11, xmlBufferLength(v9), 4);
  }
  xmlFreeDoc(v5);
  xmlBufferFree(v9);
  return v12;
}

- (_xmlNode)nodePtr
{
  return self->_docNode;
}

- (_xmlDoc)docPtr
{
  return self->_doc;
}

- (XMLWrapperQuery)query
{
  return self->_query;
}

- (BOOL)createDocument:(id *)a3
{
  void *v5;
  XMLWrapperSchema *v6;
  void *v7;
  XMLWrapperSchema *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (-[XMLWrapperDoc setXMLDoc:](self, "setXMLDoc:"))
  {
    -[XMLWrapperDoc schemaData](self, "schemaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [XMLWrapperSchema alloc];
      -[XMLWrapperDoc schemaData](self, "schemaData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[XMLWrapperSchema initWithSchemaData:](v6, "initWithSchemaData:", v7);

      if (v8)
      {
        LOBYTE(a3) = -[XMLWrapperSchema validateDocument:error:](v8, "validateDocument:error:", self->_doc, a3);
      }
      else if (a3)
      {
        v9 = (void *)MEMORY[0x24BDD1540];
        v12 = *MEMORY[0x24BDD0FC8];
        v13[0] = CFSTR("Failed to create schema context");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 100, v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a3) = 0;
      }

    }
    else
    {
      LOBYTE(a3) = 1;
    }
  }
  else
  {
    LOBYTE(a3) = 0;
  }
  return (char)a3;
}

- (BOOL)setXMLDoc:(id *)a3
{
  id v5;
  _xmlDoc *Memory;
  _xmlDoc *v7;

  -[XMLWrapperDoc xmlData](self, "xmlData");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Memory = xmlReadMemory((const char *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), ", 0, 1);
  v7 = Memory;
  self->_doc = Memory;
  if (a3 && !Memory)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 200, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

- (id)createDocumentElement:(id *)a3
{
  _xmlNode *RootElement;
  void *v6;
  objc_class *v7;

  RootElement = xmlDocGetRootElement(self->_doc);
  self->_docNode = RootElement;
  if (RootElement)
  {
    +[XMLWrapperElementFactory sharedInstance](XMLWrapperElementFactory, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_msgSend(v6, "classForXMLNode:error:", self->_docNode, a3);

    RootElement = (_xmlNode *)objc_msgSend([v7 alloc], "initWithNode:doc:query:error:", self->_docNode, self->_doc, self->_query, a3);
  }
  return RootElement;
}

- (NSData)xmlData
{
  return self->_xmlData;
}

- (void)setXmlData:(id)a3
{
  objc_storeStrong((id *)&self->_xmlData, a3);
}

- (NSData)schemaData
{
  return self->_schemaData;
}

- (void)setSchemaData:(id)a3
{
  objc_storeStrong((id *)&self->_schemaData, a3);
}

- (XMLWrapperElement)documentElement
{
  return self->_documentElement;
}

- (void)setDocumentElement:(id)a3
{
  objc_storeStrong((id *)&self->_documentElement, a3);
}

- (NSDictionary)namespaces
{
  return &self->_namespaces->super;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_documentElement, 0);
  objc_storeStrong((id *)&self->_schemaData, 0);
  objc_storeStrong((id *)&self->_xmlData, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
}

@end
