@implementation REMTemplateSectionStorage

- (void)setParentTemplateID:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMTemplateSectionStorage;
  -[REMBaseSectionStorage setParentID:](&v3, sel_setParentID_, a3);
}

- (REMTemplateSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 parentTemplateID:(id)a5 displayName:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMTemplateSectionStorage;
  return -[REMBaseSectionStorage initWithObjectID:accountID:parentID:displayName:](&v7, sel_initWithObjectID_accountID_parentID_displayName_, a3, a4, a5, a6);
}

+ (id)cdEntityName
{
  return CFSTR("REMCDTemplateSection");
}

- (id)cdKeyToStorageKeyMap
{
  if (cdTemplateSectionKeyToStorageKeyMap_onceToken != -1)
    dispatch_once(&cdTemplateSectionKeyToStorageKeyMap_onceToken, &__block_literal_global_12);
  return (id)cdTemplateSectionKeyToStorageKeyMap_mapping;
}

@end
