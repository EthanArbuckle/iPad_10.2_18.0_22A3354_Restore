@implementation FMNoPersonView

- (void)handleAction
{
  _TtC6FindMy14FMNoPersonView *v2;

  v2 = self;
  sub_10039C7B0();

}

- (_TtC6FindMy14FMNoPersonView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMNoPersonView();
  return -[FMEmptyListView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
