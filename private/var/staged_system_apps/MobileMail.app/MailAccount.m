@implementation MailAccount

- (id)treeOfAllMailboxUidsSortedWithSpecialsAtTopIncludingLocals:(BOOL)a3 client:(id)a4 outbox:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_respondsToSelector(v8, "shouldReloadMailboxesWithOutbox:");
  v11 = objc_claimAutoreleasedReturnValue(+[MailAccount log](MailAccount, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount ef_publicDescription](self, "ef_publicDescription"));
    v17 = 138543874;
    v18 = v12;
    v19 = 2114;
    v20 = v8;
    v21 = 1024;
    v22 = v10 & 1;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@> client:%{public}@, clientRespondsToReload:%{BOOL}d", (uint8_t *)&v17, 0x1Cu);

  }
  if (!v9 && v6 && ((v10 ^ 1) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", "_loadOutbox:", self, v8, CFSTR("LoadOutboxTask"), 12, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
    objc_msgSend(v14, "addInvocation:", v13);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount _treeOfAllMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:](self, "_treeOfAllMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:", v6, v9, objc_msgSend(v8, "shouldHideInbox"), objc_msgSend(v8, "shouldHideNotesForAccount:", self)));

  return v15;
}

- (id)_treeOfAllMailboxesIncludingLocals:(BOOL)a3 withOutbox:(id)a4 hideInbox:(BOOL)a5 hideNotes:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  MailboxHierarchyTree *v10;
  void *v11;
  MailboxHierarchyTree *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;

  v6 = a6;
  v7 = a5;
  v26 = a4;
  v10 = [MailboxHierarchyTree alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount rootMailbox](self, "rootMailbox"));
  v12 = -[MailboxHierarchyTree initWithRootMailbox:](v10, "initWithRootMailbox:", v11);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyTree rootMailboxNode](v12, "rootMailboxNode"));
  v23 = v6;
  if (a3)
    v13 = 0;
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount primaryMailboxUid](self, "primaryMailboxUid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 5, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 4, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 3, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 2, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 1, 0));
  if (!v7 || objc_msgSend(v25, "hasChildren"))
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v25, v12);
  if (a3
    || v13
    && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "account")), v19, v19 != v13))
  {
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v14, v12);
  }
  if (v26)
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v26, v12);
  if (a3
    || v13
    && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "account")), v20, v20 != v13))
  {
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v15, v12);
  }
  if (v18)
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v18, v12);
  if (a3
    || v13
    && (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account")), v21, v21 != v13))
  {
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v16, v12);
  }
  if (v17)
    -[MailAccount _addSpecialMailbox:toTree:](self, "_addSpecialMailbox:toTree:", v17, v12);
  -[MailAccount _addGenericChildrenToMailboxTree:forNode:hideNotes:](self, "_addGenericChildrenToMailboxTree:forNode:hideNotes:", v12, v24, v23);

  return v12;
}

- (void)_addSpecialMailbox:(id)a3 toTree:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootMailboxNode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addChildMailbox:forMailboxNode:", v9, v7));

    if (objc_msgSend(v9, "hasChildren"))
      -[MailAccount _addGenericChildrenToMailboxTree:forNode:hideNotes:](self, "_addGenericChildrenToMailboxTree:forNode:hideNotes:", v6, v8, 0);

  }
}

- (void)_addGenericChildrenToMailboxTree:(id)a3 forNode:(id)a4 hideNotes:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  id v19;

  v5 = a5;
  v19 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailbox"));
  if (v9)
  {
    v18 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childEnumerator"));
    v11 = 0;
    while (1)
    {
      while (1)
      {
        do
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

          if (!v12)
          {

            v9 = v18;
            goto LABEL_14;
          }
          v13 = objc_opt_class(MFMailboxUid);
          v11 = v12;
        }
        while ((objc_opt_isKindOfClass(v12, v13) & 1) == 0);
        v14 = objc_msgSend(v12, "type");
        if (!v14 && v5)
          break;
        v11 = v12;
        if (!v14)
          goto LABEL_10;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Notes"));

      v11 = v12;
      if ((v16 & 1) == 0)
      {
LABEL_10:
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "addChildMailbox:forMailboxNode:", v12, v8));
        if (objc_msgSend(v12, "hasChildren"))
          -[MailAccount _addGenericChildrenToMailboxTree:forNode:hideNotes:](self, "_addGenericChildrenToMailboxTree:forNode:hideNotes:", v19, v17, 0);

        v11 = v12;
      }
    }
  }
LABEL_14:

}

