@implementation BKAppGlobalActionHandler

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKAppGlobalActionHandler_delegate, a3);
}

- (BKAppGlobalActionHandler)initWithSceneManager:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (BKAppGlobalActionHandler *)sub_100014B9C((uint64_t)v3, v4);
}

- (BKAppGlobalActionHandlerDelegate)delegate
{
  return (BKAppGlobalActionHandlerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___BKAppGlobalActionHandler_delegate);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BKAppGlobalActionHandler *v7;
  uint64_t v8;
  BKAppGlobalActionHandler *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100218460((uint64_t)a3, (uint64_t)v12);

  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
  return v10 & 1;
}

- (void)books_openRecent:(id)a3
{
  BKAppGlobalActionHandler *v5;
  uint64_t v6;
  BKAppGlobalActionHandler *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_10021862C((uint64_t)v8);

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

- (void)books_import:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1002188B4);
}

- (void)books_provideFeedback:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100219014);
}

- (void)books_aboutKeyboardShortcuts:(id)a3
{
  BKAppGlobalActionHandler *v5;
  uint64_t v6;
  BKAppGlobalActionHandler *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_10021AAF4();

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

- (void)books_aboutPrivacy:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100219730);
}

- (void)books_aboutTermsAndConditions:(id)a3
{
  BKAppGlobalActionHandler *v5;
  uint64_t v6;
  BKAppGlobalActionHandler *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _OWORD v13[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v7 = self;
  }
  v8 = type metadata accessor for AccountController(0);
  v12 = (void *)static AccountController.shared.getter(v8, v9, v10, v11);
  AccountController.openTermsAndConditions()();

  sub_100010960((uint64_t)v13, (uint64_t *)&unk_1009D04E0);
}

- (void)books_aboutServicesAndSupport:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BKAppGlobalActionHandler *v8;
  uint64_t v9;
  BKAppGlobalActionHandler *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v10 = self;
  }
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = type metadata accessor for MainActor(0);
  v13 = static MainActor.shared.getter(v12);
  v14 = swift_allocObject(&unk_1008F4748, 32, 7);
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = &protocol witness table for MainActor;
  v15 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009D3160, v14);

  swift_release(v15);
  sub_100010960((uint64_t)v16, (uint64_t *)&unk_1009D04E0);
}

- (BKAppGlobalActionHandler)init
{
  BKAppGlobalActionHandler *result;

  result = (BKAppGlobalActionHandler *)_swift_stdlib_reportUnimplementedInitializer("Books.AppGlobalActionHandler", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKAppGlobalActionHandler_delegate);
}

@end
