@implementation TTRIListDetailContainerViewController

- (_TtC9Reminders37TTRIListDetailContainerViewController)initWithCoder:(id)a3
{
  _TtC9Reminders37TTRIListDetailContainerViewController *result;

  result = (_TtC9Reminders37TTRIListDetailContainerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIListDetailContainerViewController.swift", 53, 2, 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders37TTRIListDetailContainerViewController_presenter));
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC9Reminders37TTRIListDetailContainerViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1003F3468();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC9Reminders37TTRIListDetailContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003F36D8();

}

@end
