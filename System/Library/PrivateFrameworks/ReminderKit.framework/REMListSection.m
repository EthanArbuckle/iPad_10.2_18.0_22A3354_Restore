@implementation REMListSection

- (REMListSection)initWithStore:(id)a3 list:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  REMListSection *v14;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)REMListSection;
  v14 = -[REMBaseSection initWithStore:accountCapabilities:storage:](&v16, sel_initWithStore_accountCapabilities_storage_, v11, v13, v10);

  if (v14)
    objc_storeStrong((id *)&v14->_list, a4);

  return v14;
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

- (REMList)list
{
  return self->_list;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end
