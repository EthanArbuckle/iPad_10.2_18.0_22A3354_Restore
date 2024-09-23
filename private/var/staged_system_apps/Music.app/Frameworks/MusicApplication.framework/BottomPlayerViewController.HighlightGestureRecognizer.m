@implementation BottomPlayerViewController.HighlightGestureRecognizer

- (_TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer *)sub_A74910((uint64_t)v8, (uint64_t)a4);
}

- (_TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer)initWithCoder:(id)a3
{
  _TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer *result;

  result = (_TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/BottomPlayerViewController.swift", 49, 2, 1265, 0);
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  if (!-[BottomPlayerViewController.HighlightGestureRecognizer state](v7, "state"))
    -[BottomPlayerViewController.HighlightGestureRecognizer setState:](v7, "setState:", 1);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtCC16MusicApplication26BottomPlayerViewControllerP33_F3CFCB09D4B6141268559BF18129F8E826HighlightGestureRecognizer *v11;

  v7 = sub_4E684(0, &qword_14BA9F0, UITouch_ptr);
  v8 = sub_950D0((unint64_t *)&qword_14F3210, &qword_14BA9F0, UITouch_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_A77CEC();

  swift_bridgeObjectRelease();
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
