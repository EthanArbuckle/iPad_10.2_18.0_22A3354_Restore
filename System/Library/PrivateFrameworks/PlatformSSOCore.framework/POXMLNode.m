@implementation POXMLNode

- (POXMLNode)init
{
  POXMLNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POXMLNode;
  result = -[POXMLNode init](&v3, sel_init);
  if (result)
    result->_node = 0;
  return result;
}

- (id)evaluateXPath:(id)a3
{
  id v4;
  _xmlNode *v5;
  const xmlChar *v6;
  void *v7;
  void *v8;
  xmlXPathObjectPtr v9;
  xmlNodeSetPtr nodesetval;
  POXMLXPathResult *v11;

  v4 = a3;
  if ((_DWORD)-[POXMLNode node](self, "node")[8] != 1)
    goto LABEL_7;
  v5 = -[POXMLNode node](self, "node");
  v6 = (const xmlChar *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  -[POXMLNode xpathResultSet](self, "xpathResultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xpathContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = xmlXPathNodeEval(v5, v6, (xmlXPathContextPtr)objc_msgSend(v8, "xpathCtx"));

  if (!v9)
    goto LABEL_7;
  nodesetval = v9->nodesetval;
  if (nodesetval && nodesetval->nodeNr && nodesetval->nodeTab)
  {
    v11 = objc_alloc_init(POXMLXPathResult);
    -[POXMLXPathResult setXpathObj:](v11, "setXpathObj:", v9);
  }
  else
  {
LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (id)parent
{
  POXMLNode *v3;
  void *v4;

  if ((_QWORD)-[POXMLNode node](self, "node")[40])
  {
    v3 = objc_alloc_init(POXMLNode);
    -[POXMLNode setNode:](v3, "setNode:", (_QWORD)-[POXMLNode node](self, "node")[40]);
    -[POXMLNode xpathResultSet](self, "xpathResultSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[POXMLNode setXpathResultSet:](v3, "setXpathResultSet:", v4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  _xmlNode *v5;
  id v6;
  const xmlChar *v7;
  xmlChar *Prop;
  xmlChar *v9;
  void *v10;

  v4 = a3;
  v5 = -[POXMLNode node](self, "node");
  v6 = objc_retainAutorelease(v4);
  v7 = (const xmlChar *)objc_msgSend(v6, "UTF8String");

  Prop = xmlGetProp(v5, v7);
  if (Prop)
  {
    v9 = Prop;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Prop);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    free(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)content
{
  xmlChar *Content;
  void *v3;

  Content = xmlNodeGetContent(-[POXMLNode node](self, "node"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Content);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  free(Content);
  return v3;
}

- (id)rawXMLString
{
  void *v3;
  void *v4;
  void *v5;
  xmlBuffer *v6;
  void *v7;

  -[POXMLNode xpathResultSet](self, "xpathResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpathContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xmldocContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = xmlBufferCreate();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v6->content, xmlNodeDump(v6, (xmlDocPtr)objc_msgSend(v5, "xmldoc"), -[POXMLNode node](self, "node"), 0, 0), 4);
  xmlBufferFree(v6);

  return v7;
}

- (_xmlNode)node
{
  return self->_node;
}

- (void)setNode:(_xmlNode *)a3
{
  self->_node = a3;
}

- (POXMLXPathResult)xpathResultSet
{
  return self->_xpathResultSet;
}

- (void)setXpathResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_xpathResultSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpathResultSet, 0);
}

@end
