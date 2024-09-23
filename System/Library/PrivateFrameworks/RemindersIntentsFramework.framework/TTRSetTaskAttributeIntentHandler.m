@implementation TTRSetTaskAttributeIntentHandler

- (void)resolveTargetTaskForSetTaskAttribute:(id)a3 withCompletion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450E4754);
}

- (void)resolveTaskTitleForSetTaskAttribute:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2450E4CF0(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)resolveContactEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450D753C);
}

- (void)resolveTemporalEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450ECED4);
}

- (void)handleSetTaskAttribute:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450E519C);
}

- (_TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler)init
{
  _TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler *result;

  result = (_TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider);
}

@end
