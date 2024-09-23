@implementation ACMExternalAppleConnectImpl

+ (void)initialize
{
  +[ACMLocale initResources](ACMLocale, "initResources");
  +[ACMExternalTicketManager initialize](ACMExternalTicketManager, "initialize");
}

- (ACMExternalAppleConnectImpl)initWithMasterObject:(id)a3
{
  ACMExternalAppleConnectImpl *v4;
  ACMExternalAppleConnectImpl *v5;
  double v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACMExternalAppleConnectImpl;
  v4 = -[ACMAppleConnectImpl init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ACMExternalAppleConnectImpl setMasterObject:](v4, "setMasterObject:", a3);
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACMExternalAppleConnectImpl initWithMasterObject:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 79, 0, "Creating instance...");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "systemVersion"), "doubleValue");
    if (v6 >= 4.0)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
    }
    -[ACMExternalAppleConnectImpl setAppleConnectState:](v5, "setAppleConnectState:", 0);
  }
  return v5;
}

- (ACC2SVControllerProtocol)twoSVController
{
  ACC2SVControllerProtocol *result;
  ACC2SVControllerProtocol *v4;
  id v5;

  result = self->_twoSVController;
  if (!result)
  {
    v4 = -[ACMAppleConnectImplComponents twoSVController](-[ACMExternalAppleConnectImpl components](self, "components"), "twoSVController");
    self->_twoSVController = v4;
    -[ACC2SVControllerProtocol setDelegate:](v4, "setDelegate:", self);
    -[ACC2SVControllerProtocol setSecondFactorAuthUIController:](self->_twoSVController, "setSecondFactorAuthUIController:", -[ACM2SVAuthenticationUIController initWithParentViewController:]([ACM2SVAuthenticationUIController alloc], "initWithParentViewController:", -[ACMExternalAppleConnectImpl parentViewController](self, "parentViewController")));
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setDelegate:", self);
    -[ACC2SVControllerProtocol setTransportController:](self->_twoSVController, "setTransportController:", v5);
    return self->_twoSVController;
  }
  return result;
}

- (void)dealloc
{
  float v3;
  void *v4;
  objc_super v5;

  -[ACMExternalAppleConnectImpl setMasterObject:](self, "setMasterObject:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "systemVersion"), "floatValue");
  if (v3 >= 4.0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  }
  -[ACMExternalAuthenticationController setDelegate:](-[ACMExternalAppleConnectImpl authenticationController](self, "authenticationController"), "setDelegate:", 0);
  -[ACMExternalAppleConnectImpl setAuthenticationController:](self, "setAuthenticationController:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ACMExternalAppleConnectImpl;
  -[ACMAppleConnectImpl dealloc](&v5, sel_dealloc);
}

- (ACMExternalUIControllerProtocol)uiController
{
  return -[ACMAppleConnectImplComponents uiController](-[ACMExternalAppleConnectImpl components](self, "components"), "uiController");
}

- (ACMAppleConnectImplComponents)components
{
  return (ACMAppleConnectImplComponents *)+[ACMExternalAppleConnectImplComponents components](ACMExternalAppleConnectImplComponents, "components");
}

- (ACMExternalAuthenticationController)authenticationController
{
  ACMExternalAuthenticationController *result;
  ACMExternalAuthenticationController *v4;

  result = self->_authenticationController;
  if (!result)
  {
    v4 = (ACMExternalAuthenticationController *)objc_opt_new();
    self->_authenticationController = v4;
    -[ACMExternalAuthenticationController setDelegate:](v4, "setDelegate:", self);
    return self->_authenticationController;
  }
  return result;
}

- (BOOL)isWidgetShown
{
  int v3;

  v3 = -[ACMAppleConnectImplComponents uiControllerLoaded](-[ACMExternalAppleConnectImpl components](self, "components"), "uiControllerLoaded");
  if (v3)
    LOBYTE(v3) = -[ACMExternalUIControllerProtocol isWidgetShown](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "isWidgetShown");
  return v3;
}

- (void)setDelegate:(id)a3
{
  if (a3 && !objc_msgSend(a3, "conformsToProtocol:", &unk_255E1CA10))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidDelegateException"), CFSTR("Delegate does not conform to ACMExternalAppleConnectDelegate protocol"), 0));
  self->_delegate = (ACMExternalAppleConnectDelegate *)a3;
}

- (BOOL)signInAnimated
{
  -[ACMExternalAppleConnectImpl delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[ACMExternalAppleConnectDelegate appleConnectSignInAnimated:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectSignInAnimated:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
  else
    return 1;
}

- (id)parentViewController
{
  return (id)-[ACMExternalAppleConnectDelegate appleConnectParentViewController:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectParentViewController:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
}

- (id)hideAppleConnectSignInDialog
{
  void *v4;
  void *v5;
  id v6;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl hideAppleConnectSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 173, 0, "Client application tries hide AppleConnect SignIn dialog manually");
  if (-[ACMExternalAppleConnectImpl appleConnectState](self, "appleConnectState") == 1)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl hideAppleConnectSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 177, 0, "AppleConnect in proper state and will hide  SignIn dialog manually");
    }
    -[ACMExternalAppleConnectImpl hideSignIn](self, "hideSignIn");
    -[ACMExternalAppleConnectImpl setAppleConnectState:](self, "setAppleConnectState:", 0);
    return 0;
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl hideAppleConnectSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 183, 0, "AppleConnect is not in proper state. SignIn dialog won't be hidden manually. Returning error!");
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Improper call of the method. AppleConnect SignIn dialog cannot be hidden."));
    return (id)objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -600181, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x24BDD0FD8], 0));
  }
}

