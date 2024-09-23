@implementation JSMessageViewController

- (_TtC16MusicApplication23JSMessageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication23JSMessageViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController____lazy_storage___noContentView) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication23JSMessageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSMessageViewController.swift", 46, 2, 20, 0);
  __break(1u);
  return result;
}

- (NSString)playActivityFeatureName
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = *(char **)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController_messageViewModel)
     + OBJC_IVAR____TtC11MusicJSCore11JSViewModel_playActivityFeatureName;
  swift_beginAccess(v2, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (NSData)playActivityRecommendationData
{
  uint64_t v2;
  unint64_t v3;
  Class isa;
  uint64_t v5;
  unint64_t v6;

  v2 = JSViewModel.playActivityRecommendationData.getter();
  if (v3 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    v5 = v2;
    v6 = v3;
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_50C4C(v5, v6);
  }
  return (NSData *)isa;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication23JSMessageViewController *v2;

  v2 = self;
  sub_B3DD68();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication23JSMessageViewController *v2;

  v2 = self;
  sub_B3DFA0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController_messageViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController____lazy_storage___noContentView));
}

@end
