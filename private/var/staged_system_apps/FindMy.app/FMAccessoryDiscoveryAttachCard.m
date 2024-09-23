@implementation FMAccessoryDiscoveryAttachCard

- (void)viewDidLoad
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryAttachCard();
  v2 = (char *)v5.receiver;
  -[FMAccessoryDiscoveryAttachCard viewDidLoad](&v5, "viewDidLoad");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy30FMAccessoryDiscoveryAttachCard_imageView];
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v5.receiver, v5.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC6FindMy30FMAccessoryDiscoveryAttachCard_imageViewContainer], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_msgSend(v2, "contentView");
  objc_msgSend(v4, "addSubview:", v3);

  sub_1003FE05C();
  sub_1003FE518();

}

- (_TtC6FindMy30FMAccessoryDiscoveryAttachCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy30FMAccessoryDiscoveryAttachCard *result;

  v3 = a3;
  result = (_TtC6FindMy30FMAccessoryDiscoveryAttachCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryAttachCard", 37, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy30FMAccessoryDiscoveryAttachCard_coordinator]);
}

@end
