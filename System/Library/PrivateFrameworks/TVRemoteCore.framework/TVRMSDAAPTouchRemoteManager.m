@implementation TVRMSDAAPTouchRemoteManager

- (TVRMSDAAPTouchRemoteManager)initWithRequestManager:(id)a3
{
  id v5;
  TVRMSDAAPTouchRemoteManager *v6;
  TVRMSDAAPTouchRemoteManager *v7;
  TVRMSFairPlayKeyboardEncryption *v8;
  TVRMSFairPlayKeyboardEncryption *keyboardEncryption;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRMSDAAPTouchRemoteManager;
  v6 = -[TVRMSDAAPTouchRemoteManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestManager, a3);
    v8 = objc_alloc_init(TVRMSFairPlayKeyboardEncryption);
    keyboardEncryption = v7->_keyboardEncryption;
    v7->_keyboardEncryption = v8;

    *(_QWORD *)&v7->_touchDistanceMin = 0x439B333342480000;
    *(_QWORD *)&v7->_touchTimeMin = 0x3200000001;
    v7->_keyboardEditingSessionActive = 0;
  }

  return v7;
}

- (void)initiateControlWithCompletionHandler:(id)a3
{
  id v4;
  unsigned __int16 v5;
  NSObject *v6;
  int portSecret;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id buf;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_portSecret)
  {
    do
    {
      v5 = arc4random();
      self->_portSecret = v5;
    }
    while (!v5);
  }
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    portSecret = self->_portSecret;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = portSecret;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Touch remote port secret is [%d]", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__TVRMSDAAPTouchRemoteManager_initiateControlWithCompletionHandler___block_invoke;
  v9[3] = &unk_24DCD7458;
  objc_copyWeak(&v11, &buf);
  v8 = v4;
  v10 = v8;
  -[TVRMSDAAPTouchRemoteManager _requestPromptUpdate:](self, "_requestPromptUpdate:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&buf);

}

uint64_t __68__TVRMSDAAPTouchRemoteManager_initiateControlWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_createSocket");

    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "_requestKeyboardStatus");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(int)a4
{
  uint64_t v4;
  double v7;
  double v8;

  v4 = *(_QWORD *)&a4;
  -[TVRMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](self->_socket, "sendTouchCode:timeInMilliseconds:location:", 256, 0, 160.0, 228.5);
  -[TVRMSDAAPTouchRemoteManager _locationForDirection:repeatCount:](self, "_locationForDirection:repeatCount:", a3, v4);
  -[TVRMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](self->_socket, "sendTouchCode:timeInMilliseconds:location:", 257, -[TVRMSDAAPTouchRemoteManager _timeForDirection:repeatCount:](self, "_timeForDirection:repeatCount:", a3, v4), v7, v8);
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(int)a4
{
  uint64_t v4;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;

  v4 = *(_QWORD *)&a4;
  -[TVRMSDAAPTouchRemoteManager _locationForDirection:repeatCount:](self, "_locationForDirection:repeatCount:");
  v8 = v7;
  v10 = v9;
  v11 = -[TVRMSDAAPTouchRemoteManager _timeForDirection:repeatCount:](self, "_timeForDirection:repeatCount:", a3, v4);
  switch(a3)
  {
    case 0:
      v12 = -15.0;
      goto LABEL_4;
    case 1:
      v12 = 15.0;
LABEL_4:
      v8 = v8 + v12;
      break;
    case 2:
      v13 = -15.0;
      goto LABEL_7;
    case 3:
      v13 = 15.0;
LABEL_7:
      v10 = v10 + v13;
      break;
    default:
      break;
  }
  -[TVRMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](self->_socket, "sendTouchCode:timeInMilliseconds:location:", 258, v11 + 40, v8, v10);
}

- (void)sendNavigationCommand:(int64_t)a3
{
  const __CFString *v3;
  id v4;

  if ((unint64_t)(a3 - 1) > 3)
    v3 = CFSTR("menu");
  else
    v3 = off_24DCD7478[a3 - 1];
  v4 = -[TVRMSDAAPRequestManager requestControlCommand:text:promptRevision:completionHandler:](self->_requestManager, "requestControlCommand:text:promptRevision:completionHandler:", v3, 0, self->_controlPromptRevision, 0);
}

- (void)touchRemoteSocketDidDisconnect:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "touchRemoteManagerDidDisconnect:", self);

}

- (BOOL)keyboardEditingSessionActive
{
  return self->_keyboardEditingSessionActive;
}

- (id)keyboardInfo
{
  return self->_keyboardInfo;
}

- (void)clearKeyboardText
{
  -[TVRMSDAAPTouchRemoteManager setKeyboardText:](self, "setKeyboardText:", &stru_24DCDC4B0);
}

