@implementation TTRSetTaskAttributeIntentHandler

- (void)resolveTargetTaskForSetTaskAttribute:(id)a3 withCompletion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10000B860);
}

- (void)resolveTaskTitleForSetTaskAttribute:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10000BDFC(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)resolveContactEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10002FC10);
}

- (void)resolveTemporalEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100028A04);
}

- (void)handleSetTaskAttribute:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10000C2A8);
}

- (_TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler)init
{
  _TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler *result;

  result = (_TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsExtension.TTRSetTaskAttributeIntentHandler", 58, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_queue));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider));
}

@end
