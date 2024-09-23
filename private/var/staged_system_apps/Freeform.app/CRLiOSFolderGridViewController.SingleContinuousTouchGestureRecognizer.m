@implementation CRLiOSFolderGridViewController.SingleContinuousTouchGestureRecognizer

- (_TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer *)sub_100B9D38C((uint64_t)v8, (uint64_t)a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer *v11;

  v7 = sub_1004B8930(0, &qword_101407270, UITouch_ptr);
  v8 = sub_1005A15B8(&qword_101407278, &qword_101407270, UITouch_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_100B9D54C(v9, (uint64_t)v10);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[CRLiOSFolderGridViewController.SingleContinuousTouchGestureRecognizer setState:](self, "setState:", 2, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[CRLiOSFolderGridViewController.SingleContinuousTouchGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[CRLiOSFolderGridViewController.SingleContinuousTouchGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (void)reset
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer_trackedTouch);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer_trackedTouch) = 0;

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer_trackedTouch));
}

@end
