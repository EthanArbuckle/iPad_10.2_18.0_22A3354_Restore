@implementation JSTVShowPlayBarViewController

- (_TtC16MusicApplication29JSTVShowPlayBarViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC16MusicApplication29JSTVShowPlayBarViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_contentItem) = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarUserActivity;
  v6 = type metadata accessor for UserActivity();
  swift_allocObject(v6, 24, 7);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_862AD8();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_episode) = 0;

  result = (_TtC16MusicApplication29JSTVShowPlayBarViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSTVShowPlayBarViewController.swift", 52, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSTVShowPlayBarViewController();
  v4 = (char *)v5.receiver;
  -[JSTVShowPlayBarViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarUserActivity]+ 16), "becomeCurrent", v5.receiver, v5.super_class);

}

- (void)viewDidLoad
{
  _TtC16MusicApplication29JSTVShowPlayBarViewController *v2;

  v2 = self;
  sub_660FDC();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication29JSTVShowPlayBarViewController *v2;

  v2 = self;
  sub_661304();

}

- (NSString)playActivityFeatureName
{
  void (*v2)(void);
  _TtC16MusicApplication29JSTVShowPlayBarViewController *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = *(void (**)(void))&stru_68.segname[(**(_QWORD **)((char *)&self->super.super.super.isa
                                                       + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarViewModel) & swift_isaMask)
                                        + 8];
  v3 = self;
  v2();
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (NSData)playActivityRecommendationData
{
  uint64_t (*v2)(void);
  _TtC16MusicApplication29JSTVShowPlayBarViewController *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v2 = *(uint64_t (**)(void))((char *)&stru_68.offset
                           + (**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarViewModel) & swift_isaMask));
  v3 = self;
  v4 = v2();
  v6 = v5;

  if (v6 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_50C4C(v4, v6);
  }
  return (NSData *)isa;
}

- (_TtC16MusicApplication29JSTVShowPlayBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication29JSTVShowPlayBarViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication29JSTVShowPlayBarViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSTVShowPlayBarViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_contentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarViewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarUserActivity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_episode));
}

@end
