@implementation TTRIRemindersListToolbarController

- (void)newReminderAction:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];

  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    swift_retain();
  }
  Strong = swift_unknownObjectWeakLoadStrong(self->delegate);
  if (Strong)
  {
    v7 = Strong;
    sub_10029A350(Strong, v6);
    swift_release();
    swift_unknownObjectRelease(v7);
  }
  else
  {
    swift_release();
  }
  sub_1000073A0((uint64_t)v8, &qword_100640E50);
}

- (void)toolbarFileGroceryRadar:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  _QWORD v10[3];
  uint64_t v11;
  _OWORD v12[2];

  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    swift_retain();
  }
  Strong = swift_unknownObjectWeakLoadStrong(self->delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *(_QWORD *)(Strong + OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter + 8);
    ObjectType = swift_getObjectType(*(_QWORD *)(Strong + OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter), v6);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v8 + 768))(v10, ObjectType, v8);
    if (v11)
    {
      sub_10001413C(v10, v11);
      sub_100444358();
      sub_100027F10(v10);
    }
    else
    {
      sub_1000073A0((uint64_t)v10, &qword_10064E848);
    }
    swift_release();
    swift_unknownObjectRelease(v7);
  }
  else
  {
    swift_release();
  }
  sub_1000073A0((uint64_t)v12, &qword_100640E50);
}

@end
