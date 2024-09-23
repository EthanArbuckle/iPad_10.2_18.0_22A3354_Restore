@implementation PFFairPlayMigrationController

- (PFFairPlayMigrationController)init
{
  objc_class *ObjectType;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  PFFairPlayMigrationController *v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaItemMetadataLoader()), sel_init);
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreDataKeyRequestStorage()), sel_init);
  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FairPlayInvalidationManager()), sel_init);
  type metadata accessor for CoreDataFairPlayEpisodeDataFetcher();
  v6 = swift_allocObject();
  v7 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureDownloadRenewalManager()), sel_init);
  v8 = (PFFairPlayMigrationController *)sub_1A933592C(v3, v4, v5, v6, v7, (char *)objc_allocWithZone(ObjectType));

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

+ (PFFairPlayMigrationController)sharedInstance
{
  if (qword_1ED2A4860 != -1)
    swift_once();
  return (PFFairPlayMigrationController *)(id)qword_1ED2A7A30;
}

- (void)migrateIfNecessaryWithCompletion:(id)a3
{
  sub_1A90C8544(self, (int)a2, a3, (uint64_t)&unk_1E54F2C90, (uint64_t)sub_1A92D58CC, (void (*)(uint64_t, uint64_t))FairPlayMigrationController.migrateIfNecessary(completion:));
}

- (void)rollbackIfNecessaryWithCompletion:(id)a3
{
  sub_1A90C8544(self, (int)a2, a3, (uint64_t)&unk_1E54F2C68, (uint64_t)sub_1A908C20C, (void (*)(uint64_t, uint64_t))FairPlayMigrationController.rollbackIfNecessary(completion:));
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayMigrationController_fairPlayEpisodeDataFetcher);

}

@end
