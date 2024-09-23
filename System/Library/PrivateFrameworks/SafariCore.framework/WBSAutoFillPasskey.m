@implementation WBSAutoFillPasskey

- (WBSAutoFillPasskey)initWithUsername:(id)a3 customTitle:(id)a4 relyingPartyIdentifier:(id)a5 identifier:(id)a6 operationUUID:(id)a7 shouldRequireUserVerification:(BOOL)a8 requestUsedNonEmptyAllowList:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WBSAutoFillPasskey *v20;
  uint64_t v21;
  NSString *username;
  uint64_t v23;
  NSString *customTitle;
  uint64_t v25;
  NSString *relyingPartyIdentifier;
  uint64_t v27;
  WBSPublicKeyCredentialIdentifier *identifier;
  WBSAutoFillPasskey *v29;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v31.receiver = self;
  v31.super_class = (Class)WBSAutoFillPasskey;
  v20 = -[WBSAutoFillPasskey init](&v31, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    username = v20->_username;
    v20->_username = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    customTitle = v20->_customTitle;
    v20->_customTitle = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    relyingPartyIdentifier = v20->_relyingPartyIdentifier;
    v20->_relyingPartyIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (WBSPublicKeyCredentialIdentifier *)v27;

    objc_storeStrong((id *)&v20->_operationUUID, a7);
    v20->_shouldRequireUserVerification = a8;
    v20->_requestUsedNonEmptyAllowList = a9;
    v29 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSAutoFillPasskey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  WBSAutoFillPasskey *v12;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationUUD"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRequireUserVerification"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestUsedNonEmptyAllowList"));

  LOBYTE(v14) = v11;
  v12 = -[WBSAutoFillPasskey initWithUsername:customTitle:relyingPartyIdentifier:identifier:operationUUID:shouldRequireUserVerification:requestUsedNonEmptyAllowList:](self, "initWithUsername:customTitle:relyingPartyIdentifier:identifier:operationUUID:shouldRequireUserVerification:requestUsedNonEmptyAllowList:", v5, v6, v7, v9, v8, v10, v14);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *username;
  id v5;

  username = self->_username;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", username, CFSTR("username"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customTitle, CFSTR("customTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationUUID, CFSTR("operationUUD"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRequireUserVerification, CFSTR("shouldRequireUserVerification"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requestUsedNonEmptyAllowList, CFSTR("requestUsedNonEmptyAllowList"));

}

- (NSString)username
{
  return self->_username;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (WBSPublicKeyCredentialIdentifier)identifier
{
  return self->_identifier;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (BOOL)shouldRequireUserVerification
{
  return self->_shouldRequireUserVerification;
}

- (BOOL)requestUsedNonEmptyAllowList
{
  return self->_requestUsedNonEmptyAllowList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
