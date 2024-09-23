@implementation CHReachableDestination

- (NSString)destination
{
  return (NSString *)sub_1004FAB94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHReachableDestination_destination);
}

- (NSString)preferredServiceIdentifier
{
  return (NSString *)sub_1004FAB94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHReachableDestination_preferredServiceIdentifier);
}

- (NSArray)additionalServiceIdentifiers
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHReachableDestination_additionalServiceIdentifiers);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (CHReachableDestination)init
{
  CHReachableDestination *result;

  result = (CHReachableDestination *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ReachableDestination", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->destination[OBJC_IVAR___CHReachableDestination_destination]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->destination[OBJC_IVAR___CHReachableDestination_preferredServiceIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHReachableDestination_additionalServiceIdentifiers));
}

@end
