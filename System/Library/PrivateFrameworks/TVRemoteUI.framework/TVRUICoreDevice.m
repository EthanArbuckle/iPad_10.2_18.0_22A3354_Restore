@implementation TVRUICoreDevice

- (id)_initWithDeviceIdentifier:(id)a3
{
  id v4;
  TVRUICoreDevice *v5;
  uint64_t v6;
  TVRCDevice *device;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRUICoreDevice;
  v5 = -[TVRUICoreDevice init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEB4078]), "initWithDeviceIdentifier:", v4);
    device = v5->_device;
    v5->_device = (TVRCDevice *)v6;

  }
  return v5;
}

- (id)_initWithCoreDevice:(id)a3
{
  id v5;
  TVRUICoreDevice *v6;
  id *p_isa;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRUICoreDevice;
  v6 = -[TVRUICoreDevice init](&v10, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    if (objc_msgSend(p_isa[3], "connectionState") == 2)
    {
      objc_msgSend(p_isa[3], "keyboardController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", p_isa);

    }
  }

  return p_isa;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUICoreDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[TVRUICoreDevice model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("model"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICoreDevice supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries"), CFSTR("supportsDirectCaptionQueries"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICoreDevice supportsFindMyRemote](self, "supportsFindMyRemote"), CFSTR("supportsFindMyRemote"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICoreDevice isConnected](self, "isConnected"), CFSTR("isConnected"));
  -[TVRUICoreDevice device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "classification");
  TVRCDeviceClassificationDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("classification"));

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)model
{
  return (id)-[TVRCDevice model](self->_device, "model");
}

- (id)name
{
  return (id)-[TVRCDevice name](self->_device, "name");
}

- (id)debugName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[TVRCDevice classification](self->_device, "classification"))
  {
    -[TVRCDevice classification](self->_device, "classification");
    TVRCDeviceClassificationDescription();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[TVRCDevice name](self->_device, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TVRUICoreDevice name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)identifier
{
  return (id)-[TVRCDevice identifier](self->_device, "identifier");
}

- (BOOL)supportsTouchEvents
{
  return -[TVRCDevice supportsTouchEvents](self->_device, "supportsTouchEvents");
}

- (BOOL)isModernAppleTV
{
  return -[TVRCDevice connectionType](self->_device, "connectionType") == 1;
}

- (BOOL)isLegacyAppleTV
{
  return -[TVRCDevice connectionType](self->_device, "connectionType") == 3;
}

- (BOOL)supportsDonatingIntents
{
  return -[TVRCDevice connectionType](self->_device, "connectionType") == 1;
}

- (BOOL)supportsDirectCaptionQueries
{
  return -[TVRCDevice supportsDirectCaptionQueries](self->_device, "supportsDirectCaptionQueries");
}

- (BOOL)supportsFindMyRemote
{
  return -[TVRCDevice supportsFindMyRemote](self->_device, "supportsFindMyRemote");
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return (TVRCSiriRemoteInfo *)-[TVRCDevice pairedRemoteInfo](self->_device, "pairedRemoteInfo");
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return (TVRCNowPlayingInfo *)-[TVRCDevice nowPlayingInfo](self->_device, "nowPlayingInfo");
}

- (int64_t)classification
{
  return -[TVRCDevice classification](self->_device, "classification");
}

- (BOOL)hasIdentifier:(id)a3
{
  return -[TVRCDevice containsIdentifier:](self->_device, "containsIdentifier:", a3);
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TVRUICoreDevice device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToDevice:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TVRUICoreDevice *v4;
  TVRUICoreDevice *v5;
  BOOL v6;

  v4 = (TVRUICoreDevice *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TVRUICoreDevice isEqualToDevice:](self, "isEqualToDevice:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TVRUICoreDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (int64_t)_coreButtonTypeForButton:(int64_t)a3
{
  return a3;
}

+ (int64_t)_coreButtonEventTypeForEventType:(int64_t)a3
{
  return a3;
}

+ (int64_t)_uiButtonTypeFromCore:(int64_t)a3
{
  return a3;
}

- (void)sendButtonEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRUICoreDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v4, "buttonType") == 9998)
    {
      v6 = objc_alloc(MEMORY[0x24BEB4068]);
      v20 = *MEMORY[0x24BEB4100];
      v21[0] = CFSTR("com.apple.TVSearch");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "_initWithButtonType:hasTapAction:properties:", 20, 1, v7);

      -[TVRUICoreDevice device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB4070], "buttonEventForButton:eventType:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendButtonEvent:", v10);

      _TVRUIViewControllerLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "#search - sent search tap action", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      v12 = +[TVRUICoreDevice _coreButtonEventTypeForEventType:](TVRUICoreDevice, "_coreButtonEventTypeForEventType:", objc_msgSend(v4, "eventType"));
      -[TVRUICoreDevice coreButtons](self, "coreButtons");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "buttonType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v15 = +[TVRUICoreDevice _coreButtonTypeForButton:](TVRUICoreDevice, "_coreButtonTypeForButton:", objc_msgSend(v4, "buttonType"));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4068]), "_initWithButtonType:", v15);
        _TVRUIViewControllerLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "UI did not find a core button instance. creating one for UI event %@", (uint8_t *)&v18, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x24BEB4070], "buttonEventForButton:eventType:", v8, v12);
      v11 = objc_claimAutoreleasedReturnValue();
      -[TVRUICoreDevice device](self, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendButtonEvent:", v11);

    }
  }

}

