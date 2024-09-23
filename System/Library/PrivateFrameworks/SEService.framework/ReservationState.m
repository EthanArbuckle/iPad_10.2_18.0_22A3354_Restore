@implementation ReservationState

- (NSString)description
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))ReservationState.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))ReservationState.debugDescription.getter);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService16ReservationState *v5;

  v4 = a3;
  v5 = self;
  ReservationState.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService16ReservationState)initWithCoder:(id)a3
{
  return (_TtC9SEService16ReservationState *)ReservationState.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545C9FA0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545C9FA0 = a3;
}

- (_TtC9SEService16ReservationState)init
{
  _TtC9SEService16ReservationState *result;

  result = (_TtC9SEService16ReservationState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
