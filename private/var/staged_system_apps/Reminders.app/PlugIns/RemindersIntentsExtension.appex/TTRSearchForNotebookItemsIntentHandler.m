@implementation TTRSearchForNotebookItemsIntentHandler

- (void)resolveItemTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100005E70);
}

- (void)resolveLocationForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  _TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v12 = a3;
  v7 = self;
  v8 = objc_msgSend(v12, "location");
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(INPlacemarkResolutionResult), "successWithResolvedPlacemark:", v8);
    v6[2](v6, v10);

  }
  else
  {
    v11 = sub_10000A848(0, &qword_100042328, INPlacemarkResolutionResult_ptr);
    v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(v11), "notRequired");
    v6[2](v6, v10);
  }

  _Block_release(v6);
}

- (void)resolveLocationSearchTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  void *v7;
  id v8;
  id v9;
  _TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler *v10;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = (void *)objc_opt_self(INLocationSearchTypeResolutionResult);
  v8 = a3;
  v10 = self;
  v9 = objc_msgSend(v7, "successWithResolvedLocationSearchType:", objc_msgSend(v8, "locationSearchType"));
  v6[2](v6, v9);

  _Block_release(v6);
}

- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4
{
  sub_10000589C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000062A4);
}

- (_TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler)init
{
  _TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler *result;

  result = (_TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsExtension.TTRSearchForNotebookItemsIntentHandler", 64, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_queue));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource));
  sub_10000A880((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider));
}

@end