- (void)sendTouchEvent:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEB40D8]);
    objc_msgSend(v14, "timestamp");
    v7 = v6;
    v8 = objc_msgSend(v14, "fingerIndex");
    v9 = -[TVRUICoreDevice _tvrcTouchPhaseFromUITouchPhase:](self, "_tvrcTouchPhaseFromUITouchPhase:", objc_msgSend(v14, "touchPhase"));
    objc_msgSend(v14, "digitizerLocation");
    v12 = (void *)objc_msgSend(v5, "_initWithTimestamp:finger:phase:digitizerLocation:", v8, v9, v7, v10, v11);
    -[TVRUICoreDevice device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendTouchEvent:", v12);

  }
}

- (void)sendText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    -[TVRUICoreDevice device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
}

- (void)sendReturnKey
{
  void *v3;
  void *v4;
  id v5;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUICoreDevice device](self, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendReturnKey");

  }
}

- (void)sendTextInputPayload:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUICoreDevice device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sendRTIDataPayload:", v6);

  }
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TVRUICoreDevice device](self, "device");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TVRUICoreDevice device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVRUICoreDevice device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fetchUpNextInfoWithPaginationToken:completion:", v12, v6);

    }
  }

}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TVRUICoreDevice device](self, "device");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TVRUICoreDevice device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVRUICoreDevice device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "markAsWatchedWithMediaIdentifier:completion:", v12, v6);

    }
  }

}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TVRUICoreDevice device](self, "device");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TVRUICoreDevice device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVRUICoreDevice device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeItemWithMediaIdentifier:completion:", v12, v6);

    }
  }

}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TVRUICoreDevice device](self, "device");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TVRUICoreDevice device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVRUICoreDevice device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playItem:completion:", v12, v6);

    }
  }

}

- (id)keyboardAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUICoreDevice device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)currentText
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUICoreDevice device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24DE30718;
  }
  return v6;
}

- (void)sendAuthenticationCode:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TVRUICoreDevice device](self, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUICoreDevice currentChallenge](self, "currentChallenge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TVRUICoreDevice currentChallenge](self, "currentChallenge");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userEnteredCodeLocally:", v8);

    }
  }

}

- (void)cancelAuthenitcationChallenge
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUICoreDevice currentChallenge](self, "currentChallenge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUICoreDevice device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "ui device cancelling auth challenge %@ for device %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[TVRUICoreDevice device](self, "device");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[TVRUICoreDevice currentChallenge](self, "currentChallenge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TVRUICoreDevice currentChallenge](self, "currentChallenge");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancel");

      -[TVRUICoreDevice setCurrentChallenge:](self, "setCurrentChallenge:", 0);
      -[TVRUICoreDevice setConnecting:](self, "setConnecting:", 0);
    }
  }
}

- (int64_t)_tvrcTouchPhaseFromUITouchPhase:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return qword_21B0F79C8[a3];
}

- (BOOL)isPaired
{
  void *v3;
  void *v4;
  char v5;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPaired");

  return v5;
}

- (void)connect
{
  -[TVRUICoreDevice connectWithConnectionContext:](self, "connectWithConnectionContext:", 0);
}

- (void)connectWithConnectionContext:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[TVRUICoreDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "UI requesting deviceConnect on core device", v9, 2u);
    }

    -[TVRUICoreDevice device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[TVRUICoreDevice device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connectWithConnectionContext:", a3);

    -[TVRUICoreDevice setConnecting:](self, "setConnecting:", 1);
  }
}

