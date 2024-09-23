@implementation TTRSnoozeTasksIntentHandler

- (void)resolveTasksForSnoozeTasks:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2450F3504(v8, (uint64_t)sub_2450F67E0, v7);

  swift_release();
}

- (void)resolveNextTriggerTimeForSnoozeTasks:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2450F52E8(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleSnoozeTasks:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2450F5B5C(v7, (char *)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler)init
{
  _TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler *result;

  result = (_TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_queue));
  swift_release();
}

@end
