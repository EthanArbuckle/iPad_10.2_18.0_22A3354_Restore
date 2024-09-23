@implementation CuratorActivityCell

- (_TtC16MusicApplication19CuratorActivityCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19CuratorActivityCell *)CuratorActivityCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19CuratorActivityCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _TtC16MusicApplication19CuratorActivityCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_title);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_textComponents;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)variable initialization expression of CuratorActivityCell.textComponents();

  result = (_TtC16MusicApplication19CuratorActivityCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/CuratorActivityCell.swift", 42, 2, 25, 0);
  __break(1u);
  return result;
}

- (NSString)title
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_title;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_title, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication19CuratorActivityCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  CuratorActivityCell.title.setter(v5, v7);

}

+ (UIEdgeInsets)visualContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_title]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_textComponents));
}

@end
