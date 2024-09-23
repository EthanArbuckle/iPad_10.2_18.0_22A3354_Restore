@implementation FavoriteItem_Mailbox

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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox itemUUID](self, "itemUUID"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), collectionID, v5));
    v7 = self->super._itemID;
    self->super._itemID = v6;

    itemID = self->super._itemID;
  }
  return itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountRelativePath, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

- (BOOL)isEqual:(id)a3
{
  FavoriteItem_Mailbox *v4;
  FavoriteItem_Mailbox *v5;
  uint64_t v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;

  v4 = (FavoriteItem_Mailbox *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = sub_100099210(self->_account);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
    v11 = sub_100099210(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if ((objc_msgSend(v9, "isEqualToString:", v12) & 1) != 0)
      v13 = objc_msgSend(v7[16], "isEqualToString:", self->_accountRelativePath);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)itemUUID
{
  NSString *itemUUID;
  void *v4;
  NSString *v5;
  NSString *v6;

  itemUUID = self->super._itemUUID;
  if (!itemUUID)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
    v6 = self->super._itemUUID;
    self->super._itemUUID = v5;

    itemUUID = self->super._itemUUID;
  }
  return itemUUID;
}

- (id)representingMailbox
{
  MFMailboxUid *mailbox;
  unsigned int v4;
  unsigned int v5;
  MailAccount *account;
  MFMailboxUid *v7;
  MFMailboxUid *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t mailboxType;
  void *v12;
  int v14;
  FavoriteItem_Mailbox *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;

  mailbox = self->_mailbox;
  if (!mailbox)
  {
    v4 = -[MailAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", kAccountDataclassMail);
    if (v4)
    {
      v5 = +[MFMailboxUid isStandardizedMailboxUidType:](MFMailboxUid, "isStandardizedMailboxUidType:", self->_mailboxType);
      account = self->_account;
      if (v5)
        v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](account, "mailboxUidOfType:createIfNeeded:", self->_mailboxType, 0));
      else
        v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidForRelativePath:create:](account, "mailboxUidForRelativePath:create:", self->_accountRelativePath, 0));
      v8 = self->_mailbox;
      self->_mailbox = v7;

    }
    mailbox = self->_mailbox;
    if (!mailbox)
    {
      v9 = MFLogGeneral(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        mailboxType = self->_mailboxType;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount ef_publicDescription](self->_account, "ef_publicDescription"));
        v14 = 138413058;
        v15 = self;
        v16 = 2048;
        v17 = mailboxType;
        v18 = 2048;
        v19 = v4;
        v20 = 2112;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Favorites %@ Could not find representingMailbox mailboxType:%ld accountIsEnabled:%ld account:%@", (uint8_t *)&v14, 0x2Au);

      }
      mailbox = self->_mailbox;
    }
  }
  return mailbox;
}

- (FavoriteItem_Mailbox)initWithMailbox:(id)a3
{
  id v5;
  FavoriteItem_Mailbox *v6;
  uint64_t v7;
  MailAccount *account;
  void *v9;
  NSString *v10;
  NSString *accountRelativePath;
  void *v12;
  NSString *v13;
  NSString *displayName;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_Mailbox;
  v6 = -[FavoriteItem initWithType:](&v16, "initWithType:", 2);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedAccount"));
    account = v6->_account;
    v6->_account = (MailAccount *)v7;

    objc_storeStrong((id *)&v6->_mailbox, a3);
    v6->_mailboxType = (int64_t)-[MFMailboxUid mailboxType](v6->_mailbox, "mailboxType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountRelativePath"));
    v10 = (NSString *)objc_msgSend(v9, "copy");
    accountRelativePath = v6->_accountRelativePath;
    v6->_accountRelativePath = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid displayName](v6->_mailbox, "displayName"));
    v13 = (NSString *)objc_msgSend(v12, "copy");
    displayName = v6->_displayName;
    v6->_displayName = v13;

  }
  return v6;
}

+ (BOOL)_defaultShouldSync
{
  return 1;
}

- (int64_t)_defaultCellAccessoryType
{
  void *v3;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));

  if (!v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)FavoriteItem_Mailbox;
  return -[FavoriteItem _defaultCellAccessoryType](&v5, "_defaultCellAccessoryType");
}

