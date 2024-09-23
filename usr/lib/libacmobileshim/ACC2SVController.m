@implementation ACC2SVController

- (void)dealloc
{
  objc_super v3;

  -[ACC2SVController setSecondFactorAuthUIController:](self, "setSecondFactorAuthUIController:", 0);
  -[ACC2SVController setDelegate:](self, "setDelegate:", 0);
  -[ACC2SVController setAuthRequest:](self, "setAuthRequest:", 0);
  -[ACC2SVController setCurrentDevice:](self, "setCurrentDevice:", 0);
  -[ACC2SVController setCompletionBlock:](self, "setCompletionBlock:", 0);
  -[ACC2SVController setTransportController:](self, "setTransportController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACC2SVController;
  -[ACC2SVController dealloc](&v3, sel_dealloc);
}

- (void)setSecondFactorAuthUIController:(id)a3
{
  ACC2SVAuthenticationUIControllerProtocol *secondFactorAuthUIController;
  ACC2SVAuthenticationUIControllerProtocol *v6;

  secondFactorAuthUIController = self->_secondFactorAuthUIController;
  if (secondFactorAuthUIController != a3)
  {
    -[ACC2SVAuthenticationUIControllerProtocol setDelegate:](secondFactorAuthUIController, "setDelegate:", 0);

    v6 = (ACC2SVAuthenticationUIControllerProtocol *)a3;
    self->_secondFactorAuthUIController = v6;
    -[ACC2SVAuthenticationUIControllerProtocol setDelegate:](v6, "setDelegate:", self);
  }
}

- (ACCTicketManagerProtocol)ticketManager
{
  return (ACCTicketManagerProtocol *)objc_msgSend(+[ACCComponents components](ACCComponents, "components"), "ticketManager");
}

- (void)perform2StepVerificationWithRequest:(id)a3 completion:(id)a4
{
  -[ACC2SVController setCompletionBlock:](self, "setCompletionBlock:", a4);
  -[ACC2SVController start2StepVerificationWithRequest:](self, "start2StepVerificationWithRequest:", a3);
}

- (void)cancelWithCompletion:(id)a3
{
  id v5;
  ACC2SVAuthenticationUIControllerProtocol *v6;
  _QWORD v7[6];

  if (-[ACC2SVController completionBlock](self, "completionBlock"))
  {
    v5 = (id)objc_msgSend(a3, "copy");
    v6 = -[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__ACC2SVController_cancelWithCompletion___block_invoke;
    v7[3] = &unk_24FCE50B0;
    v7[4] = self;
    v7[5] = v5;
    -[ACC2SVAuthenticationUIControllerProtocol hideUIAnimated:withCompletion:](v6, "hideUIAnimated:withCompletion:", 0, v7);
  }
  else if (a3)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __41__ACC2SVController_cancelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hideUIWithCompletion:(id)a3
{
  -[ACC2SVControllerDelegate twoSVControllerWillClose:](-[ACC2SVController delegate](self, "delegate"), "twoSVControllerWillClose:", self);
  -[ACC2SVAuthenticationUIControllerProtocol hideUIAnimated:withCompletion:](-[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController"), "hideUIAnimated:withCompletion:", 1, a3);
}

- (void)enterCredentials
{
  ACC2SVAuthenticationUIControllerProtocol *v3;
  _QWORD v4[5];

  v3 = -[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__ACC2SVController_enterCredentials__block_invoke;
  v4[3] = &unk_24FCE4FA8;
  v4[4] = self;
  -[ACC2SVAuthenticationUIControllerProtocol handleFailoverWithCompletion:](v3, "handleFailoverWithCompletion:", v4);
}

uint64_t __36__ACC2SVController_enterCredentials__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "twoSVControllerEnterCredentials:", *(_QWORD *)(a1 + 32));
}

- (void)enterAndVerifySecureCodeOfLength:(unint64_t)a3
{
  ACC2SVAuthenticationUIControllerProtocol *v5;
  ACC2SVTrustedDeviceObject *v6;
  _QWORD v7[5];

  v5 = -[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController");
  v6 = -[ACC2SVController currentDevice](self, "currentDevice");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke;
  v7[3] = &unk_24FCE5478;
  v7[4] = self;
  -[ACC2SVAuthenticationUIControllerProtocol enterVerificationCodeWithLength:forDevice:completion:](v5, "enterVerificationCodeWithLength:forDevice:completion:", a3, v6, v7);
}

uint64_t __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v4 = objc_msgSend(a2, "length");
  v5 = *(void **)(a1 + 32);
  if (!v4)
    return objc_msgSend(v5, "goBackToTrustedDevices");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_2;
  v7[3] = &unk_24FCE5450;
  v7[4] = v5;
  return objc_msgSend(v5, "verifySecureCode:withCompletion:", a2, v7);
}

uint64_t __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v7;
  _QWORD v8[6];

  if (a3)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController enterAndVerifySecureCodeOfLength:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 132, 0, "Error %@ occurred while verifying security code.", a3);
    }
    return objc_msgSend(*(id *)(a1 + 32), "verifySecurityCodeDidFailWithError:", a3);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACC2SVController enterAndVerifySecureCodeOfLength:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 124, 0, "Verify sec code finished successfully.");
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_3;
    v8[3] = &unk_24FCE5100;
    v8[4] = v7;
    v8[5] = a2;
    return objc_msgSend(v7, "hideUIWithCompletion:", v8);
  }
}

