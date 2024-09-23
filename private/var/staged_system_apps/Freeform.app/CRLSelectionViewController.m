@implementation CRLSelectionViewController

- (NSArray)decoratorOverlayRenderables
{
  sub_1004B8930(0, (unint64_t *)&qword_1013EE6D0, off_101229820);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (NSArray)decoratorOverlayViews
{
  _TtC8Freeform26CRLSelectionViewController *v2;
  double *v3;
  Class isa;

  v2 = self;
  v3 = sub_100704F8C();

  sub_1004B8930(0, (unint64_t *)&qword_1013DFC10, UIView_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC8Freeform26CRLSelectionViewController)init
{
  _TtC8Freeform26CRLSelectionViewController *result;

  result = (_TtC8Freeform26CRLSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSelectionViewController", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform26CRLSelectionViewController_editor);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLSelectionViewController_rotatedOverlayView));
}

@end
