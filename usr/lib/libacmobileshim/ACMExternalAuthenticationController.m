@implementation ACMExternalAuthenticationController

- (void)dealloc
{
  objc_super v3;

  -[ACMExternalAuthenticationController setLocalAuthenticationContext:](self, "setLocalAuthenticationContext:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMExternalAuthenticationController;
  -[ACMExternalAuthenticationController dealloc](&v3, sel_dealloc);
}

- (ACCComponents)components
{
  return (ACCComponents *)+[ACCComponents components](ACCComponents, "components");
}

- (ACFKeychainManagerProtocol)keychainManager
{
  return -[ACFComponents keychainManager](-[ACMExternalAuthenticationController components](self, "components"), "keychainManager");
}

- (ACCTicketManagerProtocol)ticketManager
{
  return -[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager");
}

- (ACFLocalAuthenticationContextProtocol)localAuthenticationContext
{
  ACFLocalAuthenticationContextProtocol *result;

  result = self->_localAuthenticationContext;
  if (!result)
  {
    result = (ACFLocalAuthenticationContextProtocol *)-[ACFComponents createLocalAuthenticationContext](-[ACMExternalAuthenticationController components](self, "components"), "createLocalAuthenticationContext");
    self->_localAuthenticationContext = result;
  }
  return result;
}

- (id)tgtStoragePolicy
{
  return -[ACCComponents tgtStoragePolicy](-[ACMExternalAuthenticationController components](self, "components"), "tgtStoragePolicy");
}

- (id)localizedReasonForUsername:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Authenticate as %@ with Touch ID")), a3);
}

- (void)evaluateTouchIDWithToken:(id)a3 request:(id)a4 completion:(id)a5
{
  ACFLocalAuthenticationContextProtocol *v9;
  _QWORD v10[9];

  v9 = -[ACMExternalAuthenticationController localAuthenticationContext](self, "localAuthenticationContext");
  -[ACFLocalAuthenticationContextProtocol setLocalizedReason:](v9, "setLocalizedReason:", -[ACMExternalAuthenticationController localizedReasonForUsername:](self, "localizedReasonForUsername:", objc_msgSend((id)objc_msgSend(a3, "principal"), "userName")));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__ACMExternalAuthenticationController_evaluateTouchIDWithToken_request_completion___block_invoke;
  v10[3] = &unk_24FCE56A0;
  v10[4] = self;
  v10[5] = v9;
  v10[7] = a3;
  v10[8] = a5;
  v10[6] = a4;
  -[ACFLocalAuthenticationContextProtocol evaluatePolicy:completion:](v9, "evaluatePolicy:completion:", 1, v10);
}

uint64_t __83__ACMExternalAuthenticationController_evaluateTouchIDWithToken_request_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;

  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "convertLAError:");
  objc_msgSend(*(id *)(a1 + 40), "reset");
  if (objc_msgSend(*(id *)(a1 + 32), "isCriticalError:", v3))
    objc_msgSend(*(id *)(a1 + 32), "cleanSSOStorageWithRequest:", *(_QWORD *)(a1 + 48));
  if (v3)
    v4 = 0;
  else
    v4 = *(_QWORD *)(a1 + 56);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v3, v4);
}

- (void)evaluateTouchIDIfNeededWithSSOToken:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[8];

  v8 = (id)objc_msgSend(a5, "copy");
  v9 = (id)objc_msgSend(a4, "copy");
  objc_msgSend(v9, "setPrincipal:", objc_msgSend(a3, "principal"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke;
  v10[3] = &unk_24FCE56F0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = v9;
  v10[7] = v8;
  -[ACMExternalAuthenticationController verifyToken:withRequest:completion:](self, "verifyToken:withRequest:completion:", a3, v9, v10);
}

uint64_t __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, void *);
  void *v10;

  if (!objc_msgSend((id)objc_msgSend(a2, "personDSID"), "longLongValue"))
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke_2;
  v10 = &unk_24FCE56C8;
  return objc_msgSend(v4, "evaluateTouchIDWithToken:request:completion:", v5, MEMORY[0x24BDAC760], 3221225472, __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke_2, &unk_24FCE56C8, v4, a1[6], a2, a1[7]);
}

