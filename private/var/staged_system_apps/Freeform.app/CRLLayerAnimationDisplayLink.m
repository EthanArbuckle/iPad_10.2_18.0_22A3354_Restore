@implementation CRLLayerAnimationDisplayLink

+ (_TtC8Freeform28CRLLayerAnimationDisplayLink)shared
{
  if (qword_1013DDEA0 != -1)
    swift_once(&qword_1013DDEA0, sub_100D29210);
  return (_TtC8Freeform28CRLLayerAnimationDisplayLink *)(id)qword_101481388;
}

- (BOOL)isRunning
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLLayerAnimationDisplayLink_displayLink);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "paused") ^ 1;
  return (char)v2;
}

- (void)startDisplayLink
{
  _TtC8Freeform28CRLLayerAnimationDisplayLink *v2;

  v2 = self;
  sub_100D292F0();

}

- (void)endDisplayLink
{
  _TtC8Freeform28CRLLayerAnimationDisplayLink *v2;

  v2 = self;
  sub_100D29604();

}

- (void)dealloc
{
  _TtC8Freeform28CRLLayerAnimationDisplayLink *v2;
  objc_super v3;

  v2 = self;
  sub_100D29604();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CRLLayerAnimationDisplayLink();
  -[CRLLayerAnimationDisplayLink dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1004C1024(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLLayerAnimationDisplayLink_completionHandler), *(_QWORD *)&self->displayLinkAnimations[OBJC_IVAR____TtC8Freeform28CRLLayerAnimationDisplayLink_completionHandler]);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform28CRLLayerAnimationDisplayLink)init
{
  return (_TtC8Freeform28CRLLayerAnimationDisplayLink *)sub_100D2A500();
}

@end
