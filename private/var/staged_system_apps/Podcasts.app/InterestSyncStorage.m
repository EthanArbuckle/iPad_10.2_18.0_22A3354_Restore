@implementation InterestSyncStorage

- (_TtC8Podcasts19InterestSyncStorage)init
{
  id v3;
  id v4;
  objc_class *v5;
  char *v6;
  _TtC8Podcasts19InterestSyncStorage *v7;
  uint64_t v8;
  uint64_t ObjectType;
  objc_super v11;

  v3 = objc_msgSend((id)objc_opt_self(MTDB), "sharedInstance");
  v4 = objc_msgSend(v3, "importContext");

  v5 = (objc_class *)type metadata accessor for InterestSyncStorage();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC8Podcasts19InterestSyncStorage_importContext] = v4;
  v11.receiver = v6;
  v11.super_class = v5;
  v7 = -[InterestSyncStorage init](&v11, "init");
  ObjectType = swift_getObjectType(self, v8);
  swift_deallocPartialClassInstance(self, ObjectType, 16, 7);
  return v7;
}

- (void).cxx_destruct
{

}

+ (void)resetInterestSync
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = type metadata accessor for SyncKeysRepository(0);
  v3 = (void *)static SyncKeysRepository.shared.getter(v2);
  SyncKeysRepository.interestLastSyncTimestamp.setter(0, 1);

  v5 = (void *)static SyncKeysRepository.shared.getter(v4);
  SyncKeysRepository.interestSyncVersion.setter(0, 0);

  v7 = (id)static SyncKeysRepository.shared.getter(v6);
  SyncKeysRepository.isInterestSyncDirty.setter(1);

}

@end
