@implementation TTRIListSharingParticipantCell

- (void)awakeFromNib
{
  uint64_t v2;
  _TtC9Reminders30TTRIListSharingParticipantCell *v3;

  v3 = self;
  sub_100466FE4((uint64_t)v3, v2);

}

- (UIView)avatarContainerView
{
  return (UIView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_avatarContainerView);
}

- (void)setAvatarContainerView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_avatarContainerView, a3);
}

- (UILabel)mainLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_mainLabel);
}

- (void)setMainLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_mainLabel, a3);
}

- (UILabel)detailLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_detailLabel);
}

- (void)setDetailLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_detailLabel, a3);
}

- (_TtC9Reminders30TTRIListSharingParticipantCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders30TTRIListSharingParticipantCell *)sub_1004672E4(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders30TTRIListSharingParticipantCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders30TTRIListSharingParticipantCell *)sub_100467408(v3, v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_avatarContainerView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_mainLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_detailLabel);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_avatarViewController));
}

@end
