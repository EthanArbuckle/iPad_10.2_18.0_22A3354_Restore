@implementation CardContainerController

- (void)caDisplayLinkCallback
{
  _TtC7Measure23CardContainerController *v2;

  v2 = self;
  sub_100184880();

}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7Measure23CardContainerController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  sub_100185770();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[CardContainerController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Measure23CardContainerController_containerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Measure23CardContainerController_containerTopConstraint));

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure23CardContainerController_otherGesture, v3);
  v4 = (char *)self + OBJC_IVAR____TtC7Measure23CardContainerController__lockingState;
  v5 = sub_10000EDC8(&qword_100487EB8);
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6((char *)self + OBJC_IVAR____TtC7Measure23CardContainerController__animationLockingState, v5);
  swift_release();
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC7Measure23CardContainerController_panGestureRecognizer);
}

- (void)handlePanGestureWithSender:(id)a3
{
  char *v4;
  _TtC7Measure23CardContainerController *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_1001867E8(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure23CardContainerController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001878CC(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure23CardContainerController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100187A68(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  v5 = objc_opt_self(UIPanGestureRecognizer);
  v6 = (void *)swift_dynamicCastObjCClass(a3, v5);
  if (!v6)
    return 1;
  objc_msgSend(v6, "velocityInView:", *(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure23CardContainerController_containerView)+ OBJC_IVAR____TtC7Measure17CardContainerView_draggableView));
  return fabs(v8) < fabs(v7);
}

- (_TtC7Measure23CardContainerController)init
{
  _TtC7Measure23CardContainerController *result;

  result = (_TtC7Measure23CardContainerController *)_swift_stdlib_reportUnimplementedInitializer("Measure.CardContainerController", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