- (void)showSignInWithRequest:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  ACMExternalUIControllerProtocol *v8;
  id v9;
  _BOOL8 v10;
  _QWORD v11[5];

  if (-[ACMExternalAppleConnectImpl appleConnectState](self, "appleConnectState") == 1
    && -[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown"))
  {
    -[ACMExternalUIControllerProtocol setWidgetEnabled:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setWidgetEnabled:", 1);
    -[ACMExternalAppleConnectImpl setAppleConnectState:](self, "setAppleConnectState:", 0);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl showSignInWithRequest:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 198, 0, "AppleConnect will show SignIn dialog and inform delegate");
    -[ACMExternalAppleConnectImpl delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ACMExternalAppleConnectDelegate appleConnectWillShowSignInDialog:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectWillShowSignInDialog:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
    -[ACMExternalAppleConnectImpl setCurrentRequest:](self, "setCurrentRequest:", a3);
    -[ACMExternalUIControllerProtocol setRequest:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setRequest:", -[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest"));
    if ((objc_msgSend(a3, "useAlertView") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[ACMExternalAppleConnectImpl delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[ACMExternalAppleConnectDelegate appleConnectUseCustomAppearance:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectUseCustomAppearance:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")))
      {
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[ACMExternalAppleConnectDelegate appleConnectWidgetPosition:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectWidgetPosition:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
          -[ACMExternalUIControllerProtocol setWidgetPosition:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setWidgetPosition:", v6, v7);
        }
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ACMExternalUIControllerProtocol setWidgetAccountLabel:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setWidgetAccountLabel:", -[ACMExternalAppleConnectDelegate appleConnectAccountLabel:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectAccountLabel:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ACMExternalUIControllerProtocol setWidgetPasswordReturnKeyType:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setWidgetPasswordReturnKeyType:", -[ACMExternalAppleConnectDelegate appleConnectPasswordFieldsReturnKeyType:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectPasswordFieldsReturnKeyType:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[ACMExternalUIControllerProtocol setSignInButton:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setSignInButton:", -[ACMExternalAppleConnectDelegate appleConnectSignInButton:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectSignInButton:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
          -[ACMExternalAppleConnectImpl delegate](self, "delegate");
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[ACMExternalUIControllerProtocol setShouldAuthenticateOnUserInput:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setShouldAuthenticateOnUserInput:", -[ACMExternalAppleConnectDelegate appleConnectShouldAuthenticateOnUserInput:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectShouldAuthenticateOnUserInput:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        }
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ACMExternalUIControllerProtocol setCancelButton:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setCancelButton:", -[ACMExternalAppleConnectDelegate appleConnectCancelButton:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectCancelButton:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        v5 = 2;
      }
      else
      {
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ACMExternalUIControllerProtocol setLogoImage:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setLogoImage:", -[ACMExternalAppleConnectDelegate appleConnectStandardLogoImage:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectStandardLogoImage:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ACMExternalUIControllerProtocol setBackgroundColor:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setBackgroundColor:", -[ACMExternalAppleConnectDelegate appleConnectStandardBackgroundColor:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectStandardBackgroundColor:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        -[ACMExternalAppleConnectImpl delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ACMExternalUIControllerProtocol setAccountNameFieldPlaceholder:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setAccountNameFieldPlaceholder:", -[ACMExternalAppleConnectDelegate appleConnectStandardAccountNameFieldPlaceholder:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectStandardAccountNameFieldPlaceholder:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")));
        v5 = 1;
      }
    }
    -[ACMExternalUIControllerProtocol setSignInStyle:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setSignInStyle:", v5);
    v8 = -[ACMExternalAppleConnectImpl uiController](self, "uiController");
    v9 = -[ACMExternalAppleConnectImpl parentViewController](self, "parentViewController");
    v10 = -[ACMExternalAppleConnectImpl signInAnimated](self, "signInAnimated");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__ACMExternalAppleConnectImpl_showSignInWithRequest___block_invoke;
    v11[3] = &unk_24FCE4FA8;
    v11[4] = self;
    -[ACMExternalUIControllerProtocol showSignInWidgetWithParentViewController:animated:completion:](v8, "showSignInWidgetWithParentViewController:animated:completion:", v9, v10, v11);
  }
}

uint64_t __53__ACMExternalAppleConnectImpl_showSignInWithRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl showSignInWithRequest:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 261, 0, "AppleConnect has shown SignIn dialog and would inform delegate");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "appleConnectDidShowSignInDialog:", objc_msgSend(*(id *)(a1 + 32), "masterObject"));
  return result;
}

- (void)hideSignIn
{
  ACMExternalUIControllerProtocol *v3;
  id v4;
  _BOOL8 v5;
  _QWORD v6[5];

  if (-[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown"))
  {
    -[ACMExternalAppleConnectImpl signInDialogWillHide](self, "signInDialogWillHide");
    v3 = -[ACMExternalAppleConnectImpl uiController](self, "uiController");
    v4 = -[ACMExternalAppleConnectImpl parentViewController](self, "parentViewController");
    v5 = -[ACMExternalAppleConnectImpl signInAnimated](self, "signInAnimated");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__ACMExternalAppleConnectImpl_hideSignIn__block_invoke;
    v6[3] = &unk_24FCE4FA8;
    v6[4] = self;
    -[ACMExternalUIControllerProtocol hideSignInWidgetWithParentViewController:animated:completion:](v3, "hideSignInWidgetWithParentViewController:animated:completion:", v4, v5, v6);
  }
}

uint64_t __41__ACMExternalAppleConnectImpl_hideSignIn__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "unloadUIController");
  return objc_msgSend(*(id *)(a1 + 32), "signInDialogDidHide");
}

- (void)authenticateRunningOnMainThreadWithRequest:(id)a3
{
  id v5;
  id v6;
  char v7;
  ACMExternalAuthenticationController *v8;
  _QWORD v9[7];
  char v10;

  v5 = (id)objc_msgSend(a3, "copy");
  if (objc_msgSend((id)objc_msgSend(v5, "realm"), "length")
    && objc_msgSend((id)objc_msgSend(v5, "appID"), "unsignedLongLongValue")
    && objc_msgSend((id)objc_msgSend(v5, "appIDKey"), "length")
    || (v6 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Invalid Parameters. Some of input parameters are set incorrectly."))) == 0)
  {
    -[ACMExternalAppleConnectImpl delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[ACMExternalAppleConnectDelegate appleConnectUseCustomAppearance:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectUseCustomAppearance:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject")))
    {
      -[ACMExternalAppleConnectImpl showSignInWithRequest:](self, "showSignInWithRequest:", a3);
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    v8 = -[ACMExternalAppleConnectImpl authenticationController](self, "authenticationController");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__ACMExternalAppleConnectImpl_authenticateRunningOnMainThreadWithRequest___block_invoke;
    v9[3] = &unk_24FCE4FF8;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = v5;
    v10 = v7;
    -[ACMExternalAuthenticationController evaluateSSOWithRequest:completion:](v8, "evaluateSSOWithRequest:completion:", v5, v9);
  }
  else
  {
    -[ACMExternalAppleConnectImpl returnError:withSelector:withResponseClass:](self, "returnError:withSelector:withResponseClass:", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200190, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD0FC8])), sel_appleConnect_authenticationDidEndWithResponse_, objc_opt_class());
  }
}

uint64_t __74__ACMExternalAppleConnectImpl_authenticateRunningOnMainThreadWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  id v7;
  uint64_t result;

  if (a2 || !a3)
  {
    if (objc_msgSend(a2, "code") == -200050)
    {
      return objc_msgSend(*(id *)(a1 + 32), "reportError:", a2);
    }
    else
    {
      result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "userName"), "length");
      if (a3)
      {
        if (!result)
        {
          result = objc_msgSend(*(id *)(a1 + 48), "useAlertView");
          if ((result & 1) == 0)
            result = objc_msgSend(*(id *)(a1 + 40), "setUserName:", objc_msgSend((id)objc_msgSend(a3, "principal"), "userName"));
        }
      }
      if (!*(_BYTE *)(a1 + 56))
        return objc_msgSend(*(id *)(a1 + 32), "showSignInWithRequest:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", *(_QWORD *)(a1 + 48), a3);
    v7 = +[ACMAuthenticationResponseImpl authenticationResponse](ACMAuthenticationResponseImpl, "authenticationResponse");
    objc_msgSend(v7, "setToken:", v6);
    objc_msgSend(v7, "setUserName:", objc_msgSend((id)objc_msgSend(a3, "principal"), "userName"));
    objc_msgSend(v7, "setGeneratedWithTouchID:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "returnResponse:withSelector:", v7, sel_appleConnect_authenticationDidEndWithResponse_);
  }
  return result;
}

- (void)authenticateWithRequest:(id)a3 password:(id)a4
{
  ACMExternalAuthenticationController *v7;
  _QWORD v8[6];

  objc_msgSend(a3, "setUserName:", objc_msgSend((id)objc_msgSend(a3, "userName"), "lowercaseString"));
  v7 = -[ACMExternalAppleConnectImpl authenticationController](self, "authenticationController");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__ACMExternalAppleConnectImpl_authenticateWithRequest_password___block_invoke;
  v8[3] = &unk_24FCE5020;
  v8[4] = self;
  v8[5] = a3;
  -[ACMExternalAuthenticationController authenticateWithRequest:password:completion:](v7, "authenticateWithRequest:password:completion:", a3, a4, v8);
}

uint64_t __64__ACMExternalAppleConnectImpl_authenticateWithRequest_password___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;

  v3 = result;
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "reportError:", a2);
  if (a3)
  {
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "components"), "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", *(_QWORD *)(result + 40), a3);
    v6 = +[ACMAuthenticationResponseImpl authenticationResponse](ACMAuthenticationResponseImpl, "authenticationResponse");
    objc_msgSend(v6, "setToken:", v5);
    objc_msgSend(v6, "setUserName:", objc_msgSend((id)objc_msgSend(a3, "principal"), "userName"));
    return objc_msgSend(*(id *)(v3 + 32), "returnResponse:withSelector:", v6, sel_appleConnect_authenticationDidEndWithResponse_);
  }
  return result;
}

- (void)verifyServiceTicket:(id)a3
{
  void *v5;
  ACMExternalAuthenticationController *v6;
  _QWORD v7[5];

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl verifyServiceTicket:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 366, 0, "Verifying service ticket...");
  v5 = (void *)objc_opt_new();
  v6 = -[ACMExternalAppleConnectImpl authenticationController](self, "authenticationController");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__ACMExternalAppleConnectImpl_verifyServiceTicket___block_invoke;
  v7[3] = &unk_24FCE5048;
  v7[4] = self;
  -[ACMExternalAuthenticationController verifyServiceTicketWithRequest:completion:](v6, "verifyServiceTicketWithRequest:completion:", a3, v7);
  objc_msgSend(v5, "drain");
}

uint64_t __51__ACMExternalAppleConnectImpl_verifyServiceTicket___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "returnError:withSelector:withResponseClass:", a2, sel_appleConnect_ticketVerificationDidEndWithResponse_, objc_opt_class());
  else
    return objc_msgSend(*(id *)(a1 + 32), "returnResponse:withSelector:", a3, sel_appleConnect_ticketVerificationDidEndWithResponse_);
}

