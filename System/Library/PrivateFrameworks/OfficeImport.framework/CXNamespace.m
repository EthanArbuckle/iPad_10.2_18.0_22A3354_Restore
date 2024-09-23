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
  result = -[CXNamespace init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

+ (void)registerNamespace:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (id)pSupportedNamespaces;
  objc_sync_enter(v3);
  if (!pSupportedNamespaces)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 0);
    v5 = (void *)pSupportedNamespaces;
    pSupportedNamespaces = v4;

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithXmlString:", objc_msgSend(v7, "uri"));
  if (v6 && (objc_msgSend((id)pSupportedNamespaces, "containsObject:", v6) & 1) == 0)
    objc_msgSend((id)pSupportedNamespaces, "addObject:", v6);

  objc_sync_exit(v3);
}

- (const)uri
{
  return self->mUri;
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
  return ns && (ns == self->mDocumentNamespace || xmlStrEqual(ns->href, (const xmlChar *)self->mUri))
      || -[CXNamespace containsNode:](self->mFallbackNamespace, "containsNode:", a3);
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
  return ns && (ns == self->mDocumentNamespace || xmlStrEqual(ns->href, (const xmlChar *)self->mUri))
      || -[CXNamespace containsAttribute:](self->mFallbackNamespace, "containsAttribute:", a3);
}

+ (BOOL)isPrefixSupportedFromNodeContext:(_xmlNode *)a3 prefix:(const char *)a4
{
  xmlNsPtr *NsList;
  xmlNsPtr *v7;
  xmlNsPtr v8;
  unsigned int v9;
  char v10;

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
  ((void (*)(xmlNsPtr *))*MEMORY[0x24BEDE758])(v7);
  return v10;
}

+ (BOOL)isNamespaceSupported:(const char *)a3
{
  void *v3;
  id v4;
  char v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithXmlString:", a3);
  v4 = (id)pSupportedNamespaces;
  objc_sync_enter(v4);
  v5 = objc_msgSend((id)pSupportedNamespaces, "containsObject:", v3);
  objc_sync_exit(v4);

  return v5;
}

- (CXNamespace)init
{
  CXNamespace *v2;
  CXNamespace *v3;
  CXNamespace *mFallbackNamespace;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXNamespace;
  v2 = -[CXNamespace init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mFallbackNamespace = v2->mFallbackNamespace;
    v2->mFallbackNamespace = 0;

  }
  return v3;
}

- (CXNamespace)initWithUri:(const char *)a3 fallbackNamespace:(id)a4
{
  id v7;
  CXNamespace *v8;
  CXNamespace *v9;

  v7 = a4;
  v8 = -[CXNamespace initWithUri:](self, "initWithUri:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mFallbackNamespace, a4);

  return v9;
}

- (const)fallbackUri
{
  return -[CXNamespace fallbackUri](self->mFallbackNamespace, "fallbackUri");
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
  void *v2;
  id obj;

  obj = (id)pSupportedNamespaces;
  objc_sync_enter(obj);
  v2 = (void *)pSupportedNamespaces;
  pSupportedNamespaces = 0;

  objc_sync_exit(obj);
}

- (CXNamespace)fallbackNamespace
{
  return self->mFallbackNamespace;
}

- (void)setFallbackNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mFallbackNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFallbackNamespace, 0);
}

@end
