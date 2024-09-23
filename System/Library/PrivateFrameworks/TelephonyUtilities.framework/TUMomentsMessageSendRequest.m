@implementation TUMomentsMessageSendRequest

- (TUMomentsMessageSendRequest)initWithSessionUUID:(id)a3 conversationID:(id)a4 senderHandle:(id)a5 destinationHandles:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUMomentsMessageSendRequest *v15;
  TUMomentsMessageSendRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUMomentsMessageSendRequest;
  v15 = -[TUMomentsMessageSendRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionUUID, a3);
    objc_storeStrong((id *)&v16->_conversationID, a4);
    objc_storeStrong((id *)&v16->_senderHandle, a5);
    objc_storeStrong((id *)&v16->_destinationHandles, a6);
  }

  return v16;
}

- (TUMomentsMessageSendRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  TUMomentsMessageSendRequest *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("destinationHandles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0 || v8 == 0)
  {
    v12 = 0;
  }
  else
  {
    self = -[TUMomentsMessageSendRequest initWithSessionUUID:conversationID:senderHandle:destinationHandles:](self, "initWithSessionUUID:conversationID:senderHandle:destinationHandles:", v5, v6, v7, v8);
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TUMomentsMessageSendRequest sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionUUID"));

  -[TUMomentsMessageSendRequest conversationID](self, "conversationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("conversationID"));

  -[TUMomentsMessageSendRequest senderHandle](self, "senderHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("senderHandle"));

  -[TUMomentsMessageSendRequest destinationHandles](self, "destinationHandles");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("destinationHandles"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (TUHandle)senderHandle
{
  return self->_senderHandle;
}

- (NSSet)destinationHandles
{
  return self->_destinationHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationHandles, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