- (int64_t)logLevel
{
  return -[ACMAppleConnectPreferences logLevel](-[ACMAppleConnectImplComponents preferences](-[ACMExternalAppleConnectImpl components](self, "components"), "preferences"), "logLevel");
}

- (void)setLogLevel:(int64_t)a3
{
  -[ACMAppleConnectPreferences setLogLevel:](-[ACMAppleConnectImplComponents preferences](-[ACMExternalAppleConnectImpl components](self, "components"), "preferences"), "setLogLevel:", a3);
}

- (BOOL)shouldReleaseOnMemoryWarning
{
  return 0;
}

- (void)cancelRequests
{
  void *v3;
  _QWORD v4[5];

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl cancelRequests]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 414, 0, "Sign in cancelled");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "postNotification:", objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("CancelRequests"), self));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__ACMExternalAppleConnectImpl_cancelRequests__block_invoke;
  v4[3] = &unk_24FCE4FA8;
  v4[4] = self;
  if (-[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown"))
  {
    -[ACMExternalUIControllerProtocol cancelSignInWidget](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "cancelSignInWidget");
    -[ACMExternalAppleConnectImpl setAppleConnectState:](self, "setAppleConnectState:", 0);
    -[ACC2SVControllerProtocol cancelWithCompletion:](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "cancelWithCompletion:", v4);
  }
  else
  {
    __45__ACMExternalAppleConnectImpl_cancelRequests__block_invoke((uint64_t)v4);
  }
}

uint64_t __45__ACMExternalAppleConnectImpl_cancelRequests__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Authentication was canceled by application"));
  return objc_msgSend(v1, "returnError:withSelector:withResponseClass:", objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200060, objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, *MEMORY[0x24BDD0FC8])), sel_appleConnect_authenticationDidEndWithResponse_, objc_opt_class());
}

