@implementation FMAccessoryPairingConfirmationCard

- (void)dealloc
{
  _TtC6FindMy34FMAccessoryPairingConfirmationCard *v2;

  v2 = self;
  sub_10018C59C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy34FMAccessoryPairingConfirmationCard_coordinator]);

  sub_10004FCB8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy34FMAccessoryPairingConfirmationCard_viewModel], type metadata accessor for FMAccessoryPairingConfirmationCard.ViewModel);
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy34FMAccessoryPairingConfirmationCard_mapUpdateCancellable]);
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy34FMAccessoryPairingConfirmationCard_subscription]);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryPairingConfirmationCard(0);
  v2 = v3.receiver;
  -[FMAccessoryPairingConfirmationCard viewDidLoad](&v3, "viewDidLoad");
  sub_10018C83C();

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FMAccessoryPairingConfirmationCard(0);
  -[FMAccessoryPairingConfirmationCard viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (_TtC6FindMy34FMAccessoryPairingConfirmationCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy34FMAccessoryPairingConfirmationCard *result;

  v3 = a3;
  result = (_TtC6FindMy34FMAccessoryPairingConfirmationCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryPairingConfirmationCard", 41, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC6FindMy34FMAccessoryPairingConfirmationCard *v10;
  NSString v11;
  id v12;

  v7 = type metadata accessor for FMDiscoveredAccessoryAnnotation();
  if (swift_dynamicCastClass(a4, v7))
  {
    v8 = qword_1005D1C88;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    if (v8 != -1)
      swift_once(&qword_1005D1C88, sub_10018C410);
    v11 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v9, "dequeueReusableAnnotationViewWithIdentifier:forAnnotation:", v11, a4);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end
