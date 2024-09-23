@implementation TVRCRapportDeviceImpl

+ (id)implWithDevice:(id)a3
{
  id v3;
  TVRCRapportDeviceImpl *v4;

  v3 = a3;
  v4 = -[TVRCRapportDeviceImpl initWithDevice:]([TVRCRapportDeviceImpl alloc], "initWithDevice:", v3);

  return v4;
}

- (TVRCRapportDeviceImpl)initWithDevice:(id)a3
{
  id v5;
  TVRCRapportDeviceImpl *v6;
  TVRCRapportDeviceImpl *v7;
  TVRXKeyboardController *v8;
  TVRXKeyboardController *keyboardController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCRapportDeviceImpl;
  v6 = -[TVRCRapportDeviceImpl init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceWrapper, a3);
    -[TVRCRPCompanionLinkClientWrapper setDelegate:](v7->_deviceWrapper, "setDelegate:", v7);
    v8 = -[TVRXKeyboardController _init]([TVRXKeyboardController alloc], "_init");
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v8;

  }
  return v7;
}

- (BOOL)supportsDirectCaptionQueries
{
  return -[TVRCRPCompanionLinkClientWrapper supportsDirectCaptionQueries](self->_deviceWrapper, "supportsDirectCaptionQueries");
}

- (BOOL)supportsFindMyRemote
{
  return -[TVRCRPCompanionLinkClientWrapper supportsFindMyRemote](self->_deviceWrapper, "supportsFindMyRemote");
}

- (BOOL)supportsTouchEvents
{
  return -[TVRCRPCompanionLinkClientWrapper supportsTouchEvents](self->_deviceWrapper, "supportsTouchEvents");
}

- (id)name
{
  return -[TVRCRPCompanionLinkClientWrapper name](self->_deviceWrapper, "name");
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[TVRCRPCompanionLinkClientWrapper identifier](self->_deviceWrapper, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)idsIdentifier
{
  return -[TVRCRPCompanionLinkClientWrapper idsIdentifier](self->_deviceWrapper, "idsIdentifier");
}

- (id)alternateIdentifiers
{
  return -[TVRCRPCompanionLinkClientWrapper alternateIdentifiers](self->_deviceWrapper, "alternateIdentifiers");
}

- (id)model
{
  void *v2;
  void *v3;

  -[TVRCRPCompanionLinkClientWrapper model](self->_deviceWrapper, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)supportedButtons
{
  return -[TVRCRPCompanionLinkClientWrapper supportedButtons](self->_deviceWrapper, "supportedButtons");
}

- (void)connect
{
  -[TVRCRPCompanionLinkClientWrapper connect](self->_deviceWrapper, "connect");
}

- (void)disconnect
{
  -[TVRCRPCompanionLinkClientWrapper disconnect](self->_deviceWrapper, "disconnect");
}

- (void)sendButtonEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonType");

  if ((unint64_t)(v5 - 17) <= 1)
  {
    -[TVRCRapportDeviceImpl nowPlayingInfo](self, "nowPlayingInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captionsEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 == 17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCRapportDeviceImpl nowPlayingInfo](self, "nowPlayingInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCaptionsEnabled:", v8);

    }
  }
  -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:](self->_deviceWrapper, "sendButtonEvent:", v10);

}

- (void)sendTouchEvent:(id)a3
{
  -[TVRCRPCompanionLinkClientWrapper sendTouchEvent:](self->_deviceWrapper, "sendTouchEvent:", a3);
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  -[TVRCRPCompanionLinkClientWrapper fetchUpNextInfoWithPaginationToken:completion:](self->_deviceWrapper, "fetchUpNextInfoWithPaginationToken:completion:", a3, a4);
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  -[TVRCRPCompanionLinkClientWrapper markAsWatchedWithMediaIdentifier:completion:](self->_deviceWrapper, "markAsWatchedWithMediaIdentifier:completion:", a3, a4);
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  -[TVRCRPCompanionLinkClientWrapper removeItemWithMediaIdentifier:completion:](self->_deviceWrapper, "removeItemWithMediaIdentifier:completion:", a3, a4);
}

- (void)playItem:(id)a3 completion:(id)a4
{
  -[TVRCRPCompanionLinkClientWrapper playItem:completion:](self->_deviceWrapper, "playItem:completion:", a3, a4);
}

