@implementation Predicate

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2489BDB7C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___Predicate_argument), *(_QWORD *)&self->id[OBJC_IVAR___Predicate_argument], self->id[OBJC_IVAR___Predicate_argument + 8]);
  sub_2489BDB94(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___Predicate_rawdata), *(_QWORD *)&self->id[OBJC_IVAR___Predicate_rawdata]);
  sub_2489C3298((uint64_t)self + OBJC_IVAR___Predicate_value, &qword_254464700);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (Predicate)init
{
  CoreRule.Predicate.init()();
}

@end
