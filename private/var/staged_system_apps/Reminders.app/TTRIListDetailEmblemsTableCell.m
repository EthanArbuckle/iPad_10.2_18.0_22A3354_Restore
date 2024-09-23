@implementation TTRIListDetailEmblemsTableCell

- (_TtC9Reminders30TTRIListDetailEmblemsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders30TTRIListDetailEmblemsTableCell *)sub_1004CB060(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders30TTRIListDetailEmblemsTableCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004CC688();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  _TtC9Reminders30TTRIListDetailEmblemsTableCell *v6;
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

- (void)cancelEmojiSelection
{
  _TtC9Reminders30TTRIListDetailEmblemsTableCell *v2;

  v2 = self;
  sub_1004CBCD8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_emojiBadgeView));
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell____lazy_storage___emojiTextField));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_emojiCoverView);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9Reminders30TTRIListDetailEmblemsTableCell *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1004CC74C(v7, v9);

  swift_bridgeObjectRelease(v9);
  return v7 & 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC9Reminders30TTRIListDetailEmblemsTableCell *v8;

  if ((*((_BYTE *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_emojiWasSelected) & 1) == 0)
  {
    Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_delegate);
    if (Strong)
    {
      v6 = Strong;
      v7 = a3;
      v8 = self;
      sub_1004CA934((uint64_t)v8);

      swift_unknownObjectRelease(v6);
    }
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end
