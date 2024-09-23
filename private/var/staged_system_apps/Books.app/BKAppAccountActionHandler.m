@implementation BKAppAccountActionHandler

- (BKAppAccountActionHandler)initWithSceneManager:(id)a3
{
  objc_class *ObjectType;
  id v6;
  void *v7;
  id v8;
  id v9;
  BKAppAccountActionHandler *v10;
  uint64_t v11;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for AccountController(0);
  v6 = a3;
  v7 = (void *)static AccountController.shared.getter();
  v8 = objc_msgSend((id)objc_opt_self(BUAccountsProvider), "sharedProvider");
  v9 = objc_allocWithZone(ObjectType);
  v10 = (BKAppAccountActionHandler *)sub_100015E88(v6, v7, v8);
  v11 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v11, 33, 7);
  return v10;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  BKAppAccountActionHandler *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppAccountActionHandler_accountsProvider);
  v5 = self;
  objc_msgSend(v4, "removeObserver:accountTypes:", v5, 1);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[BKAppAccountActionHandler dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BKAppAccountActionHandler *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = self;
  v10 = static MainActor.shared.getter(v9);
  v11 = (_QWORD *)swift_allocObject(&unk_10090AA88, 40, 7);
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  v12 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009E6870, (uint64_t)v11);

  swift_release(v12);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BKAppAccountActionHandler *v7;
  uint64_t v8;
  BKAppAccountActionHandler *v9;
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
  v10 = sub_1004B7460((uint64_t)a3, (uint64_t)v12);

  sub_10004A7B8((uint64_t)v12);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  BKAppAccountActionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1004B7638(v4);

}

- (void)books_authorizeThisComputer:(id)a3
{
  sub_1004B7B7C((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)sub_1004B79D0, (uint64_t)&unk_10090AA50);
}

- (void)books_deauthorizeThisComputer:(id)a3
{
  sub_1004B7B7C((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)sub_1004B7AA4, (uint64_t)&unk_10090AA28);
}

- (void)books_toggleSignedIn:(id)a3
{
  BKAppAccountActionHandler *v5;
  uint64_t v6;
  BKAppAccountActionHandler *v7;
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
  sub_1004B7C4C();

  sub_10004A7B8((uint64_t)v8);
}

- (void)books_viewMyAccount:(id)a3
{
  BKAppAccountActionHandler *v5;
  uint64_t v6;
  double v7;
  BKAppAccountActionHandler *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppAccountActionHandler_sceneManager), "requestAccountInfoScene", v7, v9, v10);

  sub_10004A7B8((uint64_t)&v9);
}

- (BKAppAccountActionHandler)init
{
  BKAppAccountActionHandler *result;

  result = (BKAppAccountActionHandler *)_swift_stdlib_reportUnimplementedInitializer("Books.AppAccountActionHandler", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
