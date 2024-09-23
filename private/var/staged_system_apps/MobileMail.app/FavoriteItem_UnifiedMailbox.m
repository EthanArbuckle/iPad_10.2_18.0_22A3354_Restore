@implementation FavoriteItem_UnifiedMailbox

- (id)itemID
{
  NSString *itemID;
  const __CFString *collectionID;
  NSString *v5;
  NSString *v6;

  itemID = self->super._itemID;
  if (!itemID)
  {
    if (self->super._collectionID)
      collectionID = (const __CFString *)self->super._collectionID;
    else
      collectionID = &stru_100531B00;
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld"), collectionID, -[FavoriteItem_UnifiedMailbox mailboxType](self, "mailboxType")));
    v6 = self->super._itemID;
    self->super._itemID = v5;

    itemID = self->super._itemID;
  }
  return itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeCountDebouncer, 0);
  objc_storeStrong((id *)&self->_unreadCountToken, 0);
}

- (BOOL)isEqual:(id)a3
{
  FavoriteItem_UnifiedMailbox *v4;
  FavoriteItem_UnifiedMailbox *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (FavoriteItem_UnifiedMailbox *)a3;
  v5 = v4;
  if (v4 == self)
    v7 = 1;
  else
    v7 = v4
      && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      && self->_mailboxType == v5->_mailboxType;

  return v7;
}

- (FavoriteItem_UnifiedMailbox)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem_UnifiedMailbox *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_UnifiedMailbox;
  v5 = -[FavoriteItem initWithDictionary:](&v8, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("mailboxType")));
    v5->_mailboxType = (int64_t)objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem_UnifiedMailbox;
  v3 = -[FavoriteItem dictionaryRepresentation](&v7, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_mailboxType));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("mailboxType"));

  return v4;
}

- (int64_t)mailboxType
{
  return self->_mailboxType;
}

- (BOOL)isVisible
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsProvider"));
  v4 = objc_msgSend(v3, "isDisplayingMultipleAccounts");

  return v4;
}

- (FavoriteItem_UnifiedMailbox)initWithMailboxType:(int64_t)a3
{
  FavoriteItem_UnifiedMailbox *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FavoriteItem_UnifiedMailbox;
  result = -[FavoriteItem initWithType:](&v5, "initWithType:", 4);
  if (result)
    result->_mailboxType = a3;
  return result;
}

- (id)defaultIconBlock
{
  int64_t mailboxType;
  _QWORD v4[5];

  mailboxType = self->_mailboxType;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100097FD0;
  v4[3] = &unk_10051C818;
  v4[4] = mailboxType;
  return objc_retainBlock(v4);
}

- (id)applicationShortcutIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid shorcutIconNameForMailboxType:](MFMailboxUid, "shorcutIconNameForMailboxType:", self->_mailboxType));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", v2));
  else
    v3 = 0;

  return v3;
}

- (void)configureOutlineCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t mailboxType;
  void *v13;
  void *v14;
  _QWORD v15[5];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_UnifiedMailbox;
  -[FavoriteItem configureOutlineCell:](&v16, "configureOutlineCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedAccounts"));

  if (!objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountsProvider"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedAccounts"));

    v7 = (void *)v10;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000982FC;
  v15[3] = &unk_10051C840;
  v15[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_compactMap:", v15));
  mailboxType = self->_mailboxType;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_UnifiedMailbox smartMailbox](self, "smartMailbox"));
  objc_msgSend(v4, "setSmartMailbox:", v13);

  objc_msgSend(v4, "setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:", v11, -[FavoriteItem showUnreadCount](self, "showUnreadCount"), mailboxType == 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_UnifiedMailbox displayName](self, "displayName"));
  objc_msgSend(v4, "setTitle:", v14);

}

- (CGPoint)iconOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  objc_msgSend(a3, "selectCombinedMailboxWithType:item:animated:", self->_mailboxType, self, a6);
}

- (id)smartMailbox
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = ECMailboxTypeFromMailboxUidType(self->_mailboxType, a2);
  if (v3 == 5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transientDraftsFolder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxWithURL:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxWithURL:", v6));
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_UnifiedMailbox displayName](self, "displayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMSmartMailbox unifiedMailboxOfType:name:additionalPredicate:](EMSmartMailbox, "unifiedMailboxOfType:name:additionalPredicate:", v3, v8, v7));

  return v9;
}

- (unint64_t)hash
{
  return self->_mailboxType;
}

