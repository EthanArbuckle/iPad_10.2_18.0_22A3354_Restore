@implementation TTRSearchForNotebookItemsIntentHandler

- (void)resolveItemTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450EED88);
}

- (void)resolveLocationForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  _TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v11 = a3;
  v7 = self;
  v8 = objc_msgSend(v11, sel_location);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedPlacemark_, v8);
    v6[2](v6, v10);

  }
  else
  {
    sub_2450D8184(0, &qword_25744BD58);
    v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
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
  _TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler *v10;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = (void *)objc_opt_self();
  v8 = a3;
  v10 = self;
  v9 = objc_msgSend(v7, sel_successWithResolvedLocationSearchType_, objc_msgSend(v8, sel_locationSearchType));
  v6[2](v6, v9);

  _Block_release(v6);
}

- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4
{
  sub_2450DDA5C(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2450EF1BC);
}

- (_TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler)init
{
  _TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler *result;

  result = (_TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider);
}

@end