uint64_t __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "verifySecurityCodeDidFinishWithToken:", *(_QWORD *)(a1 + 40));
}

- (void)sendVerificationCodeToDevice:(id)a3
{
  _QWORD v5[5];

  if (a3)
  {
    if (objc_msgSend(a3, "isTOTPDevice"))
    {
      -[ACC2SVController setCurrentDevice:](self, "setCurrentDevice:", a3);
      -[ACC2SVController enterAndVerifySecureCodeOfLength:](self, "enterAndVerifySecureCodeOfLength:", 6);
    }
    else
    {
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
          ACFLog(6, (uint64_t)"-[ACC2SVController sendVerificationCodeToDevice:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 155, 0, "Send code to device %@.", objc_msgSend(a3, "deviceDisplayDescription"));
      }
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke;
      v5[3] = &unk_24FCE54C8;
      v5[4] = self;
      -[ACC2SVController generateAndSendSecCodeToDevice:withCompletion:](self, "generateAndSendSecCodeToDevice:withCompletion:", a3, v5);
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACC2SVController sendVerificationCodeToDevice:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 176, 0, "2SV authentication is cancelled.");
    -[ACC2SVController cancel2SVAuthentication](self, "cancel2SVAuthentication");
  }
}

uint64_t __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v7[6];

  if (!a3)
    return objc_msgSend(*(id *)(a1 + 32), "enterAndVerifySecureCodeOfLength:", a2);
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACC2SVController sendVerificationCodeToDevice:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 164, 0, "Error %@ occurred while sending security code.", a3);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke_2;
  v7[3] = &unk_24FCE54A0;
  v7[4] = v5;
  v7[5] = a3;
  return objc_msgSend(v5, "reportError:completionBlock:", a3, v7);
}

uint64_t __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleErrorOnSendSecurityCode:alertCancelled:", *(_QWORD *)(a1 + 40), a2);
}

- (void)goBackToTrustedDevices
{
  ACC2SVAuthenticationUIControllerProtocol *v3;
  _QWORD v4[5];

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACC2SVController goBackToTrustedDevices]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 183, 0, "Go back to trusted devices");
  v3 = -[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__ACC2SVController_goBackToTrustedDevices__block_invoke;
  v4[3] = &unk_24FCE54F0;
  v4[4] = self;
  -[ACC2SVAuthenticationUIControllerProtocol chooseTrustedDeviceWithDeviceList:completion:](v3, "chooseTrustedDeviceWithDeviceList:completion:", 0, v4);
}

uint64_t __42__ACC2SVController_goBackToTrustedDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendVerificationCodeToDevice:", a2);
}

- (id)createCancelError
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Authentication was canceled by user"));
  return (id)objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200050, objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, *MEMORY[0x24BDD0FC8]));
}

- (void)cancel2SVAuthentication
{
  -[ACC2SVController hideUIAndReturnError:](self, "hideUIAndReturnError:", -[ACC2SVController createCancelError](self, "createCancelError"));
}

- (void)hideUIAndReturnError:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__ACC2SVController_hideUIAndReturnError___block_invoke;
  v3[3] = &unk_24FCE5100;
  v3[4] = self;
  v3[5] = a3;
  -[ACC2SVController hideUIWithCompletion:](self, "hideUIWithCompletion:", v3);
}

uint64_t __41__ACC2SVController_hideUIAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), 0);
    return objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  }
  return result;
}

