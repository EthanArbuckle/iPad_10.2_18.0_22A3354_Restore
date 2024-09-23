@implementation _TVRCRMSDeviceWrapper

+ (_TVRCRMSDeviceWrapper)wrapperWithDevice:(id)a3
{
  id v3;
  _TVRCRMSDeviceWrapper *v4;

  v3 = a3;
  v4 = -[_TVRCRMSDeviceWrapper initWithDevice:]([_TVRCRMSDeviceWrapper alloc], "initWithDevice:", v3);

  return v4;
}

- (_TVRCRMSDeviceWrapper)initWithDevice:(id)a3
{
  id v5;
  _TVRCRMSDeviceWrapper *v6;
  _TVRCRMSDeviceWrapper *v7;
  NSMutableSet *v8;
  NSMutableSet *mediaButtons;
  TVRXKeyboardController *v10;
  TVRXKeyboardController *keyboardController;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TVRCRMSDeviceWrapper;
  v6 = -[_TVRCRMSDeviceWrapper init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_connected = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mediaButtons = v7->_mediaButtons;
    v7->_mediaButtons = v8;

    v10 = -[TVRXKeyboardController _init]([TVRXKeyboardController alloc], "_init");
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelPairing, 0);
  v3.receiver = self;
  v3.super_class = (Class)_TVRCRMSDeviceWrapper;
  -[_TVRCRMSDeviceWrapper dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[_TVRCRMSDeviceWrapper device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[_TVRCRMSDeviceWrapper device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)alternateIdentifiers
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (NSString)model
{
  return (NSString *)CFSTR("LegacyAppleTV");
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)isPaired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[_TVRCRMSDeviceManager sharedInstance](_TVRCRMSDeviceManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRMSDeviceWrapper device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingGUIDForNetworkName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)supportedButtons
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 12);
  objc_msgSend(v3, "addObject:", v4);

  v5 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 13);
  objc_msgSend(v3, "addObject:", v5);

  v6 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 14);
  objc_msgSend(v3, "addObject:", v6);

  v7 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 15);
  objc_msgSend(v3, "addObject:", v7);

  v8 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 5);
  objc_msgSend(v3, "addObject:", v8);

  v9 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 3);
  objc_msgSend(v3, "addObject:", v9);

  v10 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 2);
  objc_msgSend(v3, "addObject:", v10);

  v11 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 1);
  objc_msgSend(v3, "addObject:", v11);

  if (self->_mediaButtons)
    objc_msgSend(v3, "unionSet:");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)supportsTouchEvents
{
  return 0;
}

- (int64_t)connectionType
{
  return 3;
}

- (TVRXKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (void)connect
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRCRMSDeviceWrapper identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v4;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Attempting connection with service <%{public}@, %{public}@> ", (uint8_t *)&v15, 0x16u);

  }
  +[_TVRCRMSDeviceManager sharedInstance](_TVRCRMSDeviceManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRMSDeviceWrapper device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingGUIDForNetworkName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      -[_TVRCRMSDeviceWrapper name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice found existing pairing record for service, %{public}@", (uint8_t *)&v15, 0xCu);

    }
    -[_TVRCRMSDeviceWrapper _connectWithPairingGUID:](self, "_connectWithPairingGUID:", v9);
  }
  else
  {
    if (v11)
    {
      -[_TVRCRMSDeviceWrapper name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice NO existing pairing record for service '%{public}@ found. Attempting to pair...", (uint8_t *)&v15, 0xCu);

    }
    if (self->_authenticationAllowed)
    {
      -[_TVRCRMSDeviceWrapper _initiatePairing](self, "_initiatePairing");
    }
    else
    {
      TVRCMakeError(102, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVRCRMSDeviceWrapper _disconnectWithError:](self, "_disconnectWithError:", v14);

    }
  }

}

- (void)disconnect
{
  -[_TVRCRMSDeviceWrapper _disconnectWithError:](self, "_disconnectWithError:", 0);
}

