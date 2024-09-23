@implementation FMCardDismissedRegularTransition

- (void)animateTransition:(id)a3
{
  _TtC6FindMy32FMCardDismissedRegularTransition *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10036B864(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC6FindMy32FMCardDismissedRegularTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardDismissedRegularTransition();
  return -[FMCardTransition init](&v3, "init");
}

@end
