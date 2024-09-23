@implementation SKADatabaseReceivedInvitation

- (SKADatabaseReceivedInvitation)initWithCoreDataReceivedInvitation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  SKADatabaseReceivedInvitation *v17;

  v3 = a3;
  objc_msgSend(v3, "invitationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invitedHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInvitationCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incomingRatchetState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presenceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peerKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invitationPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SKADatabaseReceivedInvitation initWithInvitationIdentifier:senderHandle:invitedHandle:statusTypeIdentifier:dateInvitationCreated:incomingRatchetState:presenceIdentifier:channelToken:serverKey:peerKey:invitationPayload:](self, "initWithInvitationIdentifier:senderHandle:invitedHandle:statusTypeIdentifier:dateInvitationCreated:incomingRatchetState:presenceIdentifier:channelToken:serverKey:peerKey:invitationPayload:", v4, v15, v14, v5, v6, v7, v13, v8, v9, v10, v11);
  return v17;
}

- (SKADatabaseReceivedInvitation)initWithInvitationIdentifier:(id)a3 senderHandle:(id)a4 invitedHandle:(id)a5 statusTypeIdentifier:(id)a6 dateInvitationCreated:(id)a7 incomingRatchetState:(id)a8 presenceIdentifier:(id)a9 channelToken:(id)a10 serverKey:(id)a11 peerKey:(id)a12 invitationPayload:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  SKADatabaseReceivedInvitation *v22;
  uint64_t v23;
  NSString *invitationIdentifier;
  uint64_t v25;
  NSString *statusTypeIdentifier;
  uint64_t v27;
  NSString *presenceIdentifier;
  uint64_t v29;
  NSString *senderHandle;
  uint64_t v31;
  NSString *invitedHandle;
  uint64_t v33;
  NSData *invitationPayload;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v42 = a4;
  v18 = a5;
  v19 = a6;
  v41 = a7;
  v39 = a8;
  v20 = a9;
  v37 = a10;
  v40 = a11;
  v38 = a12;
  v21 = a13;
  v44.receiver = self;
  v44.super_class = (Class)SKADatabaseReceivedInvitation;
  v22 = -[SKADatabaseReceivedInvitation init](&v44, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v43, "copy");
    invitationIdentifier = v22->_invitationIdentifier;
    v22->_invitationIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v19, "copy");
    statusTypeIdentifier = v22->_statusTypeIdentifier;
    v22->_statusTypeIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v20, "copy");
    presenceIdentifier = v22->_presenceIdentifier;
    v22->_presenceIdentifier = (NSString *)v27;

    objc_storeStrong((id *)&v22->_channelToken, a10);
    objc_storeStrong((id *)&v22->_serverKey, a11);
    objc_storeStrong((id *)&v22->_peerKey, a12);
    v29 = objc_msgSend(v42, "copy");
    senderHandle = v22->_senderHandle;
    v22->_senderHandle = (NSString *)v29;

    v31 = objc_msgSend(v18, "copy");
    invitedHandle = v22->_invitedHandle;
    v22->_invitedHandle = (NSString *)v31;

    objc_storeStrong((id *)&v22->_dateInvitationCreated, a7);
    objc_storeStrong((id *)&v22->_incomingRatchetState, a8);
    v33 = objc_msgSend(v21, "copy");
    invitationPayload = v22->_invitationPayload;
    v22->_invitationPayload = (NSData *)v33;

    v22->_invitationType = v19 == 0;
  }

  return v22;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKADatabaseReceivedInvitation invitationIdentifier](self, "invitationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseReceivedInvitation dateInvitationCreated](self, "dateInvitationCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseReceivedInvitation skInvitationPayload](self, "skInvitationPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = \"%@\"; dateCreated = \"%@\"; invitationPayload: \"%@\">"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)logger
{
  if (logger_onceToken_13 != -1)
    dispatch_once(&logger_onceToken_13, &__block_literal_global_13);
  return (id)logger__logger_13;
}

void __39__SKADatabaseReceivedInvitation_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKADatabaseReceivedInvitation");
  v1 = (void *)logger__logger_13;
  logger__logger_13 = (uint64_t)v0;

}

- (int64_t)invitationType
{
  return self->_invitationType;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)invitedHandle
{
  return self->_invitedHandle;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (NSData)channelToken
{
  return self->_channelToken;
}

- (NSData)peerKey
{
  return self->_peerKey;
}

- (NSData)serverKey
{
  return self->_serverKey;
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSDate)dateInvitationCreated
{
  return self->_dateInvitationCreated;
}

- (NSData)incomingRatchetState
{
  return self->_incomingRatchetState;
}

- (NSData)invitationPayload
{
  return self->_invitationPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationPayload, 0);
  objc_storeStrong((id *)&self->_incomingRatchetState, 0);
  objc_storeStrong((id *)&self->_dateInvitationCreated, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_serverKey, 0);
  objc_storeStrong((id *)&self->_peerKey, 0);
  objc_storeStrong((id *)&self->_channelToken, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_invitedHandle, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
}

- (SKHandle)invitedSKHandle
{
  NSString *v2;
  void *v3;

  v2 = self->_invitedHandle;
  if (-[NSString length](v2, "length"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v2);
  else
    v3 = 0;

  return (SKHandle *)v3;
}

- (SKHandle)senderSKHandle
{
  NSString *v2;
  void *v3;

  v2 = self->_senderHandle;
  if (-[NSString length](v2, "length"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1028]), "initWithString:", v2);
  else
    v3 = 0;

  return (SKHandle *)v3;
}

- (MPStatusKitIncomingRatchet)incomingRatchet
{
  NSData *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v2 = self->_incomingRatchetState;
  if (v2)
  {
    v7 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66648]), "initWithData:error:", v2, &v7);
    v4 = v7;
    if (!v3)
    {
      +[SKADatabaseReceivedInvitation logger](SKADatabaseReceivedInvitation, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SKADatabaseReceivedInvitation(IncomingRatchet) incomingRatchet].cold.1((uint64_t)v4, v5);

    }
  }
  else
  {
    v3 = 0;
  }

  return (MPStatusKitIncomingRatchet *)v3;
}

- (SKInvitationPayload)skInvitationPayload
{
  NSData *invitationPayload;
  objc_class *v3;
  NSData *v4;
  void *v5;

  invitationPayload = self->_invitationPayload;
  if (invitationPayload)
  {
    v3 = (objc_class *)MEMORY[0x24BEB1040];
    v4 = invitationPayload;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithData:dateCreated:", v4, 0);

  }
  else
  {
    v5 = 0;
  }
  return (SKInvitationPayload *)v5;
}

@end
