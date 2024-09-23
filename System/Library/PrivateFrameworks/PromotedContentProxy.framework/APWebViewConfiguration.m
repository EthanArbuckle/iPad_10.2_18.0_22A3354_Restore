@implementation APWebViewConfiguration

- (APWebViewConfiguration)init
{
  APWebViewConfiguration *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  APUnfairLock *webProcessConfigurationLock;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  APUnfairLock *webProcessConfigurationWithBackgroundPriorityLock;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  APUnfairLock *videoConfigurationLock;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  APUnfairLock *videoConfigurationWithBackgroundPriorityLock;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)APWebViewConfiguration;
  v2 = -[APWebViewConfiguration init](&v28, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v7 = objc_msgSend_initWithOptions_(v3, v4, 1, v5, v6);
    webProcessConfigurationLock = v2->_webProcessConfigurationLock;
    v2->_webProcessConfigurationLock = (APUnfairLock *)v7;

    v9 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v13 = objc_msgSend_initWithOptions_(v9, v10, 1, v11, v12);
    webProcessConfigurationWithBackgroundPriorityLock = v2->_webProcessConfigurationWithBackgroundPriorityLock;
    v2->_webProcessConfigurationWithBackgroundPriorityLock = (APUnfairLock *)v13;

    v15 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v19 = objc_msgSend_initWithOptions_(v15, v16, 1, v17, v18);
    videoConfigurationLock = v2->_videoConfigurationLock;
    v2->_videoConfigurationLock = (APUnfairLock *)v19;

    v21 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v25 = objc_msgSend_initWithOptions_(v21, v22, 1, v23, v24);
    videoConfigurationWithBackgroundPriorityLock = v2->_videoConfigurationWithBackgroundPriorityLock;
    v2->_videoConfigurationWithBackgroundPriorityLock = (APUnfairLock *)v25;

  }
  return v2;
}

- (WKWebViewConfiguration)webProcessConfiguration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WKWebViewConfiguration *v15;
  WKWebViewConfiguration *webProcessConfiguration;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend_webProcessConfigurationLock(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_webProcessConfiguration)
  {
    v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 0, v13, v14);
    webProcessConfiguration = self->_webProcessConfiguration;
    self->_webProcessConfiguration = v15;

  }
  objc_msgSend_webProcessConfigurationLock(self, v11, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  return self->_webProcessConfiguration;
}

- (WKWebViewConfiguration)webProcessConfigurationWithBackgroundPriority
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WKWebViewConfiguration *v15;
  WKWebViewConfiguration *webProcessConfigurationWithBackgroundPriority;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend_webProcessConfigurationWithBackgroundPriorityLock(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_webProcessConfigurationWithBackgroundPriority)
  {
    v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 1, v13, v14);
    webProcessConfigurationWithBackgroundPriority = self->_webProcessConfigurationWithBackgroundPriority;
    self->_webProcessConfigurationWithBackgroundPriority = v15;

  }
  objc_msgSend_webProcessConfigurationWithBackgroundPriorityLock(self, v11, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  return self->_webProcessConfigurationWithBackgroundPriority;
}

- (WKWebViewConfiguration)videoConfiguration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WKWebViewConfiguration *v15;
  WKWebViewConfiguration *videoConfiguration;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend_videoConfigurationLock(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_videoConfiguration)
  {
    v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 0, v13, v14);
    videoConfiguration = self->_videoConfiguration;
    self->_videoConfiguration = v15;

  }
  objc_msgSend_videoConfigurationLock(self, v11, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  return self->_videoConfiguration;
}

- (WKWebViewConfiguration)videoConfigurationWithBackgroundPriority
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WKWebViewConfiguration *v15;
  WKWebViewConfiguration *videoConfigurationWithBackgroundPriority;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend_videoConfigurationWithBackgroundPriorityLock(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_videoConfigurationWithBackgroundPriority)
  {
    v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 1, v13, v14);
    videoConfigurationWithBackgroundPriority = self->_videoConfigurationWithBackgroundPriority;
    self->_videoConfigurationWithBackgroundPriority = v15;

  }
  objc_msgSend_videoConfigurationWithBackgroundPriorityLock(self, v11, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  return self->_videoConfigurationWithBackgroundPriority;
}

