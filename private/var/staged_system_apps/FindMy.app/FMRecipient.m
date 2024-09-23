@implementation FMRecipient

- (id)copyWithZone:(void *)a3
{
  id v4;
  _TtC6FindMy11FMRecipient *v5;
  id v6;

  v4 = objc_allocWithZone((Class)type metadata accessor for FMRecipient());
  v5 = self;
  v6 = sub_100187C18((uint64_t)v5);

  return v6;
}

- (int64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  _TtC6FindMy11FMRecipient *v4;
  int64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy11FMRecipient_handle);
  v3 = *(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_handle];
  v4 = self;
  swift_bridgeObjectRetain(v3);
  v5 = String.hashValue.getter(v2, v3);

  swift_bridgeObjectRelease(v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC6FindMy11FMRecipient *v5;
  uint64_t v6;
  _TtC6FindMy11FMRecipient *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_10018513C((uint64_t)v10);

  sub_10005D03C((uint64_t)v10);
  return v8 & 1;
}

- (NSString)description
{
  _TtC6FindMy11FMRecipient *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100186448();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC6FindMy11FMRecipient)init
{
  _TtC6FindMy11FMRecipient *result;

  result = (_TtC6FindMy11FMRecipient *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMRecipient", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_handle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_label]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_givenName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_familyName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_nickname]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->handle[OBJC_IVAR____TtC6FindMy11FMRecipient_fullName]);

}

@end
