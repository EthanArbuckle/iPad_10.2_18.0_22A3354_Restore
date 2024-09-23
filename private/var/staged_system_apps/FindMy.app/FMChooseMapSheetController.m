@implementation FMChooseMapSheetController

- (_TtC6FindMy26FMChooseMapSheetController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy26FMChooseMapSheetController *result;

  v5 = OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_blurredBackground;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMChooseMapSheetController.FMBlurredBackgroundView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_closeButton;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 7);

  result = (_TtC6FindMy26FMChooseMapSheetController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMChooseMapSheetController.swift", 39, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy26FMChooseMapSheetController *v4;

  v4 = self;
  sub_10016B16C(a3);

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[FMChooseMapSheetController viewDidLoad](&v3, "viewDidLoad");
  sub_10016B368();
  sub_10016B594();

}

- (void)handleCloseAction
{
  -[FMChooseMapSheetController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC6FindMy26FMChooseMapSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy26FMChooseMapSheetController *result;

  v4 = a4;
  result = (_TtC6FindMy26FMChooseMapSheetController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMChooseMapSheetController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_mediator));
  sub_100024F00((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_previousSelection);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_blurredBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_closeButton));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3) == (id)1)
    return -1;
  else
    return 2;
}

@end
