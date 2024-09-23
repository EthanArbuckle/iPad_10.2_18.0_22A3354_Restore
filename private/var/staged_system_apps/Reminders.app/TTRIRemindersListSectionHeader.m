@implementation TTRIRemindersListSectionHeader

- (_TtC9Reminders30TTRIRemindersListSectionHeader)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _TtC9Reminders30TTRIRemindersListSectionHeader *result;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  sub_1001E3118(v3, v4);
  return result;
}

- (_TtC9Reminders30TTRIRemindersListSectionHeader)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001E48B8();
}

- (BOOL)floating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIRemindersListSectionHeader floating](&v3, "floating");
}

- (void)setFloating:(BOOL)a3
{
  _TtC9Reminders30TTRIRemindersListSectionHeader *v4;

  v4 = self;
  sub_1001E3D7C(a3, (uint64_t)v4);

}

- (void)didTap:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC9Reminders30TTRIRemindersListSectionHeader *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_1002D0560((uint64_t)v8);

    swift_unknownObjectRelease(v6);
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_1001E41BC);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_1001E43BC);
}

- (void)setAccessibilityHint:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC9Reminders30TTRIRemindersListSectionHeader *v8;
  _TtC9Reminders30TTRIRemindersListSectionHeader *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[TTRIRemindersListSectionHeader setAccessibilityHint:](&v10, "setAccessibilityHint:", a3);

}

- (void).cxx_destruct
{
  _BYTE v3[128];

  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_delegate);
  sub_10003E0EC((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_title, (uint64_t)v3);
  sub_100171C68((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_100171CCC);
  sub_1001E49E4((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_sectionID);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titlesContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titlesTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titlesBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_topSeparatorLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_contentViewBottomToTopSeparatorBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_tapGestureRecognizer));
}

@end
