@implementation PFDownloadConsistency

- (void)beginEnforcementWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  PFDownloadConsistency *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A9115814;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1A906EA20((uint64_t)v7, v6);
  sub_1A9085818((uint64_t)v7);

}

- (void)endEnforcement
{
  uint64_t v3;
  PFDownloadConsistency *v4;
  PFDownloadConsistency *v5;

  v3 = OBJC_IVAR___PFDownloadConsistency_listener;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDownloadConsistency_listener))
  {
    v4 = self;
    swift_retain();
    sub_1A93F7938();
    swift_release();
  }
  else
  {
    v5 = self;
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;

  swift_release();
}

- (PFDownloadConsistency)init
{
  PFDownloadConsistency *result;

  result = (PFDownloadConsistency *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_identifier);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_resolutionStrategy);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_effectApplicator);
  sub_1A90CF508((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_environment);
}

@end