- (void)_disconnectWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  TVRMSDAAPControlSession *controlSession;
  _TVRCRMSDeviceKeyboardImpl *keyboardImpl;
  _TVRCRMSNowPlayingState *nowPlayingState;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "#LegacyDevice attempting disconnect for %@", (uint8_t *)&v13, 0xCu);

  }
  self->_connected = 0;
  -[_TVRCRMSDeviceWrapper pairingSession](self, "pairingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endPairing");

  -[_TVRCRMSDeviceWrapper pairingSession](self, "pairingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  -[_TVRCRMSDeviceWrapper setPairingSession:](self, "setPairingSession:", 0);
  -[TVRMSDAAPControlSession endObservingNowPlaying](self->_controlSession, "endObservingNowPlaying");
  -[TVRMSDAAPControlSession logout](self->_controlSession, "logout");
  -[TVRMSDAAPControlSession setDelegate:](self->_controlSession, "setDelegate:", 0);
  controlSession = self->_controlSession;
  self->_controlSession = 0;

  keyboardImpl = self->_keyboardImpl;
  self->_keyboardImpl = 0;

  -[TVRXKeyboardController _setKeyboardImpl:](self->_keyboardController, "_setKeyboardImpl:", 0);
  nowPlayingState = self->_nowPlayingState;
  self->_nowPlayingState = 0;

  -[_TVRCRMSDeviceWrapper delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "disconnectedFromDevice:error:", self, v4);

}

- (void)sendButtonEvent:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v4 = a3;
  v5 = -[_TVRCRMSDeviceWrapper _touchDirectionForButtonEvent:](self, "_touchDirectionForButtonEvent:", v4);
  v6 = -[_TVRCRMSDeviceWrapper _navigationCommandForButtonEvent:](self, "_navigationCommandForButtonEvent:", v4);
  if (v5 == -999)
  {
    v7 = v6;
    if (v6 == -999)
    {
      objc_msgSend(v4, "button");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "buttonType");

      objc_msgSend(v4, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 == 6)
      {
        objc_msgSend(v10, "properties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("TVRCButtonSkipInterval"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _TVRCRMSLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

        objc_msgSend(v13, "floatValue");
LABEL_21:
        -[_TVRCRMSDeviceWrapper _skipSeconds:](self, "_skipSeconds:", v22);

        goto LABEL_22;
      }
      v37 = objc_msgSend(v10, "buttonType");

      objc_msgSend(v4, "button");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v37 == 7)
      {
        objc_msgSend(v38, "properties");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKey:", CFSTR("TVRCButtonSkipInterval"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _TVRCRMSLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);

        objc_msgSend(v13, "floatValue");
        v22 = -v49;
        goto LABEL_21;
      }
      v50 = objc_msgSend(v38, "buttonType");

      if (v50 == 31)
      {
        _TVRCRMSLog();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.3(v51, v52, v53, v54, v55, v56, v57, v58);

        -[_TVRCRMSDeviceWrapper _skipSeconds:](self, "_skipSeconds:", -99999999.0);
      }
    }
    else if (objc_msgSend(v4, "eventType") == 2)
    {
      _TVRCRMSLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.4(v7, v30, v31, v32, v33, v34, v35, v36);

      -[TVRMSDAAPControlSession sendNavigationCommand:](self->_controlSession, "sendNavigationCommand:", v7);
    }
  }
  else
  {
    _TVRCRMSLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.5(v5, v23, v24, v25, v26, v27, v28, v29);

    if (objc_msgSend(v4, "eventType") == 1)
    {
      -[TVRMSDAAPControlSession sendTouchMoveWithDirection:repeatCount:](self->_controlSession, "sendTouchMoveWithDirection:repeatCount:", v5, 0);
    }
    else if (objc_msgSend(v4, "eventType") == 2)
    {
      -[TVRMSDAAPControlSession sendTouchEndWithDirection:repeatCount:](self->_controlSession, "sendTouchEndWithDirection:repeatCount:", v5, 0);
    }
  }
LABEL_22:

}

