@implementation REMCDHashtagLabel

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDHashtagLabel"));
}

- (BOOL)validateForInsert:(id *)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  REMCDHashtagLabel *v8;
  unsigned __int8 v9;
  NSObject *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMCDHashtagLabel;
  if (!-[REMCDHashtagLabel validateForInsert:](&v12, "validateForInsert:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDHashtagLabel accountIdentifier](self, "accountIdentifier"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100681160(self, v7);

  }
  if ((objc_opt_respondsToSelector(self, "validateForInsert_Swift:") & 1) == 0)
    return 1;
  v8 = self;
  v9 = -[REMCDHashtagLabel validateForInsert_Swift:](v8, "validateForInsert_Swift:", a3);
  if (a3)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100681078(v8, (uint64_t *)a3, v10);

  }
  return v9;
}

- (void)willSave
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMCDHashtagLabel;
  -[REMCDHashtagLabel willSave](&v5, "willSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDHashtagLabel uuidForChangeTracking](self, "uuidForChangeTracking"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[REMCDHashtagLabel setUuidForChangeTracking:](self, "setUuidForChangeTracking:", v4);

  }
  if ((objc_opt_respondsToSelector(self, "willSave_Swift") & 1) != 0)
    -[REMCDHashtagLabel willSave_Swift](self, "willSave_Swift");
}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDHashtagLabel;
  -[REMCDHashtagLabel didSave](&v3, "didSave");
  if ((objc_opt_respondsToSelector(self, "didSave_Swift") & 1) != 0)
    -[REMCDHashtagLabel didSave_Swift](self, "didSave_Swift");
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDHashtagLabel");
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (id)remChangedObjectID
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDHashtagLabel uuidForChangeTracking](self, "uuidForChangeTracking"));
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class(self, v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v7));

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100681254(self, v9);

    v8 = 0;
  }

  return v8;
}

- (BOOL)didCleanUpManualSortHintOnDeletion
{
  return self->didCleanUpManualSortHintOnDeletion;
}

- (void)setDidCleanUpManualSortHintOnDeletion:(BOOL)a3
{
  self->didCleanUpManualSortHintOnDeletion = a3;
}

- (BOOL)wasDeletedDueToUserInitiatedChanges
{
  return self->wasDeletedDueToUserInitiatedChanges;
}

- (void)setWasDeletedDueToUserInitiatedChanges:(BOOL)a3
{
  self->wasDeletedDueToUserInitiatedChanges = a3;
}

- (BOOL)didEnqueueApprovalCascade
{
  return self->didEnqueueApprovalCascade;
}

- (void)setDidEnqueueApprovalCascade:(BOOL)a3
{
  self->didEnqueueApprovalCascade = a3;
}

- (void)willSave_Swift
{
  __n128 v2;
  REMCDHashtagLabel *v3;

  v3 = self;
  if (!-[REMCDHashtagLabel didCleanUpManualSortHintOnDeletion](v3, "didCleanUpManualSortHintOnDeletion"))
  {
    -[REMCDHashtagLabel setDidCleanUpManualSortHintOnDeletion:](v3, "setDidCleanUpManualSortHintOnDeletion:", 1);
    sub_1003C44CC(v2);
  }

}

- (void)didSave_Swift
{
  -[REMCDHashtagLabel setDidCleanUpManualSortHintOnDeletion:](self, "setDidCleanUpManualSortHintOnDeletion:", 0);
}

- (BOOL)validateForInsert_Swift:(id *)a3
{
  REMCDHashtagLabel *v3;

  v3 = self;
  if (!-[REMCDHashtagLabel didEnqueueApprovalCascade](v3, "didEnqueueApprovalCascade"))
  {
    -[REMCDHashtagLabel setDidEnqueueApprovalCascade:](v3, "setDidEnqueueApprovalCascade:", 1);
    sub_1003C54D0();
  }

  return 1;
}

@end
