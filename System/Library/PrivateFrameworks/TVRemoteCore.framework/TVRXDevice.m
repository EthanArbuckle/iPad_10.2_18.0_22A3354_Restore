@implementation TVRXDevice

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRXDevice;
  return -[TVRXDevice init](&v3, sel_init);
}

- (void)sendButtonEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  if (v5)
    -[_TVRCDeviceImpl sendButtonEvent:](self->_impl, "sendButtonEvent:", v6);

}

- (void)sendTouchEvent:(id)a3
{
  -[_TVRCDeviceImpl sendTouchEvent:](self->_impl, "sendTouchEvent:", a3);
}

- (void)sendGameControllerEvent:(id)a3
{
  -[_TVRCDeviceImpl sendGameControllerEvent:](self->_impl, "sendGameControllerEvent:", a3);
}

- (TVRXKeyboardController)keyboardController
{
  return (TVRXKeyboardController *)-[_TVRCDeviceImpl keyboardController](self->_impl, "keyboardController");
}

- (unint64_t)pairingCapability
{
  return -[_TVRCDeviceImpl pairingCapability](self->_impl, "pairingCapability");
}

- (BOOL)supportsDirectCaptionQueries
{
  return -[_TVRCDeviceImpl supportsDirectCaptionQueries](self->_impl, "supportsDirectCaptionQueries");
}

- (BOOL)supportsFindMyRemote
{
  return -[_TVRCDeviceImpl supportsFindMyRemote](self->_impl, "supportsFindMyRemote");
}

- (BOOL)supportsTouchEvents
{
  return -[_TVRCDeviceImpl supportsTouchEvents](self->_impl, "supportsTouchEvents");
}

- (BOOL)paired
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[_TVRCDeviceImpl isPaired](self->_impl, "isPaired");
  else
    return 0;
}

- (void)connect
{
  NSObject *v3;
  NSObject *v4;
  int64_t connectionState;
  _BOOL8 v6;
  NSObject *v7;
  id WeakRetained;
  char v9;
  NSObject *v10;
  id v11;
  int v12;
  TVRXDevice *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> was asked to connect.", (uint8_t *)&v12, 0xCu);
  }

  if (self->_connectionState)
  {
    _TVRCGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connectionState = self->_connectionState;
      v12 = 134218240;
      v13 = self;
      v14 = 2048;
      v15 = connectionState;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is not in the disconnected state, ignoring connect request. Current state is %ld", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    v6 = -[TVRXDevice _authenticationIsSupported](self, "_authenticationIsSupported");
    _TVRCGeneralLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = self;
      v14 = 1024;
      LODWORD(v15) = v6;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> will allow authentication challenge: %d", (uint8_t *)&v12, 0x12u);
    }

    -[_TVRCDeviceImpl setAuthenticationSupported:](self->_impl, "setAuthenticationSupported:", v6);
    self->_connectionState = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      _TVRCGeneralLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = self;
        _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device began connecting.", (uint8_t *)&v12, 0xCu);
      }

      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "deviceBeganConnecting:", self);

    }
    -[_TVRCDeviceImpl connect](self->_impl, "connect");
  }
}

- (void)disconnect
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  TVRXDevice *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> was asked to disconnect.", (uint8_t *)&v8, 0xCu);
  }

  if (self->_connectionState)
  {
    -[_TVRCDeviceImpl disconnect](self->_impl, "disconnect");
    self->_connectionState = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    _TVRCGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = self;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device disconnected (user-initiated).", (uint8_t *)&v8, 0xCu);
    }

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject device:disconnectedForReason:error:](v7, "device:disconnectedForReason:error:", self, 0, 0);
  }
  else
  {
    _TVRCGeneralLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = self;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is already in the disconnected state, ignoring disconnect request.", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (id)allIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", self->_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDevice idsIdentifier](self, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRXDevice idsIdentifier](self, "idsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[NSDictionary allValues](self->_alternateIdentifiers, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4)
    || (-[TVRXDevice idsIdentifier](self, "idsIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", v4),
        v5,
        (v6 & 1) != 0))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSDictionary allValues](self->_alternateIdentifiers, "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isEqualToString:", v4) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v7;
}

- (int64_t)connectionType
{
  return -[_TVRCDeviceImpl connectionType](self->_impl, "connectionType");
}

