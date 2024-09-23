@implementation TTRIBoardReminderCellContentView

- (void)layoutSubviews
{
  _TtC9Reminders32TTRIBoardReminderCellContentView *v2;

  v2 = self;
  sub_1003F6BA0();

}

- (void)didPressAssigneeIndicator:(id)a3
{
  _TtC9Reminders32TTRIBoardReminderCellContentView *v3;
  _TtC9Reminders32TTRIBoardReminderCellContentView *v5;
  _TtC9Reminders32TTRIBoardReminderCellContentView *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(void);
  uint64_t v11;
  _TtC9Reminders32TTRIBoardReminderCellContentView *v12;
  char v13[24];
  _OWORD v14[2];

  v3 = self;
  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v14);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v6 = self;
  }
  v7 = &v3->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_appliedConfiguration];
  swift_beginAccess(&v3->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_appliedConfiguration], v13, 0, 0);
  v8 = type metadata accessor for TTRIBoardReminderCellContentConfiguration(0);
  if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8) == 1)
  {
    __break(1u);
  }
  else
  {
    v9 = (char *)&v7[*(int *)(v8 + 104)];
    v10 = (void (*)(void))*((_QWORD *)v9 + 3);
    if (v10)
    {
      v11 = *((_QWORD *)v9 + 4);
      swift_retain();
      v12 = (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1003F79F8();
      v10();
      sub_1000381B8((uint64_t)v10, v11);

      v3 = v12;
    }

    sub_1000073A0((uint64_t)v14, &qword_100640E50);
  }
}

- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1003FBF8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithArrangedSubviews:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  }
  else
  {
    v5 = 0;
  }
  return (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1003FC254(v5, (uint64_t)a2);
}

- (_TtC9Reminders32TTRIBoardReminderCellContentView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders32TTRIBoardReminderCellContentView *)sub_1003FC570(v3, v4);
}

- (void).cxx_destruct
{

  swift_release();
  sub_1000073A0((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_titleModuleState], &qword_10065A3E8);
  sub_1000073A0((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_notesModuleState], &qword_10065A410);
  sub_1000073A0((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_autoCompleteModuleState], &qword_10065A468);
  swift_release();

  sub_1000073A0((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders32TTRIBoardReminderCellContentView_appliedConfiguration], &qword_10064CB10);
}

@end
