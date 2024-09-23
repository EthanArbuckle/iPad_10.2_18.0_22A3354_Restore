@implementation TextDrawing.View

- (_TtCV16MusicApplication11TextDrawing4View)initWithFrame:(CGRect)a3
{
  return (_TtCV16MusicApplication11TextDrawing4View *)TextDrawing.View.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV16MusicApplication11TextDrawing4View)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtCV16MusicApplication11TextDrawing4View *result;
  _OWORD v8[8];

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtCV16MusicApplication11TextDrawing4View_isDisabled) = 0;
  v5 = (char *)self + OBJC_IVAR____TtCV16MusicApplication11TextDrawing4View__textDrawingContext;
  sub_4C718(v8);
  sub_4C730((uint64_t)v8, (uint64_t)v5);
  v6 = a3;

  result = (_TtCV16MusicApplication11TextDrawing4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/TextDrawingView.swift", 38, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _TtCV16MusicApplication11TextDrawing4View *v3;

  v3 = self;
  _s16MusicApplication11TextDrawingV4ViewC4drawyySo6CGRectVF_0();

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  _TtCV16MusicApplication11TextDrawing4View *v9;
  NSString v10;
  unsigned int v11;
  unint64_t v12;
  char v13;
  objc_super v15;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a3;
  v9 = self;
  v10 = String._bridgeToObjectiveC()();
  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for TextDrawing.View();
  v11 = -[TextDrawing.View _shouldAnimatePropertyWithKey:](&v15, "_shouldAnimatePropertyWithKey:", v10);

  if (v11)
  {

    v12 = v7;
  }
  else
  {
    if (v5 != 0x73746E65746E6F63 || v7 != 0xE800000000000000)
    {
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, 0x73746E65746E6F63, 0xE800000000000000, 0);

      swift_bridgeObjectRelease(v7);
      goto LABEL_8;
    }

    v12 = 0xE800000000000000;
  }
  swift_bridgeObjectRelease(v12);
  v13 = 1;
LABEL_8:

  return v13 & 1;
}

- (void).cxx_destruct
{
  _QWORD v2[16];

  sub_4C730((uint64_t)self + OBJC_IVAR____TtCV16MusicApplication11TextDrawing4View__textDrawingContext, (uint64_t)v2);
  sub_2DEBF8(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2DEC54);
}

@end