- (int64_t)attentionState
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[_TVRCDeviceImpl deviceAttentionState](self->_impl, "deviceAttentionState");
  else
    return 0;
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_TVRCDeviceImpl pairedRemoteInfo](self->_impl, "pairedRemoteInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (TVRCSiriRemoteInfo *)v3;
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_TVRCDeviceImpl nowPlayingInfo](self->_impl, "nowPlayingInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (TVRCNowPlayingInfo *)v3;
}

- (NSString)idsIdentifier
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_TVRCDeviceImpl idsIdentifier](self->_impl, "idsIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (int64_t)siriRemoteFindingState
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[_TVRCDeviceImpl siriRemoteFindingState](self->_impl, "siriRemoteFindingState");
  else
    return 0;
}

- (void)_enableFindingSession:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  TVRXDevice *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _TVRCGeneralLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "no";
      if (v3)
        v6 = "yes";
      v7 = 134218242;
      v8 = self;
      v9 = 2080;
      v10 = v6;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> finding session enabled: %s", (uint8_t *)&v7, 0x16u);
    }

    -[_TVRCDeviceImpl enableFindingSession:](self->_impl, "enableFindingSession:", v3);
  }
}

- (void)_setImpl:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  void *v11;
  NSDictionary *v12;
  NSDictionary *alternateIdentifiers;
  void *v14;
  void *v15;
  int v16;
  TVRXDevice *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_connectionState)
  {
    _TVRCGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRXDevice name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218242;
      v17 = self;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> %{public}@ has an already established connection", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    -[_TVRCDeviceImpl setAuthenticationSupported:](self->_impl, "setAuthenticationSupported:", 0);
    -[_TVRCDeviceImpl setDevice:](self->_impl, "setDevice:", 0);
    objc_storeStrong((id *)&self->_impl, a3);
    -[_TVRCDeviceImpl setDevice:](self->_impl, "setDevice:", self);
    -[_TVRCDeviceImpl identifier](self->_impl, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    identifier = self->_identifier;
    self->_identifier = v9;

    -[_TVRCDeviceImpl alternateIdentifiers](self->_impl, "alternateIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSDictionary *)objc_msgSend(v11, "copy");
    alternateIdentifiers = self->_alternateIdentifiers;
    self->_alternateIdentifiers = v12;

    -[_TVRCDeviceImpl model](self->_impl, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRXDevice setModel:](self, "setModel:", v14);

    -[_TVRCDeviceImpl name](self->_impl, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRXDevice _setDeviceName:](self, "_setDeviceName:", v15);

    -[_TVRCDeviceImpl supportedButtons](self->_impl, "supportedButtons");
    v6 = objc_claimAutoreleasedReturnValue();
    -[TVRXDevice _setSupportedButtons:](self, "_setSupportedButtons:", v6);
  }

}

- (void)setDelegate:(id)a3
{
  _TVRXDeviceDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)_setDeviceName:(id)a3
{
  NSString *v4;
  NSString *name;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    name = self->_name;
    self->_name = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "deviceNameChanged:", self);

    }
  }

}

- (void)_setSupportedButtons:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *supportedButtons;
  NSObject *v7;
  NSSet *v8;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  TVRXDevice *v13;
  __int16 v14;
  NSSet *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSSet isEqualToSet:](self->_supportedButtons, "isEqualToSet:", v4))
  {
    v5 = (NSSet *)objc_msgSend(v4, "copy");
    supportedButtons = self->_supportedButtons;
    self->_supportedButtons = v5;

    _TVRCGeneralLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_supportedButtons;
      v12 = 134218242;
      v13 = self;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> has new set of supported buttons: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "device:updatedSupportedButtons:", self, self->_supportedButtons);

    }
  }

}

- (void)_encounteredAuthenticationChallenge:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *WeakRetained;
  int64_t connectionState;
  int v11;
  TVRXDevice *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = self;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> encountered authentication challenge.", (uint8_t *)&v11, 0xCu);
  }

  if (self->_connectionState != 1)
  {
    _TVRCGeneralLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      connectionState = self->_connectionState;
      v11 = 134218240;
      v12 = self;
      v13 = 2048;
      v14 = connectionState;
      _os_log_impl(&dword_21A51B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is not in the connecting state, ignoring authentication challenge. Current state is %ld", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_10;
  }
  v6 = -[TVRXDevice _authenticationIsSupported](self, "_authenticationIsSupported");
  _TVRCGeneralLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device encountered authentication challenge.", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject device:encounteredAuthenticationChallenge:](WeakRetained, "device:encounteredAuthenticationChallenge:", self, v4);
LABEL_10:

    goto LABEL_14;
  }
  if (v8)
  {
    v11 = 134217984;
    v12 = self;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> delegate does not implement authentication method, cancelling authentication challenge.", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v4, "cancel");
LABEL_14:

}

