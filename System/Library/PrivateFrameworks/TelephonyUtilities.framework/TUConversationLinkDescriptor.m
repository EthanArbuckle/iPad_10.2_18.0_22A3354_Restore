@implementation TUConversationLinkDescriptor

- (TUConversationLinkDescriptor)initWithGroupUUID:(id)a3 originator:(id)a4 pseudonym:(id)a5 publicKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUConversationLinkDescriptor *v15;
  TUConversationLinkDescriptor *v16;
  uint64_t v17;
  NSString *pseudonym;
  uint64_t v19;
  NSData *publicKey;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TUConversationLinkDescriptor;
  v15 = -[TUConversationLinkDescriptor init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupUUID, a3);
    objc_storeStrong((id *)&v16->_originator, a4);
    v17 = objc_msgSend(v13, "copy");
    pseudonym = v16->_pseudonym;
    v16->_pseudonym = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    publicKey = v16->_publicKey;
    v16->_publicKey = (NSData *)v19;

  }
  return v16;
}

- (TUConversationLinkDescriptor)initWithConversationLinkDescriptor:(id)a3
{
  id v4;
  TUConversationLinkDescriptor *v5;
  TUConversationLinkDescriptor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationLinkDescriptor;
  v5 = -[TUConversationLinkDescriptor init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_activated = *((_BYTE *)v4 + 8);
    objc_storeStrong((id *)&v5->_creationDate, *((id *)v4 + 2));
    objc_storeStrong((id *)&v6->_deletionDate, *((id *)v4 + 3));
    objc_storeStrong((id *)&v6->_expirationDate, *((id *)v4 + 4));
    objc_storeStrong((id *)&v6->_groupUUID, *((id *)v4 + 7));
    objc_storeStrong((id *)&v6->_invitedHandles, *((id *)v4 + 8));
    objc_storeStrong((id *)&v6->_name, *((id *)v4 + 9));
    objc_storeStrong((id *)&v6->_originator, *((id *)v4 + 10));
    objc_storeStrong((id *)&v6->_privateKey, *((id *)v4 + 11));
    objc_storeStrong((id *)&v6->_pseudonym, *((id *)v4 + 12));
    objc_storeStrong((id *)&v6->_publicKey, *((id *)v4 + 13));
    v6->_version = *((_DWORD *)v4 + 3);
    v6->_linkLifetimeScope = *((_QWORD *)v4 + 5);
    v6->_deleteReason = *((_QWORD *)v4 + 6);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 activated;
  id v5;
  void *v6;
  NSDate *creationDate;
  void *v8;
  NSDate *deletionDate;
  void *v10;
  NSDate *expirationDate;
  void *v12;
  NSUUID *groupUUID;
  void *v14;
  NSSet *invitedHandles;
  void *v16;
  NSString *name;
  void *v18;
  TUConversationLinkOriginator *originator;
  void *v20;
  NSData *privateKey;
  void *v22;
  NSString *pseudonym;
  void *v24;
  NSData *publicKey;
  void *v26;
  uint64_t version;
  void *v28;
  int64_t linkLifetimeScope;
  void *v30;
  int64_t deleteReason;
  id v32;

  activated = self->_activated;
  v5 = a3;
  NSStringFromSelector(sel_isActivated);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", activated, v6);

  creationDate = self->_creationDate;
  NSStringFromSelector(sel_creationDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", creationDate, v8);

  deletionDate = self->_deletionDate;
  NSStringFromSelector(sel_deletionDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", deletionDate, v10);

  expirationDate = self->_expirationDate;
  NSStringFromSelector(sel_expirationDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", expirationDate, v12);

  groupUUID = self->_groupUUID;
  NSStringFromSelector(sel_groupUUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", groupUUID, v14);

  invitedHandles = self->_invitedHandles;
  NSStringFromSelector(sel_invitedHandles);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", invitedHandles, v16);

  name = self->_name;
  NSStringFromSelector(sel_name);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", name, v18);

  originator = self->_originator;
  NSStringFromSelector(sel_originator);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", originator, v20);

  privateKey = self->_privateKey;
  NSStringFromSelector(sel_privateKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", privateKey, v22);

  pseudonym = self->_pseudonym;
  NSStringFromSelector(sel_pseudonym);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", pseudonym, v24);

  publicKey = self->_publicKey;
  NSStringFromSelector(sel_publicKey);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", publicKey, v26);

  version = self->_version;
  NSStringFromSelector(sel_version);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt32:forKey:", version, v28);

  linkLifetimeScope = self->_linkLifetimeScope;
  NSStringFromSelector(sel_linkLifetimeScope);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", linkLifetimeScope, v30);

  deleteReason = self->_deleteReason;
  NSStringFromSelector(sel_deleteReason);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", deleteReason, v32);

}

- (TUConversationLinkDescriptor)initWithCoder:(id)a3
{
  id v4;
  TUConversationLinkDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDate *creationDate;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDate *deletionDate;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDate *expirationDate;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSUUID *groupUUID;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSSet *invitedHandles;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *name;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  TUConversationLinkOriginator *originator;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSData *privateKey;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSString *pseudonym;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSData *publicKey;
  void *v49;
  void *v50;
  void *v51;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)TUConversationLinkDescriptor;
  v5 = -[TUConversationLinkDescriptor init](&v53, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_isActivated);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activated = objc_msgSend(v4, "decodeBoolForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_creationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_deletionDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    deletionDate = v5->_deletionDate;
    v5->_deletionDate = (NSDate *)v13;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_expirationDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v17;

    v19 = objc_opt_class();
    NSStringFromSelector(sel_groupUUID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_invitedHandles);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    invitedHandles = v5->_invitedHandles;
    v5->_invitedHandles = (NSSet *)v27;

    v29 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v31;

    v33 = objc_opt_class();
    NSStringFromSelector(sel_originator);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    originator = v5->_originator;
    v5->_originator = (TUConversationLinkOriginator *)v35;

    v37 = objc_opt_class();
    NSStringFromSelector(sel_privateKey);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    privateKey = v5->_privateKey;
    v5->_privateKey = (NSData *)v39;

    v41 = objc_opt_class();
    NSStringFromSelector(sel_pseudonym);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    pseudonym = v5->_pseudonym;
    v5->_pseudonym = (NSString *)v43;

    v45 = objc_opt_class();
    NSStringFromSelector(sel_publicKey);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v47;

    NSStringFromSelector(sel_version);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", v49);

    NSStringFromSelector(sel_linkLifetimeScope);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_linkLifetimeScope = objc_msgSend(v4, "decodeIntegerForKey:", v50);

    NSStringFromSelector(sel_deleteReason);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deleteReason = objc_msgSend(v4, "decodeIntegerForKey:", v51);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationLinkDescriptor initWithConversationLinkDescriptor:](+[TUConversationLinkDescriptor allocWithZone:](TUConversationLinkDescriptor, "allocWithZone:", a3), "initWithConversationLinkDescriptor:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUConversationLinkDescriptor initWithConversationLinkDescriptor:](+[TUMutableConversationLinkDescriptor allocWithZone:](TUMutableConversationLinkDescriptor, "allocWithZone:", a3), "initWithConversationLinkDescriptor:", self);
}

- (id)description
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_isActivated);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%d"), v4, -[TUConversationLinkDescriptor isActivated](self, "isActivated"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_creationDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v5, v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_deletionDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor deletionDate](self, "deletionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v7, v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_expirationDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v9, v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_groupUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor groupUUID](self, "groupUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v11, v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_invitedHandles);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor invitedHandles](self, "invitedHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v13, v14);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_name);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v15, v16);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_originator);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor originator](self, "originator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v17, v18);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_privateKey);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor privateKey](self, "privateKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v19, v20);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_pseudonym);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor pseudonym](self, "pseudonym");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v21, v22);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_publicKey);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkDescriptor publicKey](self, "publicKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v23, v24);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_version);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%d"), v25, -[TUConversationLinkDescriptor version](self, "version"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_linkLifetimeScope);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v26, -[TUConversationLinkDescriptor linkLifetimeScope](self, "linkLifetimeScope"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_deleteReason);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v27, -[TUConversationLinkDescriptor deleteReason](self, "deleteReason"));

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v28 = (void *)objc_msgSend(v3, "copy");

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  void *v25;
  void *v26;
  void *v27;

  if (-[TUConversationLinkDescriptor isActivated](self, "isActivated"))
    v3 = 1231;
  else
    v3 = 1237;
  -[TUConversationLinkDescriptor creationDate](self, "creationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v27, "hash");
  -[TUConversationLinkDescriptor deletionDate](self, "deletionDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v26, "hash") ^ v3;
  -[TUConversationLinkDescriptor expirationDate](self, "expirationDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v25, "hash");
  -[TUConversationLinkDescriptor groupUUID](self, "groupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[TUConversationLinkDescriptor invitedHandles](self, "invitedHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5 ^ v8 ^ objc_msgSend(v9, "hash");
  -[TUConversationLinkDescriptor name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[TUConversationLinkDescriptor originator](self, "originator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[TUConversationLinkDescriptor privateKey](self, "privateKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[TUConversationLinkDescriptor pseudonym](self, "pseudonym");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  -[TUConversationLinkDescriptor publicKey](self, "publicKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  v21 = v20 ^ -[TUConversationLinkDescriptor version](self, "version");
  v22 = v21 ^ -[TUConversationLinkDescriptor linkLifetimeScope](self, "linkLifetimeScope");
  v23 = v18 ^ v22 ^ -[TUConversationLinkDescriptor deleteReason](self, "deleteReason");

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationLinkDescriptor *v4;
  BOOL v5;

  v4 = (TUConversationLinkDescriptor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationLinkDescriptor isEqualToConversationLinkDescriptor:](self, "isEqualToConversationLinkDescriptor:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConversationLinkDescriptor:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int64_t v22;
  int v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = -[TUConversationLinkDescriptor isActivated](self, "isActivated");
  if (v5 == objc_msgSend(v4, "isActivated"))
  {
    -[TUConversationLinkDescriptor creationDate](self, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationLinkDescriptor deletionDate](self, "deletionDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deletionDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        -[TUConversationLinkDescriptor expirationDate](self, "expirationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "expirationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          -[TUConversationLinkDescriptor groupUUID](self, "groupUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "groupUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14))
          {
            v36 = v13;
            -[TUConversationLinkDescriptor invitedHandles](self, "invitedHandles");
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "invitedHandles");
            v38 = (void *)v15;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (TUObjectsAreEqualOrNil(v15, (uint64_t)v37))
            {
              -[TUConversationLinkDescriptor name](self, "name");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)v16;
              if (TUObjectsAreEqualOrNil(v16, (uint64_t)v34))
              {
                -[TUConversationLinkDescriptor originator](self, "originator");
                v17 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "originator");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (void *)v17;
                if (TUObjectsAreEqualOrNil(v17, (uint64_t)v32))
                {
                  -[TUConversationLinkDescriptor privateKey](self, "privateKey");
                  v18 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "privateKey");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v30))
                  {
                    -[TUConversationLinkDescriptor pseudonym](self, "pseudonym");
                    v19 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "pseudonym");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = (void *)v19;
                    if (TUStringsAreEqualOrNil(v19, (uint64_t)v28))
                    {
                      -[TUConversationLinkDescriptor publicKey](self, "publicKey");
                      v20 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "publicKey");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = (void *)v20;
                      v21 = TUObjectsAreEqualOrNil(v20, (uint64_t)v26);
                      v13 = v36;
                      if (v21
                        && (v24 = -[TUConversationLinkDescriptor version](self, "version"),
                            v24 == objc_msgSend(v4, "version"))
                        && (v25 = -[TUConversationLinkDescriptor linkLifetimeScope](self, "linkLifetimeScope"),
                            v25 == objc_msgSend(v4, "linkLifetimeScope")))
                      {
                        v22 = -[TUConversationLinkDescriptor deleteReason](self, "deleteReason");
                        v6 = v22 == objc_msgSend(v4, "deleteReason");
                      }
                      else
                      {
                        v6 = 0;
                      }

                    }
                    else
                    {
                      v6 = 0;
                      v13 = v36;
                    }

                  }
                  else
                  {
                    v6 = 0;
                    v13 = v36;
                  }

                }
                else
                {
                  v6 = 0;
                  v13 = v36;
                }

              }
              else
              {
                v6 = 0;
                v13 = v36;
              }

            }
            else
            {
              v6 = 0;
              v13 = v36;
            }

          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_deletionDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (int64_t)linkLifetimeScope
{
  return self->_linkLifetimeScope;
}

- (void)setLinkLifetimeScope:(int64_t)a3
{
  self->_linkLifetimeScope = a3;
}

- (int64_t)deleteReason
{
  return self->_deleteReason;
}

- (void)setDeleteReason:(int64_t)a3
{
  self->_deleteReason = a3;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUUID, a3);
}

- (NSSet)invitedHandles
{
  return self->_invitedHandles;
}

- (void)setInvitedHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TUConversationLinkOriginator)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_originator, a3);
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_invitedHandles, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
