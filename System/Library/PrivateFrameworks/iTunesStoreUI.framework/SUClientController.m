@implementation SUClientController

- (SUClientController)init
{
  return -[SUClientController initWithClientInterface:](self, "initWithClientInterface:", 0);
}

- (SUClientController)initWithClientInterface:(id)a3
{
  SUClientController *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUClientController;
  v4 = -[SUClientController init](&v13, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUClientController.%p"), v4);
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);

    if (a3)
    {
      -[SUClientController setClientInterface:](v4, "setClientInterface:", a3);
    }
    else
    {
      a3 = objc_alloc_init(SUClientInterface);
      -[SUClientController setClientInterface:](v4, "setClientInterface:", a3);
      v6 = a3;
    }
    if (!objc_msgSend(a3, "localStoragePath"))
      objc_msgSend(a3, "setLocalStoragePath:", +[SUWebViewManager defaultLocalStoragePath](SUWebViewManager, "defaultLocalStoragePath"));
    +[SUNetworkObserver sharedInstance](SUNetworkObserver, "sharedInstance");
    v7 = objc_msgSend(a3, "clientIdentifier");
    if (v7)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B70], "currentClient"), "setAppleClientApplication:", v7);
    v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance"), "copyProtocolConditionalContext");
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = __Block_byref_object_copy__42;
    v12[4] = __Block_byref_object_dispose__42;
    v12[5] = v4;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__SUClientController_initWithClientInterface___block_invoke;
    v11[3] = &unk_24DE7D370;
    v11[4] = v12;
    objc_msgSend(v8, "setItemLookupBlock:", v11);
    objc_msgSend(MEMORY[0x24BEB1F70], "setDefaultConditionalContext:", v8);

    v9 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_bagDidLoadNotification_, *MEMORY[0x24BEC8B38], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__dialogNotification_, *MEMORY[0x24BEC8AB8], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__memoryWarningNotification_, *MEMORY[0x24BDF7538], 0);
    _Block_object_dispose(v12, 8);
  }
  return v4;
}

uint64_t __46__SUClientController_initWithClientInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "libraryContainsItemIdentifier:", a2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *dispatchQueue;
  __CFArray *offeredAssetTypes;
  objc_super v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B38], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8AB8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);
  -[SUClientInterface setDelegate:](self->_clientInterface, "setDelegate:", 0);
  -[SUPurchaseManager setDelegate:](-[SUClientInterface purchaseManager](self->_clientInterface, "purchaseManager"), "setDelegate:", 0);
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance"), "copyProtocolConditionalContext");
  objc_msgSend(MEMORY[0x24BEB1F70], "setDefaultConditionalContext:", v4);

  -[MFMailComposeViewController setDelegate:](self->_mailComposeViewController, "setDelegate:", 0);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  offeredAssetTypes = self->_offeredAssetTypes;
  if (offeredAssetTypes)
    CFRelease(offeredAssetTypes);

  v7.receiver = self;
  v7.super_class = (Class)SUClientController;
  -[SUClientController dealloc](&v7, sel_dealloc);
}

+ (void)setSharedController:(id)a3
{
  if ((id)__SharedController != a3)
  {

    __SharedController = (uint64_t)a3;
  }
}

+ (id)sharedController
{
  return (id)__SharedController;
}

- (void)becomeActive
{
  NSObject *dispatchQueue;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__SUClientController_becomeActive__block_invoke;
  v3[3] = &unk_24DE7BE08;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(dispatchQueue, v3);
  if (*((_BYTE *)v5 + 24))
  {
    objc_msgSend(MEMORY[0x24BEC8C20], "invalidateCurrentMap");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "reloadNetworkType");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "existingDefaultStore"), "reloadAccounts");
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __34__SUClientController_becomeActive__block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  }
  return result;
}

- (void)cancelAllOperations
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "cancelAllOperations");
}

- (SUClientInterface)clientInterface
{
  NSObject *dispatchQueue;
  SUClientInterface *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__42;
  v10 = __Block_byref_object_dispose__42;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SUClientController_clientInterface__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUClientInterface *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SUClientController_clientInterface__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  UIViewController *v5;
  UIViewController *v6;
  _QWORD v8[6];

  v5 = -[SUClientController rootViewController](self, "rootViewController", a3, a4);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__SUClientController_composeReviewWithViewController_animated___block_invoke;
    v8[3] = &unk_24DE7CDB8;
    v8[4] = v5;
    v8[5] = a3;
    objc_msgSend(a3, "prepareWithCompletionBlock:", v8);
  }
  return v6 != 0;
}

