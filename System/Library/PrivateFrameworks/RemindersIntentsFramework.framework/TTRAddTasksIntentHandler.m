@implementation TTRAddTasksIntentHandler

- (void)resolveTargetTaskListForAddTasks:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450DE4A4);
}

- (void)resolveTaskTitlesForAddTasks:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2450DA6B8(v8, (uint64_t)sub_2450E3740, v7);

  swift_release();
}

- (void)resolveSpatialEventTriggerForAddTasks:(id)a3 withCompletion:(id)a4
{
  sub_2450DB6C0(self, (int)a2, a3, a4, (void (*)(id, void *))sub_2450DED50);
}

- (void)resolveTemporalEventTriggerForAddTasks:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450ECEB8);
}

- (void)resolveTaskReferenceForAddTasks:(id)a3 withCompletion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450DFCE8);
}

- (void)resolveTargetTaskListMembersForAddTasks:(id)a3 withCompletion:(id)a4
{
  sub_2450DB6C0(self, (int)a2, a3, a4, (void (*)(id, void *))sub_2450E01B8);
}

- (void)resolveContactEventTriggerForAddTasks:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450D69FC);
}

- (void)handleAddTasks:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450E0608);
}

- (_TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler)init
{
  _TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler *result;

  result = (_TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider);
}

@end
