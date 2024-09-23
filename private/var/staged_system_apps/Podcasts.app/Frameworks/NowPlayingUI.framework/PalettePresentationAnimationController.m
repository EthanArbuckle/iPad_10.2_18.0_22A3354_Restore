@implementation PalettePresentationAnimationController

- (_TtC12NowPlayingUI38PalettePresentationAnimationController)init
{
  _TtC12NowPlayingUI38PalettePresentationAnimationController *result;

  result = (_TtC12NowPlayingUI38PalettePresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.PalettePresentationAnimationController", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC12NowPlayingUI38PalettePresentationAnimationController_completionBlocks]);
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  uint64_t v5;
  _TtC12NowPlayingUI38PalettePresentationAnimationController *v6;
  id v7;
  objc_super v9;

  v5 = *(_QWORD *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC12NowPlayingUI38PalettePresentationAnimationController_ascentDescentAnimator];
  swift_unknownObjectRetain(a3);
  v6 = self;
  if (!v5)
    sub_5F144(a3);
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for PalettePresentationAnimationController();
  v7 = -[PalettePresentationAnimationController interruptibleAnimatorForTransition:](&v9, "interruptibleAnimatorForTransition:", a3);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (void)animationEnded:(BOOL)a3
{
  _TtC12NowPlayingUI38PalettePresentationAnimationController *v4;

  v4 = self;
  sub_607D8(a3);

}

@end
