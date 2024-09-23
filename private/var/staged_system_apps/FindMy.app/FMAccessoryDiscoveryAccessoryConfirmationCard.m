@implementation FMAccessoryDiscoveryAccessoryConfirmationCard

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryAccessoryConfirmationCard(0);
  v2 = v3.receiver;
  -[FMAccessoryDiscoveryAccessoryConfirmationCard viewDidLoad](&v3, "viewDidLoad");
  sub_1003D4154();
  sub_1003D4654();

}

- (_TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard *result;

  v3 = a3;
  result = (_TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryAccessoryConfirmationCard", 52, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard_imageFetchCancellable]);
  sub_10004FCB8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard_viewModel], type metadata accessor for FMAccessoryDiscoveryAccessoryConfirmationCard.ViewModel);

  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard_coordinator]);
}

@end
