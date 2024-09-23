@implementation FMPauseNotificationsViewController

- (_TtC6FindMy34FMPauseNotificationsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10036F924();
}

- (void)viewDidLoad
{
  _TtC6FindMy34FMPauseNotificationsViewController *v2;

  v2 = self;
  sub_10036C7C4();

}

- (void)dateChanged
{
  _TtC6FindMy34FMPauseNotificationsViewController *v2;

  v2 = self;
  sub_10036DBC8();

}

- (void)cancelAction
{
  -[FMPauseNotificationsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)doneAction
{
  _TtC6FindMy34FMPauseNotificationsViewController *v2;

  v2 = self;
  sub_10036E964();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_personDetailDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_datePicker));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_selectedDate, (uint64_t *)&unk_1005D3320);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_pauseSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_calendarSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_pausedUntilView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_resumeNotificationMessageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_dateFormatter));
}

@end
