@implementation SubscriptionPurchaseViewController

- (_TtC5Music34SubscriptionPurchaseViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC5Music34SubscriptionPurchaseViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music34SubscriptionPurchaseViewController_bag) = 0;
  v4 = a3;

  result = (_TtC5Music34SubscriptionPurchaseViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/SubscriptionPurchaseView.swift", 36, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SubscriptionPurchaseViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100537AE8();

}

- (_TtC5Music34SubscriptionPurchaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music34SubscriptionPurchaseViewController *result;

  v4 = a4;
  result = (_TtC5Music34SubscriptionPurchaseViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.SubscriptionPurchaseViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34SubscriptionPurchaseViewController_segue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34SubscriptionPurchaseViewController_bag));
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _TtC5Music34SubscriptionPurchaseViewController *v12;
  id v13;
  _TtC5Music34SubscriptionPurchaseViewController *v14;
  id v15;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1010CC838, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  sub_10004A07C(0, (unint64_t *)&qword_1011A2110, OS_dispatch_queue_ptr);
  v10 = (_QWORD *)swift_allocObject(&unk_1010CC860, 48, 7);
  v10[2] = a4;
  v10[3] = self;
  v10[4] = sub_100539EE4;
  v10[5] = v9;
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = v12;
  v15 = a3;
  swift_retain();
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_100539E00, (uint64_t)v10);

  swift_release();
  swift_release();
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _TtC5Music34SubscriptionPurchaseViewController *v12;
  id v13;
  _TtC5Music34SubscriptionPurchaseViewController *v14;
  id v15;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1010CC7C0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  sub_10004A07C(0, (unint64_t *)&qword_1011A2110, OS_dispatch_queue_ptr);
  v10 = (_QWORD *)swift_allocObject(&unk_1010CC7E8, 48, 7);
  v10[2] = a4;
  v10[3] = self;
  v10[4] = sub_100539DA0;
  v10[5] = v9;
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = v12;
  v15 = a3;
  swift_retain();
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_100539DBC, (uint64_t)v10);

  swift_release();
  swift_release();
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC5Music34SubscriptionPurchaseViewController *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1005399D8(v10, (char *)v11, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)purchase:(AMSPurchase *)a3 handleWindowRequest:(AMSUIWindowRequest *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AMSPurchase *v17;
  AMSUIWindowRequest *v18;
  _TtC5Music34SubscriptionPurchaseViewController *v19;
  uint64_t v20;

  v9 = sub_100007E8C((uint64_t *)&unk_1011A13B0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1010CC6A8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1010CC6D0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1011B9268;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1010CC6F8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1011B9278;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100539374((uint64_t)v11, (uint64_t)&unk_1011B9288, (uint64_t)v16);
  swift_release();
}

@end