- (void)_initiatePairing
{
  TVRMSPairingSession *v3;
  TVRMSPairingSession *pairingSession;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelPairing, 0);
  +[TVRMSPairingSession localPairingSession](TVRMSPairingSession, "localPairingSession");
  v3 = (TVRMSPairingSession *)objc_claimAutoreleasedReturnValue();
  pairingSession = self->_pairingSession;
  self->_pairingSession = v3;

  -[TVRMSPairingSession setAdvertisedAppName:](self->_pairingSession, "setAdvertisedAppName:", CFSTR("Apple TV Remote"));
  -[TVRMSPairingSession setDelegate:](self->_pairingSession, "setDelegate:", self);
  -[TVRMSPairingSession beginPairing](self->_pairingSession, "beginPairing");
  -[_TVRCRMSDeviceWrapper performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__cancelPairing, 0, 10.0);
}

- (void)_cancelPairing
{
  id v3;

  TVRCMakeError(100, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVRCRMSDeviceWrapper disconnectWithError:](self, "disconnectWithError:", v3);

}

- (void)_connectWithPairingGUID:(id)a3
{
  id v4;
  TVRMSDAAPControlSession *v5;
  TVRMSDAAPControlSession *controlSession;
  TVRMSDAAPControlSession *v7;
  TVRMSService *device;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  +[TVRMSDAAPControlSession localControlSession](TVRMSDAAPControlSession, "localControlSession");
  v5 = (TVRMSDAAPControlSession *)objc_claimAutoreleasedReturnValue();
  controlSession = self->_controlSession;
  self->_controlSession = v5;

  -[TVRMSDAAPControlSession setDelegate:](self->_controlSession, "setDelegate:", self);
  objc_initWeak(&location, self);
  v7 = self->_controlSession;
  device = self->_device;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49___TVRCRMSDeviceWrapper__connectWithPairingGUID___block_invoke;
  v9[3] = &unk_24DCD8838;
  objc_copyWeak(&v10, &location);
  -[TVRMSDAAPControlSession connectToService:pairingGUID:completionHandler:](v7, "connectToService:pairingGUID:completionHandler:", device, v4, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (int64_t)_touchDirectionForButtonEvent:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonType");

  if ((unint64_t)(v4 - 12) > 3)
    return -999;
  else
    return qword_21A5D5030[v4 - 12];
}

- (int64_t)_navigationCommandForButtonEvent:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonType");

  if ((unint64_t)(v4 - 1) > 4)
    return -999;
  else
    return qword_21A5D5050[v4 - 1];
}

- (void)_setupKeyboardController
{
  _TVRCRMSDeviceKeyboardImpl *v3;
  _TVRCRMSDeviceKeyboardImpl *keyboardImpl;

  v3 = objc_alloc_init(_TVRCRMSDeviceKeyboardImpl);
  keyboardImpl = self->_keyboardImpl;
  self->_keyboardImpl = v3;

  -[_TVRCRMSDeviceKeyboardImpl setDelegate:](self->_keyboardImpl, "setDelegate:", self);
  -[TVRXKeyboardController _setKeyboardImpl:](self->_keyboardController, "_setKeyboardImpl:", self->_keyboardImpl);
}

- (void)_skipSeconds:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[_TVRCRMSNowPlayingState lastReportedTimestamp](self->_nowPlayingState, "lastReportedTimestamp");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVRCRMSNowPlayingState playbackRate](self->_nowPlayingState, "playbackRate");
  v6 = v5;
  -[_TVRCRMSNowPlayingState lastReportedPlaybackPosition](self->_nowPlayingState, "lastReportedPlaybackPosition");
  v8 = v7;
  objc_msgSend(v10, "timeIntervalSinceNow");
  -[_TVRCRMSDeviceWrapper _seekToTime:](self, "_seekToTime:", v8 - v9 * v6 + a3);

}

- (void)_seekToTime:(double)a3
{
  -[TVRMSDAAPControlSession seekToPlaybackTime:completionHandler:](self->_controlSession, "seekToPlaybackTime:completionHandler:", (int)(a3 * 1000.0), &__block_literal_global_13);
}

