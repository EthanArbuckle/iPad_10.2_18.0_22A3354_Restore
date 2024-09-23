@implementation RemoteBrowsingGuestPairingViewController

- (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B8CA974();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI40RemoteBrowsingGuestPairingViewController *v2;

  v2 = self;
  sub_22B8C7E98();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteBrowsingGuestPairingViewController();
  v4 = v5.receiver;
  -[RemoteBrowsingGuestPairingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B3C70D8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI40RemoteBrowsingGuestPairingViewController *v4;

  v4 = self;
  sub_22B8C8680(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI40RemoteBrowsingGuestPairingViewController *v4;

  v4 = self;
  sub_22B8C8A04(a3);

}

- (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI40RemoteBrowsingGuestPairingViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI40RemoteBrowsingGuestPairingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_animationImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI40RemoteBrowsingGuestPairingViewController_stackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
