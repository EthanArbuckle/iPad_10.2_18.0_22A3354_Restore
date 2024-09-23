@implementation MFNanoBridgeSettingsAccountSpecificMailbox

- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithMailboxUid:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MFNanoBridgeSettingsAccountSpecificMailbox *v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
  v12 = -[MFNanoBridgeSettingsAccountSpecificMailbox initWithAccountUniqueIdentifier:mailboxURL:](self, "initWithAccountUniqueIdentifier:mailboxURL:", v9, v11);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailboxUid, a3);
    v12->_type = (int64_t)-[MFMailboxUid type](v12->_mailboxUid, "type");
  }

  return v12;
}

- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithAccountUniqueIdentifier:(id)a3 mailboxURL:(id)a4
{
  id v6;
  id v7;
  MFNanoBridgeSettingsAccountSpecificMailbox *v8;
  NSString *v9;
  NSString *accountUniqueIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFNanoBridgeSettingsAccountSpecificMailbox;
  v8 = -[MFNanoBridgeSettingsAccountSpecificMailbox init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    accountUniqueIdentifier = v8->_accountUniqueIdentifier;
    v8->_accountUniqueIdentifier = v9;

    objc_storeStrong((id *)&v8->_mailboxURL, a4);
  }

  return v8;
}

- (unint64_t)mailboxFilterType
{
  return 1;
}

- (void)invalidateCachedData
{
  MFMailboxUid *mailboxUid;

  mailboxUid = self->_mailboxUid;
  self->_mailboxUid = 0;

}

- (int64_t)type
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox _mailboxUid](self, "_mailboxUid"));
  v3 = objc_msgSend(v2, "type");

  return (int64_t)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUniqueIdentifier, CFSTR("kNSCodingKeyAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mailboxURL, CFSTR("kNSCodingKeyURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_type));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kNSCodingKeyType"));

}

- (MFNanoBridgeSettingsAccountSpecificMailbox)initWithCoder:(id)a3
{
  id v4;
  MFNanoBridgeSettingsAccountSpecificMailbox *v5;
  id v6;
  uint64_t v7;
  NSString *accountUniqueIdentifier;
  id v9;
  uint64_t v10;
  NSURL *mailboxURL;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFNanoBridgeSettingsAccountSpecificMailbox;
  v5 = -[MFNanoBridgeSettingsAccountSpecificMailbox init](&v15, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("kNSCodingKeyAccount"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    accountUniqueIdentifier = v5->_accountUniqueIdentifier;
    v5->_accountUniqueIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("kNSCodingKeyURL"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    mailboxURL = v5->_mailboxURL;
    v5->_mailboxURL = (NSURL *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("kNSCodingKeyType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v5->_type = (int64_t)objc_msgSend(v13, "unsignedIntegerValue");

  }
  return v5;
}

- (id)displayName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox _mailboxUid](self, "_mailboxUid"));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayNameUsingSpecialNames"));
  else
    v4 = 0;

  return v4;
}

- (id)icon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox _mailboxUid](self, "_mailboxUid"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid shorcutIconNameForMailboxType:](MFMailboxUid, "shorcutIconNameForMailboxType:", objc_msgSend(v2, "mailboxType")));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", v4, 7));
      v6 = off_1005A2840();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithTintColor:", v7));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)level
{
  void *v2;
  void *v3;
  signed int v4;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox _mailboxUid](self, "_mailboxUid"));
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "mailboxType"))
      v4 = 0;
    else
      v4 = objc_msgSend(v3, "level");
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox _mailboxUid](self, "_mailboxUid"));
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox mailboxURL](self, "mailboxURL"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFNanoBridgeSettingsAccountSpecificMailbox;
  if (-[MFNanoBridgeSettingsMailbox isEqual:](&v9, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxURL"));
    if (objc_msgSend(v5, "isEqual:", self->_mailboxURL))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountUniqueIdentifier"));
      v7 = objc_msgSend(v6, "isEqualToString:", self->_accountUniqueIdentifier);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)mailboxId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsAccountSpecificMailbox _mailboxUid](self, "_mailboxUid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nano_mailboxId"));

  return (NSString *)v3;
}

- (id)_mailboxUid
{
  MFMailboxUid *mailboxUid;
  void *v4;
  uint64_t v5;
  uint64_t isKindOfClass;
  MFMailboxUid *v7;
  MFMailboxUid *v8;
  uint64_t v9;
  NSObject *v10;
  NSURL **p_mailboxURL;
  void *v13;
  MFMailboxUid *v14;
  MFMailboxUid *v15;
  void *v16;
  void *v17;
  MFMailboxUid *v18;
  MFMailboxUid *v19;
  uint64_t v20;
  NSURL *v21;
  NSURL *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint8_t v27[24];

  mailboxUid = self->_mailboxUid;
  if (!mailboxUid)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", self->_accountUniqueIdentifier));
    v5 = objc_opt_class(LocalAccount);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    if ((isKindOfClass & 1) != 0 || (isKindOfClass = (uint64_t)objc_msgSend(v4, "isActive"), !(_DWORD)isKindOfClass))
    {
      v9 = MFLogGeneral(isKindOfClass);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10039472C((uint64_t)self->_accountUniqueIdentifier, (char)objc_msgSend(v4, "isActive"), v27, v10);

    }
    else
    {
      if (self->_type == 7)
      {
        v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxUidOfType:createIfNeeded:", 7, 0));
        v8 = self->_mailboxUid;
        self->_mailboxUid = v7;

      }
      else
      {
        p_mailboxURL = &self->_mailboxURL;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_mailboxURL, "absoluteString"));
        v14 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxUidForURL:", v13));
        v15 = self->_mailboxUid;
        self->_mailboxUid = v14;

        if (!self->_mailboxUid)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](*p_mailboxURL, "absoluteString"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLStringFromLegacyURLString:", v16));

          v18 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxUidForURL:", v17));
          v19 = self->_mailboxUid;
          self->_mailboxUid = v18;

          if (self->_mailboxUid)
          {
            v21 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v17);
            v22 = *p_mailboxURL;
            *p_mailboxURL = v21;

          }
          else
          {
            v23 = MFLogGeneral(v20);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              sub_100394784((uint64_t *)&self->_mailboxURL, v24);

          }
        }
      }
      v25 = objc_opt_class(DAMailAccount);
      if ((objc_opt_isKindOfClass(v4, v25) & 1) != 0 && !-[MFMailboxUid type](self->_mailboxUid, "type"))
        v26 = objc_msgSend(v4, "primaryMailboxUid");
    }

    mailboxUid = self->_mailboxUid;
  }
  return mailboxUid;
}

- (NSString)accountUniqueIdentifier
{
  return self->_accountUniqueIdentifier;
}

- (NSURL)mailboxURL
{
  return self->_mailboxURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_mailboxURL, 0);
  objc_storeStrong((id *)&self->_mailboxUid, 0);
}

@end