- (void)pairingSession:(id)a3 didBeginPairingWithPasscode:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BEDCDF0];
  v6 = a4;
  objc_msgSend(v5, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelPairing, 0);
  +[TVRXDeviceAuthenticationChallenge _challengeWithCodeToEnterOnDevice:cancellationHandler:](TVRXDeviceAuthenticationChallenge, "_challengeWithCodeToEnterOnDevice:cancellationHandler:", v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_TVRCRMSDeviceWrapper delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceEncounteredAuthenticationChallenge:", v8);

}

- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)MEMORY[0x24BEDCDF0];
  v9 = a5;
  objc_msgSend(v8, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelPairing, 0);
  -[_TVRCRMSDeviceWrapper name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "#LegacyDevice successfully paired with service '%{public}@' with network name %{public}@", (uint8_t *)&v13, 0x16u);
  }

  +[_TVRCRMSDeviceManager sharedInstance](_TVRCRMSDeviceManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addStoredInfoForNetworkName:displayName:pairingGUID:", v7, v10, v9);

  -[_TVRCRMSDeviceWrapper _connectWithPairingGUID:](self, "_connectWithPairingGUID:", v9);
}

- (void)pairingSessionDidFail:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Pairing failed for service '%{public}@'", (uint8_t *)&v6, 0xCu);

  }
  -[_TVRCRMSDeviceWrapper _initiatePairing](self, "_initiatePairing");
}

- (void)controlSession:(id)a3 keyboardEditingDidBegin:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _TVRCRMSDeviceKeyboardImpl *keyboardImpl;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard editing began for '%{public}@' with info %{public}@", (uint8_t *)&v10, 0x16u);

  }
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl)
  {
    -[_TVRCRMSDeviceKeyboardImpl keyboardSessionBegan:](keyboardImpl, "keyboardSessionBegan:", v5);
  }
  else
  {
    _TVRCRMSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "#LegacyDevice no keyboard impl found", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)controlSession:(id)a3 keyboardEditingDidEnd:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _TVRCRMSDeviceKeyboardImpl *keyboardImpl;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard editing ended for '%{public}@' with info %{public}@", (uint8_t *)&v10, 0x16u);

  }
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl)
  {
    -[_TVRCRMSDeviceKeyboardImpl keyboardSessionEnded:](keyboardImpl, "keyboardSessionEnded:", v5);
  }
  else
  {
    _TVRCRMSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "#LegacyDevice no keyboard impl found", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)controlSession:(id)a3 didUpdateKeyboardEditingInfo:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _TVRCRMSDeviceKeyboardImpl *keyboardImpl;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard editing updated for '%{public}@' with info %{public}@", (uint8_t *)&v10, 0x16u);

  }
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl)
  {
    -[_TVRCRMSDeviceKeyboardImpl keyboardSessionUpdatedEditingInfo:](keyboardImpl, "keyboardSessionUpdatedEditingInfo:", v5);
  }
  else
  {
    _TVRCRMSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "#LegacyDevice no keyboard impl found", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)controlSessionDidEnd:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice control session ended %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  TVRCButton *v9;
  void *v10;
  id v11;
  NSObject *v12;
  TVRCButton *v13;
  void *v14;
  id v15;
  _TVRCRMSNowPlayingState *v16;
  _TVRCRMSNowPlayingState *nowPlayingState;
  id WeakRetained;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_TVRCRMSDeviceWrapper name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice %{public}@ updated now playing info - %{public}@", buf, 0x16u);

  }
  if (v5)
  {
    -[NSMutableSet removeAllObjects](self->_mediaButtons, "removeAllObjects");
    if (objc_msgSend(v5, "canSkipNext"))
    {
      _TVRCRMSLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "#LegacyDevice SkipNext supported", buf, 2u);
      }

      v9 = [TVRCButton alloc];
      v21 = CFSTR("TVRCButtonSkipInterval");
      v22 = &unk_24DCF93E8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[TVRCButton _initWithButtonType:hasTapAction:properties:](v9, "_initWithButtonType:hasTapAction:properties:", 6, 1, v10);

      -[NSMutableSet addObject:](self->_mediaButtons, "addObject:", v11);
    }
    if (objc_msgSend(v5, "canSkipPrevious"))
    {
      _TVRCRMSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "#LegacyDevice SkipPrevious supported", buf, 2u);
      }

      v13 = [TVRCButton alloc];
      v19 = CFSTR("TVRCButtonSkipInterval");
      v20 = &unk_24DCF93E8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[TVRCButton _initWithButtonType:hasTapAction:properties:](v13, "_initWithButtonType:hasTapAction:properties:", 7, 1, v14);

      -[NSMutableSet addObject:](self->_mediaButtons, "addObject:", v15);
    }
    +[_TVRCRMSNowPlayingState nowPlayingStateFromInfo:](_TVRCRMSNowPlayingState, "nowPlayingStateFromInfo:", v5);
    v16 = (_TVRCRMSNowPlayingState *)objc_claimAutoreleasedReturnValue();
    nowPlayingState = self->_nowPlayingState;
    self->_nowPlayingState = v16;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deviceUpdatedSupportedButtons:", self);

  }
}

