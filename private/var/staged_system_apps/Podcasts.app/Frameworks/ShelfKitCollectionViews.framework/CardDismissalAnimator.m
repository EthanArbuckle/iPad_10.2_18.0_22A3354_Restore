@implementation CardDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.15;
}

- (void)animateTransition:(id)a3
{
  _TtC23ShelfKitCollectionViews21CardDismissalAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_17B51C(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC23ShelfKitCollectionViews21CardDismissalAnimator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CardDismissalAnimator();
  return -[CardDismissalAnimator init](&v3, "init");
}

@end
