@implementation UIButtonConfiguration

+ (id)plainGazeableConfiguration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Class isa;
  uint64_t v8;

  v2 = type metadata accessor for UIButton.Configuration(0, a2);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);

  static UIButton.Configuration.borderless()();
  isa = UIButton.Configuration._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return isa;
}

+ (id)plainNonGazeableConfiguration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  Class isa;
  uint64_t v9;

  v2 = type metadata accessor for UIButton.Configuration(0, a2);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIButton.Configuration.borderless()(v4);
  isa = UIButton.Configuration._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return isa;
}

- (void)configureWithZeroInsetsIfAllowed
{
  void *v3;
  UIButtonConfiguration *v4;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;

  -[UIButtonConfiguration setContentInsets:](v4, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
}

@end
