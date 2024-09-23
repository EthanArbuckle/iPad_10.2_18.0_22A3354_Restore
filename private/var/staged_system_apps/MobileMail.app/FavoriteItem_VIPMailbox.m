@implementation FavoriteItem_VIPMailbox

- (FavoriteItem_VIPMailbox)initWithVIP:(id)a3
{
  id v5;
  FavoriteItem_VIPMailbox *v6;
  FavoriteItem_VIPMailbox *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_VIPMailbox;
  v6 = -[FavoriteItem initWithType:](&v9, "initWithType:", 5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_VIP, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  FavoriteItem_VIPMailbox *v4;
  FavoriteItem_VIPMailbox *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (FavoriteItem_VIPMailbox *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](self, "VIP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](v5, "VIP"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](self, "VIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (FavoriteItem_VIPMailbox)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem_VIPMailbox *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  EMVIP *VIP;
  EMVIP *v13;
  FavoriteItem_VIPMailbox *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_VIPMailbox;
  v5 = -[FavoriteItem initWithDictionary:](&v16, "initWithDictionary:", v4);
  if (!v5)
    goto LABEL_3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vipManager"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("VIPIdentifier")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vipWithIdentifier:", v10));
  VIP = v5->_VIP;
  v5->_VIP = (EMVIP *)v11;

  v13 = v5->_VIP;
  if (!v13)
    v14 = 0;
  else
LABEL_3:
    v14 = v5;

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_VIPMailbox;
  v3 = -[FavoriteItem dictionaryRepresentation](&v8, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](self, "VIP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("VIPIdentifier"));

  return v4;
}

- (id)persistentIDForMigration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](self, "VIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VIPMailbox-%@"), v3));

  return v4;
}

- (id)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](self, "VIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));

  return v3;
}

- (id)countQueryPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox mailboxScope](self, "mailboxScope"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox additionalPredicate](self, "additionalPredicate"));
  v10[0] = v6;
  v10[1] = v3;
  v10[2] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  return v8;
}

- (id)mailboxScope
{
  return +[EMMailboxScope mailboxScopeForMailboxType:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxType:forExclusion:", 7, 0);
}

- (id)serverCountMailboxScope
{
  return 0;
}

- (id)additionalPredicate
{
  os_unfair_lock_s *p_lock;
  NSPredicate *additionalPredicate;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSPredicate **p_additionalPredicate;
  NSPredicate *v14;
  NSPredicate *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  additionalPredicate = self->_additionalPredicate;
  if (!additionalPredicate)
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_VIPMailbox VIP](self, "VIP", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddresses"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithSender:](EMMessageListItemPredicates, "predicateForMessagesWithSender:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10)));
          objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v12 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));
    p_additionalPredicate = &self->_additionalPredicate;
    v14 = *p_additionalPredicate;
    *p_additionalPredicate = (NSPredicate *)v12;

    additionalPredicate = *p_additionalPredicate;
  }
  v15 = additionalPredicate;
  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)analyticsKey
{
  return CFSTR("VIP");
}

- (EMVIP)VIP
{
  return (EMVIP *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPredicate, 0);
  objc_storeStrong((id *)&self->_VIP, 0);
}

@end
