@implementation _UISimpleTimedInhibitor

- (_UISimpleTimedInhibitor)initWithClockType:(unint64_t)a3 maxAttempts:(int64_t)a4 inPeriod:(double)a5
{
  return (_UISimpleTimedInhibitor *)sub_1857216BC((id)a3, a4);
}

- (BOOL)attempt
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _UISimpleTimedInhibitor *v7;

  v3 = (uint64_t)self + OBJC_IVAR____UISimpleTimedInhibitor__inhibitor;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____UISimpleTimedInhibitor__inhibitor);
}

- (_UISimpleTimedInhibitor)init
{
  _UISimpleTimedInhibitor *result;

  result = (_UISimpleTimedInhibitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
