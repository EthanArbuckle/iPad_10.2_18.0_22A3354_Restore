@implementation SRUIFChildConversationItemList

- (SRUIFChildConversationItemList)initWithConversation:(id)a3 parentItemIdentifier:(id)a4
{
  id v7;
  id v8;
  SRUIFChildConversationItemList *v9;
  SRUIFChildConversationItemList *v10;
  uint64_t v11;
  NSUUID *parentItemIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRUIFChildConversationItemList;
  v9 = -[SRUIFChildConversationItemList init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversation, a3);
    v11 = objc_msgSend(v8, "copy");
    parentItemIdentifier = v10->_parentItemIdentifier;
    v10->_parentItemIdentifier = (NSUUID *)v11;

  }
  return v10;
}

- (int64_t)numberOfItems
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFChildConversationItemList _parentItemIdentifier](self, "_parentItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "numberOfChildrenForItemWithIdentifier:", v4);

  return v5;
}

- (id)itemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFChildConversationItemList _indexPathForItemAtIndex:](self, "_indexPathForItemAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentOfItemWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFChildConversationItemList _parentItemIdentifier](self, "_parentItemIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v10)
  {

    goto LABEL_5;
  }
  v11 = (void *)v10;
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFChildConversationItemList _parentItemIdentifier](self, "_parentItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    v9 = v6;
    v6 = 0;
LABEL_5:

  }
  return v6;
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5
{
  -[SRUIFChildConversationItemList _addItemsForAceObjects:type:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:dialogPhase:asChildrenOfItemWithIdentifier:", a3, a4, a5, 0);
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemAtIndex:(int64_t)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a5;
  v11 = a3;
  -[SRUIFChildConversationItemList _identifierOfItemAtIndex:](self, "_identifierOfItemAtIndex:", a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SRUIFChildConversationItemList _addItemsForAceObjects:type:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:dialogPhase:asChildrenOfItemWithIdentifier:", v11, a4, v10, v12);

}

- (id)identifiersForItemsAtIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SRUIFChildConversationItemList *v12;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__SRUIFChildConversationItemList_identifiersForItemsAtIndexes___block_invoke;
  v10[3] = &unk_24DC1A8E0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v10);

  v8 = v7;
  return v8;
}

void __63__SRUIFChildConversationItemList_identifiersForItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_identifierOfItemAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)removeItemsAtIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SRUIFChildConversationItemList *v11;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__SRUIFChildConversationItemList_removeItemsAtIndexes___block_invoke;
  v9[3] = &unk_24DC1A8E0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v9);

  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemsWithIdentifiers:", v8);

}

void __55__SRUIFChildConversationItemList_removeItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_identifierOfItemAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)removeItemsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__SRUIFChildConversationItemList_removeItemsWithIdentifiers___block_invoke;
  v9[3] = &unk_24DC1A908;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemsWithIdentifiers:", v8);

}

void __61__SRUIFChildConversationItemList_removeItemsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasItemWithIdentifier:", v5);

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (BOOL)itemIsRestoredAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  -[SRUIFChildConversationItemList _indexPathForLastRestoredItem](self, "_indexPathForLastRestoredItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SRUIFChildConversationItemList _indexPathForItemAtIndex:](self, "_indexPathForItemAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v5) != 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_identifierOfItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SRUIFChildConversationItemList itemAtIndex:](self, "itemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_indexPathForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFChildConversationItemList _parentItemIdentifier](self, "_parentItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathByAddingIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_indexPathForLastRestoredItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastRestoredItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v2, "hasItemWithIdentifier:", v5),
        v5,
        v6))
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "indexPathForItemWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[SRUIFChildConversationItemList _conversation](self, "_conversation");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addItemsForAceObjects:type:dialogPhase:asChildrenOfItemWithIdentifier:", v12, a4, v11, v10);

}

- (SRUIFConversation)_conversation
{
  return self->_conversation;
}

- (NSUUID)_parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
