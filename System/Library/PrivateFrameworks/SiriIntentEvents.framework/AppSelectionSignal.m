@implementation AppSelectionSignal

+ (BOOL)supportsSecureCoding
{
  return static AppSelectionSignal.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AppSelectionSignal.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC16SiriIntentEvents18AppSelectionSignal *v5;

  v4 = a3;
  v5 = self;
  sub_2132D30CC(v4);

}

- (_TtC16SiriIntentEvents18AppSelectionSignal)initWithCoder:(id)a3
{
  return (_TtC16SiriIntentEvents18AppSelectionSignal *)AppSelectionSignal.init(coder:)(a3);
}

- (_TtC16SiriIntentEvents18AppSelectionSignal)init
{
  AppSelectionSignal.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
