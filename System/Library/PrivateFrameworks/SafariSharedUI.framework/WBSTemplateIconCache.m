@implementation WBSTemplateIconCache

- (WBSTemplateIconCache)init
{
  return -[WBSTemplateIconCache initWithImageDirectoryURL:](self, "initWithImageDirectoryURL:", 0);
}

- (WBSTemplateIconCache)initWithImageDirectoryURL:(id)a3
{
  id v4;
  WBSTemplateIconCache *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *internalQueue;
  uint64_t v14;
  NSMutableDictionary *hostsToRequestSets;
  uint64_t v16;
  NSMutableSet *pendingTemplateIconRequestHosts;
  uint64_t v18;
  NSMutableSet *pendingTemplateIconFallbackRequestHosts;
  uint64_t v20;
  NSMutableSet *pendingSVGImageRenderingRequests;
  uint64_t v22;
  NSMutableSet *pendingSVGImageRenderingRequestsThatCanBeSavedToDisk;
  uint64_t v24;
  NSMutableDictionary *requestsToDelayedResponses;
  NSCache *v26;
  NSCache *requestsToResponses;
  void *v28;
  WBSSiteMetadataImageCache *v29;
  WBSSiteMetadataImageCache *imageCache;
  WBSTemplateIconCache *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WBSTemplateIconCache;
  v5 = -[WBSTemplateIconCache init](&v33, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v8, v5);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v12;

    v5->_templateIconsDataForHostsAccessLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    hostsToRequestSets = v5->_hostsToRequestSets;
    v5->_hostsToRequestSets = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingTemplateIconRequestHosts = v5->_pendingTemplateIconRequestHosts;
    v5->_pendingTemplateIconRequestHosts = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    pendingTemplateIconFallbackRequestHosts = v5->_pendingTemplateIconFallbackRequestHosts;
    v5->_pendingTemplateIconFallbackRequestHosts = (NSMutableSet *)v18;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    pendingSVGImageRenderingRequests = v5->_pendingSVGImageRenderingRequests;
    v5->_pendingSVGImageRenderingRequests = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    pendingSVGImageRenderingRequestsThatCanBeSavedToDisk = v5->_pendingSVGImageRenderingRequestsThatCanBeSavedToDisk;
    v5->_pendingSVGImageRenderingRequestsThatCanBeSavedToDisk = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    requestsToDelayedResponses = v5->_requestsToDelayedResponses;
    v5->_requestsToDelayedResponses = (NSMutableDictionary *)v24;

    v26 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    requestsToResponses = v5->_requestsToResponses;
    v5->_requestsToResponses = v26;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel__didAddHistoryItems_, *MEMORY[0x1E0D8A3F8], 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel__didAddHistoryItems_, *MEMORY[0x1E0D8A3F0], 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel__didRemoveHistoryItems_, *MEMORY[0x1E0D8A400], 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel__didLoadHistory_, *MEMORY[0x1E0D8A410], 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel__didRemoveHistoryItems_, *MEMORY[0x1E0D8A408], 0);
    v29 = -[WBSSiteMetadataImageCache initWithImageDirectoryURL:imageType:]([WBSSiteMetadataImageCache alloc], "initWithImageDirectoryURL:imageType:", v4, 0);
    imageCache = v5->_imageCache;
    v5->_imageCache = v29;

    -[WBSSiteMetadataImageCache setDelegate:](v5->_imageCache, "setDelegate:", v5);
    -[WBSSiteMetadataImageCache setUpImageCache](v5->_imageCache, "setUpImageCache");
    v31 = v5;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSTemplateIconCache;
  -[WBSTemplateIconCache dealloc](&v4, sel_dealloc);
}

- (NSURL)imageDirectoryURL
{
  return -[WBSSiteMetadataImageCache imageDirectoryURL](self->_imageCache, "imageDirectoryURL");
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    *a4 = 1;
    -[NSCache objectForKey:](self->_requestsToResponses, "objectForKey:", v6);
  }
  else
  {
    *a4 = 0;
    -[WBSTemplateIconCache _monogramForRequest:themeColor:](self, "_monogramForRequest:themeColor:", v6, 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[WBSTemplateIconCache _registerRequest:](self, "_registerRequest:", v6);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSTemplateIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E54464C8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __71__WBSTemplateIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_requestTemplateIconForRequest:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "hasDeterminedIconAvailabilityForURL:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUpAndReturnPreparedResponseForRequest:", *(_QWORD *)(a1 + 40));
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUpAndReturnDelayedResponseForRequest:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_setUpAndReturnDelayedResponseForRequest:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToDelayedResponses, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[WBSTemplateIconCache _generateResponseForRequest:](self, "_generateResponseForRequest:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToDelayedResponses, "setObject:forKeyedSubscript:", v5, v6);
  }
  objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v5, 1, 0, v6);

}