- (void)disconnectSystemInitiated
{
  -[TVRUICoreDevice _disconnectWithType:](self, "_disconnectWithType:", 1);
}

- (void)disconnectUserInitiated
{
  -[TVRUICoreDevice _disconnectWithType:](self, "_disconnectWithType:", 0);
}

- (void)disconnectWithTimeOut
{
  void *v3;
  void *v4;
  void *v5;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUICoreDevice device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logConnectionStatus:type:reason:", 3, objc_msgSend(v5, "connectionType"), -1);

    -[TVRUICoreDevice disconnectUserInitiated](self, "disconnectUserInitiated");
  }
}

- (void)_disconnectWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TVRUICoreDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRUICoreDevice cancelAuthenitcationChallenge](self, "cancelAuthenitcationChallenge");
    -[TVRUICoreDevice device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disconnectWithType:", a3);

    -[TVRUICoreDevice setConnecting:](self, "setConnecting:", 0);
    -[TVRUICoreDevice device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    -[TVRUICoreDevice device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyboardController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", 0);

    self->_supportsLaunchingApplications = 0;
    *(_DWORD *)&self->_supportsSiri = 0;
    self->_supportsPaging = 0;
    _TVRUIViewControllerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "UI requesting disconnect with type %ld", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (BOOL)isConnected
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connectionState") == 2;

  return v5;
}

- (BOOL)isConnecting
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connectionState") == 1 || self->_connecting;

  return v5;
}

- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  TVRUICoreDevice *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  _BYTE v26[10];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 67109376;
    *(_DWORD *)v26 = objc_msgSend(v5, "challengeAttributes") == 1;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = objc_msgSend(v5, "challengeAttributes") == 2;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "tvrui deviceEncounteredAuthChallenge pin=%d text=%d", (uint8_t *)&v25, 0xEu);
  }

  if (objc_msgSend(v5, "throttleSeconds") < 0)
  {
    -[TVRUICoreDevice setCurrentChallenge:](self, "setCurrentChallenge:", v5);
    -[TVRUICoreDevice delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_17;
    v16 = (void *)v15;
    -[TVRUICoreDevice delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_17;
    if (objc_msgSend(v5, "challengeAttributes") == 1)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      v20 = self;
      v21 = 0;
    }
    else
    {
      if (objc_msgSend(v5, "challengeAttributes") != 2)
      {
        if (objc_msgSend(v5, "challengeType") == 1)
        {
          objc_msgSend(v5, "codeToEnterOnDevice");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23 == 4)
          {
            -[TVRUICoreDevice delegate](self, "delegate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "codeToEnterOnDevice");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "deviceDidEncounterAuthenticationChallenge:passwordType:passcode:", self, 2, v24);

            goto LABEL_16;
          }
        }
        goto LABEL_17;
      }
      -[TVRUICoreDevice delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      v20 = self;
      v21 = 1;
    }
    objc_msgSend(v19, "deviceDidEncounterAuthenticationChallenge:passwordType:passcode:", v20, v21, 0);
    goto LABEL_16;
  }
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "throttleSeconds");
    -[TVRUICoreDevice delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 134218242;
    *(_QWORD *)v26 = v8;
    *(_WORD *)&v26[8] = 2112;
    v27 = v9;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "tvrui encountered a throttle challenge for %ld seconds. sending to delegate %@", (uint8_t *)&v25, 0x16u);

  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[TVRUICoreDevice delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "device:didEncounterAuthenticationThrottle:", self, objc_msgSend(v5, "throttleSeconds"));
LABEL_16:

    }
  }
LABEL_17:

}

- (void)deviceBeganConnecting:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "deviceBeganConnecting %@", (uint8_t *)&v11, 0xCu);
  }

  -[TVRUICoreDevice setConnecting:](self, "setConnecting:", 1);
  -[TVRUICoreDevice delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[TVRUICoreDevice delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deviceBeganConnecting:", self);

    }
  }

}

