@implementation TTRISearchResultContainerViewController

- (_TtC9Reminders39TTRISearchResultContainerViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  char *v5;
  id v6;
  _TtC9Reminders39TTRISearchResultContainerViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultViewController);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultModuleInterface;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = a3;

  result = (_TtC9Reminders39TTRISearchResultContainerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRISearchResultContainerViewController.swift", 55, 2, 32, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders39TTRISearchResultContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders39TTRISearchResultContainerViewController *result;

  v4 = a4;
  result = (_TtC9Reminders39TTRISearchResultContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRISearchResultContainerViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100027F10((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultViewPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultViewController));
  sub_100435CCC((uint64_t)self + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultModuleInterface);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC9Reminders39TTRISearchResultContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100435B04();

}

@end