+ (id)accountImageForAccounts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSBundle *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));
    if (!qword_1005A9CD0)
    {
      v6 = objc_alloc_init((Class)NSMutableDictionary);
      v7 = (void *)qword_1005A9CD0;
      qword_1005A9CD0 = (uint64_t)v6;

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iconString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1005A9CD0, "objectForKey:", v8));
    if (!v4)
    {
      if (!qword_1005A9CD8)
      {
        v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAccount));
        v10 = objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)qword_1005A9CD8;
        qword_1005A9CD8 = v10;

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v8));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_applicationIconImageForFormat:precomposed:", 0, 1));
      if (!v4)
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend((id)qword_1005A9CD0, "setObject:forKey:", v4, v8);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

    if (v13 == v4)
    {

      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_putMailboxesRootedAt:(id)a3 intoArray:(id)a4 hideNotes:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "childEnumerator"));
  v10 = 0;
  while (1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

    if (!v11)
      break;
    v12 = objc_msgSend(v11, "type");
    if (v12 || !v5)
    {
      v10 = v11;
      if (!v12)
      {
LABEL_8:
        objc_msgSend(v8, "addObject:", v11);
        v10 = v11;
        if (objc_msgSend(v11, "hasChildren"))
        {
          v10 = v11;
          -[MailAccount _putMailboxesRootedAt:intoArray:hideNotes:](self, "_putMailboxesRootedAt:intoArray:hideNotes:", v11, v8, 0);
        }
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Notes"));

      v10 = v11;
      if ((v14 & 1) == 0)
        goto LABEL_8;
    }
  }

}

- (void)addSpecialMailbox:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    objc_msgSend(v6, "addObject:", v7);
    if (objc_msgSend(v7, "hasChildren"))
      -[MailAccount _putMailboxesRootedAt:intoArray:hideNotes:](self, "_putMailboxesRootedAt:intoArray:hideNotes:", v7, v6, 0);
  }

}

- (id)_allMailboxesIncludingLocals:(BOOL)a3 withOutbox:(id)a4 hideInbox:(BOOL)a5 hideNotes:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v22;
  void *v23;
  id v24;

  v6 = a6;
  v7 = a5;
  v24 = a4;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v22 = v6;
  if (a3)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount primaryMailboxUid](self, "primaryMailboxUid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 5, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 4, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 3, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 2, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 1, 0));
  if (!v7 || objc_msgSend(v23, "hasChildren"))
    -[MailAccount addSpecialMailbox:toArray:](self, "addSpecialMailbox:toArray:", v23, v10);
  if (a3
    || v11
    && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account")), v17, v17 != v11))
  {
    -[MailAccount addSpecialMailbox:toArray:](self, "addSpecialMailbox:toArray:", v12, v10);
  }
  if (v24)
    objc_msgSend(v10, "addObject:", v24);
  if (!a3)
  {
    if (!v11)
      goto LABEL_20;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));

    if (v18 == v11)
      goto LABEL_18;
  }
  -[MailAccount addSpecialMailbox:toArray:](self, "addSpecialMailbox:toArray:", v13, v10);
  if (!a3)
  {
    if (!v11)
      goto LABEL_20;
LABEL_18:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "account"));

    if (v19 == v11)
      goto LABEL_20;
  }
  -[MailAccount addSpecialMailbox:toArray:](self, "addSpecialMailbox:toArray:", v14, v10);
LABEL_20:
  if (v15)
    -[MailAccount addSpecialMailbox:toArray:](self, "addSpecialMailbox:toArray:", v15, v10);
  if (v16)
    -[MailAccount addSpecialMailbox:toArray:](self, "addSpecialMailbox:toArray:", v16, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount rootMailbox](self, "rootMailbox"));
  -[MailAccount _putMailboxesRootedAt:intoArray:hideNotes:](self, "_putMailboxesRootedAt:intoArray:hideNotes:", v20, v10, v22);

  return v10;
}

- (void)_loadOutbox:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountRepository"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountForAccountIdentifier:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "daemonInterface"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outgoingMessageRepository"));

  if (objc_msgSend(v11, "outboxContainsMessageFromAccount:", v8))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount outboxMailboxUid](MailAccount, "outboxMailboxUid"));
    objc_msgSend(v13, "shouldReloadMailboxesWithOutbox:", v12);

  }
}

- (id)treeOfAllGenericMailboxes
{
  MailboxHierarchyTree *v3;
  void *v4;
  MailboxHierarchyTree *v5;
  void *v6;

  v3 = [MailboxHierarchyTree alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount rootMailbox](self, "rootMailbox"));
  v5 = -[MailboxHierarchyTree initWithRootMailbox:](v3, "initWithRootMailbox:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyTree rootMailboxNode](v5, "rootMailboxNode"));
  -[MailAccount _addGenericChildrenToMailboxTree:forNode:hideNotes:](self, "_addGenericChildrenToMailboxTree:forNode:hideNotes:", v5, v6, -[MailAccount isSyncingNotes](self, "isSyncingNotes"));

  return v5;
}

- (id)allMailboxUidsSortedWithSpecialsAtTopIncludingLocals:(BOOL)a3
{
  return -[MailAccount _allMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:](self, "_allMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:", a3, 0, 0, 0);
}

@end
