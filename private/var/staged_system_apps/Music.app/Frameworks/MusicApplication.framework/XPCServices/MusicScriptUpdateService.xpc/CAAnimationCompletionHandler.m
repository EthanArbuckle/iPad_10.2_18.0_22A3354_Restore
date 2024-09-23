@implementation CAAnimationCompletionHandler

- (void)animationDidStart:(id)a3
{
  id v4;
  _TtC14MusicUtilities28CAAnimationCompletionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1002066B8(v4);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  _TtC14MusicUtilities28CAAnimationCompletionHandler *v7;

  v6 = a3;
  v7 = self;
  sub_100207E30(a4);

}

- (void)displayLinkFiredWithDisplayLink:(id)a3
{
  id v4;
  _TtC14MusicUtilities28CAAnimationCompletionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_100206888(v4);

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
  sub_10003A5C8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_animating), *(_QWORD *)&self->animating[OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_animating]);
  sub_10003A5C8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_completion), *(_QWORD *)&self->animating[OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_completion]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_displayLink));
}

@end
