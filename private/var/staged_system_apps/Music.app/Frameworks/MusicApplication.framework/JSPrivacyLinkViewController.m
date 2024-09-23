@implementation JSPrivacyLinkViewController

- (_TtC16MusicApplication27JSPrivacyLinkViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication27JSPrivacyLinkViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSPrivacyLinkViewController_privacyLinkViewController) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication27JSPrivacyLinkViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSPrivacyLinkViewController.swift", 50, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27JSPrivacyLinkViewController *v2;

  v2 = self;
  JSPrivacyLinkViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication27JSPrivacyLinkViewController *v2;

  v2 = self;
  JSPrivacyLinkViewController.viewDidLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[JSPrivacyLinkViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_1392080, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_9B2AE0;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_20B50C;
  v12[3] = &block_descriptor_7_12;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication27JSPrivacyLinkViewController *v6;
  _TtC16MusicApplication27JSPrivacyLinkViewController *v7;
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
  sub_9B22AC();

}

- (_TtC16MusicApplication27JSPrivacyLinkViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27JSPrivacyLinkViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27JSPrivacyLinkViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSPrivacyLinkViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSPrivacyLinkViewController_privacyLinkViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSPrivacyLinkViewController_privacyLinkViewController));
}

@end