- (void)setKeyboardText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[TVRMSDAAPTouchRemoteManager _requestPromptUpdate:](self, "_requestPromptUpdate:", 0);
  -[TVRMSKeyboardInfo setText:](self->_keyboardInfo, "setText:", v7);
  if (-[TVRMSKeyboardInfo secureText](self->_keyboardInfo, "secureText"))
  {
    objc_msgSend(&stru_24DCDC4B0, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v7, "length"), CFSTR("*"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v7;
  }
  v5 = v4;
  v6 = -[TVRMSDAAPRequestManager requestControlCommand:text:data:controlValue:promptRevision:completionHandler:](self->_requestManager, "requestControlCommand:text:data:controlValue:promptRevision:completionHandler:", CFSTR("PromptUpdate"), v4, 0, self->_keyboardEditingSessionID, self->_controlPromptRevision, 0);

}

- (void)sendKeyboardReturnCommand
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  -[TVRMSDAAPTouchRemoteManager _requestPromptUpdate:](self, "_requestPromptUpdate:", 0);
  v3 = -[TVRMSKeyboardInfo secureText](self->_keyboardInfo, "secureText");
  -[TVRMSKeyboardInfo text](self->_keyboardInfo, "text");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = (id)v4;
    -[TVRMSDAAPTouchRemoteManager _encryptString:](self, "_encryptString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
  }
  else
  {
    v5 = 0;
  }
  v8 = (id)v4;
  v6 = -[TVRMSDAAPRequestManager requestControlCommand:text:data:controlValue:promptRevision:completionHandler:](self->_requestManager, "requestControlCommand:text:data:controlValue:promptRevision:completionHandler:", CFSTR("PromptDone"), v4, v5, self->_keyboardEditingSessionID, self->_controlPromptRevision, 0);

}

- (void)_createSocket
{
  TVRMSTouchRemoteSocket *v3;
  TVRMSTouchRemoteSocket *socket;
  id v5;

  -[TVRMSDAAPRequestManager hostName](self->_requestManager, "hostName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TVRMSTouchRemoteSocket initWithHost:port:encryptionKey:]([TVRMSTouchRemoteSocket alloc], "initWithHost:port:encryptionKey:", v5, self->_port, self->_encryptionKey);
  socket = self->_socket;
  self->_socket = v3;

  -[TVRMSTouchRemoteSocket setDelegate:](self->_socket, "setDelegate:", self);
  -[TVRMSTouchRemoteSocket connect](self->_socket, "connect");

}

- (void)_requestPromptUpdate:(id)a3
{
  id v4;
  TVRMSDAAPRequestManager *requestManager;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  requestManager = self->_requestManager;
  v12 = CFSTR("prompt-id");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_controlPromptRevision);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__TVRMSDAAPTouchRemoteManager__requestPromptUpdate___block_invoke;
  v10[3] = &unk_24DCD7168;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  v9 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", CFSTR("controlpromptupdate"), CFSTR("GET"), 0, v7, v10);

}

void __52__TVRMSDAAPTouchRemoteManager__requestPromptUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 == 1)
    goto LABEL_4;
  if (a2 == -3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestPromptUpdate:", *(_QWORD *)(a1 + 40));
LABEL_4:
    +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v7, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = _controlPromptMessageTypeForItems(v8);
      _TVRCRMSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Control prompt items: %@", (uint8_t *)&v13, 0xCu);
      }

      if (v9 >= 3)
      {
        if (v9 == 4)
        {
          objc_msgSend(*(id *)(a1 + 32), "_processAuthenticationUpdateForItems:", v8);
        }
        else if (v9 == 5)
        {
          objc_msgSend(*(id *)(a1 + 32), "_parsePortInfoItems:", v8);
          v12 = *(_QWORD *)(a1 + 40);
          if (v12)
            (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_requestPortInfo");
          objc_msgSend(*(id *)(a1 + 32), "_requestPromptUpdate:", *(_QWORD *)(a1 + 40));
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_processKeyboardMessageItems:", v8);
      }
    }

    goto LABEL_18;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
LABEL_18:

}

- (void)_parsePortInfoItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int *p_port;
  int *p_encryptionKey;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    p_encryptionKey = &self->_encryptionKey;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"), p_encryptionKey);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        p_port = &self->_port;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("kKeybMsgKey_String")) & 1) != 0
          || (p_port = p_encryptionKey, objc_msgSend(v9, "isEqualToString:", CFSTR("kKeybMsgKey_SubText"))))
        {
          *p_port = self->_portSecret ^ objc_msgSend(v10, "intValue");
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)_requestPortInfo
{
  void *v3;
  uint64_t portSecret;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  portSecret = self->_portSecret;
  -[TVRMSDAAPRequestManager pairingGUID](self->_requestManager, "pairingGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%d,%@"), portSecret, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[TVRMSDAAPRequestManager requestControlCommand:text:promptRevision:completionHandler:](self->_requestManager, "requestControlCommand:text:promptRevision:completionHandler:", CFSTR("DRPortInfoRequest"), v7, self->_controlPromptRevision, 0);
}

- (unsigned)_timeForDirection:(int64_t)a3 repeatCount:(int)a4
{
  float v4;
  float v5;

  v4 = (double)a4 * 6.0;
  v5 = (float)self->_touchTimeMax - (float)(v4 * v4);
  if (v5 <= (float)self->_touchTimeMin)
    return (float)self->_touchTimeMin;
  return v5;
}

