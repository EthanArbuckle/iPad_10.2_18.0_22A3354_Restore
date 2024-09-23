@implementation QLPreviewMultiPartURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x24BDD1830], "registerClass:", a1);
}

+ (id)protocolScheme
{
  return CFSTR("cid");
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "mainDocumentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[QLPreviewURLProtocol isSafeURL:](QLPreviewURLProtocol, "isSafeURL:", v7))
    {
      objc_msgSend(a1, "protocolScheme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "caseInsensitiveCompare:", v6) == 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

- (void)startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NSURLProtocol request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainDocumentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLPreviewParts registeredPreviewForURL:](QLPreviewParts, "registeredPreviewForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourceSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLRequestForContentID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[NSURLProtocol client](self, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLProtocol:wasRedirectedToRequest:redirectResponse:", self, v9, 0);

      goto LABEL_11;
    }

  }
  v11 = MEMORY[0x24BDE5F50];
  v12 = *(NSObject **)(MEMORY[0x24BDE5F50] + 160);
  if (!v12)
  {
    QLTInitLogging();
    v12 = *(NSObject **)(v11 + 160);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v3, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_20D4C7000, v13, OS_LOG_TYPE_INFO, "Could not find resource for %@", (uint8_t *)&v15, 0xCu);

  }
  -[NSURLProtocol client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1008, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLProtocol:didFailWithError:", self, v9);
LABEL_11:

}

@end
