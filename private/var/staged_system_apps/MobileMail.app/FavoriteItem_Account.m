@implementation FavoriteItem_Account

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FavoriteItem_Account;
  v3 = -[FavoriteItem dictionaryRepresentation](&v15, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount uniqueID](self->_account, "uniqueID"));
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("uniqueID"));
  }
  else
  {
    v6 = MFLogGeneral(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100391878((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v4, "removeAllObjects");
  }

  return v4;
}

- (FavoriteItem_Account)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem_Account *v5;
  void *v6;
  uint64_t v7;
  MailAccount *account;
  MailAccount *v9;
  FavoriteItem_Account *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FavoriteItem_Account;
  v5 = -[FavoriteItem initWithDictionary:](&v12, "initWithDictionary:", v4);
  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("uniqueID")));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v6));
    account = v5->_account;
    v5->_account = (MailAccount *)v7;

  }
  v9 = v5->_account;

  if (!v9)
    v10 = 0;
  else
LABEL_5:
    v10 = v5;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  FavoriteItem_Account *v4;
  FavoriteItem_Account *v5;
  uint64_t v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = (FavoriteItem_Account *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = v7[13];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount uniqueID](self->_account, "uniqueID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Account itemID](self, "itemID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemID"));
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)itemID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount uniqueID](self->_account, "uniqueID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Account displayName](self, "displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v3, v5));

  return v6;
}

- (id)displayName
{
  return -[MailAccount displayName](self->_account, "displayName");
}

- (BOOL)isVisible
{
  return -[MailAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", kAccountDataclassMail);
}

- (BOOL)isExpandable
{
  return 1;
}

- (FavoriteItem_Account)initWithAccount:(id)a3
{
  id v5;
  FavoriteItem_Account *v6;
  FavoriteItem_Account *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_Account;
  v6 = -[FavoriteItem initWithType:](&v9, "initWithType:", 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    -[FavoriteItem setExpanded:](v7, "setExpanded:", 1);
  }

  return v7;
}

- (id)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)configureOutlineCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_Account;
  -[FavoriteItem configureOutlineCell:](&v8, "configureOutlineCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount primaryMailboxUid](self->_account, "primaryMailboxUid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  objc_msgSend(v4, "setLegacyMailboxes:showUnreadCount:", v6, -[FavoriteItem showUnreadCount](self, "showUnreadCount"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount displayName](self->_account, "displayName"));
  objc_msgSend(v4, "setTitle:", v7);

  objc_msgSend(v4, "setIcon:", 0);
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  objc_msgSend(a3, "selectAccount:item:indexPath:animated:", self->_account, self, a4, a6);
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount uniqueID](self->_account, "uniqueID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)representingMailbox
{
  return -[MailAccount primaryMailboxUid](self->_account, "primaryMailboxUid");
}

- (id)persistentIDForMigration
{
  return -[MailAccount uniqueID](self->_account, "uniqueID");
}

- (BOOL)isExpandableInEditMode
{
  return 1;
}

@end
