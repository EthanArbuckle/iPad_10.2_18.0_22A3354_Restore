@implementation LyricsSharingAnimationController

- (id)interruptibleAnimatorForTransition:(id)a3
{
  unsigned __int8 v5;
  _TtC16MusicApplication32LyricsSharingAnimationController *v6;
  id v7;
  objc_super v9;

  v5 = self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC16MusicApplication32LyricsSharingAnimationController_didPrepareAnimations];
  swift_unknownObjectRetain(a3);
  v6 = self;
  if ((v5 & 1) == 0)
    sub_994BC0(a3);
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for LyricsSharingAnimationController();
  v7 = -[LyricsSharingAnimationController interruptibleAnimatorForTransition:](&v9, "interruptibleAnimatorForTransition:", a3);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (_TtC16MusicApplication32LyricsSharingAnimationController)init
{
  _TtC16MusicApplication32LyricsSharingAnimationController *result;

  result = (_TtC16MusicApplication32LyricsSharingAnimationController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LyricsSharingAnimationController", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
