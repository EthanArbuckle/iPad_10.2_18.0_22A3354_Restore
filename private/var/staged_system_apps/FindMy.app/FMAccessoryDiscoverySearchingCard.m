@implementation FMAccessoryDiscoverySearchingCard

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryDiscoverySearchingCard();
  v2 = v3.receiver;
  -[FMAccessoryDiscoveryVideoCard viewDidLoad](&v3, "viewDidLoad");
  sub_1002385E0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy33FMAccessoryDiscoverySearchingCard *v6;

  v5 = a3;
  v6 = self;
  sub_10023881C((uint64_t)a3);

}

- (_TtC6FindMy33FMAccessoryDiscoverySearchingCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy33FMAccessoryDiscoverySearchingCard *result;

  v3 = a3;
  result = (_TtC6FindMy33FMAccessoryDiscoverySearchingCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoverySearchingCard", 40, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCard_coordinator);
}

@end
