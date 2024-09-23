@implementation TTRIRemindersListScrollingController

- (_TtC9Reminders36TTRIRemindersListScrollingController)init
{
  _TtC9Reminders36TTRIRemindersListScrollingController *result;

  result = (_TtC9Reminders36TTRIRemindersListScrollingController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersListScrollingController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_extenalScrollViewDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_hostViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_treeView));
  swift_release();
  swift_release();
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_pendingStartEditingItem, &qword_1006639A0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_itemsPendingUpdate));
  swift_release();
  swift_release();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
  _TtC9Reminders36TTRIRemindersListScrollingController *v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_extenalScrollViewDelegate);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "scrollViewWillBeginDragging:") & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, "scrollViewWillBeginDragging:", v7);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC9Reminders36TTRIRemindersListScrollingController *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    sub_1004C65D4();

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC9Reminders36TTRIRemindersListScrollingController *v5;

  v4 = a3;
  v5 = self;
  sub_1004C65D4();

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC9Reminders36TTRIRemindersListScrollingController *v5;

  v4 = a3;
  v5 = self;
  sub_1004C722C((uint64_t)v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC9Reminders36TTRIRemindersListScrollingController *v5;

  v4 = a3;
  v5 = self;
  sub_1004C7338((uint64_t)v4);

}

@end