- (unint64_t)passcodeLengthFromEncryptedContent:(id)a3 withHmac:(id)a4 context:(id)a5
{
  uint64_t v9;
  unint64_t result;
  uint64_t v11;
  uint64_t v12;

  if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length"))
  {
    v9 = -[ACCTicketManagerProtocol decryptEncryptedContent:withHmac:context:](-[ACC2SVController ticketManager](self, "ticketManager"), "decryptEncryptedContent:withHmac:context:", a3, a4, a5);
    if (v9)
    {
      v12 = 100;
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 0, &v12, 0), "objectForKey:", CFSTR("sl")), "unsignedIntegerValue");
    }
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 229, 0, "Decrypted data is empty");
    }
    return 0;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 234, 0, "Invalid Parameters");
  if (!objc_msgSend(a3, "length") && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 238, 0, "Encrypted data is empty");
  v11 = objc_msgSend(a4, "length");
  result = 0;
  if (!v11 && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 242, 0, "Encrypted content hmac is empty");
    return 0;
  }
  return result;
}

- (Class)deviceObjectClass
{
  return (Class)objc_opt_class();
}

- (void)generateAndSendSecCodeToDevice:(id)a3 withCompletion:(id)a4
{
  void *v7;
  id v8;
  ACC2SVTransportControllerProtocol *v9;
  _QWORD v10[7];

  -[ACC2SVController setCurrentDevice:](self, "setCurrentDevice:");
  v7 = (void *)-[ACCTicketManagerProtocol authContextWithRequest:sessionToken:](-[ACC2SVController ticketManager](self, "ticketManager"), "authContextWithRequest:sessionToken:", -[ACC2SVController authRequest](self, "authRequest"), -[ACFMessage sessionToken](-[ACC2SVController authRequest](self, "authRequest"), "sessionToken"));
  objc_msgSend(v7, "setPersonID:", -[ACFMessage personId](-[ACC2SVController authRequest](self, "authRequest"), "personId"));
  objc_msgSend(v7, "setSelectedDeviceId:", objc_msgSend(a3, "deviceID"));
  objc_msgSend(v7, "setSelectedDeviceType:", objc_msgSend(a3, "deviceType"));
  v8 = (id)objc_msgSend(a4, "copy");
  v9 = -[ACC2SVController transportController](self, "transportController");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__ACC2SVController_generateAndSendSecCodeToDevice_withCompletion___block_invoke;
  v10[3] = &unk_24FCE5518;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = v8;
  -[ACC2SVTransportControllerProtocol generateAndSendSecCodeWithContext:completion:](v9, "generateAndSendSecCodeWithContext:completion:", v7, v10);
}

uint64_t __66__ACC2SVController_generateAndSendSecCodeToDevice_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v4)(void);
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACC2SVController generateAndSendSecCodeToDevice:withCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 270, 0, "Sec code sent successfully. Close Trusted devices screen and show verify code.");
    if (objc_msgSend(a2, "objectForKey:", CFSTR("end"))
      && objc_msgSend(a2, "objectForKey:", CFSTR("enh"))
      && objc_msgSend(*(id *)(a1 + 32), "passcodeLengthFromEncryptedContent:withHmac:context:", objc_msgSend(a2, "objectForKey:", CFSTR("end")), objc_msgSend(a2, "objectForKey:", CFSTR("enh")), *(_QWORD *)(a1 + 40)))
    {
      v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = (void *)MEMORY[0x24BDBCE70];
      v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Invalid passcode length"));
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -101212, objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, *MEMORY[0x24BDD0FC8]));
      v4 = *(uint64_t (**)(void))(v6 + 16);
    }
  }
  return v4();
}

