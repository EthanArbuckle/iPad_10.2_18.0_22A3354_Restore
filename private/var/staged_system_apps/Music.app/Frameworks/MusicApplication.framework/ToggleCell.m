@implementation ToggleCell

- (_TtC16MusicApplication10ToggleCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10ToggleCell *)sub_345DD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10ToggleCell)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  _TtC16MusicApplication10ToggleCell *result;

  v5 = &self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ToggleCell_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ToggleCell__isToggled] = 0;
  *(_QWORD *)&self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ToggleCell_switchView] = 0;
  v6 = a3;

  result = (_TtC16MusicApplication10ToggleCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ToggleCell.swift", 33, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication10ToggleCell *v2;

  v2 = self;
  sub_346188();

}

- (void)switchValueChanged:(id)a3
{
  id v4;
  _TtC16MusicApplication10ToggleCell *v5;

  v4 = a3;
  v5 = self;
  sub_34673C(v4);

}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication10ToggleCell_delegate);

}

@end
