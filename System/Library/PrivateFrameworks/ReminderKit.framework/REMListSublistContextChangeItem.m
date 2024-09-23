@implementation REMListSublistContextChangeItem

- (REMListSublistContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5;
  REMListSublistContextChangeItem *v6;
  REMListSublistContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSublistContextChangeItem;
  v6 = -[REMListSublistContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listChangeItem, a3);

  return v7;
}

- (void)addListChangeItem:(id)a3
{
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", a3, 0, 0);
}

- (void)insertListChangeItem:(id)a3 beforeListChangeItem:(id)a4
{
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", a3, a4, 0);
}

- (void)insertListChangeItem:(id)a3 afterListChangeItem:(id)a4
{
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", a3, a4, 1);
}

- (void)_insertMergeableOrderingNode:(id)a3 adjacentToMergeableOrderingNode:(id)a4 isAfter:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isSubContainer"))
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:].cold.1();

  }
  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateAccountWithListChangeItem:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v8, v9, v5, v15);

}

- (void)addSmartListChangeItem:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem addSmartListChangeItem:]"));
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", v4, 0, 0);

}

- (void)insertSmartListChangeItem:(id)a3 beforeSmartListChangeItem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:]"));
  objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:] (sibling)"));
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", v7, v6, 0);

}

- (void)insertSmartListChangeItem:(id)a3 afterSmartListChangeItem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem insertSmartListChangeItem:afterSmartListChangeItem:]"));
  objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem insertSmartListChangeItem:afterSmartListChangeItem:] (sibling)"));
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", v7, v6, 1);

}

- (void)addMergeableOrderingNode:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem addMergeableOrderingNode:]"));
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", v4, 0, 0);

}

- (void)insertMergeableOrderingNode:(id)a3 beforeMergeableOrderingNode:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:]"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMListSublistContextChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:] (sibling)"));
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", v7, v6, 0);

}

- (void)insertMergeableOrderingNode:(id)a3 afterMergeableOrderingNode:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertMergeableOrderingNode:afterMergeableOrderingNode:]"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertMergeableOrderingNode:afterMergeableOrderingNode:] (sibling)"));
  -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:](self, "_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:", v7, v6, 1);

}

- (void)undeleteChildListWithID:(id)a3 usingUndo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[REMListSublistContextChangeItem _accountChangeItem](self, "_accountChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "undeleteListWithID:usingUndo:", v7, v6);

  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childListIDsToUndelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setChildListIDsToUndelete:", v10);

}

- (void)undeleteChildSmartListWithID:(id)a3 usingUndo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[REMListSublistContextChangeItem _accountChangeItem](self, "_accountChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "undeleteSmartListWithID:usingUndo:", v7, v6);

  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childSmartListIDsToUndelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setChildSmartListIDsToUndelete:", v10);

}

- (id)_accountChangeItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListSublistContextChangeItem listChangeItem](self, "listChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateAccountWithListChangeItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_listChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listChangeItem, 0);
}

- (void)_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_12();
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "remObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "listChangeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v2;
  v9 = 2114;
  v10 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v5, v6, "Nested group is not supported {orderingNodeObjectID: %{public}@, parentListID: %{public}@}", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

@end
