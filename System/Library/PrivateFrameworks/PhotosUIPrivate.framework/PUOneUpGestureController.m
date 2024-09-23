@implementation PUOneUpGestureController

- (PUOneUpGestureController)initWithView:(id)a3 actionsController:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (PUOneUpGestureController *)OneUpGestureController.init(view:actionsController:)(v5, (uint64_t)a4);
}

- (PUOneUpGestureControllerDelegate)delegate
{
  return (PUOneUpGestureControllerDelegate *)(id)sub_1AAC3F628();
}

- (void)setDelegate:(id)a3
{
  PUOneUpGestureController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC3F6B4();

}

- (UIEdgeInsets)interactionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_1AAC3F828();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInteractionInsets:(UIEdgeInsets)a3
{
  sub_1AAC3F888(a3.top, a3.left, a3.bottom, a3.right);
}

- (UIView)view
{
  return (UIView *)OneUpGestureController.view.getter();
}

- (void)cancelGestures
{
  PUOneUpGestureController *v2;

  v2 = self;
  sub_1AAC3F9B0();

}

- (void)handleTapWithRecognizer:(id)a3
{
  id v4;
  PUOneUpGestureController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC3FA24(v4);

}

- (void)handleDoubleTapWithRecognizer:(id)a3
{
  id v4;
  PUOneUpGestureController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC3FAFC(v4);

}

- (PUOneUpGestureController)init
{
  OneUpGestureController.init()();
}

- (void).cxx_destruct
{
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUOneUpGestureController_delegate);

  swift_unknownObjectRelease();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIGestureRecognizer *v4;
  PUOneUpGestureController *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  OneUpGestureController.gestureRecognizerShouldBegin(_:)(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIGestureRecognizer *v6;
  id v7;
  PUOneUpGestureController *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = a4;
  v8 = self;
  v9 = OneUpGestureController.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  UIGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  PUOneUpGestureController *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  v9 = OneUpGestureController.gestureRecognizer(_:shouldBeRequiredToFailBy:)(v6, v7);

  return v9;
}

@end
