@implementation SKADatabaseInvitedUser

- (SKADatabaseInvitedUser)initWithCoreDataInvitedUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKADatabaseInvitedUser *v9;

  v4 = a3;
  objc_msgSend(v4, "invitedHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invitationPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInvitationPayloadCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SKADatabaseInvitedUser initWithInvitedHandle:senderHande:invitationPayloadData:dateInvitationPayloadCreated:](self, "initWithInvitedHandle:senderHande:invitationPayloadData:dateInvitationPayloadCreated:", v5, v6, v7, v8);
  return v9;
}

- (SKADatabaseInvitedUser)initWithInvitedHandle:(id)a3 senderHande:(id)a4 invitationPayloadData:(id)a5 dateInvitationPayloadCreated:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKADatabaseInvitedUser *v14;
  uint64_t v15;
  NSString *invitedHandle;
  uint64_t v17;
  NSString *senderHandle;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SKADatabaseInvitedUser;
  v14 = -[SKADatabaseInvitedUser init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    invitedHandle = v14->_invitedHandle;
    v14->_invitedHandle = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    senderHandle = v14->_senderHandle;
    v14->_senderHandle = (NSString *)v17;

    objc_storeStrong((id *)&v14->_invitationPayloadData, a5);
    objc_storeStrong((id *)&v14->_dateInvitationPayloadCreated, a6);
  }

  return v14;
}

- (NSString)invitedHandle
{
  return self->_invitedHandle;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSData)invitationPayloadData
{
  return self->_invitationPayloadData;
}

- (NSDate)dateInvitationPayloadCreated
{
  return self->_dateInvitationPayloadCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInvitationPayloadCreated, 0);
  objc_storeStrong((id *)&self->_invitationPayloadData, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_invitedHandle, 0);
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

- (SKInvitationPayload)invitationPayload
{
  void *v2;

  if (self->_dateInvitationPayloadCreated)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1040]), "initWithData:dateCreated:", self->_invitationPayloadData, self->_dateInvitationPayloadCreated);
  else
    v2 = 0;
  return (SKInvitationPayload *)v2;
}

@end
