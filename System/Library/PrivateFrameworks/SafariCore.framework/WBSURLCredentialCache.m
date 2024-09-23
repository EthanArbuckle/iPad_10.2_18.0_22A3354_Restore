@implementation WBSURLCredentialCache

- (WBSURLCredentialCache)initWithCredentialFetchBlock:(id)a3
{
  id v4;
  WBSURLCredentialCache *v5;
  void *v6;
  id credentialFetchBlock;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  WBSURLCredentialCache *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSURLCredentialCache;
  v5 = -[WBSURLCredentialCache init](&v12, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    credentialFetchBlock = v5->_credentialFetchBlock;
    v5->_credentialFetchBlock = v6;

    v8 = dispatch_queue_create("com.apple.SafariShared.WBSURLCredentialCache", 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

- (WBSURLCredentialCache)initWithCachingMode:(int64_t)a3 credentialFetchBlock:(id)a4
{
  id v6;
  __objc2_class **v7;
  WBSURLCredentialCache *v8;
  WBSURLCredentialCache *v9;

  v6 = a4;
  if (!a3)
  {
    v7 = off_1E6499210;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v7 = off_1E6499150;
LABEL_5:
    v8 = (WBSURLCredentialCache *)objc_alloc(*v7);

    self = v8;
  }
  v9 = -[WBSURLCredentialCache initWithCredentialFetchBlock:](self, "initWithCredentialFetchBlock:", v6);

  return v9;
}

- (NSDictionary)credentials
{
  return 0;
}

- (void)getCredentialsWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_credentialFetchBlock, 0);
  objc_storeStrong((id *)&self->_credentialCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
