@implementation WiFiP2PAWDLState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiP2PAWDLState)initWithInterfaceName:(id)a3 supportsSoloMode:(BOOL)a4 supportsDataTransfer:(BOOL)a5 channelSequence:(id)a6 isEnabled:(BOOL)a7 substate:(unsigned int)a8 macAddress:(id)a9 peerMasterChannel:(id)a10 peerPrimaryPreferredChannel:(id)a11 peerSecondaryPreferredChannel:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WiFiP2PAWDLState *v23;
  uint64_t v24;
  NSString *interfaceName;
  uint64_t v26;
  NSArray *channelSequence;
  uint64_t v28;
  WiFiMACAddress *macAddress;
  uint64_t v30;
  WiFiChannel *peerMasterChannel;
  uint64_t v32;
  WiFiChannel *peerPrimaryPreferredChannel;
  uint64_t v34;
  WiFiChannel *peerSecondaryPreferredChannel;
  objc_super v38;

  v17 = a3;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v38.receiver = self;
  v38.super_class = (Class)WiFiP2PAWDLState;
  v23 = -[WiFiP2PAWDLState init](&v38, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    interfaceName = v23->_interfaceName;
    v23->_interfaceName = (NSString *)v24;

    v23->_supportsSoloMode = a4;
    v23->_supportsDataTransfer = a5;
    v26 = objc_msgSend(v18, "copy");
    channelSequence = v23->_channelSequence;
    v23->_channelSequence = (NSArray *)v26;

    v23->_isEnabled = a7;
    v23->_substate = a8;
    v28 = objc_msgSend(v19, "copy");
    macAddress = v23->_macAddress;
    v23->_macAddress = (WiFiMACAddress *)v28;

    v30 = objc_msgSend(v20, "copy");
    peerMasterChannel = v23->_peerMasterChannel;
    v23->_peerMasterChannel = (WiFiChannel *)v30;

    v32 = objc_msgSend(v21, "copy");
    peerPrimaryPreferredChannel = v23->_peerPrimaryPreferredChannel;
    v23->_peerPrimaryPreferredChannel = (WiFiChannel *)v32;

    v34 = objc_msgSend(v22, "copy");
    peerSecondaryPreferredChannel = v23->_peerSecondaryPreferredChannel;
    v23->_peerSecondaryPreferredChannel = (WiFiChannel *)v34;

  }
  return v23;
}

+ (id)currentState
{
  return +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 2, 0, &__block_literal_global_218);
}

uint64_t __32__WiFiP2PAWDLState_currentState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryAWDLState:");
}

- (WiFiP2PAWDLState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  WiFiP2PAWDLState *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("AWDLState.channelSequenceKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = 0;
            v14 = v9;
            goto LABEL_20;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLState.interfaceNameKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLState.macAddressKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLState.peerMasterChannelKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLState.peerPrimaryPreferredChannelKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLState.peerSecondaryPreferredChannelKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = 0;
    if (v14 && v15 && v16 && v17 && v18)
    {
      self = -[WiFiP2PAWDLState initWithInterfaceName:supportsSoloMode:supportsDataTransfer:channelSequence:isEnabled:substate:macAddress:peerMasterChannel:peerPrimaryPreferredChannel:peerSecondaryPreferredChannel:](self, "initWithInterfaceName:supportsSoloMode:supportsDataTransfer:channelSequence:isEnabled:substate:macAddress:peerMasterChannel:peerPrimaryPreferredChannel:peerSecondaryPreferredChannel:", v14, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AWDLState.supportsSoloModeKey")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AWDLState.supportsDataTransferKey")), v9, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AWDLState.isEnabledKey")), objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AWDLState.substateKey")), v15, v16, v17, v18);
      v20 = self;
    }

