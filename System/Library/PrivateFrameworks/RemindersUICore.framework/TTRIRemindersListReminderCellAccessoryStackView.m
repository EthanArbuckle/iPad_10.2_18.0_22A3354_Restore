@implementation TTRIRemindersListReminderCellAccessoryStackView

- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *)sub_1B45557C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_viewModel;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *((_QWORD *)v5 + 5) = 1;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((_OWORD *)v5 + 15) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 17) = 0u;
  *((_OWORD *)v5 + 18) = 0u;
  *((_OWORD *)v5 + 19) = 0u;
  *((_OWORD *)v5 + 20) = 0u;
  v6 = a3;

  result = (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_class *v4;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *v9;
  UIEvent_optional v11;

  v4 = (objc_class *)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = NUIContainerView.ttr_pointIncludingExpandedHitTestInsets(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (UIView)viewForFirstBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_subtaskCountLabel));
}

- (void)assigneeViewAction:(id)a3
{
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *v4;
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  _OWORD v12[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v5 = self;
  }
  v6 = MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate);
  if (v6)
  {
    v7 = v6;
    v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_assigneeView);
    v9 = v6 + direct field offset for TTRIRemindersListReminderCell.delegate;
    swift_beginAccess();
    if (MEMORY[0x1B5E3D8DC](v9))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, v8, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {

    }
    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B41EA560((uint64_t)v12, &qword_1ED4ED170);
}

- (void)infoButtonAction:(id)a3
{
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *v4;
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B4556214();

  sub_1B41EA560((uint64_t)v6, &qword_1ED4ED170);
}

- (void)appLinkButtonAction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *v12;

  v5 = MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate, a2);
  if (v5)
  {
    v6 = v5;
    v7 = v5 + direct field offset for TTRIRemindersListReminderCell.delegate;
    swift_beginAccess();
    if (MEMORY[0x1B5E3D8DC](v7))
    {
      v8 = *(_QWORD *)(v7 + 8);
      ObjectType = swift_getObjectType();
      v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
      v11 = a3;
      v12 = self;
      v10(v6, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithArrangedSubviews:(id)a3
{
  _TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *result;

  result = (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate);
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_viewModel, &qword_1ED4E54F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_flaggedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_subtaskCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_subtaskDisclosure));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_appLinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_assigneeView));
}

@end