- (void)_setUpAndReturnPreparedResponseForRequest:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  -[NSCache objectForKey:](self->_requestsToResponses, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v5, 0, 0, v6);
  }
  else
  {
    -[WBSTemplateIconCache _generateResponseForRequest:](self, "_generateResponseForRequest:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](self->_requestsToResponses, "setObject:forKey:", v5, v6);
    -[NSMutableDictionary removeObjectForKey:](self->_requestsToDelayedResponses, "removeObjectForKey:", v6);
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v5, 0, 1, v6);
  }

}

- (void)_registerRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSTemplateIconCache *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__WBSTemplateIconCache__registerRequest___block_invoke;
  v7[3] = &unk_1E54413C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __41__WBSTemplateIconCache__registerRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringByRemovingWwwDotPrefix");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:");
  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSTemplateIconCache *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WBSTemplateIconCache_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E54413C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __54__WBSTemplateIconCache_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringByRemovingWwwDotPrefix");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObjectForKey:", v5);

}

- (BOOL)_isLocalIconRequest:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_isHTTPFamilyURL") ^ 1;

  return v4;
}

- (void)_requestTemplateIconForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  WBSSiteMetadataImageCache *imageCache;
  id v10;
  id v11;

  objc_msgSend(a3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringByRemovingWwwDotPrefix");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v11)
  {
    if (self->_areSettingsLoaded)
    {
      os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_templateIconsDataForHosts, "objectForKeyedSubscript:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
      v8 = objc_msgSend(v7, "safari_BOOLForKey:", CFSTR("TemplateIconInCache"));
      imageCache = self->_imageCache;
      if (v8)
        v10 = -[WBSSiteMetadataImageCache imageForKeyString:getImageState:](imageCache, "imageForKeyString:getImageState:", v11, 0);
      else
        -[WBSSiteMetadataImageCache setImageState:forKeyString:](imageCache, "setImageState:forKeyString:", 1, v11);

      v6 = v11;
    }
    else
    {
      -[NSMutableSet addObject:](self->_pendingTemplateIconRequestHosts, "addObject:", v11);
      v6 = v11;
    }
  }

}

