@implementation TUConversationNotice

- (TUConversationNotice)initWithUUID:(id)a3
{
  id v5;
  TUConversationNotice *v6;
  TUConversationNotice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUConversationNotice;
  v6 = -[TUConversationNotice init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v7->_queueItemType = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationNotice UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUConversationNotice sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sessionUUID=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" sessionEventType=%ld"), -[TUConversationNotice sessionEventType](self, "sessionEventType"));
  -[TUConversationNotice actionURL](self, "actionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" actionURL=%@"), v6);

  -[TUConversationNotice bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" bundleIdentifier=%@"), v7);

  -[TUConversationNotice item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" item=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(" queueItemType=%ld"), -[TUConversationNotice queueItemType](self, "queueItemType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationNotice isEqualToConversationNotice:](self, "isEqualToConversationNotice:", v4);

  return v5;
}

- (BOOL)isEqualToConversationNotice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  BOOL v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  -[TUConversationNotice UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationNotice actionURL](self, "actionURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8)
      && (v9 = -[TUConversationNotice sessionEventType](self, "sessionEventType"),
          v9 == objc_msgSend(v4, "sessionEventType")))
    {
      -[TUConversationNotice sessionUUID](self, "sessionUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sessionUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        -[TUConversationNotice bundleIdentifier](self, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          v21 = v12;
          -[TUConversationNotice item](self, "item");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "item");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v14;
          if (objc_msgSend(v14, "isEqual:"))
          {
            v15 = -[TUConversationNotice queueItemType](self, "queueItemType");
            v16 = v15 == objc_msgSend(v4, "queueItemType");
            v12 = v21;
            if (v16)
            {
              -[TUConversationNotice session](self, "session");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "session");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = TUObjectsAreEqualOrNil((unint64_t)v20, (uint64_t)v19);

            }
            else
            {
              v17 = 0;
            }
          }
          else
          {
            v17 = 0;
            v12 = v21;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  unint64_t v16;

  -[TUConversationNotice sessionUUID](self, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[TUConversationNotice sessionEventType](self, "sessionEventType") ^ v4;
  -[TUConversationNotice actionURL](self, "actionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[TUConversationNotice UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[TUConversationNotice bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[TUConversationNotice item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v9 ^ v13 ^ -[TUConversationNotice queueItemType](self, "queueItemType");
  -[TUConversationNotice session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationNotice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUConversationNotice *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUUID *sessionUUID;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSURL *actionURL;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *bundleIdentifier;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *item;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  TUConversationActivitySession *session;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TUConversationNotice initWithUUID:](self, "initWithUUID:", v7);
  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_sessionUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v8->_sessionUUID;
    v8->_sessionUUID = (NSUUID *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_actionURL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    actionURL = v8->_actionURL;
    v8->_actionURL = (NSURL *)v15;

    NSStringFromSelector(sel_sessionEventType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sessionEventType = objc_msgSend(v4, "decodeIntegerForKey:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_bundleIdentifier);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_item);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    item = v8->_item;
    v8->_item = (NSString *)v24;

    NSStringFromSelector(sel_queueItemType);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_queueItemType = objc_msgSend(v4, "decodeIntegerForKey:", v26);

    v27 = objc_opt_class();
    NSStringFromSelector(sel_session);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    session = v8->_session;
    v8->_session = (TUConversationActivitySession *)v29;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = -[TUConversationNotice sessionEventType](self, "sessionEventType");
  NSStringFromSelector(sel_sessionEventType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[TUConversationNotice UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationNotice sessionUUID](self, "sessionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessionUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUConversationNotice actionURL](self, "actionURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_actionURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationNotice bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUConversationNotice item](self, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_item);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[TUConversationNotice queueItemType](self, "queueItemType");
  NSStringFromSelector(sel_queueItemType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v17, v18);

  -[TUConversationNotice session](self, "session");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_session);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, v19);

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (int64_t)sessionEventType
{
  return self->_sessionEventType;
}

- (void)setSessionEventType:(int64_t)a3
{
  self->_sessionEventType = a3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)queueItemType
{
  return self->_queueItemType;
}

- (void)setQueueItemType:(int64_t)a3
{
  self->_queueItemType = a3;
}

- (TUConversationActivitySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
