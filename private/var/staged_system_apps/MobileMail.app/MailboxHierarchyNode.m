@implementation MailboxHierarchyNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

- (MailboxHierarchyNode)initWithMailbox:(id)a3
{
  id v5;
  MailboxHierarchyNode *v6;
  MailboxHierarchyNode *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailboxHierarchyNode;
  v6 = -[MailboxHierarchyNode init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailbox, a3);
    if (!-[MFMailboxUid mailboxType](v7->_mailbox, "mailboxType"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
      -[MailboxHierarchyNode setDisplayName:](v7, "setDisplayName:", v8);

    }
  }

  return v7;
}

- (id)mailbox
{
  return self->_mailbox;
}

- (void)setLevel:(int)a3
{
  self->_level = a3;
}

- (id)children
{
  return self->_children;
}

- (void)setParentMailbox:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int)level
{
  return self->_level;
}

- (void)addChild:(id)a3
{
  id v4;
  NSMutableArray *children;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  children = self->_children;
  v8 = v4;
  if (!children)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_children;
    self->_children = v6;

    children = self->_children;
    v4 = v8;
  }
  -[NSMutableArray ef_insertObject:usingSortFunction:context:allowDuplicates:](children, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v4, sub_1000396E8, 0, 1);

}

- (id)_findNodeForMailbox:(id)a3 removeNode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  MailboxHierarchyNode *v17;
  MailboxHierarchyNode *v18;
  MailboxHierarchyNode *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyNode children](self, "children"));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyNode mailbox](self, "mailbox"));

  if (v8 == v6)
  {
    v19 = self;
    v18 = v19;
    if (!v19)
      goto LABEL_21;
    goto LABEL_19;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mailbox", (_QWORD)v21));
        v15 = v14 == v6;

        if (v15)
        {
          v17 = v13;
          v18 = v17;
          goto LABEL_18;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "children"));

        if (v16)
        {
          v17 = (MailboxHierarchyNode *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_findNodeForMailbox:removeNode:", v6, v4));
          if (v17)
            goto LABEL_17;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v17 = 0;
      v18 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
LABEL_17:
    v18 = 0;
  }
LABEL_18:

  v19 = v17;
  if (v18)
  {
LABEL_19:
    if (v4)
      objc_msgSend(v7, "removeObject:", v18);
  }
LABEL_21:

  return v19;
}

- (id)removeNodeForMailbox:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyNode _findNodeForMailbox:removeNode:](self, "_findNodeForMailbox:removeNode:", a3, 1));
}

- (id)findNodeForMailbox:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyNode _findNodeForMailbox:removeNode:](self, "_findNodeForMailbox:removeNode:", a3, 0));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MailboxHierarchyNode;
  v3 = -[MailboxHierarchyNode description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxHierarchyNode mailbox](self, "mailbox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v4, v5));

  return v6;
}

- (MFMailboxUid)parentMailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
