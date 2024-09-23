@implementation MailboxHierarchyTree

- (MailboxHierarchyTree)initWithRootMailbox:(id)a3
{
  id v4;
  MailboxHierarchyTree *v5;
  MailboxHierarchyNode *v6;
  MailboxHierarchyNode *rootMailboxNode;
  NSMutableDictionary *v8;
  NSMutableDictionary *nodesByMailbox;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MailboxHierarchyTree;
  v5 = -[MailboxHierarchyTree init](&v11, "init");
  if (v5)
  {
    v6 = -[MailboxHierarchyNode initWithMailbox:]([MailboxHierarchyNode alloc], "initWithMailbox:", v4);
    rootMailboxNode = v5->_rootMailboxNode;
    v5->_rootMailboxNode = v6;

    -[MailboxHierarchyNode setLevel:](v5->_rootMailboxNode, "setLevel:", 0xFFFFFFFFLL);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nodesByMailbox = v5->_nodesByMailbox;
    v5->_nodesByMailbox = v8;

    -[NSMutableDictionary setObject:forKey:](v5->_nodesByMailbox, "setObject:forKey:", v5->_rootMailboxNode, v4);
  }

  return v5;
}

- (id)rootMailboxNode
{
  return self->_rootMailboxNode;
}

- (id)addChildMailbox:(id)a3 forMailboxNode:(id)a4
{
  id v6;
  id v7;
  MailboxHierarchyNode *v8;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[MailboxHierarchyNode initWithMailbox:]([MailboxHierarchyNode alloc], "initWithMailbox:", v6);
    -[MailboxHierarchyTree _addChildNode:toParentNode:](self, "_addChildNode:toParentNode:", v8, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addChildNode:(id)a3 toParentNode:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *nodesByMailbox;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "addChild:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailbox"));
  objc_msgSend(v10, "setParentMailbox:", v7);

  objc_msgSend(v10, "setLevel:", objc_msgSend(v6, "level") + 1);
  nodesByMailbox = self->_nodesByMailbox;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mailbox"));
  -[NSMutableDictionary setObject:forKey:](nodesByMailbox, "setObject:forKey:", v10, v9);

}

- (void)_insertMailboxUidsFlattenedFromMailboxNode:(id)a3 intoArray:(id)a4 currentLevel:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "children"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mailbox", (_QWORD)v15));
        if (v14)
        {
          objc_msgSend(v13, "setLevel:", v5);
          objc_msgSend(v8, "addObject:", v14);
          -[MailboxHierarchyTree _insertMailboxUidsFlattenedFromMailboxNode:intoArray:currentLevel:](self, "_insertMailboxUidsFlattenedFromMailboxNode:intoArray:currentLevel:", v13, v8, (v5 + 1));
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (int)levelForMailbox:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "level");
  else
    v5 = 0;

  return v5;
}

- (id)flattenedMailboxTreeRepresentation
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableArray);
  -[MailboxHierarchyTree _insertMailboxUidsFlattenedFromMailboxNode:intoArray:currentLevel:](self, "_insertMailboxUidsFlattenedFromMailboxNode:intoArray:currentLevel:", self->_rootMailboxNode, v3, 0);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByMailbox, 0);
  objc_storeStrong((id *)&self->_rootMailboxNode, 0);
}

- (void)removeNodeForMailbox:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = -[MailboxHierarchyNode removeNodeForMailbox:](self->_rootMailboxNode, "removeNodeForMailbox:");
  -[NSMutableDictionary removeObjectForKey:](self->_nodesByMailbox, "removeObjectForKey:", v5);

}

- (void)moveMailbox:(id)a3 toParent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", v11));
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", v6));
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    -[MailboxHierarchyTree removeNodeForMailbox:](self, "removeNodeForMailbox:", v11);
    -[MailboxHierarchyTree _addChildNode:toParentNode:](self, "_addChildNode:toParentNode:", v7, v9);
  }

}

- (id)parentForMailbox:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentMailbox"));

  return v4;
}

- (void)setDisplayName:(id)a3 forMailbox:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", v6));
  objc_msgSend(v7, "setDisplayName:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentMailbox"));
  -[MailboxHierarchyTree moveMailbox:toParent:](self, "moveMailbox:toParent:", v6, v8);

}

- (id)displayNameForMailbox:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));

  return v4;
}

- (BOOL)mailboxHasSubMailboxes:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_nodesByMailbox, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "children"));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

@end
