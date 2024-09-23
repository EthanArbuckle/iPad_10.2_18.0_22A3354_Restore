@implementation TTRSnoozeTasksIntentHandler

- (void)resolveTasksForSnoozeTasks:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10003D6E8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10001411C(v8, (uint64_t)sub_100017178, v7);

  swift_release(v7);
}

- (void)resolveNextTriggerTimeForSnoozeTasks:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100015C80(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleSnoozeTasks:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1000164F4(v7, (char *)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler)init
{
  _TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler *result;

  result = (_TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsExtension.TTRSnoozeTasksIntentHandler", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_queue));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_dataSource));
}

@end
