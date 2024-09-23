@implementation TUContinuityCall

- (TUContinuityCall)initWithUUID:(id)a3 displayName:(id)a4 status:(int)a5 conversationUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  TUContinuityCall *v13;
  uint64_t v14;
  NSUUID *uuid;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSUUID *conversationUUID;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)TUContinuityCall;
  v13 = -[TUContinuityCall init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v14;

    v16 = objc_msgSend(v11, "copy");
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v16;

    v13->_status = a5;
    v18 = objc_msgSend(v12, "copy");
    conversationUUID = v13->_conversationUUID;
    v13->_conversationUUID = (NSUUID *)v18;

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

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" displayName=%@"), self->_displayName);
  objc_msgSend(v6, "appendFormat:", CFSTR(" status=%i"), self->_status);
  objc_msgSend(v6, "appendFormat:", CFSTR(" conversationUUID=%@"), self->_conversationUUID);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityCall)initWithCoder:(id)a3
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
  TUContinuityCall *v16;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(sel_displayName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_status);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntForKey:", v11);
  v13 = objc_opt_class();
  NSStringFromSelector(sel_conversationUUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[TUContinuityCall initWithUUID:displayName:status:conversationUUID:](self, "initWithUUID:displayName:status:conversationUUID:", v7, v10, v12, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;
  void *v6;
  NSString *displayName;
  void *v8;
  uint64_t status;
  void *v10;
  NSUUID *conversationUUID;
  id v12;

  uuid = self->_uuid;
  v5 = a3;
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v6);

  displayName = self->_displayName;
  NSStringFromSelector(sel_displayName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", displayName, v8);

  status = self->_status;
  NSStringFromSelector(sel_status);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt:forKey:", status, v10);

  conversationUUID = self->_conversationUUID;
  NSStringFromSelector(sel_conversationUUID);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", conversationUUID, v12);

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int)status
{
  return self->_status;
}

- (NSUUID)conversationUUID
{
  return self->_conversationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