- (void)deviceConnected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "deviceConnected %@", (uint8_t *)&v19, 0xCu);
  }

  -[TVRUICoreDevice setDevice:](self, "setDevice:", v4);
  -[TVRUICoreDevice device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[TVRUICoreDevice currentChallenge](self, "currentChallenge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[TVRUICoreDevice setCurrentChallenge:](self, "setCurrentChallenge:", 0);
  v9 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v4, "supportedButtons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUICoreDevice setCoreButtons:](self, "setCoreButtons:", v11);

  objc_msgSend(v4, "supportedButtons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUICoreDevice _processButtonsForFeatureAdditions:](self, "_processButtonsForFeatureAdditions:", v12);

  -[TVRUICoreDevice delegate](self, "delegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[TVRUICoreDevice delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deviceDidConnect:", self);

    }
  }
  -[TVRUICoreDevice setConnecting:](self, "setConnecting:", 0);
  objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logConnectionStatus:type:reason:", 2, objc_msgSend(v4, "connectionType"), -1);

}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _TVRUIViewControllerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUICoreDevice delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413058;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "UIDevice: deviceDisconnected device=%@, reason=%ld, error=%@. Sending to delegate %@", (uint8_t *)&v21, 0x2Au);

  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[TVRUICoreDevice delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceDidDisconnect:reason:error:", self, -[TVRUICoreDevice _disconnectReasonFromCoreReason:](self, "_disconnectReasonFromCoreReason:", a4), v9);

    }
  }
  -[TVRUICoreDevice setConnecting:](self, "setConnecting:", 0);
  if (a4 && v9)
  {
    objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logConnectionStatus:type:reason:", 1, objc_msgSend(v8, "connectionType"), a4);

  }
  -[TVRUICoreDevice device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", 0);

  -[TVRUICoreDevice device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyboardController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", 0);

}

- (int64_t)_disconnectReasonFromCoreReason:(int64_t)a3
{
  return a3;
}

- (void)device:(id)a3 removedSupportedButtons:(id)a4 added:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _TVRUIButtonLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v8;
    v52 = 2114;
    v53 = v9;
    _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ added %{public}@", buf, 0x16u);
  }
  v32 = v9;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v34 = v7;
  objc_msgSend(v7, "supportedButtons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        _TVRUIButtonLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v16;
          _os_log_impl(&dword_21B042000, v17, OS_LOG_TYPE_DEFAULT, "Supported %{public}@", buf, 0xCu);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v13);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        _TVRUIButtonLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v23;
          _os_log_impl(&dword_21B042000, v24, OS_LOG_TYPE_DEFAULT, "Removed %{public}@", buf, 0xCu);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v20);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v32;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        _TVRUIButtonLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v30;
          _os_log_impl(&dword_21B042000, v31, OS_LOG_TYPE_DEFAULT, "Added %{public}@", buf, 0xCu);
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v27);
  }

  -[TVRUICoreDevice _processButtonsForFeatureRemovals:](self, "_processButtonsForFeatureRemovals:", v18);
  -[TVRUICoreDevice _processButtonsForFeatureAdditions:](self, "_processButtonsForFeatureAdditions:", v25);

}

- (void)_processButtonsForFeatureAdditions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v6)
  {
    v7 = v6;
    v36 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v12 = +[TVRUICoreDevice _uiButtonTypeFromCore:](TVRUICoreDevice, "_uiButtonTypeFromCore:", objc_msgSend(v11, "buttonType", v36));
        if (-[TVRUICoreDevice _isMediaButton:](self, "_isMediaButton:", v11))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v13);

          v8 = 1;
        }
        else if (-[TVRUICoreDevice _isVolumeButton:](self, "_isVolumeButton:", v11))
        {
          HIDWORD(v37) = 1;
          self->_supportsVolumeControl = 1;
        }
        else if (-[TVRUICoreDevice _isLaunchApplicationButton:](self, "_isLaunchApplicationButton:", v11))
        {
          self->_supportsLaunchingApplications = 1;
        }
        else if (-[TVRUICoreDevice _isCaptionsToggleButton:](self, "_isCaptionsToggleButton:", v11))
        {
          self->_supportsCaptionsToggle = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 17)
        {
          self->_captionsEnabled = 0;
          LODWORD(v37) = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 18)
        {
          LODWORD(v37) = 1;
          self->_captionsEnabled = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 4)
        {
          self->_supportsSiri = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 30)
        {
          self->_supportsPower = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 28)
        {
          self->_supportsGuide = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 29)
        {
          self->_supportsMute = 1;
        }
        else if (objc_msgSend(v11, "buttonType") == 26 || objc_msgSend(v11, "buttonType") == 27)
        {
          self->_supportsPaging = 1;
        }
        -[TVRUICoreDevice coreButtons](self, "coreButtons", v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v15);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v7);

    -[TVRUICoreDevice _notifyDelegateForSiriAndVolume](self, "_notifyDelegateForSiriAndVolume");
    if ((v8 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[TVRUICoreDevice delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0)
        {
          -[TVRUICoreDevice delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "device:needsMediaControls:", self, v38);

        }
      }
    }
    if ((v36 & 0x100000000) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        -[TVRUICoreDevice delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_opt_respondsToSelector();

        if ((v24 & 1) != 0)
        {
          -[TVRUICoreDevice delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "device:supportsVolumeControl:", self, 1);

        }
      }
    }
    if ((v36 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        -[TVRUICoreDevice delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_opt_respondsToSelector();

        if ((v29 & 1) != 0)
        {
          -[TVRUICoreDevice delegate](self, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "device:hasCaptionsEnabled:", self, self->_captionsEnabled);

        }
      }
    }
  }
  else
  {

    -[TVRUICoreDevice _notifyDelegateForSiriAndVolume](self, "_notifyDelegateForSiriAndVolume");
  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[TVRUICoreDevice delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_respondsToSelector();

    if ((v34 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "device:hasGuideButtonEnabled:", self, self->_supportsGuide);

    }
  }

}

