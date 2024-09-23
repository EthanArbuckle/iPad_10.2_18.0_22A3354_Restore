@implementation TTRIntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4;
  _TtC25RemindersIntentsExtension16TTRIntentHandler *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v10[3];
  uint64_t v11;

  v4 = a3;
  v5 = self;
  TTRIntentHandler.handler(for:)(v4, v10);

  v6 = v11;
  v7 = sub_10000A4BC(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  sub_10000A880(v10);
  return v8;
}

- (_TtC25RemindersIntentsExtension16TTRIntentHandler)init
{
  return (_TtC25RemindersIntentsExtension16TTRIntentHandler *)TTRIntentHandler.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___addTasksHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___snoozeTasksHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler));
}

@end
