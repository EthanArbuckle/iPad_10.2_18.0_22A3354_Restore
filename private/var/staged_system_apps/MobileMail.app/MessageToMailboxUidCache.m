@implementation MessageToMailboxUidCache

- (MessageToMailboxUidCache)initWithLibrary:(id)a3
{
  id v6;
  MessageToMailboxUidCache *v7;
  uint64_t v8;
  NSMapTable *mailboxCache;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageToMailboxUidCache.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  v12.receiver = self;
  v12.super_class = (Class)MessageToMailboxUidCache;
  v7 = -[MessageToMailboxUidCache init](&v12, "init");
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    mailboxCache = v7->_mailboxCache;
    v7->_mailboxCache = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_library, a3);
  }

  return v7;
}

- (MessageToMailboxUidCache)init
{
  void *v3;
  MessageToMailboxUidCache *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v4 = -[MessageToMailboxUidCache initWithLibrary:](self, "initWithLibrary:", v3);

  return v4;
}

- (id)mailboxForMessage:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSMapTable *mailboxCache;
  void *v8;
  void *v9;
  NSMapTable *v10;
  void *v11;

  v4 = a3;
  v5 = qword_1005AA008;
  if (!qword_1005AA008)
  {
    v5 = objc_opt_class(MFLibraryMessage);
    qword_1005AA008 = v5;
  }
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "mailboxID");
    mailboxCache = self->_mailboxCache;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mailboxCache, "objectForKey:", v8));

    if (!v9)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailbox"));
      if (v9)
      {
        v10 = self->_mailboxCache;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v6));
        -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v9, v11);

      }
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailbox"));
  }

  return v9;
}

- (void)removeAllObjects
{
  -[NSMapTable removeAllObjects](self->_mailboxCache, "removeAllObjects");
}

- (unint64_t)count
{
  return -[NSMapTable count](self->_mailboxCache, "count");
}

- (id)_mailboxWithMailboxLibraryID:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessageLibrary urlForMailboxID:](self->_library, "urlForMailboxID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v3));

  return v4;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSMapTable *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:%p> {(\n"), v5, self));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_mailboxCache;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mailboxCache, "objectForKey:", v11));
        v13 = objc_msgSend(v11, "unsignedLongValue");
        objc_msgSend(v6, "appendFormat:", CFSTR("\t%ld\t: %@\n"), v13, v12, (_QWORD)v15);

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "appendString:", CFSTR(")}"));
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_mailboxCache, 0);
}

@end
