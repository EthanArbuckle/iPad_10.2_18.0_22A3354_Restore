@implementation WebAppSceneDelegate

- (void)connectWebClipIdentifier:(id)a3 toScene:(id)a4 forWebPush:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  char v12;
  WebAppViewController *v13;
  WebAppViewController *webApp;
  void *v15;
  WebAppEligibilityViewController *v16;
  WebAppEligibilityViewController *eligibilityViewController;
  _BOOL8 v18;
  UIWindow *v19;
  UIWindow *v20;
  UIWindow *v21;
  UIWindow *v22;
  UIWindow *window;
  id v24;

  v5 = a5;
  v24 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDF6FD0], "webClipWithIdentifier:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x24BDE81B8], "isHSWADisabled");
  v11 = objc_msgSend(v9, "eligibilityStatus");
  v12 = v10 ^ 1;
  if (v11)
    v12 = 0;
  self->_shouldLoadWebApp = v12;
  if ((v12 & 1) == 0)
  {
    v16 = -[WebAppEligibilityViewController initWithWebClip:scene:]([WebAppEligibilityViewController alloc], "initWithWebClip:scene:", v9, v8);
    eligibilityViewController = self->_eligibilityViewController;
    self->_eligibilityViewController = v16;

    if (v10)
      v18 = objc_msgSend(v9, "eligibilityStatus") == 0;
    else
      v18 = 0;
    -[WebAppEligibilityViewController setOverrideShowAlert:](self->_eligibilityViewController, "setOverrideShowAlert:", v18);
    v22 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FF8]), "initWithWindowScene:", v8);
    window = self->_window;
    self->_window = v22;

    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_eligibilityViewController);
    v21 = self->_window;
    goto LABEL_11;
  }
  v13 = -[WebAppViewController initWithWebClip:]([WebAppViewController alloc], "initWithWebClip:", v9);
  webApp = self->_webApp;
  self->_webApp = v13;

  +[WebAppNotificationCenterDelegate sharedDelegate](WebAppNotificationCenterDelegate, "sharedDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addWebAppViewController:", self->_webApp);

  -[WebAppViewController setWasLaunchedForWebPush:](self->_webApp, "setWasLaunchedForWebPush:", v5);
  if (!v5)
  {
    v19 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FF8]), "initWithWindowScene:", v8);
    v20 = self->_window;
    self->_window = v19;

    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_webApp);
    v21 = self->_window;
LABEL_11:
    -[UIWindow makeKeyAndVisible](v21, "makeKeyAndVisible");
    goto LABEL_12;
  }
  -[WebAppViewController processWebPushWithIdentifier:](self->_webApp, "processWebPushWithIdentifier:", v24);
LABEL_12:

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  id v19;
  id v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "URLContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  webClipIdentifierFromLaunchURL(v12, CFSTR("webapp://web-push/"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13
    || (objc_msgSend(v9, "sourceApplication"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.")),
        v14,
        (v15 & 1) == 0))
  {
    objc_msgSend(v8, "persistentIdentifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.webapp - ")))
    {
      v18 = CFSTR("com.apple.webapp - ");
    }
    else
    {
      if (!objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.webapp-")))
      {
        v19 = v17;
        goto LABEL_10;
      }
      v18 = CFSTR("com.apple.webapp-");
    }
    objc_msgSend(v17, "substringFromIndex:", -[__CFString length](v18, "length"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v20 = v19;

    v16 = 0;
    v13 = v20;
    goto LABEL_11;
  }
  v16 = 1;
LABEL_11:
  -[WebAppSceneDelegate connectWebClipIdentifier:toScene:forWebPush:](self, "connectWebClipIdentifier:toScene:forWebPush:", v13, v21, v16);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  WebAppViewController *webApp;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_shouldLoadWebApp)
  {
    objc_msgSend(v7, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    webClipIdentifierFromLaunchURL(v10, CFSTR("webapp://web-push/"));
    v11 = objc_claimAutoreleasedReturnValue();
    webApp = self->_webApp;
    if (v11)
    {
      -[WebAppViewController processWebPushWithIdentifier:](webApp, "processWebPushWithIdentifier:", v11);
    }
    else
    {
      if (webApp && !-[WebAppViewController wasLaunchedForWebPush](webApp, "wasLaunchedForWebPush"))
        goto LABEL_11;
      webClipIdentifierFromLaunchURL(v10, CFSTR("webapp:"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v11 = v13;
        -[WebAppSceneDelegate _tearDownWindowAndWebApp](self, "_tearDownWindowAndWebApp");
        -[WebAppSceneDelegate connectWebClipIdentifier:toScene:forWebPush:](self, "connectWebClipIdentifier:toScene:forWebPush:", v11, v6, 0);
      }
      else
      {
        viewServiceLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "anyObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138739971;
          v17 = v15;
          _os_log_impl(&dword_22E28F000, v11, OS_LOG_TYPE_INFO, "scene:openURLContexts: Launch URL %{sensitive}@ did not contain a web clip identifier", (uint8_t *)&v16, 0xCu);

        }
      }
    }

LABEL_11:
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_shouldLoadWebApp)
  {
    -[WebAppViewController webClip](self->_webApp, "webClip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WebAppEligibilityViewController webClip](self->_eligibilityViewController, "webClip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebAppEligibilityViewController presentAlertIfNeeded](self->_eligibilityViewController, "presentAlertIfNeeded");
  }
  v10[0] = CFSTR("url");
  objc_msgSend(v5, "pageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v10[1] = CFSTR("title");
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  v10[2] = CFSTR("identifier");
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (PLShouldLogRegisteredEvent())
    PLLogRegisteredEvent();

}

- (void)sceneDidEnterBackground:(id)a3
{
  self->_wasSuspendedUnderLock = objc_msgSend((id)*MEMORY[0x24BDF74F8], "isSuspendedUnderLock", a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  _BOOL4 sceneHasEverEnteredForeground;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  sceneHasEverEnteredForeground = self->_sceneHasEverEnteredForeground;
  self->_sceneHasEverEnteredForeground = 1;
  if (sceneHasEverEnteredForeground
    && !self->_wasSuspendedUnderLock
    && (-[WebAppViewController webClip](self->_webApp, "webClip"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "pageURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "safari_isDataURL"),
        v6,
        v5,
        v7))
  {
    -[WebAppSceneDelegate _tearDownWindowAndWebApp](self, "_tearDownWindowAndWebApp");
    objc_msgSend(v9, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebAppSceneDelegate scene:willConnectToSession:options:](self, "scene:willConnectToSession:options:", v9, v8, 0);

  }
  else
  {
    -[WebAppViewController openURLWithCustomSchemeIfNeeded](self->_webApp, "openURLWithCustomSchemeIfNeeded");
  }

}

- (void)_tearDownWindowAndWebApp
{
  UIWindow *window;
  void *v4;
  WebAppViewController *webApp;
  WebAppEligibilityViewController *eligibilityViewController;

  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  window = self->_window;
  self->_window = 0;

  +[WebAppNotificationCenterDelegate sharedDelegate](WebAppNotificationCenterDelegate, "sharedDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWebAppViewController:", self->_webApp);

  webApp = self->_webApp;
  self->_webApp = 0;

  eligibilityViewController = self->_eligibilityViewController;
  self->_eligibilityViewController = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_webApp, 0);
}

@end