- (void)reportError:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl reportError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 438, 0, "Reporting about error %@", a3);
  v5 = objc_msgSend(a3, "code");
  if (!a3)
    goto LABEL_15;
  v6 = v5;
  if (!-[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown"))
  {
    if (v6 == -200200)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = *MEMORY[0x24BDD1398];
      v13 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
      a3 = (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", a3, v12, v13, *MEMORY[0x24BDD0FC8], 0));
    }
LABEL_15:
    v14 = +[ACMAuthenticationResponseImpl authenticationResponse](ACMAuthenticationResponseImpl, "authenticationResponse");
    objc_msgSend(v14, "setError:", a3);
    -[ACMExternalAppleConnectImpl returnResponse:withSelector:](self, "returnResponse:withSelector:", v14, sel_appleConnect_authenticationDidEndWithResponse_);
    return;
  }
  v7 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("OK"));
  if (v6 <= -100401)
  {
    if (v6 > -200061)
    {
      if (v6 == -200060)
        goto LABEL_25;
      v15 = -3442;
    }
    else
    {
      if (v6 == -200210)
        goto LABEL_21;
      v15 = -3582;
    }
    if (v6 != (v15 & 0xFFFFFFFF0000FFFFLL | 0xFFFC0000))
      goto LABEL_26;
LABEL_25:
    -[ACMExternalAppleConnectImpl returnError:withSelector:withResponseClass:](self, "returnError:withSelector:withResponseClass:", a3, sel_appleConnect_authenticationDidEndWithResponse_, objc_opt_class());
    return;
  }
  if (v6 > -100119)
  {
    if (v6 == -100118 || v6 == -100102 || v6 == -100104)
    {
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_msgSend(a3, "localizedDescription"));
      v7 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("iForgot…"));
      v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("OK"));
      v6 = -100102;
      if (!v8)
        return;
