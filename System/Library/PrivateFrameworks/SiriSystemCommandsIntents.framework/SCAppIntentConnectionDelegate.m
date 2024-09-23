@implementation SCAppIntentConnectionDelegate

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_229223C10((uint64_t)v8, v7);

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_229223C80((uint64_t)v8, v7);

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_229223CF0((uint64_t)v8, v7);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_229223D60((uint64_t)v8, v7);

}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_229224028((uint64_t)v11, a4, (uint64_t)a5);

}

- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  void *v6;
  _QWORD *v7;
  LNActionExecutor *v8;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_2292247D8((uint64_t)&unk_255A3D228, (uint64_t)v7);
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6;
  id v7;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2292248B4();

  return 0;
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_229224A08((uint64_t)v8, v7);

}

- (_TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate)init
{
  sub_229224C10();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate_aceService);
  v3 = (char *)self + OBJC_IVAR____TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3D210);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
