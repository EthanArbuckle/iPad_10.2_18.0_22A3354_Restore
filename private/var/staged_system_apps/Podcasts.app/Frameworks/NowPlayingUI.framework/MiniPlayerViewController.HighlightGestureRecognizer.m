@implementation MiniPlayerViewController.HighlightGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_E1538(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_E3C88);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_E1538(self, (uint64_t)a2, (uint64_t)a3, a4, sub_E3D88);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[MiniPlayerViewController.HighlightGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[MiniPlayerViewController.HighlightGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (_TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer *)sub_E15E8((uint64_t)v8, (uint64_t)a4);
}

- (void).cxx_destruct
{
  sub_145A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer_handlePoint), *(_QWORD *)&self->handlePoint[OBJC_IVAR____TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer_handlePoint]);
}

@end
