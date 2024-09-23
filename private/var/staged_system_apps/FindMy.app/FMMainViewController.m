@implementation FMMainViewController

- (void)viewLayoutMarginsDidChange
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMMainViewController();
  v2 = v7.receiver;
  -[FMMainViewController viewLayoutMarginsDidChange](&v7, "viewLayoutMarginsDidChange");
  if (qword_1005D1E80 != -1)
    swift_once(&qword_1005D1E80, sub_100008974);
  v3 = objc_msgSend(v2, "view", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "layoutMargins");
    v6 = v5;

    qword_1005F5978 = v6;
  }
  else
  {
    __break(1u);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC6FindMy20FMMainViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    return 30;
  else
    return 2;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_initialCardContainer));
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy20FMMainViewController *v4;

  v4 = self;
  sub_1000078B8(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy20FMMainViewController *v4;

  v4 = self;
  sub_10000A838(a3);

}

- (void)viewDidLoad
{
  _TtC6FindMy20FMMainViewController *v2;

  v2 = self;
  sub_10001C454();

}

- (_TtC6FindMy20FMMainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002E7EA0();
}

- (BOOL)shouldAutorotate
{
  void *v3;
  _TtC6FindMy20FMMainViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  return v6 == (id)1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy20FMMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002E80C0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_noLocationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_mapController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_initialCardContainer));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_alertQueue));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_compactConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_regularConstraints));
}

@end
