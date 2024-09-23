@implementation CrossFadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.1;
}

- (void)animateTransition:(id)a3
{
  _TtC23ShelfKitCollectionViews17CrossFadeAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_196A40(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC23ShelfKitCollectionViews17CrossFadeAnimator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CrossFadeAnimator();
  return -[CrossFadeAnimator init](&v3, "init");
}

@end
