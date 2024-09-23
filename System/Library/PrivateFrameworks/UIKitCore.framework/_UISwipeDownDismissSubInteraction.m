@implementation _UISwipeDownDismissSubInteraction

- (UIView)view
{
  return (UIView *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKit33_UISwipeDownDismissSubInteraction_view, a2);
}

- (void)setView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC5UIKit33_UISwipeDownDismissSubInteraction)init
{
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *result;

  sub_1856C0894();
  return result;
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1856C0B74(a3);

}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v7;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit33_UISwipeDownDismissSubInteraction_gesture);
  v7 = self;
  v5 = a3;
  v6 = objc_msgSend(v4, sel_view);

  if (!v6)
    objc_msgSend(v5, sel_addGestureRecognizer_, v4);
  swift_unknownObjectWeakAssign();

}

- (void)handlePan:(id)a3
{
  id v4;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_1856C0D54(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1856C1C40();

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1856C1D00(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1856C1DD8(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_1856C1EC4();
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  _TtC5UIKit33_UISwipeDownDismissSubInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_1856C1608(v4);

}

@end