uint64_t __63__SUClientController_composeReviewWithViewController_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", *(_QWORD *)(result + 32)), "presentViewController:animated:completion:", *(_QWORD *)(result + 40), 1, 0);
  return result;
}

- (BOOL)dismissTopViewControllerAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)displayClientURL:(id)a3
{
  return -[SUClientController displayClientURL:withSourceApplication:sourceURLString:](self, "displayClientURL:withSourceApplication:sourceURLString:", a3, 0, 0);
}

- (BOOL)displayClientURL:(id)a3 withSourceApplication:(id)a4 sourceURLString:(id)a5
{
  return 0;
}

- (void)exitStoreWithReason:(int64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "suspend");
}

- (BOOL)ignoresExpectedClientsProtocol
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SUClientController_ignoresExpectedClientsProtocol__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__SUClientController_ignoresExpectedClientsProtocol__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_ignoresExpectedClientsProtocol");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isStoreEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  char v9;
  CFIndex v10;
  CFIndex v11;
  uint64_t v12;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v4 = objc_msgSend(v3, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0));
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = -[SUClientController offeredAssetTypes](self, "offeredAssetTypes");
  if (!v6)
    return 1;
  v7 = v6;
  Count = CFArrayGetCount(v6);
  v9 = Count == 0;
  if (Count >= 1)
  {
    v10 = Count;
    v11 = 0;
    v9 = 0;
    do
    {
      CFArrayGetValueAtIndex(v7, v11);
      v12 = SSDownloadKindForAssetType();
      if ((v9 & 1) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend((id)objc_msgSend(v5, "networkConstraintsForDownloadKind:", v12), "isAnyNetworkTypeEnabled");
      ++v11;
    }
    while (v10 != v11);
  }
  return v9;
}

- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3
{
  return 0;
}

- (id)newScriptInterface
{
  return objc_alloc_init(SUScriptInterface);
}

- (__CFArray)offeredAssetTypes
{
  return self->_offeredAssetTypes;
}

- (BOOL)openClientURL:(id)a3
{
  return -[SUClientController openClientURL:withSourceApplication:sourceURLString:](self, "openClientURL:withSourceApplication:sourceURLString:", a3, 0, 0);
}

- (BOOL)openURL:(id)a3
{
  return SUOpenExternalURL((uint64_t)a3, -[SUClientController clientInterface](self, "clientInterface"));
}

- (BOOL)openURL:(id)a3 inClientWithIdentifier:(id)a4
{
  return SUOpenURLInClient((uint64_t)a3, (uint64_t)a4, -[SUClientController clientInterface](self, "clientInterface"));
}

- (id)overlayBackgroundViewController
{
  return 0;
}

- (id)overlayConfigurationForStorePage:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *overlayConfigurations;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "URLRequestProperties");
  v5 = objc_msgSend(v4, "URLBagKey");
  v6 = objc_msgSend(v4, "URL");
  overlayConfigurations = self->_overlayConfigurations;
  if (!overlayConfigurations)
  {
    -[SUClientController _reloadOverlayConfigurationsFromURLBag](self, "_reloadOverlayConfigurationsFromURLBag");
    overlayConfigurations = self->_overlayConfigurations;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](overlayConfigurations, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(overlayConfigurations);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
      if (v6)
      {
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "matchesURL:", v6) & 1) != 0)
          break;
      }
      if (v5 && (objc_msgSend(v12, "matchesURLBagKey:", v5) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](overlayConfigurations, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v12 = 0;
  }
  return v12;
}

- (BOOL)presentAccountViewController:(id)a3 animated:(BOOL)a4
{
  return -[SUClientController presentAccountViewController:showNavigationBar:animated:](self, "presentAccountViewController:showNavigationBar:animated:", a3, 0, a4);
}

- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5
{
  return 0;
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  return 0;
}

- (void)resignActive
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SUClientController_resignActive__block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

_QWORD *__34__SUClientController_resignActive__block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 0;
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");

    *(_QWORD *)(v2[4] + 48) = (id)objc_msgSend(v3, "storeFrontIdentifier");
    result = (id)objc_msgSend(v3, "synchedStoreFrontIdentifier");
    *(_QWORD *)(v2[4] + 96) = result;
  }
  return result;
}

