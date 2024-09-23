@implementation REMCDAccountV2023MinorEMigratingToZREMCDBASELIST

- (id)accountTypeHost
{
  REMCDAccountV2023MinorEMigratingToZREMCDBASELIST *v2;
  id v3;

  v2 = self;
  v3 = objc_msgSend(objc_allocWithZone((Class)REMAccountTypeHost), "initWithType:", (int)-[REMCDAccountV2023MinorEMigratingToZREMCDBASELIST type](v2, "type"));

  return v3;
}

- (REMCDAccountV2023MinorEMigratingToZREMCDBASELIST)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  uint64_t v4;

  return (REMCDAccountV2023MinorEMigratingToZREMCDBASELIST *)sub_1003C3F18(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, (uint64_t (*)(uint64_t))type metadata accessor for REMCDAccountV2023MinorEMigratingToZREMCDBASELIST);
}

@end
