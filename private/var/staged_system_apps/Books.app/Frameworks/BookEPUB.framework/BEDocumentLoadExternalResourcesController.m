@implementation BEDocumentLoadExternalResourcesController

- (BEDocumentLoadExternalResourcesController)init
{
  BEDocumentLoadExternalResourcesController *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSURL *v8;
  NSURL *linkURLForPlaceholder;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSURL *v15;
  NSURL *linkURLForAuthorization;
  uint64_t v17;
  NSMutableDictionary *placeholderHTMLs;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *dataURLForPlaceholder;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BEDocumentLoadExternalResourcesController;
  v2 = -[BEDocumentLoadExternalResourcesController init](&v25, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

    v6 = objc_alloc((Class)NSURL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http://%@/"), v5));
    v8 = (NSURL *)objc_msgSend(v6, "initWithString:", v7);
    linkURLForPlaceholder = v2->_linkURLForPlaceholder;
    v2->_linkURLForPlaceholder = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));

    v13 = objc_alloc((Class)NSURL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http://%@/"), v12));
    v15 = (NSURL *)objc_msgSend(v13, "initWithString:", v14);
    linkURLForAuthorization = v2->_linkURLForAuthorization;
    v2->_linkURLForAuthorization = v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    placeholderHTMLs = v2->_placeholderHTMLs;
    v2->_placeholderHTMLs = (NSMutableDictionary *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentLoadExternalResourcesController _defaultPlaceholderHTML](v2, "_defaultPlaceholderHTML"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataUsingEncoding:", 4));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64EncodedStringWithOptions:", 0));
    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("data:text/html;base64,%@"),
              v21));
    dataURLForPlaceholder = v2->_dataURLForPlaceholder;
    v2->_dataURLForPlaceholder = (NSString *)v22;

  }
  return v2;
}

- (id)_placeholderHTMLKeyWithIsInteractive:(BOOL)a3 themeClassName:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isInteractive:%d::themeClassName:%@:"), a3, a4);
}

- (id)placeholderHTMLWithIsInteractive:(BOOL)a3 themeClassName:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentLoadExternalResourcesController _placeholderHTMLKeyWithIsInteractive:themeClassName:](self, "_placeholderHTMLKeyWithIsInteractive:themeClassName:", v4, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_placeholderHTMLs, "objectForKey:", v7));
  if (!v8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentLoadExternalResourcesController _preparePlaceholderHTMLWithIsInteractive:themeClassName:](self, "_preparePlaceholderHTMLWithIsInteractive:themeClassName:", v4, v6));
    -[NSMutableDictionary setObject:forKey:](self->_placeholderHTMLs, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (id)_defaultPlaceholderHTML
{
  return -[BEDocumentLoadExternalResourcesController _preparePlaceholderHTMLWithIsInteractive:themeClassName:](self, "_preparePlaceholderHTMLWithIsInteractive:themeClassName:", 1, 0);
}

- (id)_templateStringForPlaceholder
{
  id v3;
  void *v4;
  void *v5;
  NSString *placeholderHTMLTemplate;
  NSString *v7;
  id v8;
  NSString *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  v3 = BookEPUBBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:", CFSTR("BEExternalResourcesPlaceholder.html.tmpl"), 0));

  placeholderHTMLTemplate = self->_placeholderHTMLTemplate;
  if (placeholderHTMLTemplate)
    goto LABEL_9;
  if (objc_msgSend(v5, "length"))
  {
    v14 = 0;
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v5, 4, &v14));
    v8 = v14;
    v9 = self->_placeholderHTMLTemplate;
    self->_placeholderHTMLTemplate = v7;

    if (!self->_placeholderHTMLTemplate)
    {
      v10 = _BookEPUBLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v5;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Failed to load external resources placeholder template {%@} -- %@", buf, 0x16u);
      }

    }
  }
  placeholderHTMLTemplate = self->_placeholderHTMLTemplate;
  if (placeholderHTMLTemplate)
LABEL_9:
    v12 = -[NSString mutableCopy](placeholderHTMLTemplate, "mutableCopy");
  else
    v12 = 0;

  return v12;
}

- (id)_preparePlaceholderHTMLWithIsInteractive:(BOOL)a3 themeClassName:(id)a4
{
  _BOOL4 v4;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;

  v4 = a3;
  v6 = (__CFString *)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentLoadExternalResourcesController _templateStringForPlaceholder](self, "_templateStringForPlaceholder"));
  v8 = CFSTR("iframe-epub-white");
  if (v6)
    v8 = v6;
  v9 = v8;
  v10 = BookEPUBBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Online Book Content"), &stru_38FF08, 0));

  v13 = BookEPUBBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Tap to View\\U2026"), &stru_38FF08, 0));

  v16 = CFSTR("ButtonDisabled");
  if (v4)
    v16 = &stru_38FF08;
  v17 = v16;
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- @@DOCUMENT_CLASS@@ -->"), v9, 0, 0, objc_msgSend(v7, "length"));

  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- @@BUTTON_DISABLED_CLASS@@ -->"), v17, 0, 0, objc_msgSend(v7, "length"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_linkURLForAuthorization, "absoluteString"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- @@AUTHORIZATION_URL@@ -->"), v18, 0, 0, objc_msgSend(v7, "length"));

  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- @@BUTTON_BODY_TEXT@@ -->"), v12, 0, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<!-- @@BUTTON_CAPTION_TEXT@@ -->"), v15, 0, 0, objc_msgSend(v7, "length"));

  return v7;
}

- (NSURL)linkURLForPlaceholder
{
  return self->_linkURLForPlaceholder;
}

- (NSURL)linkURLForAuthorization
{
  return self->_linkURLForAuthorization;
}

- (NSString)dataURLForPlaceholder
{
  return self->_dataURLForPlaceholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataURLForPlaceholder, 0);
  objc_storeStrong((id *)&self->_linkURLForAuthorization, 0);
  objc_storeStrong((id *)&self->_linkURLForPlaceholder, 0);
  objc_storeStrong((id *)&self->_placeholderHTMLs, 0);
  objc_storeStrong((id *)&self->_placeholderHTMLTemplate, 0);
}

@end
