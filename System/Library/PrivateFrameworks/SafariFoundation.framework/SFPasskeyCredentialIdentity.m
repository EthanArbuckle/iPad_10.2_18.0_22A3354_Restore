@implementation SFPasskeyCredentialIdentity

- (SFPasskeyCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8 credentialID:(id)a9 userHandle:(id)a10
{
  id v17;
  id v18;
  SFPasskeyCredentialIdentity *v19;
  uint64_t v20;
  NSString *credentialID;
  uint64_t v22;
  NSString *userHandle;
  SFPasskeyCredentialIdentity *v24;
  objc_super v26;

  v17 = a9;
  v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)SFPasskeyCredentialIdentity;
  v19 = -[SFCredentialIdentity initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:](&v26, sel_initWithRowIdentifier_serviceIdentifier_serviceIdentifierType_externalRecordIdentifier_user_rank_, a3, a4, a5, a6, a7, a8);
  if (v19)
  {
    v20 = objc_msgSend(v17, "copy");
    credentialID = v19->_credentialID;
    v19->_credentialID = (NSString *)v20;

    v22 = objc_msgSend(v18, "copy");
    userHandle = v19->_userHandle;
    v19->_userHandle = (NSString *)v22;

    v24 = v19;
  }

  return v19;
}

- (SFPasskeyCredentialIdentity)initWithServiceIdentifier:(id)a3 serviceIdentifierType:(int64_t)a4 externalRecordIdentifier:(id)a5 user:(id)a6 rank:(int64_t)a7 credentialID:(id)a8 userHandle:(id)a9
{
  id v15;
  id v16;
  SFPasskeyCredentialIdentity *v17;
  uint64_t v18;
  NSString *credentialID;
  uint64_t v20;
  NSString *userHandle;
  SFPasskeyCredentialIdentity *v22;
  objc_super v24;

  v15 = a8;
  v16 = a9;
  v24.receiver = self;
  v24.super_class = (Class)SFPasskeyCredentialIdentity;
  v17 = -[SFCredentialIdentity initWithServiceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:](&v24, sel_initWithServiceIdentifier_serviceIdentifierType_externalRecordIdentifier_user_rank_, a3, a4, a5, a6, a7);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    credentialID = v17->_credentialID;
    v17->_credentialID = (NSString *)v18;

    v20 = objc_msgSend(v16, "copy");
    userHandle = v17->_userHandle;
    v17->_userHandle = (NSString *)v20;

    v22 = v17;
  }

  return v17;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  SFPasskeyCredentialIdentity *v4;
  SFPasskeyCredentialIdentity *v5;
  char v6;
  objc_super v8;

  v4 = (SFPasskeyCredentialIdentity *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8.receiver = self;
      v8.super_class = (Class)SFPasskeyCredentialIdentity;
      if (-[SFCredentialIdentity isEqual:](&v8, sel_isEqual_, v5)
        && -[NSString isEqual:](self->_credentialID, "isEqual:", v5->_credentialID))
      {
        v6 = -[NSString isEqual:](self->_userHandle, "isEqual:", v5->_userHandle);
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

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPasskeyCredentialIdentity)initWithCoder:(id)a3
{
  id v4;
  SFPasskeyCredentialIdentity *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *credentialID;
  uint64_t v10;
  NSString *userHandle;
  SFPasskeyCredentialIdentity *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFPasskeyCredentialIdentity;
  v5 = -[SFCredentialIdentity initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "copy");
    credentialID = v5->_credentialID;
    v5->_credentialID = (NSString *)v8;

    v10 = objc_msgSend(v7, "copy");
    userHandle = v5->_userHandle;
    v5->_userHandle = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFPasskeyCredentialIdentity;
  v4 = a3;
  -[SFCredentialIdentity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userHandle, CFSTR("userHandle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SFPasskeyCredentialIdentity *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  SFPasskeyCredentialIdentity *v10;

  v4 = +[SFPasskeyCredentialIdentity allocWithZone:](SFPasskeyCredentialIdentity, "allocWithZone:", a3);
  v5 = -[SFCredentialIdentity rowIdentifier](self, "rowIdentifier");
  -[SFCredentialIdentity serviceIdentifier](self, "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFCredentialIdentity serviceIdentifierType](self, "serviceIdentifierType");
  -[SFCredentialIdentity externalRecordIdentifier](self, "externalRecordIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCredentialIdentity user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SFPasskeyCredentialIdentity initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:credentialID:userHandle:](v4, "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:credentialID:userHandle:", v5, v6, v7, v8, v9, -[SFCredentialIdentity rank](self, "rank"), self->_credentialID, self->_userHandle);

  return v10;
}

- (NSString)credentialID
{
  return self->_credentialID;
}

- (NSString)userHandle
{
  return self->_userHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
