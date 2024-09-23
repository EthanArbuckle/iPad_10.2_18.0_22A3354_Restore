@implementation WBSTouchIconWebProcessPlugInPageController

- (WBSTouchIconObserver)touchIconObserver
{
  WBSTouchIconObserver *touchIconObserver;
  WBSTouchIconObserver *v3;
  void *v5;
  void *v6;
  void *v7;
  WBSTouchIconObserver *v8;
  WBSTouchIconObserver *v9;

  touchIconObserver = self->_touchIconObserver;
  if (touchIconObserver)
  {
    v3 = touchIconObserver;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE9C99C8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_remoteObjectRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithInterface:", v5);
    v8 = (WBSTouchIconObserver *)objc_claimAutoreleasedReturnValue();
    v9 = self->_touchIconObserver;
    self->_touchIconObserver = v8;

    v3 = self->_touchIconObserver;
  }
  return v3;
}

- (id)_extractTouchIconURLsIncludingDefaultURLs:(BOOL)a3 didExtractNonDefaultIconURLs:(BOOL *)a4
{
  _BOOL4 v5;
  void *v6;
  WBSMetadataExtractor *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;

  v5 = a3;
  -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSMetadataExtractor initWithWebProcessPlugInFrame:]([WBSMetadataExtractor alloc], "initWithWebProcessPlugInFrame:", v6);
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSMetadataExtractor appleTouchIconURLs](v7, "appleTouchIconURLs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") != 0;
  objc_msgSend(v9, "addObjectsFromArray:", v10);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon-precomposed.png"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon.png"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  if (a4)
    *a4 = v11;

  return v9;
}

- (id)_extractFaviconURLsIncludingDefaultURLs:(BOOL)a3 didExtractNonDefaultIconURLs:(BOOL *)a4
{
  _BOOL4 v5;
  void *v6;
  WBSMetadataExtractor *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;

  v5 = a3;
  -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSMetadataExtractor initWithWebProcessPlugInFrame:]([WBSMetadataExtractor alloc], "initWithWebProcessPlugInFrame:", v6);
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSMetadataExtractor faviconURLs](v7, "faviconURLs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") != 0;
  objc_msgSend(v9, "addObjectsFromArray:", v10);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("/favicon.ico"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  if (a4)
    *a4 = v11;

  return v9;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didInitiateLoadForResource:(unint64_t)a5 request:(id)a6 pageIsProvisionallyLoading:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;

  v7 = a7;
  v11 = a4;
  objc_msgSend(a3, "mainFrame");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v11 && v7)
  {
    self->_mainFrameMainResourceId = a5;
    self->_didRecieveDidHandleOnloadEventsForFrameCallback = 0;
    self->_shouldExtractIconsWhenRecievingDidHandleOnloadEventsForFrameCallback = 0;
  }
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  void *v7;

  if (self->_mainFrameMainResourceId == a5)
  {
    v7 = (void *)objc_msgSend(a6, "mutableCopy", a3, a4);
    objc_msgSend(v7, "setHTTPShouldHandleCookies:", 0);
    objc_msgSend(v7, "setAttribution:", 1);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;

  v6 = a4;
  objc_msgSend(a3, "mainFrame");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v18 = 0;
    -[WBSTouchIconWebProcessPlugInPageController _extractTouchIconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:](self, "_extractTouchIconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:", 1, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[WBSTouchIconWebProcessPlugInPageController _extractFaviconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:](self, "_extractFaviconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:", 1, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTouchIconWebProcessPlugInPageController touchIconObserver](self, "touchIconObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didFetchTouchIconURLs:andFaviconURLs:forURL:", v8, v9, v12);

    if (!v18 || !v17)
    {
      if (self->_didRecieveDidHandleOnloadEventsForFrameCallback)
      {
        -[WBSTouchIconWebProcessPlugInPageController _extractTouchIconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:](self, "_extractTouchIconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:", 0, 0);
        v13 = objc_claimAutoreleasedReturnValue();

        -[WBSTouchIconWebProcessPlugInPageController touchIconObserver](self, "touchIconObserver");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "didFetchTouchIconURLs:andFaviconURLs:forURL:", v13, v9, v16);

        v8 = (void *)v13;
      }
      else
      {
        self->_shouldExtractIconsWhenRecievingDidHandleOnloadEventsForFrameCallback = 1;
      }
    }

  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didHandleOnloadEventsForFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  objc_msgSend(a3, "mainFrame");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    self->_didRecieveDidHandleOnloadEventsForFrameCallback = 1;
    if (self->_shouldExtractIconsWhenRecievingDidHandleOnloadEventsForFrameCallback)
    {
      -[WBSTouchIconWebProcessPlugInPageController _extractTouchIconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:](self, "_extractTouchIconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:", 1, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[WBSTouchIconWebProcessPlugInPageController _extractFaviconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:](self, "_extractFaviconURLsIncludingDefaultURLs:didExtractNonDefaultIconURLs:", 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSTouchIconWebProcessPlugInPageController touchIconObserver](self, "touchIconObserver");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didFetchTouchIconURLs:andFaviconURLs:forURL:", v12, v8, v11);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIconObserver, 0);
}

@end
