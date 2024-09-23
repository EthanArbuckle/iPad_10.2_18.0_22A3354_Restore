@implementation TUSplitSessionInfo

- (TUSplitSessionInfo)initWithConversationID:(id)a3 device:(id)a4 handoffContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUSplitSessionInfo *v12;
  TUSplitSessionInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUSplitSessionInfo;
  v12 = -[TUSplitSessionInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversationID, a3);
    objc_storeStrong((id *)&v13->_device, a4);
    objc_storeStrong((id *)&v13->_handoffContext, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSUUID UUIDString](self->_conversationID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" conversationID=%@"), v7);

  -[TUNearbyDeviceHandle description](self->_device, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" device=%@"), v8);

  -[TUNeighborhoodHandoffContext description](self->_handoffContext, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" handoffContext=%@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSplitSessionInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  TUSplitSessionInfo *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_conversationID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_device);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_handoffContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[TUSplitSessionInfo initWithConversationID:device:handoffContext:](self, "initWithConversationID:device:handoffContext:", v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *conversationID;
  id v5;
  void *v6;
  TUNearbyDeviceHandle *device;
  void *v8;
  TUNeighborhoodHandoffContext *handoffContext;
  id v10;

  conversationID = self->_conversationID;
  v5 = a3;
  NSStringFromSelector(sel_conversationID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", conversationID, v6);

  device = self->_device;
  NSStringFromSelector(sel_device);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", device, v8);

  handoffContext = self->_handoffContext;
  NSStringFromSelector(sel_handoffContext);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", handoffContext, v10);

}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (TUNearbyDeviceHandle)device
{
  return self->_device;
}

- (TUNeighborhoodHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffContext, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end