- (id)_templateIconForURL:(id)a3 getThemeColor:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  WBSSiteMetadataImageCache *imageCache;
  void *v14;
  void *v15;

  v6 = a3;
  *a4 = 0;
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringByRemovingWwwDotPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && self->_areSettingsLoaded)
  {
    os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_templateIconsDataForHosts, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TemplateIconThemeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "safari_colorWithRGBColorComponents:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v11;
    if (!v11)
    {
      v12 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("TemplateIconThemeColor"));
      os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_templateIconsDataForHosts, "setObject:forKeyedSubscript:", v12, v8);
      imageCache = self->_imageCache;
      v14 = (void *)-[NSMutableDictionary copy](self->_templateIconsDataForHosts, "copy");
      -[WBSSiteMetadataImageCache setSetting:forKey:](imageCache, "setSetting:forKey:", v14, CFSTR("TemplateIcons"));

      os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
    }
    if (objc_msgSend(v9, "safari_BOOLForKey:", CFSTR("TemplateIconInCache")))
    {
      -[WBSSiteMetadataImageCache imageForKeyString:getImageState:](self->_imageCache, "imageForKeyString:getImageState:", v8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_generateResponseForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[WBSTemplateIconCache _imageForRequest:getThemeColor:](self, "_imageForRequest:getThemeColor:", v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    objc_msgSend(v4, "overrideForegroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.75, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[WBSImageUtilities flatImage:withColor:](WBSImageUtilities, "flatImage:withColor:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)

    +[WBSImageUtilities flatImage:withColor:](WBSImageUtilities, "flatImage:withColor:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTemplateIconResponse responseWithURL:image:highlightedImage:themeColor:isMonogram:](WBSTemplateIconResponse, "responseWithURL:image:highlightedImage:themeColor:isMonogram:", v5, v10, v11, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSTemplateIconCache _monogramForRequest:themeColor:](self, "_monogramForRequest:themeColor:", v4, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_monogramForRequest:(id)a3 themeColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monogramConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "skipMonogramGeneration"))
  {
    +[WBSTemplateIconResponse responseWithURL:image:highlightedImage:themeColor:isMonogram:](WBSTemplateIconResponse, "responseWithURL:image:highlightedImage:themeColor:isMonogram:", v7, 0, 0, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "monogramTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v35 = v10;
      objc_msgSend(v8, "iconSize");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v8, "fontSize");
      v16 = v15;
      v17 = objc_msgSend(v8, "fontWeight");
      v18 = objc_msgSend(v8, "fontDesign");
      objc_msgSend(v8, "baselineOffset");
      v20 = v19;
      objc_msgSend(v8, "cornerRadius");
      v22 = v21;
      objc_msgSend(v8, "backgroundColor");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
        v25 = (void *)v23;
      else
        v25 = v6;
      v26 = v25;

      v34 = v26;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.75, 1.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", v17, v18, v27, v12, v14, v16, v20, v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", v17, v18, v26, v12, v14, v16, v20, v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v35;
      +[WBSTemplateIconMonogramGenerator monogramWithTitle:url:monogramConfiguration:](WBSTemplateIconMonogramGenerator, "monogramWithTitle:url:monogramConfiguration:", v35, v7, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSTemplateIconMonogramGenerator monogramWithTitle:url:monogramConfiguration:](WBSTemplateIconMonogramGenerator, "monogramWithTitle:url:monogramConfiguration:", v35, v7, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.75, 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSTemplateIconMonogramGenerator monogramWithTitle:url:backgroundColor:](WBSTemplateIconMonogramGenerator, "monogramWithTitle:url:backgroundColor:", v10, v7, v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      +[WBSTemplateIconMonogramGenerator monogramWithTitle:url:backgroundColor:](WBSTemplateIconMonogramGenerator, "monogramWithTitle:url:backgroundColor:", v10, v7, v6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[WBSTemplateIconResponse responseWithURL:image:highlightedImage:themeColor:isMonogram:](WBSTemplateIconResponse, "responseWithURL:image:highlightedImage:themeColor:isMonogram:", v7, v30, v31, v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)cacheData:(id)a3 forRequest:(id)a4 usingToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *internalQueue;
  id v15;
  _QWORD v17[4];
  id v18;
  WBSTemplateIconCache *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    internalQueue = self->_internalQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke;
    v17[3] = &unk_1E5446B30;
    v18 = v13;
    v19 = self;
    v20 = v10;
    v21 = v9;
    v15 = v13;
    dispatch_async(internalQueue, v17);

  }
  return v8 != 0;
}

void __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke(uint64_t a1)
{
  WBSSVGImageRenderingRequest *v2;
  void *v3;
  WBSSVGImageRenderingRequest *v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  WBSSVGImageRenderingRequest *v14;
  id v15;
  id v16;
  id v17;

  v2 = [WBSSVGImageRenderingRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "templateIconURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBSSVGImageRenderingRequest initWithURL:imageSize:](v2, "initWithURL:imageSize:", v3, *(double *)(*(_QWORD *)(a1 + 40) + 120), *(double *)(*(_QWORD *)(a1 + 40) + 128));

  if (objc_msgSend(*(id *)(a1 + 32), "canSaveToDisk"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "containsObject:", v4);
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(WeakRetained, "siteMetadataProvider:didFinishCachingDataWithToken:", v7, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(v7 + 72), "addObject:", v4);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(v10 + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke_2;
    v13[3] = &unk_1E5446B08;
    v13[4] = v10;
    v14 = v4;
    v15 = *(id *)(a1 + 32);
    v16 = WeakRetained;
    v17 = *(id *)(a1 + 48);
    v12 = (id)objc_msgSend(v16, "siteMetadataProvider:registerOneTimeSubrequest:forRequests:queue:responseHandler:", v8, v14, v9, v11, v13);

  }
}

void __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v8, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "themeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_saveTemplateIcon:withThemeColor:forHost:toDisk:", v5, v6, v7, v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "siteMetadataProvider:didFinishCachingDataWithToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));

}

- (void)_saveTemplateIcon:(id)a3 withThemeColor:(id)a4 forHost:(id)a5 toDisk:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  WBSSiteMetadataImageCache *imageCache;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v14 = 1;
  else
    v14 = -[WBSSiteMetadataImageCache imageStateForKeyString:](self->_imageCache, "imageStateForKeyString:", v13) == 0;
  -[WBSTemplateIconCache _updateTemplateIconsDataForHost:image:themeColor:isSavedToDisk:](self, "_updateTemplateIconsDataForHost:image:themeColor:isSavedToDisk:", v13, v10, v11, v6);
  imageCache = self->_imageCache;
  if (v6)
    -[WBSSiteMetadataImageCache saveImageToDisk:forKeyString:completionHandler:](imageCache, "saveImageToDisk:forKeyString:completionHandler:", v10, v13, 0);
  else
    -[WBSSiteMetadataImageCache setImage:forKeyString:](imageCache, "setImage:forKeyString:", v10, v13);
  if (!v14)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v16);
          -[WBSTemplateIconCache _setUpAndReturnPreparedResponseForRequest:](self, "_setUpAndReturnPreparedResponseForRequest:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
}

- (void)retainTemplateIconForURLString:(id)a3
{
  id v4;
  WBSSiteMetadataImageCache *imageCache;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__WBSTemplateIconCache_retainTemplateIconForURLString___block_invoke;
  v7[3] = &unk_1E5446B58;
  v8 = v4;
  v6 = v4;
  -[WBSSiteMetadataImageCache retainImageWithKeyStringProvider:](imageCache, "retainImageWithKeyStringProvider:", v7);

}

id __55__WBSTemplateIconCache_retainTemplateIconForURLString___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringByRemovingWwwDotPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)retainTemplateIconForHost:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  id v4;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "safari_stringByRemovingWwwDotPrefix");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache retainImageForKeyString:](imageCache, "retainImageForKeyString:");

}

- (void)retainTemplateIconsForHosts:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  id v4;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "valueForKey:", CFSTR("safari_stringByRemovingWwwDotPrefix"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache retainImagesForKeyStrings:](imageCache, "retainImagesForKeyStrings:");

}