- (void)setClientInterface:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SUClientController_setClientInterface___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__41__SUClientController_setClientInterface___block_invoke(uint64_t a1)
{
  void *v2;
  void *result;

  v2 = *(void **)(a1 + 40);
  result = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (result != v2)
  {
    objc_msgSend((id)objc_msgSend(result, "purchaseManager"), "setDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:", 0);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(id *)(a1 + 40);
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "purchaseManager"), "setDelegate:", *(_QWORD *)(a1 + 32));
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
  }
  return result;
}

- (void)setIgnoresExpectedClientsProtocol:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SUClientController_setIgnoresExpectedClientsProtocol___block_invoke;
  v4[3] = &unk_24DE7C2C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __56__SUClientController_setIgnoresExpectedClientsProtocol___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_setIgnoresExpectedClientsProtocol:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setOfferedAssetTypes:(__CFArray *)a3
{
  __CFArray *offeredAssetTypes;

  offeredAssetTypes = self->_offeredAssetTypes;
  if (offeredAssetTypes != a3)
  {
    if (offeredAssetTypes)
      CFRelease(offeredAssetTypes);
    self->_offeredAssetTypes = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)setURLBagKey:(id)a3 forIdentifier:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUClientController_setURLBagKey_forIdentifier___block_invoke;
  block[3] = &unk_24DE7B6E8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SUClientController_setURLBagKey_forIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setURLBagKey:forIdentifier:", a1[5], a1[6]);
}

- (id)URLBagKeyForIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__42;
  v11 = __Block_byref_object_dispose__42;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUClientController_URLBagKeyForIdentifier___block_invoke;
  block[3] = &unk_24DE7C5A8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __45__SUClientController_URLBagKeyForIdentifier___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 16), "URLBagKeyForIdentifier:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)autosaveMessageWithCompletionBlock:(id)a3
{
  MFMailComposeViewController *mailComposeViewController;
  _QWORD v4[5];

  mailComposeViewController = self->_mailComposeViewController;
  if (mailComposeViewController)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __57__SUClientController_autosaveMessageWithCompletionBlock___block_invoke;
    v4[3] = &unk_24DE7DC48;
    v4[4] = a3;
    -[MFMailComposeViewController autosaveWithHandler:](mailComposeViewController, "autosaveWithHandler:", v4);
  }
  else if (a3)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __57__SUClientController_autosaveMessageWithCompletionBlock___block_invoke(uint64_t a1, const void *a2)
{
  const __CFString *v3;
  uint64_t result;

  v3 = (const __CFString *)*MEMORY[0x24BDBD580];
  CFPreferencesSetAppValue(CFSTR("SUAutosavedMessageID"), a2, (CFStringRef)*MEMORY[0x24BDBD580]);
  CFPreferencesAppSynchronize(v3);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)composeEmailByRestoringAutosavedMessage
{
  const __CFString *v3;
  CFPropertyListRef v4;
  objc_class *v5;
  MFMailComposeViewController *v6;
  id v7;

  v3 = (const __CFString *)*MEMORY[0x24BDBD580];
  v4 = CFPreferencesCopyAppValue(CFSTR("SUAutosavedMessageID"), (CFStringRef)*MEMORY[0x24BDBD580]);
  if (v4)
  {
    v7 = (id)v4;
    if (CPCanSendMail() && !-[SUClientController isComposingEmail](self, "isComposingEmail"))
    {
      v5 = (objc_class *)ISWeakLinkedClassForString();
      if (-[objc_class hasAutosavedMessageWithIdentifier:](v5, "hasAutosavedMessageWithIdentifier:", v7))
      {
        v6 = (MFMailComposeViewController *)objc_alloc_init(v5);
        self->_mailComposeViewController = v6;
        -[MFMailComposeViewController setKeyboardVisible:](v6, "setKeyboardVisible:", 1);
        -[MFMailComposeViewController setMailComposeDelegate:](self->_mailComposeViewController, "setMailComposeDelegate:", self);
        -[MFMailComposeViewController recoverAutosavedMessageWithIdentifier:](self->_mailComposeViewController, "recoverAutosavedMessageWithIdentifier:", v7);
        -[SUClientController presentMailComposeViewController:animated:](self, "presentMailComposeViewController:animated:", self->_mailComposeViewController, 0);
      }
      CFPreferencesSetAppValue(CFSTR("SUAutosavedMessageID"), 0, v3);
      CFPreferencesAppSynchronize(v3);
    }

  }
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  -[SUClientController composeEmailWithSubject:body:animated:](self, "composeEmailWithSubject:body:animated:", a3, a4, 1);
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  MFMailComposeViewController *v9;

  v5 = a5;
  if (CPCanSendMail())
  {
    if (!-[SUClientController isComposingEmail](self, "isComposingEmail"))
    {
      v9 = (MFMailComposeViewController *)objc_alloc_init((Class)ISWeakLinkedClassForString());
      self->_mailComposeViewController = v9;
      -[MFMailComposeViewController setKeyboardVisible:](v9, "setKeyboardVisible:", 1);
      -[MFMailComposeViewController setMailComposeDelegate:](self->_mailComposeViewController, "setMailComposeDelegate:", self);
      -[MFMailComposeViewController setSubject:](self->_mailComposeViewController, "setSubject:", a3);
      -[MFMailComposeViewController setMessageBody:isHTML:](self->_mailComposeViewController, "setMessageBody:isHTML:", a4, 1);
      -[SUClientController presentMailComposeViewController:animated:](self, "presentMailComposeViewController:animated:", self->_mailComposeViewController, v5);
    }
  }
}