- (void)verifySecureCode:(id)a3 withCompletion:(id)a4
{
  void *v7;
  ACC2SVTransportControllerProtocol *v8;
  _QWORD v9[7];

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACC2SVController verifySecureCode:withCompletion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 295, 0, "Verify security code.");
  v7 = (void *)-[ACCTicketManagerProtocol authContextWithRequest:sessionToken:](-[ACC2SVController ticketManager](self, "ticketManager"), "authContextWithRequest:sessionToken:", -[ACC2SVController authRequest](self, "authRequest"), -[ACFMessage sessionToken](-[ACC2SVController authRequest](self, "authRequest"), "sessionToken"));
  objc_msgSend(v7, "setPersonID:", -[ACFMessage personId](-[ACC2SVController authRequest](self, "authRequest"), "personId"));
  objc_msgSend(v7, "setSelectedDeviceId:", -[ACC2SVTrustedDeviceObject deviceID](-[ACC2SVController currentDevice](self, "currentDevice"), "deviceID"));
  objc_msgSend(v7, "setSelectedDeviceType:", -[ACC2SVTrustedDeviceObject deviceType](-[ACC2SVController currentDevice](self, "currentDevice"), "deviceType"));
  objc_msgSend(v7, "setTwoStepVerificationCode:", a3);
  v8 = -[ACC2SVController transportController](self, "transportController");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__ACC2SVController_verifySecureCode_withCompletion___block_invoke;
  v9[3] = &unk_24FCE5518;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = a4;
  -[ACC2SVTransportControllerProtocol verifySecureCodeWithContext:completion:](v8, "verifySecureCodeWithContext:completion:", v7, v9);
}

uint64_t __52__ACC2SVController_verifySecureCode_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  void *v8;
  void *v9;
  id v10;

  v3 = (uint64_t)a3;
  if (objc_msgSend(a3, "code"))
    goto LABEL_2;
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACC2SVController verifySecureCode:withCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 306, 0, "Verify sec code finished successfully.");
  v6 = objc_msgSend(*(id *)(a1 + 32), "ssoTokenWithResponse:context:", a2, *(_QWORD *)(a1 + 40));
  if (!v6)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Failed to create valid service ticket"));
    v3 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, *MEMORY[0x24BDD0FC8]));
LABEL_2:
    v6 = 0;
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v6, v3);
  return result;
}

- (void)start2StepVerificationWithRequest:(id)a3
{
  void *v4;
  ACC2SVTransportControllerProtocol *v5;
  _QWORD v6[6];

  -[ACC2SVController setAuthRequest:](self, "setAuthRequest:", a3);
  v4 = (void *)-[ACCTicketManagerProtocol authContextWithRequest:sessionToken:](-[ACC2SVController ticketManager](self, "ticketManager"), "authContextWithRequest:sessionToken:", -[ACC2SVController authRequest](self, "authRequest"), -[ACFMessage sessionToken](-[ACC2SVController authRequest](self, "authRequest"), "sessionToken"));
  objc_msgSend(v4, "setPersonID:", -[ACFMessage personID](-[ACC2SVController authRequest](self, "authRequest"), "personID"));
  v5 = -[ACC2SVController transportController](self, "transportController");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke;
  v6[3] = &unk_24FCE5568;
  v6[4] = self;
  v6[5] = v4;
  -[ACC2SVTransportControllerProtocol loadTrustedDevicesWithContext:completion:](v5, "loadTrustedDevicesWithContext:completion:", v4, v6);
}

uint64_t __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController start2StepVerificationWithRequest:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 351, 0, "Error %@ occurred while getting trusted devices.", a3);
    }
    return objc_msgSend(*(id *)(a1 + 32), "handleErrorOnGetTrustedDevices:", a3);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACC2SVController start2StepVerificationWithRequest:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 331, 0, "Show trusted devices list screen.");
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "twoSVController:prepareUIWithCompletion:");
  }
}

uint64_t __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "trustedDevicesFromResponse:withContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "secondFactorAuthUIController");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke_3;
    v7[3] = &unk_24FCE54F0;
    v7[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v3, "chooseTrustedDeviceWithDeviceList:completion:", v2, v7);
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController start2StepVerificationWithRequest:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 344, 0, "Devices list is empty..");
    }
    v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    v9[0] = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Device list is empty."));
    return objc_msgSend(v5, "hideUIAndReturnError:", objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -101112, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
}

uint64_t __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendVerificationCodeToDevice:", a2);
}

- (void)handleErrorOnGetTrustedDevices:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__ACC2SVController_handleErrorOnGetTrustedDevices___block_invoke;
  v3[3] = &unk_24FCE5590;
  v3[4] = self;
  -[ACC2SVController reportError:completionBlock:](self, "reportError:completionBlock:", a3, v3);
}

uint64_t __51__ACC2SVController_handleErrorOnGetTrustedDevices___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enterCredentials");
}

