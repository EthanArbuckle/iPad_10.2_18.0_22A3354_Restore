@implementation SUClient

- (SUClient)init
{
  return -[SUClient initWithClientInterface:](self, "initWithClientInterface:", 0);
}

- (SUClient)initWithClientInterface:(id)a3
{
  SUClient *v4;
  SUClientInterface *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUClient;
  v4 = -[SUClient init](&v8, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (SUClientInterface *)a3;
    else
      v5 = objc_alloc_init(SUClientInterface);
    v4->_clientInterface = v5;
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    if (!-[SUClientInterface localStoragePath](v4->_clientInterface, "localStoragePath"))
      -[SUClientInterface setLocalStoragePath:](v4->_clientInterface, "setLocalStoragePath:", +[SUWebViewManager defaultLocalStoragePath](SUWebViewManager, "defaultLocalStoragePath"));
    +[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance");
    +[SUNetworkObserver sharedInstance](SUNetworkObserver, "sharedInstance");
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__bagDidLoadNotification_, *MEMORY[0x24BEC8B38], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__memoryWarningNotification_, *MEMORY[0x24BDF7538], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  __CFArray *assetTypes;
  objc_super v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B38], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  assetTypes = self->_assetTypes;
  if (assetTypes)
    CFRelease(assetTypes);

  v5.receiver = self;
  v5.super_class = (Class)SUClient;
  -[SUClient dealloc](&v5, sel_dealloc);
}

+ (void)setSharedClient:(id)a3
{
  _os_nospin_lock_lock();
  if ((id)__SharedClient != a3)
  {

    __SharedClient = (uint64_t)a3;
  }
  _os_nospin_lock_unlock();
}

+ (id)sharedClient
{
  id v2;

  _os_nospin_lock_lock();
  v2 = (id)__SharedClient;
  _os_nospin_lock_unlock();
  return v2;
}

+ (id)imagePool
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedClient"), "imagePool");
}

+ (id)viewControllerFactory
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "sharedClient"), "viewControllerFactory");
}

- (__CFArray)assetTypes
{
  return self->_assetTypes;
}

- (SUClientInterface)clientInterface
{
  SUClientInterface *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_clientInterface;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)clientIdentifier
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[SUClientInterface clientIdentifier](self->_clientInterface, "clientIdentifier");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[7];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!*((_BYTE *)v14 + 24))
      goto LABEL_3;
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  v7 = -[SUClientDelegate client:presentComposeReviewViewController:animated:](self->_delegate, "client:presentComposeReviewViewController:animated:", self, a3, v4);
  *((_BYTE *)v14 + 24) = v7;
  if (v7)
    goto LABEL_5;
LABEL_3:
  v8 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__SUClient_composeReviewWithViewController_animated___block_invoke;
  v11[3] = &unk_24DE7BDB8;
  v11[5] = a3;
  v11[6] = &v13;
  v11[4] = v8;
  v12 = v4;
  objc_msgSend(a3, "prepareWithCompletionBlock:", v11);
  v9 = *((_BYTE *)v14 + 24) != 0;
LABEL_6:
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t __53__SUClient_composeReviewWithViewController_animated___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  BOOL v5;

  result = objc_msgSend(*(id *)(a1 + 32), "object");
  if (result)
    v5 = a2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    result = objc_msgSend(*(id *)(result + 24), "client:presentModalViewController:animated:", result, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)-[SUClientDelegate topViewControllerForClient:](self->_delegate, "topViewControllerForClient:", self);
    if (v5)
    {
      objc_msgSend(v5, "dismissAnimated:", v3);
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[SUClientDelegate client:presentAccountViewController:animated:](self->_delegate, "client:presentAccountViewController:animated:", self, a3, v4) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[SUClientDelegate client:presentModalViewController:animated:](self->_delegate, "client:presentModalViewController:animated:", self, a3, v4);
  }
}

- (SUImageCache)imageCache
{
  SUImageCache *result;

  result = self->_imageCache;
  if (!result)
  {
    result = objc_alloc_init(SUImageCache);
    self->_imageCache = result;
  }
  return result;
}

- (ISURLOperationPool)imagePool
{
  ISURLOperationPool *result;
  id v4;

  result = self->_imagePool;
  if (!result)
  {
    self->_imagePool = (ISURLOperationPool *)objc_alloc_init(MEMORY[0x24BEC8C60]);
    v4 = objc_alloc_init(MEMORY[0x24BEC8BE8]);
    if (MGGetBoolAnswer())
      objc_msgSend(v4, "setMaxConcurrentOperationCount:", 2);
    -[ISURLOperationPool setOperationQueue:](self->_imagePool, "setOperationQueue:", v4);

    return self->_imagePool;
  }
  return result;
}

