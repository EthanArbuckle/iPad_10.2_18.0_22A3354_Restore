@implementation REMSmartListSectionChangeItem

- (REMSmartListSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoSmartListChangeItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  REMSmartListSectionStorage *v13;
  void *v14;
  REMSmartListSectionStorage *v15;
  void *v16;
  void *v17;
  REMSmartListSectionChangeItem *v18;
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
    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListChangeItem");
    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v11, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [REMSmartListSectionStorage alloc];
  objc_msgSend(v11, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REMSmartListSectionStorage initWithObjectID:accountID:smartListID:displayName:](v13, "initWithObjectID:accountID:smartListID:displayName:", v8, v12, v14, v9);

  objc_msgSend(v11, "saveRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)REMSmartListSectionChangeItem;
  v18 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](&v20, sel_initWithSaveRequest_storage_accountCapabilities_observeInitialValues_, v16, v15, v17, 1);

  return v18;
}

- (void)removeFromSmartList
{
  -[REMSmartListSectionChangeItem setSmartListID:](self, "setSmartListID:", 0);
}

+ (id)newObjectID
{
  return +[REMBaseSectionStorage newObjectID](REMSmartListSectionStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMBaseSectionStorage objectIDWithUUID:](REMSmartListSectionStorage, "objectIDWithUUID:", a3);
}

+ (id)cdEntityName
{
  return +[REMSmartListSectionStorage cdEntityName](REMSmartListSectionStorage, "cdEntityName");
}

@end
