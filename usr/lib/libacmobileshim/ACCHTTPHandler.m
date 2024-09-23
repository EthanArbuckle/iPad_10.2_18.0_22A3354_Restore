@implementation ACCHTTPHandler

+ (id)handlerWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", a3);
}

- (ACCHTTPHandler)initWithContext:(id)a3
{
  ACCHTTPHandler *v4;
  ACCHTTPHandler *v5;
  void *v6;
  float v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACCHTTPHandler;
  v4 = -[ACCHTTPHandler init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ACCHTTPHandler setContext:](v4, "setContext:", a3);
    -[ACFHTTPTransportProtocol setHttpMethod:](-[ACCHTTPHandler transport](v5, "transport"), "setHttpMethod:", CFSTR("POST"));
    -[ACFHTTPTransportProtocol setHttpHeader:](-[ACCHTTPHandler transport](v5, "transport"), "setHttpHeader:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("text/x-xml-plist"), CFSTR("Content-Type"), 0));
    -[ACFHTTPTransportProtocol setServerHosts:](-[ACCHTTPHandler transport](v5, "transport"), "setServerHosts:", -[ACCHTTPHandler serverHosts](v5, "serverHosts"));
    -[ACFHTTPTransportProtocol setServerAttemptsDelays:](-[ACCHTTPHandler transport](v5, "transport"), "setServerAttemptsDelays:", -[ACCHTTPHandler serverAttemptsDelays](v5, "serverAttemptsDelays"));
    v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "request"), "serverResponseTimeout");
    if (v6)
    {
      objc_msgSend(v6, "floatValue");
      -[ACFHTTPTransportProtocol setTimeout:](-[ACCHTTPHandler transport](v5, "transport"), "setTimeout:", v7);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_cancelRequest, CFSTR("CancelRequests"), 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[ACCHTTPHandler setTransport:](self, "setTransport:", 0);
  -[ACCHTTPHandler setFinalizeBlock:](self, "setFinalizeBlock:", 0);
  -[ACCHTTPHandler setContext:](self, "setContext:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACCHTTPHandler;
  -[ACCHTTPHandler dealloc](&v3, sel_dealloc);
}

- (id)realm
{
  return (id)objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "realm");
}

- (ACFHTTPTransportProtocol)transport
{
  ACFHTTPTransportProtocol *result;
  ACFHTTPTransportProtocol *v4;
  char v5;

  result = self->_transport;
  if (!result)
  {
    v4 = (ACFHTTPTransportProtocol *)(id)objc_msgSend(+[ACFComponents components](ACFComponents, "components"), "createTransport");
    self->_transport = v4;
    v5 = -[ACFHTTPTransportProtocol conformsToProtocol:](v4, "conformsToProtocol:", &unk_255E299B0);
    result = self->_transport;
    if ((v5 & 1) == 0)
    {

      result = 0;
      self->_transport = 0;
    }
  }
  return result;
}

- (BOOL)isCanceled
{
  return -[ACFHTTPTransportProtocol isCanceled](-[ACCHTTPHandler transport](self, "transport"), "isCanceled");
}

- (NSDictionary)requestHeader
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3, CFSTR("Version"));
  return (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

- (NSDictionary)requestBody
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
}

- (NSDictionary)httpRequestDictionary
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", -[ACCHTTPHandler requestHeader](self, "requestHeader"), CFSTR("Header"), -[ACCHTTPHandler requestBody](self, "requestBody"), CFSTR("Request"), 0);
}

- (void)updateTransport
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v5 = 0;
  v3 = objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", -[ACCHTTPHandler httpRequestDictionary](self, "httpRequestDictionary"), 100, 0, &v5);
  if (v5)
    v4 = ACFLog == 0;
  else
    v4 = 1;
  if (!v4 && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACCHTTPHandler updateTransport]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 125, 0, "Error while creating request content: %@", v5);
  -[ACFHTTPTransportProtocol setHttpPOSTBody:](-[ACCHTTPHandler transport](self, "transport"), "setHttpPOSTBody:", v3);
}