- (BOOL)isDeletable
{
  return -[MailAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", kAccountDataclassMail);
}

- (void)configureOutlineCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FavoriteItem_Mailbox;
  -[FavoriteItem configureOutlineCell:](&v13, "configureOutlineCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "mailboxType");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
    objc_msgSend(v4, "setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:", v8, -[FavoriteItem showUnreadCount](self, "showUnreadCount"), v7 == (id)5);

  }
  else
  {
    objc_msgSend(v4, "setLegacyMailboxes:", 0);
    objc_msgSend(v4, "setCellEnabled:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountsProvider"));
  v11 = objc_msgSend(v10, "isDisplayingMultipleAccounts");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount displayName](self->_account, "displayName"));
    objc_msgSend(v4, "setSubtitle:", v12);

  }
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  FavoriteItem_Mailbox *v14;
  __int16 v15;
  void *v16;

  v6 = a6;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
  v10 = MFLogGeneral(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
    v13 = 138412546;
    v14 = self;
    v15 = 2114;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Favorites %@ selectMailbox:%{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v8, "selectMailbox:item:animated:", v9, self, v6);

}

- (unint64_t)hash
{
  return -[NSString hash](self->_accountRelativePath, "hash");
}

- (FavoriteItem_Mailbox)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem_Mailbox *v5;
  void *v6;
  uint64_t v7;
  MailAccount *account;
  uint64_t v9;
  NSString *accountRelativePath;
  uint64_t v11;
  NSString *displayName;
  void *v13;
  uint64_t v14;
  NSString *syncKey;
  void *v16;
  FavoriteItem_Mailbox *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FavoriteItem_Mailbox;
  v5 = -[FavoriteItem initWithDictionary:](&v19, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("primaryEmail")));
    if (!v6
      || (v7 = objc_claimAutoreleasedReturnValue(+[MailAccount accountContainingEmailAddress:includingInactive:](MailAccount, "accountContainingEmailAddress:includingInactive:", v6, 1)), account = v5->_account, v5->_account = (MailAccount *)v7, account, !v5->_account))
    {

      v17 = 0;
      goto LABEL_9;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mailboxPath")));
    accountRelativePath = v5->_accountRelativePath;
    v5->_accountRelativePath = (NSString *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mailboxType")));
    v5->_mailboxType = (int64_t)objc_msgSend(v13, "integerValue");

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncKey")));
    syncKey = v5->super._syncKey;
    v5->super._syncKey = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("originalPushState")));
    if (v16)
      v5->_originalPushState = 1;

  }
  v17 = v5;
LABEL_9:

  return v17;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MFMailboxUid *mailbox;
  id mailboxType;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *accountRelativePath;
  void *v16;
  MFMailboxUid *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  MFMailboxUid *v25;
  __int16 v26;
  void *v27;

  v19.receiver = self;
  v19.super_class = (Class)FavoriteItem_Mailbox;
  v3 = -[FavoriteItem dictionaryRepresentation](&v19, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount firstEmailAddress](self->_account, "firstEmailAddress"));
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("primaryEmail"));
    objc_msgSend(v4, "setObject:forKey:", self->_accountRelativePath, CFSTR("mailboxPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox displayName](self, "displayName"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("name"));

    mailbox = self->_mailbox;
    if (mailbox)
      mailboxType = -[MFMailboxUid mailboxType](mailbox, "mailboxType");
    else
      mailboxType = (id)self->_mailboxType;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", mailboxType));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("mailboxType"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox syncKey](self, "syncKey"));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("syncKey"));

    if (-[FavoriteItem_Mailbox originalPushState](self, "originalPushState"))
    {
      v12 = NSStringFromBOOL(-[FavoriteItem_Mailbox originalPushState](self, "originalPushState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("originalPushState"));

    }
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[FavoriteItem log](FavoriteItem, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      accountRelativePath = self->_accountRelativePath;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox displayName](self, "displayName"));
      v17 = self->_mailbox;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox syncKey](self, "syncKey"));
      *(_DWORD *)buf = 138413058;
      v21 = accountRelativePath;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "(NOT A CRASH) FavoriteItem_Mailbox dictionaryRepresentation primary==nil accountRelativePath:%@ displayName:%@ mailbox:%@ sync:%@", buf, 0x2Au);

    }
    objc_msgSend(v4, "removeAllObjects");
  }

  return v4;
}