- (id)_newSharedConfigurationWithBackgroundPriority:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend_setAllowsInlineMediaPlayback_(v5, v6, 1, v7, v8);
  objc_msgSend_setMediaTypesRequiringUserActionForPlayback_(v5, v9, 0, v10, v11);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("connect-src https: %@: %@: %@: %@:"), v13, v14, CFSTR("pc-video-https"), CFSTR("pc-video-http"), CFSTR("pc-x-tag-https"), CFSTR("pc-x-tag-http"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setOverrideContentSecurityPolicy_(v5, v16, (uint64_t)v15, v17, v18);
  objc_msgSend_nonPersistentDataStore(MEMORY[0x24BDFA928], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWebsiteDataStore_(v5, v24, (uint64_t)v23, v25, v26);

  v27 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
  objc_msgSend__injectionScriptForResource_injectionTime_(self, v28, (uint64_t)CFSTR("APInjectionScript"), 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addUserScript_(v27, v31, (uint64_t)v30, v32, v33);

  objc_msgSend__injectionScriptForResource_injectionTime_(self, v34, (uint64_t)CFSTR("APViewportElementScript"), 1, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addUserScript_(v27, v37, (uint64_t)v36, v38, v39);

  objc_msgSend__injectionStyleForResource_(self, v40, (uint64_t)CFSTR("APStyleSheet"), v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addUserStyleSheet_(v27, v44, (uint64_t)v43, v45, v46);

  objc_msgSend_setUserContentController_(v5, v47, (uint64_t)v27, v48, v49);
  v53 = (void *)objc_msgSend__newProcessPoolWithBackgroundPriority_(self, v50, v3, v51, v52);
  objc_msgSend_setProcessPool_(v5, v54, (uint64_t)v53, v55, v56);
  objc_msgSend__setWaitsForPaintAfterViewDidMoveToWindow_(v5, v57, 0, v58, v59);
  v60 = objc_alloc_init(MEMORY[0x24BDFA8E0]);
  objc_msgSend__setPeerConnectionEnabled_(v60, v61, 0, v62, v63);
  objc_msgSend_setPreferences_(v5, v64, (uint64_t)v60, v65, v66);

  return v5;
}

- (id)_newProcessPoolWithBackgroundPriority:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDFA978]);
  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], v5, (uint64_t)CFSTR("com.apple.ap.Proxy"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_builtInPlugInsURL(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v13, v14, (uint64_t)CFSTR("PromotedContentWebProcessBundle.bundle"), 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAlwaysRunsAtBackgroundPriority_(v4, v17, v3, v18, v19);
  objc_msgSend_setInjectedBundleURL_(v4, v20, (uint64_t)v16, v21, v22);
  v23 = objc_alloc(MEMORY[0x24BDFA8E8]);
  v27 = (void *)objc_msgSend__initWithConfiguration_(v23, v24, (uint64_t)v4, v25, v26);

  return v27;
}

- (id)_injectionScriptForResource:(id)a3 injectionTime:(int64_t)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a3;
  objc_msgSend_bundleWithIdentifier_(v5, v7, (uint64_t)CFSTR("com.apple.ap.PromotedContentUI"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_(v10, v11, (uint64_t)v6, (uint64_t)CFSTR("js"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithContentsOfURL_encoding_error_(MEMORY[0x24BDD17C8], v14, (uint64_t)v13, 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BDFA900]);
  v18 = (void *)objc_msgSend_initWithSource_injectionTime_forMainFrameOnly_(v16, v17, (uint64_t)v15, a4, 0);

  return v18;
}

- (id)_injectionStyleForResource:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend_bundleWithIdentifier_(v3, v5, (uint64_t)CFSTR("com.apple.ap.PromotedContentUI"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_(v8, v9, (uint64_t)v4, (uint64_t)CFSTR("css"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithContentsOfURL_encoding_error_(MEMORY[0x24BDD17C8], v12, (uint64_t)v11, 4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDFA9B8]);
  v17 = (void *)objc_msgSend_initWithSource_forMainFrameOnly_(v14, v15, (uint64_t)v13, 0, v16);

  return v17;
}

- (APUnfairLock)webProcessConfigurationLock
{
  return self->_webProcessConfigurationLock;
}

- (APUnfairLock)webProcessConfigurationWithBackgroundPriorityLock
{
  return self->_webProcessConfigurationWithBackgroundPriorityLock;
}

- (APUnfairLock)videoConfigurationLock
{
  return self->_videoConfigurationLock;
}

- (APUnfairLock)videoConfigurationWithBackgroundPriorityLock
{
  return self->_videoConfigurationWithBackgroundPriorityLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConfigurationWithBackgroundPriorityLock, 0);
  objc_storeStrong((id *)&self->_videoConfigurationLock, 0);
  objc_storeStrong((id *)&self->_webProcessConfigurationWithBackgroundPriorityLock, 0);
  objc_storeStrong((id *)&self->_webProcessConfigurationLock, 0);
  objc_storeStrong((id *)&self->_videoConfigurationWithBackgroundPriority, 0);
  objc_storeStrong((id *)&self->_videoConfiguration, 0);
  objc_storeStrong((id *)&self->_webProcessConfigurationWithBackgroundPriority, 0);
  objc_storeStrong((id *)&self->_webProcessConfiguration, 0);
}

@end
