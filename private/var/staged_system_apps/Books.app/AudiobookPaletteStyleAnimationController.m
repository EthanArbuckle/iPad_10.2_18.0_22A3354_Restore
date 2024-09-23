@implementation AudiobookPaletteStyleAnimationController

+ (id)paletteStyleOpenAnimatorWithInteraction:(id)a3 traits:(id)a4 forceFullSlide:(BOOL)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = _s5Books40AudiobookPaletteStyleAnimationControllerC07paletteD12OpenAnimator11interaction6traits14forceFullSlideSo08_UISheeteF0CAA0C23PresentationInteractionCSg_So17UITraitCollectionCSgSbtFZ_0(a3, a4, a5);

  return v10;
}

- (_TtC5Books40AudiobookPaletteStyleAnimationController)init
{
  _TtC5Books40AudiobookPaletteStyleAnimationController *result;

  result = (_TtC5Books40AudiobookPaletteStyleAnimationController *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookPaletteStyleAnimationController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Books40AudiobookPaletteStyleAnimationController_completionBlocks]);
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  unsigned __int8 v5;
  _TtC5Books40AudiobookPaletteStyleAnimationController *v6;
  id v7;
  objc_super v9;

  v5 = self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Books40AudiobookPaletteStyleAnimationController_isPrepared];
  swift_unknownObjectRetain(a3);
  v6 = self;
  if ((v5 & 1) == 0)
    sub_100235748(a3);
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for AudiobookPaletteStyleAnimationController();
  v7 = -[AudiobookPaletteStyleAnimationController interruptibleAnimatorForTransition:](&v9, "interruptibleAnimatorForTransition:", a3);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (void)animationEnded:(BOOL)a3
{
  _TtC5Books40AudiobookPaletteStyleAnimationController *v4;

  v4 = self;
  AudiobookPaletteStyleAnimationController.animationEnded(_:)(a3);

}

@end
