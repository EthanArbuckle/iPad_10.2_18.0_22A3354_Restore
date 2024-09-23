@implementation TVRCDevice

- (TVRCDevice)initWithDeviceIdentifier:(id)a3
{
  id v4;
  TVRCDevice *v5;
  uint64_t v6;
  NSString *identifier;
  TVRCKeyboardController *v8;
  TVRCKeyboardController *keyboardController;
  TVRCDeviceInfo *v10;
  TVRCDeviceInfo *info;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVRCDevice;
  v5 = -[TVRCDevice init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = -[TVRCKeyboardController _initWithDevice:]([TVRCKeyboardController alloc], "_initWithDevice:", v5);
    keyboardController = v5->_keyboardController;
    v5->_keyboardController = v8;

    v10 = objc_alloc_init(TVRCDeviceInfo);
    info = v5->_info;
    v5->_info = v10;

    +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEventObserver:forDeviceWithIdentifier:", v5, v5->_identifier);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEventObserver:forDeviceWithIdentifier:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)TVRCDevice;
  -[TVRCDevice dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  -[TVRCDevice name](self, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR(" \"%@\"), v4);
  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("; identifier=%@"), self->_identifier);
  if (self->_info)
    objc_msgSend(v3, "appendFormat:", CFSTR("; info=%@"), self->_info);
  TVRCDeviceConnectionTypeDescription(-[TVRCDevice connectionType](self, "connectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; connectionType=%@"), v6);

  if (-[TVRCDevice classification](self, "classification"))
  {
    TVRCDeviceClassificationDescription(-[TVRCDevice classification](self, "classification"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; suggestion=%@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)_deviceStateDictionary
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[TVRCDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  -[TVRCDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("model"));

  TVRCDeviceConnectionTypeDescription(-[TVRCDevice connectionType](self, "connectionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("connectionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRCDevice connectionState](self, "connectionState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("connectionState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TVRCDevice isPaired](self, "isPaired"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("paired"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TVRCDevice supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("supportsDirectCaptionQueries"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TVRCDevice supportsFindMyRemote](self, "supportsFindMyRemote"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("supportsFindMyRemote"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TVRCDevice supportsTouchEvents](self, "supportsTouchEvents"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("supportsTouchEvents"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRCDevice attentionState](self, "attentionState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("attentionState"));

  -[TVRCDevice deviceState](self, "deviceState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alternateIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("alternateIdentifiers"));

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (void)connect
{
  -[TVRCDevice _connectWithConnectionContext:](self, "_connectWithConnectionContext:", 0);
}

- (void)_connectWithConnectionContext:(int64_t)a3
{
  id v5;

  if (!-[TVRCDeviceState connectionState](self->_deviceState, "connectionState"))
  {
    +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openConnectionToDeviceWithIdentifier:connectionContext:", self->_identifier, a3);

  }
}

- (void)disconnectWithType:(unint64_t)a3
{
  id v5;

  -[TVRCDeviceState setConnectionState:](self->_deviceState, "setConnectionState:", 0);
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closeConnectionToDeviceWithIdentifier:withType:", self->_identifier, a3);

}

- (void)sendButtonEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendButtonEvent:toDeviceWithIdentifier:", v4, self->_identifier);

}

- (void)sendTouchEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendTouchEvent:toDeviceWithIdentifier:", v4, self->_identifier);

}

- (void)sendGameControllerEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendGameControllerEvent:toDeviceWithIdentifier:", v4, self->_identifier);

}

- (BOOL)containsIdentifier:(id)a3
{
  NSString *identifier;
  id v5;
  uint64_t v6;
  char v7;
  void *v8;

  identifier = self->_identifier;
  v5 = a3;
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v5);
  -[TVRCDeviceInfo mediaRemoteID](self->_info, "mediaRemoteID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "isEqualToString:", v5);

  -[TVRCDeviceInfo airplayID](self->_info, "airplayID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "isEqualToString:", v5);

  return identifier | v6 | v7;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TVRCDevice containsIdentifier:](self, "containsIdentifier:", v6))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "mediaRemoteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TVRCDevice containsIdentifier:](self, "containsIdentifier:", v8))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "airplayID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TVRCDevice containsIdentifier:](self, "containsIdentifier:", v9);

    }
  }

  return v7;
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchUpNextInfoForDeviceWithIdentifier:paginationToken:completion:", self->_identifier, v7, v6);

}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markAsWatchedForDeviceWithIdentifier:mediaIdentifier:completion:", self->_identifier, v7, v6);

}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemForDeviceWithIdentifier:mediaIdentifier:completion:", self->_identifier, v7, v6);

}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playItem:deviceIdentifier:completion:", v7, self->_identifier, v6);

}

- (NSString)name
{
  return -[TVRCDeviceState name](self->_deviceState, "name");
}

- (NSString)model
{
  return -[TVRCDeviceState model](self->_deviceState, "model");
}

- (NSSet)supportedButtons
{
  return -[TVRCDeviceState supportedButtons](self->_deviceState, "supportedButtons");
}

- (BOOL)supportsTouchEvents
{
  return -[TVRCDeviceState supportsTouchEvents](self->_deviceState, "supportsTouchEvents");
}

- (BOOL)isPaired
{
  return -[TVRCDeviceState isPaired](self->_deviceState, "isPaired");
}

- (BOOL)isInEditingSession
{
  void *v2;
  char v3;

  -[TVRCDeviceState keyboardState](self->_deviceState, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (unint64_t)pairingCapability
{
  return -[TVRCDeviceState pairingCapability](self->_deviceState, "pairingCapability");
}

- (int64_t)connectionState
{
  return -[TVRCDeviceState connectionState](self->_deviceState, "connectionState");
}

- (BOOL)supportsDirectCaptionQueries
{
  return -[TVRCDeviceState supportsDirectCaptionQueries](self->_deviceState, "supportsDirectCaptionQueries");
}

- (BOOL)supportsFindMyRemote
{
  void *v4;
  char v5;

  if (-[TVRCDeviceState supportsFindMyRemote](self->_deviceState, "supportsFindMyRemote"))
    return 1;
  -[TVRCDeviceState pairedRemoteInfo](self->_deviceState, "pairedRemoteInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsFindMy");

  return v5;
}

- (int64_t)attentionState
{
  return -[TVRCDeviceState attentionState](self->_deviceState, "attentionState");
}

- (int64_t)connectionType
{
  return -[TVRCDeviceState connectionType](self->_deviceState, "connectionType");
}

- (int64_t)classification
{
  return -[TVRCDeviceState classification](self->_deviceState, "classification");
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return -[TVRCDeviceState nowPlayingInfo](self->_deviceState, "nowPlayingInfo");
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return -[TVRCDeviceState pairedRemoteInfo](self->_deviceState, "pairedRemoteInfo");
}

- (void)_deviceUpdatedState:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *identifier;
  void *v10;
  char v11;
  TVRCDeviceState *v12;
  TVRCDeviceInfo *info;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id WeakRetained;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  char v54;
  id v55;
  int v56;
  void *v57;
  void *v58;
  char v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  char *v63;
  uint64_t v64;
  void *v65;
  id v66;
  char v67;
  id v68;
  void *v69;
  void *v70;
  char v71;
  NSObject *v72;
  char *v73;
  id v74;
  char v75;
  id v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  __CFString *v83;
  id v84;
  char v85;
  id v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  __CFString *v90;
  id v91;
  char v92;
  TVRCKeyboardController *keyboardController;
  void *v94;
  uint8_t buf[4];
  const char *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v96 = "-[TVRCDevice _deviceUpdatedState:]";
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(v5, "alternateIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  identifier = self->_identifier;
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](identifier, "isEqualToString:", v10))
  {

    goto LABEL_6;
  }
  v11 = objc_msgSend(v8, "containsObject:", self->_identifier);

  if ((v11 & 1) != 0)
  {
LABEL_6:
    v12 = self->_deviceState;
    objc_storeStrong((id *)&self->_deviceState, a3);
    info = self->_info;
    objc_msgSend(v5, "alternateIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCDeviceInfo _populateValidIdentifiers:](info, "_populateValidIdentifiers:", v14);

    _TVRCGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v96 = (const char *)v12;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Old state: %{public}@", buf, 0xCu);
    }

    _TVRCGeneralLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v96 = (const char *)v5;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "New state: %{public}@", buf, 0xCu);
    }

    if (!-[TVRCDeviceState connectionState](v12, "connectionState") && objc_msgSend(v5, "connectionState") == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v19, "deviceBeganConnecting:", self);

      }
    }
    if (-[TVRCDeviceState connectionState](v12, "connectionState") != 2 && objc_msgSend(v5, "connectionState") == 2)
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        v22 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v22, "deviceConnected:", self);

      }
      +[TVRCPreferredDeviceManager sharedInstance](TVRCPreferredDeviceManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPreferredDevice:", self);

    }
    if (!v12)
    {
      if (objc_msgSend(v5, "connectionState"))
        goto LABEL_76;
      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
        goto LABEL_76;
      v27 = objc_loadWeakRetained((id *)&self->_delegate);
      v28 = objc_msgSend(v5, "disconnectReason");
      objc_msgSend(v5, "disconnectError");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "device:disconnectedForReason:error:", self, v28, v29);

