@implementation QRCodeOverlayViewController

- (_TtC11MusicCoreUI27QRCodeOverlayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003E2344();
}

- (void)viewDidLoad
{
  _TtC11MusicCoreUI27QRCodeOverlayViewController *v2;

  v2 = self;
  QRCodeOverlayViewController.viewDidLoad()();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC11MusicCoreUI27QRCodeOverlayViewController *v4;

  v4 = self;
  QRCodeOverlayViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11MusicCoreUI27QRCodeOverlayViewController *v4;

  v4 = self;
  QRCodeOverlayViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC11MusicCoreUI27QRCodeOverlayViewController *v2;

  v2 = self;
  QRCodeOverlayViewController.viewDidLayoutSubviews()();

}

- (void)dismissAnimated
{
  _TtC11MusicCoreUI27QRCodeOverlayViewController *v2;

  v2 = self;
  QRCodeOverlayViewController.dismissAnimated()();

}

- (_TtC11MusicCoreUI27QRCodeOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11MusicCoreUI27QRCodeOverlayViewController *result;

  v4 = a4;
  result = (_TtC11MusicCoreUI27QRCodeOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.QRCodeOverlayViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCodeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_destOutLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_logoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_subtitleLabelEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCodeBackgroundView));
  v3 = *(void **)&self->destOutLayer[OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCode];
  sub_10003A628(*(_QWORD *)&self->backgroundView[OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCode], *(_QWORD *)&self->qrCodeView[OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCode]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_scrollContentView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_brightnessManager));
}

@end
