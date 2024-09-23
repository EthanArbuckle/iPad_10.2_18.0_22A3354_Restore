@implementation FolderComposerFilterCellDatePicker

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes34FolderComposerFilterCellDatePicker *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002BB27C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)prepareForReuse
{
  _TtC11MobileNotes34FolderComposerFilterCellDatePicker *v2;

  v2 = self;
  sub_1002BC010();

}

- (void)dateSelectionChanged:(id)a3
{
  id v4;
  _TtC11MobileNotes34FolderComposerFilterCellDatePicker *v5;

  v4 = a3;
  v5 = self;
  sub_1002BC160(v4);

}

- (_TtC11MobileNotes34FolderComposerFilterCellDatePicker)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes34FolderComposerFilterCellDatePicker *)sub_1002BC5FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes34FolderComposerFilterCellDatePicker)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes34FolderComposerFilterCellDatePicker *)sub_1002BC720(a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_dateSelectionChanged), *(_QWORD *)&self->dateSelectionChanged[OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_dateSelectionChanged]);
  sub_1002BC9C8((uint64_t)self + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_date);
  swift_bridgeObjectRelease(*(_QWORD *)&self->dateSelectionChanged[OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_popoverLeadingText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker____lazy_storage___datePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_inlineStackViewLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker____lazy_storage___compactStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker____lazy_storage___inlineLabel));
}

@end