- (void)refreshTrustedDevicesList
{
  void *v3;
  ACC2SVTransportControllerProtocol *v4;
  _QWORD v5[6];

  v3 = (void *)-[ACCTicketManagerProtocol authContextWithRequest:sessionToken:](-[ACC2SVController ticketManager](self, "ticketManager"), "authContextWithRequest:sessionToken:", -[ACC2SVController authRequest](self, "authRequest"), -[ACFMessage sessionToken](-[ACC2SVController authRequest](self, "authRequest"), "sessionToken"));
  objc_msgSend(v3, "setPersonID:", -[ACFMessage personID](-[ACC2SVController authRequest](self, "authRequest"), "personID"));
  v4 = -[ACC2SVController transportController](self, "transportController");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__ACC2SVController_refreshTrustedDevicesList__block_invoke;
  v5[3] = &unk_24FCE5568;
  v5[4] = self;
  v5[5] = v3;
  -[ACC2SVTransportControllerProtocol loadTrustedDevicesWithContext:completion:](v4, "loadTrustedDevicesWithContext:completion:", v3, v5);
}

void __45__ACC2SVController_refreshTrustedDevicesList__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController refreshTrustedDevicesList]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 381, 0, "Error %@ occurred while refreshing trusted devices. No need to do anything", a3);
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACC2SVController refreshTrustedDevicesList]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 374, 0, "Refresh the trusted devices list.");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "secondFactorAuthUIController"), "resetTrustedDevicesViewControllerWithDeviceList:", objc_msgSend(*(id *)(a1 + 32), "trustedDevicesFromResponse:withContext:", a2, *(_QWORD *)(a1 + 40)));
  }
}

- (id)createTrustedDeviceWithDictionary:(id)a3
{
  return (id)objc_msgSend(objc_alloc(-[ACC2SVController deviceObjectClass](self, "deviceObjectClass")), "initWithDictionary:", a3);
}

- (id)trustedDevicesFromResponse:(id)a3 withContext:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("end"));
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("enh"));
    if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
    {
      v9 = (void *)-[ACCTicketManagerProtocol decryptEncryptedContent:withHmac:context:](-[ACC2SVController ticketManager](self, "ticketManager"), "decryptEncryptedContent:withHmac:context:", v7, v8, a4);
      if (objc_msgSend(v9, "length"))
      {
        v24 = 100;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 0, &v24, 0), "objectForKey:", CFSTR("td"), 0);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v10);
              v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              if (!v13)
                v13 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              objc_msgSend(v13, "addObject:", -[ACC2SVController createTrustedDeviceWithDictionary:](self, "createTrustedDeviceWithDictionary:", v16));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          }
          while (v12);
          goto LABEL_34;
        }
      }
      else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 422, 0, "Decrypted data is empty");
      }
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 427, 0, "Invalid Parameters");
      if (!objc_msgSend(v7, "length") && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 431, 0, "Devices encrypted data is empty");
      v17 = objc_msgSend(v8, "length");
      v13 = 0;
      if (v17 || !ACFLog)
        goto LABEL_34;
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 435, 0, "Device data hmac is empty");
    }
    v13 = 0;
LABEL_34:
    v19 = objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastUseDate"), 0);
    return (id)objc_msgSend(v13, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v19));
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 445, 0, "Trusted Devices Response is empty");
  return 0;
}

- (id)ssoTokenWithResponse:(id)a3 context:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = (void *)-[ACCTicketManagerProtocol createSSOTokenWithContent:context:](-[ACC2SVController ticketManager](self, "ticketManager"), "createSSOTokenWithContent:context:", -[ACCTicketManagerProtocol decryptEncryptedContent:withHmac:context:](-[ACC2SVController ticketManager](self, "ticketManager"), "decryptEncryptedContent:withHmac:context:", objc_msgSend(a3, "objectForKey:", CFSTR("pt")), objc_msgSend(a3, "objectForKey:", CFSTR("ph")), a4), a4);
  v6 = -[ACCTicketManagerProtocol serviceTicketStringWithRequest:ssoToken:](-[ACC2SVController ticketManager](self, "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", -[ACC2SVController authRequest](self, "authRequest"), v5);
  if (v6)
  {
    -[ACC2SVController updateSSOToken:withServiceTicket:request:](self, "updateSSOToken:withServiceTicket:request:", v5, v6, -[ACC2SVController authRequest](self, "authRequest"));
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACC2SVController ssoTokenWithResponse:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 461, 0, "Failed to create valid serviceTicket");
    return 0;
  }
  return v5;
}

