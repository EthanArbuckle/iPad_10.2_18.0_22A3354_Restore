@implementation WBUHistory

- (id)_createHistoryStore
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)off_24CB8CC90);
  -[WBSHistory databaseID](self, "databaseID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDatabaseID:itemCountLimit:historyAgeLimit:historyItemClass:", v4, 4000, -[WBUHistory _historyItemClass](self, "_historyItemClass"), *(double *)((char *)&self->super.super.isa + *(int *)off_24CB8CD48));

  return v5;
}

- (WBUHistory)initWithDatabaseID:(id)a3
{
  WBUHistory *v3;
  WBUHistory *v4;
  WBUHistory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBUHistory;
  v3 = -[WBSHistory initWithDatabaseID:](&v7, sel_initWithDatabaseID_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_shouldScheduleMaintenance = 1;
    *(Class *)((char *)&v3->super.super.isa + *(int *)off_24CB8CD48) = (Class)0x4143C68000000000;
    -[WBSHistory _createHistoryStoreIfNeeded](v3, "_createHistoryStoreIfNeeded");
    v5 = v4;
  }

  return v4;
}

- (BOOL)historyStoreShouldScheduleMaintenance:(id)a3
{
  return self->_shouldScheduleMaintenance;
}

- (Class)_historyItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3
{
  return 1;
}

- (void)historyStoreDidFailDatabaseIntegrityCheck:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "historyDatabaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v3, 0);

  objc_msgSend((id)objc_opt_class(), "historyDatabaseWriteAheadLogURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

}

- (BOOL)shouldScheduleMaintenance
{
  return self->_shouldScheduleMaintenance;
}

- (void)setShouldScheduleMaintenance:(BOOL)a3
{
  self->_shouldScheduleMaintenance = a3;
}

@end
