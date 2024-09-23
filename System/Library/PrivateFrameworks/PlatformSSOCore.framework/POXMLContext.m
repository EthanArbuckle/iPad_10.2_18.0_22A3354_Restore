@implementation POXMLContext

- (POXMLContext)init
{
  POXMLContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POXMLContext;
  result = -[POXMLContext init](&v3, sel_init);
  if (result)
    result->_xmldoc = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (-[POXMLContext xmldoc](self, "xmldoc"))
    xmlFreeDoc(-[POXMLContext xmldoc](self, "xmldoc"));
  -[POXMLContext setXmldoc:](self, "setXmldoc:", 0);
  v3.receiver = self;
  v3.super_class = (Class)POXMLContext;
  -[POXMLContext dealloc](&v3, sel_dealloc);
}

- (id)nameSpacePrefixForHref:(id)a3
{
  id v4;
  xmlNode *RootElement;
  xmlNsPtr v6;
  void *v7;

  v4 = a3;
  RootElement = xmlDocGetRootElement(-[POXMLContext xmldoc](self, "xmldoc"));
  if (!RootElement)
    goto LABEL_6;
  v6 = xmlSearchNsByHref(-[POXMLContext xmldoc](self, "xmldoc"), RootElement, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  if (!v6)
    goto LABEL_6;
  if (!v6->prefix)
  {
    xmlFreeNs(v6);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (_xmlDoc)xmldoc
{
  return self->_xmldoc;
}

- (void)setXmldoc:(_xmlDoc *)a3
{
  self->_xmldoc = a3;
}

@end
