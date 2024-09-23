@implementation Reservation

- (BOOL)isEqual:(id)a3
{
  _TtC9SEService11Reservation *v4;
  _TtC9SEService11Reservation *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_20A0E0A34();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = Reservation.isEqual(_:)((uint64_t)v8);

  sub_20A0801F8((uint64_t)v8, &qword_2545C9378);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService11Reservation *v5;

  v4 = a3;
  v5 = self;
  Reservation.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService11Reservation)initWithCoder:(id)a3
{
  id v3;
  _TtC9SEService11Reservation *v4;

  v3 = a3;
  v4 = (_TtC9SEService11Reservation *)sub_20A07F8DC();

  return v4;
}

- (NSString)description
{
  _TtC9SEService11Reservation *v2;
  void *v3;

  v2 = self;
  Reservation.description.getter();

  v3 = (void *)sub_20A0E0800();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545C9360;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545C9360 = a3;
}

- (_TtC9SEService11Reservation)init
{
  _TtC9SEService11Reservation *result;

  result = (_TtC9SEService11Reservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9SEService11Reservation_uuid;
  v4 = sub_20A0E06D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_20A075F1C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11Reservation_type), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC9SEService11Reservation_type]);
  sub_20A07F898(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11Reservation_metadata), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC9SEService11Reservation_metadata]);
}

@end
