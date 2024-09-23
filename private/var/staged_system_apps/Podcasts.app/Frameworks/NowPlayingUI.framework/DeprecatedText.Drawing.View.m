@implementation DeprecatedText.Drawing.View

- (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View)initWithFrame:(CGRect)a3
{
  return (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *)sub_147328(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *result;
  _OWORD v8[8];

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtCVV12NowPlayingUI14DeprecatedText7Drawing4View_isDisabled) = 0;
  v5 = (char *)self + OBJC_IVAR____TtCVV12NowPlayingUI14DeprecatedText7Drawing4View__textDrawingContext;
  sub_523D4(v8);
  sub_523EC((uint64_t)v8, (uint64_t)v5);
  v6 = a3;

  result = (_TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/TextDrawingView.swift", 34, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *v3;

  v3 = self;
  sub_147EDC();

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtCVV12NowPlayingUI14DeprecatedText7Drawing4View *v7;
  NSString v8;
  unsigned int v9;
  unint64_t v10;
  char v11;
  objc_super v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = String._bridgeToObjectiveC()();
  v13.receiver = v7;
  v13.super_class = (Class)_s4ViewCMa();
  v9 = -[DeprecatedText.Drawing.View _shouldAnimatePropertyWithKey:](&v13, "_shouldAnimatePropertyWithKey:", v8);

  if (v9)
  {

    v10 = v6;
  }
  else
  {
    if (v4 != 0x73746E65746E6F63 || v6 != 0xE800000000000000)
    {
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, 0x73746E65746E6F63, 0xE800000000000000, 0);

      swift_bridgeObjectRelease(v6);
      return v11 & 1;
    }

    v10 = 0xE800000000000000;
  }
  swift_bridgeObjectRelease(v10);
  v11 = 1;
  return v11 & 1;
}

- (void).cxx_destruct
{
  _QWORD v2[16];

  sub_523EC((uint64_t)self + OBJC_IVAR____TtCVV12NowPlayingUI14DeprecatedText7Drawing4View__textDrawingContext, (uint64_t)v2);
  sub_7A3C8(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_524A4);
}

@end