- (BOOL)openExternalURL:(id)a3
{
  return SUOpenExternalURL((uint64_t)a3, -[SUClient clientInterface](self, "clientInterface"));
}

- (BOOL)openInternalURL:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[SUClientDelegate client:openInternalURL:](self->_delegate, "client:openInternalURL:", self, a3) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return SUOpenExternalURL((uint64_t)a3, -[SUClient clientInterface](self, "clientInterface"));
  }
}

- (BOOL)openURL:(id)a3 inClientApplication:(id)a4
{
  return SUOpenURLInClient((uint64_t)a3, (uint64_t)a4, -[SUClient clientInterface](self, "clientInterface"));
}

- (id)queueSessionManager
{
  SUQueueSessionManager *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[SUClientInterface queueSessionManager](self->_clientInterface, "queueSessionManager");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (SUScriptExecutionContext)scriptExecutionContext
{
  SUScriptExecutionContext *result;

  result = self->_scriptExecutionContext;
  if (!result)
  {
    result = objc_alloc_init(SUScriptExecutionContext);
    self->_scriptExecutionContext = result;
  }
  return result;
}

- (NSString)searchHintsURLBagKey
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[SUClientInterface URLBagKeyForIdentifier:](self->_clientInterface, "URLBagKeyForIdentifier:", CFSTR("SUURLBagKeySearchHints"));
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)searchURLBagKey
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[SUClientInterface URLBagKeyForIdentifier:](self->_clientInterface, "URLBagKeyForIdentifier:", CFSTR("SUURLBagKeySearch"));
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)sendActionForDialog:(id)a3 button:(id)a4
{
  int v6;
  BOOL result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  id v13;
  SUPurchaseManager *v14;
  SUPurchaseBatch *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;

  v6 = objc_msgSend(a4, "actionType", a3);
  result = 0;
  switch(v6)
  {
    case 1:
      v8 = (void *)objc_msgSend(a4, "parameter");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v9 = objc_msgSend(v8, "schemeSwizzledURL");
      v10 = objc_msgSend(a4, "urlType");
      if (v10 == 2)
      {
        v18 = objc_alloc(MEMORY[0x24BEB1F30]);
        v19 = (void *)objc_msgSend(v18, "initWithURLRequest:", objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v9));
        objc_msgSend(v19, "setITunesStoreRequest:", 1);
        objc_msgSend(v19, "setShouldProcessProtocol:", 1);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2000]), "initWithRequestProperties:", v19);
        objc_msgSend(v20, "start");

        goto LABEL_16;
      }
      if (v10 == 1)
      {
        v11 = -[SUClient _newAccountViewControllerForButtonAction:](self, "_newAccountViewControllerForButtonAction:", a4);
        v12 = -[SUClient enterAccountFlowWithViewController:animated:](self, "enterAccountFlowWithViewController:animated:", v11, 1);
        goto LABEL_13;
      }
      -[SUClient openInternalURL:](self, "openInternalURL:", v9);
      goto LABEL_18;
    case 3:
      v13 = objc_alloc_init(MEMORY[0x24BEB1F78]);
      objc_msgSend(v13, "setBuyParameters:", objc_msgSend(a4, "parameter"));
      v14 = -[SUClientInterface purchaseManager](-[SUClient clientInterface](self, "clientInterface"), "purchaseManager");
      v15 = objc_alloc_init(SUPurchaseBatch);
      -[SUPurchaseBatch setPurchaseManager:](v15, "setPurchaseManager:", v14);
      -[SUPurchaseBatch setPurchasesAndContinuationsFromPurchases:](v15, "setPurchasesAndContinuationsFromPurchases:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v13));
      -[SUPurchaseManager addPurchaseBatch:](v14, "addPurchaseBatch:", v15);

LABEL_18:
      result = 1;
      break;
    case 4:
      v16 = objc_msgSend(a4, "parameter");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      result = SUOpenExternalURL(v16, -[SUClient clientInterface](self, "clientInterface"));
      break;
    case 5:
      result = -[SUClient dismissTopViewControllerAnimated:](self, "dismissTopViewControllerAnimated:", 1);
      break;
    case 8:
      v11 = -[SUClient _newComposeReviewViewControllerForButtonAction:](self, "_newComposeReviewViewControllerForButtonAction:", a4);
      v12 = -[SUClient composeReviewWithViewController:animated:](self, "composeReviewWithViewController:animated:", v11, 1);
LABEL_13:
      v17 = v12;

      result = v17;
      break;
    case 9:
      objc_msgSend(MEMORY[0x24BEB1E18], "retryAllRestoreDownloads");
LABEL_16:
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)setAssetTypes:(__CFArray *)a3
{
  __CFArray *assetTypes;

  assetTypes = self->_assetTypes;
  if (assetTypes != a3)
  {
    if (assetTypes)
      CFRelease(assetTypes);
    self->_assetTypes = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)setClientIdentifier:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  -[SUClientInterface setClientIdentifier:](self->_clientInterface, "setClientIdentifier:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B70], "currentClient"), "setAppleClientApplication:", a3);
}

- (void)setQueueSessionManager:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  -[SUClientInterface setQueueSessionManager:](self->_clientInterface, "setQueueSessionManager:", a3);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setSearchHintsURLBagKey:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  -[SUClientInterface setURLBagKey:forIdentifier:](self->_clientInterface, "setURLBagKey:forIdentifier:", a3, CFSTR("SUURLBagKeySearchHints"));
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setSearchURLBagKey:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  -[SUClientInterface setURLBagKey:forIdentifier:](self->_clientInterface, "setURLBagKey:forIdentifier:", a3, CFSTR("SUURLBagKeySearch"));
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setViewControllerFactory:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  -[SUClientInterface setViewControllerFactory:](self->_clientInterface, "setViewControllerFactory:", a3);
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)viewControllerFactory
{
  SUViewControllerFactory *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[SUClientInterface viewControllerFactory](self->_clientInterface, "viewControllerFactory");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v12 = 138412290;
    v13 = objc_opt_class();
    LODWORD(v11) = 12;
    v10 = &v12;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v12, v11);
      free(v8);
      v10 = (int *)v9;
      SSFileLog();
    }
  }
  -[SUClient _purgeCaches](self, "_purgeCaches", v10);
}