LABEL_28:
      -[ACMExternalUIControllerProtocol showAlertWithAlertMessage:buttonTitle:cancelButtonTitle:errorTag:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "showAlertWithAlertMessage:buttonTitle:cancelButtonTitle:errorTag:", v8, v9, v7, v6);
      return;
    }
    goto LABEL_26;
  }
  if (v6 == -100400 || v6 == -100125)
  {
LABEL_21:
    v16 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_msgSend(a3, "localizedDescription"));
    goto LABEL_27;
  }
LABEL_26:
  v16 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
LABEL_27:
  v8 = (uint64_t)v16;
  v9 = 0;
  if (v16)
    goto LABEL_28;
}

- (void)returnError:(id)a3 withSelector:(SEL)a4 withResponseClass:(Class)a5
{
  id v8;

  objc_opt_class();
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setError:", a3);
  -[ACMExternalAppleConnectImpl returnResponse:withSelector:](self, "returnResponse:withSelector:", v8, a4);
}

- (BOOL)canHideSignInDialog
{
  int v3;
  const __CFString *v4;

  if (-[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown")
    && !-[ACMMessage useAlertView](-[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest"), "useAlertView")&& (-[ACMExternalAppleConnectImpl delegate](self, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v3 = -[ACMExternalAppleConnectDelegate appleConnectCanHideSignInDialog:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectCanHideSignInDialog:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    {
      v4 = CFSTR("can not");
      if (v3)
        v4 = CFSTR("can");
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl canHideSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 509, 0, "Delegate told that SignIn dialog %@ be hidden immediately", v4);
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)returnResponse:(id)a3 withSelector:(SEL)a4
{
  _BOOL4 v7;
  BOOL v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 519, 0, "Try ask delegate for permission to hide SignIn dialog");
  if (objc_msgSend(a3, "error"))
  {
    -[ACMExternalAppleConnectImpl setAppleConnectState:](self, "setAppleConnectState:", 0);
    goto LABEL_8;
  }
  v7 = -[ACMExternalAppleConnectImpl canHideSignInDialog](self, "canHideSignInDialog");
  v8 = v7;
  -[ACMExternalAppleConnectImpl setAppleConnectState:](self, "setAppleConnectState:", !v7);
  if (v8)
  {
LABEL_8:
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 524, 0, "AppleConnect will hide SignIn dialog immediately");
    -[ACMExternalAppleConnectImpl hideSignIn](self, "hideSignIn");
    goto LABEL_12;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 529, 0, "AppleConnect will not hide SignIn dialog immediately. It would be hidden by clien application manually");
LABEL_12:
  if (self->_twoSVController)
  {
    objc_msgSend((id)-[ACC2SVControllerProtocol transportController](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "transportController"), "setDelegate:", 0);
    -[ACC2SVControllerProtocol setTransportController:](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "setTransportController:", 0);
    -[ACC2SVControllerProtocol setSecondFactorAuthUIController:](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "setSecondFactorAuthUIController:", 0);
    -[ACC2SVControllerProtocol setDelegate:](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "setDelegate:", 0);
    -[ACMExternalAppleConnectImpl setTwoSVController:](self, "setTwoSVController:", 0);
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 542, 0, "Try inform delegate about result");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 545, 0, "Inform delegate about result");
    }
    -[ACMExternalAppleConnectDelegate performSelector:withObject:withObject:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "performSelector:withObject:withObject:", a4, -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"), a3);
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown", a3))
  {
    if (-[ACMMessage automaticallyCancelWhenSwitchingToBackground](-[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest"), "automaticallyCancelWhenSwitchingToBackground"))
    {
      -[ACMExternalUIControllerProtocol cancelSignInWidget](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "cancelSignInWidget");
      -[ACC2SVControllerProtocol cancelWithCompletion:](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "cancelWithCompletion:", 0);
      -[ACMExternalAppleConnectImpl hideSignIn](self, "hideSignIn");
      -[ACMExternalAppleConnectImpl setAppleConnectState:](self, "setAppleConnectState:", 0);
      v4 = (void *)MEMORY[0x24BDD1540];
      v5 = (void *)MEMORY[0x24BDBCE70];
      v6 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Authentication was canceled by user"));
      -[ACMExternalAppleConnectImpl returnError:withSelector:withResponseClass:](self, "returnError:withSelector:withResponseClass:", objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200050, objc_msgSend(v5, "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD0FC8])), sel_appleConnect_authenticationDidEndWithResponse_, objc_opt_class());
    }
  }
}

- (void)showSignInDialog
{
  -[ACMExternalUIControllerProtocol setPassword:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setPassword:", 0);
  -[ACMExternalUIControllerProtocol setWidgetEnabled:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setWidgetEnabled:", 1);
  -[ACMExternalUIControllerProtocol showSignInWidgetWithParentViewController:animated:completion:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "showSignInWidgetWithParentViewController:animated:completion:", -[ACMExternalAppleConnectImpl parentViewController](self, "parentViewController"), -[ACMExternalAppleConnectImpl signInAnimated](self, "signInAnimated"), &__block_literal_global);
}

- (void)onManageAppleIDForRealm:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_msgSend(v5, "openURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(-[ACMAppleConnectPreferences environmentPreferencesWithRealm:](-[ACMAppleConnectImplComponents preferences](-[ACMExternalAppleConnectImpl components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", a3), "myAppleIDURL")));
}

- (void)uiControllerOnSignIn:(id)a3 withPassword:(id)a4
{
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  if (objc_msgSend(-[ACMMessage userName](-[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest", a3), "userName"), "length"))
  {
    if (objc_msgSend(a4, "length"))
      goto LABEL_7;
    v6 = CFSTR("Password field is empty");
  }
  else
  {
    v6 = CFSTR("Apple ID field is empty");
  }
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", v6);
  v10 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, *MEMORY[0x24BDD0FC8]));
  if (v10)
  {
    -[ACMExternalAppleConnectImpl reportError:](self, "reportError:", v10);
    return;
  }
LABEL_7:
  -[ACMExternalAppleConnectImpl authenticateWithRequest:password:](self, "authenticateWithRequest:password:", -[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest"), a4);
  -[ACMExternalUIControllerProtocol setWidgetEnabled:](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "setWidgetEnabled:", 0);
}

- (void)uiControllerOnSignInCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerOnSignInCancel:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 612, 0, "Sign in cancelled");
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Authentication was canceled by user"));
  -[ACMExternalAppleConnectImpl returnError:withSelector:withResponseClass:](self, "returnError:withSelector:withResponseClass:", objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200050, objc_msgSend(v5, "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD0FC8])), sel_appleConnect_authenticationDidEndWithResponse_, objc_opt_class());
}

- (void)uiControllerOnSignIForgot:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3);
  objc_msgSend(v4, "openURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(-[ACMAppleConnectPreferences environmentPreferencesWithRealm:](-[ACMAppleConnectImplComponents preferences](-[ACMExternalAppleConnectImpl components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", -[ACMMessage realm](-[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest"), "realm")), "iForgotURL")));
}

- (void)uiControllerWillEnableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 624, 0, "AppleConnect will try inform delegate that SignIn will become enabled");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 627, 0, "Inform delegate that SignIn will become enabled");
    }
    -[ACMExternalAppleConnectDelegate appleConnectSignInDialogWillBecomeEnabled:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectSignInDialogWillBecomeEnabled:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
  }
}

- (void)uiControllerDidEnableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 634, 0, "AppleConnect will try inform delegate that SignIn did become enabled");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 637, 0, "Inform delegate that SignIn did become enabled");
    }
    -[ACMExternalAppleConnectDelegate appleConnectSignInDialogDidBecomeEnabled:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectSignInDialogDidBecomeEnabled:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
  }
}