- (void)keyboardImplRequestsSendingReturnKey:(id)a3
{
  NSObject *v4;
  TVRMSDAAPControlSession *controlSession;
  int v6;
  TVRMSDAAPControlSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_connected && self->_controlSession)
  {
    _TVRCRMSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      controlSession = self->_controlSession;
      v6 = 138543362;
      v7 = controlSession;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice sending keyboard return key to %{public}@", (uint8_t *)&v6, 0xCu);
    }

    -[TVRMSDAAPControlSession sendKeyboardReturnCommand](self->_controlSession, "sendKeyboardReturnCommand");
  }
}

- (void)keyboardImpl:(id)a3 updatedText:(id)a4
{
  id v5;
  NSObject *v6;
  TVRMSDAAPControlSession *controlSession;
  int v8;
  id v9;
  __int16 v10;
  TVRMSDAAPControlSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (self->_connected && self->_controlSession)
  {
    _TVRCRMSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      controlSession = self->_controlSession;
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = controlSession;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice sending text '%{public}@' to %{public}@", (uint8_t *)&v8, 0x16u);
    }

    -[TVRMSDAAPControlSession setKeyboardText:](self->_controlSession, "setKeyboardText:", v5);
  }

}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)authenticationAllowed
{
  return self->_authenticationAllowed;
}

- (void)setAuthenticationAllowed:(BOOL)a3
{
  self->_authenticationAllowed = a3;
}

- (_TVRCRMSDeviceWrapperDelegate)delegate
{
  return (_TVRCRMSDeviceWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRMSService)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (TVRMSPairingSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairingSession, a3);
}

- (TVRMSDAAPControlSession)controlSession
{
  return self->_controlSession;
}

- (void)setControlSession:(id)a3
{
  objc_storeStrong((id *)&self->_controlSession, a3);
}

- (void)setKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardController, a3);
}

- (_TVRCRMSDeviceKeyboardImpl)keyboardImpl
{
  return self->_keyboardImpl;
}

- (void)setKeyboardImpl:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardImpl, a3);
}

- (NSMutableSet)mediaButtons
{
  return self->_mediaButtons;
}

- (void)setMediaButtons:(id)a3
{
  objc_storeStrong((id *)&self->_mediaButtons, a3);
}

- (_TVRCRMSNowPlayingState)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void)setNowPlayingState:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingState, 0);
  objc_storeStrong((id *)&self->_mediaButtons, 0);
  objc_storeStrong((id *)&self->_keyboardImpl, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_controlSession, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21A51B000, a1, a3, "#LegacyDevice sending seek time for skip forward", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21A51B000, a1, a3, "#LegacyDevice sending seek time for skip backward", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_21A51B000, a1, a3, "#LegacyDevice sending SkipStart (via skipSeconds)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_21A51B000, a2, a3, "#LegacyDevice sending command of type %ld", a5, a6, a7, a8, 0);
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_21A51B000, a2, a3, "#LegacyDevice sending touch direction of type %ld", a5, a6, a7, a8, 0);
}

@end
