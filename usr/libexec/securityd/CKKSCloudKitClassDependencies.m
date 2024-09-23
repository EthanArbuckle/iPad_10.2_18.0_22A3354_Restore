@implementation CKKSCloudKitClassDependencies

- (CKKSCloudKitClassDependencies)initWithFetchRecordZoneChangesOperationClass:(Class)a3 fetchRecordsOperationClass:(Class)a4 queryOperationClass:(Class)a5 modifySubscriptionsOperationClass:(Class)a6 modifyRecordZonesOperationClass:(Class)a7 apsConnectionClass:(Class)a8 nsnotificationCenterClass:(Class)a9 nsdistributednotificationCenterClass:(Class)a10 notifierClass:(Class)a11
{
  CKKSCloudKitClassDependencies *v17;
  CKKSCloudKitClassDependencies *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKKSCloudKitClassDependencies;
  v17 = -[CKKSCloudKitClassDependencies init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fetchRecordZoneChangesOperationClass, a3);
    objc_storeStrong((id *)&v18->_fetchRecordsOperationClass, a4);
    objc_storeStrong((id *)&v18->_queryOperationClass, a5);
    objc_storeStrong((id *)&v18->_modifySubscriptionsOperationClass, a6);
    objc_storeStrong((id *)&v18->_modifyRecordZonesOperationClass, a7);
    objc_storeStrong((id *)&v18->_apsConnectionClass, a8);
    objc_storeStrong((id *)&v18->_nsnotificationCenterClass, a9);
    objc_storeStrong((id *)&v18->_nsdistributednotificationCenterClass, a10);
    objc_storeStrong((id *)&v18->_notifierClass, a11);
  }
  return v18;
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (Class)fetchRecordsOperationClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (Class)queryOperationClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (Class)modifySubscriptionsOperationClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (Class)modifyRecordZonesOperationClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 56, 1);
}

- (Class)nsdistributednotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 64, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_nsdistributednotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_nsnotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_apsConnectionClass, 0);
  objc_storeStrong((id *)&self->_modifyRecordZonesOperationClass, 0);
  objc_storeStrong((id *)&self->_modifySubscriptionsOperationClass, 0);
  objc_storeStrong((id *)&self->_queryOperationClass, 0);
  objc_storeStrong((id *)&self->_fetchRecordsOperationClass, 0);
  objc_storeStrong((id *)&self->_fetchRecordZoneChangesOperationClass, 0);
}

+ (id)forLiveCloudKit
{
  CKKSCloudKitClassDependencies *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = [CKKSCloudKitClassDependencies alloc];
  v3 = objc_opt_class(CKFetchRecordZoneChangesOperation);
  v4 = objc_opt_class(CKFetchRecordsOperation);
  v5 = objc_opt_class(CKQueryOperation);
  v6 = objc_opt_class(CKModifySubscriptionsOperation);
  v7 = objc_opt_class(CKModifyRecordZonesOperation);
  v8 = objc_opt_class(APSConnection);
  v9 = objc_opt_class(NSNotificationCenter);
  v10 = objc_opt_class(NSDistributedNotificationCenter);
  return -[CKKSCloudKitClassDependencies initWithFetchRecordZoneChangesOperationClass:fetchRecordsOperationClass:queryOperationClass:modifySubscriptionsOperationClass:modifyRecordZonesOperationClass:apsConnectionClass:nsnotificationCenterClass:nsdistributednotificationCenterClass:notifierClass:](v2, "initWithFetchRecordZoneChangesOperationClass:fetchRecordsOperationClass:queryOperationClass:modifySubscriptionsOperationClass:modifyRecordZonesOperationClass:apsConnectionClass:nsnotificationCenterClass:nsdistributednotificationCenterClass:notifierClass:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(CKKSNotifyPostNotifier));
}

@end
