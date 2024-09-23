@implementation RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders

- (_TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders *v11;
  uint64_t v12;
  __n128 v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_10001A630((uint64_t *)&unk_1008380D0);
  __chkstk_darwin(v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100837488 != -1)
    swift_once(&qword_100837488, sub_10041257C);
  v7 = type metadata accessor for Date(0);
  v8 = sub_10001AAA8(v7, (uint64_t)qword_1008497D8);
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v6, v8, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v7);
  v10 = (char *)objc_allocWithZone(ObjectType);
  *(_QWORD *)&v10[OBJC_IVAR____TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders_maxReminderCountToMigrate] = 100;
  sub_1000CDA2C((uint64_t)v6, (uint64_t)&v10[OBJC_IVAR____TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders_lastModifiedAfterDate]);
  v15.receiver = v10;
  v15.super_class = ObjectType;
  v11 = -[RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders init](&v15, "init");
  sub_10000882C((uint64_t)v6, (uint64_t *)&unk_1008380D0);
  v12 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v12, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34), v13);
  return v11;
}

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  _TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders.migrateStoreIfNeeded(_:metadata:)((NSPersistentStore)v6, (NSMutableDictionary)v7);

}

- (void).cxx_destruct
{
  sub_10000882C((uint64_t)self+ OBJC_IVAR____TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders_lastModifiedAfterDate, (uint64_t *)&unk_1008380D0);
}

@end
