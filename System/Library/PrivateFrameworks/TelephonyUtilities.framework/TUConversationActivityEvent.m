@implementation TUConversationActivityEvent

- (TUConversationActivityEvent)initWithSessionUUID:(id)a3 originator:(id)a4 type:(int64_t)a5
{
  id v9;
  id v10;
  TUConversationActivityEvent *v11;
  TUConversationActivityEvent *v12;
  NSString *localizedDescription;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUConversationActivityEvent;
  v11 = -[TUConversationActivityEvent init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionUUID, a3);
    objc_storeStrong((id *)&v12->_originator, a4);
    v12->_type = a5;
    localizedDescription = v12->_localizedDescription;
    v12->_localizedDescription = (NSString *)&stru_1E38A53C8;

    v12->_queueItemType = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityEvent sessionUUID](self, "sessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sessionUUID=%@"), v4);

  -[TUConversationActivityEvent originator](self, "originator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" originator=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" type=%ld"), -[TUConversationActivityEvent type](self, "type"));
  -[TUConversationActivityEvent item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" item=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" queueItemType=%d"), -[TUConversationActivityEvent queueItemType](self, "queueItemType"));
  -[TUConversationActivityEvent url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" url=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationActivityEvent isEqualToConversationActivityEvent:](self, "isEqualToConversationActivityEvent:", v4);

  return v5;
}

- (BOOL)isEqualToConversationActivityEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;

  v4 = a3;
  -[TUConversationActivityEvent sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationActivityEvent originator](self, "originator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToParticipant:", v8)
      && (v9 = -[TUConversationActivityEvent type](self, "type"), v9 == objc_msgSend(v4, "type")))
    {
      -[TUConversationActivityEvent item](self, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11)
        && (v12 = -[TUConversationActivityEvent queueItemType](self, "queueItemType"),
            v12 == objc_msgSend(v4, "queueItemType")))
      {
        -[TUConversationActivityEvent session](self, "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14))
        {
          -[TUConversationActivityEvent url](self, "url");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "url");
          v19 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = TUObjectsAreEqualOrNil((unint64_t)v18, (uint64_t)v15);

          v13 = v19;
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[TUConversationActivityEvent sessionUUID](self, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationActivityEvent originator](self, "originator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[TUConversationActivityEvent type](self, "type");
  -[TUConversationActivityEvent item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[TUConversationActivityEvent queueItemType](self, "queueItemType");
  -[TUConversationActivityEvent session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[TUConversationActivityEvent url](self, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivityEvent sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityEvent originator](self, "originator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSessionUUID:originator:type:", v5, v6, -[TUConversationActivityEvent type](self, "type"));

  -[TUConversationActivityEvent item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItem:", v8);

  objc_msgSend(v7, "setQueueItemType:", -[TUConversationActivityEvent queueItemType](self, "queueItemType"));
  -[TUConversationActivityEvent session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSession:", v9);

  -[TUConversationActivityEvent url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUrl:", v10);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivityEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  TUConversationActivityEvent *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_originator);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_type);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  v13 = objc_opt_class();
  NSStringFromSelector("url");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[TUConversationActivityEvent initWithSessionUUID:originator:type:](self, "initWithSessionUUID:originator:type:", v7, v10, v12);
  v17 = objc_opt_class();
  NSStringFromSelector(sel_item);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityEvent setItem:](v16, "setItem:", v19);

  NSStringFromSelector(sel_queueItemType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityEvent setQueueItemType:](v16, "setQueueItemType:", objc_msgSend(v4, "decodeIntegerForKey:", v20));

  v21 = objc_opt_class();
  NSStringFromSelector(sel_session);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUConversationActivityEvent setSession:](v16, "setSession:", v23);
  -[TUConversationActivityEvent setUrl:](v16, "setUrl:", v15);

  return v16;
}

- (void)encodeWithCoder:(id)a3
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
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[TUConversationActivityEvent sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessionUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivityEvent originator](self, "originator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originator);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[TUConversationActivityEvent type](self, "type");
  NSStringFromSelector(sel_type);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[TUConversationActivityEvent item](self, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_item);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[TUConversationActivityEvent queueItemType](self, "queueItemType");
  NSStringFromSelector(sel_queueItemType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

  -[TUConversationActivityEvent session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_session);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUConversationActivityEvent url](self, "url");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, v17);

}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (TUConversationParticipant)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_originator, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)queueItemType
{
  return self->_queueItemType;
}

- (void)setQueueItemType:(int64_t)a3
{
  self->_queueItemType = a3;
}

- (NSString)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (TUConversationActivitySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