uint64_t __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isValidToken:duration:", 0.0)
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", *(_QWORD *)(a1 + 40), a3), "length"))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
    a2 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x24BDD0FC8], 0));
  }
  if (a3 && !a2)
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "userInfo"), "objectForKey:", CFSTR("op"));
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(a3, "setSessionToken:", v9);
      v10 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "userInfo"), "objectForKey:", CFSTR("e")), "doubleValue");
      objc_msgSend(a3, "setExpirationDate:", objc_msgSend(v10, "dateWithTimeIntervalSince1970:", v11 / 1000.0));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "tgtStoragePolicy"), "updateToken:", a3);
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMExternalAuthenticationController evaluateTouchIDIfNeededWithSSOToken:request:completion:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 137, 0, "Server did not return new session");
    }
  }
  if (a2)
    v12 = 0;
  else
    v12 = a3;
  return (*(uint64_t (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2, v12);
}

- (void)authenticate2SVWithSSOTokenIfRequired:(id)a3 request:(id)a4 completion:(id)a5
{
  char v9;
  ACMExternalAuthenticationControllerDelegate *v10;
  _QWORD v11[5];
  char v12;

  if (objc_msgSend((id)objc_msgSend(a3, "isTwoStepVerificationRequired"), "BOOLValue"))
  {
    objc_msgSend(a4, "setPersonID:", objc_msgSend(a3, "personID"));
    objc_msgSend(a4, "setSessionToken:", objc_msgSend(a3, "sessionToken"));
    v9 = objc_msgSend(a3, "longLiveSession");
    v10 = -[ACMExternalAuthenticationController delegate](self, "delegate");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __96__ACMExternalAuthenticationController_authenticate2SVWithSSOTokenIfRequired_request_completion___block_invoke;
    v11[3] = &unk_24FCE5718;
    v12 = v9;
    v11[4] = a5;
    -[ACMExternalAuthenticationControllerDelegate authenticationController:perform2StepVerificationWithRequest:completion:](v10, "authenticationController:perform2StepVerificationWithRequest:completion:", self, a4, v11);
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACMExternalAuthenticationController authenticate2SVWithSSOTokenIfRequired:request:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 166, 0, "Two-step verification is not required");
    }
    (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, a3);
  }
}

