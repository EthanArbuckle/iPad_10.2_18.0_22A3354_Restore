@implementation REMSmartList_Codable

- (REMSmartList_Codable)initWithStore:(id)a3 storage:(id)a4
{
  return (REMSmartList_Codable *)sub_1A4642AB8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_initWithStore_storage_);
}

- (REMSmartList_Codable)initWithStore:(id)a3 account:(id)a4 parentList:(id)a5 storage:(id)a6
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  return -[REMSmartList initWithStore:account:parentList:storage:](&v11, sel_initWithStore_account_parentList_storage_, a3, a4, a5, a6);
}

@end
