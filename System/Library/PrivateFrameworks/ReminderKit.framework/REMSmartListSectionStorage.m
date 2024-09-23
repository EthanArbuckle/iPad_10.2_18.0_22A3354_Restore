@implementation REMSmartListSectionStorage

- (void)setSmartListID:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMSmartListSectionStorage;
  -[REMBaseSectionStorage setParentID:](&v3, sel_setParentID_, a3);
}

- (REMSmartListSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 smartListID:(id)a5 displayName:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMSmartListSectionStorage;
  return -[REMBaseSectionStorage initWithObjectID:accountID:parentID:displayName:](&v7, sel_initWithObjectID_accountID_parentID_displayName_, a3, a4, a5, a6);
}

+ (id)cdEntityName
{
  return CFSTR("REMCDSmartListSection");
}

- (id)cdKeyToStorageKeyMap
{
  if (cdSmartListSectionKeyToStorageKeyMap_onceToken != -1)
    dispatch_once(&cdSmartListSectionKeyToStorageKeyMap_onceToken, &__block_literal_global_11);
  return (id)cdSmartListSectionKeyToStorageKeyMap_mapping;
}

@end
