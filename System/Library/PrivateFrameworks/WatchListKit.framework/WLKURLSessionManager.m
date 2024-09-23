@implementation WLKURLSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_35);
  return (id)sharedInstance_sharedInstance_1;
}

void __38__WLKURLSessionManager_sharedInstance__block_invoke()
{
  NSObject *v0;
  WLKURLSessionManager *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SessionManager.Init", ", buf, 2u);
  }

  v1 = objc_alloc_init(WLKURLSessionManager);
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

  WLKStartupSignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SessionManager.Init", ", v4, 2u);
  }

}

- (WLKURLSessionManager)init
{
  WLKURLSessionManager *v2;
  void *v3;
  void *v4;
  WLKURLResponseDecoder *v5;
  AMSURLSession *urlSession;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLKURLSessionManager;
  v2 = -[WLKURLSessionManager init](&v8, sel_init);
  if (v2)
  {
    +[WLKNetworkRequestUtilities defaultSessionConfiguration](WLKNetworkRequestUtilities, "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDCA0], "minimalSessionUsing:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(WLKURLResponseDecoder);
    objc_msgSend(v4, "setResponseDecoder:", v5);

    urlSession = v2->_urlSession;
    v2->_urlSession = (AMSURLSession *)v4;

  }
  return v2;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
