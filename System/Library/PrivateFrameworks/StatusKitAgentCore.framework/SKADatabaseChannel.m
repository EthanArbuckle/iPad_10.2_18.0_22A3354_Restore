@implementation SKADatabaseChannel

- (SKADatabaseChannel)initWithChannelToken:(id)a3 channelType:(int64_t)a4 identifier:(id)a5 personal:(BOOL)a6 decomissioned:(BOOL)a7 currentOutgoingRatchetState:(id)a8 dateCreated:(id)a9 statusType:(id)a10 presenceIdentifier:(id)a11 serviceIdentifier:(id)a12 invitedUsers:(id)a13 presenceServerKey:(id)a14 presencePeerKey:(id)a15 presenceMembershipKey:(id)a16
{
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SKADatabaseChannel *v27;
  uint64_t v28;
  NSData *channelToken;
  uint64_t v30;
  NSString *identifier;
  uint64_t v32;
  NSDate *dateChannelCreated;
  uint64_t v34;
  NSString *statusType;
  uint64_t v36;
  NSString *presenceIdentifier;
  uint64_t v38;
  NSString *serviceIdentifier;
  uint64_t v40;
  NSArray *invitedUsers;
  id obj;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v18 = a3;
  v19 = a5;
  obj = a8;
  v49 = a8;
  v20 = v19;
  v50 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v48 = a14;
  v25 = a15;
  v26 = a16;
  v51.receiver = self;
  v51.super_class = (Class)SKADatabaseChannel;
  v27 = -[SKADatabaseChannel init](&v51, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v18, "copy");
    channelToken = v27->_channelToken;
    v27->_channelToken = (NSData *)v28;

    v27->_channelType = a4;
    v30 = objc_msgSend(v20, "copy");
    identifier = v27->_identifier;
    v27->_identifier = (NSString *)v30;

    v27->_personal = a6;
    v27->_decomissioned = a7;
    v32 = objc_msgSend(v50, "copy");
    dateChannelCreated = v27->_dateChannelCreated;
    v27->_dateChannelCreated = (NSDate *)v32;

    objc_storeStrong((id *)&v27->_currentOutgoingRatchetState, obj);
    v34 = objc_msgSend(v21, "copy");
    statusType = v27->_statusType;
    v27->_statusType = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    presenceIdentifier = v27->_presenceIdentifier;
    v27->_presenceIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    serviceIdentifier = v27->_serviceIdentifier;
    v27->_serviceIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    invitedUsers = v27->_invitedUsers;
    v27->_invitedUsers = (NSArray *)v40;

    objc_storeStrong((id *)&v27->_presenceServerKey, a14);
    objc_storeStrong((id *)&v27->_presencePeerKey, a15);
    objc_storeStrong((id *)&v27->_presenceMembershipKey, a16);
  }

  return v27;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; identifier = \"%@\"; personal = %ld, decomissioned = %ld, statusType = \"%@\"; dateCreated = \"%@\">;"),
               objc_opt_class(),
               self,
               self->_identifier,
               self->_personal,
               self->_decomissioned,
               self->_statusType,
               self->_dateChannelCreated);
}

+ (id)logger
{
  if (logger_onceToken_5 != -1)
    dispatch_once(&logger_onceToken_5, &__block_literal_global_5);
  return (id)logger__logger_5;
}

void __28__SKADatabaseChannel_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKADatabaseChannel");
  v1 = (void *)logger__logger_5;
  logger__logger_5 = (uint64_t)v0;

}

- (NSData)channelToken
{
  return self->_channelToken;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isPersonal
{
  return self->_personal;
}

- (BOOL)isDecomissioned
{
  return self->_decomissioned;
}

- (NSData)currentOutgoingRatchetState
{
  return self->_currentOutgoingRatchetState;
}

- (NSDate)dateChannelCreated
{
  return self->_dateChannelCreated;
}

- (void)setDateChannelCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateChannelCreated, a3);
}

- (NSString)statusType
{
  return self->_statusType;
}

- (int64_t)channelType
{
  return self->_channelType;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSArray)invitedUsers
{
  return self->_invitedUsers;
}

- (NSData)presenceServerKey
{
  return self->_presenceServerKey;
}

- (NSData)presencePeerKey
{
  return self->_presencePeerKey;
}

- (NSData)presenceMembershipKey
{
  return self->_presenceMembershipKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceMembershipKey, 0);
  objc_storeStrong((id *)&self->_presencePeerKey, 0);
  objc_storeStrong((id *)&self->_presenceServerKey, 0);
  objc_storeStrong((id *)&self->_invitedUsers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusType, 0);
  objc_storeStrong((id *)&self->_dateChannelCreated, 0);
  objc_storeStrong((id *)&self->_currentOutgoingRatchetState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_channelToken, 0);
}

- (MPStatusKitOutgoingRatchet)currentOutgoingRatchet
{
  id v3;
  NSData *currentOutgoingRatchetState;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v11;

  if (self->_currentOutgoingRatchetState)
  {
    v3 = objc_alloc(MEMORY[0x24BE66650]);
    currentOutgoingRatchetState = self->_currentOutgoingRatchetState;
    v11 = 0;
    v5 = (void *)objc_msgSend(v3, "initWithData:error:", currentOutgoingRatchetState, &v11);
    v6 = v11;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (!v8)
    {
      +[SKADatabaseChannel logger](SKADatabaseChannel, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SKADatabaseChannel(CurrentOutgoingRatchet) currentOutgoingRatchet].cold.1((uint64_t)v7, v9);

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return (MPStatusKitOutgoingRatchet *)v5;
}

- (SKADatabaseChannel)initWithCoreDataChannels:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKADatabaseInvitedUser *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  SKADatabaseChannel *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v8), "invitedUsers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v35;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v35 != v12)
                objc_enumerationMutation(v9);
              v14 = -[SKADatabaseInvitedUser initWithCoreDataInvitedUser:]([SKADatabaseInvitedUser alloc], "initWithCoreDataInvitedUser:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13));
              objc_msgSend(v4, "addObject:", v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  objc_msgSend(obj, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "channelToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (int)objc_msgSend(v15, "channelType");
  objc_msgSend(v15, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v15, "personal");
  v26 = objc_msgSend(v15, "decomissioned");
  objc_msgSend(v15, "currentOutgoingRatchetState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateChannelCreated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "statusType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presenceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v15, "serverKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "peerKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "membershipKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[SKADatabaseChannel initWithChannelToken:channelType:identifier:personal:decomissioned:currentOutgoingRatchetState:dateCreated:statusType:presenceIdentifier:serviceIdentifier:invitedUsers:presenceServerKey:presencePeerKey:presenceMembershipKey:](self, "initWithChannelToken:channelType:identifier:personal:decomissioned:currentOutgoingRatchetState:dateCreated:statusType:presenceIdentifier:serviceIdentifier:invitedUsers:presenceServerKey:presencePeerKey:presenceMembershipKey:", v28, v30, v29, v27, v26, v25, v24, v23, v22, v16, v17, v18, v19, v20);

  return v32;
}

@end