uint64_t __96__ACMExternalAuthenticationController_authenticate2SVWithSSOTokenIfRequired_request_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "setLongLiveSession:", *(unsigned __int8 *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyToken:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v9;
  _QWORD v10[7];

  if (!a5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMExternalAuthenticationController.m"), 173, CFSTR("Invalid parameter"));
  v9 = +[ACFMessage message](ACMMessage, "message");
  objc_msgSend(v9, "setUserName:", objc_msgSend((id)objc_msgSend(a3, "principal"), "userName"));
  objc_msgSend(v9, "setRealm:", objc_msgSend(a4, "realm"));
  objc_msgSend(v9, "setAppID:", objc_msgSend(a4, "appID"));
  objc_msgSend(v9, "setAppIDKey:", objc_msgSend(a4, "appIDKey"));
  objc_msgSend(v9, "setToken:", -[ACCTicketManagerProtocol serviceTicketStringWithRequest:ssoToken:](-[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", a4, a3));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__ACMExternalAuthenticationController_verifyToken_withRequest_completion___block_invoke;
  v10[3] = &unk_24FCE5740;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a5;
  -[ACMExternalAuthenticationController verifyServiceTicketWithRequest:completion:](self, "verifyServiceTicketWithRequest:completion:", v9, v10);
}

uint64_t __74__ACMExternalAuthenticationController_verifyToken_withRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x10) != 0)
      ACFLog(4, (uint64_t)"-[ACMExternalAuthenticationController verifyToken:withRequest:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 186, 0, "Error: ", a2);
  }
  else if (!a2)
  {
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCriticalError:", a2))
    objc_msgSend(*(id *)(a1 + 32), "cleanSSOStorageWithRequest:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)evaluateSSOWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  _QWORD v8[6];
  uint64_t v9;

  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMExternalAuthenticationController.m"), 200, CFSTR("Invalid parameter"));
  if (objc_msgSend(a3, "canUseTouchID"))
  {
    v9 = 0;
    if (-[ACFLocalAuthenticationContextProtocol canEvaluatePolicy:error:](-[ACMExternalAuthenticationController localAuthenticationContext](self, "localAuthenticationContext"), "canEvaluatePolicy:error:", 1, &v9))
    {
      v7 = -[ACMExternalAuthenticationController tokenWithRequest:](self, "tokenWithRequest:", a3);
      if (-[ACMExternalAuthenticationController isValidToken:duration:](self, "isValidToken:duration:", v7, 60.0))
      {
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __73__ACMExternalAuthenticationController_evaluateSSOWithRequest_completion___block_invoke;
        v8[3] = &unk_24FCE5168;
        v8[4] = a3;
        v8[5] = a4;
        -[ACMExternalAuthenticationController evaluateTouchIDIfNeededWithSSOToken:request:completion:](self, "evaluateTouchIDIfNeededWithSSOToken:request:completion:", v7, a3, v8);
        return;
      }
      if (v7)
        -[ACMExternalAuthenticationController cleanSSOStorageWithRequest:](self, "cleanSSOStorageWithRequest:", a3);
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x10) != 0)
    {
      ACFLog(4, (uint64_t)"-[ACMExternalAuthenticationController evaluateSSOWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 229, 0, "Local Authentication error: %@", v9);
    }
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
}

uint64_t __73__ACMExternalAuthenticationController_evaluateSSOWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setPrincipal:", objc_msgSend(a3, "principal"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)authenticateWithRequest:(id)a3 password:(id)a4 completion:(id)a5
{
  uint64_t v9;
  id v10;
  float v11;
  ACCTicketManagerProtocol *v12;
  id v13;
  ACMExternalAuthenticationControllerDelegate *v14;
  _QWORD v15[9];

  if (!a5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMExternalAuthenticationController.m"), 241, CFSTR("Invalid parameter!"));
  v9 = -[ACCTicketManagerProtocol authContextWithRequest:keyCode:authenticationType:](-[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager"), "authContextWithRequest:keyCode:authenticationType:", a3, a4, 0);
  -[ACMExternalAuthenticationController updateAuthContext:](self, "updateAuthContext:", v9);
  -[ACCTicketManagerProtocol updateContextWithClientSecretIfAny:](-[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager"), "updateContextWithClientSecretIfAny:", v9);
  v10 = -[ACCComponents createHandlerWithClass:context:](-[ACMExternalAuthenticationController components](self, "components"), "createHandlerWithClass:context:", objc_opt_class(), v9);
  if (objc_msgSend(a3, "serverResponseTimeout"))
  {
    objc_msgSend((id)objc_msgSend(a3, "serverResponseTimeout"), "floatValue");
    objc_msgSend((id)objc_msgSend(v10, "transport"), "setTimeout:", v11);
  }
  v12 = -[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager");
  v13 = (id)objc_msgSend(a5, "copy");
  v14 = -[ACMExternalAuthenticationController delegate](self, "delegate");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke;
  v15[3] = &unk_24FCE5790;
  v15[4] = v12;
  v15[5] = v9;
  v15[6] = self;
  v15[7] = a3;
  v15[8] = v13;
  -[ACMExternalAuthenticationControllerDelegate authenticationController:scheduleHandler:withCompletion:](v14, "authenticationController:scheduleHandler:withCompletion:", self, v10, v15);
}

uint64_t __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  if (a3)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACMExternalAuthenticationController authenticateWithRequest:password:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 278, 0, "Did receive authentication error: %@", a3);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACMExternalAuthenticationController authenticateWithRequest:password:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 260, 0, "Did receive authentication response");
  v6 = objc_msgSend(*(id *)(a1 + 32), "createSSOTokenWithContent:context:", objc_msgSend(*(id *)(a1 + 32), "decryptEncryptedContent:withHmac:context:", objc_msgSend(a2, "objectForKey:", CFSTR("pt")), objc_msgSend(a2, "objectForKey:", CFSTR("ph")), *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 40));
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke_2;
    v13[3] = &unk_24FCE5768;
    v13[4] = v8;
    return objc_msgSend(v8, "authenticate2SVWithSSOTokenIfRequired:request:completion:", v7, *(_QWORD *)(a1 + 56), v13);
  }
  v10 = (void *)MEMORY[0x24BDD1540];
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Failed to create valid SSO token"));
  result = objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, *MEMORY[0x24BDD0FC8]));
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return result;
}

uint64_t __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "saveSSOIfNeeded:withRequest:", a3, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)updateAuthContext:(id)a3
{
  if (-[ACFLocalAuthenticationContextProtocol canEvaluatePolicy:error:](-[ACMExternalAuthenticationController localAuthenticationContext](self, "localAuthenticationContext"), "canEvaluatePolicy:error:", 1, 0))objc_msgSend(a3, "setTouchIDSupport:", MEMORY[0x24BDBD1C8]);
}

- (void)verifyServiceTicketWithRequest:(id)a3 completion:(id)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  float v15;
  ACMExternalAuthenticationControllerDelegate *v16;
  _QWORD v17[5];

  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMExternalAuthenticationController.m"), 298, CFSTR("Invalid parameter"));
  if (objc_msgSend(a3, "appID") && objc_msgSend((id)objc_msgSend(a3, "appIDKey"), "length"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "token"), "length"))
      goto LABEL_13;
    v7 = CFSTR("Invalid Data Token. Data Token for verify is not valid.");
  }
  else
  {
    v7 = CFSTR("Invalid Parameters. Some of input parameters are set incorrectly.");
  }
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", v7);
  v11 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200190, objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, *MEMORY[0x24BDD0FC8]));
  if (v11)
  {
    v12 = v11;
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACMExternalAuthenticationController verifyServiceTicketWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 312, 0, "Reporting delegate about error %@", v12);
    }
    (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, v12, 0);
    return;
  }
