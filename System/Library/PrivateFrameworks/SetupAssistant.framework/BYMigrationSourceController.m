@implementation BYMigrationSourceController

- (BYMigrationSourceController)init
{
  BYMigrationSourceController *v2;
  BYBuddyDaemonMigrationSourceClient *v3;
  BYBuddyDaemonMigrationSourceClient *migrationSourceClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYMigrationSourceController;
  v2 = -[BYMigrationSourceController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BYBuddyDaemonMigrationSourceClient);
    migrationSourceClient = v2->_migrationSourceClient;
    v2->_migrationSourceClient = v3;

  }
  return v2;
}

- (void)launchSetupForMigration:(id)a3
{
  id v3;

  -[BYMigrationSourceController migrationSourceClient](self, "migrationSourceClient", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchSetupForMigration");

}

- (void)setFileTransferSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYMigrationSourceController migrationSourceClient](self, "migrationSourceClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileTransferTemplate:", v4);

}

- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient
{
  return self->_migrationSourceClient;
}

- (void)setMigrationSourceClient:(id)a3
{
  objc_storeStrong((id *)&self->_migrationSourceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSourceClient, 0);
}

@end