- (void)uiControllerWillDisableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 644, 0, "AppleConnect will try inform delegate that SignIn will become disabled");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 647, 0, "Inform delegate that SignIn will become disabled");
    }
    -[ACMExternalAppleConnectDelegate appleConnectSignInDialogWillBecomeDisabled:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectSignInDialogWillBecomeDisabled:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
  }
}

- (void)uiControllerDidDisableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 654, 0, "AppleConnect will try inform delegate that SignIn did become disabled");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 657, 0, "Inform delegate that SignIn did become disabled");
    }
    -[ACMExternalAppleConnectDelegate appleConnectSignInDialogDidBecomeDisabled:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectSignInDialogDidBecomeDisabled:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
  }
}

- (unint64_t)signInDialogContentStyle
{
  ACMExternalAppleConnectDelegate *v3;
  ACMExternalAppleConnectImpl *v4;
  ACMExternalAppleConnectImpl *v5;
  objc_super v7;

  -[ACMExternalAppleConnectImpl delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = -[ACMExternalAppleConnectImpl delegate](self, "delegate");
    v4 = -[ACMExternalAppleConnectImpl masterObject](self, "masterObject");
    if (v4)
      v5 = v4;
    else
      v5 = self;
    return -[ACMExternalAppleConnectDelegate appleConnectSignInDialogContentStyle:](v3, "appleConnectSignInDialogContentStyle:", v5);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ACMExternalAppleConnectImpl;
    return -[ACMAppleConnectImpl signInDialogContentStyle](&v7, sel_signInDialogContentStyle);
  }
}

