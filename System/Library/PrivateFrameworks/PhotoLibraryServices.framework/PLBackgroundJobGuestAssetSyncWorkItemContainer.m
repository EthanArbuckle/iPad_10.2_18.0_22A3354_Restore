@implementation PLBackgroundJobGuestAssetSyncWorkItemContainer

- (id)copyWithZone:(_NSZone *)a3
{
  PLBackgroundJobGuestAssetSyncWorkItemContainer *v3;
  PLBackgroundJobGuestAssetSyncWorkItemContainer *v4;
  uint64_t v5;
  NSManagedObjectID *objectID;

  objc_msgSend((id)objc_opt_class(), "libraryOrPreferencesChangedWorkItem");
  v3 = (PLBackgroundJobGuestAssetSyncWorkItemContainer *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    return self;
  v4 = objc_alloc_init(PLBackgroundJobGuestAssetSyncWorkItemContainer);
  -[PLBackgroundJobGuestAssetSyncWorkItemContainer objectID](self, "objectID");
  v5 = objc_claimAutoreleasedReturnValue();
  objectID = v4->_objectID;
  v4->_objectID = (NSManagedObjectID *)v5;

  v4->_type = -[PLBackgroundJobGuestAssetSyncWorkItemContainer type](self, "type");
  return v4;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

+ (id)persistedJobWorkItemWithObjectID:(id)a3
{
  NSManagedObjectID *v3;
  PLBackgroundJobGuestAssetSyncWorkItemContainer *v4;
  NSManagedObjectID *objectID;

  v3 = (NSManagedObjectID *)a3;
  v4 = objc_alloc_init(PLBackgroundJobGuestAssetSyncWorkItemContainer);
  objectID = v4->_objectID;
  v4->_objectID = v3;
  v4->_type = 2;

  return v4;
}

+ (id)libraryOrPreferencesChangedWorkItem
{
  PLBackgroundJobGuestAssetSyncWorkItemContainer *v2;

  v2 = objc_alloc_init(PLBackgroundJobGuestAssetSyncWorkItemContainer);
  v2->_type = 0;
  return v2;
}

+ (id)initialSyncWorkItem
{
  PLBackgroundJobGuestAssetSyncWorkItemContainer *v2;

  v2 = objc_alloc_init(PLBackgroundJobGuestAssetSyncWorkItemContainer);
  v2->_type = 1;
  return v2;
}

@end
