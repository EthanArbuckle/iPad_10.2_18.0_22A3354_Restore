@implementation SKADecryptedStatusPayload

- (SKADecryptedStatusPayload)initWithStatusPayload:(id)a3 invitation:(id)a4
{
  id v7;
  id v8;
  SKADecryptedStatusPayload *v9;
  SKADecryptedStatusPayload *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKADecryptedStatusPayload;
  v9 = -[SKADecryptedStatusPayload init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statusPayload, a3);
    objc_storeStrong((id *)&v10->_invitation, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKADecryptedStatusPayload statusPayload](self, "statusPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADecryptedStatusPayload invitation](self, "invitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; statusPayload = \"%@\"; invitation = \"%@\">;"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (SKADatabaseReceivedInvitation)invitation
{
  return self->_invitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
}

@end
