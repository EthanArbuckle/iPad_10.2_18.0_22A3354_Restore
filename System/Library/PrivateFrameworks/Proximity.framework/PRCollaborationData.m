@implementation PRCollaborationData

- (PRCollaborationData)initWithData:(id)a3 sendingPeer:(id)a4
{
  id v7;
  id v8;
  PRCollaborationData *v9;
  PRCollaborationData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRCollaborationData;
  v9 = -[PRCollaborationData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_sendingPeer, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSData *data;
  void *v7;
  PRPeer *sendingPeer;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    data = self->_data;
    objc_msgSend(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSData isEqualToData:](data, "isEqualToData:", v7))
    {
      sendingPeer = self->_sendingPeer;
      objc_msgSend(v5, "sendingPeer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PRPeer isEqual:](sendingPeer, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRCollaborationData initWithData:sendingPeer:]([PRCollaborationData alloc], "initWithData:sendingPeer:", self->_data, self->_sendingPeer);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRCollaborationData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRCollaborationData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SendingPeer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PRCollaborationData initWithData:sendingPeer:](self, "initWithData:sendingPeer:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("Data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sendingPeer, CFSTR("SendingPeer"));

}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (PRPeer)sendingPeer
{
  return (PRPeer *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingPeer, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
