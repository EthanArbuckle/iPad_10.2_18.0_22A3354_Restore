@implementation REMSmartListSection

- (REMSmartListSection)initWithStore:(id)a3 smartList:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  REMSmartListSection *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "accountCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)REMSmartListSection;
  v13 = -[REMBaseSection initWithStore:accountCapabilities:storage:](&v15, sel_initWithStore_accountCapabilities_storage_, v11, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_smartList, a4);

  return v13;
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

- (REMSmartList)smartList
{
  return self->_smartList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartList, 0);
}

@end