- (void)_processButtonsForFeatureRemovals:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v7 = v5;
  if (!v6)
    goto LABEL_22;
  v8 = v6;
  v31 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      v13 = +[TVRUICoreDevice _uiButtonTypeFromCore:](TVRUICoreDevice, "_uiButtonTypeFromCore:", objc_msgSend(v12, "buttonType"));
      if (-[TVRUICoreDevice _isMediaButton:](self, "_isMediaButton:", v12))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v14);

        v9 = 1;
      }
      else if (-[TVRUICoreDevice _isVolumeControlButton:](self, "_isVolumeControlButton:", v12))
      {
        self->_supportsVolumeControl = 0;
        self->_supportsMute = 0;
        v31 = 1;
      }
      else if (objc_msgSend(v12, "buttonType") == 28)
      {
        self->_supportsGuide = 0;
      }
      -[TVRUICoreDevice coreButtons](self, "coreButtons");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v16);

    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
  {
    -[TVRUICoreDevice delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[TVRUICoreDevice delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        -[TVRUICoreDevice delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "device:hidesMediaControls:", self, v32);

      }
    }
  }
  if ((v31 & 1) != 0)
  {
    -[TVRUICoreDevice delegate](self, "delegate");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[TVRUICoreDevice delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        -[TVRUICoreDevice delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "device:supportsVolumeControl:", self, 0);
LABEL_22:

      }
    }
  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[TVRUICoreDevice delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "device:hasGuideButtonEnabled:", self, self->_supportsGuide);

    }
  }

}

- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v4;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Find My Remote state enabled: %d", (uint8_t *)v12, 8u);
  }

  -[TVRUICoreDevice delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TVRUICoreDevice delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "device:supportsFindMyRemote:", self, v4);

    }
  }
}

- (void)device:(id)a3 updatedNowPlayingInfo:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Now playing info changed: %@", (uint8_t *)&v12, 0xCu);
  }

  -[TVRUICoreDevice delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TVRUICoreDevice delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "device:didUpdateNowPlayingInfo:", self, v5);

    }
  }

}

- (void)device:(id)a3 updatedSiriRemoteFindingSessionState:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 < 7 && ((0x77u >> a4) & 1) != 0)
    {
      v9 = off_24DE2CB98[a4];
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Unknown %@"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Siri Remote finding session state changed to: %{public}@", buf, 0xCu);

  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[TVRUICoreDevice delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[TVRUICoreDevice delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "device:didUpdateSiriRemoteFindingSessionState:", self, a4);

    }
  }
}

- (void)device:(id)a3 updatedAttentionState:(int64_t)a4
{
  NSObject *v5;
  __CFString *v6;
  uint8_t buf[4];
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), a4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24DE2CBD0[a4 - 1];
    }
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Attention state was updated to: %{public}@", buf, 0xCu);

  }
}

