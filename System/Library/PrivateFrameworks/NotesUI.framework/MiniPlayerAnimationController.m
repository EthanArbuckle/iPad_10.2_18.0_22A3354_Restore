@implementation MiniPlayerAnimationController

- (id)interruptibleAnimatorForTransition:(id)a3
{
  _TtC7NotesUI29MiniPlayerAnimationController *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AC9E493C(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (_TtC7NotesUI29MiniPlayerAnimationController)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7NotesUI29MiniPlayerAnimationController_didPrepareAnimations) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MiniPlayerAnimationController();
  return -[_UISheetAnimationController init](&v3, sel_init);
}

@end
