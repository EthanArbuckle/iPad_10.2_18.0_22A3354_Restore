@implementation FMCardPresentedRegularTransition

- (void)animateTransition:(id)a3
{
  _TtC6FindMy32FMCardPresentedRegularTransition *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100219010(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC6FindMy32FMCardPresentedRegularTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardPresentedRegularTransition();
  return -[FMCardTransition init](&v3, "init");
}

@end
