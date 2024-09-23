@implementation FMAccessoryPairingInProgressCard

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryPairingInProgressCard();
  v2 = v3.receiver;
  -[FMAccessoryPairingInProgressCard viewDidLoad](&v3, "viewDidLoad");
  sub_1003C63A8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy32FMAccessoryPairingInProgressCard *v4;

  v4 = self;
  sub_1003C5D1C(a3);

}

- (_TtC6FindMy32FMAccessoryPairingInProgressCard)initWithContentView:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy32FMAccessoryPairingInProgressCard *v8;
  _TtC6FindMy32FMAccessoryPairingInProgressCard *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_imageView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = a3;
  v8 = self;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[v5] = objc_msgSend(v6, "init");
  *(_QWORD *)&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_imageFetchCancellable] = 0;
  swift_unknownObjectWeakInit(&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_coordinator]);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryPairingInProgressCard();
  v9 = -[FMAccessoryPairingInProgressCard initWithContentView:](&v11, "initWithContentView:", v7);

  return v9;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_imageFetchCancellable]);
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_coordinator]);
}

@end
