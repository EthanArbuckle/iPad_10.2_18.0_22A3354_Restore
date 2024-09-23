@implementation WBSWebBrowserPasskey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSWebBrowserPasskey)initWithName:(id)a3 relyingParty:(id)a4 credentialID:(id)a5 userHandle:(id)a6 customTitle:(id)a7 providerName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WBSWebBrowserPasskey *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSString *relyingParty;
  uint64_t v25;
  NSData *credentialID;
  uint64_t v27;
  NSData *userHandle;
  uint64_t v29;
  NSString *customTitle;
  uint64_t v31;
  NSString *providerName;
  WBSWebBrowserPasskey *v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)WBSWebBrowserPasskey;
  v20 = -[WBSWebBrowserPasskey init](&v35, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    relyingParty = v20->_relyingParty;
    v20->_relyingParty = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    credentialID = v20->_credentialID;
    v20->_credentialID = (NSData *)v25;

    v27 = objc_msgSend(v17, "copy");
    userHandle = v20->_userHandle;
    v20->_userHandle = (NSData *)v27;

    v29 = objc_msgSend(v18, "copy");
    customTitle = v20->_customTitle;
    v20->_customTitle = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    providerName = v20->_providerName;
    v20->_providerName = (NSString *)v31;

    v33 = v20;
  }

  return v20;
}

- (WBSWebBrowserPasskey)initWithCoder:(id)a3
{
  id v4;
  WBSWebBrowserPasskey *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *relyingParty;
  uint64_t v10;
  NSData *credentialID;
  uint64_t v12;
  NSData *userHandle;
  uint64_t v14;
  NSString *customTitle;
  uint64_t v16;
  NSString *providerName;
  WBSWebBrowserPasskey *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WBSWebBrowserPasskey;
  v5 = -[WBSWebBrowserPasskey init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingParty"));
    v8 = objc_claimAutoreleasedReturnValue();
    relyingParty = v5->_relyingParty;
    v5->_relyingParty = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
    v10 = objc_claimAutoreleasedReturnValue();
    credentialID = v5->_credentialID;
    v5->_credentialID = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userHandle"));
    v12 = objc_claimAutoreleasedReturnValue();
    userHandle = v5->_userHandle;
    v5->_userHandle = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    customTitle = v5->_customTitle;
    v5->_customTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerName"));
    v16 = objc_claimAutoreleasedReturnValue();
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingParty, CFSTR("relyingParty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userHandle, CFSTR("userHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customTitle, CFSTR("customTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerName, CFSTR("providerName"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
