@implementation TTRIRemindersCommonPresenter

- (void)dismissViewContact:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
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
  Strong = (void *)swift_unknownObjectWeakLoadStrong(*(_QWORD *)self->router + 16);
  if (Strong
    && (v6 = Strong,
        v7 = objc_msgSend(Strong, "presentedViewController"),
        v6,
        v7))
  {
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
    swift_release();

  }
  else
  {
    swift_release();
  }
  sub_1000073A0((uint64_t)v8, &qword_100640E50);
}

- (void)willNavigateTo
{
  swift_retain();
  sub_100167374();
  swift_release();
}

- (void)representedListWasDeleted
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(_QWORD *, _QWORD, uint64_t, uint64_t);
  _QWORD v9[5];

  Strong = swift_unknownObjectWeakLoadStrong(&self->moduleDelegate[7]);
  if (Strong)
  {
    v5 = Strong;
    v6 = *(_QWORD *)&self->moduleDelegate[15];
    ObjectType = swift_getObjectType(Strong, v4);
    v9[3] = type metadata accessor for TTRIRemindersCommonPresenter(0);
    v9[4] = &off_1005F31C8;
    v9[0] = self;
    v8 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v6 + 16);
    swift_retain_n(self, 2);
    v8(v9, 0, ObjectType, v6);
    swift_unknownObjectRelease(v5);
    sub_100027F10(v9);
    swift_release();
  }
}

@end
