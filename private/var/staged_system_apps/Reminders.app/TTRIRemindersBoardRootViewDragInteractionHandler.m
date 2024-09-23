@implementation TTRIRemindersBoardRootViewDragInteractionHandler

- (_TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler)init
{
  objc_class *ObjectType;
  char *v4;
  double v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (char *)self + OBJC_IVAR____TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler_delegate;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v5 = swift_unknownObjectWeakInit(v4, 0).n128_u64[0];
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRIRemindersBoardRootViewDragInteractionHandler init](&v7, "init", v5);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler_delegate);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  _TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler *v7;
  _QWORD *v8;
  Class isa;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100441964((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  sub_100041E10();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  uint64_t Strong;
  uint64_t v10;
  id v11;
  id v12;
  _TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler *v13;
  id v14;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler_delegate);
  if (Strong)
  {
    v10 = Strong;
    v11 = a3;
    v12 = a4;
    swift_unknownObjectRetain(a5);
    v13 = self;
    v14 = sub_100041C6C();

    swift_unknownObjectRelease(a5);
    swift_unknownObjectRelease(v10);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end