- (void)_connectionAttemptSucceeded
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int64_t connectionState;
  int v10;
  TVRXDevice *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> underlying connection attempt succeeded.", (uint8_t *)&v10, 0xCu);
  }

  if (self->_connectionState == 1)
  {
    self->_connectionState = 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      _TVRCGeneralLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134217984;
        v11 = self;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device became connected.", (uint8_t *)&v10, 0xCu);
      }

      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "deviceConnected:", self);

    }
    -[TVRXDevice _setActiveEndpoint](self, "_setActiveEndpoint");
  }
  else
  {
    _TVRCGeneralLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      connectionState = self->_connectionState;
      v10 = 134218240;
      v11 = self;
      v12 = 2048;
      v13 = connectionState;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is not in the connecting state, ignoring notification. Current state is %ld", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_disconnected:(int64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  int64_t connectionState;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  id WeakRetained;
  char v14;
  NSObject *v15;
  id v16;
  int v17;
  TVRXDevice *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRCGeneralLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218496;
    v18 = self;
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = objc_msgSend(v6, "code");
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> underlying connection was disconnected for TVRCDeviceDisconnectReason %ld, TVRCErrorCode %ld.", (uint8_t *)&v17, 0x20u);
  }

  connectionState = self->_connectionState;
  self->_connectionState = 0;
  v9 = -[TVRXDevice _authenticationIsSupported](self, "_authenticationIsSupported");
  if (a3)
    v10 = 0;
  else
    v10 = connectionState == 1;
  if (v10)
    a3 = 0;
  if (!v10 || v9)
  {
    if (connectionState == 2)
      -[TVRXDevice _setActiveEndpoint](self, "_setActiveEndpoint");
  }
  else
  {
    _TVRCGeneralLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = self;
      _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> disconnected for what appears to be an attempt to pair while locked.", (uint8_t *)&v17, 0xCu);
    }

    TVRCMakeError(102, MEMORY[0x24BDBD1B8]);
    v12 = objc_claimAutoreleasedReturnValue();

    a3 = 4;
    v6 = (id)v12;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    _TVRCGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = self;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device disconnected.", (uint8_t *)&v17, 0xCu);
    }

    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "device:disconnectedForReason:error:", self, a3, v6);

  }
}

- (void)_setActiveEndpoint
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD v7[5];
  uint8_t buf[4];
  TVRXDevice *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_TVRCDeviceImpl alternateIdentifiers](self->_impl, "alternateIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("AirplayID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    _TVRCGeneralLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 134217984;
        v9 = self;
        _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> will attempt to update the active MR endpoint", buf, 0xCu);
      }

      +[TVRCMediaRemoteEndpointManager sharedInstance](TVRCMediaRemoteEndpointManager, "sharedInstance");
      v5 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __32__TVRXDevice__setActiveEndpoint__block_invoke;
      v7[3] = &unk_24DCD8260;
      v7[4] = self;
      -[NSObject updateActiveEndpoint:withCompletion:](v5, "updateActiveEndpoint:withCompletion:", v4, v7);
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> cannot update the active MR endpoint since there is no Airplay ID associated with the device", buf, 0xCu);
    }

  }
}

void __32__TVRXDevice__setActiveEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCGeneralLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __32__TVRXDevice__setActiveEndpoint__block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> successfully updated the active MR endpoint", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)_authenticationIsSupported
{
  _TVRXDeviceDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  TVRXDevice *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_msgSend(v6, "deviceShouldAllowConnectionAuthentication:", self);

    _TVRCGeneralLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v12 = self;
      v13 = 1024;
      v14 = v7;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> delegate will allow authentication challenge: %d", buf, 0x12u);
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  _TVRCGeneralLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> checking with SpringBoard for locked-state.", buf, 0xCu);
  }

  SBSGetScreenLockStatus();
  return v7;
}

- (void)_deviceUpdateAttentionState
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  TVRXDevice *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device's attention state was updated", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "device:updatedAttentionState:", self, -[TVRXDevice attentionState](self, "attentionState"));

  }
}

- (void)_deviceUpdateSiriRemoteFindingState
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  TVRXDevice *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device's siri remote finding state was updated", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "device:updatedSiriRemoteFindingState:", self, -[TVRXDevice siriRemoteFindingState](self, "siriRemoteFindingState"));

  }
}