- (CGPoint)_locationForDirection:(int64_t)a3 repeatCount:(int)a4
{
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  float v9;
  CGPoint result;

  v4 = 12.0;
  if (a4 == 2)
    v4 = 16.0;
  if (a4 > 2)
    v4 = 23.0;
  v5 = fminf(self->_touchDistanceMax, (float)(v4 * (float)a4) + self->_touchDistanceMin);
  switch(a3)
  {
    case 0:
      v6 = 160.0 - v5;
      goto LABEL_9;
    case 1:
      v6 = v5 + 160.0;
LABEL_9:
      v8 = v6 + 0.5;
      v7 = 228.0;
      break;
    case 2:
      v9 = 228.0 - v5;
      goto LABEL_12;
    case 3:
      v9 = v5 + 228.0;
LABEL_12:
      v7 = v9;
      v8 = 160.0;
      break;
    default:
      v7 = 0.0;
      v8 = 0.0;
      break;
  }
  result.y = v7;
  result.x = v8;
  return result;
}

- (void)_requestKeyboardStatus
{
  id v3;

  -[TVRMSDAAPTouchRemoteManager _requestPromptUpdate:](self, "_requestPromptUpdate:", 0);
  v3 = -[TVRMSDAAPRequestManager requestControlCommand:text:promptRevision:completionHandler:](self->_requestManager, "requestControlCommand:text:promptRevision:completionHandler:", CFSTR("PromptResendReq"), 0, self->_controlPromptRevision, 0);
}

- (void)_processKeyboardMessageItems:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  TVRMSKeyboardInfo *v9;
  TVRMSKeyboardInfo *keyboardInfo;
  void *v11;
  TVRMSKeyboardInfo *v12;
  TVRMSKeyboardInfo *v13;
  TVRMSKeyboardInfo *v14;
  id v15;

  v15 = a3;
  -[TVRMSDAAPTouchRemoteManager _requestPromptUpdate:](self, "_requestPromptUpdate:", 0);
  _controlPromptKeyValueForItems(CFSTR("challenge"), v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    -[TVRMSFairPlayKeyboardEncryption setChallengeString:](self->_keyboardEncryption, "setChallengeString:", v4);
  _controlPromptKeyValueForItems(CFSTR("certificate"), v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    -[TVRMSFairPlayKeyboardEncryption setLeafString:](self->_keyboardEncryption, "setLeafString:", v5);
  v6 = _controlPromptMessageTypeForItems(v15);
  _controlPromptKeyValueForItems(CFSTR("kKeybMsgKey_SessionID"), v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (self->_keyboardEditingSessionActive && !v6)
  {
    if (self->_keyboardEditingSessionID != v8)
    {
      self->_keyboardEditingSessionID = v8;
LABEL_12:
      self->_keyboardEditingSessionActive = 1;
      v9 = -[TVRMSKeyboardInfo initWithItemsArray:]([TVRMSKeyboardInfo alloc], "initWithItemsArray:", v15);
      keyboardInfo = self->_keyboardInfo;
      self->_keyboardInfo = v9;

      -[TVRMSDAAPTouchRemoteManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "touchRemoteManagerKeyboardEditingSessionDidBegin:", self);
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:
    self->_keyboardEditingSessionActive = 1;
    v12 = -[TVRMSKeyboardInfo initWithItemsArray:]([TVRMSKeyboardInfo alloc], "initWithItemsArray:", v15);
    v13 = self->_keyboardInfo;
    self->_keyboardInfo = v12;

    -[TVRMSDAAPTouchRemoteManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "touchRemoteManagerKeyboardEditingSessionDidUpdate:", self);
    goto LABEL_15;
  }
  self->_keyboardEditingSessionID = v8;
  switch(v6)
  {
    case 2:
      self->_keyboardEditingSessionActive = 0;
      v14 = self->_keyboardInfo;
      self->_keyboardInfo = 0;

      -[TVRMSDAAPTouchRemoteManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "touchRemoteManagerKeyboardEditingSessionDidEnd:", self);
      goto LABEL_15;
    case 1:
      goto LABEL_13;
    case 0:
      goto LABEL_12;
  }
LABEL_16:

}

- (void)_processAuthenticationUpdateForItems:(id)a3
{
  TVRMSKeyboardInfo *keyboardInfo;
  void *v5;

  if (self->_keyboardEditingSessionActive)
  {
    self->_keyboardEditingSessionActive = 0;
    keyboardInfo = self->_keyboardInfo;
    self->_keyboardInfo = 0;

    -[TVRMSDAAPTouchRemoteManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "touchRemoteManagerKeyboardEditingSessionDidEnd:", self);

  }
  -[TVRMSDAAPTouchRemoteManager _requestPromptUpdate:](self, "_requestPromptUpdate:", 0);
}

- (id)_encryptString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && -[TVRMSFairPlayKeyboardEncryption isTrusted](self->_keyboardEncryption, "isTrusted"))
  {
    -[TVRMSFairPlayKeyboardEncryption encryptString:](self->_keyboardEncryption, "encryptString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TVRMSDAAPTouchRemoteManagerDelegate)delegate
{
  return (TVRMSDAAPTouchRemoteManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardInfo, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_keyboardEncryption, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end