- (TVRXKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (unint64_t)pairingCapability
{
  return 0;
}

- (int64_t)connectionType
{
  return -[TVRCRPCompanionLinkClientWrapper connectionType](self->_deviceWrapper, "connectionType");
}

- (BOOL)isPaired
{
  return -[TVRCRPCompanionLinkClientWrapper isPaired](self->_deviceWrapper, "isPaired");
}

- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5
{
  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:response:](self->_deviceWrapper, "sendEvent:options:response:", a3, a4, a5);
}

- (int64_t)deviceAttentionState
{
  return -[TVRCRPCompanionLinkClientWrapper attentionState](self->_deviceWrapper, "attentionState");
}

- (id)pairedRemoteInfo
{
  return -[TVRCRPCompanionLinkClientWrapper pairedRemoteInfo](self->_deviceWrapper, "pairedRemoteInfo");
}

- (id)nowPlayingInfo
{
  return -[TVRCRPCompanionLinkClientWrapper nowPlayingInfo](self->_deviceWrapper, "nowPlayingInfo");
}

- (int64_t)siriRemoteFindingState
{
  return -[TVRCRPCompanionLinkClientWrapper siriRemoteFindingSessionState](self->_deviceWrapper, "siriRemoteFindingSessionState");
}

- (void)enableFindingSession:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TVRCRapportDeviceImpl deviceWrapper](self, "deviceWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableFindingSession:", v3);

}

- (void)connectedToDevice:(id)a3
{
  id WeakRetained;

  -[TVRCRapportDeviceImpl _setupKeyboardController](self, "_setupKeyboardController", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "_connectionAttemptSucceeded");

}

- (void)disconnectedFromDevice:(id)a3 error:(id)a4
{
  uint64_t v4;
  TVRXDevice **p_device;
  id v6;
  id WeakRetained;

  v4 = 4 * (a4 != 0);
  p_device = &self->_device;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(WeakRetained, "_disconnected:error:", v4, v6);

}

- (void)deviceEncounteredAuthenticationChallenge:(id)a3
{
  TVRXDevice **p_device;
  id v4;
  id WeakRetained;

  p_device = &self->_device;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(WeakRetained, "_encounteredAuthenticationChallenge:", v4);

}

- (void)deviceUpdatedSupportedButtons:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "connected"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    objc_msgSend(v6, "supportedButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setSupportedButtons:", v5);

  }
}

- (void)deviceUpdatedAttentionState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "_deviceUpdateAttentionState");

}

- (void)deviceUpdatedPairedRemoteInfo:(id)a3
{
  TVRXDevice **p_device;
  id v4;
  void *v5;
  id WeakRetained;

  p_device = &self->_device;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(v4, "pairedRemoteInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setPairedRemoteInfo:", v5);
}

- (void)deviceUpdatedNowPlayingInfo:(id)a3
{
  TVRXDevice **p_device;
  id v4;
  void *v5;
  id WeakRetained;

  p_device = &self->_device;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(v4, "nowPlayingInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setNowPlayingInfo:", v5);
}

- (void)deviceUpdateSiriRemoteFindingState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "_deviceUpdateSiriRemoteFindingState");

}

- (void)deviceSupportsFindMyRemote:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "_setDeviceSupportsFindMyRemote:", v3);

}

- (void)_setupKeyboardController
{
  TVRCRapportRemoteTextInputKeyboardImpl *v3;
  TVRCRapportRemoteTextInputKeyboardImpl *keyboardImpl;

  v3 = objc_alloc_init(TVRCRapportRemoteTextInputKeyboardImpl);
  keyboardImpl = self->_keyboardImpl;
  self->_keyboardImpl = v3;

  -[TVRCRapportRemoteTextInputKeyboardImpl setCompanionLinkWrapper:](self->_keyboardImpl, "setCompanionLinkWrapper:", self->_deviceWrapper);
  -[TVRXKeyboardController _setKeyboardImpl:](self->_keyboardController, "_setKeyboardImpl:", self->_keyboardImpl);
}

- (TVRXDevice)device
{
  return (TVRXDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (TVRCRPCompanionLinkClientWrapper)deviceWrapper
{
  return self->_deviceWrapper;
}

- (void)setDeviceWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_deviceWrapper, a3);
}

- (void)setKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardController, a3);
}

- (TVRCRapportRemoteTextInputKeyboardImpl)keyboardImpl
{
  return self->_keyboardImpl;
}

- (void)setKeyboardImpl:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardImpl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardImpl, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_deviceWrapper, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