- (void)performRequestWithCompletionBlock:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];
  _QWORD v7[5];

  -[ACCHTTPHandler updateTransport](self, "updateTransport");
  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke;
  v7[3] = &unk_24FCE5628;
  v7[4] = self;
  -[ACFHTTPTransportProtocol setRetryCheckBlock:](-[ACCHTTPHandler transport](self, "transport"), "setRetryCheckBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_24FCE5650;
  v6[4] = self;
  v6[5] = objc_msgSend(a3, "copy");
  -[ACFHTTPTransportProtocol performRequestWithCompletionBlock:](-[ACCHTTPHandler transport](self, "transport"), "performRequestWithCompletionBlock:", v6);
}

uint64_t __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldTryOtherServers:error:", a2, a3);
}

uint64_t __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void (**v10)(id, _QWORD);
  uint64_t v12;

  v12 = a3;
  if (a3)
  {
    v4 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
    v4 = 0;
    v12 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDD0FC8]));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "responseWithData:error:", a2, &v12);
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "shouldReturnResponse:orReportError:", v4, &v12);
  if ((_DWORD)v9)
  {
    if (v12)
      v12 = objc_msgSend(*(id *)(a1 + 32), "convertErrorToACMError:");
    v10 = (void (**)(id, _QWORD))(id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "finalizeBlock"), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setFinalizeBlock:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    if (v10)
      v10[2](v10, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateTransport");
  }
  return v9;
}

- (void)cancelRequest
{
  void (**v3)(id, ACCHTTPHandler *);

  -[ACFHTTPTransportProtocol cancelRequest](-[ACCHTTPHandler transport](self, "transport"), "cancelRequest");
  if (-[ACCHTTPHandler finalizeBlock](self, "finalizeBlock"))
  {
    v3 = (void (**)(id, ACCHTTPHandler *))(id)objc_msgSend(-[ACCHTTPHandler finalizeBlock](self, "finalizeBlock"), "copy");
    -[ACCHTTPHandler setFinalizeBlock:](self, "setFinalizeBlock:", 0);
    v3[2](v3, self);
  }
}

- (id)invalidPublicKeyErrorForReponse:(id)a3 error:(id)a4
{
  id v6;

  v6 = (id)objc_opt_new();
  if (objc_msgSend(a4, "userInfo"))
    objc_msgSend(v6, "addEntriesFromDictionary:", objc_msgSend(a4, "userInfo"));
  if (objc_msgSend(a3, "objectForKey:", CFSTR("dp")))
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("dp")), CFSTR("dp"));
  if (objc_msgSend(a3, "objectForKey:", CFSTR("t")))
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("t")), CFSTR("t"));
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", objc_msgSend(a4, "domain"), objc_msgSend(a4, "code"), (id)objc_msgSend(v6, "copy"));
}

- (id)convertErrorToACMError:(id)a3
{
  id v5;
  void *v6;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = a3;
  v6 = (void *)objc_msgSend(a3, "domain");
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ACCAppleConnectErrorDomain")) & 1) != 0)
    return v5;
  v8 = objc_msgSend(a3, "localizedFailureReason");
  v9 = (id)objc_msgSend(a3, "localizedDescription");
  v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("HTTPServerErrorDomain"));
  v11 = -200200;
  if (!v10)
  {
    v14 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD1308]))
    {
      v15 = objc_msgSend(a3, "code");
      if ((unint64_t)(v15 + 1009) <= 8)
      {
        if (((1 << (v15 - 15)) & 0x17A) != 0)
        {
          v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
          v11 = -100401;
        }
        else if (v15 == -1009)
        {
          v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("You appear to be offline. Please connect to the Internet and try again."));
          v11 = -100400;
        }
      }
    }
    return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
  }
  v12 = objc_msgSend(a3, "code");
  if (v12 <= -21094)
  {
    if (v12 <= -80004)
    {
      if ((unint64_t)(v12 + 90003) >= 4)
      {
        if (v12 != -90005)
          return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
        goto LABEL_32;
      }
      v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Can not verify token."));
      v11 = -100360;
      return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
    }
    if (v12 != -80003)
    {
      if (v12 != -21515)
      {
        if (v12 == -21096)
        {
          v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("The current time on this device seems to be incorrect. You can fix it by going to Settings > General > Date & Time, then try again."));
          v11 = -100125;
        }
        return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
      }
      goto LABEL_32;
    }
