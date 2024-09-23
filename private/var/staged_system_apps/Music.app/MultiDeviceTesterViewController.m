@implementation MultiDeviceTesterViewController

- (void)viewDidLoad
{
  _TtC5Music31MultiDeviceTesterViewController *v2;

  v2 = self;
  sub_1002239FC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Music31MultiDeviceTesterViewController *v4;

  v4 = self;
  sub_1002250C4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MultiDeviceTesterViewController();
  v4 = v5.receiver;
  -[MultiDeviceTesterViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  static LifecyclePatrol.isEnabled = 1;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music31MultiDeviceTesterViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10022537C((uint64_t)a3);

}

- (_TtC5Music31MultiDeviceTesterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Music31MultiDeviceTesterViewController *)sub_100225FC8(v5, v7, a4);
}

- (_TtC5Music31MultiDeviceTesterViewController)initWithCoder:(id)a3
{
  return (_TtC5Music31MultiDeviceTesterViewController *)sub_1002273DC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music31MultiDeviceTesterViewController_devices));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MultiDeviceTesterViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MultiDeviceTesterViewController_stackView));
}

@end
