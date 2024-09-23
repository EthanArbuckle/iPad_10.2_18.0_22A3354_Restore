@implementation BuyButtonUIViewController

- (_TtC5Books25BuyButtonUIViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5Books25BuyButtonUIViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_eventHandler;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_cancellables) = (Class)&_swiftEmptySetSingleton;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_buttonEnabled) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_radialProgressThickness) = (Class)0x4000000000000000;
  v5 = a3;

  result = (_TtC5Books25BuyButtonUIViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/BuyButtonUIViewController.swift", 37, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC5Books25BuyButtonUIViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)type metadata accessor for BuyButtonUIView());
  v4 = self;
  v5 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[BuyButtonUIViewController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  _TtC5Books25BuyButtonUIViewController *v2;

  v2 = self;
  sub_10042CDF8();

}

- (_TtC5Books25BuyButtonUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books25BuyButtonUIViewController *result;

  v4 = a4;
  result = (_TtC5Books25BuyButtonUIViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.BuyButtonUIViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_viewModel));
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_eventHandler, &qword_1009D26C8);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books25BuyButtonUIViewController_cancellables));
}

- (void)_buyButtonPressed:(id)a3
{
  _TtC5Books25BuyButtonUIViewController *v5;
  uint64_t v6;
  _TtC5Books25BuyButtonUIViewController *v7;
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
  sub_10042E828();

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

@end
