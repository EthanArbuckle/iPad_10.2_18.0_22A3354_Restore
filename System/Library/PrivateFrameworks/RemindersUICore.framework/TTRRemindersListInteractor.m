@implementation TTRRemindersListInteractor

- (_TtC15RemindersUICore26TTRRemindersListInteractor)init
{
  _TtC15RemindersUICore26TTRRemindersListInteractor *result;

  result = (_TtC15RemindersUICore26TTRRemindersListInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_delegate);
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_optimisticUpdatesDelegate);

  sub_1B42847E4(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_defaultListType));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_committer);
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_fixedUndoContext, &qword_1ED4E8C60);
  swift_release();
}

- (OS_dispatch_queue)callbackQueue
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC15RemindersUICore26TTRRemindersListInteractor *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B4906764();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B41DF50C(0, (unint64_t *)&qword_1ED4EE3F0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF548], v3);
  v7 = self;
  v8 = (void *)sub_1B4907544();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (OS_dispatch_queue *)v8;
}

- (void)notifyEventFromSaveRequest:(id)a3
{
  uint64_t v4;
  _TtC15RemindersUICore26TTRRemindersListInteractor *v5;

  sub_1B41DF50C(0, &qword_1ED4E6358);
  sub_1B420B458(&qword_1EF09BA68, &qword_1ED4E6358);
  v4 = sub_1B49070AC();
  v5 = self;
  TTRRemindersListInteractor.notifyEvent(fromSaveRequest:)(v4);

  swift_bridgeObjectRelease();
}

@end