- (id)itemURLString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_UnifiedMailbox itemID](self, "itemID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("favoriteitem://unifiedmailbox/%@"), v2));

  return v3;
}

- (id)representingMailboxes
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (-[FavoriteItem_UnifiedMailbox isVisible](self, "isVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "mailboxUidOfType:createIfNeeded:", self->_mailboxType, 0));
          if (v8)
            objc_msgSend(v3, "addObject:", v8);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)acceptsMessageTransfers
{
  return +[MFMailboxUid typeIsValidTransferDestination:](MFMailboxUid, "typeIsValidTransferDestination:", -[FavoriteItem_UnifiedMailbox mailboxType](self, "mailboxType"));
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)displayName
{
  const __CFString *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;

  switch(self->_mailboxType)
  {
    case 1:
      v2 = CFSTR("ALL_JUNK");
      v3 = CFSTR("All Junk");
      goto LABEL_9;
    case 2:
      v2 = CFSTR("ALL_ARCHIVE");
      v3 = CFSTR("All Archive");
      goto LABEL_9;
    case 3:
      v2 = CFSTR("ALL_TRASH");
      v3 = CFSTR("All Trash");
      goto LABEL_9;
    case 4:
      v2 = CFSTR("ALL_SENT");
      v3 = CFSTR("All Sent");
      goto LABEL_9;
    case 5:
      v2 = CFSTR("ALL_DRAFTS");
      v3 = CFSTR("All Drafts");
      goto LABEL_9;
    case 7:
      v2 = CFSTR("ALL_INBOXES_LONG");
      v3 = CFSTR("All Inboxes");
LABEL_9:
      v5 = MFLookupLocalizedString(v2, v3, CFSTR("Message"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    default:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:"));
      break;
  }
  return v4;
}

- (id)persistentIDForMigration
{
  if (self->_mailboxType == 7)
    return CFSTR("AllInboxes");
  else
    return 0;
}

- (id)description
{
  int64_t mailboxType;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  mailboxType = self->_mailboxType;
  if (mailboxType > 99)
  {
    switch(mailboxType)
    {
      case 'd':
        v4 = CFSTR("INBOXSpecialMailboxUid");
        break;
      case 'e':
        v4 = CFSTR("JunkSpecialMailboxUid");
        break;
      case 'f':
        v4 = CFSTR("ArchiveSpecialMailboxUid");
        break;
      case 'g':
        v4 = CFSTR("TrashSpecialMailboxUid");
        break;
      case 'h':
        v4 = CFSTR("SentMessagesSpecialMailboxUid");
        break;
      case 'i':
        v4 = CFSTR("DraftsSpecialMailboxUid");
        break;
      case 'j':
        v4 = CFSTR("OutboxSpecialMailboxUid");
        break;
      default:
        v4 = 0;
        break;
    }
  }
  else
  {
    switch(mailboxType)
    {
      case 0:
        v4 = CFSTR("GenericMailboxUid");
        break;
      case 1:
        v4 = CFSTR("JunkMailboxUid");
        break;
      case 2:
        v4 = CFSTR("ArchiveMailboxUid");
        break;
      case 3:
        v4 = CFSTR("TrashMailboxUid");
        break;
      case 4:
        v4 = CFSTR("SentMessagesUid");
        break;
      case 5:
        v4 = CFSTR("DraftsMailboxUid");
        break;
      case 6:
        v4 = CFSTR("OutboxUid");
        break;
      case 7:
        v4 = CFSTR("InboxUid");
        break;
      case 8:
        v4 = CFSTR("RootMailboxUid");
        break;
      default:
        v5 = CFSTR("RootlessMailboxUid");
        if (mailboxType != -100)
          v5 = 0;
        if (mailboxType == -500)
          v4 = CFSTR("InvalidMailboxUidType");
        else
          v4 = v5;
        break;
    }
  }
  v6 = objc_opt_class(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_UnifiedMailbox displayName](self, "displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; mailboxType = %@; displayName = %@>"),
                   v6,
                   self,
                   v4,
                   v7));

  return v8;
}

- (id)analyticsKey
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = NSStringFromMailboxUidType(self->_mailboxType, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unified_%@"), v3));

  return v4;
}

- (EFCancelable)unreadCountToken
{
  return (EFCancelable *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUnreadCountToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (EFDebouncer)badgeCountDebouncer
{
  return (EFDebouncer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBadgeCountDebouncer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

@end