- (void)signInDialogWillHide
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl signInDialogWillHide]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 673, 0, "AppleConnect will hide SignIn dialog and inform delegate");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMExternalAppleConnectDelegate appleConnectWillHideSignInDialog:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectWillHideSignInDialog:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
}

- (void)signInDialogDidHide
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl signInDialogDidHide]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 682, 0, "AppleConnect has hidden SignIn dialog and would inform delegate");
  -[ACMExternalAppleConnectImpl delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACMExternalAppleConnectDelegate appleConnectDidHideSignInDialog:](-[ACMExternalAppleConnectImpl delegate](self, "delegate"), "appleConnectDidHideSignInDialog:", -[ACMExternalAppleConnectImpl masterObject](self, "masterObject"));
}

- (void)twoSVController:(id)a3 openMyAppleConnectForRealm:(id)a4
{
  -[ACMExternalAppleConnectImpl onManageAppleIDForRealm:](self, "onManageAppleIDForRealm:", a4);
}

- (void)twoSVControllerEnterCredentials:(id)a3
{
  ACC2SVControllerProtocol *v4;
  _QWORD v5[5];

  v4 = -[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController", a3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__ACMExternalAppleConnectImpl_twoSVControllerEnterCredentials___block_invoke;
  v5[3] = &unk_24FCE4FA8;
  v5[4] = self;
  -[ACC2SVControllerProtocol cancelWithCompletion:](v4, "cancelWithCompletion:", v5);
}

uint64_t __63__ACMExternalAppleConnectImpl_twoSVControllerEnterCredentials___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showSignInDialog");
}

- (void)twoSVController:(id)a3 prepareUIWithCompletion:(id)a4
{
  void (**v5)(id);
  ACMExternalUIControllerProtocol *v6;
  id v7;
  _BOOL8 v8;
  _QWORD v9[6];

  v5 = (void (**)(id))(id)objc_msgSend(a4, "copy", a3);
  if (-[ACMExternalUIControllerProtocol signInStyle](-[ACMExternalAppleConnectImpl uiController](self, "uiController"), "signInStyle") == 2)
  {
    if (v5)
      v5[2](v5);
  }
  else
  {
    v6 = -[ACMExternalAppleConnectImpl uiController](self, "uiController");
    v7 = -[ACMExternalAppleConnectImpl parentViewController](self, "parentViewController");
    v8 = -[ACMExternalAppleConnectImpl signInAnimated](self, "signInAnimated");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71__ACMExternalAppleConnectImpl_twoSVController_prepareUIWithCompletion___block_invoke;
    v9[3] = &unk_24FCE50B0;
    v9[4] = self;
    v9[5] = v5;
    -[ACMExternalUIControllerProtocol hideSignInWidgetWithParentViewController:animated:completion:](v6, "hideSignInWidgetWithParentViewController:animated:completion:", v7, v8, v9);
  }
}

uint64_t __71__ACMExternalAppleConnectImpl_twoSVController_prepareUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiController"), "isWidgetShown"))
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "unloadUIController");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "twoSVController"), "transportController"), "setDelegate:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "twoSVController"), "setTransportController:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "twoSVController"), "setSecondFactorAuthUIController:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "twoSVController"), "setDelegate:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setTwoSVController:", 0);
  }
  return result;
}

- (void)twoSVControllerWillClose:(id)a3
{
  if (-[ACMExternalUIControllerProtocol signInStyle](-[ACMExternalAppleConnectImpl uiController](self, "uiController", a3), "signInStyle") != 2)-[ACMExternalAppleConnectImpl signInDialogWillHide](self, "signInDialogWillHide");
}

