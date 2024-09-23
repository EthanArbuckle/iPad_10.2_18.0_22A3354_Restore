@implementation TranscriptSearchButton

- (_TtC12NowPlayingUI22TranscriptSearchButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC12NowPlayingUI22TranscriptSearchButton *v12;
  __n128 v13;
  uint64_t v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1FF6D0);
  __chkstk_darwin(v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16.receiver = self;
  v16.super_class = ObjectType;
  v12 = -[TranscriptSearchButton initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  sub_B1F28((uint64_t)v11);
  v14 = type metadata accessor for UIButton.Configuration(0, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 0, 1, v14);
  UIButton.configuration.setter(v11);
  sub_B1D50();

  return v12;
}

- (_TtC12NowPlayingUI22TranscriptSearchButton)initWithCoder:(id)a3
{
  _TtC12NowPlayingUI22TranscriptSearchButton *result;

  result = (_TtC12NowPlayingUI22TranscriptSearchButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/TranscriptSearchButton.swift", 41, 2, 23, 0);
  __break(1u);
  return result;
}

@end