LABEL_28:
    v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Your Apple ID or password was entered incorrectly."));
    v11 = -100102;
    return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
  }
  if (v12 <= -20201)
  {
    if ((unint64_t)(v12 + 21093) < 2)
      goto LABEL_32;
    if (v12 != -20209)
    {
      v13 = -20206;
LABEL_19:
      if (v12 != v13)
        return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
      goto LABEL_28;
    }
    v11 = -100118;
    v20 = -[ACCHTTPHandler iForgotString](self, "iForgotString");
    v21 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("This Apple ID has been disabled for security reasons. You can reset your password at %@."));
    v9 = v21;
    if (!v20 || !v21)
      return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
    v22 = objc_msgSend((id)objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https://"), &stru_24FCE58F0), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_24FCE58F0);
    v16 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v22);
LABEL_38:
    v9 = v16;
    return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
  }
  if (v12 <= -20102)
  {
    if ((unint64_t)(v12 + 20105) >= 2)
    {
      v13 = -20200;
      goto LABEL_19;
    }
LABEL_32:
    v17 = -[ACCHTTPHandler iForgotString](self, "iForgotString");
    v18 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("To protect your security, it’s time to reset your password. It’s easy, just go to %@."));
    v9 = v18;
    v11 = -100104;
    if (v17)
    {
      if (v18)
      {
        v19 = objc_msgSend((id)objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https://"), &stru_24FCE58F0), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_24FCE58F0);
        v9 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v19);
        v11 = -100104;
      }
    }
    return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
  }
  if (v12 == -20101)
    goto LABEL_28;
  if (v12 == -1)
  {
    v16 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
    goto LABEL_38;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v11, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0));
}

- (id)responseWithData:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char LevelMask;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACCHTTPHandler responseWithData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 330, 0, "Converting response data to dictionary...");
  v17 = 0;
  v18 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, &v18, &v17);
  v7 = v17;
  if (v17)
  {
    if (ACFLog)
    {
      LevelMask = ACFLogSettingsGetLevelMask();
      v7 = v17;
      if ((LevelMask & 8) != 0)
      {
        ACFLog(3, (uint64_t)"-[ACCHTTPHandler responseWithData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 339, 0, "Error while creating dictionary: %@", v17);
        v7 = v17;
      }
    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = objc_msgSend(v7, "localizedDescription");
    v12 = (void *)objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -100360, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x24BDD0FC8], v17, *MEMORY[0x24BDD1398], 0));
    if (!a4)
      return v6;
LABEL_16:
    if (v12)
      *a4 = v12;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v6 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("Response"))) == 0)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Response from server is malformed"));
    v12 = (void *)objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -100360, objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x24BDD0FC8], 0));
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCHTTPHandler responseWithData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 348, 0, "Response from server is malformed or has inappropriate type: %@", 0);
    v6 = 0;
    if (a4)
      goto LABEL_16;
  }
  return v6;
}

- (BOOL)shouldReturnResponse:(id)a3 orReportError:(id *)a4
{
  ACCHTTPHandler *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v6 = self;
  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACCHTTPHandler.m"), 364, CFSTR("the error should not be nil!"));
  if (*a4)
  {
    LOBYTE(v6) = 1;
    return (char)v6;
  }
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("ec"));
  v8 = objc_msgSend(v7, "integerValue");
  if (v8 != -21074)
  {
    if (v8 == -21065 && !-[ACCHTTPHandler shouldIgnoreInvalidDSPublicKey](v6, "shouldIgnoreInvalidDSPublicKey"))
    {
      -[ACCHTTPHandler setShouldIgnoreInvalidDSPublicKey:](v6, "setShouldIgnoreInvalidDSPublicKey:", 1);
      LODWORD(v6) = !-[ACCHTTPHandler updatePublicKeyWithResponse:](v6, "updatePublicKeyWithResponse:", a3);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (-[ACCHTTPHandler shouldIgnoreInvalidToken](v6, "shouldIgnoreInvalidToken"))
  {
LABEL_10:
    LOBYTE(v6) = 1;
    goto LABEL_11;
  }
  -[ACCHTTPHandler setShouldIgnoreInvalidToken:](v6, "setShouldIgnoreInvalidToken:", 1);
  -[ACCHTTPHandler uninstallPublicKeyForRealm:](v6, "uninstallPublicKeyForRealm:", objc_msgSend((id)-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](v6, "context"), "principal"), "realm"));
  LOBYTE(v6) = 0;
