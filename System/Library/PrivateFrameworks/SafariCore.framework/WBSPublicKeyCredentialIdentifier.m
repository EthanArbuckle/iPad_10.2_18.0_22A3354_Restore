@implementation WBSPublicKeyCredentialIdentifier

- (WBSPublicKeyCredentialIdentifier)initWithCredentialID:(id)a3 groupID:(id)a4
{
  id v6;
  id v7;
  WBSPublicKeyCredentialIdentifier *v8;
  uint64_t v9;
  NSString *credentialID;
  uint64_t v11;
  NSString *groupID;
  WBSPublicKeyCredentialIdentifier *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPublicKeyCredentialIdentifier;
  v8 = -[WBSPublicKeyCredentialIdentifier init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    credentialID = v8->_credentialID;
    v8->_credentialID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    groupID = v8->_groupID;
    v8->_groupID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@, %@>"), self->_credentialID, self->_groupID);
}

- (BOOL)isEqual:(id)a3
{
  WBSPublicKeyCredentialIdentifier *v4;
  WBSPublicKeyCredentialIdentifier *v5;
  NSString *groupID;
  void *v7;
  NSString *credentialID;
  void *v9;
  char v10;

  v4 = (WBSPublicKeyCredentialIdentifier *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      groupID = self->_groupID;
      -[WBSPublicKeyCredentialIdentifier groupID](v5, "groupID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(groupID) = WBSIsEqual(groupID, v7);

      if ((_DWORD)groupID)
      {
        credentialID = self->_credentialID;
        -[WBSPublicKeyCredentialIdentifier credentialID](v5, "credentialID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = WBSIsEqual(credentialID, v9);

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
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_credentialID, "hash");
  return -[NSString hash](self->_groupID, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSPublicKeyCredentialIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSPublicKeyCredentialIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBSPublicKeyCredentialIdentifier initWithCredentialID:groupID:](self, "initWithCredentialID:groupID:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *credentialID;
  id v5;

  credentialID = self->_credentialID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupID, CFSTR("groupID"));

}

- (NSString)credentialID
{
  return self->_credentialID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
