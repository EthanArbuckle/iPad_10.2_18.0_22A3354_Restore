@implementation JSAAccountController

- (void)addObserver:(id)a3
{
  sub_463A0(self, (uint64_t)a2, (uint64_t)a3, AccountController.add(observer:));
}

- (void)removeObserver:(id)a3
{
  sub_463A0(self, (uint64_t)a2, (uint64_t)a3, AccountController.remove(observer:));
}

- (void)signInEnablingAccountCreation:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  JSAAccountController *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_A10D8, 40, 7);
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_A1100, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_B8C70;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_A1128, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_B8C78;
  v14[5] = v13;
  v15 = self;
  v16 = sub_4CD0C((uint64_t)v9, (uint64_t)&unk_B8C80, (uint64_t)v14);
  swift_release(v16);
}

- (void)presentGiftViewControllerForAdamID:(NSString *)a3 options:(NSDictionary *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSDictionary *v18;
  JSAAccountController *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_A1060, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_A1088, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_B8C50;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_A10B0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_B8C58;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_4CD0C((uint64_t)v11, (uint64_t)&unk_B8C60, (uint64_t)v16);
  swift_release(v20);
}

- (void)presentRedeemViewControllerForRedemptionCode:(NSString *)a3 options:(NSDictionary *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSDictionary *v18;
  JSAAccountController *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_A0FC0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_A0FE8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_B8C10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_A1010, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_B8C20;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_4CD0C((uint64_t)v11, (uint64_t)&unk_B8C30, (uint64_t)v16);
  swift_release(v20);
}

- (JSAAccountController)init
{
  return (JSAAccountController *)AccountController.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAAccountController_observers));

}

+ (id)sharedController
{
  if (qword_B8100 != -1)
    swift_once(&qword_B8100, sub_45F1C);
  return (id)qword_B8AA0;
}

- (void)openIForgot
{
  sub_4DB3C((uint64_t)&unk_A1428, (uint64_t)&unk_A1450, (uint64_t)&unk_B8D40, (uint64_t)&unk_B8D48);
}

- (void)openTermsAndConditions
{
  sub_4DB3C((uint64_t)&unk_A1380, (uint64_t)&unk_A13A8, (uint64_t)&unk_B8D00, (uint64_t)&unk_B8D10);
}

- (void)presentGiftViewControllerForAdamID:(id)a3 :(id)a4 :(id)a5
{
  id v5;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  JSAAccountController *v12;
  Swift::String_optional v13;
  Swift::OpaquePointer_optional v14;

  v5 = a5;
  if (!a3)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a4;
  v12 = self;
  v13.value._countAndFlagsBits = v8;
  v13.value._object = v10;
  v14.value._rawValue = v5;
  AccountController.presentGiftViewController(for:_:_:)(v13, (JSValue)v11, v14);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
}

- (void)presentRedeemViewControllerForRedemptionCode:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  JSAAccountController *v16;
  id v17;
  JSAAccountController *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_A0F98, 64, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a3;
  v13[5] = self;
  v13[6] = a4;
  v13[7] = a5;
  swift_bridgeObjectRetain(a4);
  v14 = a3;
  v15 = a5;
  v16 = self;
  v17 = v14;
  v18 = v16;
  v19 = v15;
  v20 = sub_2EC38((uint64_t)v11, (uint64_t)&unk_B8C00, (uint64_t)v13);

  swift_bridgeObjectRelease(a4);
  swift_release(v20);
}

- (void)viewAppleID:(id)a3 :(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  JSAAccountController *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_A0F70, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a4;
  v11[5] = a3;
  swift_bridgeObjectRetain(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_2EC38((uint64_t)v9, (uint64_t)&unk_B8BF8, (uint64_t)v11);

  swift_bridgeObjectRelease(a4);
  swift_release(v14);
}

- (void)signIn:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  JSAAccountController *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  JSAAccountController *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone((Class)AMSAuthenticateOptions);
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, "init");
  objc_msgSend(v11, "setEnableAccountCreation:", 1);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_A0F48, 56, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = v11;
  v13[6] = v9;
  v14 = v9;
  v15 = v10;
  v16 = sub_2EC38((uint64_t)v7, (uint64_t)&unk_B8BF0, (uint64_t)v13);

  swift_release(v16);
}

- (void)signOut:(id)a3
{
  id v4;
  JSAAccountController *v5;

  v4 = a3;
  v5 = self;
  AccountController.signOut(_:)((JSValue)v4);

}

- (void)reauthenticateSignIn:(id)a3 :(id)a4
{
  void *v6;
  id v7;
  JSAAccountController *v8;
  JSValue v9;
  Swift::OpaquePointer_optional v10;

  if (a3)
    v6 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  v7 = a4;
  v8 = self;
  v10.value._rawValue = v6;
  v10.is_nil = (char)v7;
  AccountController.reauthenticateSignIn(with:_:)(v10, v9);

  swift_bridgeObjectRelease(v6);
}

- (void)showAccountViewControllerWithUrl:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  JSAAccountController *v12;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  if (a5)
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v11 = a4;
  v12 = self;
  _s5JSApp17AccountControllerC04showb4ViewC04with__ySS_So7JSValueCSDys11AnyHashableVypGSgtF_0(v8, v10, v11, (uint64_t)a5);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(a5);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  JSAAccountController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_A0F20, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_4E31C(v11, (uint64_t)sub_4E570, v9);

  swift_release(v9);
}

@end