- (void)releaseTemplateIconForURLString:(id)a3
{
  id v4;
  WBSSiteMetadataImageCache *imageCache;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WBSTemplateIconCache_releaseTemplateIconForURLString___block_invoke;
  v7[3] = &unk_1E5446B58;
  v8 = v4;
  v6 = v4;
  -[WBSSiteMetadataImageCache releaseImageWithKeyStringProvider:](imageCache, "releaseImageWithKeyStringProvider:", v7);

}

id __56__WBSTemplateIconCache_releaseTemplateIconForURLString___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)releaseTemplateIconForHost:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  id v4;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "safari_stringByRemovingWwwDotPrefix");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache releaseImageForKeyString:](imageCache, "releaseImageForKeyString:");

}

- (void)releaseTemplateIconsForHosts:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  id v4;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "valueForKey:", CFSTR("safari_stringByRemovingWwwDotPrefix"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache releaseImagesForKeyStrings:](imageCache, "releaseImagesForKeyStrings:");

}

- (BOOL)hasDeterminedIconAvailabilityForURL:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  void *v4;
  void *v5;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(imageCache) = -[WBSSiteMetadataImageCache imageStateForKeyString:](imageCache, "imageStateForKeyString:", v5) != 0;

  return (char)imageCache;
}

- (BOOL)shouldRequestTemplateIconForURL:(id)a3 allowRefresh:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;

  v6 = a3;
  v7 = v6;
  if (self->_areSettingsLoaded)
  {
    objc_msgSend(v6, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_templateIconsDataForHosts, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
      if (v10)
      {
        if (!objc_msgSend(v10, "safari_BOOLForKey:", CFSTR("TemplateIconInCache")) || a4)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TemplateIconLastRequestDate"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceNow");
          v11 = v13 < -345600.0;

        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = -[WBSSiteMetadataImageCache imageStateForKeyString:](self->_imageCache, "imageStateForKeyString:", v9) == 1;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)emptyCaches
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WBSTemplateIconCache_emptyCaches__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __35__WBSTemplateIconCache_emptyCaches__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllImages");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "emptyCache");
}

- (void)purgeUnneededCacheEntries
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSTemplateIconCache_purgeUnneededCacheEntries__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __49__WBSTemplateIconCache_purgeUnneededCacheEntries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "purgeUnneededImages");
}

- (void)savePendingChangesBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, &__block_literal_global_45);
  -[WBSSiteMetadataImageCache savePendingChangesBeforeTermination](self->_imageCache, "savePendingChangesBeforeTermination");
}