- (void)handleErrorOnSendSecurityCode:(id)a3 alertCancelled:(BOOL)a4
{
  unint64_t v5;

  v5 = objc_msgSend(a3, "code") + 200270;
  if (v5 > 0x3C)
    goto LABEL_12;
  if (((1 << v5) & 0x1004000000000001) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnSendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 478, 0, "Session expired. Ask user to sign in again.");
    }
    -[ACC2SVController enterCredentials](self, "enterCredentials");
    return;
  }
  if (((1 << v5) & 0x10040000000) == 0)
  {
LABEL_12:
    -[ACC2SVAuthenticationUIControllerProtocol resetTrustedDevicesViewControllerWithDeviceList:](-[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController"), "resetTrustedDevicesViewControllerWithDeviceList:", 0);
    return;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnSendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 485, 0, "Device not available. Refresh list of trusted devices");
  -[ACC2SVController refreshTrustedDevicesList](self, "refreshTrustedDevicesList");
}

- (void)handleErrorOnResendSecurityCode:(id)a3 alertCancelled:(BOOL)a4
{
  unint64_t v5;
  ACC2SVAuthenticationUIControllerProtocol *v6;
  _QWORD v7[5];

  v5 = objc_msgSend(a3, "code") + 200270;
  if (v5 > 0x3C)
    goto LABEL_12;
  if (((1 << v5) & 0x1004000000000001) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnResendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 502, 0, "Session expired on resend code. Ask user to sign in again.");
    }
    -[ACC2SVController enterCredentials](self, "enterCredentials");
    return;
  }
  if (((1 << v5) & 0x10040000000) == 0)
  {
LABEL_12:
    -[ACC2SVAuthenticationUIControllerProtocol resetCodeVerificationViewController](-[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController"), "resetCodeVerificationViewController");
    return;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnResendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 509, 0, "Device not available on resend code. Show trusted devices");
  v6 = -[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__ACC2SVController_handleErrorOnResendSecurityCode_alertCancelled___block_invoke;
  v7[3] = &unk_24FCE4FA8;
  v7[4] = self;
  -[ACC2SVAuthenticationUIControllerProtocol handleFailoverWithCompletion:](v6, "handleFailoverWithCompletion:", v7);
}

uint64_t __67__ACC2SVController_handleErrorOnResendSecurityCode_alertCancelled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "goBackToTrustedDevices");
}

- (void)verifySecurityCodeDidFinishWithToken:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(id, uint64_t, id);

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Two-step verification response is empty."));
    v5 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDD0FC8]));
  }
  if (-[ACC2SVController completionBlock](self, "completionBlock"))
  {
    v9 = -[ACC2SVController completionBlock](self, "completionBlock");
    v9[2](v9, v5, a3);
    -[ACC2SVController setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
}

- (void)verifySecurityCodeDidFailWithError:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__ACC2SVController_verifySecurityCodeDidFailWithError___block_invoke;
  v3[3] = &unk_24FCE54A0;
  v3[4] = a3;
  v3[5] = self;
  -[ACC2SVController reportError:completionBlock:](self, "reportError:completionBlock:", a3, v3);
}

uint64_t __55__ACC2SVController_verifySecurityCodeDidFailWithError___block_invoke(uint64_t a1)
{
  unint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code") + 200270;
  if (v2 > 0x3C)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "secondFactorAuthUIController"), "resetCodeVerificationViewController");
  if (((1 << v2) & 0x1004000000000001) != 0)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACC2SVController verifySecurityCodeDidFailWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 547, 0, "Session expired on verify code. Ask user to sign in again.");
    }
    return objc_msgSend(*(id *)(a1 + 40), "enterCredentials");
  }
  if (((1 << v2) & 0x10000000400) == 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "secondFactorAuthUIController"), "resetCodeVerificationViewController");
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACC2SVController verifySecurityCodeDidFailWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 554, 0, "Device not available on verify code. Show list of trusted devices");
  return objc_msgSend(*(id *)(a1 + 40), "goBackToTrustedDevices");
}

