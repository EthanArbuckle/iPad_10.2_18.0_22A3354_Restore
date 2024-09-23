@implementation TTRIRemindersListEditableSectionNameViewController

- (_TtC9Reminders50TTRIRemindersListEditableSectionNameViewController)init
{
  _TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *result;

  result = (_TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersListEditableSectionNameViewController", 60, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_nameTextView));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_ttriAccessibilityViewToFocusWhenEditingEnds);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_previousTextColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_previousText]);
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  _TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100415D0C();

  return v6 & 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001CE214(v4, (uint64_t)v5);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  id v14;
  _TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  id v21;
  _TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *v22;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  if (v7 == 10 && v8 == 0xE100000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, 10, 0xE100000000000000, 0) & 1) != 0)
  {
    v10 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter];
    ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter), v8);
    v12 = *(_QWORD *)(v10 + 8);
    v13 = *(void (**)(uint64_t, uint64_t))(v12 + 32);
    v14 = a3;
    v15 = self;
    v13(ObjectType, v12);
    v16 = 0;
  }
  else
  {
    v17 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter];
    v18 = swift_getObjectType(*(Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC9Reminders50TTRIRemindersListEditableSectionNameViewController_presenter), v8);
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(void (**)(uint64_t, uint64_t))(v19 + 24);
    v21 = a3;
    v22 = self;
    v20(v18, v19);
    v16 = 1;
  }

  swift_bridgeObjectRelease(v9);
  return v16;
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtC9Reminders50TTRIRemindersListEditableSectionNameViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001CE4D0(v4);

}

@end
