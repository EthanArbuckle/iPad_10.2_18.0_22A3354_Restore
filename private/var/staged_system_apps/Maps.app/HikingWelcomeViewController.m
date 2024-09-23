@implementation HikingWelcomeViewController

- (_TtC4Maps27HikingWelcomeViewController)initWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  _TtC4Maps27HikingWelcomeViewController *v5;

  v3 = _Block_copy(a3);
  if (v3)
  {
    v4 = swift_allocObject(&unk_10119CD18, 24, 7);
    *(_QWORD *)(v4 + 16) = v3;
    v3 = sub_1000268B4;
  }
  else
  {
    v4 = 0;
  }
  v5 = (_TtC4Maps27HikingWelcomeViewController *)sub_10002630C((uint64_t)v3, v4);
  sub_10000BF74((uint64_t)v3, v4);
  return v5;
}

- (_TtC4Maps27HikingWelcomeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002648C();
}

- (void)viewDidLoad
{
  _TtC4Maps27HikingWelcomeViewController *v2;

  v2 = self;
  sub_100023B04();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  NSString v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HikingWelcomeViewController();
  v4 = v8.receiver;
  -[HikingWelcomeViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = (void *)objc_opt_self(NSUserDefaults);
  v6 = objc_msgSend(v5, "standardUserDefaults", v8.receiver, v8.super_class);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setBool:forKey:", 1, v7);

  sub_100024EAC();
}

- (void)viewDidLayoutSubviews
{
  _TtC4Maps27HikingWelcomeViewController *v2;

  v2 = self;
  sub_1000250B4();

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_self(OBBaseWelcomeController), "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v5;

  height = a3.height;
  width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HikingWelcomeViewController();
  -[HikingWelcomeViewController setPreferredContentSize:](&v5, "setPreferredContentSize:", width, height);
}

- (_TtC4Maps27HikingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Maps27HikingWelcomeViewController *result;

  v4 = a4;
  result = (_TtC4Maps27HikingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.HikingWelcomeViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_allStates));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_videoView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_titleText));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_topContentGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_titleToBodyGradientView));
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_completionHandler), *(_QWORD *)&self->allStates[OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_completionHandler]);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)updateForTraitChanges
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _TtC4Maps27HikingWelcomeViewController *v6;

  v6 = self;
  sub_100024A40();
  v2 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_videoView);
  sub_100025B00();
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v2, "loadAssetNamed:preservingTimestamp:", v5, 1);

  if ((objc_msgSend(v2, "isHidden") & 1) == 0)
    objc_msgSend(v2, "play");

}

- (void)continueTapped
{
  _TtC4Maps27HikingWelcomeViewController *v2;

  v2 = self;
  sub_100025D3C();

}

@end
