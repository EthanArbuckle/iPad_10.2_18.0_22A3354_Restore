@implementation RDDebounceableCKDatabaseNotification

- (int64_t)databaseScope
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope);
}

- (void)setDatabaseScope:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope) = (Class)a3;
}

- (NSString)subscriptionOwnerUserRecordName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->databaseScope[OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setSubscriptionOwnerUserRecordName:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName);
  v6 = *(_QWORD *)&self->databaseScope[OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC7remindd36RDDebounceableCKDatabaseNotification)initWithDatabaseScope:(int64_t)a3 subscriptionOwnerUserRecordName:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope) = (Class)a3;
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName);
  *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RDDebounceableCKDatabaseNotification();
  return -[RDDebounceableCKDatabaseNotification init](&v10, "init");
}

- (BOOL)isEqual:(id)a3
{
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v5;
  uint64_t v6;
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1000E5F84((uint64_t)v10);

  sub_10000882C((uint64_t)v10, (uint64_t *)&unk_10083D5B0);
  return v8 & 1;
}

- (int64_t)hash
{
  uint64_t v2;
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope);
  v3 = self;
  v4 = Int.hashValue.getter(v2);
  v5 = *(uint64_t *)((char *)&v3->super.isa
                  + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName);
  v6 = *(_QWORD *)&v3->databaseScope[OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName];
  swift_bridgeObjectRetain(v6);
  v7 = String.hashValue.getter(v5, v6);

  swift_bridgeObjectRelease(v6);
  return v7 ^ v4;
}

- (NSString)description
{
  _TtC7remindd36RDDebounceableCKDatabaseNotification *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1000E61AC();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC7remindd36RDDebounceableCKDatabaseNotification)init
{
  _TtC7remindd36RDDebounceableCKDatabaseNotification *result;

  result = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDDebounceableCKDatabaseNotification", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->databaseScope[OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName]);
}

@end
