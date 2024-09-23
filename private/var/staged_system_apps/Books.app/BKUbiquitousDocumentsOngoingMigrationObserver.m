@implementation BKUbiquitousDocumentsOngoingMigrationObserver

- (BKUbiquitousDocumentsOngoingMigrationObserver)initWithAssetIDs:(id)a3 notify:(id)a4
{
  id v7;
  id v8;
  BKUbiquitousDocumentsOngoingMigrationObserver *v9;
  BKUbiquitousDocumentsOngoingMigrationObserver *v10;
  id v11;
  id notifyBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKUbiquitousDocumentsOngoingMigrationObserver;
  v9 = -[BKUbiquitousDocumentsOngoingMigrationObserver init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetIDs, a3);
    v11 = objc_retainBlock(v8);
    notifyBlock = v10->_notifyBlock;
    v10->_notifyBlock = v11;

  }
  return v10;
}

- (void)notify
{
  void (**v2)(void);
  void (**v3)(void);

  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsOngoingMigrationObserver notifyBlock](self, "notifyBlock"));
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (NSSet)assetIDs
{
  return self->_assetIDs;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void)setNotifyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_assetIDs, 0);
}

@end