- (void)_updateTemplateIconsDataForHost:(id)a3 image:(id)a4 themeColor:(id)a5 isSavedToDisk:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  os_unfair_lock_s *p_templateIconsDataForHostsAccessLock;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WBSSiteMetadataImageCache *imageCache;
  void *v21;
  id v22;

  v6 = a6;
  v22 = a3;
  v10 = a5;
  p_templateIconsDataForHostsAccessLock = &self->_templateIconsDataForHostsAccessLock;
  os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_templateIconsDataForHosts, "objectForKeyedSubscript:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("TemplateIconLastRequestDate"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TemplateIconRequestCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("TemplateIconRequestCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4 != 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("TemplateIconInCache"));

  if (v10)
  {
    objc_msgSend(v10, "safari_rgbColorComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("TemplateIconThemeColor"));

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_templateIconsDataForHosts, "setObject:forKeyedSubscript:", v13, v22);
  if (v6)
  {
    imageCache = self->_imageCache;
    v21 = (void *)-[NSMutableDictionary copy](self->_templateIconsDataForHosts, "copy");
    -[WBSSiteMetadataImageCache setSetting:forKey:](imageCache, "setSetting:forKey:", v21, CFSTR("TemplateIcons"));

  }
  os_unfair_lock_unlock(p_templateIconsDataForHostsAccessLock);

}

- (void)_removeTemplateIconsDataForHost:(id)a3 ifIconIsInCache:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_templateIconsDataForHostsAccessLock;
  void *v7;
  int v8;
  WBSSiteMetadataImageCache *imageCache;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  p_templateIconsDataForHostsAccessLock = &self->_templateIconsDataForHostsAccessLock;
  os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
  if (!v4
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_templateIconsDataForHosts, "objectForKeyedSubscript:", v12), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "safari_BOOLForKey:", CFSTR("TemplateIconInCache")), v7, v8))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_templateIconsDataForHosts, "removeObjectForKey:", v12);
    imageCache = self->_imageCache;
    v10 = -[NSMutableDictionary count](self->_templateIconsDataForHosts, "count");
    if (v10)
      v11 = (void *)-[NSMutableDictionary copy](self->_templateIconsDataForHosts, "copy");
    else
      v11 = 0;
    -[WBSSiteMetadataImageCache setSetting:forKey:](imageCache, "setSetting:forKey:", v11, CFSTR("TemplateIcons"));
    if (v10)

  }
  os_unfair_lock_unlock(p_templateIconsDataForHostsAccessLock);

}

- (void)_upgradeCacheVersionIfNeeded
{
  os_unfair_lock_s *p_templateIconsDataForHostsAccessLock;
  id v4;

  p_templateIconsDataForHostsAccessLock = &self->_templateIconsDataForHostsAccessLock;
  os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
  -[WBSSiteMetadataImageCache settingForKey:](self->_imageCache, "settingForKey:", CFSTR("TemplateIconCacheVersion"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 6)
  {
    -[WBSSiteMetadataImageCache setSetting:forKey:](self->_imageCache, "setSetting:forKey:", 0, CFSTR("TemplateIcons"));
    -[WBSSiteMetadataImageCache setSetting:forKey:](self->_imageCache, "setSetting:forKey:", &unk_1E547A0C8, CFSTR("TemplateIconCacheVersion"));
    -[WBSSiteMetadataImageCache setSetting:forKey:](self->_imageCache, "setSetting:forKey:", 0, CFSTR("TemplateIconFallbackConfiguration"));
    -[WBSSiteMetadataImageCache setSetting:forKey:](self->_imageCache, "setSetting:forKey:", 0, CFSTR("TemplateIconFallbackConfigurationLastRefreshDate"));
    -[WBSSiteMetadataImageCache removeAllImages](self->_imageCache, "removeAllImages");
  }
  os_unfair_lock_unlock(p_templateIconsDataForHostsAccessLock);

}

- (id)_imageForRequest:(id)a3 getThemeColor:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTemplateIconCache _templateIconForURL:getThemeColor:](self, "_templateIconForURL:getThemeColor:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_notifyDidLoadIconForHost:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        -[NSCache removeObjectForKey:](self->_requestsToResponses, "removeObjectForKey:", v8);
        -[WBSTemplateIconCache _setUpAndReturnPreparedResponseForRequest:](self, "_setUpAndReturnPreparedResponseForRequest:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_purgeUnneededTemplateIconsIfReady
{
  if (-[WBSTemplateIconCache _templateIconRetainerIsReadyForCleanUp](self, "_templateIconRetainerIsReadyForCleanUp"))
  {
    if (!self->_hasPurgedUnneededItems)
    {
      self->_hasPurgedUnneededItems = 1;
      -[WBSTemplateIconCache purgeUnneededCacheEntries](self, "purgeUnneededCacheEntries");
    }
  }
}

- (BOOL)_templateIconRetainerIsReadyForCleanUp
{
  return self->_historyDidFinishLoading;
}

- (void)_didAddHistoryItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *internalQueue;
  _QWORD v8[4];
  id v9;
  WBSTemplateIconCache *v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A3E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    internalQueue = self->_internalQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__WBSTemplateIconCache__didAddHistoryItems___block_invoke;
    v8[3] = &unk_1E54413C0;
    v9 = v6;
    v10 = self;
    dispatch_async(internalQueue, v8);

  }
}

