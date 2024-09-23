@implementation BMSyncCore

+ (void)resetEagerExitTimer
{
  NSObject *v2;
  dispatch_time_t v3;

  if (qword_10007BDE8 != -1)
    dispatch_once(&qword_10007BDE8, &stru_100068CE0);
  v2 = qword_10007BDE0;
  v3 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (BMSyncCore)initWithQueue:(id)a3
{
  id v5;
  BMSyncCore *v6;
  BMSyncCore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncCore;
  v6 = -[BMSyncCore init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)start
{
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;
  id v7;
  BMAccessAssertion *v8;
  id v9;
  BMAccessAssertion *accessAssertion;
  void *v11;
  BMDistributedSyncMultiStreamManager *v12;
  BMDistributedSyncMultiStreamManager *primaryUserSyncStreamManager;
  BMRapportSyncEngine *v14;
  BMRapportSyncEngine *rapportSyncEngine;
  BMCloudKitSyncEngine *v16;
  BMCloudKitSyncEngine *cloudKitSyncEngine;
  BMSyncScheduler *v18;
  BMRapportSyncEngine *v19;
  BMCloudKitSyncEngine *v20;
  void *v21;
  BMSyncScheduler *v22;
  BMSyncScheduler *syncScheduler;
  uint64_t v24;
  NSObject *v25;
  id v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 2)
    return 1;
  v4 = objc_alloc((Class)BMAccessClient);
  v5 = objc_msgSend(v4, "initWithUseCase:", BMUseCaseSync);
  v6 = objc_alloc((Class)BMResourceSpecifier);
  v7 = objc_msgSend(v6, "initWithType:name:", 5, BMSyncResource);
  v27 = 0;
  v8 = (BMAccessAssertion *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestAccessToResource:mode:error:", v7, 3, &v27));
  v9 = v27;
  accessAssertion = self->_accessAssertion;
  self->_accessAssertion = v8;

  if (self->_accessAssertion)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BMSyncDatabase createPrimaryDatabaseWithQueue:](BMSyncDatabase, "createPrimaryDatabaseWithQueue:", self->_queue));
    v3 = objc_msgSend(v11, "open");
    if ((v3 & 1) != 0)
    {
      objc_storeStrong((id *)&self->_primaryDatabase, v11);
      v12 = (BMDistributedSyncMultiStreamManager *)objc_claimAutoreleasedReturnValue(+[BMDistributedSyncMultiStreamManager multiStreamManagerWithPrimaryDatabase:account:queue:](BMDistributedSyncMultiStreamManager, "multiStreamManagerWithPrimaryDatabase:account:queue:", self->_primaryDatabase, 0, self->_queue));
      primaryUserSyncStreamManager = self->_primaryUserSyncStreamManager;
      self->_primaryUserSyncStreamManager = v12;

      v14 = -[BMRapportSyncEngine initWithQueue:primarySyncManager:primaryDatabase:]([BMRapportSyncEngine alloc], "initWithQueue:primarySyncManager:primaryDatabase:", self->_queue, self->_primaryUserSyncStreamManager, self->_primaryDatabase);
      rapportSyncEngine = self->_rapportSyncEngine;
      self->_rapportSyncEngine = v14;

      v16 = -[BMCloudKitSyncEngine initWithQueue:multiStreamManager:database:]([BMCloudKitSyncEngine alloc], "initWithQueue:multiStreamManager:database:", self->_queue, self->_primaryUserSyncStreamManager, self->_primaryDatabase);
      cloudKitSyncEngine = self->_cloudKitSyncEngine;
      self->_cloudKitSyncEngine = v16;

      v18 = [BMSyncScheduler alloc];
      v19 = self->_rapportSyncEngine;
      v20 = self->_cloudKitSyncEngine;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine peerStatusTracker](v19, "peerStatusTracker"));
      v22 = -[BMSyncScheduler initWithRapportSyncEngine:cloudKitSyncEngine:peerStatusTracker:database:queue:](v18, "initWithRapportSyncEngine:cloudKitSyncEngine:peerStatusTracker:database:queue:", v19, v20, v21, self->_primaryDatabase, self->_queue);
      syncScheduler = self->_syncScheduler;
      self->_syncScheduler = v22;

      self->_state = 2;
      +[BMSyncCore resetEagerExitTimer](BMSyncCore, "resetEagerExitTimer");
    }
    else
    {
      self->_state = 1;
    }

  }
  else
  {
    v24 = __biome_log_for_category(11);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100041BBC((uint64_t)v9, v25);

    v3 = 0;
    self->_state = 1;
  }

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BMSyncDatabase)primaryDatabase
{
  return self->_primaryDatabase;
}

- (void)setPrimaryDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDatabase, a3);
}

- (BMDistributedSyncMultiStreamManager)primaryUserSyncStreamManager
{
  return self->_primaryUserSyncStreamManager;
}

- (void)setPrimaryUserSyncStreamManager:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUserSyncStreamManager, a3);
}

- (BMRapportSyncEngine)rapportSyncEngine
{
  return self->_rapportSyncEngine;
}

- (void)setRapportSyncEngine:(id)a3
{
  objc_storeStrong((id *)&self->_rapportSyncEngine, a3);
}

- (BMCloudKitSyncEngine)cloudKitSyncEngine
{
  return self->_cloudKitSyncEngine;
}

- (void)setCloudKitSyncEngine:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitSyncEngine, a3);
}

- (BMSyncScheduler)syncScheduler
{
  return self->_syncScheduler;
}

- (void)setSyncScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_syncScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncScheduler, 0);
  objc_storeStrong((id *)&self->_cloudKitSyncEngine, 0);
  objc_storeStrong((id *)&self->_rapportSyncEngine, 0);
  objc_storeStrong((id *)&self->_primaryUserSyncStreamManager, 0);
  objc_storeStrong((id *)&self->_primaryDatabase, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
