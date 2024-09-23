@implementation JSSocialOnboardingWelcomeViewController

- (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *result;

  v5 = OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_textDrawingCache;
  v6 = type metadata accessor for TextDrawing.Cache();
  swift_allocObject(v6, 120, 7);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController____lazy_storage___socialOnboardingWelcomeView) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_visibleBoundsSize);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSSocialOnboardingWelcomeViewController.swift", 62, 2, 23, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *v2;

  v2 = self;
  JSSocialOnboardingWelcomeViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[JSSocialOnboardingWelcomeViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "navigationController", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "navigationBar");

    objc_msgSend(v7, "setPrefersLargeTitles:", 0);
    v4 = v7;
  }

}

- (void)viewDidLoad
{
  _TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *v2;

  v2 = self;
  JSSocialOnboardingWelcomeViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = v14.receiver;
  -[JSSocialOnboardingWelcomeViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = objc_msgSend(v2, "view", v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = sub_1AAB48();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSocialOnboardingWelcomeViewController", 56, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_socialOnboardingWelcomeViewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController____lazy_storage___socialOnboardingWelcomeView));
}

@end
