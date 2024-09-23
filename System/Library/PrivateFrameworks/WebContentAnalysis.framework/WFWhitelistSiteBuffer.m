@implementation WFWhitelistSiteBuffer

- (WFWhitelistSiteBuffer)init
{
  WFWhitelistSiteBuffer *v2;
  WFWhitelistSiteBuffer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWhitelistSiteBuffer;
  v2 = -[WFWhitelistSiteBuffer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxSize = 100000;
    v2->_siteTree = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3->_urlList = (WCRURLList *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  NSMutableDictionary *siteTree;
  WCRURLList *urlList;
  objc_super v5;

  siteTree = self->_siteTree;
  if (siteTree)

  urlList = self->_urlList;
  if (urlList)

  v5.receiver = self;
  v5.super_class = (Class)WFWhitelistSiteBuffer;
  -[WFWhitelistSiteBuffer dealloc](&v5, sel_dealloc);
}

- (void)addURLString:(id)a3
{
  -[WCRURLList addURLString:](-[WFWhitelistSiteBuffer urlList](self, "urlList"), "addURLString:", a3);
}

- (BOOL)treeContainsURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  char v11;

  v4 = (void *)objc_msgSend(a3, "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(v4, "lowercaseString"));
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(v5, "host"), "componentsSeparatedByString:", CFSTR(".")));
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v5, "pathComponents"), "count") >= 2)
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v5, "pathComponents"));
  if (objc_msgSend(v5, "query"))
    objc_msgSend(v6, "addObject:", objc_msgSend(v5, "query"));
  if (objc_msgSend(v5, "fragment"))
    objc_msgSend(v6, "addObject:", objc_msgSend(v5, "fragment"));
  v7 = -[WFWhitelistSiteBuffer siteTree](self, "siteTree");
  v8 = objc_msgSend(v6, "count") - 1;
  if (v8 < 0)
    return 0;
  while (1)
  {
    v9 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:](v7, "objectForKey:", objc_msgSend(v6, "objectAtIndex:", v8));
    if (!v9)
      goto LABEL_17;
    v10 = v9;
    if (!v8
      && -[NSMutableDictionary count](v9, "count") == 1
      && (objc_msgSend((id)-[NSMutableDictionary objectForKey:](v10, "objectForKey:", CFSTR("kWFEndpointKey")), "BOOLValue") & 1) != 0)
    {
      return 1;
    }
    if (-[NSMutableDictionary count](v10, "count") == 1
      && (v11 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v10, "objectForKey:", CFSTR("kWFEndpointKey")), "BOOLValue"), v8))
    {
      v7 = v10;
      if ((v11 & 1) != 0)
        return 1;
    }
    else
    {
      v7 = v10;
    }
LABEL_17:
    if (v8-- <= 0)
      return 0;
  }
}

- (BOOL)containsURLString:(id)a3
{
  return -[WCRURLList containsURLString:](-[WFWhitelistSiteBuffer urlList](self, "urlList"), "containsURLString:", a3);
}

- (NSMutableDictionary)siteTree
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSiteTree:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (WCRURLList)urlList
{
  return (WCRURLList *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_maxSize = a3;
}

@end
