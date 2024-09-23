@implementation REMListSectionChangeItem

+ (id)keysToObserve
{
  if (keysToObserve_onceToken != -1)
    dispatch_once(&keysToObserve_onceToken, &__block_literal_global_4);
  return (id)keysToObserve___sKeysToObserve;
}

void __41__REMListSectionChangeItem_keysToObserve__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[REMBaseSectionChangeItem keysToObserve](REMBaseSectionChangeItem, "keysToObserve");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", &unk_1E6836D90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keysToObserve___sKeysToObserve;
  keysToObserve___sKeysToObserve = v0;

}

- (REMListSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoListChangeItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  REMListSectionStorage *v13;
  void *v14;
  REMListSectionStorage *v15;
  void *v16;
  void *v17;
  REMListSectionChangeItem *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "displayName");
    if (v11)
      goto LABEL_3;
LABEL_5:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listChangeItem");
    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v11, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [REMListSectionStorage alloc];
  objc_msgSend(v11, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REMListSectionStorage initWithObjectID:accountID:listID:displayName:](v13, "initWithObjectID:accountID:listID:displayName:", v8, v12, v14, v9);

  objc_msgSend(v11, "saveRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)REMListSectionChangeItem;
  v18 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](&v20, sel_initWithSaveRequest_storage_accountCapabilities_observeInitialValues_, v16, v15, v17, 1);

  return v18;
}

- (void)removeFromList
{
  -[REMListSectionChangeItem setListID:](self, "setListID:", 0);
}

+ (id)newObjectID
{
  return +[REMBaseSectionStorage newObjectID](REMListSectionStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMBaseSectionStorage objectIDWithUUID:](REMListSectionStorage, "objectIDWithUUID:", a3);
}

+ (id)cdEntityName
{
  return +[REMListSectionStorage cdEntityName](REMListSectionStorage, "cdEntityName");
}

@end
