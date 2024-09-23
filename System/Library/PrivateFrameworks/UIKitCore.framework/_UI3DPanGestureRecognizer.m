@implementation _UI3DPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1855E1AA0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1855E1774);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1855E1AA0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1855E18D0);
}

- (void)_didUpdateCentroidWithTouches:(id)a3 event:(id)a4
{
  uint64_t v6;
  id v7;
  _UI3DPanGestureRecognizer *v8;

  sub_1855E2168();
  sub_1855E21A4();
  v6 = sub_1865077EC();
  v7 = a4;
  v8 = self;
  sub_1855E21EC(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UI3DPanGestureRecognizer();
  -[UIPanGestureRecognizer _shouldTryToBeginWithEvent:](&v5, sel__shouldTryToBeginWithEvent_, a3);
  return 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1855E1BEC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1855E1BEC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_UI3DPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_UI3DPanGestureRecognizer *)sub_1855E1F6C((uint64_t)v6, (uint64_t)a4);
}

@end
