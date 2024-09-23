@implementation PalettePresentationAnimationController

- (_TtC16MusicApplication38PalettePresentationAnimationController)init
{
  _TtC16MusicApplication38PalettePresentationAnimationController *result;

  result = (_TtC16MusicApplication38PalettePresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PalettePresentationAnimationController", 55, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC16MusicApplication38PalettePresentationAnimationController_completionBlocks]);
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  unsigned __int8 v5;
  _TtC16MusicApplication38PalettePresentationAnimationController *v6;
  id v7;
  objc_super v9;

  v5 = self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC16MusicApplication38PalettePresentationAnimationController_isPrepared];
  swift_unknownObjectRetain(a3);
  v6 = self;
  if ((v5 & 1) == 0)
    sub_18AE68(a3);
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for PalettePresentationAnimationController();
  v7 = -[PalettePresentationAnimationController interruptibleAnimatorForTransition:](&v9, "interruptibleAnimatorForTransition:", a3);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (void)animationEnded:(BOOL)a3
{
  _TtC16MusicApplication38PalettePresentationAnimationController *v4;

  v4 = self;
  sub_18C690(a3);

}

@end
