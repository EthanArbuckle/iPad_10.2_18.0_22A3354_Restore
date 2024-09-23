@implementation SUClientDispatch

+ (id)clientInterface
{
  id v2;

  v2 = (id)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v2 = +[SUClient sharedClient](SUClient, "sharedClient");
    if (!v2)
      v2 = +[SUClientController sharedController](SUClientController, "sharedController");
  }
  return (id)objc_msgSend(v2, "clientInterface");
}

+ (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  SUStoreController *v6;

  v6 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v6 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
    if (!v6)
      v6 = +[SUClientController sharedController](SUClientController, "sharedController");
  }
  -[SUStoreController composeEmailWithSubject:body:](v6, "composeEmailWithSubject:body:", a3, a4);
}

+ (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v6 = +[SUClient sharedClient](SUClient, "sharedClient");
    if (!v6)
      v6 = +[SUClientController sharedController](SUClientController, "sharedController");
  }
  return objc_msgSend(v6, "composeReviewWithViewController:animated:", a3, v4);
}

+ (void)dismissOverlayBackgroundViewController
{
  SUStoreController *v2;

  v2 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v2 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
    if (!v2)
      v2 = +[SUClientController sharedController](SUClientController, "sharedController");
  }
  -[SUStoreController dismissOverlayBackgroundViewController](v2, "dismissOverlayBackgroundViewController");
}

+ (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)__LegacyBridge;
  if (__LegacyBridge)
    return objc_msgSend(v6, "enterAccountFlowWithViewController:animated:", a3, v4);
  v6 = +[SUClient sharedClient](SUClient, "sharedClient");
  if (v6)
    return objc_msgSend(v6, "enterAccountFlowWithViewController:animated:", a3, v4);
  else
    return objc_msgSend(+[SUClientController sharedController](SUClientController, "sharedController"), "presentAccountViewController:animated:", a3, v4);
}

+ (id)exitStoreButtonTitle
{
  id v2;

  if (__LegacyBridge)
    return 0;
  v2 = +[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  else
    return (id)objc_msgSend(v2, "exitStoreButtonTitle");
}

+ (BOOL)hidePreviewOverlayAnimated:(BOOL)a3
{
  uint64_t v3;

  v3 = __LegacyBridge;
  if (__LegacyBridge)
    objc_msgSend((id)__LegacyBridge, "hidePreviewOverlayAnimated:", a3);
  return v3 != 0;
}

+ (id)imageCache
{
  id v2;

  v2 = +[SUClient sharedClient](SUClient, "sharedClient");
  if (!v2)
    v2 = +[SUClientController sharedController](SUClientController, "sharedController");
  return (id)objc_msgSend(v2, "imageCache");
}

+ (id)imagePool
{
  id v2;

  v2 = +[SUClient sharedClient](SUClient, "sharedClient");
  if (v2)
    return (id)objc_msgSend(v2, "imagePool");
  else
    return (id)objc_msgSend(+[SUClientController sharedController](SUClientController, "sharedController"), "imageOperationPool");
}

+ (BOOL)isTabBarControllerLoaded
{
  SUStoreController *v3;
  SUStoreController *v4;

  if (__LegacyBridge)
    return 1;
  v3 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
  if (v3)
    return -[SUStoreController isTabBarControllerLoaded](v3, "isTabBarControllerLoaded");
  v4 = +[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;
    return -[SUStoreController isTabBarControllerLoaded](v3, "isTabBarControllerLoaded");
  }
  return 0;
}

+ (BOOL)matchesClientApplication:(id)a3
{
  id v4;
  SUStoreController *v6;

  if (__LegacyBridge)
  {
    v4 = (id)objc_msgSend((id)__LegacyBridge, "clientInterface");
    return objc_msgSend((id)objc_msgSend(v4, "clientIdentifier"), "isEqualToString:", a3);
  }
  v6 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
  if (!v6)
  {
    v4 = +[SUClientController sharedController](SUClientController, "sharedController");
    return objc_msgSend((id)objc_msgSend(v4, "clientIdentifier"), "isEqualToString:", a3);
  }
  return -[SUStoreController matchesClientApplication:](v6, "matchesClientApplication:", a3);
}

+ (id)newScriptInterface
{
  SUStoreController *v3;

  if (__LegacyBridge)
    return objc_alloc_init(SUScriptInterface);
  v3 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
  if (!v3)
    v3 = +[SUClientController sharedController](SUClientController, "sharedController");
  return -[SUStoreController newScriptInterface](v3, "newScriptInterface");
}

+ (id)overlayBackgroundViewController
{
  SUStoreController *v2;

  v2 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v2 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
    if (!v2)
      v2 = +[SUClientController sharedController](SUClientController, "sharedController");
  }
  return -[SUStoreController overlayBackgroundViewController](v2, "overlayBackgroundViewController");
}