LABEL_13:
  v13 = -[ACCTicketManagerProtocol authContextWithRequest:](-[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager"), "authContextWithRequest:", a3);
  -[ACMExternalAuthenticationController updateAuthContext:](self, "updateAuthContext:", v13);
  v14 = -[ACCComponents createHandlerWithClass:context:](-[ACMExternalAuthenticationController components](self, "components"), "createHandlerWithClass:context:", objc_opt_class(), v13);
  if (objc_msgSend(a3, "serverResponseTimeout"))
  {
    objc_msgSend((id)objc_msgSend(a3, "serverResponseTimeout"), "floatValue");
    objc_msgSend((id)objc_msgSend(v14, "transport"), "setTimeout:", v15);
  }
  v16 = -[ACMExternalAuthenticationController delegate](self, "delegate");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__ACMExternalAuthenticationController_verifyServiceTicketWithRequest_completion___block_invoke;
  v17[3] = &unk_24FCE50D8;
  v17[4] = a4;
  -[ACMExternalAuthenticationControllerDelegate authenticationController:scheduleHandler:withCompletion:](v16, "authenticationController:scheduleHandler:withCompletion:", self, v14, v17);
}

uint64_t __81__ACMExternalAuthenticationController_verifyServiceTicketWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMExternalAuthenticationController verifyServiceTicketWithRequest:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 327, 0, "Response is received");
  if (a3)
  {
    if (objc_msgSend(a3, "code") == -200200)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = *MEMORY[0x24BDD1398];
      v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", a3, v8, v9, *MEMORY[0x24BDD0FC8], 0));
    }
  }
  else
  {
    v10 = (id)objc_opt_new();
    objc_msgSend(v10, "setRawResponseData:", a2);
    objc_msgSend(v10, "setUserInfo:", a2);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isValidToken:(id)a3 duration:(double)a4
{
  double v5;

  if (!a3)
    return 0;
  objc_msgSend((id)objc_msgSend(a3, "expirationDate"), "timeIntervalSinceNow");
  return v5 - a4 > 0.0;
}

- (id)convertLAError:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = objc_msgSend(a3, "code");
  switch(v4)
  {
    case -4:
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = (void *)MEMORY[0x24BDBCE70];
      v7 = CFSTR("Authentication was canceled by system");
      break;
    case -3:
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = -600182;
      v9 = 0;
      return (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, v9);
    case -2:
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = (void *)MEMORY[0x24BDBCE70];
      v7 = CFSTR("Authentication was canceled by user");
      break;
    default:
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = *MEMORY[0x24BDD1398];
      v15 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
      v9 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", a3, v14, v15, *MEMORY[0x24BDD0FC8], 0);
      v11 = -200200;
      v10 = v12;
      return (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, v9);
  }
  v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", v7);
  v9 = objc_msgSend(v6, "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDD0FC8]);
  v10 = v5;
  v11 = -200050;
  return (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, v9);
}

- (BOOL)isCriticalError:(id)a3
{
  uint64_t v3;
  BOOL result;

  if (!a3)
    return 0;
  v3 = objc_msgSend(a3, "code");
  result = 1;
  if (v3 > -100402)
  {
    if ((unint64_t)(v3 + 100401) >= 2 && v3)
      return result;
    return 0;
  }
  if (v3 == -600182 || v3 == -200050)
    return 0;
  return result;
}

- (id)tokenWithRequest:(id)a3
{
  void *v3;

  v3 = (void *)-[ACCTicketManagerProtocol fetchSSOTokenForPrincipal:](-[ACMExternalAuthenticationController ticketManager](self, "ticketManager"), "fetchSSOTokenForPrincipal:", objc_msgSend(a3, "principal"));
  objc_msgSend(v3, "setLongLiveSession:", 1);
  return v3;
}

- (void)saveSSOIfNeeded:(id)a3 withRequest:(id)a4
{
  uint64_t v8;

  if (a3 && objc_msgSend(a3, "longLiveSession"))
  {
    if (!-[ACMExternalAuthenticationController localAuthenticationContext](self, "localAuthenticationContext"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACMExternalAuthenticationController.m"), 426, CFSTR("Invalid configuration"));
    v8 = 0;
    if (-[ACFLocalAuthenticationContextProtocol canEvaluatePolicy:error:](-[ACMExternalAuthenticationController localAuthenticationContext](self, "localAuthenticationContext"), "canEvaluatePolicy:error:", 1, &v8))
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "principal"), "userName"), "length"))
        -[ACCTicketManagerProtocol storeSSOToken:](-[ACMExternalAuthenticationController ticketManager](self, "ticketManager"), "storeSSOToken:", a3);
    }
    else
    {
      if (v8 && ACFLog && (ACFLogSettingsGetLevelMask() & 0x10) != 0)
        ACFLog(4, (uint64_t)"-[ACMExternalAuthenticationController saveSSOIfNeeded:withRequest:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 439, 0, "Local Authentication error: %@", v8);
      -[ACMExternalAuthenticationController cleanSSOStorageWithRequest:](self, "cleanSSOStorageWithRequest:", a4);
    }
  }
}

- (ACMExternalAuthenticationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMExternalAuthenticationControllerDelegate *)a3;
}

- (void)setLocalAuthenticationContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
