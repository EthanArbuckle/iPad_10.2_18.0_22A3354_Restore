@implementation ICUserDefaults

- (ICUserDefaults)initWithCloudSchemaCatchUpSyncSchedulingStateStorage:(id)a3
{
  id v4;
  ICUserDefaults *v5;
  ICUserDefaults *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICUserDefaults;
  v5 = -[ICUserDefaults init](&v8, "init");
  v6 = v5;
  if (v5)
    -[ICUserDefaults setCloudSchemaCatchUpSyncSchedulingStateStorage:](v5, "setCloudSchemaCatchUpSyncSchedulingStateStorage:", v4);

  return v6;
}

- (ICUserDefaults)init
{
  void *v3;
  ICUserDefaults *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v4 = -[ICUserDefaults initWithCloudSchemaCatchUpSyncSchedulingStateStorage:](self, "initWithCloudSchemaCatchUpSyncSchedulingStateStorage:", v3);

  return v4;
}

- (id)userDefaults
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userDefaults"));

  return v3;
}

- (ICCloudSchemaCatchUpSyncSchedulingStateStorage)cloudSchemaCatchUpSyncSchedulingStateStorage
{
  return self->_cloudSchemaCatchUpSyncSchedulingStateStorage;
}

- (void)setCloudSchemaCatchUpSyncSchedulingStateStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncSchedulingStateStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncSchedulingStateStorage, 0);
}

@end
