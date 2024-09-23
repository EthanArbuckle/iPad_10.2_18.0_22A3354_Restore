@implementation FMRemoveDeviceViewController

- (_TtC6FindMy28FMRemoveDeviceViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy28FMRemoveDeviceViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_selectionSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_devicesSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_imageFetchingCancellable) = 0;
  v4 = a3;

  result = (_TtC6FindMy28FMRemoveDeviceViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMRemoveAccessoryDeviceViewController.swift", 50, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMRemoveDeviceViewController(0);
  v2 = v3.receiver;
  -[FMRemoveDeviceViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100446608();
  sub_100448E94();
  sub_100449174();
  sub_10044CED8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy28FMRemoveDeviceViewController *v4;

  v4 = self;
  sub_100446300(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy28FMRemoveDeviceViewController *v4;

  v4 = self;
  sub_1004464A4(a3);

}

- (void)performRemoveDevice
{
  _TtC6FindMy28FMRemoveDeviceViewController *v2;

  v2 = self;
  sub_10044940C();

}

- (void)performRemoveAccessory
{
  _TtC6FindMy28FMRemoveDeviceViewController *v2;

  v2 = self;
  sub_100449DD4();

}

- (void)removeAccessory
{
  _TtC6FindMy28FMRemoveDeviceViewController *v2;

  v2 = self;
  sub_10044A2C8();

}

- (void)removeItem
{
  _TtC6FindMy28FMRemoveDeviceViewController *v2;

  v2 = self;
  sub_10044ABC0();

}

- (void)cancel
{
  -[FMRemoveDeviceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC6FindMy28FMRemoveDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy28FMRemoveDeviceViewController *result;

  v4 = a4;
  result = (_TtC6FindMy28FMRemoveDeviceViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMRemoveDeviceViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_mediator));
  sub_10004FCB8((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_viewModel, type metadata accessor for FMDeviceDetailViewModel);
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_deviceToRemove;
  v4 = type metadata accessor for FMIPDevice(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_selectionSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_devicesSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_landingView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_imageFetchingCancellable));
}

@end
