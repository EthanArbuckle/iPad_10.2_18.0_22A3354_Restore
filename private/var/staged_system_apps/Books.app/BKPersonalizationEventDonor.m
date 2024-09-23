@implementation BKPersonalizationEventDonor

- (BKPersonalizationEventDonor)init
{
  void *v3;
  id v4;
  BKPersonalizationEventDonor *v5;
  uint64_t ObjectType;

  type metadata accessor for RCDataContainer(0);
  v3 = (void *)static RCDataContainer.default.getter();
  v4 = objc_allocWithZone((Class)type metadata accessor for PersonalizationEventDonor());
  v5 = (BKPersonalizationEventDonor *)sub_10002444C(0xD000000000000021, 0x80000001007C8FD0, v3);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 144, 7);
  return v5;
}

- (void)setupWithLibraryManager:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  BKPersonalizationEventDonor *v7;
  _BYTE v8[24];
  _QWORD v9[5];

  v9[3] = sub_100009E04(0, (unint64_t *)&qword_1009DDF70, BKLibraryManager_ptr);
  v9[4] = &off_10091B9B0;
  v9[0] = a3;
  v5 = &self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_libraryAssetProvider];
  swift_beginAccess(&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_libraryAssetProvider], v8, 33, 0);
  v6 = a3;
  v7 = self;
  sub_10006973C((uint64_t)v9, (uint64_t)v5);
  swift_endAccess(v8);

}

- (void)configurationDidChange:(id)a3
{
  sub_1000369B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))PersonalizationEventDonor.configurationDidChange(_:));
}

- (BKPersonalizationEventDonor)initWithType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  BKPersonalizationEventDonor *v9;
  uint64_t ObjectType;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  type metadata accessor for RCDataContainer(0);
  v7 = (void *)static RCDataContainer.default.getter();
  v8 = objc_allocWithZone((Class)type metadata accessor for PersonalizationEventDonor());
  v9 = (BKPersonalizationEventDonor *)sub_10002444C(v4, v6, v7);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 144, 7);
  return v9;
}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  BKPersonalizationEventDonor *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_100422E7C(v11, v9, (uint64_t)a4, v12, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(a4);
}

- (void).cxx_destruct
{
  sub_100010960((uint64_t)&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_libraryAssetProvider], &qword_1009E29F0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_cachedEnagagementPropertyValues]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->libraryAssetProvider[OBJC_IVAR___BKPersonalizationEventDonor_lastCreatedPropertyTimestamp]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_config]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_booksPersonalizationSectionIDs]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_sectionLinks]);
}

- (void)finishedBook:(id)a3
{
  sub_1000369B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))PersonalizationEventDonor.finishedBook(_:));
}

@end
