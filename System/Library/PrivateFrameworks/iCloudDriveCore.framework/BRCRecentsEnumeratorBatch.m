@implementation BRCRecentsEnumeratorBatch

- (BRCRecentsEnumeratorBatch)initWithBatchSize:(unint64_t)a3
{
  BRCRecentsEnumeratorBatch *v4;
  uint64_t v5;
  NSFileProviderItem *toIndexItems;
  uint64_t v7;
  NSMutableArray *deletedItemIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCRecentsEnumeratorBatch;
  v4 = -[BRCRecentsEnumeratorBatch init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    toIndexItems = v4->_toIndexItems;
    v4->_toIndexItems = (NSFileProviderItem *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    deletedItemIDs = v4->_deletedItemIDs;
    v4->_deletedItemIDs = (NSMutableArray *)v7;

  }
  return v4;
}

- (void)addIndexOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v4 = a3;
  +[BRCNotification notificationGatheredFromItem:](BRCNotification, "notificationGatheredFromItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDocumentsFolder");

  if (!v7)
    goto LABEL_4;
  objc_msgSend(v4, "appLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRootItemInDB:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCNotification notificationFromItem:](BRCNotification, "notificationFromItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BE17670];
  objc_msgSend(v4, "appLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerItemForContainer:withRepresentativeItem:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "asFileProviderItem");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[NSFileProviderItem addObject:](self->_toIndexItems, "addObject:", v16);

LABEL_4:
    if (objc_msgSend(v5, "isDead"))
    {
      objc_msgSend(v5, "fileObjectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCRecentsEnumeratorBatch addDeletionOfFileObjectID:rank:](self, "addDeletionOfFileObjectID:rank:", v18, objc_msgSend(v4, "notifsRank"));

    }
    objc_msgSend(v5, "asFileProviderItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSFileProviderItem addObject:](self->_toIndexItems, "addObject:", v10);
      -[BRCRecentsEnumeratorBatch setRank:](self, "setRank:", objc_msgSend(v4, "notifsRank"));
    }
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[BRCRecentsEnumeratorBatch addIndexOfItem:].cold.1();

LABEL_11:
}

- (void)addDeletionOfFileObjectID:(id)a3 rank:(unint64_t)a4
{
  -[NSMutableArray addObject:](self->_deletedItemIDs, "addObject:", a3);
  -[BRCRecentsEnumeratorBatch setRank:](self, "setRank:", a4);
}

- (unint64_t)batchCount
{
  uint64_t v3;

  v3 = -[NSFileProviderItem count](self->_toIndexItems, "count");
  return -[NSMutableArray count](self->_deletedItemIDs, "count") + v3;
}

- (void)setRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;

  if (self->_rank > a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCRecentsEnumeratorBatch setRank:].cold.1();

  }
  self->_rank = a3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p, %lu indexed, %lu deleted>"), objc_opt_class(), self, -[NSFileProviderItem count](self->_toIndexItems, "count"), -[NSMutableArray count](self->_deletedItemIDs, "count"));
}

- (void)listItems:(id)a3
{
  if (a3)
    (*((void (**)(id, NSFileProviderItem *, NSMutableArray *))a3 + 2))(a3, self->_toIndexItems, self->_deletedItemIDs);
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_toIndexItems, 0);
}

- (void)addIndexOfItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: There should be a root item for %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)setRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: rank >= _rank%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
