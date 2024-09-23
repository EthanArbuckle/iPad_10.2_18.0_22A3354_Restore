@implementation ReadThisAppIntentConnectionDelegate

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2471CD648();

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2471CD6B8();

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2471CD728();

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2471CD798();

}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_2471CDA54();

}

- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNActionExecutor *v8;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_2471CE184((uint64_t)&unk_257679BA0, (uint64_t)v7);
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6;
  id v7;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2471CE260();

  return 0;
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2471CE3B4();

}

- (_TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate)init
{
  sub_2471CE5B4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_aceService);
  v3 = (char *)self + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679B88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
