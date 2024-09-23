@implementation LemonadeExpandableCuratedLibraryGestureController.ScrollPreventingGestureRecognizer

- (_TtCC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureControllerP33_E3901C8F98555C3FCE5FB883138BF40E33ScrollPreventingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1A7AE46D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureControllerP33_E3901C8F98555C3FCE5FB883138BF40E33ScrollPreventingGestureRecognizer *)sub_1A69C8FC4((uint64_t)v6, (uint64_t)a4);
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v5;
  _TtCC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureControllerP33_E3901C8F98555C3FCE5FB883138BF40E33ScrollPreventingGestureRecognizer *v6;
  _QWORD v7[6];

  sub_1A7AE3B9C();
  v7[2] = a3;
  v7[3] = self;
  v5 = a3;
  v6 = self;
  sub_1A69C9194((void (*)(void))sub_1A69C97D0, (uint64_t)v7);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[LemonadeExpandableCuratedLibraryGestureController.ScrollPreventingGestureRecognizer setState:](self, sel_setState_, 1, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[LemonadeExpandableCuratedLibraryGestureController.ScrollPreventingGestureRecognizer setState:](self, sel_setState_, 2, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[LemonadeExpandableCuratedLibraryGestureController.ScrollPreventingGestureRecognizer setState:](self, sel_setState_, 3, a4);
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v4;
  _TtCC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureControllerP33_E3901C8F98555C3FCE5FB883138BF40E33ScrollPreventingGestureRecognizer *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A69C93D4(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtCC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureControllerP33_E3901C8F98555C3FCE5FB883138BF40E33ScrollPreventingGestureRecognizer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1A69C9730(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