- (void)reportError:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v7;
  id v8;

  v5 = a3;
  if (objc_msgSend(a3, "code") == -200240
    && !-[ACC2SVTrustedDeviceObject isTOTPDevice](-[ACC2SVController currentDevice](self, "currentDevice"), "isTOTPDevice")&& !-[ACC2SVTrustedDeviceObject isSMSDevice](-[ACC2SVController currentDevice](self, "currentDevice"), "isSMSDevice"))
  {
    v7 = (id)objc_msgSend((id)objc_msgSend(v5, "userInfo"), "mutableCopy");
    v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("You have sent too many codes to verify your device. Please try again later."));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", objc_msgSend(v5, "domain"), objc_msgSend(v5, "code"), v7);
  }
  -[ACC2SVAuthenticationUIControllerProtocol showAlertWithError:completion:](-[ACC2SVController secondFactorAuthUIController](self, "secondFactorAuthUIController"), "showAlertWithError:completion:", v5, a4);
}

- (void)uiController:(id)a3 resendVerificationCodeWithCompletion:(id)a4
{
  id v6;
  ACC2SVTrustedDeviceObject *v7;
  _QWORD v8[6];

  if (-[ACC2SVController currentDevice](self, "currentDevice", a3))
  {
    v6 = (id)objc_msgSend(a4, "copy");
    v7 = -[ACC2SVController currentDevice](self, "currentDevice");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke;
    v8[3] = &unk_24FCE55B8;
    v8[4] = self;
    v8[5] = v6;
    -[ACC2SVController generateAndSendSecCodeToDevice:withCompletion:](self, "generateAndSendSecCodeToDevice:withCompletion:", v7, v8);
  }
  else if (a4)
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  _QWORD v7[6];

  if (a3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACC2SVController uiController:resendVerificationCodeWithCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 601, 0, "Error %@ occurred while resend security code.", a3);
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke_2;
    v7[3] = &unk_24FCE54A0;
    v7[4] = v5;
    v7[5] = a3;
    objc_msgSend(v5, "reportError:completionBlock:", a3, v7);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACC2SVController uiController:resendVerificationCodeWithCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 596, 0, "Sec code resent successfully. Reset code verify screen.");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "secondFactorAuthUIController"), "resetCodeVerificationViewController");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

uint64_t __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleErrorOnResendSecurityCode:alertCancelled:", *(_QWORD *)(a1 + 40), a2);
}

- (void)uiControllerUserIsUnableToReceiveVerificationCode:(id)a3
{
  -[ACC2SVControllerDelegate twoSVController:openMyAppleConnectForRealm:](-[ACC2SVController delegate](self, "delegate", a3), "twoSVController:openMyAppleConnectForRealm:", self, -[ACFMessage realm](-[ACC2SVController authRequest](self, "authRequest"), "realm"));
}

- (void)uiController:(id)a3 getImageWithURL:(id)a4 completion:(id)a5
{
  -[ACC2SVTransportControllerProtocol getImageWithURL:completion:](-[ACC2SVController transportController](self, "transportController", a3), "getImageWithURL:completion:", a4, a5);
}

- (void)uiControllerCancelGettingImages:(id)a3
{
  -[ACC2SVTransportControllerProtocol cancelImageFetching](-[ACC2SVController transportController](self, "transportController", a3), "cancelImageFetching");
}

- (void)uiControllerHideViewAnimated:(id)a3
{
  -[ACC2SVControllerDelegate twoSVControllerWillClose:](-[ACC2SVController delegate](self, "delegate", a3), "twoSVControllerWillClose:", self);
}

- (void)uiControllerSetup:(id)a3
{
  -[ACC2SVControllerDelegate twoSVController:openMyAppleConnectForRealm:](-[ACC2SVController delegate](self, "delegate", a3), "twoSVController:openMyAppleConnectForRealm:", self, -[ACFMessage realm](-[ACC2SVController authRequest](self, "authRequest"), "realm"));
}

- (id)uiControllerTitle:(id)a3
{
  if (-[ACFMessage applicationName](-[ACC2SVController authRequest](self, "authRequest", a3), "applicationName"))
    return (id)-[ACFMessage applicationName](-[ACC2SVController authRequest](self, "authRequest"), "applicationName");
  else
    return &stru_24FCE58F0;
}

- (id)uiControllerRealm:(id)a3
{
  return (id)-[ACFMessage realm](-[ACC2SVController authRequest](self, "authRequest", a3), "realm");
}

- (ACC2SVControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACC2SVControllerDelegate *)a3;
}

- (ACC2SVAuthenticationUIControllerProtocol)secondFactorAuthUIController
{
  return self->_secondFactorAuthUIController;
}

- (ACFMessage)authRequest
{
  return self->_authRequest;
}

- (void)setAuthRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (ACC2SVTrustedDeviceObject)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ACC2SVTransportControllerProtocol)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
