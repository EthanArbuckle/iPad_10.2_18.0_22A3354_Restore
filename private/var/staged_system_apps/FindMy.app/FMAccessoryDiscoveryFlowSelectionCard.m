@implementation FMAccessoryDiscoveryFlowSelectionCard

- (void)viewDidLoad
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryFlowSelectionCard();
  v2 = (char *)v5.receiver;
  -[FMAccessoryDiscoveryFlowSelectionCard viewDidLoad](&v5, "viewDidLoad");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard_imageView];
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v5.receiver, v5.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard_imageViewContainer], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_msgSend(v2, "contentView");
  objc_msgSend(v4, "addSubview:", v3);

  sub_10020251C();
  sub_100202A94();

}

- (_TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard *result;

  v3 = a3;
  result = (_TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryFlowSelectionCard", 44, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard_coordinator]);
}

@end
