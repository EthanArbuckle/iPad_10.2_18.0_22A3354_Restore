@implementation PKExtractedUIFlowItem

- (void)preflightWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  PKExtractedUIFlowItem *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  ExtractedUIFlowItem.preflight(completion:)((uint64_t)sub_19D2A2A84, v5);

  swift_release();
}

- (id)viewControllerWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  PKExtractedUIFlowItem *v6;
  void *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = (void *)ExtractedUIFlowItem.viewController(completion:)((uint64_t)sub_19D266A30, v5);

  swift_release();
  return v7;
}

- (PKExtractedUIFlowItem)init
{
  PKExtractedUIFlowItem *result;

  result = (PKExtractedUIFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PKExtractedUIFlowItem_completion));
}

@end
