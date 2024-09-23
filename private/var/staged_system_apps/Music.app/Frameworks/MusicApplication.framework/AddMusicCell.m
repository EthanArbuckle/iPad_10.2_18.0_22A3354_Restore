@implementation AddMusicCell

- (_TtC16MusicApplication12AddMusicCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12AddMusicCell *)sub_A9E574(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12AddMusicCell)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication12AddMusicCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication12AddMusicCell_dataSource) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication12AddMusicCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/AddMusicCell.swift", 35, 2, 30, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication12AddMusicCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[AddMusicCell contentView](v4, "contentView");
  objc_msgSend(v5, "sizeThatFits:", width, 1.79769313e308);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12AddMusicCell_dataSource));
}

@end