- (void)dismissMailComposeViewControllerAnimated:(BOOL)a3
{
  -[UIViewController dismissViewControllerAnimated:completion:](-[SUClientController rootViewController](self, "rootViewController"), "dismissViewControllerAnimated:completion:", a3, 0);
}

- (BOOL)isComposingEmail
{
  return self->_mailComposeViewController != 0;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[SUClientController dismissMailComposeViewControllerAnimated:](self, "dismissMailComposeViewControllerAnimated:", 1, a4, a5);
  -[MFMailComposeViewController setDelegate:](self->_mailComposeViewController, "setDelegate:", 0);

  self->_mailComposeViewController = 0;
}

- (void)presentMailComposeViewController:(id)a3 animated:(BOOL)a4
{
  -[UIViewController presentViewController:animated:completion:](-[SUClientController rootViewController](self, "rootViewController"), "presentViewController:animated:completion:", a3, a4, 0);
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

- (ISURLOperationPool)imageOperationPool
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

- (BOOL)performActionForDialog:(id)a3 button:(id)a4
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
        v11 = -[SUClientController _newAccountViewControllerForButtonAction:](self, "_newAccountViewControllerForButtonAction:", a4);
        v12 = -[SUClientController presentAccountViewController:animated:](self, "presentAccountViewController:animated:", v11, 1);
        goto LABEL_13;
      }
      -[SUClientController openClientURL:](self, "openClientURL:", v9);
      goto LABEL_18;
    case 3:
      v13 = objc_alloc_init(MEMORY[0x24BEB1F78]);
      objc_msgSend(v13, "setBuyParameters:", objc_msgSend(a4, "parameter"));
      v14 = -[SUClientInterface purchaseManager](-[SUClientController clientInterface](self, "clientInterface"), "purchaseManager");
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
      result = -[SUClientController openURL:](self, "openURL:", v16);
      break;
    case 5:
      result = -[SUClientController dismissTopViewControllerAnimated:](self, "dismissTopViewControllerAnimated:", 1);
      break;
    case 8:
      v11 = -[SUClientController _newComposeReviewViewControllerForButtonAction:](self, "_newComposeReviewViewControllerForButtonAction:", a4);
      v12 = -[SUClientController composeReviewWithViewController:animated:](self, "composeReviewWithViewController:animated:", v11, 1);
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

- (NSString)storeContentLanguage
{
  NSString *result;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSString *v8;

  result = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "storeFrontIdentifier");
  if (result)
  {
    v3 = result;
    v4 = -[NSString rangeOfString:options:range:](result, "rangeOfString:options:range:", CFSTR("-"), 0, 0, -[NSString length](result, "length"));
    v5 = -[NSString rangeOfString:options:range:](v3, "rangeOfString:options:range:", CFSTR(","), 0, 0, -[NSString length](v3, "length"));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_6:
        v6 = objc_alloc(MEMORY[0x24BDBCE70]);
        v7 = (void *)objc_msgSend(v6, "initWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("StoreFrontLanguages"), CFSTR("plist")));
        v8 = (NSString *)(id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v3), "objectForKey:", CFSTR("LanguageCode"));

        return v8;
      }
      v4 = v5;
    }
    v3 = -[NSString substringToIndex:](v3, "substringToIndex:", v4);
    goto LABEL_6;
  }
  return result;
}

