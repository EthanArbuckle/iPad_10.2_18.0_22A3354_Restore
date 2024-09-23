@implementation FMCardDismissedCompactTransition

- (void)animateTransition:(id)a3
{
  _TtC6FindMy32FMCardDismissedCompactTransition *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100441A88(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC6FindMy32FMCardDismissedCompactTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardDismissedCompactTransition();
  return -[FMCardTransition init](&v3, "init");
}

@end
