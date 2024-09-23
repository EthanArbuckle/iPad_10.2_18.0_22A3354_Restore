@implementation PASUIAppleIDAuthContextProvider

- (_TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PASUIAppleIDAuthContextProvider init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_220D671D8((uint64_t)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate);
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_220D7B1C4();

}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_220D7B300();

}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_220D7B43C();

}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_220D7B578();

}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_220D7B6B4();

}

- (id)remoteUIStyle
{
  return (id)sub_220D7B7F0();
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_220D7B8EC();

}

- (void)signAdditionalHeadersWithRequest:(NSMutableURLRequest *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSMutableURLRequest *v15;
  _TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25564B0E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220D9943C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25564C320;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25564AD88;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220D8240C((uint64_t)v9, (uint64_t)&unk_25564C330, (uint64_t)v14);
  swift_release();
}

@end