- (void)_bagDidLoadNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CFPropertyListRef *v6;

  v4 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v4), "valueForKey:", CFSTR("p2-more-like-this"));
  v6 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!v5)
    v6 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("ISGeniusLookupAvailable"), *v6, CFSTR("com.apple.mobileipod"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
  -[SUClient _reloadScriptExecutionContext](self, "_reloadScriptExecutionContext");
}

- (void)_memoryWarningNotification:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v12 = 138412290;
    v13 = objc_opt_class();
    LODWORD(v11) = 12;
    v10 = &v12;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v12, v11);
      free(v8);
      v10 = (int *)v9;
      SSFileLog();
    }
  }
  -[SUClient _purgeCaches](self, "_purgeCaches", v10);
}

- (id)_newAccountViewControllerForButtonAction:(id)a3
{
  SUAccountViewController *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(SUAccountViewController);
  -[SUViewController setClientInterface:](v5, "setClientInterface:", -[SUClient clientInterface](self, "clientInterface"));
  v6 = (void *)objc_msgSend(a3, "parameter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(v6, "schemeSwizzledURL"));
  -[SUStorePageViewController setURLRequestProperties:](v5, "setURLRequestProperties:", v7);

  return v5;
}

- (id)_newComposeReviewViewControllerForButtonAction:(id)a3
{
  uint64_t v4;
  SUClientInterface *v5;
  SUComposeReviewViewController *v6;

  v4 = objc_msgSend(a3, "parameter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = -[SUClient clientInterface](self, "clientInterface");
  v6 = -[SUViewControllerFactory newComposeReviewViewControllerWithCompositionURL:](-[SUClientInterface viewControllerFactory](v5, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", v4);
  if (!v6)
    v6 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", v4);
  -[SUViewController setClientInterface:](v6, "setClientInterface:", v5);
  return v6;
}

- (BOOL)_presentModalViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SUClientDelegate client:presentModalViewController:animated:](self->_delegate, "client:presentModalViewController:animated:", self, a3, v4);
  else
    return 0;
}

- (void)_purgeCaches
{
  objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache");
  ISURLCachePurgeMemoryCache();
  -[SUImageCache removeAllCachedImages](self->_imageCache, "removeAllCachedImages");
}

- (void)_reloadScriptExecutionContext
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = -[SUClient clientIdentifier](self, "clientIdentifier");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v5), "valueForKey:", CFSTR("p2-global-javascript"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "objectForKey:", v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
        if (v8)
        {
          v9 = (id)v8;
          -[SUScriptExecutionContext evaluateScriptAtURL:](-[SUClient scriptExecutionContext](self, "scriptExecutionContext"), "evaluateScriptAtURL:", v8);

        }
      }
    }
  }
}

- (SUClientDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUClientDelegate *)a3;
}

- (BOOL)dontSaveNavigationPath
{
  return self->_dontSaveNavigationPath;
}

- (void)setDontSaveNavigationPath:(BOOL)a3
{
  self->_dontSaveNavigationPath = a3;
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setImagePool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
