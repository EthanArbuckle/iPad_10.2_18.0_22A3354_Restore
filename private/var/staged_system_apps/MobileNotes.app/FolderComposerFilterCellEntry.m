@implementation FolderComposerFilterCellEntry

- (void)layoutSubviews
{
  _TtC11MobileNotes29FolderComposerFilterCellEntry *v2;

  v2 = self;
  sub_1001FDEE0();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes29FolderComposerFilterCellEntry *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001FE12C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11MobileNotes29FolderComposerFilterCellEntry)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_leadingText);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_trailingText);
  *v8 = 0;
  v8[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_showDisclosure) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FolderComposerFilterCellEntry();
  return -[FolderComposerFilterCellEntry initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes29FolderComposerFilterCellEntry)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_leadingText);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_trailingText);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_showDisclosure) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FolderComposerFilterCellEntry();
  return -[FolderComposerFilterCellEntry initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->leadingText[OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_leadingText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->leadingText[OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_trailingText]);
}

@end
