@implementation AuthenticatorWrapper

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9PassKitUI20AuthenticatorWrapper *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI20AuthenticatorWrapper_authenticator);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  objc_msgSend(v4, sel_setDelegate_, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[AuthenticatorWrapper dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI20AuthenticatorWrapper__authenticatorModel;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE494348);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI20AuthenticatorWrapper_delegate);
}

- (_TtC9PassKitUI20AuthenticatorWrapper)init
{
  _TtC9PassKitUI20AuthenticatorWrapper *result;

  result = (_TtC9PassKitUI20AuthenticatorWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  id v4;
  _TtC9PassKitUI20AuthenticatorWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_19D74BBA0();

}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC9PassKitUI20AuthenticatorWrapper *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_19D74BD7C(a4, a5);

}

- (BOOL)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  return 1;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  _TtC9PassKitUI20AuthenticatorWrapper *v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = self;
  sub_19D74BE28(var0, var1);

}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  id v6;
  _TtC9PassKitUI20AuthenticatorWrapper *v7;

  v6 = a3;
  v7 = self;
  sub_19D74C220(a4);

}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  void *v8;
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  id v12;
  _TtC9PassKitUI20AuthenticatorWrapper *v13;

  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (!v9)
      goto LABEL_5;
    goto LABEL_3;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_19D74CA84;
  if (v10)
  {
LABEL_3:
    *(_QWORD *)(swift_allocObject() + 16) = v10;
    v10 = sub_19D74CA60;
  }
LABEL_5:
  v12 = a3;
  v13 = self;
  sub_19D74C480(a3, (uint64_t)v8, v11);
  sub_19D1A9F60((uint64_t)v10);
  sub_19D1A9F60((uint64_t)v8);

}

- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  void *v8;
  void (*v9)(uint64_t, unint64_t);
  void (*v10)(uint64_t, unint64_t);
  uint64_t v11;
  id v12;
  _TtC9PassKitUI20AuthenticatorWrapper *v13;

  v8 = _Block_copy(a4);
  v9 = (void (*)(uint64_t, unint64_t))_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (!v9)
      goto LABEL_5;
    goto LABEL_3;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_19D23FF24;
  if (v10)
  {
LABEL_3:
    *(_QWORD *)(swift_allocObject() + 16) = v10;
    v10 = sub_19D74C9F4;
  }
LABEL_5:
  v12 = a3;
  v13 = self;
  sub_19D74C6E0(a3, (uint64_t)v8, v11);
  sub_19D1A9F60((uint64_t)v10);
  sub_19D1A9F60((uint64_t)v8);

}

- (void)dismissPasscodeViewController
{
  _TtC9PassKitUI20AuthenticatorWrapper *v2;

  v2 = self;
  sub_19D74B7B0("AuthenticatorWrapper - dismissPasscodeViewController");

}

- (void)dismissPassphraseViewController
{
  _TtC9PassKitUI20AuthenticatorWrapper *v2;

  v2 = self;
  sub_19D74B7B0("AuthenticatorWrapper - dismissPassphraseViewController");

}

@end
