@implementation CAAnimationCompletionHandler

- (void)animationDidStart:(id)a3
{
  id v4;
  _TtC14MusicUtilities28CAAnimationCompletionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1002A6824(v4);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  _TtC14MusicUtilities28CAAnimationCompletionHandler *v7;

  v6 = a3;
  v7 = self;
  sub_1002A7F9C(a4);

}

- (void)displayLinkFiredWithDisplayLink:(id)a3
{
  id v4;
  _TtC14MusicUtilities28CAAnimationCompletionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1002A69F4(v4);

}

- (_TtC14MusicUtilities28CAAnimationCompletionHandler)init
{
  _TtC14MusicUtilities28CAAnimationCompletionHandler *result;

  result = (_TtC14MusicUtilities28CAAnimationCompletionHandler *)_swift_stdlib_reportUnimplementedInitializer("MusicUtilities.CAAnimationCompletionHandler", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000DB26C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_animating), *(_QWORD *)&self->animating[OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_animating]);
  sub_1000DB26C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_completion), *(_QWORD *)&self->animating[OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_completion]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_displayLink));
}

@end
