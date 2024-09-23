@implementation REMTemplateSection

- (REMTemplateSection)initWithStore:(id)a3 parentTemplate:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  REMTemplateSection *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "accountCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)REMTemplateSection;
  v13 = -[REMBaseSection initWithStore:accountCapabilities:storage:](&v15, sel_initWithStore_accountCapabilities_storage_, v11, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_parentTemplate, a4);

  return v13;
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

- (REMTemplate)parentTemplate
{
  return self->_parentTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTemplate, 0);
}

@end
