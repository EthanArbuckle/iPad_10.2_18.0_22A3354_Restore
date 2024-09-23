@implementation REMTemplateSectionChangeItem

- (REMTemplateSectionChangeItem)initWithObjectID:(id)a3 displayName:(id)a4 insertIntoTemplateChangeItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  REMTemplateSectionStorage *v13;
  void *v14;
  REMTemplateSectionStorage *v15;
  void *v16;
  void *v17;
  REMTemplateSectionChangeItem *v18;
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
    NSLog(CFSTR("'%s' is unexpectedly nil"), "templateChangeItem");
    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v11, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [REMTemplateSectionStorage alloc];
  objc_msgSend(v11, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REMTemplateSectionStorage initWithObjectID:accountID:parentTemplateID:displayName:](v13, "initWithObjectID:accountID:parentTemplateID:displayName:", v8, v12, v14, v9);

  objc_msgSend(v11, "saveRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)REMTemplateSectionChangeItem;
  v18 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](&v20, sel_initWithSaveRequest_storage_accountCapabilities_observeInitialValues_, v16, v15, v17, 1);

  return v18;
}

- (void)removeFromParentTemplate
{
  -[REMTemplateSectionChangeItem setParentTemplateID:](self, "setParentTemplateID:", 0);
}

+ (id)newObjectID
{
  return +[REMBaseSectionStorage newObjectID](REMTemplateSectionStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMBaseSectionStorage objectIDWithUUID:](REMTemplateSectionStorage, "objectIDWithUUID:", a3);
}

+ (id)cdEntityName
{
  return +[REMTemplateSectionStorage cdEntityName](REMTemplateSectionStorage, "cdEntityName");
}

@end
