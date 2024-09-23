@implementation MainToolbarController

- (TUISyncLayoutController)syncLayoutController
{
  return (TUISyncLayoutController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController));
}

- (void)setSyncLayoutController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController) = (Class)a3;
  v3 = a3;

}

- (_TtC5Books21MainToolbarController)initWithCoder:(id)a3
{
  id v5;
  _TtC5Books21MainToolbarController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books21MainToolbarController_cancellable) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books21MainToolbarController_dockedViewController, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books21MainToolbarController____lazy_storage___toolbarView) = 0;
  v5 = a3;

  result = (_TtC5Books21MainToolbarController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/MainToolbarController.swift", 33, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC5Books21MainToolbarController *v2;

  v2 = self;
  sub_1005A2C2C();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Books21MainToolbarController *v2;

  v2 = self;
  sub_1005A3220();

}

- (_TtC5Books21MainToolbarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books21MainToolbarController *result;

  v4 = a4;
  result = (_TtC5Books21MainToolbarController *)_swift_stdlib_reportUnimplementedInitializer("Books.MainToolbarController", 27, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC5Books21MainToolbarController_interactor));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC5Books21MainToolbarController_presenter));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC5Books21MainToolbarController_router));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books21MainToolbarController_cancellable));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books21MainToolbarController_dockedViewController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books21MainToolbarController_mainContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books21MainToolbarController____lazy_storage___toolbarView));
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v4;
  _TtC5Books21MainToolbarController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[MainToolbarController view](v5, "view");
  objc_msgSend(v6, "setNeedsLayout");

}

@end