LABEL_11:
  if (objc_msgSend(v7, "intValue"))
  {
    v9 = objc_msgSend(a3, "objectForKey:", CFSTR("em"));
    v10 = objc_msgSend(a3, "objectForKey:", CFSTR("ed"));
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACCHTTPHandler shouldReturnResponse:orReportError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 393, 0, "Detected error in response. Error: %@, Message: %@, Description: %@", v7, v9, v10);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = (int)objc_msgSend(v7, "intValue");
    *a4 = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("HTTPServerErrorDomain"), v12, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x24BDD0FC8], v10, *MEMORY[0x24BDD0FD8], 0));
  }
  return (char)v6;
}

- (BOOL)shouldTryOtherServers:(id)a3 error:(id)a4
{
  _BOOL4 v5;
  id v6;
  id v8;

  v8 = a4;
  if (a4)
  {
    LOBYTE(v5) = -[ACCHTTPHandler isConnectionError:](self, "isConnectionError:", a4);
  }
  else
  {
    v6 = -[ACCHTTPHandler responseWithData:error:](self, "responseWithData:error:", a3, &v8);
    if (v8 || (v5 = -[ACCHTTPHandler isUknownServerError:](self, "isUknownServerError:", v6)))
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isConnectionError:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "domain");
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1308]))
    return objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"));
  v5 = objc_msgSend(a3, "code");
  if ((unint64_t)(v5 + 1009) >= 7)
    return 0;
  else
    return (0x7Bu >> (v5 - 15)) & 1;
}

- (BOOL)isUknownServerError:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("ec")), "intValue") == -1;
}

- (BOOL)updatePublicKeyWithResponse:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("t"));
  if (objc_msgSend(v5, "length"))
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACCHTTPHandler updatePublicKeyWithResponse:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 478, 0, "New key version: %@", v5);
    }
    return -[ACCHTTPHandler installCertificateWithString:version:forRealm:](self, "installCertificateWithString:version:forRealm:", objc_msgSend(a3, "objectForKey:", CFSTR("dp")), v5, objc_msgSend((id)-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](self, "context"), "principal"), "realm"));
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACCHTTPHandler updatePublicKeyWithResponse:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 483, 0, "No new key");
    return 0;
  }
}

- (BOOL)installCertificateWithString:(id)a3 version:(id)a4 forRealm:(id)a5
{
  return objc_msgSend((id)objc_msgSend(+[ACCComponents components](ACCComponents, "components"), "ticketManager"), "installCertificateWithString:version:forRealm:", a3, a4, a5);
}

- (void)uninstallPublicKeyForRealm:(id)a3
{
  objc_msgSend((id)objc_msgSend(+[ACCComponents components](ACCComponents, "components"), "ticketManager"), "uninstallPublicKeyForRealm:", a3);
}

- (id)iForgotString
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", -[ACCHTTPHandler iForgotURL](self, "iForgotURL")), "host");
}

- (NSString)iForgotURL
{
  return 0;
}

- (NSArray)serverHosts
{
  return 0;
}

- (NSArray)serverAttemptsDelays
{
  return 0;
}

- (void)setTransport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)finalizeBlock
{
  return self->_finalizeBlock;
}

- (void)setFinalizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ACCAuthContextProtocol)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)shouldIgnoreInvalidDSPublicKey
{
  return self->_shouldIgnoreInvalidDSPublicKey;
}

- (void)setShouldIgnoreInvalidDSPublicKey:(BOOL)a3
{
  self->_shouldIgnoreInvalidDSPublicKey = a3;
}

- (BOOL)shouldIgnoreInvalidToken
{
  return self->_shouldIgnoreInvalidToken;
}

- (void)setShouldIgnoreInvalidToken:(BOOL)a3
{
  self->_shouldIgnoreInvalidToken = a3;
}

@end
