@implementation LemonadeExpandableCuratedLibraryGestureController

- (_TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController)init
{
  return (_TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController *)sub_1A69C82C0();
}

- (void)dealloc
{
  _TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController *v2;

  v2 = self;
  sub_1A69C86B8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController_scrollPreventingGestureRecognizer));
}

- (void)handlePanWithGesture:(id)a3
{
  id v4;
  _TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController *v5;

  v4 = a3;
  v5 = self;
  sub_1A69C8B00(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController *v8;
  id v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = objc_msgSend(v7, sel_px_isPanGestureRecognizerOfScrollView_, v11);
  v9 = v11[0];

  return (char)a4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A69C8DDC(v4);

  return self & 1;
}

@end
