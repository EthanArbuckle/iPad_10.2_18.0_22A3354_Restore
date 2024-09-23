@implementation SWWebViewConfigurationFactory

- (SWWebViewConfigurationFactory)initWithProcessPool:(id)a3 websiteDataStore:(id)a4
{
  id v7;
  id v8;
  SWWebViewConfigurationFactory *v9;
  SWWebViewConfigurationFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWWebViewConfigurationFactory;
  v9 = -[SWWebViewConfigurationFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processPool, a3);
    objc_storeStrong((id *)&v10->_websiteDataStore, a4);
  }

  return v10;
}

- (id)createWebViewConfigurationWithUserContentController:(id)a3 mediaSettings:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  v6 = (objc_class *)MEMORY[0x24BDFA920];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[SWWebViewConfigurationFactory processPool](self, "processPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProcessPool:", v10);

  objc_msgSend(v9, "setAllowsAirPlayForMediaPlayback:", 0);
  objc_msgSend(v9, "setAllowsPictureInPictureMediaPlayback:", 0);
  objc_msgSend(v9, "setUserContentController:", v8);

  objc_msgSend(v9, "_setWaitsForPaintAfterViewDidMoveToWindow:", 0);
  -[SWWebViewConfigurationFactory websiteDataStore](self, "websiteDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWebsiteDataStore:", v11);

  objc_msgSend(v9, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend(v9, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", 1);
  objc_msgSend(v9, "setMediaTypesRequiringUserActionForPlayback:", objc_msgSend(v7, "mediaTypesRequiringUserActionForPlayback"));
  objc_msgSend(v9, "setWritingToolsBehavior:", -1);
  v12 = objc_alloc_init(MEMORY[0x24BDFA8E0]);
  objc_msgSend(v12, "_setShouldAllowUserInstalledFonts:", 0);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  v15 = objc_msgSend(v7, "fullScreenEnabled");
  if (v14 == 1)
    v16 = v15;
  else
    v16 = 0;
  objc_msgSend(v12, "_setFullScreenEnabled:", v16);
  objc_msgSend(v9, "setPreferences:", v12);

  return v9;
}

- (WKProcessPool)processPool
{
  return self->_processPool;
}

- (WKWebsiteDataStore)websiteDataStore
{
  return self->_websiteDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteDataStore, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
}

@end
