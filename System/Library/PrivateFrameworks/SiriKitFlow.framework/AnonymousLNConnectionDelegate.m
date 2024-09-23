@implementation AnonymousLNConnectionDelegate

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC11SiriKitFlow29AnonymousLNConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C2ACA758();

}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC11SiriKitFlow29AnonymousLNConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C2ACA99C();

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC11SiriKitFlow29AnonymousLNConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C2ACAC78();

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC11SiriKitFlow29AnonymousLNConnectionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C2ACAF58();

}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC11SiriKitFlow29AnonymousLNConnectionDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1C2ACB168();

}

- (_TtC11SiriKitFlow29AnonymousLNConnectionDelegate)init
{
  sub_1C2ACB560();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11SiriKitFlow29AnonymousLNConnectionDelegate_continuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF794BC0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