- (void)_setPairedRemoteInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  TVRXDevice *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> connected remote info was updated", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "device:updatedPairedRemoteInfo:", self, v4);

  }
}

- (void)_setNowPlayingInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  TVRXDevice *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> now playing info was updated", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "device:updatedNowPlayingInfo:", self, v4);

  }
}

- (void)_setDeviceSupportsFindMyRemote:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  TVRXDevice *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "no";
    if (v3)
      v6 = "yes";
    v10 = 134218242;
    v11 = self;
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> supports find my remote: %s", (uint8_t *)&v10, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "device:supportsFindMyRemote:", self, v3);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v4 = v3;
  if (self->_name)
    objc_msgSend(v3, "appendFormat:", CFSTR(" \"%@\"), self->_name);
  if (self->_identifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("; identifier=%@"), self->_identifier);
  -[TVRXDevice idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRXDevice idsIdentifier](self, "idsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("; ids=%@"), v6);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR("; alternate identifiers=%@"), self->_alternateIdentifiers);
  if (self->_impl)
    objc_msgSend(v4, "appendFormat:", CFSTR("; impl=%@"), objc_opt_class());
  TVRCDeviceClassificationDescription(-[TVRXDevice classification](self, "classification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; classification=%@"), v7);

  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (NSString)conciseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[TVRXDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("identifier"));

  -[TVRXDevice idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("idsIdentifier"));

  -[TVRXDevice alternateIdentifiers](self, "alternateIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AirplayID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("AirplayID"));

  -[TVRXDevice _impl](self, "_impl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendClass:withName:", objc_opt_class(), CFSTR("impl"));

  TVRCDeviceClassificationDescription(-[TVRXDevice classification](self, "classification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v11, CFSTR("classification"));

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)stateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[TVRXDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  -[TVRXDevice idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("idsIdentifier"));

  -[TVRXDevice alternateIdentifiers](self, "alternateIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AirplayID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("AirplayID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRXDevice connectionState](self, "connectionState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("connectionState"));

  TVRCDeviceClassificationDescription(-[TVRXDevice classification](self, "classification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("classification"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (BOOL)isEqualToTVRXDevice:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "allIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[TVRXDevice containsIdentifier:](self, "containsIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TVRXDevice *v4;
  TVRXDevice *v5;
  BOOL v6;

  v4 = (TVRXDevice *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TVRXDevice isEqualToTVRXDevice:](self, "isEqualToTVRXDevice:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TVRXDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_TVRCDeviceImpl sendEvent:options:response:](self->_impl, "sendEvent:options:response:", v10, v8, v9);

}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_TVRCDeviceImpl fetchUpNextInfoWithPaginationToken:completion:](self->_impl, "fetchUpNextInfoWithPaginationToken:completion:", v7, v6);
  else
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, MEMORY[0x24BDBD1B8], 0);

}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_TVRCDeviceImpl markAsWatchedWithMediaIdentifier:completion:](self->_impl, "markAsWatchedWithMediaIdentifier:completion:", v7, v6);
  else
    v6[2](v6, 0);

}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_TVRCDeviceImpl removeItemWithMediaIdentifier:completion:](self->_impl, "removeItemWithMediaIdentifier:completion:", v7, v6);
  else
    v6[2](v6, 0);

}

- (void)playItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_TVRCDeviceImpl playItem:completion:](self->_impl, "playItem:completion:", v7, v6);
  else
    v6[2](v6, 0);

}

- (void)_setIdentifier:(id)a3 alternateIdentifiers:(id)a4 name:(id)a5 model:(id)a6 supportedButtons:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[TVRXDevice setIdentifier:](self, "setIdentifier:", a3);
  -[TVRXDevice setName:](self, "setName:", v13);

  -[TVRXDevice setModel:](self, "setModel:", v12);
  -[TVRXDevice setAlternateIdentifiers:](self, "setAlternateIdentifiers:", v14);

  -[TVRXDevice setSupportedButtons:](self, "setSupportedButtons:", v15);
}

- (_TVRXDeviceDelegate)delegate
{
  return (_TVRXDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)alternateIdentifiers
{
  return self->_alternateIdentifiers;
}

- (void)setAlternateIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (NSSet)supportedButtons
{
  return self->_supportedButtons;
}

- (void)setSupportedButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (_TVRCDeviceImpl)_impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_supportedButtons, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __32__TVRXDevice__setActiveEndpoint__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "<TVRXDevice %p> could not update active MR endpoint. Error - %@", (uint8_t *)&v4, 0x16u);
}

@end