- (id)parentItemID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueID"));

  return v3;
}

- (id)displayName
{
  NSString *v2;

  if (self->_mailbox)
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid displayName](self->_mailbox, "displayName"));
  else
    v2 = self->_displayName;
  return v2;
}

- (BOOL)isVisible
{
  return -[MailAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", kAccountDataclassMail);
}

- (id)criterion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForMailbox:](MFMessageCriterion, "criterionForMailbox:", v2));

  return v3;
}

- (id)account
{
  return self->_account;
}

- (BOOL)acceptsMessageTransfers
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
  v3 = +[MFMailboxUid typeIsValidTransferDestination:](MFMailboxUid, "typeIsValidTransferDestination:", objc_msgSend(v2, "mailboxType"));

  return v3;
}

- (id)syncKey
{
  NSString *syncKey;
  NSString *v4;
  NSString *v5;

  syncKey = self->super._syncKey;
  if (!syncKey)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString ef_UUID](NSString, "ef_UUID"));
    v5 = self->super._syncKey;
    self->super._syncKey = v4;

    syncKey = self->super._syncKey;
  }
  return syncKey;
}

- (id)syncValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox dictionaryRepresentation](self, "dictionaryRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount username](self->_account, "username"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount hostname](self->_account, "hostname"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@@%@"), v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("usernameHostInfo"));

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("selected"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("originalPushState"));

  return v4;
}

- (void)wasAddedToCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  FavoriteItem_Mailbox *v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FavoriteItem_Mailbox;
  -[FavoriteItem wasAddedToCollection:](&v17, "wasAddedToCollection:", v4);
  if (objc_msgSend(v4, "isMailboxesCollection"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox account](self, "account"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushedMailboxUids"));
      v8 = objc_msgSend(v7, "containsObject:", v5);

      -[FavoriteItem_Mailbox setOriginalPushState:](self, "setOriginalPushState:", v8);
      if ((v8 & 1) == 0)
      {
        v9 = sub_100099BFC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        v11 = _NSConcreteStackBlock;
        v12 = 3221225472;
        v13 = sub_100099C3C;
        v14 = &unk_10051A910;
        v15 = self;
        v16 = v5;
        dispatch_async(v10, &v11);

      }
    }
    -[FavoriteItem_Mailbox _postNotification](self, "_postNotification", v11, v12, v13, v14, v15);

  }
}

- (void)wasRemovedFromCollecion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  FavoriteItem_Mailbox *v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FavoriteItem_Mailbox;
  -[FavoriteItem wasRemovedFromCollecion:](&v17, "wasRemovedFromCollecion:", v4);
  if (objc_msgSend(v4, "isMailboxesCollection"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox representingMailbox](self, "representingMailbox"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_Mailbox account](self, "account"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushedMailboxUids"));
      v8 = objc_msgSend(v7, "containsObject:", v5);

      if (v8)
      {
        if (!-[FavoriteItem_Mailbox originalPushState](self, "originalPushState"))
        {
          v9 = sub_100099BFC();
          v10 = objc_claimAutoreleasedReturnValue(v9);
          v11 = _NSConcreteStackBlock;
          v12 = 3221225472;
          v13 = sub_100099E24;
          v14 = &unk_10051A910;
          v15 = self;
          v16 = v5;
          dispatch_async(v10, &v11);

        }
      }
    }
    -[FavoriteItem_Mailbox _postNotification](self, "_postNotification", v11, v12, v13, v14, v15);

  }
}

- (void)wasChangedExternally
{
  NSString *v3;
  NSString *accountRelativePath;

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid accountRelativePath](self->_mailbox, "accountRelativePath"));
  accountRelativePath = self->_accountRelativePath;
  self->_accountRelativePath = v3;

  -[FavoriteItem_Mailbox _postNotification](self, "_postNotification");
}

- (void)_postNotification
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099F64;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)analyticsKey
{
  return (id)NSStringFromMailboxUidType(self->_mailboxType, a2);
}

- (BOOL)originalPushState
{
  return self->_originalPushState;
}

- (void)setOriginalPushState:(BOOL)a3
{
  self->_originalPushState = a3;
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMailbox:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

@end
