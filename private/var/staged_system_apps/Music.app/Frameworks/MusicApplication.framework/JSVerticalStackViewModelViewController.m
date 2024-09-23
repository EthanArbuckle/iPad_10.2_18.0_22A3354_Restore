@implementation JSVerticalStackViewModelViewController

- (_TtC16MusicApplication38JSVerticalStackViewModelViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication38JSVerticalStackViewModelViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_lastSeenScrollableHeight) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication38JSVerticalStackViewModelViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSVerticalStackViewModelViewController.swift", 61, 2, 24, 0);
  __break(1u);
  return result;
}

- (NSString)playActivityFeatureName
{
  void (*v2)(void);
  _TtC16MusicApplication38JSVerticalStackViewModelViewController *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = *(void (**)(void))&stru_68.segname[(**(_QWORD **)((char *)&self->super.super.super.super.super.isa
                                                       + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_verticalStack) & swift_isaMask)
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
  _TtC16MusicApplication38JSVerticalStackViewModelViewController *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v2 = *(uint64_t (**)(void))((char *)&stru_68.offset
                           + (**(_QWORD **)((char *)&self->super.super.super.super.super.isa
                                          + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_verticalStack) & swift_isaMask));
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_verticalStack));
}

@end
