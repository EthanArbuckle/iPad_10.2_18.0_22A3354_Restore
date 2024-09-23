@implementation BEExternalIframeJS

- (BEExternalIframeJS)init
{
  BEExternalIframeJS *v2;
  BEDocumentLoadExternalResourcesController *v3;
  BEDocumentLoadExternalResourcesController *documentLoadExternalResourcesController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEExternalIframeJS;
  v2 = -[BEExternalIframeJS init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(BEDocumentLoadExternalResourcesController);
    documentLoadExternalResourcesController = v2->_documentLoadExternalResourcesController;
    v2->_documentLoadExternalResourcesController = v3;

  }
  return v2;
}

- (NSString)postApprovalToLoadScript
{
  return (NSString *)CFSTR("__ibooks_external_iframe.refreshWithoutBlocker();");
}

- (NSURL)urlForExternalIframeAuthorization
{
  return -[BEDocumentLoadExternalResourcesController linkURLForAuthorization](self->_documentLoadExternalResourcesController, "linkURLForAuthorization");
}

- (id)preApprovalToLoadScriptForURL:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 4, 0));

  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_external_iframe.addBlockedLink(%@);"),
                   v5));

  return v6;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  id v3;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[external_iframe source](external_iframe, "source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentLoadExternalResourcesController dataURLForPlaceholder](self->_documentLoadExternalResourcesController, "dataURLForPlaceholder"));
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_external_iframe.contentBlockerUrl='%@';"),
                       v6));
      v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v7));

    }
    else
    {
      v3 = v5;
    }

  }
  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[external_iframe sourceName](external_iframe, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

- (BEDocumentLoadExternalResourcesController)documentLoadExternalResourcesController
{
  return self->_documentLoadExternalResourcesController;
}

- (void)setDocumentLoadExternalResourcesController:(id)a3
{
  objc_storeStrong((id *)&self->_documentLoadExternalResourcesController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentLoadExternalResourcesController, 0);
}

@end
