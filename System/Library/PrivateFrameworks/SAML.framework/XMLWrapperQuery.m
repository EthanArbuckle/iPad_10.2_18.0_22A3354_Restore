@implementation XMLWrapperQuery

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global);
}

void __29__XMLWrapperQuery_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)sNamespaceDictionary;
  sNamespaceDictionary = (uint64_t)v0;

}

- (id)elementForNode:(_xmlNode *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  if (a3->type == XML_ELEMENT_NODE)
  {
    +[XMLWrapperElementFactory sharedInstance](XMLWrapperElementFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_msgSend(v5, "classForXMLNode:error:", a3, 0);

    v7 = (void *)objc_msgSend([v6 alloc], "initWithNode:doc:query:error:", a3, a3->doc, self, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)searchNodeWithXpathQuery:(_xmlNode *)a3 query:(id)a4 error:(id *)a5
{
  _xmlDoc *doc;
  void *v8;

  doc = a3->doc;
  if (doc)
  {
    -[XMLWrapperQuery executeXpathQuery:query:ctxNode:error:](self, "executeXpathQuery:query:ctxNode:error:", doc, a4, a3, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)registerNamespace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (id)sNamespaceDictionary;
  objc_sync_enter(v3);
  v4 = (void *)sNamespaceDictionary;
  objc_msgSend(v6, "prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

  objc_sync_exit(v3);
}

- (BOOL)registerXpathNamespacesForCtx:(_xmlXPathContext *)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  id v13;
  xmlChar *v14;
  id v15;
  xmlChar *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (id)sNamespaceDictionary;
  objc_sync_enter(v5);
  v6 = (void *)objc_msgSend((id)sNamespaceDictionary, "copy");
  objc_sync_exit(v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "href");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = xmlCharStrdup((const char *)objc_msgSend(v13, "UTF8String"));

        objc_msgSend(v12, "prefix");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = xmlCharStrdup((const char *)objc_msgSend(v15, "UTF8String"));

        v10 &= xmlXPathRegisterNs(a3, v16, v14) == 0;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)executeXpathQuery:(_xmlDoc *)a3 query:(id)a4 ctxNode:(_xmlNode *)a5 error:(id *)a6
{
  id v10;
  xmlXPathContext *v11;
  xmlXPathContext *v12;
  xmlChar *v13;
  uint64_t v14;
  xmlXPathObject *v15;
  int *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  xmlXPathObject *obj;

  v10 = a4;
  v11 = xmlXPathNewContext(a3);
  if (!v11)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 201, 0);
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  v12 = v11;
  if (a5 && xmlXPathSetContextNode(a5, v11)
    || !-[XMLWrapperQuery registerXpathNamespacesForCtx:error:](self, "registerXpathNamespacesForCtx:error:", v12, a6))
  {
    if (!a6)
    {
LABEL_16:
      xmlXPathFreeContext(v12);
      goto LABEL_19;
    }
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = 201;
LABEL_15:
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), v25, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v13 = xmlCharStrdup((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  v14 = MEMORY[0x2348A7C10](v13, v12);
  if (!v14)
  {
    if (!a6)
      goto LABEL_16;
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = 300;
    goto LABEL_15;
  }
  v15 = (xmlXPathObject *)v14;
  v16 = *(int **)(v14 + 8);
  if (!v16)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 301, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    xmlXPathFreeObject(v15);
    goto LABEL_16;
  }
  obj = (xmlXPathObject *)v14;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (*v16 >= 1)
  {
    v18 = 0;
    do
    {
      +[XMLWrapperElementFactory sharedInstance](XMLWrapperElementFactory, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_msgSend(v19, "classForXMLNode:error:", *(_QWORD *)(*((_QWORD *)v16 + 1) + 8 * v18), a6);

      v21 = [v20 alloc];
      v22 = *(_QWORD *)(*((_QWORD *)v16 + 1) + 8 * v18);
      v23 = (void *)objc_msgSend(v21, "initWithNode:doc:query:error:", v22, *(_QWORD *)(v22 + 64), self, a6);
      if (v23)
        objc_msgSend(v17, "addObject:", v23);

      ++v18;
    }
    while (v18 < *v16);
  }
  xmlXPathFreeObject(obj);
  xmlXPathFreeContext(v12);
LABEL_20:

  return v17;
}

@end
