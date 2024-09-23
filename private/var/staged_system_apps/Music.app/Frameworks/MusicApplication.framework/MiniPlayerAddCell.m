@implementation MiniPlayerAddCell

- (_TtC16MusicApplication17MiniPlayerAddCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplication17MiniPlayerAddCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication17MiniPlayerAddCell_trailingConstraint) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication17MiniPlayerAddCell_tapAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC16MusicApplication17MiniPlayerAddCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/BottomPlayerAddCell.swift", 42, 2, 19, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication17MiniPlayerAddCell)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication17MiniPlayerAddCell *result;

  sub_AB5A24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17MiniPlayerAddCell_trailingConstraint));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17MiniPlayerAddCell_tapAction), *(_QWORD *)&self->trailingConstraint[OBJC_IVAR____TtC16MusicApplication17MiniPlayerAddCell_tapAction]);
}

@end