LABEL_20:
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WiFiP2PAWDLState interfaceName](self, "interfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AWDLState.interfaceNameKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiP2PAWDLState supportsSoloMode](self, "supportsSoloMode"), CFSTR("AWDLState.supportsSoloModeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiP2PAWDLState supportsDataTransfer](self, "supportsDataTransfer"), CFSTR("AWDLState.supportsDataTransferKey"));
  -[WiFiP2PAWDLState channelSequence](self, "channelSequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("AWDLState.channelSequenceKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiP2PAWDLState isEnabled](self, "isEnabled"), CFSTR("AWDLState.isEnabledKey"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[WiFiP2PAWDLState substate](self, "substate"), CFSTR("AWDLState.substateKey"));
  -[WiFiP2PAWDLState macAddress](self, "macAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AWDLState.macAddressKey"));

  -[WiFiP2PAWDLState peerMasterChannel](self, "peerMasterChannel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("AWDLState.peerMasterChannelKey"));

  -[WiFiP2PAWDLState peerPrimaryPreferredChannel](self, "peerPrimaryPreferredChannel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("AWDLState.peerPrimaryPreferredChannelKey"));

  -[WiFiP2PAWDLState peerSecondaryPreferredChannel](self, "peerSecondaryPreferredChannel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("AWDLState.peerSecondaryPreferredChannelKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiP2PAWDLState interfaceName](self, "interfaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WiFiP2PAWDLState isEnabled](self, "isEnabled"))
    v5 = "enabled";
  else
    v5 = "disabled";
  if (-[WiFiP2PAWDLState supportsSoloMode](self, "supportsSoloMode"))
    v6 = " supportsSoloMode";
  else
    v6 = "";
  -[WiFiP2PAWDLState channelSequence](self, "channelSequence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %s%s ChannelSequence=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WiFiP2PAWDLState *v4;
  WiFiP2PAWDLState *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (WiFiP2PAWDLState *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = 0;
      v5 = 0;
      goto LABEL_24;
    }
    v5 = v4;
    -[WiFiP2PAWDLState interfaceName](self, "interfaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiP2PAWDLState interfaceName](v5, "interfaceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[WiFiP2PAWDLState supportsSoloMode](self, "supportsSoloMode");
      if (v8 == -[WiFiP2PAWDLState supportsSoloMode](v5, "supportsSoloMode"))
      {
        -[WiFiP2PAWDLState channelSequence](self, "channelSequence");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiP2PAWDLState channelSequence](v5, "channelSequence");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = -[WiFiP2PAWDLState isEnabled](self, "isEnabled");
          if (v11 == -[WiFiP2PAWDLState isEnabled](v5, "isEnabled"))
          {
            v12 = -[WiFiP2PAWDLState supportsDataTransfer](self, "supportsDataTransfer");
            if (v12 == -[WiFiP2PAWDLState supportsDataTransfer](v5, "supportsDataTransfer"))
            {
              v13 = -[WiFiP2PAWDLState substate](self, "substate");
              if (v13 == -[WiFiP2PAWDLState substate](v5, "substate"))
              {
                -[WiFiP2PAWDLState macAddress](self, "macAddress");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiP2PAWDLState macAddress](v5, "macAddress");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v14, "isEqual:", v15))
                {
                  v31 = v14;
                  -[WiFiP2PAWDLState peerMasterChannel](self, "peerMasterChannel");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WiFiP2PAWDLState peerMasterChannel](v5, "peerMasterChannel");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v16, "isEqual:", v17))
                  {
                    v28 = v17;
                    v29 = v15;
                    v30 = v16;
                    -[WiFiP2PAWDLState peerPrimaryPreferredChannel](self, "peerPrimaryPreferredChannel");
                    v18 = objc_claimAutoreleasedReturnValue();
                    -[WiFiP2PAWDLState peerPrimaryPreferredChannel](v5, "peerPrimaryPreferredChannel");
                    v19 = objc_claimAutoreleasedReturnValue();
                    v20 = (void *)v18;
                    v21 = (void *)v18;
                    v22 = (void *)v19;
                    if (objc_msgSend(v21, "isEqual:"))
                    {
                      -[WiFiP2PAWDLState peerSecondaryPreferredChannel](self, "peerSecondaryPreferredChannel");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WiFiP2PAWDLState peerSecondaryPreferredChannel](v5, "peerSecondaryPreferredChannel");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(v23, "isEqual:", v24);

                      if ((v27 & 1) == 0)
                        goto LABEL_23;
                      goto LABEL_15;
                    }

                  }
                  else
                  {

                  }
                }
                else
                {

                }
              }
            }
          }
        }

      }
    }

LABEL_23:
    v25 = 0;
    goto LABEL_24;
  }
  v5 = 0;
LABEL_15:
  v25 = 1;
LABEL_24:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WiFiP2PAWDLState *v14;
  WiFiP2PAWDLState *v16;

  v16 = [WiFiP2PAWDLState alloc];
  -[WiFiP2PAWDLState interfaceName](self, "interfaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WiFiP2PAWDLState supportsSoloMode](self, "supportsSoloMode");
  v6 = -[WiFiP2PAWDLState supportsDataTransfer](self, "supportsDataTransfer");
  -[WiFiP2PAWDLState channelSequence](self, "channelSequence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WiFiP2PAWDLState isEnabled](self, "isEnabled");
  v9 = -[WiFiP2PAWDLState substate](self, "substate");
  -[WiFiP2PAWDLState macAddress](self, "macAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiP2PAWDLState peerMasterChannel](self, "peerMasterChannel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiP2PAWDLState peerPrimaryPreferredChannel](self, "peerPrimaryPreferredChannel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiP2PAWDLState peerSecondaryPreferredChannel](self, "peerSecondaryPreferredChannel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WiFiP2PAWDLState initWithInterfaceName:supportsSoloMode:supportsDataTransfer:channelSequence:isEnabled:substate:macAddress:peerMasterChannel:peerPrimaryPreferredChannel:peerSecondaryPreferredChannel:](v16, "initWithInterfaceName:supportsSoloMode:supportsDataTransfer:channelSequence:isEnabled:substate:macAddress:peerMasterChannel:peerPrimaryPreferredChannel:peerSecondaryPreferredChannel:", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)supportsSoloMode
{
  return self->_supportsSoloMode;
}

- (BOOL)supportsDataTransfer
{
  return self->_supportsDataTransfer;
}

- (NSArray)channelSequence
{
  return self->_channelSequence;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (unsigned)substate
{
  return self->_substate;
}

- (WiFiMACAddress)macAddress
{
  return self->_macAddress;
}

- (WiFiChannel)peerMasterChannel
{
  return self->_peerMasterChannel;
}

- (WiFiChannel)peerPrimaryPreferredChannel
{
  return self->_peerPrimaryPreferredChannel;
}

- (WiFiChannel)peerSecondaryPreferredChannel
{
  return self->_peerSecondaryPreferredChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerSecondaryPreferredChannel, 0);
  objc_storeStrong((id *)&self->_peerPrimaryPreferredChannel, 0);
  objc_storeStrong((id *)&self->_peerMasterChannel, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_channelSequence, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