LABEL_75:
LABEL_76:
      keyboardController = self->_keyboardController;
      objc_msgSend(v5, "keyboardState");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCKeyboardController _setCurrentState:](keyboardController, "_setCurrentState:", v94);

      goto LABEL_77;
    }
    if (-[TVRCDeviceState connectionState](v12, "connectionState") && !objc_msgSend(v5, "connectionState"))
    {
      if (objc_msgSend(v5, "disconnectReason") == 1)
      {
        +[TVRCPreferredDeviceManager sharedInstance](TVRCPreferredDeviceManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "preferredDeviceIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "isEqualToString:", self->_identifier))
        {
          +[TVRCPreferredDeviceManager sharedInstance](TVRCPreferredDeviceManager, "sharedInstance");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setPreferredDevice:", 0);

        }
      }
      goto LABEL_33;
    }
    if (!-[TVRCDeviceState connectionState](v12, "connectionState") && !objc_msgSend(v5, "connectionState"))
    {
      objc_msgSend(v5, "disconnectError");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {

        goto LABEL_33;
      }
      if (objc_msgSend(v5, "disconnectReason") < 5)
      {
LABEL_33:
        v33 = objc_loadWeakRetained((id *)&self->_delegate);
        v34 = objc_opt_respondsToSelector();

        if ((v34 & 1) != 0)
        {
          v35 = objc_loadWeakRetained((id *)&self->_delegate);
          v36 = objc_msgSend(v5, "disconnectReason");
          objc_msgSend(v5, "disconnectError");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "device:disconnectedForReason:error:", self, v36, v37);

        }
      }
    }
    -[TVRCDeviceState supportedButtons](v12, "supportedButtons");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportedButtons");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqualToSet:", v39);

    if ((v40 & 1) == 0)
    {
      -[TVRCDeviceState supportedButtons](v12, "supportedButtons");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "mutableCopy");

      objc_msgSend(v5, "supportedButtons");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "minusSet:", v43);

      objc_msgSend(v5, "supportedButtons");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v44, "mutableCopy");

      -[TVRCDeviceState supportedButtons](v12, "supportedButtons");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "minusSet:", v46);

      v47 = objc_loadWeakRetained((id *)&self->_delegate);
      v48 = objc_opt_respondsToSelector();

      if ((v48 & 1) != 0)
      {
        v49 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v49, "device:removedSupportedButtons:added:", self, v42, v45);

      }
    }
    -[TVRCDeviceState name](v12, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqualToString:", v51);

    if ((v52 & 1) == 0)
    {
      v53 = objc_loadWeakRetained((id *)&self->_delegate);
      v54 = objc_opt_respondsToSelector();

      if ((v54 & 1) != 0)
      {
        v55 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v55, "deviceNameChanged:", self);

      }
    }
    v56 = -[TVRCDeviceState supportsFindMyRemote](v12, "supportsFindMyRemote");
    if (v56 != objc_msgSend(v5, "supportsFindMyRemote")
      || (-[TVRCDeviceState pairedRemoteInfo](v12, "pairedRemoteInfo"),
          v57 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "pairedRemoteInfo"),
          v58 = (void *)objc_claimAutoreleasedReturnValue(),
          v59 = objc_msgSend(v57, "isEqualToRemoteInfo:", v58),
          v58,
          v57,
          (v59 & 1) == 0))
    {
      _TVRCGeneralLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = objc_msgSend(v5, "supportsFindMyRemote");
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v61;
        _os_log_impl(&dword_21A51B000, v60, OS_LOG_TYPE_DEFAULT, "Updated supportsFindMyRemote: %d", buf, 8u);
      }

      _TVRCGeneralLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "pairedRemoteInfo");
        v63 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v96 = v63;
        _os_log_impl(&dword_21A51B000, v62, OS_LOG_TYPE_DEFAULT, "Updated pairedRemoteInfo: %@", buf, 0xCu);

      }
      if ((objc_msgSend(v5, "supportsFindMyRemote") & 1) != 0)
      {
        v64 = 1;
      }
      else
      {
        objc_msgSend(v5, "pairedRemoteInfo");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v65, "supportsFindMy");

      }
      v66 = objc_loadWeakRetained((id *)&self->_delegate);
      v67 = objc_opt_respondsToSelector();

      if ((v67 & 1) != 0)
      {
        v68 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v68, "device:supportsFindMyRemote:", self, v64);

      }
    }
    -[TVRCDeviceState nowPlayingInfo](v12, "nowPlayingInfo");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nowPlayingInfo");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqualToNowPlayingInfo:", v70);

    if ((v71 & 1) == 0)
    {
      _TVRCGeneralLog();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "nowPlayingInfo");
        v73 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v96 = v73;
        _os_log_impl(&dword_21A51B000, v72, OS_LOG_TYPE_DEFAULT, "Updated nowPlayingInfo: %@", buf, 0xCu);

      }
      v74 = objc_loadWeakRetained((id *)&self->_delegate);
      v75 = objc_opt_respondsToSelector();

      if ((v75 & 1) != 0)
      {
        v76 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v5, "nowPlayingInfo");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "device:updatedNowPlayingInfo:", self, v77);

      }
    }
    v78 = -[TVRCDeviceState siriRemoteFindingState](v12, "siriRemoteFindingState");
    if (v78 != objc_msgSend(v5, "siriRemoteFindingState"))
    {
      _TVRCGeneralLog();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = objc_msgSend(v5, "siriRemoteFindingState");
        if (v80 < 7 && ((0x77u >> v80) & 1) != 0)
        {
          v83 = off_24DCD7FD8[v80];
        }
        else
        {
          v81 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v80);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "stringWithFormat:", CFSTR("Unknown %@"), v82);
          v83 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        *(_DWORD *)buf = 138543362;
        v96 = (const char *)v83;
        _os_log_impl(&dword_21A51B000, v79, OS_LOG_TYPE_DEFAULT, "Updated siriRemoteFindingState: %{public}@", buf, 0xCu);

      }
      v84 = objc_loadWeakRetained((id *)&self->_delegate);
      v85 = objc_opt_respondsToSelector();

      if ((v85 & 1) != 0)
      {
        v86 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v86, "device:updatedSiriRemoteFindingSessionState:", self, objc_msgSend(v5, "siriRemoteFindingState"));

      }
    }
    v87 = -[TVRCDeviceState attentionState](v12, "attentionState");
    if (v87 == objc_msgSend(v5, "attentionState"))
      goto LABEL_76;
    _TVRCGeneralLog();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v89 = objc_msgSend(v5, "attentionState");
      if ((unint64_t)(v89 - 1) >= 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), v89);
        v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v90 = off_24DCD8010[v89 - 1];
      }
      *(_DWORD *)buf = 138543362;
      v96 = (const char *)v90;
      _os_log_impl(&dword_21A51B000, v88, OS_LOG_TYPE_DEFAULT, "Updated attentionState: %{public}@", buf, 0xCu);

    }
    v91 = objc_loadWeakRetained((id *)&self->_delegate);
    v92 = objc_opt_respondsToSelector();

    if ((v92 & 1) == 0)
      goto LABEL_76;
    v27 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v27, "device:updatedAttentionState:", self, objc_msgSend(v5, "attentionState"));
    goto LABEL_75;
  }
