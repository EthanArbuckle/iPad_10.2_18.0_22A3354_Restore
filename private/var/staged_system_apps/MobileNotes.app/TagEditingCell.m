@implementation TagEditingCell

- (_TtC11MobileNotes14TagEditingCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes14TagEditingCell *)sub_1002B7338(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes14TagEditingCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes14TagEditingCell *)sub_1002B74C8(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes14TagEditingCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002B7848((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4;
  _TtC11MobileNotes14TagEditingCell *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = self;
  v6 = -[TagEditingCell ic_viewControllerManager](v5, "ic_viewControllerManager");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "isSplitViewExpandingOrCollapsing");

    if ((v8 & 1) != 0)
      return 0;
  }
  else
  {

  }
  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  _TtC11MobileNotes14TagEditingCell *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1002B8910();

  return self & 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _TtC11MobileNotes14TagEditingCell *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1002B8A18(v7, v9);

  swift_bridgeObjectRelease(v9);
  return v7 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  id v5;
  _TtC11MobileNotes14TagEditingCell *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_textField);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "text");
  v8 = v7;
  if (v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v10 = v9;

    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);

    objc_msgSend(v4, "resignFirstResponder");
  }

  return v8 != 0;
}

- (void)textChanged:(id)a3
{
  _TtC11MobileNotes14TagEditingCell *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MobileNotes14TagEditingCell *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_1002B7F9C();

  sub_100012DDC((uint64_t)v9, &qword_1005CF190);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC11MobileNotes14TagEditingCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002B8B20();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_hashtag));
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_tagEditingCellRenameDelegate, (uint64_t *)&unk_1005D70A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell____lazy_storage___listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_tagObjectID));
}

@end
