@implementation FolderComposerParticipantCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes29FolderComposerParticipantCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002DDE98();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11MobileNotes29FolderComposerParticipantCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_participant) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_unknownParticipant) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_showCheckmark) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_avatarSize) = (Class)0x403C000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell____lazy_storage___emptyAvatarImage) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerParticipantCell();
  return -[FolderComposerParticipantCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes29FolderComposerParticipantCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes29FolderComposerParticipantCell *)sub_1002DEAE0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_participant));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_unknownParticipant));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell____lazy_storage___emptyAvatarImage));
}

@end
