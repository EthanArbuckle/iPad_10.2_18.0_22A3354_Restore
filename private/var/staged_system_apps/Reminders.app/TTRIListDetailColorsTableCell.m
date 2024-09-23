@implementation TTRIListDetailColorsTableCell

- (_TtC9Reminders29TTRIListDetailColorsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC9Reminders29TTRIListDetailColorsTableCell *)sub_100038884(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders29TTRIListDetailColorsTableCell)initWithCoder:(id)a3
{
  id v5;
  _TtC9Reminders29TTRIListDetailColorsTableCell *result;

  *(_QWORD *)&self->gridView[OBJC_IVAR____TtC9Reminders29TTRIListDetailColorsTableCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC9Reminders29TTRIListDetailColorsTableCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIListDetailColorsCellContent.swift", 47, 2, 120, 0);
  __break(1u);
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  _TtC9Reminders29TTRIListDetailColorsTableCell *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = TTRListAppearanceGridView.height(forWidth:)(width);

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders29TTRIListDetailColorsTableCell_gridView));
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders29TTRIListDetailColorsTableCell_delegate);
}

@end
