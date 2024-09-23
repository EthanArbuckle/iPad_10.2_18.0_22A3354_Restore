@implementation CXNamespace

- (CXNamespace)initWithUri:(const char *)a3
{
  CXNamespace *v3;

  v3 = -[CXNamespace initUnsupportedNsWithUri:](self, "initUnsupportedNsWithUri:", a3);
  if (v3)
    +[CXNamespace registerNamespace:](CXNamespace, "registerNamespace:", v3);
  return v3;
}

- (id)initUnsupportedNsWithUri:(const char *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXNamespace;
  result = -[CXNamespace init](&v5, "init");
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (BOOL)containsNode:(_xmlNode *)a3
{
  _xmlDoc *doc;
  xmlNode *RootElement;
  xmlNs *ns;

  doc = a3->doc;
  if (doc != self->mDocument)
  {
    self->mDocument = doc;
    RootElement = xmlDocGetRootElement(doc);
    self->mDocumentNamespace = xmlSearchNsByHref(doc, RootElement, (const xmlChar *)self->mUri);
  }
  ns = a3->ns;
  if (!ns)
    return 0;
  if (ns == self->mDocumentNamespace)
    return 1;
  return xmlStrEqual(ns->href, (const xmlChar *)self->mUri) != 0;
}

- (BOOL)containsAttribute:(_xmlAttr *)a3
{
  _xmlDoc *doc;
  xmlNode *RootElement;
  xmlNs *ns;

  doc = a3->doc;
  if (doc != self->mDocument)
  {
    self->mDocument = doc;
    RootElement = xmlDocGetRootElement(doc);
    self->mDocumentNamespace = xmlSearchNsByHref(doc, RootElement, (const xmlChar *)self->mUri);
  }
  ns = a3->ns;
  if (!ns)
    return 0;
  if (ns == self->mDocumentNamespace)
    return 1;
  return xmlStrEqual(ns->href, (const xmlChar *)self->mUri) != 0;
}

- (const)uri
{
  return self->mUri;
}

+ (BOOL)isNamespaceSupported:(const char *)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", a3);
  objc_sync_enter(a1);
  v5 = objc_msgSend((id)pSupportedNamespaces, "containsObject:", v4);
  objc_sync_exit(a1);

  return v5;
}

+ (BOOL)isPrefixSupportedFromNodeContext:(_xmlNode *)a3 prefix:(const char *)a4
{
  xmlNsPtr *NsList;
  xmlNsPtr *v7;
  xmlNsPtr v8;
  unsigned int v9;
  unsigned __int8 v10;

  NsList = xmlGetNsList(a3->doc, a3);
  if (!NsList)
    return 0;
  v7 = NsList;
  v8 = *NsList;
  if (*NsList)
  {
    v9 = 1;
    while (!xmlStrEqual(v8->prefix, (const xmlChar *)a4))
    {
      v8 = v7[v9++];
      if (!v8)
        goto LABEL_6;
    }
    v10 = objc_msgSend(a1, "isNamespaceSupported:", v8->href);
  }
  else
  {
LABEL_6:
    v10 = 0;
  }
  xmlFree(v7);
  return v10;
}

+ (BOOL)isPrefixSupportedFromStream:(_xmlTextReader *)a3 prefix:(const char *)a4
{
  xmlChar *v5;

  v5 = xmlTextReaderLookupNamespace(a3, (const xmlChar *)a4);
  if (v5)
    LOBYTE(v5) = objc_msgSend(a1, "isNamespaceSupported:", v5);
  return (char)v5;
}

+ (void)clearRegisteredNamespaces
{
  objc_sync_enter(a1);

  pSupportedNamespaces = 0;
  objc_sync_exit(a1);
}

+ (void)registerNamespace:(id)a3
{
  id v5;

  objc_sync_enter(a1);
  if (!pSupportedNamespaces)
    pSupportedNamespaces = (uint64_t)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", objc_msgSend(a3, "uri"));
  if (v5)
  {
    if ((objc_msgSend((id)pSupportedNamespaces, "containsObject:", v5) & 1) == 0)
      objc_msgSend((id)pSupportedNamespaces, "addObject:", v5);

  }
  objc_sync_exit(a1);
}

@end
