@implementation ConfigurationIntentHandler

- (void)handleConfiguration:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC25RemindersIntentsFramework26ConfigurationIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2450FE3AC(v7, (uint64_t)v6);
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
  _TtC25RemindersIntentsFramework26ConfigurationIntentHandler *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_245103988();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_2450FA730(v12, v9, (uint64_t)a4, (uint64_t)sub_2450FE6D8, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)provideListOptionsCollectionForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC25RemindersIntentsFramework26ConfigurationIntentHandler *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_245103988();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_2450FA730(v12, v9, (uint64_t)a4, (uint64_t)sub_2450FDC14, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (id)defaultListForConfiguration:(id)a3
{
  id v4;
  _TtC25RemindersIntentsFramework26ConfigurationIntentHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2450FCFF8(v4);

  return v6;
}

- (_TtC25RemindersIntentsFramework26ConfigurationIntentHandler)init
{
  _TtC25RemindersIntentsFramework26ConfigurationIntentHandler *result;

  result = (_TtC25RemindersIntentsFramework26ConfigurationIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource);
}

@end
