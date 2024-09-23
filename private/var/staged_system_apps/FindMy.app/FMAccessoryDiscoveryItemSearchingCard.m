@implementation FMAccessoryDiscoveryItemSearchingCard

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryItemSearchingCard();
  v2 = v3.receiver;
  -[FMAccessoryDiscoveryVideoCard viewDidLoad](&v3, "viewDidLoad");
  sub_10035235C();
  sub_1003524D0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard *v4;

  v4 = self;
  sub_100351CE4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard *v4;

  v4 = self;
  sub_100352190(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryItemSearchingCard();
  v4 = a3;
  v5 = v6.receiver;
  -[FMAccessoryDiscoveryItemSearchingCard traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1003524D0();

}

- (_TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard *result;

  v3 = a3;
  result = (_TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryItemSearchingCard", 44, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard_coordinator);
  swift_release(*(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard_viewModel]);

  swift_release(*(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard_deviceSubscription]);
}

@end
