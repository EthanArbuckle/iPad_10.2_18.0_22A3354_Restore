@implementation TVRCDeviceState

+ (id)deviceStateFromDevice:(id)a3
{
  id v3;
  TVRCDeviceState *v4;

  v3 = a3;
  v4 = -[TVRCDeviceState initWithDevice:]([TVRCDeviceState alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)setOfStatesFromDevices:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)arrayOfStatesFromDevices:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (TVRCDeviceState)initWithDevice:(id)a3
{
  id v4;
  TVRCDeviceState *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSString *idsIdentifier;
  void *v15;
  uint64_t v16;
  NSDictionary *alternateIdentifiers;
  void *v18;
  uint64_t v19;
  NSString *model;
  void *v21;
  uint64_t v22;
  NSSet *supportedButtons;
  uint64_t v24;
  TVRCKeyboardState *keyboardState;
  NSError *disconnectError;
  void *v27;
  uint64_t v28;
  TVRCSiriRemoteInfo *pairedRemoteInfo;
  void *v30;
  uint64_t v31;
  TVRCNowPlayingInfo *nowPlayingInfo;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)TVRCDeviceState;
  v5 = -[TVRCDeviceState init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "idsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v13;

    objc_msgSend(v4, "alternateIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    alternateIdentifiers = v5->_alternateIdentifiers;
    v5->_alternateIdentifiers = (NSDictionary *)v16;

    objc_msgSend(v4, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    model = v5->_model;
    v5->_model = (NSString *)v19;

    objc_msgSend(v4, "supportedButtons");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    supportedButtons = v5->_supportedButtons;
    v5->_supportedButtons = (NSSet *)v22;

    v5->_connectionState = objc_msgSend(v4, "connectionState");
    +[TVRCKeyboardState keyboardStateFromDevice:](TVRCKeyboardState, "keyboardStateFromDevice:", v4);
    v24 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TVRCKeyboardState *)v24;

    v5->_pairingCapability = objc_msgSend(v4, "pairingCapability");
    v5->_supportsDirectCaptionQueries = objc_msgSend(v4, "supportsDirectCaptionQueries");
    v5->_supportsFindMyRemote = objc_msgSend(v4, "supportsFindMyRemote");
    v5->_supportsTouchEvents = objc_msgSend(v4, "supportsTouchEvents");
    v5->_paired = objc_msgSend(v4, "paired");
    disconnectError = v5->_disconnectError;
    v5->_disconnectReason = 5;
    v5->_disconnectError = 0;

    v5->_connectionType = objc_msgSend(v4, "connectionType");
    objc_msgSend(v4, "pairedRemoteInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    pairedRemoteInfo = v5->_pairedRemoteInfo;
    v5->_pairedRemoteInfo = (TVRCSiriRemoteInfo *)v28;

    objc_msgSend(v4, "nowPlayingInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    nowPlayingInfo = v5->_nowPlayingInfo;
    v5->_nowPlayingInfo = (TVRCNowPlayingInfo *)v31;

    v5->_classification = objc_msgSend(v4, "classification");
    v5->_siriRemoteFindingState = objc_msgSend(v4, "siriRemoteFindingState");
    v5->_attentionState = objc_msgSend(v4, "attentionState");
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCDeviceState)initWithCoder:(id)a3
{
  id v4;
  TVRCDeviceState *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *idsIdentifier;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *alternateIdentifiers;
  uint64_t v17;
  NSString *model;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSSet *supportedButtons;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  TVRCKeyboardState *keyboardState;
  uint64_t v30;
  NSError *disconnectError;
  uint64_t v32;
  TVRCSiriRemoteInfo *pairedRemoteInfo;
  uint64_t v34;
  TVRCNowPlayingInfo *nowPlayingInfo;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)TVRCDeviceState;
  v5 = -[TVRCDeviceState init](&v37, sel_init);
  if (v5)
  {
    v5->_connectionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectionState"));
    v5->_connectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectionType"));
    v5->_pairingCapability = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pairingCapability"));
    v5->_paired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paired"));
    v5->_supportsTouchEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsTouchEvents"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("alternateIdentifiers"));
    v15 = objc_claimAutoreleasedReturnValue();
    alternateIdentifiers = v5->_alternateIdentifiers;
    v5->_alternateIdentifiers = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v17 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("supportedButtons"));
    v22 = objc_claimAutoreleasedReturnValue();
    supportedButtons = v5->_supportedButtons;
    v5->_supportedButtons = (NSSet *)v22;

    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("keyboardState"));
    v28 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TVRCKeyboardState *)v28;

    v5->_disconnectReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("disconnectReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disconnectError"));
    v30 = objc_claimAutoreleasedReturnValue();
    disconnectError = v5->_disconnectError;
    v5->_disconnectError = (NSError *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedRemoteInfo"));
    v32 = objc_claimAutoreleasedReturnValue();
    pairedRemoteInfo = v5->_pairedRemoteInfo;
    v5->_pairedRemoteInfo = (TVRCSiriRemoteInfo *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nowPlayingInfo"));
    v34 = objc_claimAutoreleasedReturnValue();
    nowPlayingInfo = v5->_nowPlayingInfo;
    v5->_nowPlayingInfo = (TVRCNowPlayingInfo *)v34;

    v5->_classification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("classification"));
    v5->_siriRemoteFindingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("siriRemoteFindingState"));
    v5->_supportsFindMyRemote = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsFindMyRemote"));
    v5->_attentionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attentionState"));
    v5->_supportsDirectCaptionQueries = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDirectCaptionQueries"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t connectionState;
  id v5;

  connectionState = self->_connectionState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", connectionState, CFSTR("connectionState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_connectionType, CFSTR("connectionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pairingCapability, CFSTR("pairingCapability"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_paired, CFSTR("paired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsTouchEvents, CFSTR("supportsTouchEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("idsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateIdentifiers, CFSTR("alternateIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedButtons, CFSTR("supportedButtons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_disconnectReason, CFSTR("disconnectReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disconnectError, CFSTR("disconnectError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedRemoteInfo, CFSTR("pairedRemoteInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nowPlayingInfo, CFSTR("nowPlayingInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_classification, CFSTR("classification"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_siriRemoteFindingState, CFSTR("siriRemoteFindingState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsFindMyRemote, CFSTR("supportsFindMyRemote"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attentionState, CFSTR("attentionState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsDirectCaptionQueries, CFSTR("supportsDirectCaptionQueries"));

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  __CFString *v17;
  id v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "appendString:withName:", self->_idsIdentifier, CFSTR("idsIdentifier"));
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_alternateIdentifiers, CFSTR("alternateIdentifiers"), 0);
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_pairingCapability, CFSTR("pairingCapability"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_paired, CFSTR("paired"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportsTouchEvents, CFSTR("supportsTouchEvents"));
  v7 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_connectionState, CFSTR("connectionState"));
  TVRCDeviceConnectionTypeDescription(self->_connectionType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("connectionType"));

  v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_keyboardState, CFSTR("keyboardState"));
  v10 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_disconnectReason, CFSTR("disconnectReason"));
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_disconnectError, CFSTR("disconnectError"), 1);
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_pairedRemoteInfo, CFSTR("pairedRemoteInfo"), 1);
  TVRCDeviceClassificationDescription(self->_classification);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v13, CFSTR("classification"));

  v14 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_siriRemoteFindingState, CFSTR("siriRemoteFindingState"));
  v15 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportsFindMyRemote, CFSTR("supportsFindMyRemote"));
  v16 = self->_attentionState - 1;
  if (v16 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_attentionState);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_24DCD80C8[v16];
  }
  objc_msgSend(v3, "appendString:withName:", v17, CFSTR("attentionState"));

  v18 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportsDirectCaptionQueries, CFSTR("supportsDirectCaptionQueries"));
  objc_msgSend(v3, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)detailedDescription
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  __CFString *v17;
  id v18;
  id v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "appendString:withName:", self->_idsIdentifier, CFSTR("idsIdentifier"));
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_alternateIdentifiers, CFSTR("alternateIdentifiers"), 0);
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_pairingCapability, CFSTR("pairingCapability"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_paired, CFSTR("paired"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportsTouchEvents, CFSTR("supportsTouchEvents"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportsFindMyRemote, CFSTR("supportsFindMyRemote"));
  v8 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_connectionState, CFSTR("connectionState"));
  TVRCDeviceConnectionTypeDescription(self->_connectionType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("connectionType"));

  v10 = (id)objc_msgSend(v3, "appendObject:withName:", self->_keyboardState, CFSTR("keyboardState"));
  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_disconnectReason, CFSTR("disconnectReason"));
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_disconnectError, CFSTR("disconnectError"), 1);
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_pairedRemoteInfo, CFSTR("pairedRemoteInfo"), 1);
  TVRCDeviceClassificationDescription(self->_classification);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v14, CFSTR("classification"));

  v15 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_siriRemoteFindingState, CFSTR("siriRemoteFindingState"));
  v16 = self->_attentionState - 1;
  if (v16 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_attentionState);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_24DCD80C8[v16];
  }
  objc_msgSend(v3, "appendString:withName:", v17, CFSTR("attentionState"));

  v18 = (id)objc_msgSend(v3, "appendObject:withName:", self->_supportedButtons, CFSTR("supportedButtons"));
  v19 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportsDirectCaptionQueries, CFSTR("supportsDirectCaptionQueries"));
  objc_msgSend(v3, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (unint64_t)pairingCapability
{
  return self->_pairingCapability;
}

- (void)setPairingCapability:(unint64_t)a3
{
  self->_pairingCapability = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (BOOL)supportsDirectCaptionQueries
{
  return self->_supportsDirectCaptionQueries;
}

- (void)setSupportsDirectCaptionQueries:(BOOL)a3
{
  self->_supportsDirectCaptionQueries = a3;
}

- (BOOL)supportsFindMyRemote
{
  return self->_supportsFindMyRemote;
}

- (void)setSupportsFindMyRemote:(BOOL)a3
{
  self->_supportsFindMyRemote = a3;
}

- (BOOL)supportsTouchEvents
{
  return self->_supportsTouchEvents;
}

- (void)setSupportsTouchEvents:(BOOL)a3
{
  self->_supportsTouchEvents = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)alternateIdentifiers
{
  return self->_alternateIdentifiers;
}

- (void)setAlternateIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)supportedButtons
{
  return self->_supportedButtons;
}

- (void)setSupportedButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (TVRCKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)siriRemoteFindingState
{
  return self->_siriRemoteFindingState;
}

- (void)setSiriRemoteFindingState:(int64_t)a3
{
  self->_siriRemoteFindingState = a3;
}

- (int64_t)attentionState
{
  return self->_attentionState;
}

- (void)setAttentionState:(int64_t)a3
{
  self->_attentionState = a3;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(int64_t)a3
{
  self->_disconnectReason = a3;
}

- (NSError)disconnectError
{
  return self->_disconnectError;
}

- (void)setDisconnectError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return self->_pairedRemoteInfo;
}

- (void)setPairedRemoteInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_pairedRemoteInfo, 0);
  objc_storeStrong((id *)&self->_disconnectError, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_supportedButtons, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
