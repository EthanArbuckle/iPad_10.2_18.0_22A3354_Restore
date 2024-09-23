@implementation CRLiOSAlignmentToolsController

- (_TtC8Freeform30CRLiOSAlignmentToolsController)initWithDelegate:(id)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController_delegate);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign(v5, a3);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLiOSAlignmentToolsController();
  return -[CRLiOSAlignmentToolsController init](&v7, "init");
}

- (UIViewController)viewController
{
  _TtC8Freeform30CRLiOSAlignmentToolsController *v2;
  id v3;

  v2 = self;
  v3 = sub_1005ED6B8();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController) = (Class)a3;
  v3 = a3;

}

- (void)dismissAlignmentTools
{
  uint64_t Strong;
  void *v4;
  _TtC8Freeform30CRLiOSAlignmentToolsController *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "alignmentToolsControllerShouldDismiss:", v5);

    swift_unknownObjectRelease(v4);
  }
}

- (_TtC8Freeform30CRLiOSAlignmentToolsController)init
{
  _TtC8Freeform30CRLiOSAlignmentToolsController *result;

  result = (_TtC8Freeform30CRLiOSAlignmentToolsController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSAlignmentToolsController", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController));
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC8Freeform30CRLiOSAlignmentToolsController *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "userDismissedAlignmentToolsController:", v8);

    swift_unknownObjectRelease(v6);
  }
}

@end
