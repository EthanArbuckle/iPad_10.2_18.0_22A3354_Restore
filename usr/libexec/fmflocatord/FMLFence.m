@implementation FMLFence

- (NSString)identifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->identifier[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (double)latitude
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude);
}

- (double)longitude
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude);
}

- (double)radius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_radius);
}

- (FenceScheduleProtocol)schedule
{
  return (FenceScheduleProtocol *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule), a2);
}

+ (BOOL)isAllowedAtLocation:(CLLocationCoordinate2D)a3
{
  return static Fence.isAllowed(at:)(a1, a2, (__n128)a3, *(__n128 *)&a3.longitude) & 1;
}

- (_TtC11fmflocatord8FMLFence)init
{
  _TtC11fmflocatord8FMLFence *result;

  result = (_TtC11fmflocatord8FMLFence *)_swift_stdlib_reportUnimplementedInitializer("fmflocatord.FMLFence", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule));
}

@end