- (void)twoSVTransportController:(id)a3 scheduleHandler:(id)a4 withCompletion:(id)a5
{
  id v7;
  _QWORD v8[5];

  v7 = (id)objc_msgSend(a5, "copy", a3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__ACMExternalAppleConnectImpl_twoSVTransportController_scheduleHandler_withCompletion___block_invoke;
  v8[3] = &unk_24FCE50D8;
  v8[4] = v7;
  -[ACMAppleConnectImpl scheduleHandler:withCompletionBlock:](self, "scheduleHandler:withCompletionBlock:", a4, v8);
}

uint64_t __87__ACMExternalAppleConnectImpl_twoSVTransportController_scheduleHandler_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)twoSVTransportController:(id)a3 fetchImageWithHandler:(id)a4 completion:(id)a5
{
  _QWORD v8[6];

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl twoSVTransportController:fetchImageWithHandler:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 765, 0, "Scheduling image download HTTP handler %p for address %@", a4, objc_msgSend((id)objc_msgSend(a4, "transport"), "requestURLTemplate"));
  objc_sync_enter(self);
  if (a4)
  {
    if (!-[NSMutableSet count](-[ACMAppleConnectImpl handlers](self, "handlers"), "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "setNetworkActivityIndicatorVisible:", 1);
    -[NSMutableSet addObject:](-[ACMAppleConnectImpl handlers](self, "handlers"), "addObject:", a4);
    objc_msgSend(a4, "downloadImageWithCompletionBlock:", a5);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __89__ACMExternalAppleConnectImpl_twoSVTransportController_fetchImageWithHandler_completion___block_invoke;
    v8[3] = &unk_24FCE5100;
    v8[4] = self;
    v8[5] = a4;
    objc_msgSend(a4, "setFinalizeBlock:", v8);
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACMExternalAppleConnectImpl twoSVTransportController:fetchImageWithHandler:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 783, 0, "Trying to schedule nil handler");
  }
  objc_sync_exit(self);
}

uint64_t __89__ACMExternalAppleConnectImpl_twoSVTransportController_fetchImageWithHandler_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unscheduleHandler:", *(_QWORD *)(a1 + 40));
}

- (void)twoSVTransportControllerCancelFetchingImages:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[NSMutableSet objectsPassingTest:](-[ACMAppleConnectImpl handlers](self, "handlers", a3), "objectsPassingTest:", &__block_literal_global_192);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "cancelRequest");
        -[ACMAppleConnectImpl unscheduleHandler:](self, "unscheduleHandler:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

uint64_t __76__ACMExternalAppleConnectImpl_twoSVTransportControllerCancelFetchingImages___block_invoke()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)authenticationController:(id)a3 scheduleHandler:(id)a4 withCompletion:(id)a5
{
  -[ACMAppleConnectImpl scheduleHandler:withCompletionBlock:](self, "scheduleHandler:withCompletionBlock:", a4, a5);
}

- (void)authenticationController:(id)a3 perform2StepVerificationWithRequest:(id)a4 completion:(id)a5
{
  id v8;
  ACC2SVControllerProtocol *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  if (!a5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMExternalAppleConnectImpl.m"), 819, CFSTR("Invalid parameter"));
  if (-[ACMExternalAppleConnectImpl isWidgetShown](self, "isWidgetShown", a3))
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACMExternalAppleConnectImpl authenticationController:perform2StepVerificationWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 822, 0, "Two-step verification required");
    }
    v8 = (id)objc_msgSend(a5, "copy");
    v9 = -[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __103__ACMExternalAppleConnectImpl_authenticationController_perform2StepVerificationWithRequest_completion___block_invoke;
    v13[3] = &unk_24FCE5168;
    v13[4] = self;
    v13[5] = v8;
    -[ACC2SVControllerProtocol perform2StepVerificationWithRequest:completion:](v9, "perform2StepVerificationWithRequest:completion:", a4, v13);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACMExternalAppleConnectImpl authenticationController:perform2StepVerificationWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 839, 0, "Two-step verification required but UI can't be shown.");
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Two-step verification required, but user interaction is not allowed."));
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200320, objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, *MEMORY[0x24BDD0FC8])), 0);
  }
}

uint64_t __103__ACMExternalAppleConnectImpl_authenticationController_perform2StepVerificationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 && a3 && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiController"), "signInStyle") != 2)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "unloadUIController");
    objc_msgSend(*(id *)(a1 + 32), "signInDialogDidHide");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (ACMExternalAuthenticationRequestImpl)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int64_t)appleConnectState
{
  return self->_appleConnectState;
}

- (void)setAppleConnectState:(int64_t)a3
{
  self->_appleConnectState = a3;
}

- (id)masterObject
{
  return self->_masterObject;
}

- (void)setMasterObject:(id)a3
{
  self->_masterObject = a3;
}

- (ACMExternalAppleConnectDelegate)delegate
{
  return self->_delegate;
}

- (void)setTwoSVController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setAuthenticationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
