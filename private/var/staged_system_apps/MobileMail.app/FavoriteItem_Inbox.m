@implementation FavoriteItem_Inbox

- (id)displayName
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsProvider"));
  v5 = objc_msgSend(v4, "isDisplayingMultipleAccounts");

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount displayName](self->_account, "displayName"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:", 7));
  return v6;
}

- (id)uniqueIDAndDisplayName
{
  NSString *uniqueIDAndDisplayName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  uniqueIDAndDisplayName = self->_uniqueIDAndDisplayName;
  if (!uniqueIDAndDisplayName)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox representingMailbox](self, "representingMailbox"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox displayName](self, "displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v6));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v7));
    v9 = self->_uniqueIDAndDisplayName;
    self->_uniqueIDAndDisplayName = v8;

    uniqueIDAndDisplayName = self->_uniqueIDAndDisplayName;
  }
  return uniqueIDAndDisplayName;
}

- (FavoriteItem_Inbox)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem_Inbox *v5;
  void *v6;
  uint64_t v7;
  MailAccount *account;
  MailAccount *v9;
  FavoriteItem_Inbox *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FavoriteItem_Inbox;
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
  FavoriteItem_Inbox *v4;
  FavoriteItem_Inbox *v5;
  uint64_t v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = (FavoriteItem_Inbox *)a3;
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox uniqueIDAndDisplayName](self, "uniqueIDAndDisplayName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIDAndDisplayName"));
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
  v15.super_class = (Class)FavoriteItem_Inbox;
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
      sub_1003918E0((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v4, "removeAllObjects");
  }

  return v4;
}

- (id)representingMailbox
{
  return -[MailAccount primaryMailboxUid](self->_account, "primaryMailboxUid");
}

- (id)itemID
{
  NSString *itemID;
  const __CFString *collectionID;
  void *v5;
  NSString *v6;
  NSString *v7;

  itemID = self->super._itemID;
  if (!itemID)
  {
    if (self->super._collectionID)
      collectionID = (const __CFString *)self->super._collectionID;
    else
      collectionID = &stru_100531B00;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox uniqueIDAndDisplayName](self, "uniqueIDAndDisplayName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), collectionID, v5));
    v7 = self->super._itemID;
    self->super._itemID = v6;

    itemID = self->super._itemID;
  }
  return itemID;
}

- (BOOL)isVisible
{
  return -[MailAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", kAccountDataclassMail);
}

- (FavoriteItem_Inbox)initWithAccount:(id)a3
{
  id v5;
  FavoriteItem_Inbox *v6;
  FavoriteItem_Inbox *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_Inbox;
  v6 = -[FavoriteItem initWithType:](&v9, "initWithType:", 3);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)account
{
  return self->_account;
}

- (BOOL)_displayNameShouldBeRedacted
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsProvider"));
  v4 = objc_msgSend(v3, "isDisplayingMultipleAccounts");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDAndDisplayName, 0);
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
  v8.super_class = (Class)FavoriteItem_Inbox;
  -[FavoriteItem configureOutlineCell:](&v8, "configureOutlineCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox representingMailbox](self, "representingMailbox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  objc_msgSend(v4, "setLegacyMailboxes:showUnreadCount:", v6, -[FavoriteItem showUnreadCount](self, "showUnreadCount"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox displayName](self, "displayName"));
  objc_msgSend(v4, "setTitle:", v7);

}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a6;
  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox representingMailbox](self, "representingMailbox"));
  objc_msgSend(v9, "selectMailbox:item:animated:", v8, self, v6);

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount uniqueID](self->_account, "uniqueID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)parentItemID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueID"));

  return v3;
}

- (BOOL)acceptsMessageTransfers
{
  return 1;
}

- (id)criterion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Inbox representingMailbox](self, "representingMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForMailbox:](MFMessageCriterion, "criterionForMailbox:", v2));

  return v3;
}

- (id)persistentIDForMigration
{
  return -[MailAccount uniqueID](self->_account, "uniqueID");
}

- (id)analyticsKey
{
  return (id)NSStringFromMailboxUidType(7, a2);
}

@end
