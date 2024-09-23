@implementation ChangeTrackingAccountProvider

- (NSString)accountID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_accountID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setAccountID:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountID);
  v6 = *(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountID];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (REMObjectID)rem_accountObjectID
{
  return (REMObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_rem_accountObjectID));
}

- (void)setRem_accountObjectID:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_rem_accountObjectID);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_rem_accountObjectID) = (Class)a3;
  v3 = a3;

}

- (NSString)accountDescription
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_accountDescription];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_accountDescription]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccountDescription:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountDescription);
  v7 = *(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountDescription];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (id)loggingDescription
{
  _TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider *v2;
  NSString v3;

  v2 = self;
  sub_10017ED58();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountID);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_rem_accountObjectID) = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountDescription);
  *v5 = 0;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[ChangeTrackingAccountProvider init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_accountID]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_rem_accountObjectID));
  swift_bridgeObjectRelease(*(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_accountDescription]);
}

- (_TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider)init
{
  _TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider *result;

  result = (_TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider *)_swift_stdlib_reportUnimplementedInitializer("remindd.ChangeTrackingAccountProvider", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
