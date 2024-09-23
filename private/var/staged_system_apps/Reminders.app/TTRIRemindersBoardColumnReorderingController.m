@implementation TTRIRemindersBoardColumnReorderingController

- (_TtC9Reminders44TTRIRemindersBoardColumnReorderingController)init
{
  _TtC9Reminders44TTRIRemindersBoardColumnReorderingController *result;

  result = (_TtC9Reminders44TTRIRemindersBoardColumnReorderingController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersBoardColumnReorderingController", 54, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_collectionView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_debugOverlayView));
  swift_release();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  _TtC9Reminders44TTRIRemindersBoardColumnReorderingController *v7;
  _QWORD *v8;
  Class isa;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_10024B664(a4);

  swift_unknownObjectRelease(a4);
  sub_100005ED8(0, (unint64_t *)&qword_100650570, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return 0;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8;
  _TtC9Reminders44TTRIRemindersBoardColumnReorderingController *v9;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_10024BBE4(a5);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);

}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC9Reminders44TTRIRemindersBoardColumnReorderingController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v5 = sub_10002A750(&qword_100649BA0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_100249F34(2u);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = swift_allocObject(&unk_1005F8E28, 24, 7);
  swift_unknownObjectWeakInit(v11 + 16, v9);
  type metadata accessor for MainActor(0);
  v12 = swift_retain();
  v13 = static MainActor.shared.getter(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_1005F8E50, 40, 7);
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v11;
  swift_release();
  sub_1001B9C04((uint64_t)v7, (uint64_t)&unk_1006505A8, (uint64_t)v14);

  swift_release();
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  id v6;
  _TtC9Reminders44TTRIRemindersBoardColumnReorderingController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10024C114(a4);

  swift_unknownObjectRelease(a4);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  _TtC9Reminders44TTRIRemindersBoardColumnReorderingController *v9;

  swift_getObjectType(a4, a2);
  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = self;
  if (sub_10024B3EC(a4, (uint64_t)v9))
    sub_100249F34(5u);
  sub_100249F34(6u);

  swift_unknownObjectRelease(a4);
}

@end