+ (id)overlayConfigurationForStorePage:(id)a3
{
  SUStoreController *v5;

  if (__LegacyBridge)
    return 0;
  v5 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
  if (!v5)
    v5 = +[SUClientController sharedController](SUClientController, "sharedController");
  return -[SUStoreController overlayConfigurationForStorePage:](v5, "overlayConfigurationForStorePage:", a3);
}

+ (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  SUStoreController *v4;

  v4 = (SUStoreController *)__LegacyBridge;
  if (!__LegacyBridge)
  {
    v4 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
    if (!v4)
      v4 = +[SUClientController sharedController](SUClientController, "sharedController");
  }
  return -[SUStoreController presentOverlayBackgroundViewController:](v4, "presentOverlayBackgroundViewController:", a3);
}

+ (id)previewOverlayViewController
{
  return (id)objc_msgSend((id)__LegacyBridge, "previewOverlayViewController");
}

+ (id)scriptExecutionContext
{
  id v3;

  if (__LegacyBridge)
    return 0;
  v3 = +[SUClient sharedClient](SUClient, "sharedClient");
  if (!v3)
    v3 = +[SUClientController sharedController](SUClientController, "sharedController");
  return (id)objc_msgSend(v3, "scriptExecutionContext");
}

+ (BOOL)sendActionForDialog:(id)a3 button:(id)a4
{
  id v6;
  id v8;

  v6 = (id)__LegacyBridge;
  if (__LegacyBridge)
    return objc_msgSend(v6, "performActionForDialog:button:", a3, a4);
  v8 = +[SUClient sharedClient](SUClient, "sharedClient");
  if (!v8)
  {
    v6 = +[SUClientController sharedController](SUClientController, "sharedController");
    return objc_msgSend(v6, "performActionForDialog:button:", a3, a4);
  }
  return objc_msgSend(v8, "sendActionForDialog:button:", a3, a4);
}

+ (void)setClientBridge:(id)a3
{
  if ((id)__LegacyBridge != a3)
  {

    __LegacyBridge = (uint64_t)a3;
  }
}

+ (BOOL)showPreviewOverlayAnimated:(BOOL)a3
{
  uint64_t v3;

  v3 = __LegacyBridge;
  if (__LegacyBridge)
    objc_msgSend((id)__LegacyBridge, "showPreviewOverlayAnimated:", a3);
  return v3 != 0;
}

+ (id)tabBarController
{
  SUStoreController *v2;
  SUStoreController *v3;

  v2 = +[SUStoreController sharedInstance](SUStoreController, "sharedInstance");
  if (v2)
    return -[SUStoreController tabBarController](v2, "tabBarController");
  v3 = +[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v3;
    return -[SUStoreController tabBarController](v2, "tabBarController");
  }
  return 0;
}

+ (BOOL)wasLaunchedFromLibrary
{
  id v2;

  if (__LegacyBridge)
    return 0;
  v2 = +[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  else
    return objc_msgSend(v2, "wasLaunchedFromLibrary");
}

@end
