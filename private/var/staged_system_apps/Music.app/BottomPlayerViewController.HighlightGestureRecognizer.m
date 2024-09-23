@implementation BottomPlayerViewController.HighlightGestureRecognizer

- (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3, a2);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *)sub_10026430C((uint64_t)v8, (uint64_t)a4);
}

- (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer)initWithCoder:(id)a3
{
  _TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *result;

  result = (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/BottomPlayerViewController.swift", 38, 2, 1265, 0);
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *v6;

  v5 = a4;
  v6 = self;
  if (!-[BottomPlayerViewController.HighlightGestureRecognizer state](v6, "state"))
    -[BottomPlayerViewController.HighlightGestureRecognizer setState:](v6, "setState:", 1);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *v11;

  v7 = sub_10004A07C(0, (unint64_t *)&unk_1011ACB10, UITouch_ptr);
  v8 = sub_1000EA1BC((unint64_t *)&unk_1011A8EA0, (unint64_t *)&unk_1011ACB10, UITouch_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_100266BE8(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[BottomPlayerViewController.HighlightGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[BottomPlayerViewController.HighlightGestureRecognizer setState:](self, "setState:", 3, a4);
}

@end
