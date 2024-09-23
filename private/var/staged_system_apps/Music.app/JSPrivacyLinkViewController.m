@implementation JSPrivacyLinkViewController

- (_TtC5Music27JSPrivacyLinkViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC5Music27JSPrivacyLinkViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music27JSPrivacyLinkViewController_privacyLinkViewController) = 0;
  v4 = a3;

  result = (_TtC5Music27JSPrivacyLinkViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/JSPrivacyLinkViewController.swift", 39, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC5Music27JSPrivacyLinkViewController *v2;

  v2 = self;
  JSPrivacyLinkViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music27JSPrivacyLinkViewController *v2;

  v2 = self;
  JSPrivacyLinkViewController.viewDidLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[6];
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain(a4, v7);
  v8 = v13.receiver;
  -[JSPrivacyLinkViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v9 = swift_allocObject(&unk_1010D0EA8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v12[4] = sub_1005CF438;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1005CE710;
  v12[3] = &unk_1010D0EC0;
  v10 = _Block_copy(v12);
  v11 = v8;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v10, 0, swift_release().n128_f64[0]);
  _Block_release(v10);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music27JSPrivacyLinkViewController *v6;
  _TtC5Music27JSPrivacyLinkViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  JSPrivacyLinkViewController.traitCollectionDidChange(_:)(v8);

}

- (void)systemLayoutFittingSizeDidChangeForChildViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[JSPrivacyLinkViewController systemLayoutFittingSizeDidChangeForChildViewController:](&v6, "systemLayoutFittingSizeDidChangeForChildViewController:", v4);
  sub_1005CEB60();

}

- (_TtC5Music27JSPrivacyLinkViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music27JSPrivacyLinkViewController *result;

  v4 = a4;
  result = (_TtC5Music27JSPrivacyLinkViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.JSPrivacyLinkViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27JSPrivacyLinkViewController_privacyLinkViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27JSPrivacyLinkViewController_privacyLinkViewController));
}

@end