- (BOOL)storeFrontDidChangeSinceLastSuspend
{
  NSObject *dispatchQueue;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__42;
  v21 = __Block_byref_object_dispose__42;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__42;
  v15 = __Block_byref_object_dispose__42;
  v16 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUClientController_storeFrontDidChangeSinceLastSuspend__block_invoke;
  block[3] = &unk_24DE7DC70;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(dispatchQueue, block);
  if (!v18[5] && !v12[5])
    goto LABEL_8;
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  objc_msgSend(v3, "reloadStoreFrontIdentifier");
  v4 = objc_msgSend(v3, "storeFrontIdentifier");
  v5 = (void *)v18[5];
  if (v5 != (void *)v4 && !objc_msgSend(v5, "isEqualToString:"))
  {
    LOBYTE(v8) = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "isStoreFrontIdentifierTransient")
    && (v6 = objc_msgSend(v3, "synchedStoreFrontIdentifier"), v7 = (void *)v12[5], v7 != (void *)v6))
  {
    v8 = objc_msgSend(v7, "isEqualToString:") ^ 1;
  }
  else
  {
LABEL_8:
    LOBYTE(v8) = 0;
  }
LABEL_10:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

id __57__SUClientController_storeFrontDidChangeSinceLastSuspend__block_invoke(_QWORD *a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)objc_msgSend(*(id *)(a1[4] + 48), "copy");
  result = (id)objc_msgSend(*(id *)(a1[4] + 96), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (SUClientController)initWithClientIdentifier:(id)a3
{
  SUClientInterface *v5;
  SUClientController *v6;

  v5 = objc_alloc_init(SUClientInterface);
  -[SUClientInterface setClientIdentifier:](v5, "setClientIdentifier:", a3);
  v6 = -[SUClientController initWithClientInterface:](self, "initWithClientInterface:", v5);

  return v6;
}

- (id)clientIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__42;
  v10 = __Block_byref_object_dispose__42;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SUClientController_clientIdentifier__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__SUClientController_clientIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setUserAgent:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SUClientController_setUserAgent___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __35__SUClientController_setUserAgent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUserAgent:", *(_QWORD *)(a1 + 40));
}

- (void)setViewControllerFactory:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__SUClientController_setViewControllerFactory___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SUClientController_setViewControllerFactory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setViewControllerFactory:", *(_QWORD *)(a1 + 40));
}

- (id)userAgent
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__42;
  v10 = __Block_byref_object_dispose__42;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SUClientController_userAgent__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __31__SUClientController_userAgent__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "userAgent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)viewControllerFactory
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__42;
  v10 = __Block_byref_object_dispose__42;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SUClientController_viewControllerFactory__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__SUClientController_viewControllerFactory__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "viewControllerFactory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)clientInterface:(id)a3 exitStoreWithReason:(int64_t)a4
{
  -[SUClientController exitStoreWithReason:](self, "exitStoreWithReason:", a4);
}

- (void)clientInterface:(id)a3 presentDialog:(id)a4
{
  -[SUClientController _presentDialog:](self, "_presentDialog:", a4);
}

- (void)clientInterface:(id)a3 setStatusBarHidden:(BOOL)a4 withAnimation:(int64_t)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "setStatusBarHidden:withAnimation:", a4, a5);
}

- (void)clientInterface:(id)a3 setStatusBarStyle:(int64_t)a4 animated:(BOOL)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "setStatusBarStyle:animated:", a4, a5);
}

- (id)scriptInterfaceForClientInterface:(id)a3
{
  return -[SUClientController newScriptInterface](self, "newScriptInterface", a3);
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = *MEMORY[0x24BDF7608];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke;
  v9[3] = &unk_24DE7AF68;
  v9[4] = &v10;
  v6 = objc_msgSend(v4, "beginBackgroundTaskWithExpirationHandler:", v9);
  v11[3] = v6;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke_2;
  block[3] = &unk_24DE7BE08;
  block[4] = self;
  block[5] = &v10;
  dispatch_async(global_queue, block);
  _Block_object_dispose(&v10, 8);
}

uint64_t __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BDF7608];
  return result;
}

