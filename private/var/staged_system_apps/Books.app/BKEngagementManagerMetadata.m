@implementation BKEngagementManagerMetadata

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts));
  sub_100010D2C((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp);
  swift_errorRelease(*(Class *)((char *)&self->super.isa
                              + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitError));
  sub_100010D2C((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp);
  sub_100010D2C((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp);
  swift_errorRelease(*(Class *)((char *)&self->super.isa
                              + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitError));
  sub_100010D2C((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp);
}

- (BKEngagementManagerMetadata)init
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t, uint64_t);
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts) = (Class)_swiftEmptyDictionarySingleton;
  v3 = (char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp;
  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitError) = 0;
  v5((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp, 1, 1, v4);
  v5((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitError) = 0;
  v5((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp, 1, 1, v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EngagementManagerMetadata(0);
  return -[BKEngagementManagerMetadata init](&v7, "init");
}

- (NSDictionary)propertyCounts
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts);
  swift_beginAccess((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts, v6, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setPropertyCounts:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7[24];

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &type metadata for Int, &protocol witness table for String);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts);
  swift_beginAccess(v5, v7, 1, 0);
  v6 = *v5;
  *v5 = v4;
  swift_bridgeObjectRelease(v6);
}

- (NSDate)lastSyncToCloudKitSuccessTimestamp
{
  return (NSDate *)sub_1001FE2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp);
}

- (void)setLastSyncToCloudKitSuccessTimestamp:(id)a3
{
  sub_1001FE390(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp);
}

- (NSError)lastSyncToCloudKitError
{
  return (NSError *)sub_100637960((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitError);
}

- (void)setLastSyncToCloudKitError:(id)a3
{
  sub_100637A30((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitError);
}

- (NSDate)lastSyncToCloudKitErrorTimestamp
{
  return (NSDate *)sub_1001FE2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp);
}

- (void)setLastSyncToCloudKitErrorTimestamp:(id)a3
{
  sub_1001FE390(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp);
}

- (NSDate)lastSyncFromCloudKitSuccessTimestamp
{
  return (NSDate *)sub_1001FE2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp);
}

- (void)setLastSyncFromCloudKitSuccessTimestamp:(id)a3
{
  sub_1001FE390(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp);
}

- (NSError)lastSyncFromCloudKitError
{
  return (NSError *)sub_100637960((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitError);
}

- (void)setLastSyncFromCloudKitError:(id)a3
{
  sub_100637A30((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitError);
}

- (NSDate)lastSyncFromCloudKitErrorTimestamp
{
  return (NSDate *)sub_1001FE2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp);
}

- (void)setLastSyncFromCloudKitErrorTimestamp:(id)a3
{
  sub_1001FE390(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp);
}

@end