void __44__WBSTemplateIconCache__didAddHistoryItems___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "url", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "host");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v2, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "retainTemplateIconsForHosts:", v2);
}

- (void)_didRemoveHistoryItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WBSTemplateIconCache *v12;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A3E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__WBSTemplateIconCache__didRemoveHistoryItems___block_invoke;
    v10[3] = &unk_1E54413C0;
    v11 = v7;
    v12 = self;
    v9 = v7;
    dispatch_async(internalQueue, v10);

  }
}

void __47__WBSTemplateIconCache__didRemoveHistoryItems___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "url", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "host");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v2, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "releaseTemplateIconsForHosts:", v2);
}

- (void)_didLoadHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v4 = a3;
  self->_historyDidFinishLoading = 1;
  v8 = v4;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A3E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
    -[WBSTemplateIconCache _purgeUnneededTemplateIconsIfReady](self, "_purgeUnneededTemplateIconsIfReady");

}

- (void)_notifyImageWasLoaded:(id)a3 forHost:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!v7)
    -[WBSTemplateIconCache _removeTemplateIconsDataForHost:ifIconIsInCache:](self, "_removeTemplateIconsDataForHost:ifIconIsInCache:", v6, 1);
  -[WBSTemplateIconCache _notifyDidLoadIconForHost:](self, "_notifyDidLoadIconForHost:", v6);

}

- (void)siteMetadataImageCacheDidFinishLoadingSettings:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSTemplateIconCache_siteMetadataImageCacheDidFinishLoadingSettings___block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __71__WBSTemplateIconCache_siteMetadataImageCacheDidFinishLoadingSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_upgradeCacheVersionIfNeeded");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "settingForKey:", CFSTR("TemplateIcons"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA70];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "mutableCopy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "safari_BOOLForKey:", CFSTR("TemplateIconInCache"));
        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        if (v15)
        {
          v17 = (id)objc_msgSend(v16, "imageForKeyString:getImageState:", v13, 0);
        }
        else
        {
          objc_msgSend(v16, "setImageState:forKeyString:", 1, v13);
          objc_msgSend(*(id *)(a1 + 32), "_notifyImageWasLoaded:forHost:", 0, v13);
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 56);
  *(_QWORD *)(v18 + 56) = 0;

}

- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WBSTemplateIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke;
  block[3] = &unk_1E5441410;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(internalQueue, block);

}

uint64_t __82__WBSTemplateIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyImageWasLoaded:forHost:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)siteMetadataImageCache:(id)a3 didRemoveImageFromCacheForKeyString:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__WBSTemplateIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke;
  v8[3] = &unk_1E54413C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

uint64_t __83__WBSTemplateIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTemplateIconsDataForHost:ifIconIsInCache:", *(_QWORD *)(a1 + 40), 0);
}

- (void)siteMetadataImageCacheDidEmptyCache:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSTemplateIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __60__WBSTemplateIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setImageState:forKeyString:", 1, v6, (_QWORD)v7);
        objc_msgSend(*(id *)(a1 + 32), "_notifyImageWasLoaded:forHost:", 0, v6);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (CGSize)defaultIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultIconSize.width;
  height = self->_defaultIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultIconSize:(CGSize)a3
{
  self->_defaultIconSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_requestsToResponses, 0);
  objc_storeStrong((id *)&self->_requestsToDelayedResponses, 0);
  objc_storeStrong((id *)&self->_pendingSVGImageRenderingRequestsThatCanBeSavedToDisk, 0);
  objc_storeStrong((id *)&self->_pendingSVGImageRenderingRequests, 0);
  objc_storeStrong((id *)&self->_pendingTemplateIconFallbackRequestHosts, 0);
  objc_storeStrong((id *)&self->_pendingTemplateIconRequestHosts, 0);
  objc_storeStrong((id *)&self->_hostsToRequestSets, 0);
  objc_storeStrong((id *)&self->_templateIconsDataForHosts, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