- (void)_notifyDelegateForSiriAndVolume
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[TVRUICoreDevice delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[TVRUICoreDevice delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[TVRUICoreDevice device](self, "device", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "supportedButtons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = 0;
        v13 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v8);
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "buttonType");
            if ((unint64_t)(v15 - 10) < 2 || v15 == 29)
            {
              v12 = 1;
            }
            else if (v15 == 4)
            {
              v11 = 1;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }
      else
      {
        v11 = 0;
        v12 = 0;
      }

      if ((v11 & 1) != 0 || (v12 & 1) != 0)
      {
        -[TVRUICoreDevice delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "device:supportsSiri:volumeControl:", self, v11 & 1, v12 & 1);

      }
    }
  }
}

- (BOOL)_isVolumeButton:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "buttonType") == 10 || objc_msgSend(v3, "buttonType") == 11;

  return v4;
}

- (BOOL)_isLaunchApplicationButton:(id)a3
{
  return objc_msgSend(a3, "buttonType") == 20;
}

- (BOOL)_isCaptionsToggleButton:(id)a3
{
  return objc_msgSend(a3, "buttonType") == 16;
}

- (BOOL)_isMediaButton:(id)a3
{
  return (objc_msgSend(a3, "buttonType") & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (BOOL)_isVolumeControlButton:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "buttonType") == 10
    || objc_msgSend(v3, "buttonType") == 11
    || objc_msgSend(v3, "buttonType") == 29;

  return v4;
}

- (void)keyboardController:(id)a3 beganTextEditingWithAttributes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUICoreDevice identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Started text editing for %@", (uint8_t *)&v13, 0xCu);

  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUICoreDevice delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device:beganTextEditingWithAttributes:initialText:", self, v7, v11);

  }
}

- (void)keyboardControllerEndedTextEditing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUICoreDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Ended text editing for %@", (uint8_t *)&v11, 0xCu);

  }
  -[TVRUICoreDevice delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUICoreDevice delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device:endedTextEditingWithAttributes:endingText:", self, v10, v8);

  }
}

- (void)keyboardController:(id)a3 didUpdateText:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Text updated with value %@", (uint8_t *)&v9, 0xCu);
  }

  -[TVRUICoreDevice delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TVRUICoreDevice delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device:didUpdateText:", self, v5);

  }
}

- (void)keyboardController:(id)a3 didUpdateAttributes:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Keyboard attributes attributed ", v9, 2u);
  }

  -[TVRUICoreDevice delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TVRUICoreDevice delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device:didUpdateAttributes:", self, v5);

  }
}

- (id)deviceContextInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[TVRUICoreDevice device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x24BDBD1B8];
  -[TVRUICoreDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionType");
  TVRCDeviceConnectionTypeDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return MEMORY[0x24BDBD1B8];
  v8 = CFSTR("connectionType");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)supportsModernConnections
{
  void *v2;
  void *v3;
  char v4;

  -[TVRUICoreDevice deviceContextInformation](self, "deviceContextInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("connectionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Rapport"));

  return v4;
}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  -[TVRUICoreDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("stop showing");
      if (v3)
        v7 = CFSTR("show");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "UI requesting to %@ TVRemote app on lock screen", (uint8_t *)&v9, 0xCu);
    }

    -[TVRUICoreDevice device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enableTVRemoteOnLockscreen:", v3);

  }
}

- (void)enableFindingSession:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  -[TVRUICoreDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("disable");
      if (v3)
        v7 = CFSTR("enable");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "UI requesting to %@ finding session", (uint8_t *)&v9, 0xCu);
    }

    -[TVRUICoreDevice device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enableFindingSession:", v3);

  }
}

- (TVRCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (TVRUIDeviceDelegate)delegate
{
  return (TVRUIDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRCDeviceAuthenticationChallenge)currentChallenge
{
  return self->_currentChallenge;
}

- (void)setCurrentChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_currentChallenge, a3);
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (BOOL)supportsLaunchingApplications
{
  return self->_supportsLaunchingApplications;
}

- (BOOL)supportsCaptionsToggle
{
  return self->_supportsCaptionsToggle;
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (BOOL)supportsMute
{
  return self->_supportsMute;
}

- (BOOL)supportsPower
{
  return self->_supportsPower;
}

- (BOOL)supportsGuide
{
  return self->_supportsGuide;
}

- (BOOL)supportsPaging
{
  return self->_supportsPaging;
}

- (BOOL)captionsEnabled
{
  return self->_captionsEnabled;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (NSMutableDictionary)coreButtons
{
  return self->_coreButtons;
}

- (void)setCoreButtons:(id)a3
{
  objc_storeStrong((id *)&self->_coreButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreButtons, 0);
  objc_storeStrong((id *)&self->_currentChallenge, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
