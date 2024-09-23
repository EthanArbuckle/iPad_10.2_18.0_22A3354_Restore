@implementation TTRAddTasksIntentHandler

- (void)resolveTargetTaskListForAddTasks:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100023108);
}

- (void)resolveTaskTitlesForAddTasks:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10003DC38, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10001EDB0(v8, (uint64_t)sub_100028258, v7);

  swift_release(v7);
}

- (void)resolveSpatialEventTriggerForAddTasks:(id)a3 withCompletion:(id)a4
{
  sub_10001FDB8(self, (int)a2, a3, a4, (void (*)(id, void *))sub_1000239B4);
}

- (void)resolveTemporalEventTriggerForAddTasks:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100028A20);
}

- (void)resolveTaskReferenceForAddTasks:(id)a3 withCompletion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10002494C);
}

- (void)resolveTargetTaskListMembersForAddTasks:(id)a3 withCompletion:(id)a4
{
  sub_10001FDB8(self, (int)a2, a3, a4, (void (*)(id, void *))sub_100024E1C);
}

- (void)resolveContactEventTriggerForAddTasks:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000307C0);
}

- (void)handleAddTasks:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10002526C);
}

- (_TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler)init
{
  _TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler *result;

  result = (_TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsExtension.TTRAddTasksIntentHandler", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_queue));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider));
}

@end