uint64_t __65__SUClientController__applicationDidEnterBackgroundNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  int *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (v4)
  {
    v11 = 138412290;
    v12 = objc_opt_class();
    LODWORD(v10) = 12;
    v9 = &v11;
    v5 = _os_log_send_and_compose_impl();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, &v11, v10);
      free(v6);
      v9 = (int *)v7;
      SSFileLog();
    }
  }
  objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache", v9);
  ISURLCacheSaveMemoryCache();
  objc_msgSend(*(id *)(a1 + 32), "_purgeCaches");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *MEMORY[0x24BDF7608];
  return result;
}

- (void)_dialogNotification:(id)a3
{
  uint64_t v4;
  _QWORD v5[6];

  v4 = objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __42__SUClientController__dialogNotification___block_invoke;
    v5[3] = &unk_24DE7AFB8;
    v5[4] = self;
    v5[5] = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

uint64_t __42__SUClientController__dialogNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentDialog:", *(_QWORD *)(a1 + 40));
}

- (void)bagDidLoadNotification:(id)a3
{
  -[SUClientController _reloadOverlayConfigurationsFromURLBag](self, "_reloadOverlayConfigurationsFromURLBag", a3);
  -[SUClientController _reloadScriptExecutionContextFromURLBag](self, "_reloadScriptExecutionContextFromURLBag");
  -[SUClientController _reloadUserDefaultsFromURLBag](self, "_reloadUserDefaultsFromURLBag");
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
  -[SUClientController _purgeCaches](self, "_purgeCaches", v10);
}

- (id)_newAccountViewControllerForButtonAction:(id)a3
{
  SUAccountViewController *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(SUAccountViewController);
  -[SUViewController setClientInterface:](v5, "setClientInterface:", -[SUClientController clientInterface](self, "clientInterface"));
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
  v5 = -[SUClientController clientInterface](self, "clientInterface");
  v6 = -[SUViewControllerFactory newComposeReviewViewControllerWithCompositionURL:](-[SUClientInterface viewControllerFactory](v5, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", v4);
  if (!v6)
    v6 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", v4);
  -[SUViewController setClientInterface:](v6, "setClientInterface:", v5);
  return v6;
}

- (void)_presentDialog:(id)a3
{
  SUDialogManager *v5;
  _QWORD v6[6];

  v5 = +[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__SUClientController__presentDialog___block_invoke;
  v6[3] = &unk_24DE7B988;
  v6[4] = a3;
  v6[5] = self;
  -[SUDialogManager presentDialog:withCompletionBlock:](v5, "presentDialog:withCompletionBlock:", a3, v6);
}

void *__37__SUClientController__presentDialog___block_invoke(uint64_t a1, unint64_t a2)
{
  void *result;
  void *v5;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "buttons");
  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = result;
    result = (void *)objc_msgSend(result, "count");
    if ((unint64_t)result > a2)
      return (void *)objc_msgSend(*(id *)(a1 + 40), "performActionForDialog:button:", *(_QWORD *)(a1 + 32), objc_msgSend(v5, "objectAtIndex:", a2));
  }
  return result;
}

- (void)_purgeCaches
{
  objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache");
  ISURLCachePurgeMemoryCache();
  -[SUImageCache removeAllCachedImages](self->_imageCache, "removeAllCachedImages");
}

- (void)_reloadOverlayConfigurationsFromURLBag
{
  uint64_t v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  SUOverlayConfiguration *v10;
  SUOverlayConfiguration *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1
    && (v3 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0),
        v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v3), "valueForKey:", CFSTR("p2-overlay-actions")), objc_msgSend(v4, "count")))
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = -[SUOverlayConfiguration initWithDictionary:]([SUOverlayConfiguration alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          if (v10)
          {
            v11 = v10;
            -[NSArray addObject:](v5, "addObject:", v10);

          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }

  self->_overlayConfigurations = v5;
}

- (void)_reloadScriptExecutionContextFromURLBag
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = -[SUClientController clientIdentifier](self, "clientIdentifier");
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
          -[SUScriptExecutionContext evaluateScriptAtURL:](-[SUClientController scriptExecutionContext](self, "scriptExecutionContext"), "evaluateScriptAtURL:", v8);

        }
      }
    }
  }
}

- (void)_reloadUserDefaultsFromURLBag
{
  uint64_t v2;
  uint64_t v3;
  CFPropertyListRef *v4;

  v2 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v2), "valueForKey:", CFSTR("p2-more-like-this"));
  v4 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!v3)
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("ISGeniusLookupAvailable"), *v4, CFSTR("com.apple.mobileipod"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setImageOperationPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
