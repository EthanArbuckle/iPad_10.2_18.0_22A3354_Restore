@implementation ConfigurationIntentHandler

- (void)handleConfiguration:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsExtension26ConfigurationIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10001C434(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)provideListOptionsForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC25RemindersIntentsExtension26ConfigurationIntentHandler *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject(&unk_10003D9E0, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_100018B14(v12, v9, (uint64_t)a4, (uint64_t)sub_10001C760, v11);

  swift_release(v11);
  swift_bridgeObjectRelease(a4);
}

- (void)provideListOptionsCollectionForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC25RemindersIntentsExtension26ConfigurationIntentHandler *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject(&unk_10003D850, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_100018B14(v12, v9, (uint64_t)a4, (uint64_t)sub_10001BFC4, v11);

  swift_release(v11);
  swift_bridgeObjectRelease(a4);
}

- (id)defaultListForConfiguration:(id)a3
{
  id v4;
  _TtC25RemindersIntentsExtension26ConfigurationIntentHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10001B3DC(v4);

  return v6;
}

- (_TtC25RemindersIntentsExtension26ConfigurationIntentHandler)init
{
  _TtC25RemindersIntentsExtension26ConfigurationIntentHandler *result;

  result = (_TtC25RemindersIntentsExtension26ConfigurationIntentHandler *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsExtension.ConfigurationIntentHandler", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_queue));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource));
}

@end
