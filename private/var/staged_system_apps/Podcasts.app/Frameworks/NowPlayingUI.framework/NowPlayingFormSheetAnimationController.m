@implementation NowPlayingFormSheetAnimationController

- (id)interruptibleAnimatorForTransition:(id)a3
{
  _TtC12NowPlayingUI38NowPlayingFormSheetAnimationController *v5;
  void *v6;
  void *v7;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_5E300(a3);
  v7 = v6;
  swift_unknownObjectRelease(a3);

  return v7;
}

- (void)animationEnded:(BOOL)a3
{
  _BOOL8 v3;
  _TtC12NowPlayingUI38NowPlayingFormSheetAnimationController *v4;

  v3 = a3;
  v4 = self;
  sub_5EFF8(v3);

}

- (_TtC12NowPlayingUI38NowPlayingFormSheetAnimationController)init
{
  _TtC12NowPlayingUI38NowPlayingFormSheetAnimationController *result;

  result = (_TtC12NowPlayingUI38NowPlayingFormSheetAnimationController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingFormSheetAnimationController", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC12NowPlayingUI38NowPlayingFormSheetAnimationController_completionBlocks]);
}

@end
