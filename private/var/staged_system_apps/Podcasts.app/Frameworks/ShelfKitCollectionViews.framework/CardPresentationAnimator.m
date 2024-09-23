@implementation CardPresentationAnimator

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  _TtC23ShelfKitCollectionViews24CardPresentationAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_E7614(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC23ShelfKitCollectionViews24CardPresentationAnimator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CardPresentationAnimator();
  return -[CardPresentationAnimator init](&v3, "init");
}

@end
