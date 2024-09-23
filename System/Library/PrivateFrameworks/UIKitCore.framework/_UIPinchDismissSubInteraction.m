@implementation _UIPinchDismissSubInteraction

- (UIView)view
{
  return (UIView *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKit29_UIPinchDismissSubInteraction_view, a2);
}

- (void)setView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC5UIKit29_UIPinchDismissSubInteraction)init
{
  return (_TtC5UIKit29_UIPinchDismissSubInteraction *)sub_1857A7198();
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC5UIKit29_UIPinchDismissSubInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1857A730C(a3);

}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _TtC5UIKit29_UIPinchDismissSubInteraction *v7;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit29_UIPinchDismissSubInteraction_gesture);
  v7 = self;
  v5 = a3;
  v6 = objc_msgSend(v4, sel_view);

  if (!v6)
    objc_msgSend(v5, sel_addGestureRecognizer_, v4);
  swift_unknownObjectWeakAssign();

}

- (void)handlePinch:(id)a3
{
  id v4;
  _TtC5UIKit29_UIPinchDismissSubInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_1857A74EC(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5UIKit29_UIPinchDismissSubInteraction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1857A9F94();

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit29_UIPinchDismissSubInteraction *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  if (!objc_msgSend(v7, sel__isGestureType_, 19)
    || (v9 = objc_msgSend(v7, sel_view)) == 0)
  {

LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  v10 = v9;
  objc_opt_self();
  v11 = (void *)swift_dynamicCastObjCClass();
  if (!v11)
  {

    goto LABEL_6;
  }
  v12 = v11;
  objc_msgSend(v11, sel_zoomScale);
  v14 = v13;
  objc_msgSend(v12, sel_minimumZoomScale);
  v16 = v15;

  v17 = v14 <= v16;
LABEL_7:

  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit29_UIPinchDismissSubInteraction *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1857AA100(v6, v7);

  return v9 & 1;
}

@end
