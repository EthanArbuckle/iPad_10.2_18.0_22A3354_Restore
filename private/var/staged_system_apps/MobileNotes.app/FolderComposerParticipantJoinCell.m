@implementation FolderComposerParticipantJoinCell

- (_TtC11MobileNotes33FolderComposerParticipantJoinCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell_joinOperatorChanged);
  *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell_participantSelection) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell____lazy_storage___allAction) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell____lazy_storage___anyAction) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FolderComposerJoinCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes33FolderComposerParticipantJoinCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes33FolderComposerParticipantJoinCell *)sub_10032B87C(a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell_joinOperatorChanged), *(_QWORD *)&self->super.$__lazy_storage_$_buttonHorizontalMargin[OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell_joinOperatorChanged]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell_participantSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell____lazy_storage___allAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes33FolderComposerParticipantJoinCell____lazy_storage___anyAction));
}

@end
