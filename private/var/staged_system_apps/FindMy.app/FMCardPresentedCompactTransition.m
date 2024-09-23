@implementation FMCardPresentedCompactTransition

- (void)animateTransition:(id)a3
{
  _TtC6FindMy32FMCardPresentedCompactTransition *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1002FDA64(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC6FindMy32FMCardPresentedCompactTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardPresentedCompactTransition();
  return -[FMCardTransition init](&v3, "init");
}

@end
