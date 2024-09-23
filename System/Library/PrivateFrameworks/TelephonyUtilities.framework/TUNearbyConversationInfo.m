@implementation TUNearbyConversationInfo

- (TUNearbyConversationInfo)initWithConversationUUID:(id)a3 userProfileIdentifier:(id)a4 deviceHandle:(id)a5 avMode:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  TUNearbyConversationInfo *v13;
  uint64_t v14;
  NSUUID *conversationUUID;
  uint64_t v16;
  NSString *userProfileIdentifier;
  uint64_t v18;
  TUNearbyDeviceHandle *deviceHandle;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TUNearbyConversationInfo;
  v13 = -[TUNearbyConversationInfo init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    conversationUUID = v13->_conversationUUID;
    v13->_conversationUUID = (NSUUID *)v14;

    v16 = objc_msgSend(v11, "copy");
    userProfileIdentifier = v13->_userProfileIdentifier;
    v13->_userProfileIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    deviceHandle = v13->_deviceHandle;
    v13->_deviceHandle = (TUNearbyDeviceHandle *)v18;

    v13->_avMode = a6;
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
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUNearbyConversationInfo conversationUUID](self, "conversationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" conversationUUID=%@"), v7);

  -[TUNearbyConversationInfo userProfileIdentifier](self, "userProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" userProfileIdentifier=%@"), v8);

  -[TUNearbyConversationInfo deviceHandle](self, "deviceHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" deviceHandle=%@"), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR(" avMode=%lu"), -[TUNearbyConversationInfo avMode](self, "avMode"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbyConversationInfo)initWithCoder:(id)a3
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
  void *v14;
  uint64_t v15;
  TUNearbyConversationInfo *v16;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_conversationUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_userProfileIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_deviceHandle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_avMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", v14);

  v16 = -[TUNearbyConversationInfo initWithConversationUUID:userProfileIdentifier:deviceHandle:avMode:](self, "initWithConversationUUID:userProfileIdentifier:deviceHandle:avMode:", v7, v10, v13, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  v4 = a3;
  -[TUNearbyConversationInfo conversationUUID](self, "conversationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_conversationUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUNearbyConversationInfo userProfileIdentifier](self, "userProfileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userProfileIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUNearbyConversationInfo deviceHandle](self, "deviceHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceHandle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[TUNearbyConversationInfo avMode](self, "avMode");
  NSStringFromSelector(sel_avMode);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUNearbyConversationInfo conversationUUID](self, "conversationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[TUNearbyConversationInfo userProfileIdentifier](self, "userProfileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[TUNearbyConversationInfo deviceHandle](self, "deviceHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = (void *)objc_msgSend(v4, "initWithConversationUUID:userProfileIdentifier:deviceHandle:avMode:", v6, v8, v10, -[TUNearbyConversationInfo avMode](self, "avMode"));

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[TUNearbyConversationInfo conversationUUID](self, "conversationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUNearbyConversationInfo userProfileIdentifier](self, "userProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUNearbyConversationInfo deviceHandle](self, "deviceHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[TUNearbyConversationInfo avMode](self, "avMode");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TUNearbyConversationInfo *v4;
  BOOL v5;

  v4 = (TUNearbyConversationInfo *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUNearbyConversationInfo isEqualToConversationInfo:](self, "isEqualToConversationInfo:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConversationInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  BOOL v12;

  v4 = a3;
  -[TUNearbyConversationInfo conversationUUID](self, "conversationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUNearbyConversationInfo userProfileIdentifier](self, "userProfileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userProfileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[TUNearbyConversationInfo deviceHandle](self, "deviceHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEquivalentToDeviceHandle:", v10))
      {
        v11 = -[TUNearbyConversationInfo avMode](self, "avMode");
        v12 = v11 == objc_msgSend(v4, "avMode");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSUUID)conversationUUID
{
  return self->_conversationUUID;
}

- (NSString)userProfileIdentifier
{
  return self->_userProfileIdentifier;
}

- (TUNearbyDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_userProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationUUID, 0);
}

@end
