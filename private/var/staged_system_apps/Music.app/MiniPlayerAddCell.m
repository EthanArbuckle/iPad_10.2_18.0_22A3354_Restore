@implementation MiniPlayerAddCell

- (_TtC5Music17MiniPlayerAddCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC5Music17MiniPlayerAddCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_trailingConstraint) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_tapAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC5Music17MiniPlayerAddCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/BottomPlayerAddCell.swift", 31, 2, 19, 0);
  __break(1u);
  return result;
}

- (_TtC5Music17MiniPlayerAddCell)initWithFrame:(CGRect)a3
{
  _TtC5Music17MiniPlayerAddCell *result;

  sub_100539F8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_trailingConstraint));
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_tapAction), *(_QWORD *)&self->trailingConstraint[OBJC_IVAR____TtC5Music17MiniPlayerAddCell_tapAction]);
}

@end
