@implementation TUConversationMemberAssociation

- (TUConversationMemberAssociation)initWithMemberAssociation:(id)a3
{
  id v4;
  TUConversationMemberAssociation *v5;
  uint64_t v6;
  TUHandle *handle;
  void *v8;
  uint64_t v9;
  NSString *avcIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUConversationMemberAssociation;
  v5 = -[TUConversationMemberAssociation init](&v12, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "handle");
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v6;

    v5->_primary = objc_msgSend(v4, "isPrimary");
    v5->_identifier = objc_msgSend(v4, "identifier");
    objc_msgSend(v4, "avcIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v9;

  }
  return v5;
}

- (TUConversationMemberAssociation)initWithHandle:(id)a3 type:(int64_t)a4 primary:(BOOL)a5
{
  id v9;
  TUConversationMemberAssociation *v10;
  TUConversationMemberAssociation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUConversationMemberAssociation;
  v10 = -[TUConversationMemberAssociation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a4;
    objc_storeStrong((id *)&v10->_handle, a3);
    v11->_primary = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationMemberAssociation)initWithCoder:(id)a3
{
  id v4;
  TUConversationMemberAssociation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  TUHandle *handle;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *avcIdentifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationMemberAssociation;
  v5 = -[TUConversationMemberAssociation init](&v18, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v9;

    NSStringFromSelector(sel_isPrimary);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_primary = objc_msgSend(v4, "decodeBoolForKey:", v11);

    NSStringFromSelector(sel_identifier);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v4, "decodeInt64ForKey:", v12);

    v13 = objc_opt_class();
    NSStringFromSelector(sel_avcIdentifier);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = -[TUConversationMemberAssociation type](self, "type");
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[TUConversationMemberAssociation handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[TUConversationMemberAssociation isPrimary](self, "isPrimary");
  NSStringFromSelector(sel_isPrimary);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[TUConversationMemberAssociation identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v11, v12);

  -[TUConversationMemberAssociation avcIdentifier](self, "avcIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avcIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v13);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationMemberAssociation initWithMemberAssociation:](+[TUConversationMemberAssociation allocWithZone:](TUConversationMemberAssociation, "allocWithZone:", a3), "initWithMemberAssociation:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" type=%zd"), -[TUConversationMemberAssociation type](self, "type"));
  -[TUConversationMemberAssociation handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handle=%@"), v4);

  v5 = -[TUConversationMemberAssociation isPrimary](self, "isPrimary");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(" isPrimary=%@"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier=%llu"), -[TUConversationMemberAssociation identifier](self, "identifier"));
  -[TUConversationMemberAssociation avcIdentifier](self, "avcIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUConversationMemberAssociation avcIdentifier](self, "avcIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" avcIdentifier=%@"), v8);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TUConversationMemberAssociation type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationMemberAssociation handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUConversationMemberAssociation isPrimary](self, "isPrimary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[TUConversationMemberAssociation identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[TUConversationMemberAssociation avcIdentifier](self, "avcIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

+ (id)messagingDataWithType:(int64_t)a3 primaryHandle:(id)a4 primaryIdentifier:(unint64_t)a5 primaryAvcIdentifier:(id)a6 associatedPseudonym:(id)a7 conversationGroupUUIDString:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  CSDMessagingMemberAssociationClaim *v17;
  void *v18;
  void *v19;
  void *v20;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = objc_alloc_init(CSDMessagingMemberAssociationClaim);
  -[CSDMessagingMemberAssociationClaim setType:](v17, "setType:", a3);
  +[CSDMessagingHandle handleWithTUHandle:](CSDMessagingHandle, "handleWithTUHandle:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSDMessagingMemberAssociationClaim setPrimaryHandle:](v17, "setPrimaryHandle:", v18);
  -[CSDMessagingMemberAssociationClaim setPrimaryIdentifier:](v17, "setPrimaryIdentifier:", a5);
  -[CSDMessagingMemberAssociationClaim setPrimaryAvcIdentifier:](v17, "setPrimaryAvcIdentifier:", v15);

  +[CSDMessagingHandle handleWithTUHandle:](CSDMessagingHandle, "handleWithTUHandle:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSDMessagingMemberAssociationClaim setAssociatedPseudonym:](v17, "setAssociatedPseudonym:", v19);
  -[CSDMessagingMemberAssociationClaim setConversationGroupUUIDString:](v17, "setConversationGroupUUIDString:", v13);

  -[CSDMessagingMemberAssociationClaim data](v17, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)associationForHandle:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  CSDMessagingMemberAssociationClaim *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[CSDMessagingMemberAssociationClaim initWithData:]([CSDMessagingMemberAssociationClaim alloc], "initWithData:", v5);

  -[CSDMessagingMemberAssociationClaim tuAssociationForHandle:](v7, "tuAssociationForHandle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationMemberAssociation *v4;
  BOOL v5;

  v4 = (TUConversationMemberAssociation *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationMemberAssociation isEqualToAssociation:](self, "isEqualToAssociation:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAssociation:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[TUConversationMemberAssociation type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[TUConversationMemberAssociation handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToHandle:", v7)
      && (v8 = -[TUConversationMemberAssociation isPrimary](self, "isPrimary"),
          v8 == objc_msgSend(v4, "isPrimary"))
      && (v9 = -[TUConversationMemberAssociation identifier](self, "identifier"), v9 == objc_msgSend(v4, "identifier")))
    {
      -[TUConversationMemberAssociation avcIdentifier](self, "avcIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "avcIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)messagingData
{
  return self->_messagingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingData, 0);
  objc_storeStrong((id *)&self->_avcIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
