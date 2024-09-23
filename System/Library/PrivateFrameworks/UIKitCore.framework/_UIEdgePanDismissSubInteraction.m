@implementation _UIEdgePanDismissSubInteraction

- (UIView)view
{
  return (UIView *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKit31_UIEdgePanDismissSubInteraction_view, a2);
}

- (void)setView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC5UIKit31_UIEdgePanDismissSubInteraction)init
{
  return (_TtC5UIKit31_UIEdgePanDismissSubInteraction *)sub_185724588();
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_185724734(a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_185724864(a3);

}

- (void)handlePan:(id)a3
{
  id v4;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_185724974(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_185725130();

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_185724DCC(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1857251F0(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5UIKit31_UIEdgePanDismissSubInteraction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1857253B0();

  return self & 1;
}

@end
