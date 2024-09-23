@implementation PalettePresentationAnimationController

- (_TtC5Music38PalettePresentationAnimationController)init
{
  _TtC5Music38PalettePresentationAnimationController *result;

  result = (_TtC5Music38PalettePresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer("Music.PalettePresentationAnimationController", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Music38PalettePresentationAnimationController_completionBlocks]);
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  unsigned __int8 v5;
  _TtC5Music38PalettePresentationAnimationController *v6;
  id v7;
  objc_super v9;

  v5 = self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Music38PalettePresentationAnimationController_isPrepared];
  swift_unknownObjectRetain(a3, a2);
  v6 = self;
  if ((v5 & 1) == 0)
    sub_100556D50(a3);
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for PalettePresentationAnimationController();
  v7 = -[PalettePresentationAnimationController interruptibleAnimatorForTransition:](&v9, "interruptibleAnimatorForTransition:", a3);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (void)animationEnded:(BOOL)a3
{
  _TtC5Music38PalettePresentationAnimationController *v4;

  v4 = self;
  sub_10055857C(a3);

}

@end