LABEL_77:

}

- (void)_deviceEncounteredAuthChallengeType:(int64_t)a3 attributes:(int64_t)a4 codeToEnterOnDevice:(id)a5 throttleSeconds:(int64_t)a6
{
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  NSObject *v15;
  id to;
  uint8_t buf[4];
  TVRCDevice *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v11 = objc_loadWeakRetained(&to);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = -[TVRCDeviceAuthenticationChallenge _initWithDeviceIdentifier:challengeType:codeToEnterOnDevice:]([TVRCDeviceAuthenticationChallenge alloc], "_initWithDeviceIdentifier:challengeType:codeToEnterOnDevice:", self->_identifier, a3, v10);
    objc_msgSend(v13, "setChallengeAttributes:", a4);
    objc_msgSend(v13, "setThrottleSeconds:", a6);
    v14 = objc_loadWeakRetained(&to);
    objc_msgSend(v14, "device:encounteredAuthenticationChallenge:", self, v13);

  }
  else
  {
    _TVRCGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Cancelling auth challenge since there is no delegate for device %@", buf, 0xCu);
    }

    +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelAuthChallengeForDeviceWithIdentifier:", self->_identifier);
  }

  objc_destroyWeak(&to);
}

- (void)_disconnectDeviceDueToConnectionInterruption
{
  id WeakRetained;
  char v4;
  id v5;

  -[TVRCDeviceState setConnectionState:](self->_deviceState, "setConnectionState:", 0);
  if (-[TVRCDeviceState connectionState](self->_deviceState, "connectionState") == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v5, "device:disconnectedForReason:error:", self, 4, 0);

    }
  }
}

- (void)_sendRTIDataPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendInputTextPayload:toDeviceWithIdentifier:", v4, self->_identifier);

}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableTVRemoteOnLockscreen:forDeviceIdentifier:", v3, self->_identifier);

}

- (void)enableFindingSession:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableFindingSession:forDeviceIdentifier:", v3, self->_identifier);

}

- (TVRCDeviceDelegate)delegate
{
  return (TVRCDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TVRCKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (void)setKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardController, a3);
}

- (TVRCDeviceInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (TVRCDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
}

- (int64_t)siriRemoteFindingState
{
  return self->_siriRemoteFindingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
